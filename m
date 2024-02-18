Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E27EC48BF6
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Je4CzoGczrFVvIwECIrEn3vzsLlbOsXgQsXzbFFt7QY=; b=NcfSyjtLsi+Np+
	m8wOQNwYrSbEyjeRBWZNVDWPAoqfs1z339YcWw2IiZ4gj9GTCiH55clorypg9n1eoMhgFDGotUcH/
	l40BMJob92ehhkKqeElgOukG8VCz+4cb6iAQ6R3fcH3+OJTHIMctbaBU0UrPzYcaIGRj/r4EdeA5t
	UtvwQ6GQV1wOQEBAHeZupTMBH/jCaRkZrzRv0IQi5RlKubc2+3oygSWQARhl4F0g1t0rl7bw+ygln
	qE0sDMk5LOAN+Ei6tcdxm/sBIm8JUZQiF8RbO2DQyHcyvIv3hHCvmUAFTdUtgMyof2owUMJk9koF3
	4rGrolXDmf01ePQAQHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbeH1-00000007UJG-2ZGh;
	Sun, 18 Feb 2024 10:19:51 +0000
Received: from mail-bjschn02on2072d.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72d] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbeGu-00000007UAa-0Axs
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 10:19:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6du/Nw94005xpKcvc370t+YikyKSoj/1Ut6DnSztz4TAszZjzujSlCM1xXbToA0Hd25XRkvz4EjoGamLw2kqBQjXS+XXKadcAPmxdXDCrTULaTqA/I9OC02JM1Dd6dmvBT99cExmvhoWKOBMLk+72Zl/rZQUUEWuvc7OBJDOeGPnXD1jjZs6wmleMVah9cdoRxcnPx5hsVupmT9RIyVh02Ur6YboW1Z3wO5fb5UPEy04nFn+Pz4y+crVpzHABdC23qtRR3zRpaWJYSdt8o4wOQ2mpVOudmcS0lBxrFPwkeTOVwZOBFn/fy9kQzRIiMSXRvroV7fzL900NWYcK7T8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRrm21BRcALG/c3V+O6g+r9icHsk85hPZnWqZkhA7Z8=;
 b=aTqnpUtTLdHU8zmG8QD3GkHA3JiLgN77gFbULAEoeyCF12Z+O+wWseTLIfipuzd4dPt/BWCDtL7vdolVEnxD7Lo1dzc/akiSug4VB/tUykxqykRFTzSjwG7Ey377GlfKUVfD7mBRAjlfjHPPxc2KPxLMVNYmLn5X/mT4g8cSHBXwaayu97I3/MApwzjzozdXXlNrp+t6J21IfyvuGVk3Jz07qHHdCh2jWZoiEKNjEOT87rY+T/XKFjT1SSvxWPFfXxgMudhiDHH4nHkwQ0ZWo1ZMHHEfTErIuctBhPZEU7Yk1r8qDHihajGr70012LoCXq0e0Dg51Jak5Bspun6k4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0464.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.50; Sun, 18 Feb
 2024 10:19:35 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::5a5a:fa59:15fd:63dc]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::5a5a:fa59:15fd:63dc%3])
 with mapi id 15.20.7249.051; Sun, 18 Feb 2024 10:19:35 +0000
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
Subject: [PATCH v15 22/23] PCI: starfive: Offload the NVMe timeout workaround to host drivers.
Date: Sun, 18 Feb 2024 18:19:20 +0800
Message-Id: <20240218101921.113528-7-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240218101921.113528-1-minda.chen@starfivetech.com>
References: <20240218101921.113528-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0010.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::21) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0464:EE_
X-MS-Office365-Filtering-Correlation-Id: 229af3de-c65b-41b8-da21-08dc306b1b11
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8ckrRPtX0j2XF7tx1lI2RQrqqWrNHT3i70bEguRg1HOYKuoQyjTO27EwKElXlZcvXgoGvzmYUPWpXNy2fICRdvGNjzVYyLD04QEfMRLIAegnCAQhUDOxGbsKHhxkFWXLRrF2t+0o05f+P5LBOdW1JE05uUhn4AlxgBA1vArEhjUwUrAf+w3NHEF6gIJeR/fknGRdeKURzsM5G9Ftz1dxDWs37RjpLUB+bYN4TdLW/9Bo/eTjIeztWCM9Ej6ngXYeItwn8qiN5pLxKeTfRJWEVIRPXmd+vqY2PLZE5zDifx8KrBzA4Ke0CoGt31Sb7bZEVfuwwnipbJI51H4Bt3mkQ3J6ofXDOehK8q1A5YZLK3EUhkcYYBILwjg8wD2NdjxTIFH1t0qsk6vTdmIk9+iZt2eHaOnXgeJUsTV7zTZTDyQMv+qgdwtIx2n8kGJ4rYNCBgIXMM2TFk0Yu5klOua//Cp7UAIM/DAphMisEC31iijT2BSHDABuyx6QItE5NmiAZlEhhGjn+Wfqh/fiYKS8+3oVzNPgO5DyJvYWiOy6dPeNFe0JxLZ9zAOqJoIWrdz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(366004)(346002)(136003)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(86362001)(83380400001)(40180700001)(40160700002)(38100700002)(36756003)(5660300002)(41320700001)(38350700005)(7416002)(2906002)(66946007)(4326008)(44832011)(54906003)(66476007)(41300700001)(8936002)(66556008)(8676002)(6666004)(52116002)(26005)(508600001)(110136005)(1076003)(107886003)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l4Pfh5CYzOcdzvU/kbIlWK2VZ497ITSpBQH7wV0T1CUtRUbIdE6qKEGCLyfM?=
 =?us-ascii?Q?H4jiB+5pdFSJEO5KjTCqGRKLooxDZTBBCtxtXcbkJLyoZ00NVzQ0DYvmkuaK?=
 =?us-ascii?Q?KWx9Ky/nb3PfNCZgD56nwfT3jTEbQYMtJWlFBPfq18xcehqfs33MAFqCEcFZ?=
 =?us-ascii?Q?WDJNZQTXhFSTZIGSB0+/6Wf3+aw35cyJk6tO0W5f7TXtmOpWzX1dVdn+GwSU?=
 =?us-ascii?Q?Jvn3YAk2GgROPZdLt+kTIK1ilD2Hz3E9oBZ8su7vzynXo6MLCG1K/1unYKFQ?=
 =?us-ascii?Q?1Fc5U81MoWRekzBtCFvYIYXDr44tAPlJTK67FN4Yz61avAABL5evBLsNcnHI?=
 =?us-ascii?Q?EIuXPLgjETD6ctxM6QM+NAGspNzYrko0t+welvo4CQzUBDH8x4Z3ps1hhtPI?=
 =?us-ascii?Q?g7Bb495bzGiHVBFVSXXYdE222X1/lH+XBtsVH9Rnf+NI/QwpLa1K4efWJwjC?=
 =?us-ascii?Q?5nNqJb5dI57wIMsxeo3dNrlr8s4v/1w1oASbEdZQvyhr+GQ/2YHWbDJ44fqB?=
 =?us-ascii?Q?49Q1Yz//Ap8OI2D4pDfZKf5/Pj0BqH2q/psuGl7kEG1lBwrizvlNIpsPlDBP?=
 =?us-ascii?Q?md9SFvTXJilvPjUmyZ7h7liv1xqqGso2ce5KCEv0tFjKwk+FbjXfzUNHTD7z?=
 =?us-ascii?Q?plykmLIlRUZTzp+hvymMsTW8kRTHwmp+FKnSHlexku3DPNsLU/Qji6/2n+ky?=
 =?us-ascii?Q?sjZzxZ49+HmMh2kNoFEhFbX8eWe01atiNnbXdGqcGmQGm7WEDkraIl2EDI4c?=
 =?us-ascii?Q?VTunZXzHiMXB2QFFyJ9+eQalrclPgQE/e7KAk91Z4Iz0voM+5whTCLet56lf?=
 =?us-ascii?Q?vmHB9DOezUlkn5S0YCqezzzfKU+bNDirMtoYCZd9gHhJLq5lwZq2PZ7kJZN4?=
 =?us-ascii?Q?gInxsA8HvIIpVoHBgDS8iuEiYXmSMcwu5fWrg6Z/YZF7tbV88AkV3BP9h9lo?=
 =?us-ascii?Q?W/vOcwYtZtxpQDpUb52gqsIkNPZUdckFMDMgZU5zs7COEgP9LuHCDC4RwGoA?=
 =?us-ascii?Q?EvJlJe1JAZ9aZOULyfRotbC/AciV76zWKNiMYd5blsj7XnWcCTgKrZgS3O7S?=
 =?us-ascii?Q?Ue5AJJ2ZWpsmC5zf1zssnvH59Xyusufo4RUkXDa1oi0WaFtwklOC64GKUg78?=
 =?us-ascii?Q?7J2u1rZ9sLYI9PTTzsCF1T6PGYavUkO/qnnNJ9ZITHwrrv7NckwN1X/pUrJP?=
 =?us-ascii?Q?XtHjLq010ZFv5hvEm6BWgSznlPTjgfouH77+YdUW/Y2G0wad02pyMpag/BUr?=
 =?us-ascii?Q?dnXZIY15LJqJMB1n7yovLRdSWhUVlmnJHFyrL/9GTyk2Y32C35WHBHp51vu/?=
 =?us-ascii?Q?GAucP2kSa3N1KRA2UD9huTFhddQ+/ZVytTDl8nz8PMWfkFkGIRY+W2/9D1am?=
 =?us-ascii?Q?w62gnOxPvIzt81mvaEGw4Pa91I6S+24aRWkK3Up4egX3Dsie8Z/T5CA/6bV7?=
 =?us-ascii?Q?5vPktfAvMfbga4pU+hpXkFLCWkr17UfxCE1/exylpYaqeVzFh4uCId/sGvL/?=
 =?us-ascii?Q?HyO7V9Zmgosukrrj0elD+C0fEi4WbvBaE20MYL/7iOY8IXgggL9LW9PWGxNZ?=
 =?us-ascii?Q?QDlnPcDx7RtewuVmeDL0QqAkI1+4kl9rntwucgGvyScPa9Ppe7xshzgGoQov?=
 =?us-ascii?Q?eQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229af3de-c65b-41b8-da21-08dc306b1b11
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2024 10:19:35.4870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdYZqh+6A87vzTOJOUzH45BN/7aqqEd/E0S2tBpqIrmIPzdmahOTGdBSWeyf3ZWXPYcxp8arXX+C+TxmubeqhD0tHqgscQOBdXApSDHSXDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_021944_402652_DEBA1F3D 
X-CRM114-Status: GOOD (  12.99  )
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

As a workaround, we will wait a while before going to the generic handle
here.

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
