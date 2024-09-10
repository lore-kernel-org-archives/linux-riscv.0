Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1102BECE564
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 12:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZ+y22asK0k5bROG3rpseLzAopzyqp7HwRp+8Uv921I=; b=avabRGpRBQewxj
	gcddWPTfcFV6KPZs6ICgrVMrBl7fWgRu3PQYmounLro7Pe/9geSE0WpFBMgv57VRLjpp0fkjh5fzq
	QRMaGDfvyxf53+vS6BArkDOZVSOfzxBLlxr4h8mGgMCZaUii9GvG9+BRwWMdWWp196uvRaZHjQyjQ
	tUrRVoc6jyAPEMp/m18L0SMpTiNsETpxde6W6V9Dh2EN3LUalBxMorhs7jQXHvuBRVQHwIXM6iyUq
	0T1PH5gQ/yi+MoTSAUoef5/ARJhTe3t6cbqtoa2WKtOiSHhJq9AQPO/j0C4Ri3kPv0AEooXwAy8fP
	WOuUM9MZrrrsFbwcPm4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snzim-00000005Uzj-1vkH;
	Tue, 10 Sep 2024 12:11:48 +0000
Received: from mail-bn8nam04olkn20824.outbound.protection.outlook.com ([2a01:111:f403:2c08::824] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snzij-00000005Uyt-3Ata
	for linux-riscv@lists.infradead.org;
	Tue, 10 Sep 2024 12:11:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utEFZNwtlHcPTOc0Z+UWTWEysGhu/3R1o4ukKElHNm9+5MRAkSpXjGc0jO1GvnfrA4kgTXgY9mkI66lZ/u9OOqTzTkEeWeWlnKwu4hbkekTiANvo6l2YH4Om2ZGMIyQmxBWVG23NqBLkHNPME42pm/owqq5uOh0inSJ5HSwXm82xhGWeOYMctR2CouCojgMpi3KWsEPfUPe5PFPIqLlpTairgbcWF+eJBz95m7N1P4kC1Quukm5HuzPH4JsvVdh/7Cogf3un5HHt3PhHtq2MqaV7RvQ63VvnLSXOUV1//AlKhZWLmlxAnH3qmW+1TEAF+d73uO3EycPdZ0FoEU/Zuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gub6+QpuKKCvDS56vpFaPILriiWGWd+1y5sDu+JkAI=;
 b=XWD7LGoLRC5I9smMU63XZHMdFunkY0AcZuvKeGT1xSKWto7QCvRki6IVlRjLownOjoNJPNaqg7+OyxEumUZYetFDHyXAKTRmHsiioDtuZxJPCjkPhZnZK3ux2yI5cE+abnqlwk6UN/xAKmqve03CXzE9X0fYfkPWMwHZMLhYdTf/SVFGGAN62OqUEBc2ukL0jq2mRv2Z+ajjYBU5HFyxcaDlRV3UNB5x66ceq1PBc2dCz7AGbcrvXaYKdUA4pFgf44clJ3X6jdgcP4qlaiN2oN/IZLgd6gHUO6KHe+U0LNujiKPLmhqlqEmq+qHDfrQBKyTpZYxOcDNby1VT151/Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gub6+QpuKKCvDS56vpFaPILriiWGWd+1y5sDu+JkAI=;
 b=CgL/RK81F2kR6QxiBx0D5SAy3XMb8qvJVOgAucKvALZnaslDlSYi8j3FCjVjF/qf6uGDkktxk66kk+FOJXgG4a4b4DAqQfMl65++708BHh8JP6hJG8Utez/aCufjOKckuHwScLh+QpIctbq6OHQfTe6Ra5VY5RBD09Uub3sEySLZn+t1YdLTuzkz3zpOmiAbO2wZi9n10Rj7jv48XIFTxPyMDOO5nDM6OlZHWiQRf9AQVzm07LKU+0vX2vyrIEHpc5CZIRfidH2Smk3OuSYlOWLmXBfOVhDhxC/qrz7cCFvU48PPIcCi0NchU/2Pz84JMGhmzhgh1cVhkQbZIuQkeQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV3PR20MB6956.namprd20.prod.outlook.com (2603:10b6:408:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 10 Sep
 2024 12:11:41 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 12:11:41 +0000
Date: Tue, 10 Sep 2024 20:10:19 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Drew Fustini <dfustini@baylibre.com>, Haylen Chu <heylenay@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v4 0/7] riscv: sophgo: Add pinctrl support for
 CV1800 series SoC
Message-ID: <IA1PR20MB49539E3E2083EEB820B781BABB9A2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953281633974BE4AB4887F5BB962@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953281633974BE4AB4887F5BB962@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [NOhOw1qPnFIy7tzsDIkZ3Mrrn3nbHne2eaX39u8flEk=]
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <s5clhds37zyezagn6ibe5skp2mi6cfunzzl3bm7jnrshn4w5qa@35k7v6vzf4fe>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV3PR20MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a806736-f012-4b3f-6d07-08dcd191ba5e
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799006|8060799006|19110799003|461199028|5072599009|6090799003|440099028|4302099013|3412199025|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: ambYZWGO0HT5sNVpJba7znExMGUppJVXU8SltEFyTl9427ibh4jvJi1K8NlMe6OkYZ1F7Pn6qyMggEKhgUGibhZTMIxolJAIG2Jp5ASyxoDAcF5vdoa19xmJ2lDL4brl1NAuRYru14P94KafGs+xZy+qgUyA6X3Lcj2BpdQcYfzO+QyLGeqE80FT/sogloTH1Fg5Ckb2ZxB1Yd7MpC+Y7c2nsxJxO7Ew0AtyNfpMpA7EmJ0fwcMlAb/EcarwmGaQsLJ5DYYsVaNCKK+D7IF5l4kJoykKBwiDt0CPaqQo3Jy4pkwEW7f8Cx20CmeUjmF8tc99lpatgMKVYJuJRGQUDOOvfv59VStniSwLQEu4WldoiRGN7L4p85YdZF23i9Pr7q8fBSPmrfLuO8Yd37VKf6a/xb+qhi7tt/aTsHG9AJ2KguPdbZfgxMny9wGe8WJ2DTZF3nkLfHMouEbZUyHbJ1DqjYcv9Eat/w07esnh+u8P+0o5fowDboQdaZyp1jqxL/iwBp98xS0tLVxdNUOKIYOuzPITDUT1OviMgU+WHT/MVCa1pX7P8rNXE2hxGYg6R3LUfV7ldWDZsLRvmLCD0hEY+QY+Fb7tgC1VPgYHyHFbS07D/2lEs/W3Gef9U1IbwtFRQ3TMBacl+dSYX0tyu+BrB2S9EWueYq2dgocfkqPZN7Kaf1WuxiKgkzPkp7N6g6Y6QwXaFRCkTFNiKgWBeZ7OQfu32s5pZHu3cCrpqWSqA2V2b+a6clG7526TYBFWftLQt8juyOfiPe1D/rnXC5GHcUyHzuVdyivRGhgUVzo/+Xl8HJbkKQdYknlUUG4Z2hehjw6QwqANchl/gTPUq5TDiuV70FwrX4AC5C7w9ixkHCcvzfIR3NxAg1jtSUWd
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zRlQ857JG4rQ3h/m3DeEnKNTbi2YPseglPfzThrhf3Vh/PPLcvGGflVol2Qj?=
 =?us-ascii?Q?Wp3af2UM5z44dHDRHI8uYpkJ6bf0g5uShLWEZwZQn9Tx6CRHZnZ5Z9piiWhF?=
 =?us-ascii?Q?ILpqE4+jeJ5WZ8/YgQnKXHHo756dqQcrGYKZuhbeB4ypwvL7dp2QruRspExJ?=
 =?us-ascii?Q?mSCJpG+gT6YVpbtiMreRT2wIQShgAyiSPuL0k4MgU7jBQGYefOnztC4VY5or?=
 =?us-ascii?Q?R8HHTkEWyuJB1Rd/35DxlCF0rkKJwJMISnKte8iGD8dfEpwwR+Q1XxZxlZ79?=
 =?us-ascii?Q?N4wQhMyOk1st7k7HRLis919ZYSDE/DvVpHeLYuQB0jCpMEF4czd4KMhi7FDi?=
 =?us-ascii?Q?ymb8vKnQ/VqRsg9loR/5XRjPjwsty5HJ0X2LBCxiJVgHRtURBkVPJiVnPIZU?=
 =?us-ascii?Q?HzzCg5hzuRHw/4o7rlF/Md54Xk1iaR8PWeJVdJUn5nirSVJem4tEHysxUdh8?=
 =?us-ascii?Q?Y+OQPSZUjjGFg9sgjHPqcIndSjnkP5cwECvKmqCb2n99YL4fvVUJbg3v3NcM?=
 =?us-ascii?Q?1n81TefjbLGrJbVLA62gJcq+QT6nAVwPW0WDwDlQTFK7S+lKnQD/aEMQ69jT?=
 =?us-ascii?Q?HCfLzOXfALstbaIqZclMFycDDmd+s1hPG+Sf1mRFn1L1jRXlI6vYb+Y/rd8E?=
 =?us-ascii?Q?y3c65gNitPs+eGNP4YuLPgVxKN0R/qa7AesQarO0NxrCuTupwGsa8BXJ07Sg?=
 =?us-ascii?Q?b+GbTxKyIrZ8Rl9Zak9nwcEZPT2+iOQFOwrXXgqsx8UvoUoVgrgqMb/3bk0F?=
 =?us-ascii?Q?jhmtSUuF9fQk3gxiT8fiwWYF1FOkYJOHr4nZu9XAX9SoFss5G3kT4BXZrrKr?=
 =?us-ascii?Q?2fCUNTsdj5kiNNkISQo7OtFSdrd59AI0ALxrbEnH/cBpCcDchZ+xH6RfKYXq?=
 =?us-ascii?Q?1Bk1zzrFa/a20N46wTTng3kNUJEkcz2NfhV43bqRDVL1OavdSrRFkJJwmtSW?=
 =?us-ascii?Q?iQEI56/3xEPFmThvcH7KlzvfuJ7SCsbDPKMIuMBbhU1bACQSmUw6i3CWNDgD?=
 =?us-ascii?Q?DHGFwDQbfm1GQbD9AJqK2kuNZ1wFtNnJ89Z0c9ZJJMd+XW2MBkskoi/nQGi9?=
 =?us-ascii?Q?OQj37vx/UZTdbB2bSqlVDhkhE8m1LkVCjGem57EGcwWnzF3atjA8dzf+i0cy?=
 =?us-ascii?Q?6I8/QKoI+8woXBmlscd+9FDts75H+GBsNTeK4NLTq2y+TBI1qk4pqQyKbUtW?=
 =?us-ascii?Q?p3cNSTCgNRmdya1dnweRygqiaJWy+AStT4keuxkmo3GtuFqLwQgkxn7wsXM5?=
 =?us-ascii?Q?HpByGvgu4t53H4Z4/X51?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a806736-f012-4b3f-6d07-08dcd191ba5e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 12:11:40.8773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR20MB6956
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_051145_823374_F09D8CFE 
X-CRM114-Status: GOOD (  13.25  )
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

On Thu, Aug 29, 2024 at 01:08:41PM GMT, Inochi Amaoto wrote:
> On Fri, 2 Aug 2024 08:33:58 +0800, Inochi Amaoto wrote:
> > Add basic pinctrl driver for Sophgo CV1800 series SoCs.
> > This patch series aims to replace the previous patch from Jisheng [1].
> > Since the pinctrl of cv1800 has nested mux and its pin definination
> > is discrete, it is not suitable to use "pinctrl-single" to cover the
> > pinctrl device.
> > 
> > This patch require another patch [2] that provides standard attribute
> > "input-schmitt-microvolt"
> > 
> > [...]
> 
> Applied to for-next, thanks!
> 
> [6/7] riscv: dts: sophgo: cv1800b: add pinctrl support
>       https://github.com/sophgo/linux/commit/1728c7e408c6e5ef1c6f3a2c7f75bd20139c2e13
> [7/7] riscv: dts: sophgo: cv1812h: add pinctrl support
>       https://github.com/sophgo/linux/commit/2926c05f9cb7b5bb0374fb7a53bffd65937a454f
> 
> Thanks,
> Inochi
> 

Drop the apply and favor the v6 version:
https://lore.kernel.org/all/IA1PR20MB495301A1A08224486DD0239BBB9A2@IA1PR20MB4953.namprd20.prod.outlook.com/T/#m4acc4e2a9652cb3f5a3ce54deaff52a827b80649

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
