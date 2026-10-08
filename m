Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E801CA600E
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGCdfc6ilDE1ftqMewme/R+WSmvSyy6U+Ocoqsu6jJM=; b=kEZLDt+0a2IMXC
	OSdpqdpyZQTjEEe7noGkM6N6R/txKDsRdmK/RMUsscmc0iaK0Hfea1Q0dFjDVcG2w3UvC1PZNdsVP
	pUq1U5VpnA/GWWrMHTwBWoE27q9TJHiQZcLc1i4yq9BmW46YhwCr13S3EtIzYqwbavpPr0eJ/AGeG
	0ijAONAehfxviq/x442aPAffBqY+QZRnBOJIWL8j4DKAlS0ezL1g2WpHS8qUmPGmcrygpQhtlqiEh
	EC6pEm4VvHe0CpSP7mXIwIyoxkM6dKdtpG32jFSY0z3aUJs9hVIP1ss4yLsME8bSUfrsA45lPYRUT
	+MXJ8I9u72moNLxDtRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnKA-00000004LxD-0cq3;
	Thu, 08 Oct 2026 12:34:14 +0000
Received: from mail-bjschn02on2072e.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72e] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnK7-00000004LwB-3jLN
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 12:34:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgeRS1FXy4RAFzdBdpIOTdEewdZQpE5QuxIAOIILktgFF+nGcSF8o33TpiKMiPjslvM4pKL2yphoskRTSXsav0Ipw85CjPW1taR1JHi10ajjPqf6GzRQsHEtHj8uzVaRLTML/FWRE7bb8Z2DAWJxIQE01EQmaZEYes8Id99Wsu0RdWN0Otht3aUWgQ93z4BR3TLbSANyy84qT8K0vCIs38tcKM7OBqljS2lwtcaFWC5KVoLpl7qqLaiUHGeFKC8s1hmi5KZSZgxWr6khuaiTXOx+c4wVqIckCJpOZ6MTDVH8oP3+P85a4iEXMKE7HTp3tlZCkcrGcAd+FdMms8zISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgQJzqNzMNQKSUJiz/5fjNJ3DzvoNFpu5AquOA3Mohw=;
 b=X4fdQyJBApcu9OIBUW3Nz9LZIgm7xEP00vhCo988T7pUTjlZ3OnTHlF8ts7ts1K3rxMY4rRa53JzhXDq2Gj/zuGNTA6X7OrbPnsTlDaC5whHi1zwOdeY3Ykbb3aiDvt0mbZqRIwiu//uDa80lDMZ771IMc+btV2Jav1sfyptU5YVhye9ILX0YO79oOjK/ZGeK1YlmSPr76JVPcajvhugXkqbOXkG0kbz5CfQGYGDCGSVYkzU1qxBOKLbW+nKHxjJ5/9EjhB0fB/cCDev8iKbap8abaUNzj36KAOGICcrNXkCBJVPQ1ocxEDNC9igYHJjmRGwxMJGaHgD4RQAVzqH1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:33:52 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:33:52 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v6 03/15] reset: starfive: jh7110: Match auxiliary device names to jh71x0 clk driver
Date: Thu,  8 Oct 2026 05:33:26 -0700
Message-Id: <20261008123338.11081-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::26) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1268:EE_
X-MS-Office365-Filtering-Correlation-Id: 328c0713-7b90-4ed1-c381-08df2538690f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: vlE0OFO6OYdVb4SRZb0vCbHT3anfQkK1/VcTBICN5iCUfinPT0rSGpp5o8KvLuQLi/OyNksWZ3JX1cX/QTXV8OTusH4rnGewHa5zRULW96H6uGob2hCAEF3f8iEK3CIJ0Sfpnia6j4k0NGwm6resw8Gf7yaAot082Hr4/kqRv/GDgXlxr0OgWZlXQ8gXBXg0Df+TtIUG/tbW/6u+136Ay6vst9qK15qzWwA8yHxNBZfWdyzzINGxv5+gNLQbV1fPL+e07jJhD6vRSrfRJzbNVyVIrNgj7ksAdhzGd+Hv1TwZzrQKAaFTaHhng85n8tgiVTsG14j79jxAKRqJ3ihL8VZnlKr3rgHOL3Ru3wi6DQj15xosPkAUr0EqAQmW+DD/LbfwLd/RqqDInbvA2E8ZLl5BivKKij9QPrbNv881j183nAiE2UrESUhnNHG9/LzktXgJatsOfyht6196sGfRvvqgLhRxUibeuLTmyP3bQyk0hl25VDU9hDBhdG7+OgWbdWSx4p/7Y8fm5AQ9IlJJIopsqULDcL8dExqBeqhYsyYV52bk3D85WqA+vY0MoK5y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4hLW1IDp7wKfWPpsWjQVEFZi8hYIr98JnMlynuHFd6I6TTTgfQL2JsLS5pcM?=
 =?us-ascii?Q?TIL+TE8BY/qz+5tJxm5KAbhFAiJd63eOAXbiHCRIG71w6Ld7n231lIHmtjEV?=
 =?us-ascii?Q?VgrPbY7tCPnlvHt0QDlnOQ6xjwlL8wcrvVdHUkREP/6SGRzG/KCi1boX20rP?=
 =?us-ascii?Q?I9qmOPIubgMPjkZhthoUWIGxW7Fup0TfpEcZy95RqL77A0BhBK7uAHIIlKm9?=
 =?us-ascii?Q?PDzLT/b+kC8fwGjszv8DcE6Iw9wHNARvPBJt/4vL62/mHD5RXW6Nw9OCTulm?=
 =?us-ascii?Q?iXHGyzGf+TL0Iet0Uab85eENoqkcUWxJgo4/a8843WlnX6LyzQpudOmyWbci?=
 =?us-ascii?Q?96mjXWPuaSAZbQvGpY9vHdjXOfSAB4dKL/BorQu0+eWCX2IJAqWJ83HYoqga?=
 =?us-ascii?Q?EPDfNebSyLdGWen2aJKRkt1x+pDpyr/YOd+RhzVDjXEzIDYywbJH+LiUlFhR?=
 =?us-ascii?Q?xJsCJZCri6C1YJj/PJfo3rSzcR/I2KazunYgQHF+qnFb48meLChfG268cAA0?=
 =?us-ascii?Q?fArXQBSN6hOV4Jn5JhXtsFX2F3+4GimRykb01fvk1LlzkxfhLmzbZhwzVBOG?=
 =?us-ascii?Q?yUzB0+Oi1w6+gOL+VvjOntEM/DrArgJAxOUgcrpWB/6Z6nXaCweK3VOBZ2Xv?=
 =?us-ascii?Q?lL2Is4d16xYOi0zLI3avPDciG9nrfXVMPTh4ijE13aDCQc+nh2IEJb0RW7+q?=
 =?us-ascii?Q?VNmdVaxNCC60w1nUqM91kjeXzHW46TOFu+1Fnl49EbPRFexDob9ViMvSKCMk?=
 =?us-ascii?Q?fJIClhl8Pa4Knv38GyIkt4lEnpVFLmzz0aAwBAfO7vj13UiusU90CIxkyxWc?=
 =?us-ascii?Q?2nr9ad3HlRRXDeu+WE/vYY562Mt+rB2kTQmUrdgze7jh4iF80iRJxcNHrPGo?=
 =?us-ascii?Q?o6cpfOJMKQrXer3yr6t5mmkYwYOIuTbIuMg4Qwz+2hcNf865fmi5jbcHRFOH?=
 =?us-ascii?Q?BpQSsoCIjVDt2vW4jiOrOnOwZ7LhN9IPZZFNC1sXW0rATePtYwHtiX4Zr3Tl?=
 =?us-ascii?Q?holX7yFVFjCKk4aLKvVXa+hlvw6kKYHeGAW7jkv/Z60tWs6L/ewta8ybGms6?=
 =?us-ascii?Q?O3bbYYZUR0DaBb7MMRBQhYVnzcHGwRT/1EADySxn/pNGpfXgmRX4Lv/iPnio?=
 =?us-ascii?Q?3gZhlwz61z/k2rUTxokO25yiiCyNhApKvBYVbTtBfXl18scBE3+e9KcWN4Ex?=
 =?us-ascii?Q?eFIocptFDnWOOU5HNBXYT9cYim630iiXBzrBGc9FHwn/SF+Qb9/Krel7x8f3?=
 =?us-ascii?Q?+8u9mPl/HGcCM+uYV0yHJmdGA9e25CSazx/aF+yxur0816OhdVUEVBhXfdiA?=
 =?us-ascii?Q?jD2pObBW+V83YxjnBFVirSzHlEjshgt0klbqDJs7v9HvnRtL5v6z4Vz/Z/ec?=
 =?us-ascii?Q?ZOVOJUWw0r7tYtDrHgV5T4tP2MnpwUjwPy7n6eKKbDMdALL1KJEzrM/Pekvd?=
 =?us-ascii?Q?L5USy6EKJg9dYH2TtKj0CDhB73b1zaAZSJhobVcomOp9VRaEzgoe3DTCmjvS?=
 =?us-ascii?Q?sIMFs4yFHlE58fzvztQk7sZLerKcNp3bp5C4EDEunrLLDYQfXFeuzcJBizOi?=
 =?us-ascii?Q?xO2M712qlvVjnlnSCR6v889n/BDmTeVrYbOyjVTMgzlXpsvmKtdMhQP7fOwd?=
 =?us-ascii?Q?KHapqsglU6fsHT8peZl30tyujt0WoAysKWeXNmNGK29og04sOi2UTS8sal9b?=
 =?us-ascii?Q?Z66zvx9ElQWwajJOxRkvsLfSX9Wlzpk2tOfaf+29IcwQEZAOK6mBALr+0Nqo?=
 =?us-ascii?Q?RM6gPyujudkKgIlTyio+400T/fqkiwp7AbLWYzRE8NDhLT1pvbRn?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328c0713-7b90-4ed1-c381-08df2538690f
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:33:52.1929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cCknNX6kJ7mw5I322AIK0M/INRUsX1ro+cc1vBlwli4uMywW2g6otfC+/jVuzt3m2UmTHxOqsPcjQ8tJSuB2wtssONsK1rKpru1alSKlVribwExZfEK9Fo24rzFv4EI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_053412_240612_41F1BC2F 
X-CRM114-Status: GOOD (  11.90  )
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

The JH7110 reset driver binds to auxiliary devices created by the
StarFive clock driver. As part of moving the reset controller registration
helper into clk-starfive-jh71x0.c so that it can be shared by other
StarFive SoCs, the auxiliary device names are now prefixed with
"clk_starfive_jh71x0" instead of "clk_starfive_jh7110_sys".

Update the auxiliary_device_id table accordingly, otherwise the reset
driver fails to probe.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/reset/starfive/reset-starfive-jh7110.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
index 29a43f0f2ad6..c936e61156a2 100644
--- a/drivers/reset/starfive/reset-starfive-jh7110.c
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -69,23 +69,23 @@ static int jh7110_reset_probe(struct auxiliary_device *adev,
 
 static const struct auxiliary_device_id jh7110_reset_ids[] = {
 	{
-		.name = "clk_starfive_jh7110_sys.rst-sys",
+		.name = "clk_starfive_jh71x0.rst-sys",
 		.driver_data = (kernel_ulong_t)&jh7110_sys_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-aon",
+		.name = "clk_starfive_jh71x0.rst-aon",
 		.driver_data = (kernel_ulong_t)&jh7110_aon_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-stg",
+		.name = "clk_starfive_jh71x0.rst-stg",
 		.driver_data = (kernel_ulong_t)&jh7110_stg_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-isp",
+		.name = "clk_starfive_jh71x0.rst-isp",
 		.driver_data = (kernel_ulong_t)&jh7110_isp_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-vo",
+		.name = "clk_starfive_jh71x0.rst-vo",
 		.driver_data = (kernel_ulong_t)&jh7110_vout_info,
 	},
 	{ /* sentinel */ }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
