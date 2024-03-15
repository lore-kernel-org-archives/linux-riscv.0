Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587C0C54E58
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJSTPp/nOJqyCZyOQW9xvjiuLBveb+ql3wtIdCrwVv8=; b=uf9b3T/zJbf+LB
	U73VA5JeMNUWMV+D/7qBsm6QiWJ8sfoXdJuE79TM5+ABiQj5s0+B7pqF3YajZVy0Uk7WHvNDJGVyY
	W+HZHIZvWtGfMw8Qpea0Pzm2VHdP6DRRqSUjedXLELisiuKFbVsGGBnY7t3ctZ3MZA+2ZeV4pt4B0
	60IAOCwP8cYhZ3+eM4B/WDPPb+wC+N5KpG8LVbIFBpwGnRQptNqX2ty6JaSS0WT4W9YStt9ymwwG2
	tFhd9xL92zJP/36XetcYmmYLsXc1i1UYvDvQXHhNbMWH25kvjDvVWYSZ0qRp6Ceo6EAAvPnLWLpap
	Vcbzxdj3ipHa7qJZQUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6aL-00000000B5K-3TJs;
	Fri, 15 Mar 2024 12:22:53 +0000
Received: from mail-mw2nam12olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2805::800] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6aI-00000000Azy-25nk;
	Fri, 15 Mar 2024 12:22:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADhYI8B40UpOF+qcxHXvLm8IP/xwHhQAs1XPeetWCmfR31aHnNC764+BXVDREM5ZMReMcuLCRLIZXG2q0MSttK5bEKDZ9LsppPPUX6FeR+j7A4o+yh37j0ysIOCwH4Jp4GOWQSNOy0tp/G/jQYmE1KdYWedRDyZ0cLbnUmZq/k01e4ABM1lHzp9z/aapXEtemLDZIi/JNCu47Z6v00rxdW/7sgW3sLRnAq0o7pW/xEv8eODI8Djc1sjCFQ6CZvhqLEx698lBVqCj5/7PW1DGu/G9U9e14eyLwwlc0uLrFrBwhmQii/IUOcne1x5GEa6WmAqBHgipvQrVqqQHHkYffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KL1/YCrcCiKBzPJNjEotH9TTS26F+NyzVjOia2gaXtA=;
 b=MTm0F1rhQDRHrZsk9UWBd8uqeAzmG0vpRyVJzy8+sjBImj1jsvJcvc3bFuK7ij/EmUjxBzhpqu7Rwd2XmPRTqXOS1PWlRRMbhJFmHk/tCxW8aWEnvNzRUO6hyegYO9ACaDKoJJSGVdhb7LAzk2KS7BSSUE0TvMeMzUT8taRDesEpfaP5VwYdPTMVmd9ZF7mFVjAyKmmohh7mqk1iCi92qGeU6KMF++tI8ooWR/mGjfFfc5rzpv9N1KoHpKN/C3cjwzNDczICspjpSJvhTd54oqGGNW7Oz4lQvsuBlnRVJCV5bFvDSWBViZFAUvhHUe+bRn6VFxlaUoK3CyQuq0maQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KL1/YCrcCiKBzPJNjEotH9TTS26F+NyzVjOia2gaXtA=;
 b=ltbFv0wH6KkzU6AHKBCLzxpDyshVbdhdANzqX2iGB/3DSsc31Qm0vFFx960SLCTvtW4JyqCiVXS1KK16vcHspYgqik1/0KBVOGj22BS20WJTQcgECYcGwGHCiSBk72SKhdOmMtINA+Nper90yIUeACr/ZdKb+vmC1BuYwkWqSlh13rnHDkmRdNIRpirLuZMPaJKrbtiXOQCqvH98r4C2LjSrq7OoAvurTuYP5gP+v6ivH3tZ/CelaQR4+hl54cO/YMY4ubBmaDmABAKMwdrvSnbyuZwF7U516gGklb1yfEU70uEdCtXr5cPawD/jk3i/1/xiZ/U4KphoNC3DrJBfhQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by IA1PR20MB6294.namprd20.prod.outlook.com (2603:10b6:208:3da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Fri, 15 Mar
 2024 12:22:37 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041%3]) with mapi id 15.20.7386.021; Fri, 15 Mar 2024
 12:22:37 +0000
Date: Fri, 15 Mar 2024 20:22:28 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@outlook.com>
Cc: Qingfang Deng <dqfext@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Message-ID: <IA1PR20MB4953CEBE4CB6AC7238849353BB282@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240311063018.1886757-1-dqfext@gmail.com>
 <IA1PR20MB4953ECC3E32E95303872CD14BB242@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CALW65jZ+q8sDiRKgsRL9n+939HNUCnkKuO=YJjHB5Js=WYQeOg@mail.gmail.com>
 <20240312-evil-resource-66370b68b9b4@spud>
 <IA1PR20MB4953CE8999960BA71B46DE6CBB2A2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240315-73aa13079ef83a4559869084@orel>
Content-Disposition: inline
In-Reply-To: <20240315-73aa13079ef83a4559869084@orel>
X-TMN: [luJoTI9Wll7A67DupYznreITeqN4Oxum0TyNWhzGPf4=]
X-ClientProxiedBy: PU1PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:803:2a::26) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <atyytfowirlxbxx5tfpixtxrd6brjik3vmpluydkb56kb6ljfp@fublam4kjiog>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|IA1PR20MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf6fb8b-9349-4cb4-0c9a-08dc44ea99d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UVqGat2G6i+jrjr4uTYUnueA3UyaQwPhiNZ2/+hTtlDBJfqhHPPdstZFVNqiJBG9mbqZIsZ8zGS20PwdqjGMidjKCdx8G/lSf/hL1+hAIo+WkX8K9rmaq3an3h0wd82k8Xw2NNq4jkTdsmf5xbqQryqOMq1kpqV00QuBdudw6hLabcyaX56vGQbknE0Wfoxad1QZehQApK1lojbTvfQ1z5EKFir3mLk322LR+Ajag0I4glPIW30lWPBlcCcqzTipVv+IW6da8RIKKuP7V98iYluuYOGnwb2Rm8x67qh7+XrCbebGOBx25NgdaF7fosTQpKxMul51AlnrV2ew0DQdc182HPZzerlzr/4g83zWrYUFzNQStzRNoToRTL4iSDcCZRikBOILwMTM9wy6LyZODwtK1UztIEM1oaGYKBvk/Mb56Spfd9VoC5u6qjOXJIsKc0gZUARdE96bYhZqzJs4ckTMtmZy8S2CgICKztvJJLp7XGILfN9/ysUajWnpLz+0I1VigF3bKCIUcQAWihK7arY/EyNaWuueUy8CU6O0WUyznB2EV9JG/IhG3b3XLl4VCgS4TutIoB4hI0mmoP37EXImNzoDMbxnhH7522buV04=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HtzU/ysfCNsuK4KaBn7KaXUmfjF2O3pYWDnf8rRYbVRxNsGyOW0adJrBaLpf?=
 =?us-ascii?Q?jAL4aXrRkGy1IJAx14kj+2cdTQ4ME/+3slSPzpVC/M89hGXx59HjAlpMvn8+?=
 =?us-ascii?Q?EAxHtjiMwVYOuPBH8atDZUDjPCI33TYGzgu2nvIeOOobtE9/yay2w+HqJx+f?=
 =?us-ascii?Q?tjW2p2iUwg2vBGu4XkzCGExSr5Y9Ba7qpPi0IEeXNbnz9Y0jzWZDc8/hfb8X?=
 =?us-ascii?Q?S9tEmaLRMpj6UFv6AWP2AKZWVr5RlviHvw3LX9HHPPAz5MfTkELe99xP8i8q?=
 =?us-ascii?Q?4yOyn8iCDOxaxQay7GpwiyI72vlctoIgPUqCGBGxiz4QWjA379VUznRkNDv0?=
 =?us-ascii?Q?rXUXO5G63CNFY2oliTmXcuaM3iu8sXMQRTRJMhB6alNW/9NnTBSfH6Nje+up?=
 =?us-ascii?Q?8t1gwuCwgDICEn6wypDccf2LeTlMUTJHA7saKB9BbYPn63zV7G3GUKHB2B/d?=
 =?us-ascii?Q?eH52R9195JCGtBvoIG2jBl9RBwx6qpYC4VDy/l60qUTKHHBpeRywsfXgIY12?=
 =?us-ascii?Q?3vjLzgPdMdMpQJjgZC9hT5hO3FRkXR9mN7lAtge2nU9rv1gnTiz90KhDKflG?=
 =?us-ascii?Q?Fg38t8WLN5xxB2WD8tH9OxQ+PRZZBsUfBHHho7NKzPdyPJskkXbw2ueL74/R?=
 =?us-ascii?Q?9XjwIAiMHpGWiINPsUXPeeaDRfEpnDKzqqCq6L/59Riug/juNjZVVQgvKWbg?=
 =?us-ascii?Q?8UJguVkC2QmhRCKjSiMJIt6f9EQjY2nej83ExFVRurIxWHYt4jOsC+joa9it?=
 =?us-ascii?Q?PdEXk2mvJ28fiyq4A5dFkNYG/A6aKj16wwTz+Gy4r4iHwS5y86gIA8aDCU3c?=
 =?us-ascii?Q?ekiNpKZ+Qjn+Y+w30t+D+UlvnZ4rTXaIUGp40hLvRcwg0QhAXphbY+3VLcfv?=
 =?us-ascii?Q?oT+UM/3Ly22P8hY0qPW/i6DlUxTckVxFP9t8XPe8ksdilwVfhbAltdabgTTR?=
 =?us-ascii?Q?dPXdUjEhLcxwW8Fu373RI8UlHw1KLeoQgQZpwKXd8UahaJlPcBVXeUHoK5rG?=
 =?us-ascii?Q?koeaO085PcoKcoDFOmqLUN4t5O/4A5qpWP5C3cOsCBbBqMQ5nhFl1sjZCNZg?=
 =?us-ascii?Q?lf/8MzDJPRGiPIpWbHxpZrzt/XZ8Yk2NSzGAb+XHEABWlXWBCjTchWboARO3?=
 =?us-ascii?Q?1vfCmy6Zi8XatT2CMfzAn1o3C/3MBuGpoL+Ep9beJDne/MLbKm9kQSBCy75q?=
 =?us-ascii?Q?DaOubXm4Hs/1Gh/ovGy8KvBAC1lMf0Enmp34jVj/K+qv7gZvg403rXTZLHJT?=
 =?us-ascii?Q?/d20Fv7pDF+tQgxzHiyU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf6fb8b-9349-4cb4-0c9a-08dc44ea99d9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 12:22:37.6823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR20MB6294
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_052250_665989_7BDD6CFD 
X-CRM114-Status: GOOD (  25.63  )
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

On Fri, Mar 15, 2024 at 09:11:35AM +0100, Andrew Jones wrote:
> On Wed, Mar 13, 2024 at 09:31:26AM +0800, Inochi Amaoto wrote:
> ...
> > IMHO, it may be better to use a new DT property like "riscv,cpu-errata" or
> > "<vendor>,cpu-errata". It can achieve almost everything like using pseudo
> > isa. And the only cost I think is a small amount code to parse this.
> >
> 
> What's the ACPI equivalent for this new DT property? If there isn't one,
> then the cost is also to introduce something to the ACPI spec and add the
> ACPI parsing code.
> 
> I'd much rather we call specified behaviors "extensions", whether they
> are vendor-specific or RVI standard, and then treat all extensions the
> same way in hardware descriptions and Linux. It'd also be best if errata
> in extension implementations were handled by replacing the extension in
> the hardware description with a new name which is specifically for the
> behavior Linux should expect. (Just because two extensions are almost the
> same doesn't mean we should say we have one and then have some second
> mechanism to say, "well, not really, instead of that, it's this". It's
> cleaner to just remove the extension it doesn't properly implement from
> its hardware description and create a name for the behavior it does have.)
> 
> Errata in behaviors which don't have extension names (are hopefully few)
> and are where mvendorid and friends would need to be checked, but then why
> not create a pseudo extension name, as Conor suggests, so the rest of
> Linux code can manage errata the same way it manages every other behavior?
> 

You are right, the errata have no difference from extension in real: they
both change the behaviors of processor. Meanwhile, the ACPI is the problem,
it is better to reuse existing property. At least for now, using pseudo
extension is OK for me.

> The growth rate of the ISA bitmap is worth thinking about, though, since
> we have several copies of it (at least one "all harts" bitmap, one bitmap
> for each hart, another one for each vcpu, and then there's nested virt...)
> We don't have enough extensions to worry about it now, but we can
> eventually try partitioning, using common maps for common bits, not
> storing bits which can be inferred from other bits, etc.
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
