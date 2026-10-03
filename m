Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B52CA5FEC
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 14:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=so9iXNAlOHByurUnHnTuKjCz+jsP6jueQ3RROVoPBhc=; b=sAa9LyI3BKA8Tb
	hEd3l84tjTQ2FaIzwizG0D+UoRb/7E4PQ3tYbbWRNVaBAcEary9vIsNRN2FI2swX4tNNA6qFTd2H4
	hutG96NnqT9pIRfCrTfUcW/in9OKjgAWmkVo1Frg0CAoTIx4J69ENphWcaqDiMBfZgPRXpR0mYc4b
	FhE5TGveWAz+g+cKggWNh81EhOsKKZzjab60qFJV0jqJLjmrnwMOFPHQFtQ4vmTdlzq8M1xDsBYIN
	w+RpeVen9gRneeX6AH1m/U9oAPBVOY1lzd4dC8eK9Mce7y6rZnQUo6V/CYk5GpYN6hioaLXaTutFh
	hY40HI2nQCxgVV1HszlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1Ct-0000000Dexn-2snG;
	Sat, 03 Oct 2026 14:59:23 +0000
Received: from mail-sh0chn02on2114.outbound.protection.partner.outlook.cn ([139.219.146.114] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1Cp-0000000Dewy-38oB
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 14:59:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6YErTKQGCzlyjTM2+gtlKPiPoVXDd+/H/3tUE7+adoIRc76Yox/29wyucFRpIipG7BzTWJnXkf/RtnPJLHeAapXVK/tLUgVz6WqUmfbUDn/1XI61NpRqGVXVnWI+VnF+j1wRvEOzskXij4mK0EpH8TQy+pXZYFgjAU5CCz9QD4jIpzW2qxmypm7xgtD6/LQzPbtLwNsjVe58Cbrm/E5sodd+Ha9BvvC4Zmb7GPV2oIDL2Nsz9PNgn28zYMet9zdG6uCJyXzadTDXZxkP7nC7H2/dV/kJqoJszAu7umea66wxNsrwRqPKjpgNF1+uyJxE9IVaa/VYtc9oC0SVqHoRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErF+nVJ1irFUe1VPtZf8+RRCtaco77YBpg2DjJ/+Sqg=;
 b=n3HtVwyy6I91peMDzc9Luu8cANCwOGsUWZ8jQQzlbQO534cx/M77UjhIhmprQxs9l6k2bcbDcuVdZhBIydiwCnJTXfScsFDAn+5ALkpbgxvM/kEcfu1hJm83ovLdBY/MCq24OZu6q4d6Mf6j0rn6mk3hlof7TgcEbt2JkYR5CA9CEEsmqI8pKHwo5J342RYoSwvOEXSAFfxl/yB3/KRpStX4mKOhS7APPDncr1jSt6Xq27fA++FQfXPPsw5MzaLxS7yydNkuBxvjQLI0EnDscdVeC0fv+IAygydZtZ6cyAK47leEpS8yWSbzGbyd547vfANLftS1ieOywArq5tzJ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1316.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 14:58:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0472.016; Sat, 3 Oct 2026 14:58:37 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>, Michael Turquette
	<mturquette@baylibre.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, Kees Cook
	<kees@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, Richard
 Cochran <richardcochran@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, Hal Feng
	<hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 04/23] clk: starfive: jh71x0: Add generic CRG probe
 helper
Thread-Topic: [PATCH v5 04/23] clk: starfive: jh71x0: Add generic CRG probe
 helper
Thread-Index: AQHdUNlRawWh2JdtEUKeuK+GUwNiv7bqnEuAgAFRVqA=
Date: Sat, 3 Oct 2026 14:58:36 +0000
Message-ID: <ZQ4PR01MB1202D07FB728EF122C00C359F2882@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-5-changhuang.liang@starfivetech.com>
 <179096707363.821688.2728247121300145722.b4-review@b4>
In-Reply-To: <179096707363.821688.2728247121300145722.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1316:EE_
x-ms-office365-filtering-correlation-id: 815e6547-766a-43be-6080-08df215ecd7d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|18002099003|22082099003|921020|38070700021;
x-microsoft-antispam-message-info: 7ZLwuUv8RseMugt4pGjjbQ5Bne4S8Ryia/D5HCWuU3U44pnwKSzgHAH//pJUp3rNyvsp3gtqnmlRTHzmZmLUFkk5c6co3KUGM95yUX9i0U/BwbBaONHAi4i4uDJ+AOY54H7YUjQgSl2WsS2Bd69t+I2y+FCAvukQPB4LW4a3g+V1fpiFqA9ZSHxgjWs4mjjjnYtStTHPm5w4y2OXwO4fz9W013lSZXGkSHs9C31B7Xo0CCLbU/n5RCcBnphitH4kf8CfyScBRt3QbHvdpgMQtv6FkiYKLpSoGoFqNglO2kjDDjr+GlCgj0hDEOv8HPBzJjT+7VDDqr844SThRyrhQnJQvkxCu+6luzoCpbePagPjMCUQ+3PPpnGPX7lY9+4pwv6i9PWTNS7vqCMrrjftSZEFW6iihGdIBkoLuzeu6s3i1ctthFvaP/md9i9Be/0esQLHyg3y7ZwOl+kXzUlpsIY9vvY9BkHTF+OLFYMtdNwqEDCFKD6KQbt3l1T94gJwTE+6eSIA8BlbPPrDr5BkTvRZI5vTvklpffBZ5X8DZ0+lHTL/0l9kOnljMcsBzJvYYi+jHDyWt6D7NPhJyK2gMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHdha1NROVpBcml0c0I1dVdvNG5YdGRrR3NyN1Y4TnpmamlLUkM3U2YvL1RJ?=
 =?utf-8?B?dmtSRWEyc3hqczJQbFN4VDROamhpNzlvZHQ2WHhLdEN5b252ZmhXbXhLY0tu?=
 =?utf-8?B?V0RKMXA1TlJFTGFKaVRSbjR6VmpQY0ZmR2N5RzVsMG9ZMEFTQzJtUjZLMWM1?=
 =?utf-8?B?YTQ5Ni9Rci9mT1R2UklCVDlpUVJuTEUrYXZxLzVDQzE3VFhHZ2o2Nno1VzhQ?=
 =?utf-8?B?OFJ2dU4xTGFhMmxJY3FIWnVCUC9NajRlUDhaUEJFdUNnNTdPSy9QT2xDUWFW?=
 =?utf-8?B?OXNYRWJ5MEJrZ0ZTRzNEVWtyM3ZQOTJkN1ZsQ1AyMWxLRnJ0aENTMTd4V1RY?=
 =?utf-8?B?UFFlV0Q4MU44clR0RHVrc2Y3dmRMT0VYYnNxbmF4dzVob3pVeG5hcjJJWGxY?=
 =?utf-8?B?QXRhbGpLcEhBSEVNRXJlclJuNUxLQmVpdTRUMURQT0kwOTJsWWppa2FGZFBP?=
 =?utf-8?B?S2VPZDY0R09yL0dkZWZKb25sNUdrVXBOV3YyWVo0ZDFRNWFCNXhGL0F6ZUZr?=
 =?utf-8?B?cy9LZGwxc05rZ2JqdGJIeWhvUEwzSCthWW5FZHBKRkN5cTF2QkFSTDNFS09P?=
 =?utf-8?B?OFlmZW1zRkRaVVYvUGlWMEp1b1ZjaTRKUFk3RnJWb2xSMDFoa2lWZDZBcnNY?=
 =?utf-8?B?cGNVYkEvV1RSU3VNZklZR2xqZjd0OE1OQ29nQVpSWndpc29SRUorUE5FUlRh?=
 =?utf-8?B?d2hmZnY2UGZad2Flak1vWEM0dDRqVTliSEUwajRVOGFRY0tUTDVZMk9LRHVE?=
 =?utf-8?B?c0ZBbit3YnZVellPdWF2elc2UU1NdTZMMUJHaWxiZExyR0tlQzA2QkZkY3Rv?=
 =?utf-8?B?NmxOeG5JYlR6aFNNeWVlWm5LM25vRzU0N0pjaGlyMmdLVDdlS1loVWlOQ0cz?=
 =?utf-8?B?emR6TUl2VnVoRFVFclh3N0JjdVJ0SFV4ZkZYSFBOWC96Y0JCQ25ObDhjZlBs?=
 =?utf-8?B?VFgzUDc4TitzbS8yY29GWWMyVi93cUtXQXgrdDJHRENCM2piYS9VcGRsNWJO?=
 =?utf-8?B?NmV2bkRGWEswd0RmaDN3bmc0WkZYWFFNdlhjUzFWbjVuemRwSkI0MWd1TWhm?=
 =?utf-8?B?Ny9DamJOaGwvdzZnSWd1bjgxYm11TjBTbmtOUXh2Ty9FSkVIS1gvajUrQTM2?=
 =?utf-8?B?TXFnZWoxT2pJdkVrR09mM01NV1R5cVNQS2VEQkljOGxMQ2FGSlRwcnQzRGtO?=
 =?utf-8?B?Q2VwTFlNREM0NWRlaXEzSko0UnVLSVNBbmJSQ1dZa1MwK3hmUFplOFl1eU5w?=
 =?utf-8?B?L2RYMVhkd2RhY2U4T3JHWlRvRFdSUkFVK2JtZ0l2cmtid3l2ZFBWaWZOci9I?=
 =?utf-8?B?YlBNQ3dhL1lHdWl2MUx6OStsTEtzMmNMVVUrcDdzejdxL08yeXprK1lSSitZ?=
 =?utf-8?B?c000N2tjcFNzODBUY2NBNndZSmFpNzE1U2VFUkFpTmpNbWVHZk50NFFTTU5R?=
 =?utf-8?B?NHNEOHBMVlZaeTIvQTlOeFdIaFdBck1PNDQxSWxvV1lvRHZKZTIzbURBRzAx?=
 =?utf-8?B?VVNhSnk0ZkVLYWpub1c0ZFUzcVJ4ZkZhcWMyTFlJaS9OcGVwc3dkWFY1aFlU?=
 =?utf-8?B?cnl6TlBYbFJjZ3BSdGdyclZ3Q0dQaWNWaDdvVFk1WTk4c1ZDd2VuTE5PRldS?=
 =?utf-8?B?NU1PRW5BNHh0a0FVRldKQlBXS3BXUSsyNlZRTFF6QVhYMkFlbGxGUVVUNmk1?=
 =?utf-8?B?TUFjbCsvbEoyVDR0YmtIdGlWUWM1Yk1OYVVPaVYwOGlob0NWU2ZyTGQ1T1dy?=
 =?utf-8?B?eldmODB1YUVML1NxbUFIaWkxRk8zWkRiYzFPODR6T1F5eDYrRCs4QllJbTVz?=
 =?utf-8?B?b3FXQ3FBTk1vbkkrWWZTMW55RHl0aE9QbWFYc0FhVzk2Qk92dGM5dzdNMXlZ?=
 =?utf-8?B?UVNTVStqMjMxRll4N3ppOHpGS0FJdjFrN1BkNjYvaE1ZRSs0ZlAwWWF2M3dr?=
 =?utf-8?B?RDRvNS9wdFc0eEFDS0lZWVhqdzVPK1YwbUR4SGdjRW5CV3N6amNyRzJkNDkx?=
 =?utf-8?B?RExSN1p6THlBZXE4YkJZeElPMmZ6OUZNMWMxckkvblFQZytlYjNrdERYTkVz?=
 =?utf-8?B?UktkMk50N0NaQzZUVkxOYXBJTE5oRHowV01KTDRjTGllR3R6eTE4SVpzL21U?=
 =?utf-8?B?SlZWWkF0ZkxHajlqbGx5U1ptRWM2UGJiMVJYbm5vcjk2NXBTeG56enk3QmU3?=
 =?utf-8?B?cXpUaHlGenk0VVNvQjhzcWxyeEpVZWt5R0EyZFNZeWhPeXpaMFBjY2ViVjlj?=
 =?utf-8?B?RlpVYXFwWityc1MyaHhkZWIwZW5rbit3ak9COUR3VTdsbTQwSzk1d1J4bncr?=
 =?utf-8?B?a1EybC9uWFVBZ0tPbjVUTmxUOTYzY3hZaDJQbDJDRkxyc0x4U3ZBb1lpYXVv?=
 =?utf-8?Q?1wvAxFioyZHZ2YW0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 815e6547-766a-43be-6080-08df215ecd7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2026 14:58:36.7322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IBRRK0xXReywNX1G1W04iB8mil09OgbMRQEvV5tyA/zd7QE0iVb9wqTW66HBhBNj1Qm6u3+gG9OdyXIBwFSh3rGWt49CvLQXXI26EB8fqtIlIt+kzyml2M0rZClCG6hy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_075920_308897_AD15C54E 
X-CRM114-Status: GOOD (  25.93  )
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

Hi, Brain

Thanks for the review.

> Hi Changhuang,
> 
> > The StarFive JHB100 SoC has several clock and reset generators (CRGs)
> > which share the same probe flow: map the registers, register all the
> > clocks described by a table, add the clock provider and register the
> > auxiliary reset device.
> >
> > Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
> > that each CRG driver only needs to provide its clock table, external
> > clock names and reset auxiliary device name. The reset auxiliary
> > device is registered with jh71x0_reset_controller_register().
> >
> > The clock index space of these CRGs is sparse, so also make
> > jh71x0_clk_get() reject indexes that were never registered when the
> > domain info is available.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> >
> > diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c
> > b/drivers/clk/starfive/clk-starfive-jh71x0.c
> > index 2cc71f49ddee..bb7706ede1a6 100644
> > --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> > +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/debugfs.h>
> >  #include <linux/device.h>
> >  #include <linux/io.h>
> > +#include <linux/pm_runtime.h>
> 
> Add #include <linux/property.h> for device_get_match_data()
> 
> >  #include <linux/slab.h>
> >  #include <soc/starfive/reset-starfive-jh71x0.h>
> >
> > @@ -334,10 +335,14 @@ struct clk_hw *jh71x0_clk_get(struct
> of_phandle_args *clkspec, void *data)
> >  	struct jh71x0_clk_priv *priv = data;
> >  	unsigned int idx = clkspec->args[0];
> >
> > -	if (idx < priv->num_reg)
> > -		return &priv->reg[idx].hw;
> > +	if (idx >= priv->num_reg)
> > +		return ERR_PTR(-EINVAL);
> >
> > -	return ERR_PTR(-EINVAL);
> > +	/* Index space is sparse: reject holes that were never registered. */
> > +	if (priv->info && !priv->info->clk_data[idx].name)
> > +		return ERR_PTR(-ENOENT);
> > +
> > +	return &priv->reg[idx].hw;
> >  }
> >  EXPORT_SYMBOL_GPL(jh71x0_clk_get);
> >
> > @@ -391,3 +396,87 @@ int jh71x0_reset_controller_register(struct
> jh71x0_clk_priv *priv,
> >  					jh71x0_reset_unregister_adev, adev);  }
> > EXPORT_SYMBOL_GPL(jh71x0_reset_controller_register);
> > +
> > +int jh71x0_crg_probe(struct platform_device *pdev) {
> > +	const struct jh71x0_crg_domain_info *info;
> > +	struct jh71x0_clk_priv *priv;
> > +	unsigned int idx;
> > +	int ret;
> > +
> > +	info = device_get_match_data(&pdev->dev);
> > +	if (!info)
> > +		return -ENODEV;
> > +
> > +	priv = devm_kzalloc(&pdev->dev, struct_size(priv, reg, info->num_clk),
> > +			    GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	spin_lock_init(&priv->rmw_lock);
> > +	priv->info = info;
> > +	priv->num_reg = info->num_clk;
> > +	priv->dev = &pdev->dev;
> > +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(priv->base))
> > +		return PTR_ERR(priv->base);
> > +
> > +	if (info->power_domain) {
> > +		ret = devm_pm_runtime_enable(priv->dev);
> > +		if (ret)
> > +			return dev_err_probe(priv->dev, ret,
> > +					     "failed to enable runtime PM\n");
> > +	}
> > +
> > +	for (idx = 0; idx < info->num_clk; idx++) {
> > +		u32 max = info->clk_data[idx].max;
> > +		struct clk_parent_data parents[4] = {};
> > +		struct clk_init_data init = {
> > +			.name = info->clk_data[idx].name,
> > +			.ops = starfive_jh71x0_clk_ops(max),
> > +			.parent_data = parents,
> > +			.num_parents =
> > +				((max & JH71X0_CLK_MUX_MASK) >>
> JH71X0_CLK_MUX_SHIFT) + 1,
> > +			.flags = info->clk_data[idx].flags,
> > +		};
> > +		struct jh71x0_clk *clk = &priv->reg[idx];
> > +		unsigned int i;
> > +
> > +		if (!init.name)
> > +			continue;
> > +
> > +		if (init.num_parents > ARRAY_SIZE(parents))
> > +			return dev_err_probe(priv->dev, -EINVAL,
> > +					     "clock %s: too many parents (%u > %zu)\n",
> > +					     init.name, init.num_parents,
> ARRAY_SIZE(parents));
> > +
> > +		for (i = 0; i < init.num_parents; i++) {
> > +			unsigned int pidx = info->clk_data[idx].parents[i];
> > +
> > +			if (pidx < info->num_clk) {
> > +				parents[i].hw = &priv->reg[pidx].hw;
> > +			} else {
> > +				if (pidx - info->num_clk >= info->num_ext_clk)
> > +					return -EINVAL;
> 
> What do you think about adding a dev_err_probe() here as well to make it
> easier to troubleshoot any failures here?

OK, I'll add it.

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
