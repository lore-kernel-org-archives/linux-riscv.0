Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5FDC48BF6
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJCZJx/T+jYNHIjX46VsXYOm89BuWWY/ZaddKWXK1w8=; b=2RLoLW/05ARpdC
	Z0YGSaefpvPLGrHZFtTWiRi9BMSR5atyhmSlmqGIVFCg7wNta9P5d76FAhXExvQNSdM6A94v/inXz
	7iLELO+Tq2YVaVvgLxvdbU0T+alozipBWzwvQSk+wuzQVGgDLNFUiQMmBjwlqlOuqdxr/KtamdoCe
	a9Ats8JLh06Zy8Awsb3kQFiSBHogVqLNK9hXobAeR8wYI4v1u1348M8uUj8A0pNQyn3QEHYUS0Ykl
	frfHkpg0F9Rj/0FXWJZb+TF9lyLcpy0I2nVbRtNna+2/zGDW7YHvcDQQ80QBgtDN/zkkmJPkfIym2
	7+a8z2D6vpQoAnCXzKfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbeGq-00000007UBv-3kgL;
	Sun, 18 Feb 2024 10:19:40 +0000
Received: from mail-bjschn02on20731.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::731] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbeGo-00000007U9L-1Bb3
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 10:19:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCMy5E1q4e9LgOaSbr/zgosPcYStkhgPwpxJZ6KqULIavSs0Nh/xdEyEQs7DQaNk2k/kgae5m/3XZsKAP5SrzikWpwGgHlTf3pzUcFZb8L+RnYLbMzOxlTJMKm0ZOBDEdaeRRVcrtXCsy4jn251hrxNAviPhusOkpSeGhc3eStuQhz6Vuyl+rBdcOMgKCUz/ja/bLtrTFRfZZ7eoCFOzM/1t/x91IkZcG3FWi3ehk00HpoyNv9I6cvKX6a0lq8iizby8yVn/jYksrLbz4XrUQyzTau1O1VCowgv6F5c+TBHLSg0j7uYPUuMVELNA0mrPG5o0ga1R5zV2qD7QqkclUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mdPM9tc7+aMwCmMjqDwieu4Un85dfZDn1ub7cOMzuk=;
 b=lAVyN8rKo5jkBwCvcGdMa17V6s1kv5WFrlcgQneNLXKMzBZW/YFOtZug+JErcjl+8BFo9lh0e0mpSNbyNbCNFxE/ytr10BsZ7lfi8utT6ZuhJOAfyf4uu/c908sVeQ1aplwBSFnJx2EUroB5dw2FHWPBVG1NcmFry+B6fRUMXO7UA7DsLQ+cNgAKq5ux3QUrG3O+qa0inaY8zJN0BgSKEoPrYkudGx3MR65ahIYtmjiZ70wnXAAutgm/grWHyP3Ci8kXAS0PgSaKJzeUl17SMcKRSNL0s7JnJpaRKJMnzEzlKZE0TqLiaukcV1nuCmNwOoPEPF4q7JGmKrq4fFSZoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0464.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.50; Sun, 18 Feb
 2024 10:19:31 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::5a5a:fa59:15fd:63dc]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::5a5a:fa59:15fd:63dc%3])
 with mapi id 15.20.7249.051; Sun, 18 Feb 2024 10:19:31 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
Subject: [PATCH v15 18/23] PCI: plda: Add host init/deinit and map bus functions
Date: Sun, 18 Feb 2024 18:19:16 +0800
Message-Id: <20240218101921.113528-3-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240218101921.113528-1-minda.chen@starfivetech.com>
References: <20240218101921.113528-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0010.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::21) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0464:EE_
X-MS-Office365-Filtering-Correlation-Id: 7447f9cf-e240-49d4-fee4-08dc306b18e3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A1V8bAgzxu9MNWU3T9VrkaHj3kbutmbacuAlOtzQR4UKggWtBs/SK/HJU3J5xyTcbfJGjfdya4LuV1HxDEOUK/e61RFDGQRh2gEmgRhi+G7t90Jp4UpTcFPGnkjxlhtIArnWodi/RXPxqHpzxOm8tDQjR7gpLCprfsAkR2zdPbYRn/5bIDIQFysW23dHMKo6jfcg6ry2czzMwiIn0Ahp/F/B61OBGV8qQkROadeHNxD98pHfEmSN5fWC6qh62ELyZRnkjz+K/MfgS5DxvI8wh5IUcFRNs0KKVVqd7uDWBeG+ShlwhYZirgYWbyKxcfOT3AcGW2i80kCiyp5IcUjrT1tTRovza73rACZIcSwKpBd7PburkRgAc7WoaF/n5Cpau/cXZXGHL2iwABo8vp/pdVAz7YgNRY2+y+ZtOUHbJUtLnMsWeTa/WFvmKyhRBuOoiJ7Rskh3wAmQCF9IjHpg9CE8XSe2IsVSf/5ARse9WDQfHtuDWxDjMIT4OnIhWrBcSiLMQSNpyB9oEq2nBksfMxX3ZiU24uNpNWpUy7YomPa/eT6kR2xDnKacn1VD63qT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(366004)(346002)(136003)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(86362001)(83380400001)(40180700001)(40160700002)(38100700002)(36756003)(5660300002)(41320700001)(38350700005)(7416002)(2906002)(66946007)(4326008)(44832011)(54906003)(66476007)(41300700001)(8936002)(66556008)(8676002)(6666004)(52116002)(26005)(508600001)(110136005)(1076003)(107886003)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T9vE2hvmpppMi4Vpekx+vyTcjFHl96aIOkg37/R8uTbLPgw1cO7pcNBVblhW?=
 =?us-ascii?Q?DdU8ZwaEruQGF9FVGoguWM1AbPl2fDX53mqmie7+NA2aEUcfF6y29InNw08/?=
 =?us-ascii?Q?B5poazzqFcucB6dCun061CXOXcisA86izkRpr1osdRFcXww452i1equIPZ8r?=
 =?us-ascii?Q?JVy4tPxSX8ksfPa5plUccjdNhxyDLsq+Tf+bNXk0l+U3h050AGLNT+gUfLvm?=
 =?us-ascii?Q?XAuJ8k8i35ggxb+BF4Enz1wb/cd+j7TH0m2R5BkV1JUFn1d63lMRdt9IwuAg?=
 =?us-ascii?Q?ZpE8r9d/EdMd1znhhpOWRWkNhh0hpPy+vJhk8+A1Tlfai3W+ajvqnWHry8AV?=
 =?us-ascii?Q?9HgsekVnsBKDjmUMDmMQ3yMyTIog/wZ0cWxOooLmrOIhFBp4voVQm85YgU8p?=
 =?us-ascii?Q?tyJFyCrZbKbd6j+DfLELp/fRmZTbAPuEyJvGVaw/bh7davDW27sbkBezQU5j?=
 =?us-ascii?Q?H2idpUS+BrDtxbEHLRXyecEeNhks0nAtiM4kZCxnxx/hEH4hWu6u6+vFo3yS?=
 =?us-ascii?Q?1fzsH330YSyE1LN8CdwLRDgStUTFTZh1ZEvaQ9QWdEX0S45j1NkYE7gKaywo?=
 =?us-ascii?Q?z0+Uh31nFXZ3PjwMkpiSbUvIA7wPWurZdPnSoAFOaYAKoAvE2pzQA6rUpdAn?=
 =?us-ascii?Q?BADVRPvfoam0baKVSysiaWMtmi4+0Hd0I64C8vziqUuJkG8LhnZovwXSsYal?=
 =?us-ascii?Q?SpNNjHAKc/QQLpS38bCUULEFknbYYny0TuKsPxtqOHxXHqyirv581ckSvFaA?=
 =?us-ascii?Q?xxI4sZIPpADEcB/09eW29vLkYN6yKiNlpuh/zpG43D7qgv6fmIzhXczbq0Wn?=
 =?us-ascii?Q?xpo0MwsU2srfMLzVv8wNmD41eydHNkoAodRuYpyH8z7BDL/i/UJ0fpKdR99k?=
 =?us-ascii?Q?V4cj8T9Opie1wgJG3tLbSXrw/vH1wBthZtzpjwc+jKU0vv4UuaLWsn9eThn6?=
 =?us-ascii?Q?PCQ6e/hbicbRcBQ1ltQdPZcXXxNjNUw5hXyW47CHtBkJgprhcZvReHj3DNop?=
 =?us-ascii?Q?mEsBZxOUeY3E02Yzt80KPRQYaXfbfDsCnYaYcNtbZBykLLHr3W4rqnOQGTLS?=
 =?us-ascii?Q?RIIS5+5cMlIDZx6YVispwRUNOlkappgBKM03jDo0tR4NPI7mpebcSkJf45yq?=
 =?us-ascii?Q?8zUmWqxSQeYAxX6OZxSZisO7Z04Kvg6pEsGppM2VVsER3OQe7DjEf8uq0yFF?=
 =?us-ascii?Q?gMEgwWfVjDE68EVN4TaqARpTiP1ee+vhNXcej7PSIZYuxEO3Hg4JnswoX5z9?=
 =?us-ascii?Q?PyeIpW7DB4tDrJn3pOokLzpNs6iubyZi1+JfxGU3j0p4xrzS9H0EH5rdk1Rt?=
 =?us-ascii?Q?y1PfhCGAdSYSDwq+wzBPhek7aimxvaEb4sVYro1uZLkKZxUZ8UWbll5NuZgR?=
 =?us-ascii?Q?CoWGmt5bPwt2lenxbMIdGvZKa4xfqGYpiJKI+LSHsSYE+dqaxQV1QqQU5fP1?=
 =?us-ascii?Q?r2ME/z0InK63p9jnKbRaRu7LWHSAFe3VT5our6LW2umErIhpFytb7pZZaCHH?=
 =?us-ascii?Q?JmXbiGQjVxc9YCCjjtA4uv3y6h72nLwUr6eKGmRjCc2F9c5kCd/eQDZBkAcG?=
 =?us-ascii?Q?Buj9+BuFpkXNBm0YnEPfgT8dU+Jdryqk9aMkAbdrdsdxL9QWAulNTULD2X/J?=
 =?us-ascii?Q?gA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7447f9cf-e240-49d4-fee4-08dc306b18e3
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2024 10:19:31.7983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3XFTzdAwvS1DCguoHxpdJF4AWTG8Z/6S9a3m3M+lQH2AZCCys0ps2VCk4On4C/aoHODdK4t2Gtj4yrsTPVuIxsfg5I2Jsot0rTmPpd4mJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_021938_546875_26DD3840 
X-CRM114-Status: GOOD (  17.54  )
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

Add PLDA host plda_pcie_host_init()/plda_pcie_host_deinit() and map bus
function. So vendor can use it to init PLDA PCIe host core.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
---
 drivers/pci/controller/plda/pcie-plda-host.c | 131 +++++++++++++++++--
 drivers/pci/controller/plda/pcie-plda.h      |  22 ++++
 2 files changed, 139 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/controller/plda/pcie-plda-host.c b/drivers/pci/controller/plda/pcie-plda-host.c
index a040e7e5492f..a18923d7cea6 100644
--- a/drivers/pci/controller/plda/pcie-plda-host.c
+++ b/drivers/pci/controller/plda/pcie-plda-host.c
@@ -3,6 +3,7 @@
  * PLDA PCIe XpressRich host controller driver
  *
  * Copyright (C) 2023 Microchip Co. Ltd
+ *		      StarFive Co. Ltd
  *
  * Author: Daire McNamara <daire.mcnamara@microchip.com>
  */
@@ -15,6 +16,15 @@
 
 #include "pcie-plda.h"
 
+void __iomem *plda_pcie_map_bus(struct pci_bus *bus, unsigned int devfn,
+				int where)
+{
+	struct plda_pcie_rp *pcie = bus->sysdata;
+
+	return pcie->config_base + PCIE_ECAM_OFFSET(bus->number, devfn, where);
+}
+EXPORT_SYMBOL_GPL(plda_pcie_map_bus);
+
 static void plda_handle_msi(struct irq_desc *desc)
 {
 	struct plda_pcie_rp *port = irq_desc_get_handler_data(desc);
@@ -420,9 +430,7 @@ int plda_init_interrupts(struct platform_device *pdev,
 			 const struct plda_event *event)
 {
 	struct device *dev = &pdev->dev;
-	int irq;
-	int intx_irq, msi_irq, event_irq;
-	int ret;
+	int event_irq, ret;
 	u32 i;
 
 	if (!port->event_ops)
@@ -437,8 +445,8 @@ int plda_init_interrupts(struct platform_device *pdev,
 		return ret;
 	}
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
+	port->irq = platform_get_irq(pdev, 0);
+	if (port->irq < 0)
 		return -ENODEV;
 
 	for_each_set_bit(i, &port->events_bitmap, port->num_events) {
@@ -461,26 +469,26 @@ int plda_init_interrupts(struct platform_device *pdev,
 		}
 	}
 
-	intx_irq = irq_create_mapping(port->event_domain,
-				      event->intx_event);
-	if (!intx_irq) {
+	port->intx_irq = irq_create_mapping(port->event_domain,
+					    event->intx_event);
+	if (!port->intx_irq) {
 		dev_err(dev, "failed to map INTx interrupt\n");
 		return -ENXIO;
 	}
 
 	/* Plug the INTx chained handler */
-	irq_set_chained_handler_and_data(intx_irq, plda_handle_intx, port);
+	irq_set_chained_handler_and_data(port->intx_irq, plda_handle_intx, port);
 
-	msi_irq = irq_create_mapping(port->event_domain,
-				     event->msi_event);
-	if (!msi_irq)
+	port->msi_irq = irq_create_mapping(port->event_domain,
+					   event->msi_event);
+	if (!port->msi_irq)
 		return -ENXIO;
 
 	/* Plug the MSI chained handler */
-	irq_set_chained_handler_and_data(msi_irq, plda_handle_msi, port);
+	irq_set_chained_handler_and_data(port->msi_irq, plda_handle_msi, port);
 
 	/* Plug the main event chained handler */
-	irq_set_chained_handler_and_data(irq, plda_handle_event, port);
+	irq_set_chained_handler_and_data(port->irq, plda_handle_event, port);
 
 	return 0;
 }
@@ -546,3 +554,98 @@ int plda_pcie_setup_iomems(struct pci_host_bridge *bridge,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(plda_pcie_setup_iomems);
+
+static void plda_pcie_irq_domain_deinit(struct plda_pcie_rp *pcie)
+{
+	irq_set_chained_handler_and_data(pcie->irq, NULL, NULL);
+	irq_set_chained_handler_and_data(pcie->msi_irq, NULL, NULL);
+	irq_set_chained_handler_and_data(pcie->intx_irq, NULL, NULL);
+
+	irq_domain_remove(pcie->msi.msi_domain);
+	irq_domain_remove(pcie->msi.dev_domain);
+
+	irq_domain_remove(pcie->intx_domain);
+	irq_domain_remove(pcie->event_domain);
+}
+
+int plda_pcie_host_init(struct plda_pcie_rp *port, struct pci_ops *ops,
+			const struct plda_event *plda_event)
+{
+	struct device *dev = port->dev;
+	struct pci_host_bridge *bridge;
+	struct platform_device *pdev = to_platform_device(dev);
+	struct resource *cfg_res;
+	int ret;
+
+	pdev = to_platform_device(dev);
+
+	port->bridge_addr =
+		devm_platform_ioremap_resource_byname(pdev, "apb");
+
+	if (IS_ERR(port->bridge_addr))
+		return dev_err_probe(dev, PTR_ERR(port->bridge_addr),
+				     "failed to map reg memory\n");
+
+	cfg_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
+	if (!cfg_res)
+		return dev_err_probe(dev, -ENODEV,
+				     "failed to get config memory\n");
+
+	port->config_base = devm_ioremap_resource(dev, cfg_res);
+	if (IS_ERR(port->config_base))
+		return dev_err_probe(dev, PTR_ERR(port->config_base),
+				     "failed to map config memory\n");
+
+	bridge = devm_pci_alloc_host_bridge(dev, 0);
+	if (!bridge)
+		return dev_err_probe(dev, -ENOMEM,
+				     "failed to alloc bridge\n");
+
+	if (port->host_ops && port->host_ops->host_init) {
+		ret = port->host_ops->host_init(port);
+		if (ret)
+			return ret;
+	}
+
+	port->bridge = bridge;
+	plda_pcie_setup_window(port->bridge_addr, 0, cfg_res->start, 0,
+			       resource_size(cfg_res));
+	plda_pcie_setup_iomems(bridge, port);
+	plda_set_default_msi(&port->msi);
+	ret = plda_init_interrupts(pdev, port, plda_event);
+	if (ret)
+		goto err_host;
+
+	/* Set default bus ops */
+	bridge->ops = ops;
+	bridge->sysdata = port;
+
+	ret = pci_host_probe(bridge);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to probe pci host\n");
+		goto err_probe;
+	}
+
+	return ret;
+
+err_probe:
+	plda_pcie_irq_domain_deinit(port);
+err_host:
+	if (port->host_ops && port->host_ops->host_deinit)
+		port->host_ops->host_deinit(port);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(plda_pcie_host_init);
+
+void plda_pcie_host_deinit(struct plda_pcie_rp *port)
+{
+	pci_stop_root_bus(port->bridge->bus);
+	pci_remove_root_bus(port->bridge->bus);
+
+	plda_pcie_irq_domain_deinit(port);
+
+	if (port->host_ops && port->host_ops->host_deinit)
+		port->host_ops->host_deinit(port);
+}
+EXPORT_SYMBOL_GPL(plda_pcie_host_deinit);
diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
index 443109d04d59..7b69891700a4 100644
--- a/drivers/pci/controller/plda/pcie-plda.h
+++ b/drivers/pci/controller/plda/pcie-plda.h
@@ -141,6 +141,11 @@ struct plda_event_ops {
 	u32 (*get_events)(struct plda_pcie_rp *pcie);
 };
 
+struct plda_pcie_host_ops {
+	int (*host_init)(struct plda_pcie_rp *pcie);
+	void (*host_deinit)(struct plda_pcie_rp *pcie);
+};
+
 struct plda_msi {
 	struct mutex lock;		/* Protect used bitmap */
 	struct irq_domain *msi_domain;
@@ -152,14 +157,20 @@ struct plda_msi {
 
 struct plda_pcie_rp {
 	struct device *dev;
+	struct pci_host_bridge *bridge;
 	struct irq_domain *intx_domain;
 	struct irq_domain *event_domain;
 	raw_spinlock_t lock;
 	struct plda_msi msi;
 	const struct plda_event_ops *event_ops;
 	const struct irq_chip *event_irq_chip;
+	const struct plda_pcie_host_ops *host_ops;
 	void __iomem *bridge_addr;
+	void __iomem *config_base;
 	unsigned long events_bitmap;
+	int irq;
+	int msi_irq;
+	int intx_irq;
 	int num_events;
 };
 
@@ -170,6 +181,8 @@ struct plda_event {
 	int msi_event;
 };
 
+void __iomem *plda_pcie_map_bus(struct pci_bus *bus, unsigned int devfn,
+				int where);
 int plda_init_interrupts(struct platform_device *pdev,
 			 struct plda_pcie_rp *port,
 			 const struct plda_event *event);
@@ -178,4 +191,13 @@ void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
 			    size_t size);
 int plda_pcie_setup_iomems(struct pci_host_bridge *bridge,
 			   struct plda_pcie_rp *port);
+int plda_pcie_host_init(struct plda_pcie_rp *port, struct pci_ops *ops,
+			const struct plda_event *plda_event);
+void plda_pcie_host_deinit(struct plda_pcie_rp *pcie);
+
+static inline void plda_set_default_msi(struct plda_msi *msi)
+{
+	msi->vector_phy = IMSI_ADDR;
+	msi->num_vectors = PLDA_MAX_NUM_MSI_IRQS;
+}
 #endif
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
