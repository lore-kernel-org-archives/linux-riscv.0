Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFC8CA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 07:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpK4Y6vq4i1xQyqjnWi+3kFzT75Eq+JH5N74lYyKHQU=; b=fZGacOOwnLKed4
	kxkeboPtZrog3Aub32ZavWlgcE7A6AhX/FvkcVAEzsj6kivqUgIXzfcl394Y1omZw5oggCrSSOads
	rDAU+CKuKERtHnUN0vAVpJ9EwlaCdyliEqmpkKirJWKLxfyb++rz0MXFTFWmn6MTRgRsj+LjMYbWL
	g9VY0/xfX7ovgu4jWGEowJtcuCKAmS2WIdrvubUYgrZBRJ6j7egBtdmrI97mOSCSL3kBko4Guv/K5
	OV8JIO7edfeeKUKkOSSyJ0Fj+7jLpF06CY8HsWuVXcQlW1bRz4Kfu8msrWEmtiKhhw1QeDssUh0YX
	oowPt6nvFocZ/wCWKzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbyED-00GaBa-28;
	Fri, 01 Sep 2023 07:06:01 +0000
Received: from mail-os0jpn01on2072e.outbound.protection.outlook.com ([2a01:111:f403:700c::72e] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbyE8-00GaB6-16
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 07:05:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoLYj8o96eqGJx6KN30g4nn6YEZLqNlABEmt+7pPrl6/NdaulofulFRPeUM+Iitxub584sJNv3zUTeaS/xs2a+uk8MwcUybhCG5632Ty6ge7tLAS4y6ePPKKLgH2MxsDvhFSNmulJLABGfTpHUxy6RZKkh0uxgODaGPqh258cyoe3Qaqn5FwaaaS2ko5r0C9/35G0hH2XNOiZbx6nV19XeqiYWr4ttuPDQh9aLgHwD3fGvWFpWwWUOLvnHjQdKk9wjG/d2LBfhIypisbtWYy6pQwuKh4YcI/I0/I7vF9S+rdh+JYhEpNfEas8zU2X1j0OzFS7c2E8svAoxnXFtDL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oHVOzecehP1kC0LlYmf/a1Ygo32BripRASbYyU+znU=;
 b=jwIoV5JoJlFf9l+5eP3FeZxjfrQxHzSUn2HXQevPuVcuLM2RGUkx0I85c1UvDEIwFXX4VpROkBfSgqrwOZB/VCzS2WVu0WzlZvpfvpGUKFyrBpH5Fkpu46tQcPuZootaveN5nEFARGcrnbd1uIylnXLiKWKSMA06Y+RtRB0vTq32K9ws7U8fzOsM/VZ5+wd2ojHseWh+h1wUGHxZxxaKcO6/OYq12VbDBcv57xrFIYRGhXDUJIzUshSr1viBkhStFFumoiqW1CagCGbbQcPrUvXq+uYb3ex3a2D57RqqHip+NVILkdk7/ppxSTyC3+9Rw2KQ9rCvbjibrZgKsazB4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oHVOzecehP1kC0LlYmf/a1Ygo32BripRASbYyU+znU=;
 b=MJh1pYj12oikND/CdFH96/g15f6ds7Y90bCxnHj7aOhyvNsMf6hz8XKKKZYOWmhlE+yNs8lhu4R4fUMFdZnVzOjxaIr6KGrC5NxEbJC+Bd2DEcMLojPqsdzciCVKPBnJ5XrvJycahWNRSX2x73+7SfiR6n+dqPEQ90VTzs8vTpo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8916.jpnprd01.prod.outlook.com (2603:1096:400:17d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 07:05:43 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.023; Fri, 1 Sep 2023
 07:05:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 1/3] arm64: dts: renesas: rzg2ul-smarc-som: Enable
 serial NOR flash
Thread-Topic: [PATCH v2 1/3] arm64: dts: renesas: rzg2ul-smarc-som: Enable
 serial NOR flash
Thread-Index: AQHZ29WG8miwdKk0DECMGbhpvHrmdLAEqmMAgADjLtA=
Date: Fri, 1 Sep 2023 07:05:42 +0000
Message-ID: <OS0PR01MB5922303440FD0CBCC676A51886E4A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230831063635.2816-1-biju.das.jz@bp.renesas.com>
 <20230831063635.2816-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUXS6o5n9vg7ctd-69X2B5ZuKqcT1t3b1gUbEk2UuT0Ug@mail.gmail.com>
In-Reply-To: <CAMuHMdUXS6o5n9vg7ctd-69X2B5ZuKqcT1t3b1gUbEk2UuT0Ug@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8916:EE_
x-ms-office365-filtering-correlation-id: ae2413af-dcd4-44af-fe55-08dbaab9db73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6U6vWwe9I1yAbHOU7y/IB3NDbYReQKQa6na/tgJJMPAdO6NanH1tl65+8JPMecuo9dGtCpDvdOnULboRLkG5xAKqf4jSP4K7rzRBSWDSmv7i/VtMUal83adO/jHIlF/BS6LhynqtzzCyI5yFaCDSie3qDBwMYPvNLHltgDVeH9cg3C0l9Tn9wMloFpT1db7eANcrHEmDq3/WYQny6rgpH/PXoD3TCYd5Sc/0xsvFSenrssTj7y/T5hRaZZO6K16IEOsJlBcdW2xG1HdzrkfTKKdkR4wOUdvK6ljWFAIEq34raVRP0ZWkIjrqDQOD/QLoS8aHXwn15Lrz8G3FIs3KT+QWdVwvX+dmXwyBToZ7BvH3/DL6mjTu2X/gebPHEMs0JEQXJzds31w2qcHlrdoQflrkYmkh/8mu10Qx9EasAPAHiWhzoA1cHzpVRnKHKusSMGIq7O0Y/x3dXoryCZJ7VJNN5w904LCLzxOPxK+MXpmDY8uk736+qDF18eswi5ySitC/L8QA932hOvZBPrYtlNrGHYxCFqXI2rPKboXppwUKDeCd4X313fULvPXh7gO+sfyb+JWAHKPVbbnYw2qmXVjhaZTD6IIRnPwvV0DpMfbT8RLLYR7CMSa0OuScLFvS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(1800799009)(186009)(451199024)(7416002)(55016003)(2906002)(6916009)(316002)(41300700001)(5660300002)(8676002)(4326008)(52536014)(33656002)(8936002)(86362001)(71200400001)(122000001)(478600001)(107886003)(83380400001)(26005)(53546011)(7696005)(6506007)(9686003)(76116006)(66946007)(38070700005)(38100700002)(66556008)(66446008)(64756008)(54906003)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzZzWU5KU2xhR0FUcG9tUFZBVXBhSkV5cVhKT2g1VjVMSEFqNzVPRnhSek1O?=
 =?utf-8?B?RVI0TXlrVjZEbnAvZHlaWDdWcmJZU1NaRlc0Z2tZM2dnZDlFYWVMSnhDQk90?=
 =?utf-8?B?SEFpZFM3UXRON2JNZ3dyOXpMOTN6MHV4alRUbnFneDhYRFg3eGpYS0d6YVhi?=
 =?utf-8?B?V0cxM2dpOE9JQUZOWUpKV3NCSG11TU43cWxDd2lyVWFkQUxLM0pXLytwSjR5?=
 =?utf-8?B?Y1J5U3VZVlhMY1hSNmdEM3JRaVBUOVA2dGhmMk1BSDJEanBuMjEyVnV1Y1JT?=
 =?utf-8?B?NWtBSEVhVlY5VzE4ZEIxZUJjV0NhZG4ya1pYNGxyemo2QWJ3RjRxdmVkR05K?=
 =?utf-8?B?WFByalE0eHBmOXhIS2NPTzF0OXNQYTJxbnAxcWtyRXNPSXRkd1Q0akJCTklx?=
 =?utf-8?B?bWJTakg3YlRtejJNOTRCblNUdEtLcmVKdHlCQnhEQkd4NmVPNXJZS1RjSmZQ?=
 =?utf-8?B?K2M5ZG9lQjdwNVZralloWUVzRG90cnJjdTV4d0NDNzVla2NSOTNGdjFqOXVx?=
 =?utf-8?B?S2ZoM2k4S1IzV1FOeFZKWXlwOFVnNWNCQmxxTWNOL3RVU0J1ZTdjT3RzaTRF?=
 =?utf-8?B?VzIwZzU0cVJZZ0ZMT3Q5MENsTlJCSThIV1dIY2JweGllT3IyOHptTC9yQUlV?=
 =?utf-8?B?TUl0cE5YUkMzVXFpOHBiblFpNDFxYjQ1ZVJnU2QwV3k1WmtDRlQ0aE92OXZq?=
 =?utf-8?B?a2k5N3RCaU8yYXh3NlpLbWpnb2dJRG5NVDlkN1htNEgreGdWZ1Z6bWR6Z3ZU?=
 =?utf-8?B?OExkY2hhQm15UzFJWENFSjFiTnM0M2huMGYrVHZaa2pZVEVCMGZ3UjVKdVR5?=
 =?utf-8?B?blZkSlRWRVcwRWt3Qk8wcysvWGUvQ3huaStqd0R6LzlIQ0o1eHBGMS9VVCt0?=
 =?utf-8?B?SlRBdVN0NktMUVRLVGpRQU5pZkhsRVhEcmJiNGVqMkxFOFZyMmZESGdFWjlt?=
 =?utf-8?B?RW1QZmNwbzBmU1RHZG14Wis4aVQ3blhDaWtPNW9QZ0ZIcS9ES3RXbk9PNFpP?=
 =?utf-8?B?OFduQk9CRDFxWjZYSFlVL2tUb2kyOHFFdzRiY2hWcVBEckxSM2tsanRUZTl3?=
 =?utf-8?B?SDBwYWV0dGllS2k4RmZjS2JnVWs2L05jOTd4THdPdUJZSkVzR240L3dvMkF2?=
 =?utf-8?B?RGQ2MHNjaDA4djFQQ2hDZ1ZnQ0Rob1R2QkxVTS9PTzMrVWNaOUlwZGlpclpS?=
 =?utf-8?B?QWsyTHZCR3cyWW1DZ2FzalpZaWpuYnM5Q3FLVUw1cEV3dEhIZTR1cVY5SzFM?=
 =?utf-8?B?aVVQMUxvSnRmT3NHckZ5bXZQMUF5cEEyVnk0ckJYTURMaUtOdlQvZ0JkNWtz?=
 =?utf-8?B?UGY2WFdPcmtFSlJucVRaOFoxdTRLQlp1U3czQVF0T1Q4NVpSKzNWUlF1VGQw?=
 =?utf-8?B?VE0xb282SXp2UFQrWVJHMmRnbGRtVDl3R3pzRXhLRE1OSTV4Q3ROWGdVSWp0?=
 =?utf-8?B?WjYwOGg3UEhuLzZNTVp0ZDJYSVBWenJJem1tVGVOOXBWUFBzZ3UyaHkyaHll?=
 =?utf-8?B?TUJVOElURG5tdmZXcnN3RHVkZnlucFZYbnB5TG9DbUFHQ0dxS0NuYWxEeUt5?=
 =?utf-8?B?WGxOb1QraEY1dG4xRGRoeXUybHlpWUVycGFjTHo2TXpaM2puT1hNNG4xNE9o?=
 =?utf-8?B?Vzd0Uk90RnBQbjhIWE4raWkvam54STZlUDZQYVN1dDRrTTU0V0RsMXJtWUFr?=
 =?utf-8?B?R21nTDVtQzI1VUNJUHVER2ZIS3VLK1c1RUtZL3JXZVk3a3dRTjRLdmdYbUZw?=
 =?utf-8?B?SS9CWlZiVFF5a0NpY01JQXAxRHd5RVlWSFVQZExtb2JoQXdsUVJaUXNFdEZD?=
 =?utf-8?B?Z29Oc2NEbUNkZHN0Q21QMmQ0T212WVdVdy9WeE1oQlJUTWtXcS96QWNXNjZu?=
 =?utf-8?B?a05FUG5KV1hQQ0IzeUQxT3V0Y1RXcmpUdHZCODRjQzhYUEduV3lzQUlYMUpr?=
 =?utf-8?B?c1NVRllWZ1ZZdGJUalRyTGgxZTQxS2FXUExpVUZJcE0vSEFQeWxOU3huVVRK?=
 =?utf-8?B?dVJzMTBRcWtrR3dCdDR6MUFOWFNOeklOaGdPZTdwNDlnSTJ4NDZtZUNJWFM5?=
 =?utf-8?B?ZTg5MTBnK1Q4VVNWTVFJa2tXbEZKZW9ZTGRnL2U5dDhoVnJ3bjFZWTRSVXFn?=
 =?utf-8?B?SUJRYkFIdUpCaVlHdVA1enArN0laZjFkQ1lVT3NFcDRsb2dIRjJHekVjbmpj?=
 =?utf-8?B?Rnc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2413af-dcd4-44af-fe55-08dbaab9db73
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 07:05:43.0145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WimUAXy0HhuVPlwixfB51AXEG3Vnj7iyiIrRJC6LiLM/exETbHnKSJ8Sww2Poc95qAvtJmipngT9WFZMYNew+B6qkbzkOgCpI+DPbjauBOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_000556_391010_7A5AAF85 
X-CRM114-Status: GOOD (  16.93  )
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

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYyIDEvM10gYXJtNjQ6IGR0czogcmVuZXNhczogcnpnMnVsLXNt
YXJjLXNvbTogRW5hYmxlDQo+IHNlcmlhbCBOT1IgZmxhc2gNCj4gDQo+IEhpIEJpanUsDQo+IA0K
PiBPbiBUaHUsIEF1ZyAzMSwgMjAyMyBhdCA4OjM24oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBFbmFibGUgUmVuZXNhcyBhdDI1cWwxMjhh
IGZsYXNoIGNvbm5lY3RlZCB0byBRU1BJMC4gQWxzbyBkaXNhYmxlIHRoZQ0KPiA+IG5vZGUgZnJv
bSByemZpdmUtc21hcmMtc29tIGFzIGl0IGlzIHVudGVzdGVkLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+
IHYxLT52MjoNCj4gPiAgKiBFbmFibGVkIDQtYml0IHR4IHN1cHBvcnQNCj4gDQo+IFRoYW5rcyBm
b3IgdGhlIHVwZGF0ZSENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3J6ZzJ1bC1zbWFyYy1zb20uZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yemcydWwtc21hcmMtc29tLmR0c2kNCj4gPiBAQCAtMTc5LDYgKzE3OSwxOCBAQCBldGgx
X3BpbnM6IGV0aDEgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpHMkxfUE9SVF9Q
SU5NVVgoMTgsIDUsIDEpPjsgLyogSVJRNyAqLw0KPiA+ICAgICAgICAgfTsNCj4gPg0KPiA+ICsg
ICAgICAgcXNwaTBfcGluczogcXNwaTAgew0KPiA+ICsgICAgICAgICAgICAgICBxc3BpMC1kYXRh
IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwaW5zID0gIlFTUEkwX0lPMCIsICJRU1BJ
MF9JTzEiLCAiUVNQSTBfSU8yIiwNCj4gIlFTUEkwX0lPMyI7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcG93ZXItc291cmNlID0gPDE4MDA+Ow0KPiA+ICsgICAgICAgICAgICAgICB9Ow0K
PiA+ICsNCj4gPiArICAgICAgICAgICAgICAgcXNwaTAtY3RybCB7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcGlucyA9ICJRU1BJMF9TUENMSyIsICJRU1BJMF9TU0wiOw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHBvd2VyLXNvdXJjZSA9IDwxODAwPjsNCj4gPiArICAgICAgICAg
ICAgICAgfTsNCj4gPiArICAgICAgIH07DQo+IA0KPiBGcm9tIHRoZSB2MSByZXZpZXcgY29tbWVu
dHM6DQo+IA0KPiA+ID4gSSBndWVzcyB0aGVyZSBpcyBubyBuZWVkIGZvciB0aGUgc3Vibm9kZXMs
IGFzIGFsbCBwaW5zIHVzZSB0aGUgc2FtZQ0KPiA+ID4gcG93ZXItIHNvdXJjZSB2YWx1ZT8NCj4g
Pg0KPiA+IE9LLCB3aWxsIHJlbW92ZSBzdWJub2RlLg0KPiANCj4gT29wcy4uLg0KDQpPSyB3aWxs
IHNlbmQgVjMuDQoNCkNoZWVycywNCkJpanUNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
