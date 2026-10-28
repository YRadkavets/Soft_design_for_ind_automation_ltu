<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE AdapterType SYSTEM "../LibraryElement.dtd">
<AdapterType GUID="707015c5-24f1-4e74-b09b-7e77466fd11c" Name="buttons" Comment="Adapter Interface" Namespace="Main">
  <Identification Standard="61499-1" />
  <VersionInfo Organization="Schneider Electric" Version="0.0" Author="lizar" Date="10/27/2026" />
  <InterfaceList>
    <EventInputs>
      <Event Name="REQ" Comment="Request from Socket">
        <With Var="start" />
        <With Var="reset" />
        <With Var="ack" />
        <With Var="stop" />
      </Event>
    </EventInputs>
    <EventOutputs>
      <Event Name="CNF" Comment="Confirmation from Plug">
        <With Var="start_led" />
        <With Var="reset_led" />
        <With Var="ack_led" />
      </Event>
    </EventOutputs>
    <InputVars>
      <VarDeclaration Name="start" Type="BOOL" Comment="Request Data from Socket" />
      <VarDeclaration Name="reset" Type="BOOL" Comment="Response Data from Socket" />
      <VarDeclaration Name="ack" Type="BOOL" Comment="Response Data from Socket" />
      <VarDeclaration Name="stop" Type="BOOL" Comment="Response Data from Socket" />
    </InputVars>
    <OutputVars>
      <VarDeclaration Name="start_led" Type="BOOL" Comment="Confirmation Data from Plug" />
      <VarDeclaration Name="reset_led" Type="BOOL" Comment="Indication Data from Plug" />
      <VarDeclaration Name="ack_led" Type="BOOL" Comment="Indication Data from Plug" />
    </OutputVars>
  </InterfaceList>
  <Service RightInterface="PLUG" LeftInterface="SOCKET">
    <ServiceSequence Name="request_confirm">
      <ServiceTransaction>
        <InputPrimitive Interface="SOCKET" Event="REQ" Parameters="start" />
        <OutputPrimitive Interface="PLUG" Event="REQ" Parameters="start" />
      </ServiceTransaction>
      <ServiceTransaction>
        <InputPrimitive Interface="PLUG" Event="CNF" Parameters="start_led" />
        <OutputPrimitive Interface="SOCKET" Event="CNF" Parameters="start_led" />
      </ServiceTransaction>
    </ServiceSequence>
    <ServiceSequence Name="indication_response">
      <ServiceTransaction>
        <InputPrimitive Interface="PLUG" Event="IND" Parameters="reset_led" />
        <OutputPrimitive Interface="SOCKET" Event="IND" Parameters="reset_led" />
      </ServiceTransaction>
      <ServiceTransaction>
        <InputPrimitive Interface="SOCKET" Event="RSP" Parameters="reset" />
        <OutputPrimitive Interface="PLUG" Event="RSP" Parameters="reset" />
      </ServiceTransaction>
    </ServiceSequence>
  </Service>
</AdapterType>