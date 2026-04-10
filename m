Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34160E9905B
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 09:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Peu8uutkFsoX8RFQifFI2yUyinh8joK6fEz5PpT0rKs=; b=YvhzbNl8MZ+vDw
	t2Se/reSm2J6IX/KOevKNUDzqAcP2/kGe3dkeDMSmL39MOWAcXOc/OCmFrwIbskQsr0v+GsTmPTwN
	H3aG0C499oUSD6pQysY09OWtZPH/GzQcfjPI4+1Qg7Jd1DHOHs8/HsRDbYx7jMX1zJf+CrCimGdoG
	Z4UG/OM+64Kp//inLBTbCCaus3jkDMpU/191LsfKaGGqTZW/oKeytYP7rrZJLXU3DDi18QGPwNXT7
	gaaMuUzEAj+VYzDStq3Xz9EieA+lDcissfwCwWugphv/DnLf0YV5j7nqG+WGgCLCOyIsHR6Nd11A1
	LIA/8bxmsg7oPptt1EDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7kJ-0000000BsN1-3Yg7;
	Fri, 10 Apr 2026 09:01:47 +0000
Received: from mail-sh0chn02on20716.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::716] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7kH-0000000BsJz-2hqL
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 09:01:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCC9YcfOBc7saaIzJuKod89ZhZiGcoY6f+QAcvGjrr91V95LFVnYKA1lhCuw8k/k5wz8ok+JK85uVq/i7eUNr3P9jLi7zQWDAu2i0v9ow94F3TU7BdOta19B4zW3U1jSuYAkrZ7rI6bGNQGKYgI5PXyjun1qhl7ccWNlyMv2O5aTsejNC9hwvS2xB3z4w3vetM/0Hphtke6IcUzf9R2brjV46H2KONNwBt5CqJ5QScAY6wsjkd9jsN1tFbimWKbjBQ7rnrdpM1Q0jk1mUpUvvg0o3S97CBZPMA2yxHVUgEls8afZSmIXKVghVAe/9NutHLs0hZMBF61RZC9N5G4vvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgmlN3ixTZyLCqqcf1//3+Ol+z59PSHvlNUJpUh0dwY=;
 b=BQLMzobvChN74wTL3j4mLWBmwj22NvHkQbGW2h5UJKPnsrE+aOzV+E9/dmKJqYcVQwivkTnMoewTOkkl4wlWCbJKAPEhsUFmyx4Qcw8BRovoRiQnyCWjAON1EQaUdvxb3icW8zC2YzHrSgZeyIXdL3gBwFFrgNRB9ROJmsB/z7AGcW5DPnk2w72UMihyRDm6f+0btkmtd6rLKLMtrEs3nNezzNMAAOhmSKoBdl6Ths9Df6KQE5l+wVJaSo+QiySje8/knOtMTbTtopzpccBIu2uqEdVIF7eYjQEaG/lMau2MQ9YmbM3GDb6nGRLjLNuhBA9qs0ON46AMgpCUCwW4ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1218.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 09:01:17 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 10 Apr 2026 09:01:17 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 3/5] irqchip: starfive: Use devm_ interfaces to simplify resource release
Date: Fri, 10 Apr 2026 02:01:04 -0700
Message-Id: <20260410090106.622781-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::6) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1218:EE_
X-MS-Office365-Filtering-Correlation-Id: 986d7b11-ddbc-4cc0-b783-08de96dfb9eb
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|56012099003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: U+Lp+SkAPrz3ltb7E3t3E6pMtqFpA065JbKaf+h3dQ9b7VvFtO+7YcTpQZVYot4tKiubvpcziGzIVNAoitgTCTUskZND7LufFk5w/U+5Ng4gZRL11vkJemA0+XgEFAxgN9TXKrpu4ko0tOroc7m3kIKOpTYipHXu7LvEbT8uQ7vf6f1wti4m30coBFU3Lsg1MGsPzpRiJtGBnewA6J/uHygfVfPWn5NM3U8/ecqF/siTf+QdwcyxuknK0NiXkwoBvxxICwI9k5Q4IUgy9hQ9EvaODge/wtIdnvuwnvvrqS+OAEiiTIMOvVXsoVWNawXyLbwXc3iWDb1URyMqCXQDV0W6QtJsONHnug1kEeGGIqclKYoM57xt0WaMusmQkEK+aFW7gpaN3Lw48DZVCpos8/GfENQ2Juxb2nw0jf6rZUfTZWte3gnwr8wrkZSMSxRYQbFekLMtj7e+rXhXe7SsYAFPxyZ6KDpWnBEUvqLKjgi4ZUCGejwak3wy3q50in2NfzXVcmd9qwqokNybyanGsLBEChUU0/8SSJMIm+IoVXOrvJq/eO5BrfABTXcZn1NAP65E5uIaimZnQNNtkw9wKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(56012099003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n9u1wtNtwbgW6JGfE0LcMgIKm/Zo03fvzAuNxZgSBMTNRw4F+48H+ucqfLBy?=
 =?us-ascii?Q?LIs8ZMyJpWM5gvcj0OOWQEK1OA1DjUutG5sv/6wm2yIF3LLZcBaRc0uzpRAI?=
 =?us-ascii?Q?e26JspmV4sWAPT1C+lBh7vr4WLkXlsdDtNWnxmQqtGv4mDNJ3QMzYn5aud5l?=
 =?us-ascii?Q?MXAu8IOLyVSVrj1oKzaXLZFC8DxHNl7NMYwFYVI6EYSS/NwsqVzNvPGcmUh1?=
 =?us-ascii?Q?XVg+3FGX8ynXPxhPGK9Wo1hIKfjTWhDz0Xq3qUxBj6TJFeSyp+NAMDTsIPxz?=
 =?us-ascii?Q?ErA+Mc+yDQBhjdz75K9di0Pz5vbBYAnioiT+FtGFwo2s+mtF97CoZKNWsS1H?=
 =?us-ascii?Q?s/8M3FkcATfMp16DejFiBdmT8iSqEZVxchYFTFh4b+pLTG1+OmbfICACuhIN?=
 =?us-ascii?Q?HDdCwDO/pPa/xRm2IgLvB3duTLvz5zf3BicsTShJ0rCph/WDWd+H1yGEtfrk?=
 =?us-ascii?Q?gUgzjIJbzke/xVaDi79KCucA9fCNg8cYq9z/6wzyXcghs7H3Lcz48ljU+pPF?=
 =?us-ascii?Q?KfsATpB3GghX1GdA+guzii7gJbnoTfjSvurS8Re8Nd9YBHfeIuTUPWgsMN28?=
 =?us-ascii?Q?FEDhUkREB/jVHhPTnZIATWguOjQzw3PprjOHXqesqn+xbwJZsyovsbnzSSv/?=
 =?us-ascii?Q?K4sHDM+Q+JYLsUMKC9n0nCpDRrg719K/qnNshNfOPQz3nnzZdMzcY+RmEWTt?=
 =?us-ascii?Q?J/fJqeEaSbnwo9kCHPbzgfQ9NXwvwZWr+2aWYASJrCUxTqsMR0r9J0oGCaLL?=
 =?us-ascii?Q?mgkBi0xNQN0/tPsIjwtTu9FXIXFgv7eutizEFyeb00UObAvjZgbVUFGEBNV+?=
 =?us-ascii?Q?+0a2MKfeo4GPTCy0a6SeVYXsrnQzOMor/EteG/UoEoWxAlct+X1xRdubgP0P?=
 =?us-ascii?Q?f3dw+0SS9lLvGqV/41+ihWTml1xKpoldLOZdQ3iEPnsBsbNpcu1gjqz80Ci1?=
 =?us-ascii?Q?z5Y7B2ddO/LxZXsucE7QLmO1AswgPHAb/4P2utkebxWfrvA+1RDHuEk5lvxs?=
 =?us-ascii?Q?qK+CAUcYcWaMtUrx0ZLi5n7WpgFnYjganR3/UZ931uO3zrsJ9LaAe6n+k0si?=
 =?us-ascii?Q?T03LoyAB5jyQMGphguCn1R28oJxwJeD2omhPXiCihPQf1NtdQ120bb8AOAvt?=
 =?us-ascii?Q?AmNH/CruzypexvhD/v0iO42EKrPw7XxwcfsMF7mpq7ALsX5jhEJDR2sFvFAo?=
 =?us-ascii?Q?KVDR/uSJ5njcepJZSwpXAO5S76L2Cp690TNNniKTEFe3OnRAwNc4g+ssk9tI?=
 =?us-ascii?Q?dMZA2eRZRTXzRTNFBgeTVNJzzEEWsLPtsPeGG4Ir+aipaMurF77Zoz07GySr?=
 =?us-ascii?Q?l4AlWgzoc1kHWm2BlWe3e6Q3pB751ETv+qNIO1agu1qrN2PWHmt/+Zy9NOA5?=
 =?us-ascii?Q?A7SrfTk+paJTN+iiD9bXEEDjXdZrdS57TF8emCKTCOopx513kcQl1yluwJq3?=
 =?us-ascii?Q?FyA1VrbCyoQqZVI+d3/A3DVeTfSZHrhh2jpEaQ4DW1T/HWT1DDtGTeRLMPU+?=
 =?us-ascii?Q?I4kUPDnrkf+aIZYkr4QvCfUqX4CavvYfkMJrWu/kX/ttxnhPb0XTiqnsLsAH?=
 =?us-ascii?Q?KEZ5FdBEwZQITbWqJYlPAeKv2rEXNGAhVFVcd8zOojEE4Qo7omsJXwh49yOR?=
 =?us-ascii?Q?wMJKxH+ZE0ehx+t93x3zKCGc56bR5HT0aOGNzXaNQ7LbKNg1qj8AFtV72iN+?=
 =?us-ascii?Q?iq/GOwLPwAH9uW2msAYM4fhzaTkbfJzklHA6diV5l8lPesHbrjC4W5xlAhCJ?=
 =?us-ascii?Q?KXuBPHGsJfDYmefImB8MabTRqUvrMz5EWV0Y73f+QYAPSxhQQvvY?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986d7b11-ddbc-4cc0-b783-08de96dfb9eb
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:01:17.5474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBEybF6zOumvDc0Cq6W+MkNrFEWmaBYb+l4VhcjoK1bXFW3O+Lyaju6gOOhrzX/SAa4us1PbD0j2DOXnsUB0aRh1k+FyR3rnm6csAtxzdeImuGovIXPF3SwfycFiO+Gs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_020145_683085_D423AD61 
X-CRM114-Status: GOOD (  11.16  )
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

Use devm_ interfaces to simplify resource release. Make clock and reset
get optional as they are not used on the JHB100 SoC. Replace pr_ logging
with dev_* logging.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/irqchip/irq-starfive-jhb100-intc.c | 44 ++++++++--------------
 1 file changed, 15 insertions(+), 29 deletions(-)

diff --git a/drivers/irqchip/irq-starfive-jhb100-intc.c b/drivers/irqchip/irq-starfive-jhb100-intc.c
index 2c9cdad7f377..312a4634870a 100644
--- a/drivers/irqchip/irq-starfive-jhb100-intc.c
+++ b/drivers/irqchip/irq-starfive-jhb100-intc.c
@@ -7,16 +7,14 @@
  * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
  */
 
-#define pr_fmt(fmt) "irq-starfive-jhb100: " fmt
-
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
-#include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
@@ -127,48 +125,44 @@ static int starfive_intc_probe(struct platform_device *pdev, struct device_node
 	if (!irqc)
 		return -ENOMEM;
 
-	irqc->base = of_iomap(intc, 0);
+	irqc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (!irqc->base) {
-		pr_err("Unable to map registers\n");
+		dev_err(&pdev->dev, "unable to map registers\n");
 		ret = -ENXIO;
 		goto err_free;
 	}
 
-	rst = of_reset_control_get_exclusive(intc, NULL);
+	rst = devm_reset_control_get_optional(&pdev->dev, NULL);
 	if (IS_ERR(rst)) {
-		pr_err("Unable to get reset control %pe\n", rst);
+		dev_err(&pdev->dev, "Unable to get reset control %pe\n", rst);
 		ret = PTR_ERR(rst);
-		goto err_unmap;
+		goto err_free;
 	}
 
-	clk = of_clk_get(intc, 0);
+	clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
-		pr_err("Unable to get clock %pe\n", clk);
+		dev_err(&pdev->dev, "Unable to get and enable clock %pe\n", clk);
 		ret = PTR_ERR(clk);
-		goto err_reset_put;
+		goto err_free;
 	}
 
 	ret = reset_control_deassert(rst);
 	if (ret)
-		goto err_clk_put;
-
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		goto err_reset_assert;
+		goto err_free;
 
 	raw_spin_lock_init(&irqc->lock);
 
 	irqc->domain = irq_domain_create_linear(of_fwnode_handle(intc), STARFIVE_INTC_SRC_IRQ_NUM,
 						&starfive_intc_domain_ops, irqc);
 	if (!irqc->domain) {
-		pr_err("Unable to create IRQ domain\n");
+		dev_err(&pdev->dev, "Unable to create IRQ domain\n");
 		ret = -EINVAL;
-		goto err_clk_disable;
+		goto err_reset_assert;
 	}
 
 	parent_irq = of_irq_get(intc, 0);
 	if (parent_irq < 0) {
-		pr_err("Failed to get main IRQ: %d\n", parent_irq);
+		dev_err(&pdev->dev, "Failed to get main IRQ: %d\n", parent_irq);
 		ret = parent_irq;
 		goto err_remove_domain;
 	}
@@ -176,23 +170,15 @@ static int starfive_intc_probe(struct platform_device *pdev, struct device_node
 	irq_set_chained_handler_and_data(parent_irq, starfive_intc_irq_handler,
 					 irqc);
 
-	pr_info("Interrupt controller register, nr_irqs %d\n",
-		STARFIVE_INTC_SRC_IRQ_NUM);
+	dev_info(&pdev->dev, "Interrupt controller register, nr_irqs %d\n",
+		 STARFIVE_INTC_SRC_IRQ_NUM);
 
 	return 0;
 
 err_remove_domain:
 	irq_domain_remove(irqc->domain);
-err_clk_disable:
-	clk_disable_unprepare(clk);
 err_reset_assert:
 	reset_control_assert(rst);
-err_clk_put:
-	clk_put(clk);
-err_reset_put:
-	reset_control_put(rst);
-err_unmap:
-	iounmap(irqc->base);
 err_free:
 	kfree(irqc);
 	return ret;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
