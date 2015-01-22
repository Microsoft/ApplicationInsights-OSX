#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

#define MOCKITO_SHORTHAND
#import <OCMockitoIOS/OCMockitoIOS.h>

#import "AppInsights.h"
#import "AppInsightsPrivate.h"
#import "MSAIAppClient.h"
#import "MSAIMetricsManager.h"
#import "MSAIMetricsManagerPrivate.h"
#import "MSAIBaseManager.h"
#import "MSAIBaseManagerPrivate.h"
#import "MSAIContextPrivate.h"
#import "MSAIContext.h"

@interface MSAIMetricsManagerTests : XCTestCase

@end


@implementation MSAIMetricsManagerTests {
  MSAIMetricsManager *_sut;
}

- (void)setUp {
  [super setUp];
  
  MSAIAppClient *appClient = mockClass([MSAIAppClient class]);
  MSAIContext *appContext = [[MSAIContext alloc]initWithInstrumentationKey:@"245251431" isAppStoreEnvironment:NO];
  _sut = [[MSAIMetricsManager alloc] initWithAppContext:appContext appClient:appClient];
}

#pragma mark - Setup Tests

- (void)testThatItInstantiates {
  assertThat(_sut, notNilValue());
  assertThat([_sut appContext], notNilValue());
  assertThat([_sut appClient], notNilValue());
  assertThat([_sut telemetryChannel], notNilValue());
}

#pragma mark - Helper

- (void)testTelemetryChannel {
  MSAITelemetryContext *testContext = [_sut telemetryContext];
  
  assertThat([testContext instrumentationKey], notNilValue());
  assertThat([testContext endpointPath], equalTo(MSAI_TELEMETRY_PATH));
  assertThat([testContext application], notNilValue());
  assertThat([testContext device], notNilValue());
  assertThat([testContext location], notNilValue());
  assertThat([testContext session], notNilValue());
  assertThat([testContext user], notNilValue());
  assertThat([testContext internal], notNilValue());
  assertThat([testContext operation], notNilValue());
}

@end
