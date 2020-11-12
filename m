Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E349C55ABD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 11:03:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 960C522201
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 11:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kPl6akRr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="VaZ53K55";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="yBFQeByb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 960C522201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HZeSMQvY/OCCE/Bf+PAEB1xRyE/nYiUMhZW2Af9RyMI=; b=kPl6akRrZSOh9S4NuZBqqB0kU
	+KRIPFkMPEFM/CeX0VzjrFe2/5WJCvvek5Wo/xiYGn12ei4ulU7GeMO43kFQQSajVrPzc5bPuLPpQ
	Uvjrduu0toJLIpsYiMP6jC8ILmBCq8Tp3ukrfm8jK7bsyr1rurQ5vNhfaDzw7qfbO8LJPwEvMjgnp
	OL86p+1ITYKB0327fUkk1qmEpDLr0mDHzI/mMwJG7C+hXdazj1zioAemTR/QyDPE/xrt2YopSuVNp
	MopYLbEURgpiIgTGxdqqX/zDGHcdkutkjjvIW0evc2Z4HypNxJ8MEsTC9uFIqNCaCXNzz788se8Mq
	NXQEmFy8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdANl-0001MC-44; Thu, 12 Nov 2020 11:03:13 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdANi-0001Lg-6X
 for linux-riscv@lists.infradead.org; Thu, 12 Nov 2020 11:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605178990; x=1636714990;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lKip8ZhB2PFNoffoRUZV6GteKQ88f6abhNi4WgEdUpE=;
 b=VaZ53K55jaZt67fVkgZUpc8O54xhXm3UZPUKoQB+aszlcliNvdlB85NK
 uSycvajfdoESjwv0vxeVDJphptr9bHaMzcgmEqWy9EMDiJo+nblV97nBs
 strsdI6SDYN9IKSD0NggEDPYfeOuJJi6eoVKURV08EJhTiZkeuf6NUr4J
 tRiPdLpPOwoX5Si//fUZ605JPk8JWSXPHeyj4+yyNDxjsd5/Qf1NphLjs
 MTEwiAC15TZgERnVk62iEzfgcxO4WWGyb6XHm7zq9C4abGcOCH3a4D1Wj
 iB8+kl9SOwIOSu4LVaBe+w3ldtbnn+gi2j3QaAKO3ZRerz1eZpO6oZDTu g==;
IronPort-SDR: iFibUgONIwQYQAFBeJd3ubhv1Ny/1ak6wEN1MB0kHfIx0Hl+UWL3iuRMGq0il8n4vroWJlP5DY
 nXnWXRANAbsCpsxlTFq1dzVdqfZp2vKPwgwmj0QaQpuMLSkIqGpNS0e2nEFw1W8k162Td2YcGH
 buo3L7DH+jSq0xMZtF0zoociNmTWC1Hg+eK5APBXAsS6U+rAwr869R4S8LJjrSzBotpD8hNyMI
 /JKE8RVL6lRlqPU3ze3b2PepZxBtosPOnhmmcpEe32x8g40nkL69LLIWzZ0nwZVRU6FYvajqd7
 N60=
X-IronPort-AV: E=Sophos;i="5.77,471,1596470400"; d="scan'208";a="153671501"
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hgst.iphmx.com with ESMTP; 12 Nov 2020 19:03:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6pmZ5S3aCe7iZtYloJoBv4t2HvvFWOOj/aUHEHM/JWmg1PKDA0Y3/AI0eMsHMtJ2/Ql/Qyzixo5ZLUxoYAZcX0BJ3D9mMisSbaBwUeCjESubERr99f4aPpHDB7gf2vRqKjWlqDwLtlENMw5ZZRZKSXsZobDIJLlc9XHISffkWtURtcjVhWA+5l1vzVLKNV7JrWo72Ghtu17WFlJoTlz+jlCTzVEICtTgLZsHMrmujrSzV9qUEpd1a79nUxqQGKi+tSQZeVOJwrLCC7roig7XH4memuBk6o5KA/v08yjqSCNeDodbLTPVpgToGkfXskcol7R6sO6x0BI4KOg02i/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKip8ZhB2PFNoffoRUZV6GteKQ88f6abhNi4WgEdUpE=;
 b=dKdE7YWFZczkgRpQagLl+iSRNmn6AvXEOL0BtvCZFATlmGFo0wcek9f0xciebibN507jYBndOMekZ4bTykRyxYApDbI87JVwXx4CooGcIVxx+YAwt44IZyNBdv3/yefJLdvOQjLHB+rcy2C6NYjMW5x7eWxAgpyX5RWwS2Mw08++Zlw65N4ZA2cW74DCrQbzrzrC4IjLtEE06oMBfUAihgXmwhGnVBDEHAaYowbr++c+Ml716vMCmdUeCA/x8csbj+s5SdEQC5/cHG++VjRkh4aocCN34xG4WcJpKxxNDfDxNeMM81b1eNlPEvr4/a+xNdwSNIgvCpnh9dXYV4KluA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKip8ZhB2PFNoffoRUZV6GteKQ88f6abhNi4WgEdUpE=;
 b=yBFQeByb+WdGglicGJaILOEjgWh0E1gW4VEmG362F7gvn39+N9oAg9L1v2H4wgXdNU1JeoIyKOnOxtlCUe7sraL9pwmtjoEbk6VzVNW8oSUZ3PizZJOhpttPs9zB8bb4AfwdDB0wZxCtQTb4n2KMjynxX+WFmUYQw4saMRNNyJY=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4610.namprd04.prod.outlook.com (2603:10b6:208:26::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Thu, 12 Nov
 2020 11:03:06 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Thu, 12 Nov 2020
 11:03:06 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "robh@kernel.org" <robh@kernel.org>, "seanga2@gmail.com"
 <seanga2@gmail.com>
Subject: Re: [PATCH 24/32] dt-bindings: Document kendryte,k210-fpioa bindings
Thread-Topic: [PATCH 24/32] dt-bindings: Document kendryte, k210-fpioa bindings
Thread-Index: AQHWtN4pogxbCuVPg0qTFpKg863FNqnEXQ0A
Date: Thu, 12 Nov 2020 11:03:05 +0000
Message-ID: <85cdb58904dd76a515e12178e9249be51c959201.camel@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-25-damien.lemoal@wdc.com>
 <20201109153625.GB1330401@bogus>
 <04b266c7-bba9-d847-a526-f64f76c11a50@gmail.com>
 <CAL_JsqJy_6ALEKdk7ZOEaM58Xi6NLBYd_aYNeVr2CpyjSBVpmA@mail.gmail.com>
 <BL0PR04MB651485C2B2EC9DDEA4E823B8E7E80@BL0PR04MB6514.namprd04.prod.outlook.com>
In-Reply-To: <BL0PR04MB651485C2B2EC9DDEA4E823B8E7E80@BL0PR04MB6514.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5a5495b8-5658-4915-afc1-08d886fa8859
x-ms-traffictypediagnostic: BL0PR04MB4610:
x-microsoft-antispam-prvs: <BL0PR04MB461066845713CFC5FF10283EE7E70@BL0PR04MB4610.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 49wKfhmpg+5bSsILBNgm9mG/7yNYE3t8Wl2pqVEEBBTyt1pogRPJU5rmt0bcpAXJhQr1FHvo5CogLlUX4I1SrlIWql2DmaAFIvqLezmwdI4jAL09bAOC7ZcHU3HUOoLetuDIKw0e3Oy35M6y29QtAq9phic9cJwGzf7EmH6+vkA6AaQrqDDnyQWwAYYrAOI1MNI1aODm6muPuMi5ccUBPMAsF1vV0Nc/XVPiEa73lxpMQQY4xd0105NOWuZWw5pWCDPLyAAPjlvkWzBnhvWhUqvuHO3//0iHpaJThKaF95ig1UufCxNPK6RlgjnTnO919/WU3wHhv+4j1yY0xnzMqgLfgFvH2do4YNLNU3YxlLdUXI/FjyldIoYoyEHraqpPjaavuUJoQ9LT+teQrT6Ofg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(316002)(64756008)(66556008)(66946007)(71200400001)(36756003)(6512007)(110136005)(54906003)(8676002)(4326008)(5660300002)(66446008)(2906002)(76116006)(8936002)(4001150100001)(6506007)(83380400001)(53546011)(86362001)(66476007)(186003)(966005)(2616005)(91956017)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 0Mc+HPR+5gGI5oTwz/NU+ONnI169C16lzAogIcpDE0uGPhtD6rWyuln5RV7Da4zP/S/4YH1RACrCxMjlUwyU643hdKpvqtGj5O8BK+r0lzTlfHFeqdQZI1YQmy0GN4PbuVw/7ZdlFEvyySesogQvxfr5I6493XPkjDbNr3ndPu4WEq30fmbKVvlWkrBDITndfm3jBdAP8w1VoWNfE/HMQy6Vm1Rj71N/UCfJ/N6LnGnSydrl2CfEiuSZTfCGj88sNqe/jDhN9tPT38EtukF5wU1WBOvbP67CQM2WY/5BoE80fjfmXlaFr6i5fTR0fiRRd3wG+lFwFoCCnT5e6Y0Js7HZS66ljnHEg+iPXcw8LiVFBhUwcCZS8hHSqUarjAj+EglVNkfgXoPN8MRsekE8CDp9qjeaEuBbnXWN2HxgbHEJ5k5INmYNkm6XPRvgVxbyLTZ9uUPwxrLWoVYoPjEiNOpVFJPC/6jIzgp4ViJ7eS6oYwvfvdRHOjNNhl84AxWYbVOiq+vc8lmGXvgUtdFjGp/AnxtF658uHjUHnslLfb6XXsM+Uxo0pSWFcAWa3rl1RqGgaxdlYtqtDqs1ImBfF0Gxtqbk7+TVqu9hrO80HBdoafPXCglSj6ti1wKWuo0EOyPGQ6tqsH1J74fHfP4Tjx7kkmCAmHn3RX06paScZor4hWwOcu20jFrwcBNvb9o89stTbRTp1rWxCu4yGOZuHQ==
x-ms-exchange-transport-forked: True
Content-ID: <646992A9CDF44D43BF76578E18FA2C17@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5495b8-5658-4915-afc1-08d886fa8859
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 11:03:05.8712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6DvPw0DnwVhjXUrOxfewQWi53qdeX9Rr6YpviP6XGDFEAzxHNZJpIdA7YnhK4RW3a3N0yHAO9j6bfQC2szmi7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4610
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_060310_598922_F4CD48FC 
X-CRM114-Status: GOOD (  29.94  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIwLTExLTExIGF0IDE1OjA2ICswMDAwLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToN
Cj4gT24gMjAyMC8xMS8xMSAyMzozMiwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+ID4gT24gTW9uLCBO
b3YgOSwgMjAyMCBhdCA5OjQ1IEFNIFNlYW4gQW5kZXJzb24gPHNlYW5nYTJAZ21haWwuY29tPiB3
cm90ZToNCj4gPiA+IA0KPiA+ID4gT24gMTEvOS8yMCAxMDozNiBBTSwgUm9iIEhlcnJpbmcgd3Jv
dGU6DQo+ID4gPiA+IE9uIFNhdCwgTm92IDA3LCAyMDIwIGF0IDA1OjE0OjEyUE0gKzA5MDAsIERh
bWllbiBMZSBNb2FsIHdyb3RlOg0KPiA+ID4gPiA+IERvY3VtZW50IHRoZSBkZXZpY2UgdHJlZSBi
aW5kaW5ncyBmb3IgdGhlIEtlbmRyeXRlIEsyMTAgU29DIEZ1bGx5DQo+ID4gPiA+ID4gUHJvZ3Jh
bW1hYmxlIElPIEFycmF5IChGUElPQSkgcGluY3RybCBkcml2ZXIgaW4NCj4gPiA+ID4gPiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9rZW5kcnl0ZSxrMjEwLWZwaW9h
LnlhbWwNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gTGUgTW9h
bCA8ZGFtaWVuLmxlbW9hbEB3ZGMuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+IMKgLi4u
L2JpbmRpbmdzL3BpbmN0cmwva2VuZHJ5dGUsazIxMC1mcGlvYS55YW1sIHwgMTA2ICsrKysrKysr
KysrKysrKysrKw0KPiA+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEwNiBpbnNlcnRpb25zKCsp
DQo+ID4gPiA+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BpbmN0cmwva2VuZHJ5dGUsazIxMC1mcGlvYS55YW1sDQo+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
aW5jdHJsL2tlbmRyeXRlLGsyMTAtZnBpb2EueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waW5jdHJsL2tlbmRyeXRlLGsyMTAtZnBpb2EueWFtbA0KPiA+ID4gPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi44NzMwYWRk
ODhlZTANCj4gPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwva2VuZHJ5dGUsazIxMC1mcGlvYS55YW1s
DQo+ID4gPiA+ID4gQEAgLTAsMCArMSwxMDYgQEANCj4gPiA+ID4gPiArIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4gPiA+ID4gKyVZ
QU1MIDEuMg0KPiA+ID4gPiA+ICstLS0NCj4gPiA+ID4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9waW5jdHJsL2tlbmRyeXRlLGsyMTAtZnBpb2EueWFtbCMNCj4gPiA+ID4g
PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwj
DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICt0aXRsZTogS2VuZHJ5dGUgSzIxMCBGUElPQSAoRnVs
bHkgUHJvZ3JhbW1hYmxlIElPIEFycmF5KSBEZXZpY2UgVHJlZSBCaW5kaW5ncw0KPiA+ID4gPiA+
ICsNCj4gPiA+ID4gPiArbWFpbnRhaW5lcnM6DQo+ID4gPiA+ID4gKyAgLSBEYW1pZW4gTGUgTW9h
bCA8ZGFtaWVuLmxlbW9hbEB3ZGMuY29tPg0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArZGVzY3Jp
cHRpb246DQo+ID4gPiA+ID4gKyAgVGhlIEtlbmRyeXRlIEsyMTAgU29DIEZ1bGx5IFByb2dyYW1t
YWJsZSBJTyBBcnJheSBjb250cm9sbGVyIGFsbG93cyBhc3NpZ2luZw0KPiA+ID4gPiA+ICsgIGFu
eSBvZiAyNTYgcG9zc2libGUgZnVuY3Rpb25zIHRvIGFueSBvZiA0OCBJTyBwaW5zLiBQaW4gZnVu
Y3Rpb24gY29uZmlndXJhdGlvbg0KPiA+ID4gPiA+ICsgIGlzIHBlcmZvcm1lZCBvbiBhIHBlci1w
aW4gYmFzaXMuDQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ID4gPiA+
ICsgIGNvbXBhdGlibGU6DQo+ID4gPiA+ID4gKyAgICBjb25zdDoga2VuZHJ5dGUsazIxMC1mcGlv
YQ0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICByZWc6DQo+ID4gPiA+ID4gKyAgICBkZXNjcmlw
dGlvbjogRlBJT0EgY29udHJvbGxlciByZWdpc3RlciBzcGFjZSBiYXNlIGFkZHJlc3MgYW5kIHNp
emUNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyAgY2xvY2tzOg0KPiA+ID4gPiA+ICsgICAgbWlu
SXRlbXM6IDINCj4gPiA+ID4gPiArICAgIG1heEl0ZW1zOiAyDQo+ID4gPiA+IA0KPiA+ID4gPiBD
YW4gZHJvcCB0aGVzZS4gSW1wbGllZCBieSAnaXRlbXMnIGxlbmd0aC4NCj4gPiA+ID4gDQo+ID4g
PiA+ID4gKyAgICBpdGVtczoNCj4gPiA+ID4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogQ29udHJv
bGxlciByZWZlcmVuY2UgY2xvY2sgc291cmNlDQo+ID4gPiA+ID4gKyAgICAgIC0gZGVzY3JpcHRp
b246IEFQQiBpbnRlcmZhY2UgY2xvY2sgc291cmNlDQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsg
IGNsb2NrLW5hbWVzOg0KPiA+ID4gPiA+ICsgICAgbWluSXRlbXM6IDINCj4gPiA+ID4gPiArICAg
IG1heEl0ZW1zOiAyDQo+ID4gPiA+ID4gKyAgICBpdGVtczoNCj4gPiA+ID4gPiArICAgICAgLSBj
b25zdDogcmVmDQo+ID4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IHBjbGsNCj4gPiA+ID4gPiArDQo+
ID4gPiA+ID4gKyAgcmVzZXRzOg0KPiA+ID4gPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiA+ID4g
PiArDQo+ID4gPiA+ID4gKyAga2VuZHJ5dGUsc3lzY3RsOg0KPiA+ID4gPiA+ICsgICAgbWluSXRl
bXM6IDENCj4gPiA+ID4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gPiA+ID4gKyAgICAkcmVmOiAv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5DQo+ID4gPiA+ID4g
KyAgICBkZXNjcmlwdGlvbjogfA0KPiA+ID4gPiA+ICsgICAgICBwaGFuZGxlIHRvIHRoZSBzeXN0
ZW0gY29udHJvbGxlciBub2RlDQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsgIGtlbmRyeXRlLHBv
d2VyLW9mZnNldDoNCj4gPiA+ID4gPiArICAgIG1pbkl0ZW1zOiAxDQo+ID4gPiA+ID4gKyAgICBt
YXhJdGVtczogMQ0KPiA+ID4gPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvdWludDMyDQo+ID4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogfA0KPiA+ID4gPiA+
ICsgICAgICBPZmZzZXQgb2YgdGhlIHBvd2VyIGRvbWFpbiBjb250cm9sIHJlZ2lzdGVyIG9mIHRo
ZSBzeXN0ZW0gY29udHJvbGxlci4NCj4gPiA+ID4gDQo+ID4gPiA+IFNvdW5kcyBsaWtlIHlvdSBz
aG91bGQgYmUgdXNpbmcgcG93ZXItZG9tYWlucyBiaW5kaW5nLg0KPiA+ID4gDQo+ID4gPiBUaGlz
IGlzIGZvciBwaW4gcG93ZXIgZG9tYWlucy4gRS5nLiBwaW5zIDAtNSBjYW4gYmUgc2V0IHRvIDFW
OCBvciAzVjMgbG9naWMgbGV2ZWxzLg0KPiA+IA0KPiA+IE9rYXksIHBsZWFzZSBtYWtlIHRoYXQg
Y2xlYXIgaW4gdGhlIGRlc2NyaXB0aW9uLiBZb3UgY2FuIGNvbWJpbmUgdGhlDQo+ID4gYWJvdmUg
MiBwcm9wZXJ0aWVzIGludG8gb25lIHdoaWNoIGlzIGEgcGhhbmRsZStvZmZzZXQuDQo+IA0KPiBD
b3VsZCB5b3UgcG9pbnQgbWUgdG8gYW4gZXhhbXBsZSBvZiBzdWNoIHByb3BlcnR5ID8gSSBhbSBu
b3Qgc3VyZSBob3cgdG8gZG8gdGhhdA0KPiBzbyBhbiBleGFtcGxlIHdvdWxkIGhlbHAuIFRoYW5r
cy4NCg0KUGxlYXNlIGlnbm9yZS4gRm91bmQgd2hhdCBJIG5lZWQuIFRoYW5rcy4NCg0KPiANCj4g
PiANCj4gPiBSb2INCj4gPiANCj4gDQo+IA0KDQotLSANCkRhbWllbiBMZSBNb2FsDQpXZXN0ZXJu
IERpZ2l0YWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
