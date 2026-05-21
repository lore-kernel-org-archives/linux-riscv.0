Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7CBCD4F54
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 01:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpEEdWlxugLFcYwbGyj/dJQx5efqHN+dWtxlVsWl9/g=; b=u1v8fvimU+kR+3
	fJxbh6rs5LYduGX54XBS08s3v4PdwqihlZXYYbYp+zms0p1dwe9j/RMuxZvWh0+TLP5rUitOtI/pb
	Lun0PVNZuM1dZQG84+4xjWxw8dp96d/Fc4MfWD2yXk5u1Hw8tsD0PbfluLLovzHti0hL8057EWKRb
	UWpRvNFpy205ij7R9SArjyHowPM6r5QzxGNxgKb2xQiN4TYczLO6lf7LE4ROvmq/xIctVAS4E7VOF
	u0ANNFrg/DnrbbTi6BuqG8r+1hNAGtkiMqr5xBcdtH7CMB4A6Kgs78WDjoCRYqDFehufyxYNNWqop
	lWFkTeblrQ7g4xzSmWsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsEu-00000006N5B-3ddV;
	Thu, 21 May 2026 01:30:20 +0000
Received: from mail-bjschn02on2070f.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::70f] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsEp-00000006Myh-3osY
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 01:30:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+UOwK4cTBM9eF5MI8nbDIGv50A6wBHP1mk1F59RjlYS00Xtpmyyw5JxE/haT6dZ0SXj2DAGpVsWq1o0D7x21rctu4ag4pKCn0RxfoG3WsqtVQ9mf+2wdkrvtQzwQPGuszQ6+efCXUFDQELSNw+6eznQAoPjacP8sI7Fr+m3xwd0PNQFRsBcaOi/FfgG4iHhzvFN4uIQE6ybbP3cuX7/EDiJmriYOM7OlCbGjV2pce/L4HOEK556PbiMRIW75g3EQyHKuUyMvFlWDUwRdZfVBc+4YgDbp0PSv/kU1ddonSsf+1Bw+WsixNYKLyhLTAEag/0yWSU4DV0nxzKyNwF9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSmsESxgin+dQu0muheq5qsf6lX3hGrq0wz6QJfTNRg=;
 b=Y9lVqt/JhjFGgms2rOAwAYz9bkZXHd4dC/R42F7iSh2zE/FwX9sNfqYsYX/Yvb0DNbxJYW9vIn/heHqV0ONOJLIbgiiDUUyC8y9htklMi+dcfRi3B81FNH0YhIvnQTwy5tHATNv/Doz3K8Wx+KPlvVc3xOx7zUxlevZD11WSPMMw/8fOOf3Lzyqskjg5UQR5GDPtoVT0iWmADvxiJNUxqCIXk221Aj1zHJdS7e/UCgMIDSb39sTTyE/jpi2CAg79W86pXFB+dp8y+NByAGmSgX8Ii8BXWtqa6YjSwrkFZCV+g2kk7qw78gnMxHUyX7cMuvsWuW+tT5k4E9IAnjuS7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1281.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 01:29:54 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0048.016; Thu, 21 May 2026 01:29:54 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v3 5/8] reset: starfive: Introduce active_low
Date: Wed, 20 May 2026 18:29:29 -0700
Message-Id: <20260521012932.24163-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
References: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::16) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1281:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e0eaa0-9b42-490f-1546-08deb6d8761e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: a5Km0BJnhTplF4pVQS9gVPOeu3kSLl+aW7L/5HjS/p1Zs7Ufysk2HHVFJtq+pqph5hQAYqDRIyBLkH60JBPRpeRXlsbvliz/6Rp7UuVYJ4s33qeeFOpxXbzcwtb82GO9bWyEoeu+ExYZFZigN9cgAFxuxEgs8DHiNtFbupMiDXnBVRQP7n8NYVI5CFx4NP+ln+Ik4igjpvLgUcSHTY6B2M4MlnsexwoKmMnyRp1ImWejhHO4jIxTqRvFQoZzjLZgq/leGTQ6LK0BXgPf8Kn9xn97MxIbcVTNmCiBiHwi9X0LRdJ9oEqtMU6zvd4FY8I5QLRf7G29cQ5okORy/qQtBq9ssvWRTIYKOCQ96d7+/CuExpjPUkg+PrVuTqFbbbpZbqNvy0X8DyF3hvxCcQIgP48TPku6AsLYiX6dn53OX2+TeZkpxIvFVci3039ZQvWwuYuJLi5aytSe/K//FB8So2PcSuKurGddjaTJl8ksK3KromoBcgfL29E8KzmiovJzbFUvYqYBFZlgvs5ZnXPOtfFBIlILsvOa17slixZNwCG8V2GJ9Uw2XhG26oiSK+Or+tRFhyPmcGrwhrzPxrsjAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0sO6IPrtElgXkp7nMt7jdnZn9kbBZofCKXTVzi5JZJuxgvAUc0c7DAHPDN1O?=
 =?us-ascii?Q?tmlwo+xJ7AQI3zy8aoY6JRg9iOFIr/ciG427tfgvg7Ob+8pEGbb43NEadraN?=
 =?us-ascii?Q?Y/RRLCTAg6Wqjftk0ASl8lwvFeMVJpKFUoL8NiXnk9xbLhP1O8bl3CD6mUME?=
 =?us-ascii?Q?kYQAH2XdH5rU8QVrS1mj/2Ljlu58Xb+UJ4LRR8+g5ZhUgQBzMuYlIkjmCZuT?=
 =?us-ascii?Q?tFAn2f26OZi/THePWU1lZVsuWM1Npl4/mgX0dbhar/SZBIiNu/5C8dD1ZwWc?=
 =?us-ascii?Q?Lh6xrCCc6qANfZfhPfxF0liiM0WG+CGCTE6+lPGoehKapxmGlhGPWk4UVNty?=
 =?us-ascii?Q?FSyDAueVggADH7IA9Ca5zNTz0jgfigqf9g1/hOlR89Jn6zN481Jmkjo3aFBg?=
 =?us-ascii?Q?iCKIUf3uLmua+3NUu4ayfU4eUQmMTSDR5MUL4tBSzHwMle7TmgHFYH4UvNj3?=
 =?us-ascii?Q?U5mPc30OeFkQBJUYTDURCWg+xvS7hTKqjSk3kjgYjDAF7gUi3mw47AhR1qkN?=
 =?us-ascii?Q?Hp5kXvA+QS9Lw2j2X64b1HphiZfrfkApd9+7yyjKMXqCg360FlyE3l9qo4d4?=
 =?us-ascii?Q?ZyExDZhQ2so3u3Y6hu/xGEFmiR9aqzsM8fpN7ke1v2zun1u6dM4yzkFRL5cF?=
 =?us-ascii?Q?nTT8JNwxy8NMDelqYHRNKYfGl4VWA4/RrRFQZwMAZqxo2kc06YN9FKbFRDl8?=
 =?us-ascii?Q?ieXPASjQ7BamYHUtbieGW7Yz6tFH5ofj4tfQUcfGoThxcoJL8mzOon1Dh4Xz?=
 =?us-ascii?Q?1TcNObSuLneJD0Hh+Ld48EWm2HRLers1edy5NseJ17dNkaUIql39ZRokEev+?=
 =?us-ascii?Q?FcBLqPv1vmsg7oPEJ9mDhyoBcs4f7XcJwZ5dUBFZ3A3EuwWLXB3c736e/qfg?=
 =?us-ascii?Q?sXaV72IEvjqGqSMxLsvhUeQEw+yuhfRDZfphNSabnE4jOeb9TSohi7avAwWs?=
 =?us-ascii?Q?CQrZv/He+fQEvdj56flXl1slgPe1L1RdF9LvZCD6cGMgHruBhlWH/T6Vo0zC?=
 =?us-ascii?Q?OGzJnXNHw3ru3uVA96yGRnalb72dL89yl4CYE6UrnuIuelR35NNjGuKCEnmM?=
 =?us-ascii?Q?0iCRpzNXxTdXYWjqGfTyNDx5vFGSLQSBArOwNBS+Wb+8ZbsTtTMSs2T62g9M?=
 =?us-ascii?Q?PxmRKAt6bNGAzNn1SJ/asYue3xZ+juXCSiNKhDMiaoG87Tq5r8jjahlU8/9T?=
 =?us-ascii?Q?wCOF57kypftteD5Tkkplj47rjnhfNHa4pSqvtEFGXhI7E6z72OYV+US/ZUln?=
 =?us-ascii?Q?GXxbtdhKEP8YRa3DSnW0dibFYpSAVmw/n+KCf5blwlx9kgku14YwT38YoqFl?=
 =?us-ascii?Q?iupdDDNHvuen2gzr3sod1jKVjNBHibpDtaih0eTDS9oPWlVbGNlid44ZR6rW?=
 =?us-ascii?Q?ilUpaQ+KumIvQ0By5qw9B5KQJZerFH+voDxi+nvJ36G/8Mfnd08MXyOqh8io?=
 =?us-ascii?Q?SM/Gakp5Vh/uJx8VoORAjpU3VSmFLiaBQyZKnEwFat/7tI+3hNoaFiSckWTX?=
 =?us-ascii?Q?jqOzN/OkVkFr6bxXAL3hjfbj1FFyWG+UtmgLaiUW7D0FahZEo9Z4HS+EC/Xd?=
 =?us-ascii?Q?gt1c1lvaBF2WAwtW1bNXPNPfZbDJTHnjH7/7xDLiuzxmU/En3B0LBA42jX4d?=
 =?us-ascii?Q?7mcVk8PgHtDENozvlVqK6QlwWW7MdfXh4gnfwmHzoZYeEzqiumI4cMoYNKZj?=
 =?us-ascii?Q?KD5vO4rwoealisDGJjU0nP8fHYwQlJexgjfRvOoAF+0/nrA03CFmqQ27S5aG?=
 =?us-ascii?Q?wbfI707jVWDjmhencBgQT/rEY0lH92ES0u+GQ3lssOrxQYEtVPM6?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e0eaa0-9b42-490f-1546-08deb6d8761e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 01:29:54.5371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVHEoOMARIsbUN11aJQIg0RWJdekm9kWYuB7BNdDZ0T0U5Vqk56wyK3JlLHZ7oFE/ujY0oVtWdgi2pd/oH3m50VE8W/Scqi5AS0HC2fVbp6sXe/WBK9ABJ69sBVSIvwP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_183015_981130_ACAD2BD6 
X-CRM114-Status: GOOD (  11.13  )
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

The JHB100 SoC supports inverted operations for reset
assertion/deassertion, introducing an active_low field to distinguish
between different operation logics.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/reset/starfive/reset-starfive-common.c | 5 ++++-
 drivers/reset/starfive/reset-starfive-common.h | 6 ++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/starfive/reset-starfive-common.c b/drivers/reset/starfive/reset-starfive-common.c
index 8ea142ecbd15..c9911aec8b35 100644
--- a/drivers/reset/starfive/reset-starfive-common.c
+++ b/drivers/reset/starfive/reset-starfive-common.c
@@ -59,6 +59,9 @@ static int starfive_reset_update(struct reset_controller_dev *rcdev,
 	u32 mask, done, value;
 	int ret;
 
+	if (data->info && data->info->active_low)
+		assert = !assert;
+
 	if (data->info && data->info->discontigous)
 		id = starfive_reset_id_to_hw_id(data->info->map, data->info->nr_resets, id);
 
@@ -68,7 +71,7 @@ static int starfive_reset_update(struct reset_controller_dev *rcdev,
 	reg_status = data->status + offset * sizeof(u32);
 	done = data->asserted ? data->asserted[offset] & mask : 0;
 
-	if (!assert)
+	if (data->info && data->info->active_low == assert)
 		done ^= mask;
 
 	spin_lock_irqsave(&data->lock, flags);
diff --git a/drivers/reset/starfive/reset-starfive-common.h b/drivers/reset/starfive/reset-starfive-common.h
index ee457d9b90a3..a48c266e5e2e 100644
--- a/drivers/reset/starfive/reset-starfive-common.h
+++ b/drivers/reset/starfive/reset-starfive-common.h
@@ -15,6 +15,12 @@ struct starfive_reset_info {
 	unsigned int nr_resets;
 	unsigned int assert_offset;
 	unsigned int status_offset;
+
+	/* If active_low is false, setting the bit to 1 asserts
+	 * the signal while clearing it to 0 deasserts it, and vice
+	 * versa.
+	 */
+	bool active_low;
 	bool discontigous;
 	struct starfive_reset_map *map;
 };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
