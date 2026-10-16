Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D68CCCA462
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 02:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jg90yvbMk+R4mLKy5MAs256ztjzit2GxUXELMo1+ASQ=; b=Pb9Ewo8rn/9UTx
	DASHgJQwpucwtZX/qNDiilzAkj7UX43cY2rpaPih/u/ij6biBL7/Qh+5woXZj1a2WmE7M+48RSIyQ
	VfjTA9nmEACgFECwpy0XHgHUsne5l+iq6CcD1BUVSxTHbRtuu1ObXGjeQwV8O4BeE7uuzFk7v1pWA
	UwMG+bjvpQNmK02FW0WYKLma/FcA8vGNLUNxScL6Z9cpXaYtVvj4LGl+f0Liwxb2aaKtAochCNFWe
	h06phDn7mqajlNrMqnUNdQe1QdwpO3djEm245ESSI+Kr1bP5Tye28GEaX+SSQzgJrs/OhUNsLzR52
	zpRzp16MkwHv6EzFk9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHXRS-00000001jdZ-0xMp;
	Fri, 16 Oct 2026 02:13:06 +0000
Received: from mail-bjschn02on2123.outbound.protection.partner.outlook.cn ([139.219.17.123] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHXRO-00000001jd3-1DAq
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 02:13:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZ2JbgzVi5Bvfb8j+3qpn07Mcq5hPWzubkp0tQ75mcrA4EQ7/qmFomE1rgYRbnDn06VkX2VAdkYAkfTWqCqv5y0W5JgiP/KoqpKRenaAuTs4mrnKPzkxRD9AgTdlpHsaPvofkHtL8aMGFzq5tmIeeEa/B3pr2nVolr/fvhh1TRpNYF8luG/sX34HCvq9kzccttk/gy/Ok0ZCRBNV6rK0kiFH985D2mjh6IZhYXPlB9fdv4Qtc3Wp94N9aAHt1z15mFsWSxIZM16IlcjMAa4XbBA4mrcN8wi9Rwittuwic9Sbfbu/M2SkfEccq3OfupDEjbHULPZ+NmAUKfw0bLptpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBd52uEZTWCHSQ1XVfwMO4pceCGWg4XNVkRWrw9om3c=;
 b=QbOhhgvk97no+3Ek/Pgky/HW+r+5QvwMDPyJA7xWTOUeeY1rNK7uz25IuElmw4iihsIcDVQ0qNAhzbMXBdWs509TaPP+iY+1mG279/I4QWuCfF22wqIiJEQt4hJyxjVlkfTCYaBIvIrWVnFdJc4/G05e9d4p08c38T4j6UPfflmSWYbItQAJufLXEjP63s7dU+rIl+s4ClXooowq/LV+RuZ9SweVvCS6iS4am3x2AljLnMUHUYJf5RpsbSWRAn338a37wAhepIbumw28tNr9P0Dvn5U12XP1gh0PWqgUTCkI0txrfYkdKBWsoK37ZNI6pJqZwUPg1HZfUSU6r2FFFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) by NT0PR01MB1181.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 02:12:38 +0000
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 ([fe80::be4a:d29e:5188:b37e]) by
 NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn ([fe80::be4a:d29e:5188:b37e%3])
 with mapi id 15.21.0522.013; Fri, 16 Oct 2026 02:12:38 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	=?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <ukleinek@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Albert Ou
	<aou@eecs.berkeley.edu>, "linux-pwm@vger.kernel.org"
	<linux-pwm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v23 1/2] dt-bindings: pwm: opencores: Update compatibles,
 examples and maintainers
Thread-Topic: [PATCH v23 1/2] dt-bindings: pwm: opencores: Update compatibles,
 examples and maintainers
Thread-Index: AQHdW8vNVfimp5x4oEmmC/YoMkBZxrb+T/CAgAAWMACAAAHIAIABBv1Q
Date: Fri, 16 Oct 2026 02:12:37 +0000
Message-ID: <NT0PR01MB1102CD957950A0BBCCFF2247E69B2@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
References: <20261014110429.52762-1-hal.feng@starfivetech.com>
 <20261014110429.52762-2-hal.feng@starfivetech.com>
 <9c0737d8-455d-4025-8482-950b64029f35@kernel.org>
 <atCos9UIaZoRs4N8@monoceros> <20261015-poised-modest-leech-4decf5@quoll>
In-Reply-To: <20261015-poised-modest-leech-4decf5@quoll>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1102:EE_|NT0PR01MB1181:EE_
x-ms-office365-filtering-correlation-id: cd0f0569-f1c1-4206-52c6-08df2b2af352
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|10067099003|22082099003|18002099003|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info: KFXr5KCO0mu8j65WLAtmQgIRM5GckY+RhqOwpmVrZyRg1q8RDlPdnDFDMHlFufnSEshVVSiB3uajdvtO7qDHZNc3UWBO1HthSOPBdRSEB4FzmMg1sOwu0qF8h1IDGaUzUuMoQw4DUCD8If2NW6kLOysHyhCtuIGjwigLHnHVOkZwOgDGvEFL9a1SAtlpJumhITegKNfZabIluyyMPTqo4m0cCROOGQ9b3RWTwI8zfw+P7EIhwQd7njwVIm1cXtBPChHnkL5On6x2F6mK/SOwaOPHe09EkAGHJ+edZSN5gqeHJuziO0peZh+pKTEP5CyOFZkuMJwWUjQIe+K6gfLPYqWYYlmhczkf5J8luFIE1Now9qni7kFvNonh7Lr5ZkhVv10Fhqbhf3dKvnA6RuwSIOjvGX01n0gW0do4eb2Q7wd0MHy2KIdv+KwBDh6u6HLFK74QDkTcZGhxufjcCeOfS1a+cjKGZBdnY1rjEPiQruxdP1wRIfOo0PXg6RFnXOIFso0cabpcU/RpSMry5lFlhGmJ+W9HSnO0P3gJoGgGVCD95QP6Le10U8e1dmJjE7hl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(22082099003)(18002099003)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVNwNldqbFNDeXJleENGV2FwbjJ3MCt1Z2RCK3NQS3VQQitaNHMxaERyMHJw?=
 =?utf-8?B?Wno3V3FQeHpPL1ozNmdYaXBYdU5BTGFSOFpkcDRhK0ZsbXdrdnFZbUhWaUtH?=
 =?utf-8?B?cFczenVzb1VwdDZpR1NsQkVpdUJoQTF3UlNUODV6Wno0UVBVSnFFODEzY0RW?=
 =?utf-8?B?YWNpSkxIdVRCZXN5NTVmdFZ5dzljUjlqSHlPY3o1eWUzRDhpanA4aWtoLzZ3?=
 =?utf-8?B?bmR5bC9zZ2g4ZlVXbDlMOHZtWnE5K1A5MXQrU3EzOS96WlorUG9lMC9pbDN5?=
 =?utf-8?B?Z29JamxreFphaXhoQmx0cTIxVmhxcjZqcHBuaHJDdFpDODhvT3RrTllOVzhn?=
 =?utf-8?B?QUwvcnd0UUZPc2h5VGtJRm4yU3hxa05YUVNuMHhyU1J5Y1NWa3lvMWtUKytL?=
 =?utf-8?B?aEp3VVBnc3ZvOXA3ZnNtakcyMTJBa2VIeWY3d3h1SURjYlB0dGs2RVM3RVZX?=
 =?utf-8?B?cEFVUlgyNnhaRFhIN0FhU2ZTdy9KQVo3SWxmT2llbzhyVENtMm0vNHpuOVg3?=
 =?utf-8?B?RVplZXVCSUZkenhrTko5OFBaVDVzMXdjZWRDcGpVWHBVeHd2dGdZYzZIdkEx?=
 =?utf-8?B?RFo2cmMwemVUQnlLRFNhVDJEcEFhS04vaEE2RTh0c2FNaVhwNlBWSFlOcndQ?=
 =?utf-8?B?blRVemU5Wk83blRxZ0RjM3ZiOTJ4TDZXN2puYTZPOXVEeXFiVEtsUTl0MXlQ?=
 =?utf-8?B?YkloRExlRmZSQ2x0clphTTYybXdwV2JuZG5SWDAzVHk1UkNEVFRaSGhRNVR0?=
 =?utf-8?B?S1IvaEI4ZDhWR3BjQVRSY2g2VG0zdUpiRUEzaUlhUXkyZThDVStxTFE2bGl3?=
 =?utf-8?B?RFVFZzZ6aWZNMEpPVEtpY2RaVUdsditCQzRqOVN0YlF0bW9LWEJUdFlBSkNt?=
 =?utf-8?B?empZdmFhZ2NSMzVia0VTbUNFQTZvNnVTb3RORHBobnhoMXI2cWJZYVpnUUJ6?=
 =?utf-8?B?NmplTTFheTE2R1JRUkl1b21tYXRFRTVIa29xby9MNkJTdDFWOWF1U3BVdXQ0?=
 =?utf-8?B?NVZRM0ZuU1RCM2hTMWVid3BlQlFPditldVg2MG5Hc1B5cTB0Ujl5ZmErcUYz?=
 =?utf-8?B?eVpmQUJrTUlJTFJ2Z0paWE9HcTdLSHI2blQ5ZzgyOUw3WWxYMlcxUFRjd0p6?=
 =?utf-8?B?b2dXK2NPamt6Z1dwZGhvSTEzMkptWEN1Z255Y0tUY3pLOFFjcmEydzdDRW40?=
 =?utf-8?B?NWIvV25ZdEd5WjhCU0hFWUU5aGt4RlNYOHRrSUtxQjJMTFJxQ1d3K1Bra2pJ?=
 =?utf-8?B?WXFnYndyWTlMbTdMSjZaWGpEaTUyNEwzQVBlb2NLRmdjeUtPWEtuSWVVK1JP?=
 =?utf-8?B?Y2VXS0RlaVg2dVhNcnpoMFc3a2ZENGIrckMxa1pDdFFmd1Q0VHpNcVdHWHo5?=
 =?utf-8?B?clZUSWp1RGNES2szVTRIVDlqcm9DL28zREM3bW4va0tnTlZCU1ZEU01FS3V3?=
 =?utf-8?B?Mk84VEdxZmF2K2tscmpacEU2cW9ZdU96enEyRFJjeXdsQ29WTEdFRWFCSE9Z?=
 =?utf-8?B?ejAxZDRqcytQcUJuUmE5NVUzM0hxUE1QWXJTQ1E1TEVESExKbVRaNVJhZkJr?=
 =?utf-8?B?MHlHRlFGSmJPU0Y2clJVWmd1eWVkMG5UVEprdVlpcW4yTFlXYm1YRW15RUpi?=
 =?utf-8?B?ei9ISmxQS2RQQ3pPUEVJYnhMQURLN05hWTZqamtHTkduUzV2Y0UvRnNrczEv?=
 =?utf-8?B?ak1LWHNtMEdDbi9nc1k5YStNU2hJczNWQWw0WlNOYTljTjFRWG11ZkpYbHVh?=
 =?utf-8?B?Y3VJRXdSbVZkSU91VVFYRnI0dmlCYlJkRkRTV2k5N1VQRTlFQklseE5mVDZu?=
 =?utf-8?B?eTZYN0dpbWJNK0ZVK1c1eGRGNmtZTzRRTnJuREJLYkdFdXBiUG5oeEZhMGo2?=
 =?utf-8?B?Nm9YRDJhRjBSc0dROU80eE5XbnprZ3BXQkZkd3ZyM1B4ZWo1bnVBeTFoS3l5?=
 =?utf-8?B?bTdzUjVIVnJjTXhSVGxjcXRsWGQzNzZFNGRreno0clZTeWxrMGEwL1BROERx?=
 =?utf-8?B?V3JTYzJsYTdhWjBLajNsSTgzOUZGY2hsTVNCeTFGb0E4RlRJL25WMFFwNVc1?=
 =?utf-8?B?UHhNSjhaK1BBaWxTMVY1V2dnT0ZOMzJMNm9OUGV5T2ZqWERZQlhyR1NzMzVJ?=
 =?utf-8?B?MzBCaC9SZHhBQkU5VkxZOHZzYlZVRDlzYi9BUEF6Y0FlQzRGRk9mdVA4dXhT?=
 =?utf-8?B?eERsam5JZUx0RXZoZWZwSkpPVlhUeXF6N0ZKalRoMmY2bkJtNlpIaXF1ZkxX?=
 =?utf-8?B?cmtlamFLd291enRmNEIzczJpMmJENWVaYzcvdU1leXlETDBGbGthY2lLbXVi?=
 =?utf-8?B?Zk5aOVQ2ZFVwZ3A5TzhTWXlhUWwrSDIvY2ZCNkNpcEhyZzIxVmtsdz09?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0f0569-f1c1-4206-52c6-08df2b2af352
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 02:12:38.0541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mVbMExLU1D+LBsvtZhDrR7msRyRUGZxnauPyFZYPae1bjALAepIy5U1GUMmN+/C5xUJKDN+FyppTpjDzbrdxvIlrhpnBVvz9MzJB1q9m1eM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_191302_330297_45B26E20 
X-CRM114-Status: GOOD (  17.25  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

PiBPbiAyNi4xMC4xNSAxODoyNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gVGh1
LCBPY3QgMTUsIDIwMjYgYXQgMTI6MjA6NTRQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6DQo+ID4gSGVsbG8gS3J6eXN6dG9mLA0KPiA+DQo+ID4gT24gVGh1LCBPY3QgMTUsIDIwMjYg
YXQgMTE6MDE6MjlBTSArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPiA+IE9u
IDE0LzEwLzIwMjYgMTM6MDQsIEhhbCBGZW5nIHdyb3RlOg0KPiA+ID4gPiBSZW1vdmUgdGhlIGpo
ODEwMCBjb21wYXRpYmxlIHNpbmNlIHRoZSBKSDgxMDAgU29DIGhhcyBiZWVuDQo+ID4gPiA+IGNh
bmNlbGVkIGFuZCB3aWxsIG5vdCBiZSByZWxlYXNlZC4NCj4gPiA+ID4NCj4gPiA+ID4gQ2hhbmdl
IHRoZSByZWdpc3RlciBzaXplIGluIGV4YW1wbGVzIHRvIDB4MTAsIHNpbmNlIGFuIE9wZW5Db3Jl
cw0KPiA+ID4gPiBQVEMgSVAgaGFzIG9ubHkgNCAzMi1iaXQgcmVnaXN0ZXJzOiBDTlRSLCBIUkMs
IExSQyBhbmQgQ1RSTC4NCj4gPiA+ID4NCj4gPiA+ID4gSSB3aWxsIG1haW50YWluIHRoaXMgcHdt
IG1vZHVsZSBpbiBwbGFjZSBvZiBXaWxsaWFtLg0KPiA+ID4gPg0KPiA+ID4gPiBUZXN0ZWQtYnk6
IE1hdWQgU3BpZXJpbmdzIDxtYXVkX3NwaWVyaW5nc0Bob3RtYWlsLmNvbT4NCj4gPiA+DQo+ID4g
PiBEcm9wLCBkaWQgbm90IGhhcHBlbi4gSXMgaXQgc28gdHJpY2t5IHRvIHJlc3BvbmQgdG8gdGhl
IG9uZSBwYXRjaA0KPiA+ID4gaGVyZSwgd2hlcmUgdGhlIHRhZyB3b3VsZCBiZSBhcHBsaWNhYmxl
LCBpbnN0ZWFkIG9mIHJlcGx5aW5nIHRvIGNvdmVyDQo+IGxldHRlcj8NCj4gPg0KPiA+IEkgZG9u
J3Qga25vdyB3aGF0IE1hdWQgZGlkLCBidXQgaWYgdGhleSBjaGVja2VkIHRoYXQgdGhlIHZhcmlv
dXMgZHQNCj4gPiBsaW50ZXJzIGFyZSBzdGlsbCBoYXBweSwgdGhhdCBkb2Vzbid0IGRlc2VydmUg
YSBUZXN0ZWQtYnk6Pw0KPiA+DQo+IA0KPiBOby4gV2h5IHdvdWxkIGNvbXBpbGF0aW9uIGJlIGNh
bGxlZCB0ZXN0aW5nPyBTaW5jZSB3aGVuPyBJIGFsc28gY29tcGlsZWQNCj4gZHJpdmVyIGFuZCB0
aGUgb3RoZXIgY29kZSwganVzdCBsaWtlIGV2ZXJ5IG90aGVyIGJvb3QgZGlkLCBidXQgbm8gdGFn
cyBmb3IgdXMuLi4NCg0KT0suIExldCdzIGRyb3AgdGhlIFRlc3RlZC1ieSB0YWcgaW4gdGhpcyBw
YXRjaC4NCg0KQmVzdCByZWdhcmRzLA0KSGFsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
