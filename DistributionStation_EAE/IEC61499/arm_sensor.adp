<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE AdapterType SYSTEM "../LibraryElement.dtd">
<AdapterType GUID="5f8b92a4-e339-4234-8cda-d41a2f40a133" Name="arm_sensor" Comment="Adapter Interface" Namespace="Main">
  <Identification Standard="61499-1" />
  <VersionInfo Organization="Schneider Electric" Version="0.0" Author="lizar" Date="10/22/2026" />
  <InterfaceList>
    <EventOutputs>
      <Event Name="REQ" Comment="Confirmation from Plug">
        <With Var="at_mgz" />
        <With Var="at_next" />
        <With Var="v_mon" />
      </Event>
    </EventOutputs>
    <OutputVars>
      <VarDeclaration Name="at_mgz" Type="BOOL" Comment="Indication Data from Plug" />
      <VarDeclaration Name="at_next" Type="BOOL" Comment="Indication Data from Plug" />
      <VarDeclaration Name="v_mon" Type="BOOL" Comment="Indication Data from Plug" />
    </OutputVars>
  </InterfaceList>
  <Service RightInterface="PLUG" LeftInterface="SOCKET">
    <ServiceSequence Name="request_confirm">
      <ServiceTransaction>
        <InputPrimitive Interface="SOCKET" Event="REQ" Parameters="REQD" />
        <OutputPrimitive Interface="PLUG" Event="REQ" Parameters="REQD" />
      </ServiceTransaction>
      <ServiceTransaction>
        <InputPrimitive Interface="PLUG" Event="REQ" Parameters="CNFD" />
        <OutputPrimitive Interface="SOCKET" Event="REQ" Parameters="CNFD" />
      </ServiceTransaction>
    </ServiceSequence>
    <ServiceSequence Name="indication_response">
      <ServiceTransaction>
        <InputPrimitive Interface="PLUG" Event="IND" Parameters="at_mgz" />
        <OutputPrimitive Interface="SOCKET" Event="IND" Parameters="at_mgz" />
      </ServiceTransaction>
      <ServiceTransaction>
        <InputPrimitive Interface="SOCKET" Event="RSP" Parameters="RSPD" />
        <OutputPrimitive Interface="PLUG" Event="RSP" Parameters="RSPD" />
      </ServiceTransaction>
    </ServiceSequence>
  </Service>
</AdapterType>