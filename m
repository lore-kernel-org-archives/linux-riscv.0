Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765E5C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 07:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDu7wJWBY0pWEe7j1rmxREh1qozGgijMuMm1HMpYZxQ=; b=dmgKuUmaE6xPnh
	NpFdDnTfOT4mEwL6eDWVpHtylCHi3nnMRITUlI76fRPNtySYhzJawpfrgOqIEM+59IRSX3saKM1Cl
	jAnfrL+MZ4hTbvryVPXmCr+Ubr1vP7U4apCESeG45lKyp3O+n/mvGkIzEwx/c/McHgc6fSf2uKenC
	CHk50rN6S0W7tnvcMwNhbmOz8TJ/OJqlbvvv3ti9f5uGcIbaRrfVKy8ixBW/TKO4Lm4py4ChR7F3t
	Hv0DjjlKPSq3ToDq1fmpMj9m7KLGQ/iglt8rph7LnYyEU3GNwpsSvkN/amu+MbFxss05UMwaJRxbH
	htE23gZ8LnwHkdE6WYuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru5jX-00000000iW1-2g0v;
	Tue, 09 Apr 2024 07:17:31 +0000
Received: from mail-bn8nam11olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c14::800] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru5jU-00000000iU3-2s2r
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 07:17:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZLt0sbjLtvbcaNvxjUN3iJdL0euSGQu3MnNXrw7ZtaNsZx1bgFeg4JgD7gCuTvXQpL1aUqInx7KCrw1eAtABieMy51kT4fLwgIiseDWEmipewWs54FHykMeZN8PwnJfD03HVhV86ECKFbLV7rgXq/FtbZ9xLAqF3DkbcJZ0OarkMtInSpnlzCkH2oYSsvxovz/WOukWF/lsxPTXrvq+0dNcdjgpWOjc6BfD+XRM3MTi1mKS8i7PTMlvGgVW1IgoVS8WG973ZxTJGYTrQnxrrkgnuc4T1VhbdLQ5gl9AoYdXO5fUtQ6Bz9vKB4O1i0lSP7YqFuaySOnZi5fcFVlX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3NQQ356oyOLNuWcYc4ucivDZJ962IKE0K5JdgHfb18=;
 b=Xh28or5RkuZcNtMMrkWFAGqSxaNGgZAPQLEOXx7Dj1N6LnSKx7/pAXSG7EZKrWWhL8xv6Gg+Fm/kpqRdCHVSVIuCTXuhgNVKHwmM+2fK2ncKsu1LLtKYD1jm8+DQ7jj9jVu6oHtvrqdNxJzHMjQLUH04d388osFvuE0yDIwrydAijSravklX6EeYcPHVFseLVdkB3uO27gvMEIHSooGlpSQeGh5+ejAJnB4XaxnkTh6aYyK12qKYRuNz9e4XlXD4+ykmTWWR7nlMEeERUag3cFE8zgXYf3FQCc0/g+tDAgYbzdgCnTN7+JaxvO53ff7Wb5kf280OcvLwlqLNXsHMSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3NQQ356oyOLNuWcYc4ucivDZJ962IKE0K5JdgHfb18=;
 b=Wpig7Dic+dY2ajj4oLwWG60cc9xpBbIp1BY809g9xdwwFeGtfdb+uupaEW4hGsvsXdCcBoiGmU2n2kt6jwUnWB6fv3cwl0CWVkq9dLSNFFVF7tWbiD7kEL25jSfWLIS+El9EkRkOXs1NhRRTtZ4kTxaszmLVx1rtPLtyuY9m4oHnBwcL7IjfIwv8m+iIyxzz//N7x2Co2bgDmxRMmQXA676mwEIzhtFiHv57c3B6Xlwimc4MadNDvKeV5cQ4jguHzuvWwUbgU8SVlxu0BhOpuQrX8jhZiAY4oKIr5lYhvJYInh0qhle4mzO0+fvaInxta8Ud2SVnxo+j2g71KlQjuA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SN7PR20MB5385.namprd20.prod.outlook.com (2603:10b6:806:2a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.48; Tue, 9 Apr
 2024 07:17:17 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 07:17:17 +0000
Date: Tue, 9 Apr 2024 15:17:35 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: michael.opdenacker@bootlin.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: add initial Milk-V Duo S board
 device tree
Message-ID: <IA1PR20MB49532A8D4294ADCE0C33A654BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240409064504.4010353-1-michael.opdenacker@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20240409064504.4010353-1-michael.opdenacker@bootlin.com>
X-TMN: [/JjXV3Z+m+e+qQaAayoQXG3cOJUDBunYuQEjVntNWWc=]
X-ClientProxiedBy: PS2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:300:55::27) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <gwoo4v6yhc6qyerxk324zcxgevtdieui53urmf6mpfykfe5goj@kp53i75lh5qi>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SN7PR20MB5385:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ab8659-52ac-49c1-4947-08dc5865168c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V1vuwcvOTLMaYdYPSbzYL2W5lpI8B1wIKosKbgDyVf80fyNF7eSxY0KRnIZ0kKartmvc0l0H6q4B+jknjxqIt3DIf0RZmgTJtSpnlTIEjCk2WPPv970meWPud25Q4k84iiLwX+Jt7TyrYTCvxsLAm1+Wy46ueo6tsvZnQ5jwDbvuk/VHUjvMYpxqaFBXww14LQRduefVEJBJcewCJ+6B8kq48YAEhI2R4+rNiRaBppwYDZTd0d6aWdUHlaTM9pSBVAkilY4s/WKJ4mn6nHK8KB1ApojzzK35rVEPfxR9uNHkd73h1ujBYdmPetenDL9929OwlbCHjhc/lZVxTaaGDzoo/5MnCTjP56aCcDltF543/3UEuWoL0eOiiSlt+JVxzpqajmcV+DqYrA76vRUqlJeDoeuvs05E8yEUI0BrYBNT20oG6bpzkbQ6tulvgWTpVY1+EksWg4huAvSK6eg498NImXPC7HfYiSjpjd+AGaZpzG978UqLKIS3r2BQ9bzS3E1lB2oWXULpcDYarEZ9wicgMHweEY54RxvIkMv58KP56R5HnKP03U2SaI7jibk/zPZQmR1eCpgFydtRmhrx0pZnWGj3Rdm03CkcyqgLc6bUdx+9tcvuD5Ocg1FDQ4bF5xrSbnZIkcZ2jz0y0fHKK/+eSByyFEzNarFdXXc9cmTzc9Nw/fCGx1pBynMzZH9V
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N4puAkj/Vb8JsoOHWbsVpQoqKRSYpX5VsQkJ5tfTGg02aI3fCC2PTMojc0SZ?=
 =?us-ascii?Q?jBHhrJKGs3axQMmeo75iwyO+K1RsW60QfWN9QblXuw2940D92/3Ikdl9nkk8?=
 =?us-ascii?Q?Prs6dbjFCWIZZmhaIADALsQqezTh3HHNvax5cKteHFpOMNdtvYZfewmEgvaa?=
 =?us-ascii?Q?6W/me4JK4xMkiASIVuM9iSiFy77a/Apj5T47Ap/oQTxlCW6FwRMKjoCMq/ar?=
 =?us-ascii?Q?KsfGxXPnBQ6mlm1ey3zWrfDnBhAOJ0HsDQPZdGOG5aD0VvGmOz7shmT1njoI?=
 =?us-ascii?Q?DiURf2bikWfmuGnq1peFRGZSytcFt0SXBsUS6uJcWiQDaUhS8fFAg+q6oTb1?=
 =?us-ascii?Q?H/wDuLmTyrDoP8jqPMoz+gTer4IPzTCEDnbHZtofCAPc62w5ajAGtA0U4Xqf?=
 =?us-ascii?Q?ZrkYRaIvgFgPkTWAS6bWXH4OzZ9Gzw8RX1SlnVBePYonCMhXU3A19ifExeze?=
 =?us-ascii?Q?pK/zM1vQ9VkJf2OU3ovGGvCXtAIM49Qm9Qc1dnh+0vKemxrW4h4+HkLLb7PP?=
 =?us-ascii?Q?WAXvKlyEc0qWJkdWwLemCbyN2oJDUs49RzCs7Abe3kN2pQ207vMJF3Ae3Wph?=
 =?us-ascii?Q?bKjkHktvDJ/YkMr71Hkl3r8v/UOU92SXtfPPmY7mqWdyKXPl5z4SadLnTYzD?=
 =?us-ascii?Q?JBKrpgmEoVMSPGBwQXLW2imT8nxje/hnm44uNIxp1rM7zz8sPNcLhgRd3RZh?=
 =?us-ascii?Q?H1ZSrX0Rv1yCMIllPCFrQvG/7hmNDC2esVOqo5qmRB0A7xnY/FPcNo/HB9/7?=
 =?us-ascii?Q?5tb7Sark3g4CaZ6+suQyQyL3AvqDwwqsaqUdXgLyQ6H9zN9MnZeIuEM5YSlv?=
 =?us-ascii?Q?dXec50iKkS+lzjdrM1Y8rXk4UNC6En6vb8lneyv55a4hi4dUYh3x1/hy9R5G?=
 =?us-ascii?Q?PB83AIe0DyJbc+u0ix1vI75Gb23aatqNX7xmclBReLVDr+Tql5fhPrQgjliG?=
 =?us-ascii?Q?xC/MX55f/bnp0d2TDUZLhQjrW/RXjvbjjvjJ66B6DbOeLyLd43LlR2T83/0w?=
 =?us-ascii?Q?Q7l5LjS2OQidViKuh052McHCnmDud1t4j5rq7JGECNUvhcMCvyluQlCiXVrx?=
 =?us-ascii?Q?1RSXQd9NBZvvT9fsYvjIAsQ3D4Z2G08jXcTRbvXm8E6qqoSJ8rDqtGtbil6x?=
 =?us-ascii?Q?RuUYfM/VbTf5akGQ2JnAslW97+i6cogeqmusaE581V7fGatbg0rFVGSXyyBA?=
 =?us-ascii?Q?QIGRn8oLwzqvh11mw9RzTNIpegROX6f+eefOoDCm4DQvG7X9IxeQT7iC32ex?=
 =?us-ascii?Q?jG0xG/ca9YU5tsoy+Dt/?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ab8659-52ac-49c1-4947-08dc5865168c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 07:17:17.5378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR20MB5385
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_001728_753181_8D6A512F 
X-CRM114-Status: UNSURE (   9.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 09, 2024 at 08:45:04AM +0200, michael.opdenacker@bootlin.com wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> This adds initial support for the Milk-V Duo S board
> (https://milkv.io/duo-s), enabling the serial port and
> read-only SD card support, allowing to boot Linux to the
> command line.
> 

Hi Michael,

I think your patch losts the board binding and have wrong compatiable. 
Also, the SD can have rw support with proper property. See link [1] 
(need 'disable-wp').

I suggest you resubmitting this patch after applying clk patchs. 
This could reduce some unnecessary change. For now, you can just 
use the dts for huashan-pi (with changed memory size).

[1]: https://lore.kernel.org/linux-riscv/IA1PR20MB4953B158F6F575840F3D4267BB7D2@IA1PR20MB4953.namprd20.prod.outlook.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
