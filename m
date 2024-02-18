Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA28C48BF6
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 10:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2R9WJtM3uEimrF1pUeIU+Dp/esNLphbjguE6x0WO4Q=; b=abrW1VpYhy/bOn
	Kqz+bGv/Ak2du30gjJwJ7VM+YwiLL9YIg0gX3VM48EwLz6g7XYIWjAX7VyvASDQeOKUtt6zSOfxBg
	nKEsw7HDDotiwWnkG5l9NLO2j3E78lC0vyVVqJm6OWv0FFA7D5SbkDvtXOnnUPfw+m0ekUU4+ikzm
	tKDoPolgh26ZxZkSiNJ00ltXWbG+fZFd/g6zSg6s/Z6iKYx0fmwFOZVaV5+x4zAb+poF0xBCxOa5x
	twNOmvlHX06n0YcVINYLaHbv8j1tdETkEggM18u6M4gVViH4w00FWKiWkeGA1qH6HUfHIY1j/tIqB
	Z0JeIqsO7Nblhk37rN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbeFO-00000007TMG-11PN;
	Sun, 18 Feb 2024 10:18:10 +0000
Received: from mail-bjschn02on20715.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::715] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbeFD-00000007TB0-2gX6
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 10:18:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/AXF0Sh5UMBpORY79hRgdA7qgky+XB9ZD7UhB9VESE1LqGvoGhv7tsQQcutV9OV+64XjvX8VqBc5wFOB+oLQgmrUhG9x36YfSASFS3GEuPYDD8fOAYDz7B294Q+E8qAut5PC/qw5AtN1ovUElD/4odl78aCiKM7rNam/oX/6RkduujLc3bmY00CxgCjCRSghLRTi2chrnAM+K5Yu1OmRMu4q1c0FQjdxlkI8DOGYQqDvTurGfm3Vg3aIAqhjrf4PqDOX2WPAJdynjJIIP8XOJ33xkYAVN4o9fW+jDJ2aKDvXWrHCdC8kJ5vUJCJ7Wo9n3LdASv6ZTG1n4a/obTvgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiqHj4APLQ+5sb97w44ol5KWqweOs8B8Tg2C7Uqvdm0=;
 b=YZtmA3Pltg/wkzVtetNM0dDJizxKQSBwwt3TaP9QF83gvxNyuripwsCgcBe/E8DaOHMJtMfvguBiTOUasVaEPsGwIGoEeVXONlPWWjcyFSVOsuCOBfHxMGM9auQPDdamY4iR5/el8Sezm+aelOWWWJHUWrcODQ9NKwwrCk4FL52outnsfTOKNTdrDXBpSPEerCdxPaPyE61liTBcF4b3AVR7Pd0R8Fd0A5Y3jF6Yc7J5wyJlAy0NwHto1/lwbQ6F+uVvByMhQtKP9uT9rKhmpHNDnWce//Igo2YP+KwjU1y+72jUaD5j5MV9cQXOn8eIpKopgkTwKUJ3eVqobjrJTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0765.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.46; Sun, 18 Feb
 2024 10:17:46 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::5a5a:fa59:15fd:63dc]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::5a5a:fa59:15fd:63dc%3])
 with mapi id 15.20.7249.051; Sun, 18 Feb 2024 10:17:46 +0000
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
Subject: [PATCH v15 11/23] PCI: microchip: Add num_events field to struct plda_pcie_rp
Date: Sun, 18 Feb 2024 18:17:30 +0800
Message-Id: <20240218101732.113397-10-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240218101732.113397-1-minda.chen@starfivetech.com>
References: <20240218101732.113397-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0022.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::31) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0765:EE_
X-MS-Office365-Filtering-Correlation-Id: 65bfaaad-ad15-459e-99c5-08dc306ad9e6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: co6V7q6hZ0RZCqIypLTafcAzhAnVEtOuUXXp3fpav0iIH9ducynUUd930CxPqEjabY7NZwCDAVUDPZbfpQQf+Gbs4CYVumMAJc7kt8s/x6Ib6lCfIqxKXzQeOYiz13/S4O1RthTGfkr5EH18keRwyYDKZqbrQ1nQRw/veZLV2TqiDJTTkPriWOpalOFrLq6Zfgsq08azvEFUhbZ4sGUfIS9lronFgLlYqvDrxKGftTvVk/1UhsJHRsknEo29D2aGYSaDpMerUXHt8iRAiCRc6yoH110sFrl6fkFbCxGFYJvgLWl8aoX/UguH+ldkRUGBsW9eXSprzZeWnnzkuJWwCW86wFtYiPtmLpipAIOl+jRejQ7qAl5AG0J18la58sLFowcfqL8fVXKhDilfcn5iSKGxHQSclDD3Wc0dhwyZQPveJjsiYwVceKYIoHhqGDrLoISJiEBdnrPctOE3QfiKGN22CXC25/9gbNxKFntY37ikzqYafC8uQJYZdzo8IMG/I63Opt8cM3kbTNZf28A9QPd2aE6CfThKKCyfS1dsaB4EMfFvXuEPOp4Lz+evFjsJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(39830400003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2906002)(5660300002)(7416002)(44832011)(41320700001)(26005)(1076003)(6666004)(8936002)(66556008)(66476007)(4326008)(66946007)(107886003)(41300700001)(2616005)(83380400001)(8676002)(40180700001)(38350700005)(52116002)(508600001)(110136005)(54906003)(38100700002)(86362001)(36756003)(40160700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+B/akDW3uBJRNeHBHZ4bPTIRvcXvqFCLIQrVe2wWNUaK6i4rICLfkRSQct+u?=
 =?us-ascii?Q?5d7urybcBlkiRqHYbxzA7/lX510rziwsUQagnphYQznvQkflaUbjVUJmxGRV?=
 =?us-ascii?Q?naIVE/YCuJwGSWnR28X8pWeJfmRP9I/A7s+k0J7qRgpuYbGiwHh5xs4c7nxL?=
 =?us-ascii?Q?BeILrY29r1Cv0KDTz/ujCh8mtBl9GBdbL/IqXCyoBmgGpZx4KYdLYlPf7FDD?=
 =?us-ascii?Q?O74LdXzgAsGFN9ERo61eilXcok0U+XpTJW14hx3yS4AWMS3XZV3Z8CmtF3Rn?=
 =?us-ascii?Q?7P8uOhn9Lb2pqtJQuTYaao7G8ZcsVxOHhcDiaJ8E5HSV8ODzQBkFhkPLigim?=
 =?us-ascii?Q?OcGzQRvEIpJbsaHvITgc40dvi9X3MWQix+UO3ftGecECUrQIf2gL6lTySGsa?=
 =?us-ascii?Q?DAV/gG8qttXftbyG/Ib5x9aOx8UyzCKlW14wwjQpva5zOFnOCcBOthp+gUi8?=
 =?us-ascii?Q?kP9zZtQOC70KKIpoMyQrkjQs+TI11R0/epz5/+Asj9sQQPQxA9ZIHFlRIgFM?=
 =?us-ascii?Q?ZZBkmNn1Uq/GM52vPwxOG2IPiUcLWzZwXTtQrCOViMYylWYmSxfMjKu1+Cae?=
 =?us-ascii?Q?5PKCIsiuy7+WFE0N6PlZ7HIAja422PFD+7inkGlfdjRA224KcpALFiBwutiu?=
 =?us-ascii?Q?Kw+ECWTNnSYQVG7HPq7nphqJuL+fu13iz7yJ54BhCMF1VFfDuMEI28Exp2xW?=
 =?us-ascii?Q?wlv7WocRVvPREkhI9ZWY4gNfLqWaof/aPLokQRGIYLEpYmQSkndtkeVytGmD?=
 =?us-ascii?Q?ZL0PMt8yL7mioUkoXfGYIJZTJHdw+pL36WDga1ipMYapHvn6OZHzLCGtrLlS?=
 =?us-ascii?Q?avbnjgPGDaPjYBjUZSaM3juxjL3N/qkCGupdtt4M5UDgMqBCvfhEddHlOdF5?=
 =?us-ascii?Q?W+MbgGoqrbxEqwsPflp1l6gw0lUM2vhjYAXP31a4ULL92o1GLPhyqjBKw8WT?=
 =?us-ascii?Q?GB1KOq7i4R7w8kO9pWmKk1n3ikY0vlmlKe9pG0/7leIK339aSZ8Q6uBXCj6Z?=
 =?us-ascii?Q?XMDAnnyuUIgpdrpj6WPuVoo9+MsskT7LmXy52GQcc9ypULAm/2sZIlRS1UaJ?=
 =?us-ascii?Q?NYBlgrrxP9iKMucX4xXw35Q4Se+RxGhejfVVnd4aqWrXUwgRll+lp45xANgf?=
 =?us-ascii?Q?xre2VqYp4mCN6pNphM0KP876shiXJqIgXRTW0io1V5lvA9OmxzxvBKmkx9wE?=
 =?us-ascii?Q?lHiJL7nHcV1jxmvE+DsGy8YVO8FO8FqDornRlMZmyNqn17QAahQoBh3MDDw1?=
 =?us-ascii?Q?wG0ZVHvy0f1AvFhcATTKBWPsakGZYYoXw/GjtkeAW0V+HKtedN1ESJJ5T48I?=
 =?us-ascii?Q?HKe79u6jVvIXSTU0JMeFxMGcZHfF0nnqosev5Q/Jw5COAWiONbqYD/VNgw8o?=
 =?us-ascii?Q?YYtjYT9DXja5VmwTW8FML7Lxs4EUNZAyJi9gbnuC8dB2FuJ2ghU/K5T7oIIY?=
 =?us-ascii?Q?D6Id3WTU7mfwzQFD8FFTz0oSwdQAr+Artmed/7IjKgSObp53WGBdghzlslHR?=
 =?us-ascii?Q?Bja8UtTCAt/d5Ma/c4CIwsISjyAOrtAEZtyz+wQghNIEO0gQrTb4nR7ifB+b?=
 =?us-ascii?Q?SAmBoULWNkVErS9EQougi5ARJ3B0iVHu8iXnR03jAy/caxBhtdwP7vXUWASM?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65bfaaad-ad15-459e-99c5-08dc306ad9e6
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2024 10:17:46.1389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VyZ7S/xcA6o9tESdyTN3eT2BayA6xOTVwzqOCf7yaaneKMArszdvGnnNqKFFXMMLZphILrrirGgvmyqWBmp+/BcpY9wMLi1KJ+9EkqqZkv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_021759_713838_0AB87202 
X-CRM114-Status: GOOD (  14.18  )
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

The number of events is different across platforms. In order to share
interrupt processing code, add a variable that defines the number of
events so that it can be set per-platform instead of hardcoding it.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/plda/pcie-microchip-host.c | 8 +++++---
 drivers/pci/controller/plda/pcie-plda.h           | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
index 18bc352db389..0a5cd8b214cd 100644
--- a/drivers/pci/controller/plda/pcie-microchip-host.c
+++ b/drivers/pci/controller/plda/pcie-microchip-host.c
@@ -653,7 +653,7 @@ static void plda_handle_event(struct irq_desc *desc)
 
 	events = mc_get_events(port);
 
-	for_each_set_bit(bit, &events, NUM_EVENTS)
+	for_each_set_bit(bit, &events, port->num_events)
 		generic_handle_domain_irq(port->event_domain, bit);
 
 	chained_irq_exit(chip, desc);
@@ -816,7 +816,8 @@ static int plda_pcie_init_irq_domains(struct plda_pcie_rp *port)
 		return -EINVAL;
 	}
 
-	port->event_domain = irq_domain_add_linear(pcie_intc_node, NUM_EVENTS,
+	port->event_domain = irq_domain_add_linear(pcie_intc_node,
+						   port->num_events,
 						   &plda_event_domain_ops,
 						   port);
 	if (!port->event_domain) {
@@ -920,7 +921,7 @@ static int plda_init_interrupts(struct platform_device *pdev, struct plda_pcie_r
 	if (irq < 0)
 		return -ENODEV;
 
-	for (i = 0; i < NUM_EVENTS; i++) {
+	for (i = 0; i < port->num_events; i++) {
 		event_irq = irq_create_mapping(port->event_domain, i);
 		if (!event_irq) {
 			dev_err(dev, "failed to map hwirq %d\n", i);
@@ -1012,6 +1013,7 @@ static int mc_host_probe(struct platform_device *pdev)
 
 	bridge_base_addr = port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
 	plda->bridge_addr = bridge_base_addr;
+	plda->num_events = NUM_EVENTS;
 
 	/* Allow enabling MSI by disabling MSI-X */
 	val = readl(bridge_base_addr + PCIE_PCI_IRQ_DW0);
diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
index e277a5452b5d..f7e900b395f8 100644
--- a/drivers/pci/controller/plda/pcie-plda.h
+++ b/drivers/pci/controller/plda/pcie-plda.h
@@ -124,6 +124,7 @@ struct plda_pcie_rp {
 	raw_spinlock_t lock;
 	struct plda_msi msi;
 	void __iomem *bridge_addr;
+	int num_events;
 };
 
 void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
