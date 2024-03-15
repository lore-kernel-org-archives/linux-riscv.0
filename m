Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57539C54E58
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 06:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTZEiS+d7CxYwEqFQFYk84OkOe7Ph5jGV0FBKGxBSvE=; b=GdJHtqTpXvzvIk
	GHdKeqiLlxrx9KHeAOG8EdpML5t7GILvd3ttWrV6lS+MPvQiUrajanOOYzPyBXIXl0Smtz6l5pTlW
	EH5nmXn1MvUT7iUUhzYpukjCCQuGf6Ut7II3gF4QyQVVaO3mQ8Z34zSozjBexZohjk4DEgEL4PFyH
	0J+mcdNFDdok9NUKGMqijmANDb8ZcZQ/AOWgMjxwzPDdU78oJgZ4jOC8Hsi6b9kKDV/Q59bNMMUI/
	qAV/gHwoHKjWHijyXAHMoD/L5EoJ46rF5OevcKQyKl31ww4+OXD1Uu301IrNKWp4oRwht7A2Mwzne
	Bh6it+ha2a9MKfzJvILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl0v8-0000000Gota-0bVO;
	Fri, 15 Mar 2024 06:19:58 +0000
Received: from mail-dm6nam12olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c17::801] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl0v5-0000000Got6-3dbZ
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 06:19:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0Blk0XDpxv/UL/9NdwXd5Aa1RwVhpAWSxwbceBaJE//Ls+i7IS7sa8WqB+us49viNZZKbDI5TRCNelAGCR8k6oJmeW96nzSNmGwFAMD28HqbUxILaboCiNrzqjrxV8q/osinIh4H1YocObjdobbt+Qy22qbXV5AsNJKYtEgGxvQgYEQpcRyJjKnVkd5kin4334Go/0/N/JxVi4EE+XkBprb5c6EAdThDYHiG52cHoe4zibiHf70IyaeUuVg+A2pycg2ebUe+tYuYNTVFiiapJ4ys1Fj0ZAmyFqQp6RMD1CqZmssSmjCeFS4+Ux8J3P6ktxoddNHaA/rebAbh/kSLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQB8wdqNr5tN0uysFYeOPa5hwRwUaa4oxIOpFBBxUq8=;
 b=F0dsvo92RWp3BieoLDlo9C42lCVihuU3GJSq1k8BpveXFojT94oyE0ix725/VE4QTuVhtbZnCS0gBienZ80xIspkqELwy64C8W0t+JGkN7tfC5oOuWGXmXaKHgoCSI0g5hBKy47CFJQABYXJA6N+M1tXYSkc2XlsFHI9of0DRFe3SsXA4lyZpO9b1HohxxxiPPzJPi3ujINly2B4dzkbPR15zptdSC2kX995VRfKA/DMwi/U9PZDoJiVaP2hvc9hnMAJynnJIJmKvHFQKLgpz8xvL4y9/EWrGHggpNTEF4QmMognzfYxQlL9XuMVRzxpd0lIhVCwmJLhh+kxnDq58w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQB8wdqNr5tN0uysFYeOPa5hwRwUaa4oxIOpFBBxUq8=;
 b=DcMQiZTHKfiCdGxA3oAFOai7DzVVrcvGglNTJYnDSHzBOpst5wI94dIAxVjdHEqhGjutdmduyX+c+sbzorrqpmd1fe4B8VALWsiF/2JxrBdI6WzBK9A9j8ZAxU6DJLQ1emfYxgscN9zgbryFA6YxaE1WvTf8l1yTC9L6cB4uFMe/V8Q+teTFayNX0KTK7Bu8LFjKRzr3UU5h3qUqiirx58crFn4rghPNNvFjYsrZvXyzbBWapmO2nqZwAQD8MtfLzrf/+b5P2bX2zY2QJ6HPYmQDr2r3+SRxYVUP9FtI3PG35BRuQfDBpAOmwFfvUlFTet23gDVXHvKHYVMZCgvcxw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW3PR20MB3305.namprd20.prod.outlook.com (2603:10b6:303:57::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.22; Fri, 15 Mar
 2024 06:19:48 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041%3]) with mapi id 15.20.7386.021; Fri, 15 Mar 2024
 06:19:48 +0000
Date: Fri, 15 Mar 2024 14:19:42 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chao Wei <chao.wei@sophgo.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Liu Gui <kenneth.liu@sophgo.com>, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 0/6] riscv: sophgo: add clock support for Sophgo
 CV1800/SG2000 SoCs
Message-ID: <IA1PR20MB49530065574FCB9A33252777BB282@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953512A4DCAF293D7B1CBC2BB262@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953512A4DCAF293D7B1CBC2BB262@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [cglPDA2H4QgcCCcF3ZKAxvp77KbtG9ykwjNVQjzU9go=]
X-ClientProxiedBy: SG2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:3:18::16) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <2t34qsdecrobsqeeayusi75lapygowhzouu3rv34ogpdaos7ub@3fmvtl2h5ept>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW3PR20MB3305:EE_
X-MS-Office365-Filtering-Correlation-Id: 82054a1f-a40c-4b68-4a77-08dc44b7ea09
X-MS-Exchange-SLBlob-MailProps: 5R4zPSLKzf5EtKtIZfNDLiVkI4EE21suEZJRd3jRN0g0Dw0VbuzDjd5A08LJAAo7O1LxSNtweDLP5D9eM3iRfplCIeKdG239TX0hNU8rC/zOB2HYH5PSF6Nnu0HpYKzGCdcYPCnso3vdQnGt53CamlsMdAu6SM3wArzySrGeWi7XwlrJpSxUYxmPoL7OQFFj0zWeasrn9/tlEo2w2kSgGAT1C4lxCKVPBgkKbEyktdK9UXBK1s3DFYIeCuDgw41L14nGdV/R6yZaxqRUCfsI/O5t/NHUwf+THZmNuq3BmlEbnmDuSmHwo7Mbcy+qH1mvKa1fqQqCCTF40EEoU79BzfdiBiCKKbHgvmL0fvPmpR0p9r1tgBkIQwgcEFE+qHAna5pfIT3GiS6jNONJqIEp0Jv8xwGPbSpTSqGNsjMOKQxjSsEgY244/OwK5U/qDOGfvDHKxbeo5A/6btYt9j06Bx+SXitf5kce65P5EStKTcLrw/22Awqmbk9PvXa1ufUWoj1g0mfgkg24SWyANnUcZgDLRAHB+/KjRs0TgqYAypi3kCA1MTLiSRZNpUMjBWoNwcyk0Z4l8GtEx2dFeEa7OcibFh8AalqF7LP4cSfwq/H6hGT4GUgFWsW7oERdcIaAfBX6XUGPrpR2dFSs9F+EsontB8a3F/ZXPhfzDBpJhZM8MD0boJAyOaSNNWWIZ0lxQjPP5RqNvp7HadbmSGD2V+nlbkXN74rcxzj5q1dVKWa5MLpgerq45Ws39SQ5+yyEj+i6dblD9b/IS2VaKF2dPa4K27ViUex8KTV5GXuVJr1D/i8KX0/px0rDBzHNHzRZw0RqUkOsjT8DdUTwS/5aRCPTVn3Y501l
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /jsgjcVVNSBh1n2pVr5pnzX3L0Fi0qNwji0hRMIkBPdu1a268YE2d2eMK5fs/zmc+VBuxQlquFHnm4MDyY6m43UKZZNlDUkj8UDjlG2V2wH0QpSw3ZCqDzc3K0p2LmbJ87wS9lvZ88iixtxklZkZH/2M71kLHbqKf1TzWWo+B4Bs+xqxpFADA6XfkrfLuUUkFQeKx7XzDnPmWVrGCH/NAPoCVYRKs1tNdoOR2H2BB/trbCDoijhlStyfTwWXPAaLVMO7judhLlP8fgphdglgjPtli6jAvLc1h/dAm6s6VFfA+Jync7L9+V8gV2ZLenejclAGGCp5FkgCdwBt0A8M7zziLo3ELei0i9vL3yfjd3sWKCkWrS+fVbsZFnkTY1JtQbgaQ3W9GRBRmFc/Uni8jxufN/oF4755KQ17tb4azzEQZPnnMJKowhu/mO5U4L8IrniFAGC47xFe3nWgvgTrzp8EMPa0Bwo8nLXjx9Sj+UReXTmrZbg/REgaFyHj/uqzEY5fszGTliEt4EVP++71aZ6pSBlm2TUomCJo3ChEYQTNcKnIlcpv/XKlUOdhDS2ABiX4gyQ3pFshC/FYu4od15euNRBQB03CISZtlcfyJYEZLDBpPuaMc28e+t7Sp2Blj8RWIzVodgxrbOR+sZcWi41phFRe85FTvM3iFp9zHv107Vau+XCZb1aYOw1C/qf7
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UmzO9fsQDKhXdvkQPed92WYUfoF4RxKa+8mWmTLUgM2CNzTwLypMau0hbYwW?=
 =?us-ascii?Q?va7WTbJLV1L1ByE6yvabCKmcDEhDBLCT0oDwnFLhAVdiiyKslg4Mq0TwFghh?=
 =?us-ascii?Q?Hk4fXSm1YV0wJooqj69+HtHza9CixM4lB5Qwhg+no88kaTGHJ8MhLeCK+oL7?=
 =?us-ascii?Q?0cJ2YznO6I5c4JyRcYov0ySiMDT7mh7WZWVtLgPE1wo3T196tM4XDrr1polN?=
 =?us-ascii?Q?3Q6fqXsDUoZJVV4eR4mXpcCNQH8Bzgp68oWrqEPhulUKW4a8aRZPzoRdSmqd?=
 =?us-ascii?Q?qtii3FgD+jkycP2RNoCSBpE3piDK32ttNnTa8VcUbOk+UuMqr4YJu5vvxEwQ?=
 =?us-ascii?Q?qR85BWLoK13vlofTZktCq0L0vqSvZH7AkRdsirtSjogsMD2XbjRGYD9p9cQK?=
 =?us-ascii?Q?9cQ/2KddgvbOuWSR3gOLGyFO3Mu6VQBJ0SfMPgqfkaJpUadfHM0o02LES5oY?=
 =?us-ascii?Q?zCd/SjHm+0xUqJjcJpa5KXFel6iVNf1vAYv4oU8LkUeaSAPNf5/V3xV7it2k?=
 =?us-ascii?Q?r8AcS1WlQXLUOCZq6VdMzWRwRBPkUYqAAK5Ae+fBPFBt4lvs6paL0XBaicke?=
 =?us-ascii?Q?35D9g7OPVke4LbW+qP7qHB0oUbSv4TWEc1jJnSxbVFQjNxl2CdomVDUwikbX?=
 =?us-ascii?Q?EuuE2zfbqXc6ofgEqd5ynNCGQ6GTDTvaxszuaOLUrRSTwOt5ruW6iF1SSaJI?=
 =?us-ascii?Q?KdCFxOfFrYJIAB4+L4nXSiB1QAEceyyQJZO6f+VzcqC1IbEdUrw1rQ00ybs+?=
 =?us-ascii?Q?KoMbfZFlHRQbwmDlM7MX62bdrrVlXYIYGtpnsFp9pYonPxjAYBmtZ+IP60Ut?=
 =?us-ascii?Q?L//OnXsdGUA8SOxtS27zb2p0QTk19X90hzlyaxWO7CqTS0mTvtPAi36Lp5O9?=
 =?us-ascii?Q?3sWZ7SOEvtEANoHu8kCksJrk2N0kQfpMttSzSyO3QnQK+AbWuUVDAnbJXG+S?=
 =?us-ascii?Q?cJIhHsf9EFPel2CKde2qkplJycL4xyrvlwKSxSb4hoNt0of1/J6R7xfJjJFe?=
 =?us-ascii?Q?3Geqh1orHCRSV4oxM27JO7Cowrphc2MaPnny/ya22LedNUhbIjMklWuZMWVN?=
 =?us-ascii?Q?rZ0ftVIbtVRA6ELL2M7j6mqVcs2wohBwe1liAjyrCBCFrbyFXTOtou+twuZv?=
 =?us-ascii?Q?KfQNVzLbGxLDhkT3VgDpi27Gy74hLVbTKOj5NevftD+qyvryRS2QX2GsUYJb?=
 =?us-ascii?Q?WF0iEmTxsYMI/qJJsD1nyJ81m++c0oAZT2CeVK7e920mmkK1NKWLIi4vhYpy?=
 =?us-ascii?Q?aIQOHUK3v7pi3eujb0a9?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82054a1f-a40c-4b68-4a77-08dc44b7ea09
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 06:19:47.8015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR20MB3305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_231956_052913_44E0E134 
X-CRM114-Status: GOOD (  17.55  )
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

Hi, Stephen,

Ping.

Do you still have some suggestion on this patch series?

On Sat, Mar 09, 2024 at 05:01:21PM +0800, Inochi Amaoto wrote:
> Add clock controller support for the Sophgo CV1800B, CV1812H and SG2000.
> 
> Changed from v8:
> 1. improve code.
> 2. remove default config in Kconfig.
> 3. merge patch 2-4 of v8 into one.
> 
> Changed from v7:
> 1. fix unused variables warnings in patch 3 of v7
> 2. fix wrong pointer type in patch 3 of v7
> 3. move the clk_disp_vip_parents variable to the patch 5 to avoid warning
> 
> Changed from v6:
> 1. fix dead lock when setting rate.
> 2. split the driver patch into several patch for easy reading.
> 
> Changed from v5:
> 1. rebased to mainline master tree
> 2. add SG2000 clock support.
> 3. fix document link
> 
> Changed from v4:
> 1. improve code for patch 2
> 2. remove the already applied bindings
> https://lore.kernel.org/all/IA1PR20MB49535E448097F6FFC1218C39BB90A@IA1PR20MB4953.namprd20.prod.outlook.com/
> 
> Changed from v3:
> 1. improve comment of patch 3
> 2. cleanup the include of patch 2
> 
> Changed from v2:
> 1. remove clock-names from bindings.
> 2. remove clock-frequency node of DT from previous patch.
> 3. change some unused clock to bypass mode to avoid unlockable PLL.
> 
> Changed from v1:
> 1. fix license issues.
> 
> Inochi Amaoto (6):
>   dt-bindings: clock: sophgo: Add clock controller of SG2000 series SoC
>   clk: sophgo: Add clock support for CV1800 SoC
>   clk: sophgo: Add clock support for CV1810 SoC
>   clk: sophgo: Add clock support for SG2000 SoC
>   riscv: dts: sophgo: add clock generator for Sophgo CV1800 series SoC
>   riscv: dts: sophgo: add uart clock for Sophgo CV1800 series SoC
> 
>  .../bindings/clock/sophgo,cv1800-clk.yaml     |    3 +-
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |    4 +
>  arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |    4 +
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi        |   22 +-
>  drivers/clk/Kconfig                           |    1 +
>  drivers/clk/Makefile                          |    1 +
>  drivers/clk/sophgo/Kconfig                    |   11 +
>  drivers/clk/sophgo/Makefile                   |    7 +
>  drivers/clk/sophgo/clk-cv1800.c               | 1537 +++++++++++++++++
>  drivers/clk/sophgo/clk-cv1800.h               |  123 ++
>  drivers/clk/sophgo/clk-cv18xx-common.c        |   66 +
>  drivers/clk/sophgo/clk-cv18xx-common.h        |   81 +
>  drivers/clk/sophgo/clk-cv18xx-ip.c            |  887 ++++++++++
>  drivers/clk/sophgo/clk-cv18xx-ip.h            |  261 +++
>  drivers/clk/sophgo/clk-cv18xx-pll.c           |  420 +++++
>  drivers/clk/sophgo/clk-cv18xx-pll.h           |  118 ++
>  16 files changed, 3540 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/clk/sophgo/Kconfig
>  create mode 100644 drivers/clk/sophgo/Makefile
>  create mode 100644 drivers/clk/sophgo/clk-cv1800.c
>  create mode 100644 drivers/clk/sophgo/clk-cv1800.h
>  create mode 100644 drivers/clk/sophgo/clk-cv18xx-common.c
>  create mode 100644 drivers/clk/sophgo/clk-cv18xx-common.h
>  create mode 100644 drivers/clk/sophgo/clk-cv18xx-ip.c
>  create mode 100644 drivers/clk/sophgo/clk-cv18xx-ip.h
>  create mode 100644 drivers/clk/sophgo/clk-cv18xx-pll.c
>  create mode 100644 drivers/clk/sophgo/clk-cv18xx-pll.h
> 
> --
> 2.44.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
