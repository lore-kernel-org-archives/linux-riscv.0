Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4736DC4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 08:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=icEi60HhuELLovpbqoVtmfLa+6GHqRvTGaWIvUDLzX8=; b=Sg6AhaQWcFCG4n
	fvlo4FJ95ljwRcyU2wXvKi67f18SYU+Sj9ybQcAZO6m6qRfSm8EDKM2y6hj6tllDxkTfg3z5qzT1v
	NPE3LXoQizQErUr9EenbJhDjjTKm/ntLfaQQiqdARWePxVNT33Dl+p+VHAq3XctUCJsTvMk/BNDLK
	Y2lA5l2F0fw9jB7FBcbDnOzSkO1+ePiJAZTyA7VisWfn622T491jNF6EmutW8jqFiyFFgHW0KmqGK
	6MUPQ5TrV92CatlmBih/y2sV+V+gPrAsT+uLLhu3Txd2SVyrJuzLlXfE+rXEtexA7064LPtbkEmX9
	rmAtqo6DLBGYoXKWZJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZo8y-00000008QY3-3d42;
	Tue, 13 Feb 2024 08:27:56 +0000
Received: from mail-dm6nam12olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c17::800] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZo8v-00000008QWG-3Qfb
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 08:27:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aExYkJcxVz/X25gAZbktpT1nAknVJEO9+1q6661+y+9YxbI34SnGKgNtwUcXWsebIh8p/MMJ07jJ/Z6HnxKtpzGyTX3/1RE/rPxRBbMyl1veZEdDDBF/d1c1Ioc7HSy+06JcZLpFOrAtTdeEgJrQAcZVoIupBK9LiWIB5mwQDjpjIRieilbTRuFJP0YIInguMyQcYbZ3X27rYhdyObuweiz5iVUxbefpwVE3jPYthz6urSMYxSNOCuozDO4f6F9/CcmWSR8C5iscrBHfmSutrMkj0EQoKia7c7WpX95Zgff3WAhm3LMnw6UkcBaPaCg9LCqKuJ1poaJBHSWPX0A++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Slxe8Ifxk4dI3e0L991fFbJ29Fv+8l6ZMbrXlQER2/k=;
 b=hF+p3bTAKvMK9G5AeOLWa5R6W5jMKrLDRJkAQc8x64i/LKYz/HfKac+38cRsnbSIfTMCC85QjSLhZ2F4jckiNj6Zu+dNPgDayJ/1yRrpRKKm6A1YtW+PkBvWDy5KZKufWUbXChIkR2u//aM0II1zFgKBbU86L4znOOGGp6rfXeDwbnNn0npjLeGpWIv/jW48wVMiW5aeB9n+PxAUcHZi0b+6GKdMR4HDuilWoITt5Odsfao3gBBWfOHRGYvCZ64RKXBHCmZfgl814ANbJGeN08CQidMhZov8i+PGlhD98cDclLrRlHLSgXQ+Vx+jwKfBUgYTpQBT8mInTPmJkP87kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Slxe8Ifxk4dI3e0L991fFbJ29Fv+8l6ZMbrXlQER2/k=;
 b=sTzHE16tPy4k/w36CcZtrhUQweGitMJb2wrCRxluNYno6b5tU56NagWWpgtHy9BSCGgsBqtC8CT3o/WepkYjF70ty74bAtY7UUZ78fuWPVwVilXf+nw/VRC2CJvATBdyHkUimUcmgdhFdu8rarsZzogvQ+y2GnBhhexkWX/uDhX3cPxmvyQh/CjJ6v5tyyWPT24RaAeLCp7wY1DeYxmTmwjNcyUv8pIWt9dfo2zK2cs2U6LNsmqlI+XXKw4m7DrEe4CMUKgVm9YGJ93/mD8fnFeY1OS4N1RQDI3U5ulpsC9iy5xfxi0eUsmoFPb4YbL83X687MXri0U0I3oicXmzKQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS7PR20MB3776.namprd20.prod.outlook.com (2603:10b6:5:3ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 08:27:48 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 08:27:48 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 3/8] clk: sophgo: implement clk_ops for CV1800 series clock controller driver
Date: Tue, 13 Feb 2024 16:27:40 +0800
Message-ID: <IA1PR20MB495356A648B06702B3BA9FF3BB4F2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240212-list-grumble-819f7988aaad@wendy>
References: <20240212-list-grumble-819f7988aaad@wendy>
X-TMN: [8BAhYj7SrFmZCx7s+Yv60qkSlhwm4n76KPnu1+SHYfzrG3WTYeOEQ/nOIGMzEI34]
X-ClientProxiedBy: TYBP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::17) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240213082741.608683-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS7PR20MB3776:EE_
X-MS-Office365-Filtering-Correlation-Id: aad7f232-fcd1-4140-ea99-08dc2c6da93f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6V5tr74vDc8g7Cv4y6A4piCIPRorKcI6uWyK2cuwAEm065tY3c0JkfEtDQyESbrRgGlpGATyp5Z9CITjmuq2R0qGrtigFhtSEOaJze2CtNKRW5n66aaWS+np92HfS5E11hwfyDD6WuLh5LOZFoShgXCDC8AXWxZ+i7/BJ+xkBvClCsvejk2UrkGbHD2Q4Whgxwa0AqANcYxjj9tn+1Ig+lI6Acf5I5MzZ85ftHUckOE+9V7coCoGWK60zsuzF4AEwvVlSE9Ky4BFttTaEW9+4bgujKx9b8NwBXMwJyEyAxGMZnSNy6Aq0uUJMYzNMJ+dBKRBmo4PSd69EnCgoM077Bk3Kaqf1xwe6bm+6gviix8NlAwZKUypFMafjdh8IukR2KBFnKUScMF7unwFjo4mAtTfZ3qg3A8BNCWZjMQdmQwmLvYJfPW3qvnxcP98AyQjj5Kmr4Nu7XYt5MBP5kUOKtI2vdKstxGswYzMbhF/kxlYY5O32BWpY5cveT+YsyDse5Sn+I/dgkcXb5v/JSQ9M5hmrj1+Xj18zj234QGRl55HzqqkqVEreWH4oakBePItV3RVexodhHG3w1iZ+da5WL6TcTMhHpWOb5LLIPy2vxhuf3vbnZwl/UotSAPfOWb5
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?139tMaxSgwNS1FUxVIKQ2//JSYAj/EIj17Dp/uci7kY/I56cm9gwl5JqxN0q?=
 =?us-ascii?Q?1vQuLHDrTdveRVY2kufuuirFRSUJlMzhxjx02F1klYSWukAlfozojvzYDmPk?=
 =?us-ascii?Q?CeAo0jRmayKL/8Ly2NvvYzwYQfhy2T+iyMfaoaihBNRzjR/oXn1fN79bbnoD?=
 =?us-ascii?Q?sjjV02RaAxMrnVynvzeNxpXUK5QXiz0klyfBXa8VjsVX77oUMC9yhdDa7fbc?=
 =?us-ascii?Q?9E8p3TFla6UDQwumuHoPWnC34cv5L+x6u70SLxInrdhEJ7YvQGxm7xh5B1+1?=
 =?us-ascii?Q?WvFQTEGQGL7gc5u0MXdfzmzOEjy7bJXCBoRpWdmfAYv/t6KrCtM8Fw7YGse3?=
 =?us-ascii?Q?X+N/L0AkABr9t4BeBSWTGsvWNRj1h6HCJzOr+izKo8aOTvtdAd2qCA5vd8D8?=
 =?us-ascii?Q?i9piau/dInbDGesgmyeFNB52jn0b9cgHPwHZC5bQsJu/EKWAY6xxa5Q7Y0TO?=
 =?us-ascii?Q?fXziNKYrZgvblPYfdh8tVrrK0kReXYAnqPe7onVlDkPfJ9mJ6WUIvrkubXDf?=
 =?us-ascii?Q?IHfqudcMGU7c6DQxZBlOxR0CrpK08goFqfAKbqVuHB0OCIf+doCuawiteYDv?=
 =?us-ascii?Q?TanFE2LQQV+skTjZSgkLhL1KpdNwadrpuYGtf1s0HQzwbx6zJGft8LDwUadb?=
 =?us-ascii?Q?P+PJyIkiyymnxnqOWgGBrE4JAKtDm7Xehp61MK9f4kKSzYuVlX0dGZahSfV5?=
 =?us-ascii?Q?+xXS4sbgq5rIYv8nYIEmKYlvyfRUKTjqh3UptNE2h8O/oBH1j//jW7BQO5NG?=
 =?us-ascii?Q?PMZ0zDsaJnu5LhW91Xy7qhaKbMeHGnTudnOAqEOKu9qAbrbuW0VR9FJBdMV3?=
 =?us-ascii?Q?kJxeGribI+k3OMbqrG9c7SP6mvbSI4hsCWt5hzjVcuNVP0H9ptlBPeTBjc7h?=
 =?us-ascii?Q?nV7XmZSucByE8I2UiWq4T7ZdS9KNrCgoDspQpCngUdaVAjEv6p1wM6+JF3pf?=
 =?us-ascii?Q?/ZDZ54MDQUBMJx1rLoEaFWtb85IQ8BWjBMYvrgqOY7HHx+c6oYaqt5gaSTNT?=
 =?us-ascii?Q?DcQybz3YjL8Os3qfeBfLxDQX/+Ob2kUz0mMMypL4iLpn4AFgn6y0y3RYcwmD?=
 =?us-ascii?Q?ZSazfaEHBigClZuB89ekpis4i+kLFBUBOOFJ8O9wplrKi5LcqDgugX22408z?=
 =?us-ascii?Q?PBj9ssgzL/Sdb0tlb/rJ+btY06tesl8ICHR5vdeVcJLKRwxar8bxId85iGAm?=
 =?us-ascii?Q?24kPPIsHCSSgWuOO6N/lo/e6ADKXZo3xTOjwPHRNk0rxNML2dnPu0PAvFLhz?=
 =?us-ascii?Q?bZcwLe9foWtsQ9VWpxVgF1J0DVWmsXMrdfDhGNkDz+ortiTy/zCINGbr1iE1?=
 =?us-ascii?Q?3Q8=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aad7f232-fcd1-4140-ea99-08dc2c6da93f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 08:27:48.4191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR20MB3776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_002753_915586_E98BA06F 
X-CRM114-Status: UNSURE (   5.86  )
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

>On 64-bit with clang:
>drivers/clk/sophgo/clk-cv18xx-ip.c:745:6: warning: variable 'flags' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>drivers/clk/sophgo/clk-cv18xx-ip.c:745:6: warning: variable 'flags' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
>on 32-bit there's also:
>drivers/clk/sophgo/clk-cv18xx-pll.c:28:2: warning: comparison of distinct pointer types ('typeof ((rate)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
>drivers/clk/sophgo/clk-cv18xx-pll.c:28:2: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
>
>Cheers,
>Conor.
>

Thanks for your test report, It seems that I have made some mistake while
splitting this patch. I have fixed this in the new one.

Regards,
Inochi.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
