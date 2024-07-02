Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ED6C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 01:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOu4OLkKIx7fzEpCYlU28YqQJbFtUArNxMH++vhtisM=; b=boy8zRUYpgVjDx
	bz3dT5hm09+WBOkN5mfFtVaX+wiqm81QROcpvJaKFvSMpvV/zN3kqTNanTOxgT26cuQdN9OiPoQAK
	Ia/iB5KpFDTt2l+ImDzbM/YsEW79+fzWStjXtFTkL/9vnV0oZQ4yB6MpYhf/7i52qHV8hiEVTp2uh
	mQWeNaF9PeV9WvtOraLyNzV8173L1A97RjCC8chbw65pDBUjYo1ERLQXrNpGDNWCoxl34nUCg/n2L
	H4tcA8Fi0D6ixD/uLJkxezOEm/j4lydc7cNp1rtUmx6c+VZsa2Umdlc9uo+I0/cYqC3afL6Icf9yK
	INBbyfvqMLPIZRNeACVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOSg4-00000005IkK-30Q9;
	Tue, 02 Jul 2024 01:51:28 +0000
Received: from mail-bn7nam10olkn20830.outbound.protection.outlook.com ([2a01:111:f403:2804::830] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOSg1-00000005Ijv-3go6
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 01:51:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4K08HN4vA8HAVIlR1lgbtiqra7nYHSPvQ78uZ1z2xS7PQyCHg8P+6DD5LyoxVJVlmuBxQtZl3AGFaAP58zQIpXUeoJyG1zavnEV0dDpF+Pjdcy1xQFOCzgvXgpWNUgwaUy25S+B7uDVXNlrBDruKlUC3P0zoOtryu7bsxGJPI956QMuiGPy3eayqMR2MF7JgH1+6y8Ze1y1AUNEq/YADfrXTXbOC+bR1j/AejhH3aI9Oie/w1Jzdx70pYPCw671Sj2XamXF/sjSZa62+OtqEFozxlEZzR7CimT/dTYi+/vH4rTM1CkB8Q7Y/HbT8pkS59CsS/ifpEjb3RH9wo8tkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WPjHP/S1IIzElQwfOo2cSFn+MB76pIS0AxwupfRnzQ=;
 b=jnlb4982NQoaHM3Pl5+UtynjQK+Tapy3x+eEJ64SdeUxqJ5sd+9Qo4pTfVWl7Y3GJB1eSYO/Bqi5tFJzDJxorgTO7hSgofutKHG89sm22gHaR2pjhV8ccdT59bDIyq020S/OiHt0UN1w/lY79S4YLBH3h85Q513ObcDnWJP5NAiqTy8yJTRC96TU5YeXdRW8nPTLMkxtHdmHtyNprqE/FH2RFf4Ve7FqkgIDE0OZHE4MmvkBUSBKFh5gEeVLVLLtodUnqK7pm/Jsy361ghCo2cDaP+DI8dxjF9/m9bwt3Ulb1QgoGOudn/Kpjoc7CdyKvIcIuuN2XMqIS36hBKR3Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WPjHP/S1IIzElQwfOo2cSFn+MB76pIS0AxwupfRnzQ=;
 b=D7swGK32Ov2QfF1x/IgLsIDUATJYMsyG4H0K0DhfiEP656S7LKe/O81HmrF3/knS+a0iN8Z1um5xLMeMY7pYy3h6bT3HJALL9GPVQoXOX2QwU6qBMCe9ys99xofMRGQOcjj/iJsTgUIwB/nA+HmxrC2RHKcDOkEmoWxBTw2it0S5IKFN/ZF2R+ZkIzaQcmoY9FlX5+AlSMPydBjDKT0mCkZa9GBKaXFgWWIqZP4feDL4gGslHYl8Hu5Op3u3/BH4Fr09Z2Emkr+lRymnThLMcPv3ht69EwY28JvAuPh5OWTjjpmYxycCK8ehvqm1kk7/fl7goJQkSbOcV2MkBtNPmg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CY8PR20MB5667.namprd20.prod.outlook.com (2603:10b6:930:9a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 01:36:19 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 01:36:19 +0000
Date: Tue, 2 Jul 2024 09:35:45 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Yixun Lan <dlan@gentoo.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, 
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2 08/10] riscv: dts: add initial SpacemiT K1 SoC device
 tree
Message-ID: <IA1PR20MB4953C031CB453AA0E51657B3BBDC2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
 <20240627-k1-01-basic-dt-v2-8-cc06c7555f07@gentoo.org>
 <CAJM55Z9jeAQTsVjRiLeofDm1RyMWCuHXC0a-pdKtpUiTkSjJCA@mail.gmail.com>
 <20240702012847.GA2447193@ofsar>
Content-Disposition: inline
In-Reply-To: <20240702012847.GA2447193@ofsar>
X-TMN: [MlqhSvHnadDixsBZ7tVVMjXU9M6NX29UWphUh9YvBLA=]
X-ClientProxiedBy: OSBPR01CA0118.jpnprd01.prod.outlook.com
 (2603:1096:604:71::34) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <shoyjtjck5az3hei74mv77cftolgfwzig7ttcjw634lfl2qb46@spijnk62wwvr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CY8PR20MB5667:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e7aadd3-97e3-411a-2ed5-08dc9a375eab
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: FmrxtIZiFS10FLpXTruaTnQ5Lt4UotYwQ7B/F5gurOHjUlS8ruWJNLaxB29doy2cMwZLvJJPHjYRMcBZve5NMH0LdZYat2ULYiqOunPeu3ds3wqmuJa61Hj4c4z+BE0MJ2o9Go/xnsmHadf3PUboHLFDQ9Tl1v2he2K8GBGndgdpVqCSuaNdAJGRYaM1+OOVAioLWdpOgSUknh2b5AaVJaZ2itKkTukIbGbUjr7aFS2E5WsOCwnFDdnjtKOHz09GkzjgtUtLQJX42gwc4TlPvoSJUuJorxaiWLb6QlHs1qZdwJ+u+pP2bDC0FsnrWPVzUYBY32tTBZtQB2OpM0kZSq82Ufj7V07vLLI9X0OnAnrTRl4/ih8G3dEmyBfcHpgc2BzptdB1WfMShN4z6BC8H3BmQ+V5mH7UoJo4v5ImWlEEVuaDV+HrOFskjKnS759gtjAfI14WVPjBNa6tGZ26+gjHwvuQq0dUCYK8rNV/yuyRDdn4rNTmwJUfHjSqaDI/oh8Y2EodTsZTaPlJu1tuKrImIUlikeWVxUy+tU9QuJPVI0C/Slj9yDjuAgYnchf4KX4j5rXZVgls8d8Vj/50u/OEiToUZaMKbBKfY6AMU1Hj6NY42vKQkW6F6Z8BlrdwOzans2DrpA3X66rVyZNvEQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BtqJ/gbIR5ZPLZmysJlN3PUdh47/a/4hsGtj4Bm7fSuzhCV6KnYFlRfGgT?=
 =?iso-8859-1?Q?5pFFgVBy8kgJ5DVtLHZtQZDDik2nLEmqcP86G/fyIHo3i9jM2pq605qk8K?=
 =?iso-8859-1?Q?Bx8c68+UdQCwDGwyrN98+yIjNsQjxfHE44uQWvwCxC8QWyILyreVKCq9pS?=
 =?iso-8859-1?Q?dH3P6uSSnZdbemrOMYK1crgLmc0Bo7TehApBnupnkz+hjFgJlYXn3xypyI?=
 =?iso-8859-1?Q?ObWxSN55xnUndOndIeARhsSgRJAEVDWGRfcgIwDOabGiwdtsziQJqeFO8P?=
 =?iso-8859-1?Q?vmjHee+UZk3v6yAt1HFzW3ByTQy2IAM41bOPLkXw+NSsW594JcVxa45PNa?=
 =?iso-8859-1?Q?WQXeZWlBr6rmxBfYIKkFfNjFokjdvBUsWyUWCCxXRS4m+a7H7JCBD85tYE?=
 =?iso-8859-1?Q?qVGHzX0LvTE2qpOJVb4FUKqdJO8hbhOoex9McCLP8hmhvKSeSYPYDKYBI0?=
 =?iso-8859-1?Q?/efgZmX4On39u4xXJkC/4bfJcoRHpM+GXKnR+9srohwsFTi8VSNSDxFbUd?=
 =?iso-8859-1?Q?4bp5c0cagbhBH2epwzOSdtLnAaS1njmYly5tgC+23OKC6K1eIYGJ8Htmk/?=
 =?iso-8859-1?Q?Lc/GddqeYKOchG9T+gCKBM1opfDw+eMf7Qs8q+ZwGm9C0GDPDjKm4BQXGS?=
 =?iso-8859-1?Q?rdeRSXg6Y1LuPa9UDSah5t8qJ3+UQ1yZeoq/bCuabwaF6z6f1zMxpf1J/V?=
 =?iso-8859-1?Q?9VSwe/EXunhdpa2czOUADKhqDH1RdleYNSYLFtev+q7H3G7+R+7ZMnipU1?=
 =?iso-8859-1?Q?27VqsG+S66opFOEW7Pj8R4b3FvAgyT7+D70h4BPJk6YtLbMOSKEPbBm12z?=
 =?iso-8859-1?Q?bhywsE1r+keT5xw5tb5/8QnrByQj3pfJMCsC0l2SMW92C5gJ7ZBqlN0fU2?=
 =?iso-8859-1?Q?sRc2/DAV77JwJG7iaf3zLLkQERQHNH2ly3zlPEIwUcJhCeivlLKx3ZbKTS?=
 =?iso-8859-1?Q?rJCgVRRa4xxvNKCOq6/LUQu7HtCD6sBJpK1ZDeB0icDRBGELRAp64s4ecL?=
 =?iso-8859-1?Q?VmJLmwGh94yyh7fr+Dx7s/IRJNVrS0LRtwz/sPEwoEFiSDB28V8FTdnoAk?=
 =?iso-8859-1?Q?/2dgCPh9EbYU8Ue5rnoopIhlbztIaX+J6PGGfYfBYONZVf6s+Dwm6cTA76?=
 =?iso-8859-1?Q?d5voQ0RCkfgQx9r1PyMLqOxSltJxTF2DQf4uVtWdShPloTLd8VhS4mNFta?=
 =?iso-8859-1?Q?QIxDUTnYpQasYVKoBxXHkCQmZMjfYub7MBHqEoNOKjn/micX3cfCN3PdHg?=
 =?iso-8859-1?Q?wDvRDP0l6DLr8+OmQg/AlkajWaesN3UoHvWioqoodaBYuq5jtQ6YPgJh81?=
 =?iso-8859-1?Q?wOF8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7aadd3-97e3-411a-2ed5-08dc9a375eab
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 01:36:18.9415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR20MB5667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_185125_932010_C2B76017 
X-CRM114-Status: GOOD (  25.98  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 02, 2024 at 01:28:47AM GMT, Yixun Lan wrote:
> On 12:49 Mon 01 Jul     , Emil Renner Berthing wrote:
> > Yixun Lan wrote:
> > > From: Yangyu Chen <cyy@cyyself.name>
> > >
> > > Banana Pi BPI-F3 motherboard is powered by SpacemiT K1[1].
> > >
> > > Key features:
> > > - 4 cores per cluster, 2 clusters on chip
> > > - UART IP is Intel XScale UART
> > >
> > > Some key considerations:
> > > - ISA string is inferred from vendor documentation[2]
> > > - Cluster topology is inferred from datasheet[1] and L2 in vendor dts=
[3]
> > > - No coherent DMA on this board
> > >     Inferred by taking vendor ethernet and MMC drivers to the mainline
> > >     kernel. Without dma-noncoherent in soc node, the driver fails.
> > > - No cache nodes now
> > >     The parameters from vendor dts are likely to be wrong. It has 512
> > >     sets for a 32KiB L1 Cache. In this case, each set is 64B in size.
> > >     When the size of the cache line is 64B, it is a directly mapped
> > >     cache rather than a set-associative cache, the latter is commonly
> > >     used. Thus, I didn't use the parameters from vendor dts.
> > >
> > > Currently only support booting into console with only uart, other
> > > features will be added soon later.
> > >
> ...
> =

> > > +		clint: timer@e4000000 {
> > > +			compatible =3D "spacemit,k1-clint", "sifive,clint0";
> > > +			reg =3D <0x0 0xe4000000 0x0 0x10000>;
> > > +			interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>,
> > > +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> > > +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> > > +					      <&cpu3_intc 3>, <&cpu3_intc 7>,
> > > +					      <&cpu4_intc 3>, <&cpu4_intc 7>,
> > > +					      <&cpu5_intc 3>, <&cpu5_intc 7>,
> > > +					      <&cpu6_intc 3>, <&cpu6_intc 7>,
> > > +					      <&cpu7_intc 3>, <&cpu7_intc 7>;
> > > +		};
> > > +
> > > +		uart0: serial@d4017000 {
> > > +			compatible =3D "spacemit,k1-uart", "intel,xscale-uart";
> > > +			reg =3D <0x0 0xd4017000 0x0 0x100>;
> > > +			interrupts =3D <42>;
> > > +			clock-frequency =3D <14857000>;
> > > +			reg-shift =3D <2>;
> > > +			reg-io-width =3D <4>;
> > > +			status =3D "disabled";
> > > +		};
> > > +
> > > +		/* note: uart1 skipped */
> > =

> > The datasheet page you link to above says "-UART (=D710)", but here you=
're
> > skipping one of them. Why? I can see the vendor tree does the same, but=
 it
> > would be nice with an explanation of what's going on.
> > =

> /* note: uart1 in 0xf0612000, reserved for TEE usage */
> I would put something like this, does this sound ok to you?
> =

> more detail, iomem range from 0xf000,0000 - 0xf080,0000 are dedicated for=
 TEE purpose,
> It won't be exposed to Linux once TEE feature is enabled..
> =

> skipping uart1 may make people confused but we are trying to follow datas=
heet..

Instead of skipping it, I suggest adding this to reserved-memory area, =

which make all node visible and avoid uart1 being touched by mistake.

> =

> =

> -- =

> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
