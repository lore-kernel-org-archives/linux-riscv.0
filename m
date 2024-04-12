Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B35EC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 08:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dIce7ejMxcwRG2gAZ9mgt7OMCSdGaUTmiOFc8Pc995A=; b=FfROLXt0sbzzry
	6bcDitc+5YHsGXBxADjjd2Xf3TI6RC3jpddEicLdXwXKE9//9bJP2eRAaCxppde4BJQ0cG2JLEYmY
	iLpVMco7ShOYlAaORCf6ievXazukVnnho1MZ35vAAMaAdHyqyNtzd3oDZQtaVagYP6hYJToTRdBVP
	hhtgv8UOC3ewjwlTVe6098AG9XGwz2lgnrEzJ7NX3rqNXEbfIKCUM5gQtN5K4hPonDBmfux53Nk0g
	58l8ochG94cxKvFWuJZfBEVHbYw+ytyzU/m+0AoxpOy0Fsz/9bUGSZDEmgKf6WjaH/KCo4vxX20Y8
	0WEwv2O/C2kbkQid3d7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCbE-0000000GCI2-1Z4d;
	Fri, 12 Apr 2024 08:49:32 +0000
Received: from mail-sh0chn02on20715.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::715] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCaD-0000000GBL1-3vHh
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 08:48:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hq9ZY9/5RXGLteuMfwxrs1iOP05prw/DBX6scFWOVDL8caLX6NfXgmSGp9CbjOpqI6T3IB+oauUjpZ0ov0avrF3F+e1TRMINeM6jY6cfY68pma1jMenHWPzFrv/8ysD2RE26YaTk/gqa6oACAbISnL2pm/2XVkS6XXUVxS5gTqHAGGwgorU+AlKbx6JKSzVzyNg4FWG1KdIVuLvpeqkl+POLMTS1ZAPqCiKhu/nwdV6MA8YPcvHY/gjNrjLhLn9W4Scx+7OCCQ8FkO23VvUbZrfV/GmEgM6+qXqENK5XHA0ZgE48sGI4U6PN8MZz2kE7t0CHYRm5oISkAzg6+j/Qdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsfXByscsTsrkJYkrTmIyQI0UPJhy1uV2JM15gBze/8=;
 b=BOpGIY3mb/KWCChu4/Gb2HboyXDfJjMQPIhVTWHp19O+7lcr+uycn1wJGfGd01Ex+i7lhYQ+DFZZ1mdnsu/QVIy/EGfsVHPPQupsF7f6LOdA/X+V639P1AWs3bcVDVzN2O6PMWwBstzk6gOukREn3SPjL9WTvTO0dkbzfk5oPeuDbo09cJP/o51QAGMPnlUrtigpiwlawQGpLMfEe+L9DKTxASEY3tj5APr21SCG60W0OH5o6/9vfaz6atBHf2ORrZ2PmmAb4Qv1oQmGhgFRSpnTTDsA1ci49G/52PMs4ZbRzlPWpaHiHR7vVhnfYsPlWcK2LsNt2BC2cQ93vYQVbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1019.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 12 Apr
 2024 08:48:19 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::6174:711d:d93:87c9]) by NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::6174:711d:d93:87c9%4]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 08:48:19 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>, Emil
 Renner Berthing <emil.renner.berthing@canonical.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v4 1/2] clk: starfive: jh7110-sys: Add notifier for PLL
 clock
Thread-Topic: [PATCH v4 1/2] clk: starfive: jh7110-sys: Add notifier for PLL
 clock
Thread-Index: AQHaivejELTw7uowOEWZFUqhB7mbD7FhI7sAgAMxGjA=
Date: Fri, 12 Apr 2024 08:48:19 +0000
Message-ID: <NTZPR01MB09568F1094DFB1F0BBFE29ED9F04A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20240410033148.213991-1-xingyu.wu@starfivetech.com>
 <20240410033148.213991-2-xingyu.wu@starfivetech.com>
 <858299c27c63aa2974b169f9adf624e9.sboyd@kernel.org>
In-Reply-To: <858299c27c63aa2974b169f9adf624e9.sboyd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB1019:EE_
x-ms-office365-filtering-correlation-id: fe2f1c94-efc0-4cd1-280c-08dc5acd4d59
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ovXyooCcACVdZp0PlxMqeScxTQJQVm5q3Wlu96GRJaf64Fwk6II/Y1c+mR65GE8GXSoQslBteTnJtz5K3Nsw2TVX6754CwV3X55rpFs429twhsVs4xsqPJd13Ofqi9G2OIc5cl/yBLNvRESntUPrMXz3MLzxdaeWue4dI/bteqFyJwXfqT8GPS4WCimgsu93v/94gI4B/Dy8otueLAzXw//AQSFKUBMdg9/CScPDx7Mr8XWKc2Kx7B3bDufEwQdjgJEStISEsF4w6qUogbUJTUDdwIT7EeJmVJW+Qb/049p8/CyFuclhap2YmB79XWuhrnhNQPbEpZtyik2ZtiO2nzrg7I27Vunm1rGU5gHCKoIStcagItnT3Ve4OC/w2PbnOKEl1kunm6l5LhiRtxR9/OPGMY8zkMoPToUZ4AeUnkLDbO0uGamWlWOwo9cUVAlwB+0EUhgeiGTaqt93XKCHdgIIa7PUmqS8OjI66BuZE1izEMdviyeHD9DfRGY0HvC0bXrv++iBiPIRwdF1PVqMgvRkytlV2LJJvUFivmGDg4lntxAqxLUeZonUq0cHCZaw9hdNFwCIuwRC2eAEpPdkMfMMIzqyYran0ZaCln9RkjuVhs8se9TGqrysH96zFczi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(7416005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czNQTklDWjh3ODk5SnN6V0U3Y3dXOFhUN2FwS0dhOUVVMWhoK28xOFgyeDV6?=
 =?utf-8?B?QUN3ZWVKT1cweGpkcVVmSHZsOWxHY24yNlBRR2lKbGJzZnk1dkRFYUFmeFBl?=
 =?utf-8?B?R1g0UU0vVXhVRVhyQTFZVVA5VGd1b2dQVjNDQ0l1R3JzVUY1bWMvSEJHVjBX?=
 =?utf-8?B?aTJyTzFVbllxb1BrTmJsakNsNWV1aXRJWTh1TzVRTUxuYjcwWSszb0RkNkZG?=
 =?utf-8?B?UC9zNlY2R0pLbGY3cFJ0dHJnVWhlVS9rZGliVThja3hnVTMzRlVJbGpoN250?=
 =?utf-8?B?alhMTXRDbWhZZWRydGNHZ212Q3U0VXUveWRKVkpNR2cyaGd6N0VPQnV5Yjlu?=
 =?utf-8?B?dHBQTTdtZm5aQ3ZqWjA1S1M0ak5lOWpIUUNPdnZ5em40RklaYVZud1UrM3VD?=
 =?utf-8?B?RUlwTVdFVU5IOTlmQmVNclVqNklGTUI1R3ZBZDBrZHNuOGY3ODB4QTRYcEk1?=
 =?utf-8?B?SnZWS1ZnM0tLcUl6akZhRzVjWVB3M0tvWTVBS3diWGIvZTF1MUZ6d0hwK2pp?=
 =?utf-8?B?cmtCYmMwM0F3RnZkdkk0OFFvYmV1UkplTUFmRDMrQ3lCMFpNdGFjVnQ4Y1ky?=
 =?utf-8?B?QnpYRkUvam5VRVVVU1Bvc3VtVm1ya1lPa1ZKcWNNaWJxT2llc28yaE5ubXM3?=
 =?utf-8?B?OUdlV3NJUkkyOXdlYnQzRFdtVVpnSXZkcGl0UmZ0dHcwTmp2ZU9Cd3ZYeXNI?=
 =?utf-8?B?OWdkK29DWllyTUpJYzlQZjhLcWJmSVlTQTJvR1kwVGc0L2FUYnhhSTlxOWVV?=
 =?utf-8?B?YTlkTU82eUFlK3VUZkdsdFk4RytScjZ3Y0ZyM0VDVTkyK0JZcERpQTlnWTN2?=
 =?utf-8?B?WTd3cEZDWnRuR2NxaWFpaWRqU2YzL2RlTGp3Sk95UFRHWUdmamJWbTlCOVFv?=
 =?utf-8?B?cm92SzlsdFgxSEJxZFdUUzB1ZVhuUGxodWE0QnMybER6TmF2L1g4THR0SEpG?=
 =?utf-8?B?QkpNMDkvQTRsRFM0WFZwbm9oYU10VW1HaG9TWGxxaUl2QWZCQytpNjlCTk9n?=
 =?utf-8?B?MUtuSkUva01yRS9vNEZnM0psUUllYkZQNGROU1RwYlpadzIzVGtTZm40TzhV?=
 =?utf-8?B?byttNGZRZTl3ZFkvVU5wUWhGSnFBNGNzbDVGSmhoM0VUQ3RDQkhuSDJHTWpu?=
 =?utf-8?B?QmZRYi85Z1NJQitnWkFqQlhoNE8vUGNSTkhQK3FKTWpzV01TK2xRcHVNVW5R?=
 =?utf-8?B?R3dRNjNiR3o1Q2ZvVklBUytLR2t1Ykx6azZNTDBHNEN0V3N2T09TbVVZV0x2?=
 =?utf-8?B?ZnVYTlhGTXU3WkZSa0g4Ym5IdFU4VEVXaEhwckJwcXZ2RU1wdzVvTEpSRGNG?=
 =?utf-8?B?RStVVnhqSGNlOFd0ZjNaMGhvQTV2VFMvV0NPNmUxcExKRmptZ1k4YXl2OFdP?=
 =?utf-8?B?VGJQcTNLMUJpVHRQa2ZzSjBwRVhxRWdhUzdEbmNJMStxSm0zeUN4Tlh4dmds?=
 =?utf-8?B?N0tXenZFS0wzWlBvemUzUDB5U3E3WlZTeGpjNUtrY3hENW5PWDJhVzNHZFpp?=
 =?utf-8?B?UEh5UWVOL3FBVkUwYnN2UHVvbURueDVzaTNoR3IxRDM1QjREQm9zOXYvbzNY?=
 =?utf-8?B?ZDcvR1d6ZVRnaTRRYXZwdlEydGJFZDJva2ZHLzk0ZHpDeVRjYTF1UjJPN2My?=
 =?utf-8?B?b2c0TUFKeTlyRExzZHJhOXVNQVR5UzM1Ri9vL3d2cWZBRDcvMnphYXdseVo1?=
 =?utf-8?B?MjYwankvMFRLMG9ZcENjUnJoeU55K0hSR3J1MTRJcmJLUUFjNmptYjdPNlZs?=
 =?utf-8?B?UWNXVWE3SDBpTFRaU2pBdk5HYThUdTZGK1YrbVQxUTQvR3pvQi9GSDNDTE9F?=
 =?utf-8?B?bEI3OGFTUnBHeUZybXU4c2JUdXhoSmNGeFV3RTFWRXZDT0JDZnR1YUNpUVdG?=
 =?utf-8?B?S2hFeEhoTW5VdTBGMFJ0VmhOMUJzK2pwc0NVYTN3WDZzMSs0MWVsQ2RGR292?=
 =?utf-8?B?K0tPcTBTQVlxL0laSlVRb3Q4WDFJenFxUDE0SE1FMEdVaDBoV3VxNGwyZVUw?=
 =?utf-8?B?OUFycHFxek1kU2pSVUZtOWU2UjlyR2duUFdHSC9qbFZQL2tCeW0rRGZybzJB?=
 =?utf-8?B?d2NjamU4c1lYMCtBazJ1eUJRVUJ3aS9qY1hxdE9lalpiNG9MRDV6d2hjZUNH?=
 =?utf-8?Q?OE+lHLg9QrJWtFetWf+R8eVq1?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2f1c94-efc0-4cd1-280c-08dc5acd4d59
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 08:48:19.1767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NynfWusYYcK1iBXgvmoIvG5jU5iuTS+XhcgZEPNXvGaOSvTomPSmxi3tkYS7KoUUeaqIC62xxgwCFNyBZm1l+K0KdTcEKBpp2GFf7oC9Xj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_014831_402144_2292D849 
X-CRM114-Status: GOOD (  10.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/04/2024 15:58, Stephen Boyd wrote:
> 
> Quoting Xingyu Wu (2024-04-09 20:31:47)
> > diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> > b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> > index 8f5e5abfa178..adf62e4d94e4 100644
> > --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> > +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> > @@ -385,6 +385,32 @@ int jh7110_reset_controller_register(struct
> > jh71x0_clk_priv *priv,  }
> > EXPORT_SYMBOL_GPL(jh7110_reset_controller_register);
> >
> > +/*
> > + * This clock notifier is called when the rate of PLL0 clock is to be
> > +change,
> 
> s/change,/changed./

Will fix.

> 
> > + * The cpu_root clock should save curent parent clock and swicth its
> > + parent
> 
> s/swicth/switch/

Will fix.

> 
> > + * clock to osc before PLL0 rate will be changed. And switch its
> > + parent clock
> > + * back after PLL rate finished.

Thanks,
Xingyu Wu
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
