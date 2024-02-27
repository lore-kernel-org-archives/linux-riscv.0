Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13397C54798
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 10:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cWkz1q/RYOqITPfajQ3svZRpED3q+dyJaqnepT0N7c=; b=s9nCCdH0xUgLpO
	fEManFTnpSL8GiY7ePdq1osfBXiN9w1vviMnGMIVctAnOMyGmsMZvuUU3YQavRBBLJQQLkUPs1Bvj
	s1n8aAYrTiwjVartPmXPmo4R2Zc6C94SQsI7e30pePqCYCzAEzcsEFRFUUxrp2VhuGvhf9DMjVCac
	QXkDF5Vfiq+QEG5Fv8nBjv/rCOm9HGKnJO+1Ncr9Krt4MWVwTbAaKqWhalRbVJLkkgsph7huZIcy2
	5pY3KjU/bJgEVhFi5AV8/qFimv50rlFFQG14lKv5NWwL1yyCOc30mndGy9kswWZYNsFAGyhXr+c8R
	wKNr6RZ2ysjkjRVZp58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reuq9-00000004mmE-2M1k;
	Tue, 27 Feb 2024 10:37:37 +0000
Received: from mail-sh0chn02on2072e.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::72e] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reuoe-00000004lN4-2DZb
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 10:36:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHsuYgLPP+/qmA/+R6jGjAIUjzPw4opqEOV18DzmFF/O1SeUtAO8L9x9rxZY6eF0zCMirOoVsKuGwv+ttVvuj+iX6qrr4G3YxXhnnkEo8onkJh+aPlY1IYVAoExIG5tEfbV2NfN1QQQsy9g4re8CvwTjuUW62BSWV3HMbTAVR3Vxav17GZAwvwlIbyVfK11QLd1Hc2Xlp14dxAMsFT4n7CRG11fccbzUf6CQKJREikDykE64KQ9B/OssgBOwsVgoyVV6VYXrf8hP6YR3r1wwQdV/vmyD3BWGl45tYc/fmmyzawK5x/yep2rfN1EhRYLodMTil07vsC015edac/hqeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGwEVnjesGyg+IGj8N8t8tCwaLr08GpiDbq+vLxRUQ8=;
 b=FRMMsmSvy9C27Z87It+gwkCZ+p5TaWW20KFaDRAnLyLJwHkegabL07o/b52039QzG/wiqT7YOKZOBMDarQqV5o9a29CpoybdHVYPlAEfusmje+Fr1pOBKsMuwnTXAOy1NzVsF3PhYFuEKpa+LDYMAPgbxfk/wM3Ad6sEdJ46mM8uPxEmOG2mW+1SOJGM/AalKX7IPVrfc7ugXiURNaQa4PgpHLwgX0ul9zMDyx9+byAcsskQDoO/wKfmsrGRKCMT6Dq8QhLoP+NV6j9Y0siK/tDBP4urJg7DcUH8LwWLHqYIld4DQvegD7WWd9VagDhwsbjZLNx2aYljudol8ow0vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.47; Tue, 27 Feb
 2024 10:35:52 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::5a5a:fa59:15fd:63dc]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::5a5a:fa59:15fd:63dc%3])
 with mapi id 15.20.7270.047; Tue, 27 Feb 2024 10:35:52 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v15,RESEND 22/23] PCI: starfive: Offload the NVMe timeout workaround to host drivers.
Date: Tue, 27 Feb 2024 18:35:21 +0800
Message-Id: <20240227103522.80915-23-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240227103522.80915-1-minda.chen@starfivetech.com>
References: <20240227103522.80915-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0003.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::15) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c49661-21f3-486e-017e-08dc377fdef2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q7fbERTA0VzLvOUyVBYR8WMrAvU5OPQJhex/7IRjoZ/m4LRkrnFVldLkFLcaEhobgmaNNieen7pxHtr7kGg7+YpOrknHTv/iKPW9o+MISBFRJddw+f24fKZXzKH81uTtQ2MtNGuCz8Ca3TUtZa77ykXAp2dmkuRrMg/M7LwL/ZhS+AQZRSgCG1Jh0td3ugenjsScykca3hnfAFGsOP0puVvr34nicphWG3yJOAa67pTm7wG+7vluD1B6ATsvWvp6DQF/3yviJSUTptE5bdrNXRqEAbEtY0EL2+to+WUOLa2beUZCGW0+Gd8aQsfnc79w4nHKqxMN7H2E6WWOH8WbzY8rMY27w4weZu33fo2ezENc1RM1C6p4HXwPAy3FnvXd/E2F9tZg0f6HI+ds2hCbAbnGMVjUk9WR+XknPbnup+pfuLZEgA92X7doVYx0M2UUkbjRdkNUQimTkj5f0+izHfJrCVyuZ3a6wN3DAb0RhT0MEv3Zpm8erjZ6VxtHDddZTXHvs4p+1Q1SYA01SMrtS+SUAhBh8rD9O6n/RN+3umGfuDnUjmZuggtWtxUcyxi3fMyPgd3SAj8LqkYhvmnU77BSISIUYwzbQXJLr1KaXH74ivV+PQVLlCg8iR5mvBdL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pyf7fz9uvlxgVqrAzGu/DOkJUoQlVZ757BfMvr+fC26AtWQ59XNAOlmvHZ5U?=
 =?us-ascii?Q?1V6WkeB0nZYch4GH1dJim0mi1ClvaBhC3g5Y1k1MwpG+xnYcMubZv08GZ9Ri?=
 =?us-ascii?Q?QoY1q0WMMzIxL7Vv2g2F+mOzv4kk5UZGhJCjGKb7LBT9MAmNVsgaYR8m/e8/?=
 =?us-ascii?Q?CvQ4LSLy3eIY16ZWzPeUSYe29TD/wGYUSe95q94C1gBeCoUD3EzUbPkRRxU8?=
 =?us-ascii?Q?i1fvzgVnp5nXQUbMdIuPQ2DfZjO0OD42bg8q0w6m0VU31s2FT6P3z7hbLfVk?=
 =?us-ascii?Q?Ak2MVSOCsZlphi7FL/vpe4rlUs0IBZxAVyVXH5a6EbINX6jJzmGwDXn/Uv3a?=
 =?us-ascii?Q?GoYR4EabkUUQqyaDDEITt+YNn+ajxMvrKqb92Xmr1/khDrhSXRJ7qo/kUon0?=
 =?us-ascii?Q?KSqWgVDHW5cm/svfJ5/I9jddW0eQoGJDovxbuRncA3EpGTMP298MwYvsEdL2?=
 =?us-ascii?Q?/n1aU/DlZKbQi7ytsl9SyHs8J+Hqc4Ybmg1I40agN8mopZu19Clqrp95nhXT?=
 =?us-ascii?Q?hVRQfvV4iWwxnHwGSWNdlU7tJl7ZgJNRKDCxfXRchefsFsleCXhhstKnY5Cw?=
 =?us-ascii?Q?bUMr6M1kBMb66EfmIhqLo611R6EFi+jucmQxyt3tIi4fn3l/b6q26c60sRIj?=
 =?us-ascii?Q?9yZmPwPScKOzTi1BvHBSuo4EBDaUgNOD9HmasqJYG8DTiD6wiaUTUbz/IzCv?=
 =?us-ascii?Q?FDNMHIyacPeWt6E8P56Gh2MzSJBYGS6/8bsX4gA7Tp+SLXBmzmHpzQubw1XU?=
 =?us-ascii?Q?jQCSFOrE1lMA5HfrVhQOmIB4hi05MWSlvqKP+2ZxVva4NnqQ3H44RgwQe5/p?=
 =?us-ascii?Q?sySmD0QBug3P1qg8qUUgc7XWoCzn8rkH6da0FqgzKfM8Fpm35hHpWQhgmsVg?=
 =?us-ascii?Q?qmxwOFivYSENAs/qfmu3f1rqFQBiBbwKkMCKv0Fu6QkrCJ+eoJcQVlCEkN97?=
 =?us-ascii?Q?/ZrtW7et2mmqF+ze1ujrLagiFBhME+x8T9Ogxz4axoWml8LuP/LRjqO/i/Vo?=
 =?us-ascii?Q?xvaCKIBhSdg/mDzQaMeqV24s8yKJsgQ33e9fEVjiwbDz5aBt1L5kxAuBtWYP?=
 =?us-ascii?Q?f4+YlT3GkYI53ds81AdmPuYMvr8X/QJKyzC548+DtAIGcQm2DoGWDevz1yQa?=
 =?us-ascii?Q?DvB7eUsEm63y87oaZ3CN8O6m+y+bTB81xjt3gJMUNuXN0TFBX9geym7wFq6U?=
 =?us-ascii?Q?KIk0FgKmfrR8aVYfP2GFM5K2LrqR4gR6pNYEGNvchd0YyOpdPsAv8BVa5lCt?=
 =?us-ascii?Q?l32PdNuze5tKM9o3WRv9VovBTfs4NTRjzUE+mX4KHmjZqCvMwayu8kTSgAEy?=
 =?us-ascii?Q?o2hvGWRH7xN64G1OIFNGsGMq2fb3oImSANgDw4fCyrKs2NLjHAK+4I4JT1rP?=
 =?us-ascii?Q?GYS8SMErMTrKs+7Qb4gm5NwmrNQbpaUPBGgmcyL8q2znFBSHj7LzgPcv3rPK?=
 =?us-ascii?Q?PMs73QJIkpWgJgfW3o8o+PYTnyP6hb25/zEeht5hVkOBQoyHTQc1GIF3UvLv?=
 =?us-ascii?Q?ahzgXb7ffcxB1nQG5KIZKKNUKY9vFFRjblZr/l00uJo722YDSKr43Z20UjAR?=
 =?us-ascii?Q?bHS55N78J17reNO1P2E6lvA9/2M5CEwHj0kr9si7zlR+NcyYX3vPHlMp/aGq?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c49661-21f3-486e-017e-08dc377fdef2
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 10:35:52.1693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsbLUkwtaPPwweU0AhqQRx7T5ln6i76bpcn+jZGsjyKdpcKb3PTeC+cqMTMwueuC8ha9f253SCIiggjdjZGHJY3f8CKLTx5uUTGWqKRMy7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_023604_804523_AC8F6A56 
X-CRM114-Status: GOOD (  13.76  )
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

From: Kevin Xie <kevin.xie@starfivetech.com>

As the Starfive JH7110 hardware can't keep two inbound post write in
order all the time, such as MSI messages and NVMe completions. If the
NVMe completion update later than the MSI, an NVMe IRQ handle will miss.

As a workaround, we will wait a while before going to the generic
handle here.

Verified with NVMe SSD, USB SSD, R8169 NIC.
The performance are stable and even higher after this patch.

Signed-off-by: Kevin Xie <kevin.xie@starfivetech.com>
Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 drivers/pci/controller/plda/pcie-plda-host.c | 12 ++++++++++++
 drivers/pci/controller/plda/pcie-plda.h      |  1 +
 drivers/pci/controller/plda/pcie-starfive.c  |  1 +
 3 files changed, 14 insertions(+)

diff --git a/drivers/pci/controller/plda/pcie-plda-host.c b/drivers/pci/controller/plda/pcie-plda-host.c
index a18923d7cea6..9e077ddf45c0 100644
--- a/drivers/pci/controller/plda/pcie-plda-host.c
+++ b/drivers/pci/controller/plda/pcie-plda-host.c
@@ -13,6 +13,7 @@
 #include <linux/msi.h>
 #include <linux/pci_regs.h>
 #include <linux/pci-ecam.h>
+#include <linux/delay.h>
 
 #include "pcie-plda.h"
 
@@ -44,6 +45,17 @@ static void plda_handle_msi(struct irq_desc *desc)
 			       bridge_base_addr + ISTATUS_LOCAL);
 		status = readl_relaxed(bridge_base_addr + ISTATUS_MSI);
 		for_each_set_bit(bit, &status, msi->num_vectors) {
+			/*
+			 * As the Starfive JH7110 hardware can't keep two
+			 * inbound post write in order all the time, such as
+			 * MSI messages and NVMe completions.
+			 * If the NVMe completion update later than the MSI,
+			 * an NVMe IRQ handle will miss.
+			 * As a workaround, we will wait a while before
+			 * going to the generic handle here.
+			 */
+			if (port->msi_quirk_delay_us)
+				udelay(port->msi_quirk_delay_us);
 			ret = generic_handle_domain_irq(msi->dev_domain, bit);
 			if (ret)
 				dev_err_ratelimited(dev, "bad MSI IRQ %d\n",
diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
index 04e385758a2f..feccf285dfe8 100644
--- a/drivers/pci/controller/plda/pcie-plda.h
+++ b/drivers/pci/controller/plda/pcie-plda.h
@@ -186,6 +186,7 @@ struct plda_pcie_rp {
 	int msi_irq;
 	int intx_irq;
 	int num_events;
+	u16 msi_quirk_delay_us;
 };
 
 struct plda_event {
diff --git a/drivers/pci/controller/plda/pcie-starfive.c b/drivers/pci/controller/plda/pcie-starfive.c
index 9bb9f0e29565..5cfc30572b7f 100644
--- a/drivers/pci/controller/plda/pcie-starfive.c
+++ b/drivers/pci/controller/plda/pcie-starfive.c
@@ -391,6 +391,7 @@ static int starfive_pcie_probe(struct platform_device *pdev)
 
 	plda->host_ops = &sf_host_ops;
 	plda->num_events = PLDA_MAX_EVENT_NUM;
+	plda->msi_quirk_delay_us = 1;
 	/* mask doorbell event */
 	plda->events_bitmap = GENMASK(PLDA_INT_EVENT_NUM - 1, 0)
 			     & ~BIT(PLDA_AXI_DOORBELL)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
