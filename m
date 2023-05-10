Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FA3C7EE25
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 20:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+nv7DXFPejHOLZ/5aLgtg/2lJOmrE5ZEPF0EfksUe8=; b=ApY7iETr+eJZwh
	jtMRN/g1XRZv3uINM98KBaorTdCllUB7dgB+bO3ZdluH4lE3T9qvFm4xSBSqnIaOo4PJE5sYCZ1Qx
	ZwtBUM+iSvpBM72LuR/Cbjo201O8Aib+clCebjF7VvCZaxmAnaGnFrn2lUIczqLPowJz7YyfazOOU
	+Tt4Z+7x7wxZFy/U1voLfG9IqwhGnooQ2/zNlht+BVoBf9/a9O3+eLhNs2R2/YJW5P8TMcpO5YzJL
	7h1WuVs8SA0xMotoM72em7ovhfXtp4G+5SEKGJQ3nTV/cCT/S3zM9yFJsRmRwW8E1r9ZfGNhEvC3g
	sohbZ764Khu5Zq629W6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqgf-006y6t-2Q;
	Wed, 10 May 2023 20:45:25 +0000
Received: from mail-psaapc01on2070d.outbound.protection.outlook.com ([2a01:111:f400:feae::70d] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqgc-006y2d-3D
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 20:45:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGuvlL9UzFGTGDrzXE5GTpUyvQHGfzF95TRdZ2MVYbOoI1K47InqT2mJf4GB/HsXndu650RApEAkMWn1se/yRGOlhNZyyqcmDT488I+MS4o+yxK7UXSJ2G/fgaSjByPkUCyVum+iKjyONogA2wHNG9LlnU7QrKt5/qIY228BFBsQnwU3zJ22emOmEBGTaldaMhxA5bB6HXjQd7NJGWJHi8aJb3h1fYNV6u4gxdQSA8UJ6NlQyF2MZvJGGEg3ZYG+Q4JMVbsdZOw1PT4ChRINiw5fdkLvrkEH3AkqmAaMwddmIIy209slzVBbwi2fdhRteQaadUwvVPdj8gNtH2jHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVRb41r7esvZvuyPJ7wgsAcdr38iKzRxjcm7ltYxOoY=;
 b=fBFH0SJ1kmoJH48WEK4Z048SKSx1L43Rg+Tp82GFklgm1mJrYjzfyxoec5F8kW8HQcoJtRj9+kD7clN1Im5/FNn0E1EIwRWoBuPcFYImSGvYyvGRx9qECHTT4b3y5lZ9r5mFNLtv87Z/ucz6Ti5X90qo19HeXcHYPPDc30r/d10H5BdhSQc2dkAM+SyQIe6CY/Fx5DslL4GyqZe+O8lN0+5QN8038SqiHfbgOFGwO/W15XeukA2KifBll031NMyN0d9Eq6lLQoYrmtQdNpY1MHKxyj8RMuYx/7VHi4AxydNbzP1PmrZJxuAJj1hxP5qWaXT3cOgpdcuulJ4f8/hEwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVRb41r7esvZvuyPJ7wgsAcdr38iKzRxjcm7ltYxOoY=;
 b=YNv8pGZV0nsdB+letqn3UbcGHWLMsB/21EzN6bfH1DgsdeQvtCxA98Z/3M1jIO/Hl6Ds9KAC88qwJexhipQI9PbY2nfxbUvEWHB3gPAIBZ27ysfTtHeyHJi/rrpkNxfs/y06PxIs5Awm3PdXsFfG8WSmybsa3MgXW3Awl7pZQbhEuoNFsKiYmC5np0chA4D+Mi97Dt1zvYfCZ0lo0C10lNstO+C05flk7/s1JUZ3+/sfHULw5hNNiAyzCuxtNW2Jq3eqFZOutmaUINAYJWYKOxQf0Bxwf41GqMTGjaBGDDG2wEavHtTZuAOOyQfUdo3gI0es6JtsOdN7OmRkt2q1vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB6468.apcprd06.prod.outlook.com (2603:1096:400:459::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 20:45:17 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 20:45:17 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 4/5] riscv: defconfig: Enable the T-HEAD SoC
Date: Thu, 11 May 2023 04:44:55 +0800
Message-Id: <20230510204456.57202-4-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230510204456.57202-1-frank.li@vivo.com>
References: <20230510204456.57202-1-frank.li@vivo.com>
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fe208fd-d1f9-4dd6-5f4f-08db5197764e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rA3km+fjghQAsW2ykWKUvTebaKyoyNTe6c7TPAcGvszWrXQfaaM+SPuVcS82hdbKlx+9r+pV/7Inr8929uVm4RGmJ33h3vk4ZSA5dvo7zB+18LR9xxOX8ln23H0JYY6CRJXwgok3g4yqzojTNtm8kLlAV2cqMkyEDXBPg+eIF6NPJH2U9Q4s0ewLGQ9tuFSvtR7hboWWPEOg5msVZfuQeYWXWn3lGKhWDMkt3Ab9kcudigH7xXjZtYD5ShS/jPxiivQVp6UA/mkP5vmNcfHGsOOnzqYVveOFe7P4oN4fxZhwFsPSKK6M5kO69mUB4UivI8oRI3k1c4HlyPCXYG4gF0VEhp/ppbP0NrJmIv99YhnDxH5/CkbQyki6CiG5+HV1nBUqvwcMnRkhnyaZxLGxINg+GV2wyzZBPTd111bRXlsfXxvT5PkMcLoo+N+8nIj4GarT7dS7xuK8L8SbXmfoEW9pm3HoWAPYv63hEiqCYyEaJGKd6mo67x4ezHlEDa5Y3junfqpaGYnQnHmSCJJu27T9ImeSrahXsKNgV6dV4eLfICHJ1K2+qdBw0n1EceywEzM+cosiSrNu+BoClBbWM1SGhIhrrYtT1bSv8TYgswQ/3fOlaNuOwFaSW2hUvy/d
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199021)(6486002)(6666004)(316002)(66556008)(66946007)(478600001)(52116002)(4326008)(26005)(66476007)(6506007)(6512007)(54906003)(110136005)(1076003)(186003)(2906002)(38350700002)(41300700001)(36756003)(86362001)(8936002)(8676002)(4744005)(5660300002)(38100700002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Vp+4MdoD2G+7DQnqnlS2/s4R35eNuUNl1cyramtUFZu/FS5zAwaNuJ3sRXwn?=
 =?us-ascii?Q?fYwiQSbNXPoJJUm3rZsJF8nM/WmD3Sh7bnpVvNIsq9L6kOcGzV4fFrTHLyNS?=
 =?us-ascii?Q?E+16mAWDmckPZUWgg9qu+31Hy3ecqM4kZjQmFGED1HUANU3ilP3XtPySo0nf?=
 =?us-ascii?Q?vfs4j6tfnOpSz1/3+rmIi3TCfo+SGJENkDy7o87Fle5p+Svmkkdr2yt0CKXo?=
 =?us-ascii?Q?X3OQ/KV1+znJc7gPvA6tC6WmefSIrys/3FtHiY8SKN1OI9Cr2oBob4gFXppP?=
 =?us-ascii?Q?SCRFHkeYPtMBebRKJFQWxGgI4BTkYFYjJ1kDaV6Z2MgvCpv9TyAiMx3sWFRT?=
 =?us-ascii?Q?g2GKQZmAAFOZKNLn+AY0ir2Uy+If2DIcNQ9GaOzuxbyjusLJBx4nb+w+lz8l?=
 =?us-ascii?Q?gbI2mHmZ+bmCM7gz++vAQTDd1xauRjFEOtA1uqDD/n4MWpJLAi5s8FsGS7D/?=
 =?us-ascii?Q?KL96SkT/Wy9n2WOKClRCtnwWbmaP/FlryYcZpGkmwAPPbN0U3Z/xhRQLph9U?=
 =?us-ascii?Q?Vt8TyXyMkm6EDdnKifZC+C5HgfXJmNvgJzAEGdstvy7vzKsOOgHrvilBDlOZ?=
 =?us-ascii?Q?YeK/S4Rn7VPoYW3AEEECxQGMiY1UtD97z5Foc6JNPzr/uM96OEZyJ9V8yPtn?=
 =?us-ascii?Q?jQssuDvoJ1ZQIO+yb0TSn2UqEY2Jw5BfxRKApEZVukvsq3xbg5tBD0UYzTWt?=
 =?us-ascii?Q?AsP1YLcqpJ8qu1gnpDsM22iUFus8rJ5FTdICShRnyGOAPl/FchdshnIZeWdU?=
 =?us-ascii?Q?EUTQ/jC/qPuVkOMMySJ7QfAC94lECQhfkWZerQB4mK9TmvW+/dAd7k66WNXo?=
 =?us-ascii?Q?/637TnLis6Kc0nUtUBir7ZZOm4h0jCjyn2ik5AYm0aoxmnoivurTp/sHU/tu?=
 =?us-ascii?Q?Tj48mVCtYS9JKQLGFAnvKXtloEKeFVyrfycCzMijNBdbY/AlgeW9D+gQJzbU?=
 =?us-ascii?Q?3WjaWkmNRMLXwKfl7xK7ExZ7+MVBIDwaTWwCBuy8R7z+4Bj0FqyoK4TiR3fE?=
 =?us-ascii?Q?q0J2/PNI/9cDT3dYw9/kiXJINHEwp2E3hk6tKvQoXyoPiPW+Ih+f/PncKBa1?=
 =?us-ascii?Q?rHpw8Mxj2zxEfKzpa5NjsfWFZYRO7CLIC38DyF/t4kuI6t7AtGMv9+frFPr1?=
 =?us-ascii?Q?T/z7EOBgEpN03fVby4qculL7HMVZfW/jpS+qPvXWE4KHyPvBxVnsJ65ZrJaI?=
 =?us-ascii?Q?JDveFW3Ux6Aqg3HOYPjZJecfS2IUrcQnmpsVhZwktY8URpIBpjBJeE6XJr7I?=
 =?us-ascii?Q?Uad29+VHyAaiUnCH0mfmg6ikeMmRFCvUf8VwKS05z5bfgrb+VqVPhbVZkdTP?=
 =?us-ascii?Q?uXkkbEo6Ih1p7g00p6imuSGAxLXUyRJRR1BsVLWJUDvum6eml1V+q/nvPy6B?=
 =?us-ascii?Q?z2vXOwBVDvNTuY1tUV81VMTw08WcGKOgQ+WVAp6KvBzlPOvoetmYbrD3lL1C?=
 =?us-ascii?Q?5yrEY18uVLsiOIFrbX3YqJxP2B9R/lOzjxAQ10RyRSUvcTezQv3IYQLbA2/K?=
 =?us-ascii?Q?1R/mJFSjLcxZDKLTiIOS3flkOyQjQJh88ltL7QNFHQ3ACeBkmprpuFkNCY39?=
 =?us-ascii?Q?I2Otq18Ge020S7HNQ9RZK6OqjApK2x9r55yPaV8K?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe208fd-d1f9-4dd6-5f4f-08db5197764e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 20:45:17.1611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvbLyuRV8SQeQCbAfOzPpVOo8qfi29BTeZzwzU4yWet7sSle2QBVOjKTNrghOmy4X1dB8TPkWmAxzoi1/AH2/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_134523_034802_A77EB255 
X-CRM114-Status: UNSURE (   7.04  )
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
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Now TH1520-based boards are supported, enable the platform in
our defconfig.

Cc: Icenowy Zheng <uwu@icenowy.me>
Cc: Wei Fu <wefu@redhat.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index d98d6e90b2b8..b4d7e4556501 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -30,6 +30,7 @@ CONFIG_ARCH_RENESAS=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
+CONFIG_ARCH_THEAD=y
 CONFIG_SOC_VIRT=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
