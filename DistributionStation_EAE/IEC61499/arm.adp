<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE AdapterType SYSTEM "../LibraryElement.dtd">
<AdapterType GUID="c7f18dea-b7d8-42a6-82a6-f9f155693b81" Name="arm" Comment="Adapter Interface" Namespace="Main">
  <Identification Standard="61499-1" />
  <VersionInfo Organization="Schneider Electric" Version="0.0" Author="lizar" Date="10/22/2026" />
  <InterfaceList>
    <EventOutputs>
      <Event Name="CNF" Comment="Confirmation from Plug">
        <With Var="to_mgz" />
        <With Var="to_next" />
        <With Var="vcm_on" />
        <With Var="vcm_off" />
      </Event>
    </EventOutputs>
    <OutputVars>
      <VarDeclaration Name="to_mgz" Type="BOOL" Comment="Indication Data from Plug" />
      <VarDeclaration Name="to_next" Type="BOOL" Comment="Indication Data from Plug" />
      <VarDeclaration Name="vcm_on" Type="BOOL" Comment="Indication Data from Plug" />
      <VarDeclaration Name="vcm_off" Type="BOOL" Comment="Indication Data from Plug" />
    </OutputVars>
  </InterfaceList>
  <Service RightInterface="PLUG" LeftInterface="SOCKET">
    <ServiceSequence Name="request_confirm">
      <ServiceTransaction>
        <InputPrimitive Interface="SOCKET" Event="REQ" Parameters="REQD" />
        <OutputPrimitive Interface="PLUG" Event="REQ" Parameters="REQD" />
      </ServiceTransaction>
      <ServiceTransaction>
        <InputPrimitive Interface="PLUG" Event="CNF" Parameters="CNFD" />
        <OutputPrimitive Interface="SOCKET" Event="CNF" Parameters="CNFD" />
      </ServiceTransaction>
    </ServiceSequence>
    <ServiceSequence Name="indication_response">
      <ServiceTransaction>
        <InputPrimitive Interface="PLUG" Event="IND" Parameters="to_mgz" />
        <OutputPrimitive Interface="SOCKET" Event="IND" Parameters="to_mgz" />
      </ServiceTransaction>
      <ServiceTransaction>
        <InputPrimitive Interface="SOCKET" Event="RSP" Parameters="RSPD" />
        <OutputPrimitive Interface="PLUG" Event="RSP" Parameters="RSPD" />
      </ServiceTransaction>
    </ServiceSequence>
  </Service>
</AdapterType>