Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B11CA5FE3
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 11:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KM0niWG+S/oDdN1TVbE921m1QWS3lk/3/M7mWLrnK94=; b=DF8AJI/dzCT8MA
	yS0kVpn8KdCEDQSgqybMYipOdWlpOdjrdNbcVpTVktevUhG+JSFp4wZ4J9dEN8+A83VCm+d3iGJCF
	gf6HUxOWZNTZCfZvTCyzQtQBqMAkGsq4duR7DivkgnH7Qk/cVkx+RJSPq2H82ASv0sh3cL4GWBJns
	yy5fu5KEWsK1ROfVv8JCI72F5hU/OgTkgHvdjgEW2jz62VvFjXxmfD1YORrq89T84rH0p38ALWXbh
	euwaNd+QcPf98Kpcl/qz+KSEzz65LXmqYXAVCmTSFzytscUKRp6yCF/6MpBTTUda8LvtVvlRszUDF
	CCrWKRzJ0gGGwrFYIAcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCxwE-0000000DQgT-345A;
	Sat, 03 Oct 2026 11:29:58 +0000
Received: from mail-sh0chn02on2100.outbound.protection.partner.outlook.cn ([139.219.146.100] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCxwB-0000000DQfu-26nY
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 11:29:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZDG5SvQ2arpmj3aJdXsVlO0VZRRkGTex9Bown0NldHfgDDlXoE6ih9i5tZ4ujDWgL81lat7qfHmAkfCJ01+ysZJmFILxaoEX7qhxN9B34bPhGgo7pNtml6nnx0IuzGnz38OxreU4J0uXA//iIxvYYp7cNSAmojXqqCpbzkCgIIWkPYEIdtYmNVt27V/wTyjBz9agKF7UyR9c2NoMCXS1iO+ZdhfqHl+ZTe5H1fy9uxBFseo5A0qYGonaIO8VSUzYIUmirl7sfj2uLfLdlfP5+eke4I3BXRhZd5TILKyTXPTK7q1oeE3mJu20B0F4spNhh60piH1fFhlRL7cp2r3Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwIx5wxUVuXHwCrqB7pqFJB1Xic5CGeEeq5hNxmtnTk=;
 b=i+knkiN2tYkRWMzFmfocX4k98DiCoIGyqhSdAe/uMQXSdI7/gPidwl13zlOqQLFNn8ElPjLId47fdZPFfrjvpHvA8BRqdtFLn26L3dhsaMou+x6V8OCKlX6T7/YoNnx2dvmvRnFwA57Wnu8DlQl+8wRoOsAZHn4uHRhZZoWxQYWc04+ARUCnSAqVmxOiAY33fIgc2iM8FZq2EsPPeaC4oLmv1aXqqEC5Wu+33qDrKxW0Y3AB0oEHmZoTI4G48pz2oYqAPaZZ+nc2V4qPNCHoqdPhOo/IIanPFMmreZSaoe73Ix3NR91GJi40vevpbFQ7ahd79FAqIG5Rpy6GIdmuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1267.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 11:29:18 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0472.016; Sat, 3 Oct 2026 11:29:18 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Michael Turquette <mturquette@baylibre.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	<inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang
	<keguang.zhang@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 3/8] clk: starfive: Add peripheral-0 domain PLL clock
 driver
Thread-Topic: [PATCH v5 3/8] clk: starfive: Add peripheral-0 domain PLL clock
 driver
Thread-Index: AQHdNtN8zEycFiTIF0WGda8EH9quprbnEy0AgATUBXA=
Date: Sat, 3 Oct 2026 11:29:18 +0000
Message-ID: <ZQ4PR01MB1202F5CB0172B43C162A3074F2882@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
 <20260828095608.19955-4-changhuang.liang@starfivetech.com>
 <179076152492.1471718.9285719072832956935.b4-reply@b4>
In-Reply-To: <179076152492.1471718.9285719072832956935.b4-reply@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1267:EE_
x-ms-office365-filtering-correlation-id: 22ed404a-b35e-4662-b1be-08df21419005
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: HfKh0VUaX0SJpP8D1QCU1In4790o7vE1y0A9C6B2/F8nF5I6FSSTmSPnQ8igw6IUm5/aAI6hFG6mFkmbLYxvkSCFCfmY+ISh0SAqAjvdbYRDMM4tbgqy6jSDw+LqNELfeqWEvo4g8IBeAE6DlHCeAcpMztwCTdd0mPbkF2XeB10ZuEKuqL1KcS4YRWRqOsmxSMvwG5ZDpm0J3wq3q/Zk4eDBdLxFVTcu6GIUHmm0RU9AxQz5ZjKHPpDaNpHqaheq86/gR88pgjoTmp4FDU06VtQZaMzIqzgbCiH6urn/XR30GhSLdsGYpesPg3AQqw6s7SZNe/80MoB/Yxbn9OP0laQb1sybygQdrcviSEsU/JMJRw+Dc/vshFc7ZfVXk4I3sq1TEGEqdZ1hUsdAE40/ZYuNxAn+RUQXmR+GoZsmQm78vhsuA7Wa/vkZ15OeGp1GTo/Hj4IfakwBG+Klz11teFa98vYNTHpWJ+bgPzamEalUEG+RB2F5kDyBsPrM4AEIvrEmGBbu1SnaYXwiH800UnjQB4RP1PkfXmzZcTz/F18XOGTv+wI5Fg0lMVlLHT/3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RU5kU2hGdjJpUjNaMkg2SUwxV1BnQ2tYRWR4M1JGWHZydDdzZ2c2L0lJa0hR?=
 =?utf-8?B?MXNVMHg3NzlaekpNWFAySXZPSVVWL2JLYTgrc1UweUUwby8wVSs1WFdPeWdN?=
 =?utf-8?B?WGtxYmVtWCtRYW52TEdZY1NkVDUraS9oSW5yY3I4ZGhMZ3FzbVJQcUdLVy81?=
 =?utf-8?B?UmJkSS83eG95d3JDQjBPeVNkSzRZNldjK0NHVlhLb2FrUk9XMUgycFdFR3Vv?=
 =?utf-8?B?a203MXZOWGc0Z294aFI1TGRNMm1wekVHZmk5TERiMVZvd3ZqSnhrYjRGN000?=
 =?utf-8?B?TDFLUE4zNk9NYmhvWmJsa0dCcVErdC9pTjBFa0RET2U3a3dXVG5BOEhyTWxX?=
 =?utf-8?B?QnFYeEYvVXhBVlNtbTdwOUVGNkNzSHF5SWtoakQ0SDcvVWpHZXNKa2ZyRWgx?=
 =?utf-8?B?WmV5UzhRZGV5dk5IZEFDOXlKTmNMZDgxZGkxS011dWVzV3ZqRTFzbTNIelE4?=
 =?utf-8?B?L2Y1VHp5T1hlRlZQWW02RHB3QTdKbnRSTjkwKzRHNlA1QjN6WFJjQkplTHgy?=
 =?utf-8?B?WG53UHBoeG96Z1R6K1pCVGRhanQ4TVZMQWN4R2IwdkhIcWM0YmJMOC90QzFM?=
 =?utf-8?B?VkNvcW54dENjQ3NmZk5taUZvRy9sTFhZOTJMVitKM013SW1Bb3NkSDdtZU8y?=
 =?utf-8?B?WFlxcVVrR1dtWStIRkZGM3k4YXk4c25uQUlnU2ZNTCtIejhhLzVlTFM3Qm1R?=
 =?utf-8?B?eFpqWTdWa1llNmRMdFBBTGVCL2pLT0txa1lwU00xOEFId0xiTHVacGJwZ3U0?=
 =?utf-8?B?UjByVGJTNVNKOWJOQjBhU3VKSm44QkF6ZlZ0YkxBNTlsR29lUTFraU55bHRq?=
 =?utf-8?B?T0Y2NjdmNTRoRnZuVHZqRmxQa3ZuSXlRYzBZbURwUXM3OTJIdFRKSk1EeEZz?=
 =?utf-8?B?anJjbW55WE5uSzFENEpDVzN2bkFCZXhqbXN4VllJamhkVDVmSnkvQTN6QnFF?=
 =?utf-8?B?ZzV1U2RQMzdDRVQ0TGd1L2xpb2U1VnIrUVJ3bWNUWEhsUGNtRmhkem0zTGFE?=
 =?utf-8?B?cVQ0SUp0WGRqMFlGRis1bEhXd2xRajE0ZDBxdUc5QjZvbloyS3ZMd2dQSWFj?=
 =?utf-8?B?eGlSNXI2enFpNlpxc3R1Tmp6aFYzdnhwVjdKb0JFdGM2ODFKdVdkY3QyMWln?=
 =?utf-8?B?UjVENFNLdTZkQ1J6MDNNSzBsRzhTQU1UME00NXRTYUNmLzJVWUl5K0lWRWsy?=
 =?utf-8?B?Mk1uTVFmWm1VaTJkQVlFVHdNYmNLNXFOMk13bnlQNmFJRUJ5QTZnZ1B4SkRN?=
 =?utf-8?B?dWNBYmlGQkxNVGlrS213SVZsVit4dG0vbzcrV2lsM0RDV05rSjd3d1BxY3R0?=
 =?utf-8?B?N2d1OVdub2p6UmpuQ3BTM2ZLVDRYNWVhYmZmcEt6YWYyMS9kdnREcWlBaVRw?=
 =?utf-8?B?U3NaVjhEK1hPNHVyM0REN1M4STJIekVXVVlCMDVXMjZaWFFUU2JDcmpYeGVr?=
 =?utf-8?B?dDZnOVB3R0RhNGhhZUNDbWFHU2hhNGRhN0ZDblluN2VqaFpVQ1hwUjV5RmFO?=
 =?utf-8?B?a2E4bTBURVBES0M1K2x4cFo0TDhSS1FMWVFyd3ZKSEljdjNSeUR1RHczMFYy?=
 =?utf-8?B?NHBoaTdVVWIrSFBhSXp0L1krd3V2ekxFb2FyS2t6T1V4dkJpejdKOXlnKzE5?=
 =?utf-8?B?S1lLT1BlZlhOTG9wT0dhbkxBSXhmVWExYllXa0lFK3lLNklJMlNtZGZXZ2gw?=
 =?utf-8?B?ZS84aDN4VFM5MFo2eHhzWGZ5bmJsOVhIcyt3WkIzU0phdElxSFN5VklhLzZz?=
 =?utf-8?B?OFliSDNRL1I1bmN1ZGlTR0QzUHJmYjJ4TkJtSUsvQnJtdFZ5VTVRMm9LNGlP?=
 =?utf-8?B?eS83YVdTN3NSY0lnMTNROHd4QUJoYzJEb0NqVmdCR1FXSGNSOVdHQXBrWHJJ?=
 =?utf-8?B?TVllVTRCL2NGY0NPZnRZeU42cmNoMnJjZEh0N1RQQTYvcitCYkw1SjJQMS9s?=
 =?utf-8?B?S3NTM3I2UHlPcnRjOXo5SklDNUNlSVY0L0JxT0I3K01VTjJlUUFHTHpBRlFI?=
 =?utf-8?B?THZiVnR6cU9mait5bHROWVFGMTU3NEU5TGRZcHIzc0Y1VTFMK2daUUJsSThy?=
 =?utf-8?B?NmgySjVTUFZObk5SZnF4bzdIL0lCRnhlSlc2K3FKVmtVSFQvMlpxWUZUYkhL?=
 =?utf-8?B?Nk9tYmJ6MmVHTU95NHluYTFnY1hTMTV5N1dWK1JNU0txMVJXZ0lwc3FkRWJo?=
 =?utf-8?B?UjVWY3p1L015V3F6bjFDUXNGMGx3Qkw2aFY0OElqb04rUUxLVFNqTnpVeVJ5?=
 =?utf-8?B?K1BnWXVwc1NOL3JHZ0V1aWFTeHZnT0hzZ2xlZ3ZENU03ODdaaXBwajNNK1Jl?=
 =?utf-8?B?WElqd09SRmNUVWZpTGZnWGNCSTRPUTFTdWVKaEJWTUJNajhYOUpMcllNR3FK?=
 =?utf-8?Q?Kd5+s3Mu9bLjV/xA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ed404a-b35e-4662-b1be-08df21419005
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2026 11:29:18.1854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lVa/BwugjH5MhyfiEv5dOUJsix3v1D1c6Jcl+3iEHOEM2Oz23k/92YXT0yRTYWVAOBwvvcs/6PcmzZynkiaut9NfH/fu134Ur/zuiqRo3sUR6l8+E0op4XGvEfimzjVH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_042955_546759_D0F6164C 
X-CRM114-Status: GOOD (  20.94  )
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

Hi, Jerome

Thanks for the review.

> On 2026-08-28 02:56 -0700, Changhuang Liang wrote:
> > Add peripheral-0 domain PLL clock driver support for StarFive JHB100
> > SoC.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > Reviewed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> > ---
> >  .../clk/starfive/clk-starfive-jhb100-pll.c    | 60 +++++++++++++++----
> >  1 file changed, 50 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> > b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> > index e23365164497..f6ebaaf5aa18 100644
> > --- a/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> > +++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> > @@ -30,6 +30,9 @@
> >  #define JHB100_PLL4_OFFSET		0x18
> >  #define JHB100_PLL5_OFFSET		0x24
> >
> > +/* Peripheral-0 domain PLL */
> > +#define JHB100_PLL6_OFFSET		0x00
> > +
> >  #define JHB100_PLL_CFG0_OFFSET		0x0
> >  #define JHB100_PLL_CFG1_OFFSET		0x4
> >  #define JHB100_PLL_CFG2_OFFSET		0x8
> > @@ -417,16 +420,21 @@ static int jhb100_pll_probe(struct
> platform_device *pdev)
> >  	unsigned int idx;
> >  	int ret;
> >
> > -	id = platform_get_device_id(pdev);
> > -	if (!id)
> > -		return dev_err_probe(dev, -EINVAL, "no match data\n");
> > -
> > -	/*
> > -	 * Instantiated as an MFD cell of the sys0 system controller,
> > -	 * which owns the DT node describing the PLL registers.
> > -	 */
> > -	match_data = (const struct jhb100_pll_match_data *)id->driver_data;
> > -	np = dev_of_node(dev->parent);
> > +	match_data = device_get_match_data(dev);
> > +	if (match_data) {
> > +		np = dev_of_node(dev);
> > +	} else {
> > +		id = platform_get_device_id(pdev);
> > +		if (!id)
> > +			return dev_err_probe(dev, -EINVAL, "no match data\n");
> > +
> > +		/*
> > +		 * Instantiated as an MFD cell of the sys0 system controller,
> > +		 * which owns the DT node describing the PLL registers.
> > +		 */
> > +		match_data = (const struct jhb100_pll_match_data
> *)id->driver_data;
> > +		np = dev_of_node(dev->parent);
> > +	}
> 
> This is quite ugly.
> 
> It looks like your PLL is a building block you'll be re-using.
> Just make a module out it and re-use it is different platform drivers rather
> than trying to fit all your devices in the same platform driver.
> 

Got it.

Best Regards,
Changhuang
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
