Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEA1C48BF6
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wg3qSIMrpwbH6YglHNR/6oI/xyi625p/8y2k9UjqIU4=; b=t4N8OwIhyQBA9W
	ETVbx45bQkA3+ZytmxS11W3advHhZkuQcZzRBmugEjuAqB4XnaYLAhhPUExMbKrcCVCe1AOrcGfh9
	gum/qlCmszaTl9ghR4dtlEkdTE+nL8AxlWaSeCYyeg3W6CI2DCQPHG7fzgjruaahx8FtAH43Qbdmn
	GXJBcuTOBmSGOsWomApMjZOPsPoFw/XlXB3mdF/2IArLzGWXZ8SY3lHwvtMgkpvN1SUCGBGX2tiuz
	j1i7/PTruIaU/H/AR2K2OCplNOR+LMA4JEY/28wNfG/Lpx45wDoSSbESQkiK9pFVkl6nVAXI5gyOZ
	4ErfvAHKAdiEM8amcmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbeG6-00000007Tqx-2KCL;
	Sun, 18 Feb 2024 10:18:54 +0000
Received: from mail-bjschn02on2070b.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::70b] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbeG2-00000007Tlg-1hT5
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 10:18:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQKWX1Go0G+vpdJhmkQcsKc1BS7KjvTvBYp7RHmFXejP3gKIxkQz9PG0Tz03egPG04POk6fsndeqI6V18OsQDJz7XOa6ZDzH+a7ILQZhPvPloXrmW/JAAk8jJpfi+jtzGgqHvDfcdNU+U38ULnRyW2unBTb1CaYz4hnnU/Dv5OiJEtTxvqtYQcFMHtwwUrgPkhZT8Os6w4orwtJi8nJ0nw290rAb4BFAzNvMMwoVb+stpncUMkhZc5v+VgqnfogRiLKqY0rlRLz779sBNxRKu6pXrir8Vz2u4tcwIVyaUzYuTmmlPLN/vSSh5yJbJ+HfB2AB+y4fq9K3rHqpVYyieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFAi/9ANhMNoN8P+bySA8VVky1s7VfWBI39iKhS+vok=;
 b=d1k8UoX1GqqUXd+yVsOoei0M+QTwBihbe1fppvMAsb4L1FUc2zA0nkRuuXNm/Cpqjx48VGBBTFpHG3H8iB+qgKyWrn4U6OcGT3CZuYAHfYaLuV4nPEQmp3OS0F0HHgIGFML62f0gB69gfUCiMWzCF0LqPILoPgQFyiBGyD1rHnKwOdYySAnQj+p0Nb0f08DXJlXZU4boH8WvZ4boJ1k/dpNMB7xydtAlC9stfMGyHixLvEPCB5b0F8ZbyLB+KdCZ56rPtKGFSFlWU1TiBz4YShoqSznz4AO5Vg9d5eynIihVBDLAanctDRsNJdK4UY3Jh0Di6C+HkSm+yWAHAOL04g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0765.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.46; Sun, 18 Feb
 2024 10:18:42 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::5a5a:fa59:15fd:63dc]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::5a5a:fa59:15fd:63dc%3])
 with mapi id 15.20.7249.051; Sun, 18 Feb 2024 10:18:42 +0000
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
Subject: [PATCH v15 15/23] PCI: microchip: Add event irqchip field to host port and add PLDA irqchip
Date: Sun, 18 Feb 2024 18:18:31 +0800
Message-Id: <20240218101831.113469-2-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240218101831.113469-1-minda.chen@starfivetech.com>
References: <20240218101831.113469-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::15) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0765:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf2983c-89c9-49e4-54ba-08dc306afb3d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nNLym30S3K6eBi5q39Pyd6Gvxg6GwXIuvGmh0bGZkm7yP7P03tKVj0SPmhMmktWX2tcJPypKmIwLne7GhxbSm4HIRwdMwWIVQhUe3+9/UV3p9BHNVS0xN91ByB4c58+974rlkJDosjhUOUMW3CRqE9+mO+iI2b33V0zoRBNuSVN2TvJc4j33t4nmSOB211y2fpfB9ET85p0+LxzfJtp9RQTPxLcoCQ1bxvbesAGB2/FfbwUE62/gnCa9dG2g12FxCAf87D7A3otrZHKo5he/Lo/3GJqMd1n4Oon3oNdoVdU/yDH4b9AFW7trFYhtaYUsapgfp/osWmHE/LS91tVO5QzHPc/P5Pfjq8kp0kkqHl/qsF649cS7DnE8h3/cNlgT3Mn0IdlMuLNErUP23/u3LPLK9EOG950KP9d8mDw2jbmMEYpaxJeOE1NCPReEdfExlJdQEyyng7t1EabpmXRVK2pGruoPqAYahK6eUBLR9Kv9opbXaH32Ubw5Wxw4T8JD+GuaCFIRLS6030qe5RSbYiUrEgpIkC6aJHP3Ds5Hi0RS1EG+esKxXc5S4CcHt9hq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(39830400003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2906002)(5660300002)(7416002)(44832011)(41320700001)(26005)(1076003)(6666004)(8936002)(66556008)(66476007)(4326008)(66946007)(107886003)(41300700001)(2616005)(83380400001)(8676002)(40180700001)(38350700005)(52116002)(508600001)(110136005)(54906003)(38100700002)(86362001)(36756003)(40160700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M6MzmM/cLJHg6ccv0uKExLpOUFVuzBkArhQ6s9YbXsXVqepminBUlIaJJEGW?=
 =?us-ascii?Q?pHveBMOxUeHSUyfre+1xhPys8BU35HmeXFfNAKp1gxuPZGubGIPcdeTow006?=
 =?us-ascii?Q?Lsqi8MAiRSPSm7QDtW8auoc+QK7Aq7p4/FH0isLjpcsnLqGJjkEE4sas+A+c?=
 =?us-ascii?Q?ILiCyrG6hakjRu6s1rCnt1/oWsqW0fU6b2amb8QunZbdJq/bmVZdx45wCHHf?=
 =?us-ascii?Q?FWIw1FYyU+CtAalEGjGIGis3UAnfnEiULZfFR1aCEQbcQCkazPIppEYlEY8/?=
 =?us-ascii?Q?qDoRNr9zWl03LcZCZk2/X81Xk5cBVrx82+NcbWCCIJiNTjB26k3Mp09KrqYk?=
 =?us-ascii?Q?4iyJeMxhoHbanHAK6Mfhl0iNYfKMULhFsJiDZvlmoUnVDyHT2hYuBxWFTWfE?=
 =?us-ascii?Q?2w3NdxYe36TgK13Llo46uOsVtXTIaytFnN8TM7VLfRdLWljzf9BfGR7KQWeQ?=
 =?us-ascii?Q?2V9kDqRebNrg3DQ04A0D0B9XERrOdeBAkvgMqEVF8BkHOj0uBmgWj0GqUc7y?=
 =?us-ascii?Q?Le7FzQX+czJ+ZK1OWBVGNnjoYoiRmgN6X9kyxxLEL9uSPN0ttmH3mlC7vOgO?=
 =?us-ascii?Q?3JL6vOEY3Vrg5t2ECTRty7Rpu9kqGhB4ItZt/DiOAXq8xHn42Co47M2raKLI?=
 =?us-ascii?Q?emeTKuvXB+EDbvvhH+crdLkyn2YziDpFGGSk6Yng6TT2iP+xfLiLHjn7g5oC?=
 =?us-ascii?Q?PytDNu7ovqJCVbTOWZMug/OvzBAcU/lIyslmmCqFFoWv2L2KzyI8mkaO1qE+?=
 =?us-ascii?Q?OW0Mwox0Wq2XEfPhB0L27XMCQ9xg7q2LaiWw9OpPtQ1gChuPrhRK0G9JivO0?=
 =?us-ascii?Q?Ro13aDG/CZpRu4/LxRcoHk71FNgN4bK9QuvWhcv7eZO/4GMR5/53aeRNSS0G?=
 =?us-ascii?Q?y9GdEo7+OiPluq22YNqXQSgQaSShIdXaB2BhKn1DcZwM1AedJVpmuh+WvkWF?=
 =?us-ascii?Q?lIqYhgdZGhQWyBwq0W79xLoR9U1Gbs1aBF1GaFpqZcydJS2ejDDswQaspY5g?=
 =?us-ascii?Q?WPY2HfRksHnz/2lED8pTHxNA9u5G80dTkfdICMptsJfSzpPhncOyofONJEs0?=
 =?us-ascii?Q?y8fHsAQmEr3tdhquoxvr9d2Rs2+DR20gsSqJ5BcqWXYGqpFjhvZGkUIlBRey?=
 =?us-ascii?Q?/D8fYi9L09vxPp2YwHPOtFUJVDN3tSQ+GYEHLukex2CFiUHNYMz6G7N7Lnfr?=
 =?us-ascii?Q?XhFMp6N0OlPrpxlT3zUWZUx+xfLWyMl90yED+6O+5VBfCfnyxlmSUr2uIGOQ?=
 =?us-ascii?Q?ds+HCBqWMXp/gMox7LR4Q25za7auwqVewSi4qVIy66wKFAe+BCDA45MzlTJ6?=
 =?us-ascii?Q?shL4A4UALbOd/1L1GjgHaVUsqu66o5A6s/4ndoiFePxnF2B3Ev2sK4Mv948H?=
 =?us-ascii?Q?GMzqO6+XUDn3Zhm0oIywdQ2FpOx8/vVpMDBTFcfmEvYmdG2MJugeXFxfYEL7?=
 =?us-ascii?Q?5Iv8QRG6fKZ+wi1jHIgKi0m2inGKPZw6SJlmFT/vklneGSVaYFQAAW7d/kwW?=
 =?us-ascii?Q?EY2CUk3sdSuz2ykpP9L8NqLZP9oEXnPZWdyaOs7PXt8ka6Q7SGtEEcmv49TG?=
 =?us-ascii?Q?RvyWBx9mA+ckxNAH+a6j1Oa/zE3ZnXkNSW87H5jp0yisAvOk4K/V9IhQR1M5?=
 =?us-ascii?Q?vA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf2983c-89c9-49e4-54ba-08dc306afb3d
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2024 10:18:42.0768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oe6cxYFUlwIp8Tq/L4PKBXPMPTAsw4+y11nrtPEoeqYlvS4o6XNi3cvHIlaa4ta3hhm1ZO9KuiCSbFBDbY1fDrTY9vfhCDNcY5OZwtRFvZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_021850_555193_6E22ABA8 
X-CRM114-Status: GOOD (  15.48  )
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

As PLDA dts binding doc(Documentation/devicetree/bindings/pci/
plda,xpressrich3-axi-common.yaml) showed, PLDA PCIe contains an interrupt
controller.

Microchip PolarFire PCIE event IRQs includes PLDA interrupts and
Polarfire their own interrupts. The interrupt irqchip ops includes
ack/mask/unmask interrupt ops, which will write correct registers.
Microchip Polarfire PCIe additional interrupts require to write Polarfire
SoC self-defined registers. So Microchip PCIe event irqchip ops can not
be re-used.

To support PLDA its own event IRQ process, implements PLDA irqchip ops and
add event irqchip field to struct pcie_plda_rp.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../pci/controller/plda/pcie-microchip-host.c | 66 ++++++++++++++++++-
 drivers/pci/controller/plda/pcie-plda.h       |  3 +
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
index b3df373a2141..beaf5c27da84 100644
--- a/drivers/pci/controller/plda/pcie-microchip-host.c
+++ b/drivers/pci/controller/plda/pcie-microchip-host.c
@@ -770,6 +770,64 @@ static struct irq_chip mc_event_irq_chip = {
 	.irq_unmask = mc_unmask_event_irq,
 };
 
+static u32 plda_hwirq_to_mask(int hwirq)
+{
+	u32 mask;
+
+	/* hwirq 23 - 0 are the same with register */
+	if (hwirq < EVENT_PM_MSI_INT_INTX)
+		mask = BIT(hwirq);
+	else if (hwirq == EVENT_PM_MSI_INT_INTX)
+		mask = PM_MSI_INT_INTX_MASK;
+	else
+		mask = BIT(hwirq + PCI_NUM_INTX - 1);
+
+	return mask;
+}
+
+static void plda_ack_event_irq(struct irq_data *data)
+{
+	struct plda_pcie_rp *port = irq_data_get_irq_chip_data(data);
+
+	writel_relaxed(plda_hwirq_to_mask(data->hwirq),
+		       port->bridge_addr + ISTATUS_LOCAL);
+}
+
+static void plda_mask_event_irq(struct irq_data *data)
+{
+	struct plda_pcie_rp *port = irq_data_get_irq_chip_data(data);
+	u32 mask, val;
+
+	mask = plda_hwirq_to_mask(data->hwirq);
+
+	raw_spin_lock(&port->lock);
+	val = readl_relaxed(port->bridge_addr + IMASK_LOCAL);
+	val &= ~mask;
+	writel_relaxed(val, port->bridge_addr + IMASK_LOCAL);
+	raw_spin_unlock(&port->lock);
+}
+
+static void plda_unmask_event_irq(struct irq_data *data)
+{
+	struct plda_pcie_rp *port = irq_data_get_irq_chip_data(data);
+	u32 mask, val;
+
+	mask = plda_hwirq_to_mask(data->hwirq);
+
+	raw_spin_lock(&port->lock);
+	val = readl_relaxed(port->bridge_addr + IMASK_LOCAL);
+	val |= mask;
+	writel_relaxed(val, port->bridge_addr + IMASK_LOCAL);
+	raw_spin_unlock(&port->lock);
+}
+
+static struct irq_chip plda_event_irq_chip = {
+	.name = "PLDA PCIe EVENT",
+	.irq_ack = plda_ack_event_irq,
+	.irq_mask = plda_mask_event_irq,
+	.irq_unmask = plda_unmask_event_irq,
+};
+
 static const struct plda_event_ops plda_event_ops = {
 	.get_events = plda_get_events,
 };
@@ -777,7 +835,9 @@ static const struct plda_event_ops plda_event_ops = {
 static int plda_pcie_event_map(struct irq_domain *domain, unsigned int irq,
 			       irq_hw_number_t hwirq)
 {
-	irq_set_chip_and_handler(irq, &mc_event_irq_chip, handle_level_irq);
+	struct plda_pcie_rp *port = (void *)domain->host_data;
+
+	irq_set_chip_and_handler(irq, port->event_irq_chip, handle_level_irq);
 	irq_set_chip_data(irq, domain->host_data);
 
 	return 0;
@@ -962,6 +1022,9 @@ static int plda_init_interrupts(struct platform_device *pdev,
 	if (!port->event_ops)
 		port->event_ops = &plda_event_ops;
 
+	if (!port->event_irq_chip)
+		port->event_irq_chip = &plda_event_irq_chip;
+
 	ret = plda_pcie_init_irq_domains(port);
 	if (ret) {
 		dev_err(dev, "failed creating IRQ domains\n");
@@ -1039,6 +1102,7 @@ static int mc_platform_init(struct pci_config_window *cfg)
 		return ret;
 
 	port->plda.event_ops = &mc_event_ops;
+	port->plda.event_irq_chip = &mc_event_irq_chip;
 
 	/* Address translation is up; safe to enable interrupts */
 	ret = plda_init_interrupts(pdev, &port->plda, &mc_event);
diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
index e0e5e7cc8434..a3ce01735bea 100644
--- a/drivers/pci/controller/plda/pcie-plda.h
+++ b/drivers/pci/controller/plda/pcie-plda.h
@@ -107,6 +107,8 @@ enum plda_int_event {
 
 #define PLDA_NUM_DMA_EVENTS			16
 
+#define EVENT_PM_MSI_INT_INTX			(PLDA_NUM_DMA_EVENTS + PLDA_INTX)
+#define EVENT_PM_MSI_INT_MSI			(PLDA_NUM_DMA_EVENTS + PLDA_MSI)
 #define PLDA_MAX_EVENT_NUM			(PLDA_NUM_DMA_EVENTS + PLDA_INT_EVENT_NUM)
 
 /*
@@ -155,6 +157,7 @@ struct plda_pcie_rp {
 	raw_spinlock_t lock;
 	struct plda_msi msi;
 	const struct plda_event_ops *event_ops;
+	const struct irq_chip *event_irq_chip;
 	void __iomem *bridge_addr;
 	int num_events;
 };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
