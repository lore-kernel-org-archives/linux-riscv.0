Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8B7C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 01:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzS4rPmq64ypYsW5PTxfWTzPhaQL9iTzpe9MTHgW3Vk=; b=Ta8sRZL3z2DP7a
	3qkCeOWj6RSvjrcCA7bpoGDjsnDBFy6Yr8ogMQ5A3JIYmcgkoe2A48IbhVei6STsO+7o9XfaV0rqk
	RoGD7IyrlicMsVu87ZCwzXxal9T98bRFPMBMmJ7MsllaCm/kLwCIDMVC91V7TfDmEwn2A+sjiQbfb
	4apwyw9ON/RbhUuLu+EoTQWOFdh+17QMapIBO2psXW5a5gm80f/RTtlyMz+HpnvjOjqtMf5gjz+gH
	e+v6msC097KX58UMQ8loqbk6aIeRmY/IkjwnpVFVeLdplWnAj0MKu9NhzneRTnqdQO7Ic9uuKrTcC
	l7Vc12U1i+KghQsmrJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1FcS-000000018bA-33Dm;
	Mon, 29 Apr 2024 01:15:48 +0000
Received: from mail-mw2nam04olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c0a::801] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1FcP-000000018aa-2CBy
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 01:15:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LA3QKghDIqDD7hgglMKLSU6xUD8Y4FyYYESqFqg1w0Zb2v2xOOxOV65xfm/7ddbnYT31alYkqpV2eYdpDsCRP2wDr+xq8Ch+PMlf58ea/jdLAgSQpJnhrQiZQ71vy6tlp0c7KzJ94O+B5gS6gGLpDYiI3w4S3blKhjeHMMlLB4vCRTnW/xHhPJgQ9H+rUp+/Z3XJot/+3p9whWWoToDNsQOx0xHVhiJZ/J04zH5P6Ni/mbNjLkgJAlmDuDXRe7pjifNVrCS89KvJ0TbNR22tz9ws935Cz25P2jNUtN2YpB6y4e2oqh2bnjDll5AjRg8YbmHzb2nFdTwnetTcjRfQHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyT57RFSacCnsD4bVchDcwewCUN926qJqd3cWurKplQ=;
 b=dGcLFwYOudzKsOk0igDHB3djuG5ic8lRFH/wWFvZP4AxUVp+VFUQsWqg7aQPSNKsdJwLX1KtYuQTCjK2ZXFLi2T6pVGZjf1U0G66oJBjBQIuJg+fMncelesOXS6hPyCgB/OFcpz1WxtrxWtZHxP5IdN3dqtYTDwTtx6dFxNqen96FcMTmwmuHrxwy/MU6VcBtUkY0DeTbhEUzGnHtM3qj1Iz2+po+zU5jr73TFIVgl84pSw/xNPSdko1ei96o/EOIfxuABc4fRE4tOptD4qDtFNHJ8+xdwrXxNmlhVZfLtvx/6804eDvTVo8xifcsnHQeLoOohjVtHPmN7YafDt9CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyT57RFSacCnsD4bVchDcwewCUN926qJqd3cWurKplQ=;
 b=HZohmaaX+XP2uk4BWOgD4GCGdArHQU61tYcFCWgZ//3jqs1jdn5mzbaEy8XmyB8GVRUR/JfYdVE7GJ2O6imQdTIRCYgVTJhkg/DwUcEcFiO6rQH2mEE5+nhplGo/SIf7k6MFNlBqS8zDQCU18/lfWjHktrzvX//tMGpXH5eEQaATjdE9CiXQf8+hemt01uE2C7N0GG+VEs+BQCGhodD4X8UNy0dnx9lzIs612stbuFWxUjSzBc7nHiyD996hR17FMUHyHBlXG/JjLL23pdKdN6JM9pUn7L3GC0J4EDNc8wOPDohjxeGU9e3G0DLNeJhd1dZbyk31VFUnbYIF+hhIgA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SJ1PR20MB4786.namprd20.prod.outlook.com (2603:10b6:a03:45b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 29 Apr
 2024 01:15:39 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 01:15:39 +0000
Date: Mon, 29 Apr 2024 09:16:08 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: defconfig: Enable CONFIG_CLK_SOPHGO_CV1800
Message-ID: <IA1PR20MB495359703A7C5A28940AA4A2BB1B2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49537E8B2D1FAAA7D5B8BDA2BB052@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <IA1PR20MB49537E8B2D1FAAA7D5B8BDA2BB052@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [ijvFBjpuZgzrDCb0AByJ2GDjB4m/SmGcJ73biad8YuM=]
X-ClientProxiedBy: TYAPR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:404:14::23) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <2ocbyuckk5jl2a4yeiieemxeb2wvcyczqoyrqfbwdd7fvrladx@de4jizqlv2yz>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SJ1PR20MB4786:EE_
X-MS-Office365-Filtering-Correlation-Id: 840c4d1a-6f85-4fc9-7801-08dc67e9e19a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3YeeRK+i01ywhEMOwPGtv+GlEVAfMU7BaBzkKjggEwMQ1lRLL1BvlssgtAzWnIvh7khvD1MNsEz1sAD9j0Fnrkwj1VNtnYW00oX2KEtXh0j71VVzS5qXADn5+JH43QHthwPrYoeStG38RWDOSRbLD+GavZzopfyh7XcDQuNsN6+hGC56yTnObb/DYWldVPByTTnRZZmKJ9W0tyjMsFZ9Ddytgymt8qde/Sy1E+xsu9cvhXOviLcj5uYkXPz/PVvpCxGA+KcH0/eWvXqipNWQl4a1AuMmCcPgo8SPP3tv70Dv8M4tomx49fZPLWOpq7hm4YEGdrWdZR0wlGKG7/1TBjCc37PTZ8PxFJ9uH+lMh9L716qfNiOAON14jU5boy+PuUBjVR8ZzgYBTOn3y72HP+bwHudqAD3N3QspqgaHcAEnlWa9ER4SI8yIdnU0dTJDIe+qO0zl6lwyJRdlDNP/M9Zhqw+j860ZAuHkiJsTUvZB4/17SkXfud9I8oti7RzKOC1CmhnWFsxUJI5msbAUosankDL5huBipTGDeYgB2d9FF4JZT5b3KouPa+TJTRch6BCBh8sp6nrJ7Y14stHh0zrdjmYYXS6y4e3TtTlRRuLvmT4/BarJwRvP/BHuwSqY
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vAvOPNykYEVtARVBNFGNxEqxayfKVrVEpFXnUhpOR6Y374uvvg/rraw9rnig?=
 =?us-ascii?Q?c2v8mnlUk8CF9zkdmvW6bUm2zt3qrcNae0EqNt66B/6U+wwIQF7S8qFlDJA8?=
 =?us-ascii?Q?tVxZsvkdmDH1tEVcSlNU9dGQgbXegJrW/9cAsMtVNkShGUypzd/pfyUseEUN?=
 =?us-ascii?Q?s5ECYrtshR/WNLG6t3piltncCKOOKxleY5KZYtVIqnm7GMg+/8Dc7eSBryOp?=
 =?us-ascii?Q?iubu8JY+n4BY9RS7F8eEZ7NNM7yzFnbZ8NPzmzyRb8CAiM+zfICoFmG+QsTW?=
 =?us-ascii?Q?FkQYF8bOjylAX216DH87WyblUfyEM5U0Sf51zuHtDQI9I5R9aawruI9vfe0m?=
 =?us-ascii?Q?llhiMtg3ShQv4PBX4NArtkFBMAhZ1+HTYcKMd4Pa9aFvl8zuHbSMPRRllA9T?=
 =?us-ascii?Q?qN+EExsoL+fIELSWUDr9fOxzu9bl7xrPZ3iBz1YjaQXS90VrN5PkFYM8KROO?=
 =?us-ascii?Q?qtBRgReFGYogBPECw71+1NHZwD8fU+w0sqAYawgsTmEPoDx2iyX9thSXttPF?=
 =?us-ascii?Q?XqyWgkzC1qWXz3lzhra3b3yDsCKaWEe8nqE/ouWRNmjIe+LPGspjJ00eqvh4?=
 =?us-ascii?Q?GHAfLGrlzEeq+CSDl9Cs0jcDduMuHnq3ZXg8J1uXmHfCwrRp7fNp/IyINsv4?=
 =?us-ascii?Q?lAQ3wLY2hyr40KEUNEvICdBr7rlwgWJY2AGycvG+UPEI5CgiZaQ6TGDYtpOD?=
 =?us-ascii?Q?CNC4upfZqGaNFMkSUttmZxPGNObzEOLSJqF2bTuBPghrPbtfpndLgYFSpoWt?=
 =?us-ascii?Q?ZhzE1xVOPf+Zu6sl2V3ZHsVwsAD9InjFSJfzZ61U1/WUJyYzQfZDfGRDjA6G?=
 =?us-ascii?Q?JmTLp7Ndgq/CkMqgcb9o/4K3bSaaH6Zp8TnGfLgq7fsj5vOdM5XsOQlrL2Io?=
 =?us-ascii?Q?4D9PROUvUv/wtF92V1bd7OXVAfEgzsCeKj4scetQ0tV2xLc6R4HvK8yJse9Y?=
 =?us-ascii?Q?Jf2IN1fM7q+iVOB2WcuDuF0gK+svWLKdkyC14nTXbLIAIhstKDzz6aN1TIaL?=
 =?us-ascii?Q?DZBR1VcsFnJeS/dufuq6/+dl/9auTUKt/FnfLKx+4BrTNxjxrhS6F4098gpo?=
 =?us-ascii?Q?6W/zjutwEujMgEhdHiuWNGMSzqLEQxdsh39K0Cxpz+MVp5y3gD81thJp9xy/?=
 =?us-ascii?Q?qqk6jgNmgh+msKuCSx4DLhPoSm3US5ccTB+L2tmUFoLA7l+7p4qorxigLmLb?=
 =?us-ascii?Q?1dQkiaFyKIx9ZbiYVIFIhyAsS/9mUosqSt/ZzoYIBNzVknizkVe/PDakv43j?=
 =?us-ascii?Q?F4D+OmFPk9+OxTHIEU/g?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840c4d1a-6f85-4fc9-7801-08dc67e9e19a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 01:15:39.1540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR20MB4786
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_181545_599383_10D71C4C 
X-CRM114-Status: UNSURE (   6.20  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Drew Fustini <dfustini@baylibre.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, Sven Joachim <svenjoac@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 11, 2024 at 08:12:40PM GMT, Inochi Amaoto wrote:
> CONFIG_CLK_SOPHGO_CV1800 is required when booting the minimum
> system for CV1800 series board.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Hi, Palmer,

Could you take a look on this patch? The clk driver is necessary
and the minimal system of cv18xx will be broken without enabling
this.

Regard,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
