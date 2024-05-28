Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACFAC25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 01:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qUlhp7hdTEEH1YzFW41G1oXmHqm35pdFg6vgEvkcdCM=; b=IrufcuqX0bUS6r
	tYytNz+b6kgrt10x62gVYvx160JzSy13P1LDeLwObVck1HBCFGhLrsehuH2t8CA0FqOCnvtQs2g23
	/DyhpND5I+A2u5eG3IkJrzHjodL4v2BSaoVwmmnTow05IUGuizws+NjZsaKF9Y8mZWBZxCmTTCvD8
	j/MYaYDT9ASWoYmf/ukjKddnVsfIEtftQO+peYHkPAKNO5YuIKHzXPZ7zUCxTMh7z33Yw/Ah9ZHKN
	g/50NP8fi+8Q5/PeSQEIiDR9XmZ4ZDhxF+d7RaYBmGIv/S7eslTtl4EjcVJTftV0FUc0EnrVC9SrS
	qtlvxwZt0sN6Gg3qtyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBm0I-0000000Gnru-0ErE;
	Tue, 28 May 2024 01:51:54 +0000
Received: from mail-sh0chn02on20720.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::720] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBm0E-0000000GnrQ-0vnH
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 01:51:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JO4P2bsBRWfvk0qKZPzH3XmkLTbw3bvn7MZwfnv6KePkPEXYYW8BchaRjBhAtoNJ1Cy3y27UXwTCaSErX8A9rDX+eVwK5nLxCztnyHm5Sd2dJzDUALThZ1YyVP/9edFMEBYGhdgrQH1KlKKukItOH9myimNe1fbLnwEHd+k5Wo4o5w/ph1oqZpu65SuD0p93Az3nvgGF4laupnhHvS+MMD2K8b05bNbpNG2kkQkmYNMoohMq1JtO8GaMH8nuJfYqz6H0oSsrW8/lOvg4YXhRgIQe78GcbLefl97k8JR2bLtyidSrqvSOyXTQyP14G15Ca9VqSZNR2VDLMN6VA4Jqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSovCzjXKDCoGd9keow091RvltkFrxYS/0cvnbqwBKw=;
 b=LWNwPV9ccT4Q+PduQaPXwbxq4goyhTFy5oLcCawQ6156LjkXI/CR4tYoeJINJmqUV/piNS75OxzyI2FMPlU7xWzPOsCuC5KScMCuzFdpqYjUOzkqTLfYjCyOVQIBiwyMMcEiRH8LQpGRirtwA9yOF/SiOd4BCzYjizNemgP1tTnvqBBqvHwDxQJk96MX25nOYcefPhwtbU6fj0nLEyxGGzopL6k8IjaCsiqJdF9e46mS5MYxB4LfLVDCWpBezsKU18XyQOm+5XEFcTUjcRin6VS7m/YdvbaC47f5Yj93VgxfCGP9lYYeivexfk2hOTCBySLgaZ9rEJgQ2y80Q8rgUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0829.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.42; Tue, 28 May
 2024 01:51:29 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::358e:d57d:439f:4e8a]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::358e:d57d:439f:4e8a%7])
 with mapi id 15.20.7587.037; Tue, 28 May 2024 01:51:29 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1] MAINTAINERS: dwmac: starfive: update Maintainer
Date: Tue, 28 May 2024 09:51:20 +0800
Message-Id: <20240528015120.128716-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BJSPR01CA0004.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::16) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0829:EE_
X-MS-Office365-Filtering-Correlation-Id: ad42939f-3779-4e75-6d74-08dc7eb8b110
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|41320700004|1800799015|366007|52116005|38350700005;
X-Microsoft-Antispam-Message-Info: +ELAM7svB7TypIh7jXqstHIRxBItDWO0GCg8TkGo5G1k9kJX+Gwus8Q69ieaaekkSrzOKIpJ9RTPt+bbd+cUeY7eYzb7iu+0cEtVEdi0Jt1Dt/W53y3oG5DGXKBpd58gEpyc7lhDCvV7WrPUiwsEyv9L+6OBhkM8gPXhkbMgA8457AiUx6nJosZ4xTN6uKHEhwvbIx/tKnkRbo1+Mq9uIlIV52wUDKnbKKTDX9PpAqbMyRvff1I1ox95jp1hcwqnEp5ps7HsYstHR1Ve0KYWLtZ/06dOvAd+SN4lyZ1sDswb82o1qWQCrxz90wr54zTLMjwU/aV4/yVDgrY12GRhskXijWbOICLFvSkIm+SOMLXEdcauvahbYad0104HDPV8mM85WYPBM8yuQpD3LmVfwy4aSG0JPVWXajv4h8RomgiExxmemMUFF9jO2QC0nHirvftgTDRGQ/b4/JHsFt9jUzP75zLKTBLFOeCu190T7pUhzoFFg/MyP4kSVognGQPUs0rSJ7YEAHmlRDn4MKnkiaZnST9IPqFADpcJQhQBJ27x/Z72aWPUbphpW7VOm4H0I4DCNRSdfISOLukb5FLf1+/jtLv3P7xappSyqvyvz5zGO5j9g1+wmMqcL1a7Rynt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(41320700004)(1800799015)(366007)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DlzQ9cmud3dbaL8wkFUmhfSh5fFCsiSHww8FAGSZeNasVXz2643Pjpom1lat?=
 =?us-ascii?Q?0yYdvDCap2b7sw2i4JnwGu5HW/Gb7uzb86qP0QBYs73GTZAa9pJZWsdpTjTg?=
 =?us-ascii?Q?WSmogOicdBuQPbA7n3OVWN6wDytbE95gAg67WnbhhXcf4o1mB10jinOPD6R7?=
 =?us-ascii?Q?ih18JG6Jb+RyjmPJqQUQ8emLQ89BIMEEZF7bsntLjDXBCckOwCC/p1o/t17C?=
 =?us-ascii?Q?m4Lb/AtW+tKmyLaXm1k1ZDxpAktqOd4Njf6l4AVeBSte+m28AmOUZUN/TaM5?=
 =?us-ascii?Q?b3tEXcGPLevJE555gXGUimT12KM+X4+KqGwqUVjDnjufbN32cGerr5MA/cJK?=
 =?us-ascii?Q?uYWiypnz0kN2RdmpyavNXBuPe8KO2ZVKUPMN3174LXPj0fOZxULC6sqfhi6T?=
 =?us-ascii?Q?CWGd0jgYcgjNF+WeY8EdYQ7aIkn/GwgNhYxIZeJTUmdaNIDIFSTHLw/Y2XXc?=
 =?us-ascii?Q?u27HjSoOJyHBXFqFAdJh5WaBWHsmkBIpztDDBjtm8d6DmlrS026tvMg9UvOc?=
 =?us-ascii?Q?A/dQgP5mkiBp3VAMEbaclUuXUI820G8hZ3AQIwncj8wpDQR7BuRY1KK8IZRu?=
 =?us-ascii?Q?uNT/CkXnMHd8yuxnM2S4vz+gQYkhialNXEZghAMZq1df5uy4+KPx4Bt0HEk8?=
 =?us-ascii?Q?wGw1w9R36Lznca7PZQGGxTjIEGUaeVPDZkw+X61R10y1jA8L//vx83VALHca?=
 =?us-ascii?Q?+vtQm9/AiUDf0jIyVFqfNJ6BPLwzWXx9AfrhXzX1yyH02MChgHa7GOD+Ila+?=
 =?us-ascii?Q?YJypw+13zesCQxJvppzLKqnf/XQ3PG40zKp+QGMIm8dIyP/j5akMIIyx3E5n?=
 =?us-ascii?Q?AAd7f/o/QhoL7OX8/B+GxMZAP8wteF8XfXaPeAhsbo+ogvsOpvwh9VD5wy+y?=
 =?us-ascii?Q?C4xTjACG3TW3EVtdCdsME55skjaJPpHmaGET9lVoD3IqAzySIyFB1a48oSeu?=
 =?us-ascii?Q?nG0MAZtums76kRck0rgFrAKbrdqE08oikySlymvY/ZMbQ6+58nwWtpoCZbvr?=
 =?us-ascii?Q?xQxwdbvl+C/pFLzq04J/4rlLpDn0+ufCwunvaj/jl8RCLzFIZLgwCknERMe7?=
 =?us-ascii?Q?+QGds0pkDCNVxHOttgsyoNqq69gf0h+NW5zQs6JhVtPryxAdxdxx+hmgZXCr?=
 =?us-ascii?Q?2PiaYNRQ4ahq2Bfz/qRF2HF16Atwc+8eIMbbn6R5MAX3II2IA++7HyId1XeS?=
 =?us-ascii?Q?4aR2H1MeeOANC2m2Lm6TJNR18e7IQhSYj6x3lIPKrKGJ+8yJAdtfXdX1tNRD?=
 =?us-ascii?Q?md1PMzPuPD3+SRlJ3zD6vYFK9qKMpvjG7KQytqlCDM01NMk52MmC0EO1A5Po?=
 =?us-ascii?Q?mGqlTbCaEdiSWSXWZE2iJw6uBwbfHA5U29vUu/ku7X4DxYMmirXlnxdx61Bm?=
 =?us-ascii?Q?KwSMcz87E/ik/TBf7AsrgBdS0WzqGwuG8egpjmdxVWuEy7601GW898JkiwOF?=
 =?us-ascii?Q?L8wYyXu9TFsGNDg3IZvo1FDZYAv9UaaKXhH83ObuCNmShEWdjsNg7EjaLIfq?=
 =?us-ascii?Q?yD8IPwk58hVje+0a/ItC9/7odLzgUzLBN5zkDUegw3fp6+u51+0RIld/U8sn?=
 =?us-ascii?Q?oKRpnlli/VK7dH19iuggWpgH26plFvuegLVIlxrKvQWRcRDq0cZe9DF1RZyy?=
 =?us-ascii?Q?5w=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad42939f-3779-4e75-6d74-08dc7eb8b110
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 01:51:29.0973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mf4DxYYuCgHjS6ke59YDQVHCwwpnyXiqdvyrqZClpuZDhUnmq+RxJSA+l1t7UP0DGvsp/pfWi8jBIFQUpmfQGDtdmAt9A0mqJxsKSwf0Qz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0829
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_185150_360418_ABEBBCC1 
X-CRM114-Status: UNSURE (   8.68  )
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

Update the maintainer of starfive dwmac driver.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6c90161c7bf..2637efd7660a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21316,7 +21316,7 @@ F:	arch/riscv/boot/dts/starfive/
 
 STARFIVE DWMAC GLUE LAYER
 M:	Emil Renner Berthing <kernel@esmil.dk>
-M:	Samin Guo <samin.guo@starfivetech.com>
+M:	Minda Chen <minda.chen@starfivetech.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
