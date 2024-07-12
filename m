Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAC2C3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 00:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVmfGofZ5ZX+X/x4Yh73YNvcikT4qrFj+8ZSFtPpYFc=; b=ImpFx7xz+pTYhY
	hgIMzRyoB5ApEe4Aj3Qi37NJlzXBTkVWJFRwACgM5JpRtrrVG1qUhQO6Cbsf35sqr52wuIMgy1dH4
	yGx7J287y3G743u/t78/qqKkSQtZXZ/uEzdVdH+5Zfo006te/LAIG7iOrQMXVZi5IQYVEZgVF20Zl
	BgE0SjOxfpFsFZxzyXB65fVl9L4JmG+Ttm7RbyWvOhCFOWqUsPwdaklIoXRhJJJJHq6/6ot5KEDD6
	aDWZEanRz7aZqPZxm94xpMr/h2Oa9TRIXW1AWlGnH1h48iAUjnS9aKUADmSawukK/WMBWTrlsJeyK
	7atCQs28Ojvfsi5vnZOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS4DV-0000000FwJO-1CAP;
	Fri, 12 Jul 2024 00:32:53 +0000
Received: from mail-dm6nam10acsn20804.outbound.protection.outlook.com ([2a01:111:f400:7e88::804] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS4DR-0000000FwI3-42ps
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 00:32:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WrinKEG8xkMG2ziKzINnnBK+tXVYr1mAnQ+HqhbxAX1uBfbn3JRxNNx7NWKCl5EXmutzkrjoZHGzjla2aAclFabK16Gnu6vVU/jex0Nb6MUyRuSjS653oM2k7Ea6ovJUJTkkZDLDpTTajqqj3n4T1CsJT4jTrLU6TKObgJMZvtoFr9PcG039yUrNBjLIHHRA9pqK+cVdPK79Di2AfkOpAf6CRvdBxAaGjC2tlItwfJsUJRmGJWE7r5MMpRH1J+JZnnmc+50CZN7mcaZ8ifXosk1U1wPLKyWAVZNzCx2rBOEZSku4X1e7rRKbyuq7fSjh7VEhGeAe2BkgI+ppp88wmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDYWcF2kJT8psQASpY1AejgIy0Sj3TaAk2P1KfCKRLM=;
 b=hf4D5afSSCA0uCHolQTIlKIYKWv6IV7ouyUhnqJC2IgSO+7bXELR8RQx4KstpfvZnAgWsEQZLpqdBtM1b3iuG1YESUDPWXNyM2nF3S2vcfO/DEF2TciVRbztvU1jVJTvqe/U8Y/3atzSZ+dAc9iyib8LSNV+HC/dOuRiYGUkeDVwq032ATwYjq8uXK5xxgeoqdgWKewzbQeIoC9CVpCmXspfo0iK13Ob6cc+PFhJNu7VUvjAm0F4ZA1nrYg3qCGeUeTcxBEtH+xFXFOVNo3E7H9/HxgniyGXp3TI5JDVRhJs4PdjneIxqOCBut+GCAifKo8yM98ah3+P7FuOA/2KgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDYWcF2kJT8psQASpY1AejgIy0Sj3TaAk2P1KfCKRLM=;
 b=ZTajMwp1DwnwjnUpZY0Kn3rExmH/xQ9gyKGo6jDgcGqzdDxjKzoVcdrOd8hSTuZ2vRgNxIJ1H4CzcjpnoqJHGDo46SZ8RCISFCBaS3bycsSWDEd6UBmsPj64NTyH/nG8/GR2wAbT1GV5Z5LS8S9bunaN27MPMWKrBxGSFZoyjXTDnh7dYyiCilN/TbNFnyEWSMdZfMrD22uQNOLLG8JhPBqTP1obHDA9cxGbqmPNa9CCVmCaFlUh2rUs9fZN9aYAxZ7FrX07t9XA/ux6Mo9fO9A+3Wzdpu0AF0kduG83F3pE4wWYtPQ3G8Nzzl0I7YAh6+gYkllhKhd3dhsbyc7Y/A==
Received: from PH7PR20MB4962.namprd20.prod.outlook.com (2603:10b6:510:1fa::6)
 by CY8PR20MB5690.namprd20.prod.outlook.com (2603:10b6:930:9d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.21; Fri, 12 Jul
 2024 00:32:36 +0000
Received: from PH7PR20MB4962.namprd20.prod.outlook.com
 ([fe80::b5de:b82:43d9:4e8c]) by PH7PR20MB4962.namprd20.prod.outlook.com
 ([fe80::b5de:b82:43d9:4e8c%5]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 00:32:36 +0000
Date: Fri, 12 Jul 2024 08:31:49 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Chao Wei <chao.wei@sophgo.com>, Conor Dooley <conor@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/4] Add board support for Sipeed LicheeRV Nano
Message-ID: <IA1PR20MB495349877A85BA01C5EC87C6BBA62@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240711-sg2002-v4-0-d97ec2367095@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20240711-sg2002-v4-0-d97ec2367095@bootlin.com>
X-TMN: [TW7kpB8ULd7CT+khtAqrOcSUDswHP6V3pwZOdoy/rP0=]
X-ClientProxiedBy: TYCP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::7) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <ge22356papg5f5mgau4vr2io36milhzdpey2wnyglaf7ojnchi@o4d6kif7sgud>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR20MB4962:EE_|CY8PR20MB5690:EE_
X-MS-Office365-Filtering-Correlation-Id: dd541bfa-b3b2-4dbe-b910-08dca20a1e66
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|19110799003|8060799006|440099028|4302099013|3412199025|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: BSPNAiY+qnGvnSxYKWlnz16wie9cIABc/HWeRVoFwYf2+u9ryil+QlB/8IFwUguvqmAfxONzHOWS5m82vnD52aHZFWZ3ja9fEdcx5ip9b2x8c9o1XYlSRX2ArEmoJfwEkHQ92HIP7gZ0KxUzDlN15+hrNYmBgOyK7mMLxE9zJfWgj2FFVqe2mdRnLkR3xrjpdVvB0KdTw0/ihqRS6Rq3Me1J/D4jkSJkUbfTkjO8ycpBpVycJwKWa5IsvLmi2PeUwqFeFfa+DQSzLXa4za5ukr2l6TSGyNALkHspDuNEiV2c2ecxj5UaK8GU2Si1uTB7aQhEMK3YdWvZh18wFBro2z8uEgkavUwNfb3L1rFzB6F+9oM8BZ8rMdTvlsNMZLIyVP3/3AF4qA+ASxuQsEEJFBkKjVU4gKzQyHuDyFvvCvLF+Sp1/pE1FIwzr6RHvjsC3FR/O20EMjWFH8aWCXVyqHjoARCkGKIrnPywCfiOVMn14LpDuLIkq7bGSAA3uGol8JyBFagrng3KF3UPFIgcBS0B7+DZgLjZZJYb/kDr2u1PaW/dZig8fRVJjuSXbu2bBwbumv/Le6yy9DiqgSuVg4PIqh7dIpqE9eD6ghKJ+iQFyg9vLcFGssT79+Bi0sy/dy9dtTZ2K//y9tyhqhYPPiq1okyPDsaSvY1fIBaObxg9ml/cZhh/Cpec450+GgMcrMk3QPowKeujq7VNxGg/N/ZIdCI259GP5mD0abx69NIZEFZuFJvMJNXV3uhbnpAPjE65E6nFKS83fUITVTUZnDXk/UWBtrFdB4KSeWy9xQA=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cj/lNzZhaieeBQccwlynQjYAtz/nZuP0J0DoT3rLxJ9Zzyn22p8ECmlcPV9+?=
 =?us-ascii?Q?9u4zDc/mPBuMRo7N0FgK5AYFvKiQmiTpIk8QEPT3LlMIfWDKSPsKmPGGqkMD?=
 =?us-ascii?Q?fIATmROTkd16qO04OSSNHtVnH2pfAdQB65RGphxaMDPAZvETueik+Kc9gbk4?=
 =?us-ascii?Q?hfZvBKbN00QjP6kLxxbAeP4Zy/IjgoSq/ajBM5ZWumVmUd0C2+U5FsebY3q9?=
 =?us-ascii?Q?8ZrTP65iRFCfRmwLZH0qGneVC6snvCFBjLxHm65TqmtLzCqPcOIt1/jsSVPi?=
 =?us-ascii?Q?UrWbfHbhsX9f62MVUXlWd734EVSJTZ5s+y/37z6vMWes75YF3YLLwOTVZY0E?=
 =?us-ascii?Q?jqjeMgA3OZd2KRxru8ultpSDo8IuuNwO6PabO6jfphKqrb2puEAEhast+edT?=
 =?us-ascii?Q?3qfXDihWjbO94NQvXPWJhKn7j/AMiZBROD5yMWfEs8E/uF7RG4/P7pDVTynb?=
 =?us-ascii?Q?lulmEbkqYHNqeKdjPoNZhou7Dy8QV0IYo8l9gdM7BWvZ0oQGAxdBs8l0M3Ua?=
 =?us-ascii?Q?wOH3SpBAUtuuh2CAa00Tkvhzq3wpuXh72thMGMeuFMRnYdm3up3N1IFAqMsb?=
 =?us-ascii?Q?VAkrl0r82Q5ai2A0BNChkkKrZB8xsOmfdYOMNSGHv5Ke9FOmVNZKVELdnAJE?=
 =?us-ascii?Q?qprNCmC39eAi8V5LYRS842/axGdSrIgmqMpHYKvRIHOxApQTcoD5qrGFh7dr?=
 =?us-ascii?Q?b8mEcfft0LKci/6RuF4j/oddLdDtA4d8DTsa60XCyztLB4bQjsGewVjye4DR?=
 =?us-ascii?Q?i5R82CNSfkvik5T24Ha9dS6fI6U1QkaHE9/zH+fkOgH+ObJH3NXJjBou/5lG?=
 =?us-ascii?Q?5D75l4NP/omgZFkn9ZVZGEliKlzWbmOiIEj8JFUMfwPKuCWg8Szr4LrXhOBR?=
 =?us-ascii?Q?7LsnVD9czCd21rwgYP4SK4WGTvmmFUr7giMtKabssHgwbGLce3wl9XAaNvqE?=
 =?us-ascii?Q?oUjO7x6nEFrPC/zpVLWHZhs/BnecRdAUBkmgY6jJkw4ANqwWBUPUUmoy/l/V?=
 =?us-ascii?Q?9numy4U0Tkf0pmnpd+cABeFSRPcLnVvNoSvnRgMnJP86hKaRet7rK4drW7qc?=
 =?us-ascii?Q?/EgDjgkSWhL+4894z+qKlxXgPhwFUH9pZnbjdOIUFenOz5oaRKwl1vGON3l2?=
 =?us-ascii?Q?1rEHsjqmabdlTK8ThpKHvuWLF93mV51T+Qmv4drg+G3E3BF8b1Ftk9gEloDs?=
 =?us-ascii?Q?b28Xs2fq1Ez7eJh26vxgOS2VdEzg93jipI6mfQqzqxUdUQYfFy7JG4/SBsaO?=
 =?us-ascii?Q?j814VRm1ieaZ+YwRXjrG?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd541bfa-b3b2-4dbe-b910-08dca20a1e66
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 00:32:36.8075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR20MB5690
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_173250_041882_6B9834D5 
X-CRM114-Status: GOOD (  16.83  )
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

On Thu, Jul 11, 2024 at 12:01:27PM GMT, Thomas Bonnefille wrote:
> The LicheeRV Nano is a RISC-V SBC based on the Sophgo SG2002 chip. Adds
> minimal device tree files for this board to make it boot to a basic
> shell.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Reviewed-by: Inochi Amaoto <inochiama@outlook.com>

> ---
> Changes in v4:
> - Add correct bindings configuration for SG2002 sdhci
> - Drop commit "dt-bindings: timer: Add SOPHGO SG2002 clint" because it
>   has already been merged in Daniel Lezcano git tree.
> - Link to v3: https://lore.kernel.org/r/20240709-sg2002-v3-0-af779c3d139d@bootlin.com
> 
> Changes in v3:
> - Remove /dts-v1/ directive from sg2002.dtsi file
> - Add disable-wp property to sdhci node to avoid having a write
>   protected SD card
> - Drop changes in cv18xx.dtsi and cv1800b.dtsi
> - Add fallback compatible to cv1800b in SDHCI node of sg2002.dtsi
> - Link to v2: https://lore.kernel.org/r/20240612-sg2002-v2-0-19a585af6846@bootlin.com
> 
> Changes in v2:
> - Add SDHCI support
> - Change device tree name to match the Makefile
> - Add oscillator frequency
> - Add aliases to other UARTs
> - Add aliases to GPIOs
> - Move compatible for SDHCI from common DT to specific DT 
> - Link to v1: https://lore.kernel.org/r/20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com
> 
> ---
> Thomas Bonnefille (4):
>       dt-bindings: interrupt-controller: Add SOPHGO SG2002 plic
>       dt-bindings: riscv: Add Sipeed LicheeRV Nano board compatibles
>       riscv: dts: sophgo: Add initial SG2002 SoC device tree
>       riscv: dts: sophgo: Add LicheeRV Nano board device tree
> 
>  .../interrupt-controller/sifive,plic-1.0.0.yaml    |  1 +
>  .../devicetree/bindings/riscv/sophgo.yaml          |  5 ++
>  arch/riscv/boot/dts/sophgo/Makefile                |  1 +
>  .../boot/dts/sophgo/sg2002-licheerv-nano-b.dts     | 54 ++++++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi             | 32 +++++++++++++
>  5 files changed, 93 insertions(+)
> ---
> base-commit: d20f6b3d747c36889b7ce75ee369182af3decb6b
> change-id: 20240515-sg2002-93dce1d263be
> 
> Best regards,
> -- 
> Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
