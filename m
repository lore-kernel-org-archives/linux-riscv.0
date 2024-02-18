Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CD2C54764
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 10:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7colV521O8sosHzLY6giYOih67IVE76Q5oEd1t5UWk=; b=HBWPtSN5cSxufy
	IBsMiDQ/nUEoUjlvEzdLeyQHLMH6q1TA7C+l53y92uTajynvm/A3KTpmGBkn4VXGUWTACjo+weS7q
	DCVjGB4+nTiZDGWnIEaiERdCKL1OYc++J6z7mLz4//qeh8JeOIE6LDkWsL2FXvDC5UP80GR9ztfhe
	o6494QNYEu98QV7Fz74TP+7JaqBeoGvU1Dsj7V8ALlk8vRO9IVF4T17Uq59ip6g3GuwFRWXPKHtop
	myyrDlrlTFBqS6FlzE7a6gDWs66Tn2/3LMfU57fAjONqS7P7zKMBpwTVERZMszjqXEA1GqnjmjlH8
	G4T6QIgeDdRDOOoirq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbeFJ-00000007TIN-06fa;
	Sun, 18 Feb 2024 10:18:05 +0000
Received: from mail-bjschn02on20706.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::706] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbeFA-00000007TBd-47XJ
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 10:17:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHE2LucH27t+P4uepGoJMCt6sIdG6ItScu42UGx9QnxZs+1jwLq25M1SG+NRrcoPbGtbULBpKObxcjrTXPf435CxqX1n2ThusnaM+BSGm54D9rMC4K37GDln29Q+eTIC87jdHUNXJ/hFwVYs/JwOpxtCSyJLMIUUQKZ3BNWxoT783HdNlxF8vPW6yXZaWYMBtJz1U8mpDH0/JtH7Apu5w10q/+H2/FSSRKziErATzd9SHYfagjwkCEhKnlLbsbGiMKsGHjIf6e08PtN0C9bn7Nf9rU8bqHW0dp6ZrFEMqzwXhpu+Dq2IPLidKZLp1jk19LaZiPIQ01T7aGW+hcop8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pc2T6SbVvFNGAc7jANlqkHZ/EYw1YXpAsFWAuojjcfk=;
 b=kXbx5ZJ3rUPIuf7ApoFWVrY+h2Whso9BxUS8CCjQaNaDfFpe+9hZc4JOyzHU4SbdFn2zs9t0+KWu3ZWu9cGR5SLgmIC9BCXzaGBDC+uGcBcEpNpcc2h9P9boZ2IcIGnqzyKGzzd/nkV5V89tIWq3B7MK+tdzXe2+mx8Tc5fc4vrMOGqCi17Klu/A+eI3l7HePT981oftYTAGIy6Tc0W/vrGaHvQaDF/Yg5zVh9ktnZFCQE6n81tTp2JSwATGDfAH0Tp1JH0u1GtjIjhEefNa3Eydu6nHfzpINtzI99nlZlGAR/mIzvZwvxbnHDQfa4J26UOBTOJSGvlgyb/UnqelXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0765.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.46; Sun, 18 Feb
 2024 10:17:43 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::5a5a:fa59:15fd:63dc]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::5a5a:fa59:15fd:63dc%3])
 with mapi id 15.20.7249.051; Sun, 18 Feb 2024 10:17:43 +0000
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
Subject: [PATCH v15 07/23] PCI: microchip: Rename two setup functions
Date: Sun, 18 Feb 2024 18:17:26 +0800
Message-Id: <20240218101732.113397-6-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240218101732.113397-1-minda.chen@starfivetech.com>
References: <20240218101732.113397-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0022.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::31) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0765:EE_
X-MS-Office365-Filtering-Correlation-Id: 913ce892-71a2-4fc8-5608-08dc306ad813
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mHD69TylTeet4U0vWB7q0MTJ2G9aFflpdRXzcrX/VHSi8eXXAzQ1bsseUSFucKT+t/7wDkyM9PjZYiu+DYAr8qA8FVFVXBLqQd3KaggfqiUeCp4q5Ota5sNbSW+/936EUt4FFIEj3HAgbL0h/v7oX0S05+cP5MUxNWPmcdbYtEsNcBz8Fm7pXmFrUPnk8PHPGGxE87YLiXNAq67NG8jX2SCrfDo38RZ0QF7x0CDP0LcIBesaU/PJvJXwW4OAbjgZTDZWD1jbCAB+b4A0yaSZf0aLlayq4EPEUIpN7foBjVCzxSrGqxXs2jbYaZw7Kj4rSY/+cbEvJJjngNxb+XiSmOZvk8j6shuoPHslzzi2QSeoT+kYL7kFqFYn7d56Bm/jAUpX5phfoC8rzeB0uAfCeKYddYGLWr8Ca1fqlgZQh1zgvF6xxvCY9xoX6T+2kI4F+VDyT3PKl7GSjNnVC/oCyLR2n4bHat2ryjPtXKAGBEamKt5iTSqHdO2AicMwWtYj7GcvRNzgCdU3snuevNJ4eaRNYAfNJomqVd8yFdfe2rCJsnqtdQKu41pIN6S/B6Wf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(39830400003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2906002)(5660300002)(7416002)(44832011)(41320700001)(26005)(1076003)(6666004)(8936002)(66556008)(66476007)(4326008)(66946007)(107886003)(41300700001)(2616005)(83380400001)(8676002)(40180700001)(38350700005)(52116002)(508600001)(110136005)(54906003)(38100700002)(86362001)(36756003)(40160700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VNsT9joutmQkHa4G0kcEjHdERblRlq2304MzA4+gt6+LQhVWAlHFWSe4h5Zv?=
 =?us-ascii?Q?UKn9TmQZ9PtpIBgkT1OKlI8Mmx0qaUjcikQis5GGuh3Cs0H+kyIrOHbN++/p?=
 =?us-ascii?Q?QVMllwrS1mfFza7btAyXCjUGS/nMrJCr+KGMJx6jQtn1DGPVKy3E9ddJ10Tb?=
 =?us-ascii?Q?7aruqeqKi0UNvN6fegYyEM3mlcY0iz+RVsayiTT54rU9ygc5eizHkY5BqYVK?=
 =?us-ascii?Q?U/Q1hHtP4PWvU0owRSccAGpUW1J+WUvjv9UB1smOVwmgq+ytKAxMi/ZSP9F6?=
 =?us-ascii?Q?SuIRrIGw3UM+WAlu9Oaxq0zrcHdtdRT57tqXwcbzCZQXZnHuzkGr2xEpjYc5?=
 =?us-ascii?Q?H+fSPhkiJ1jI0o7oHnsyubIUHL7xfc4H3AMHJZnM5Ue5939EsF5KOtmvd2tX?=
 =?us-ascii?Q?MvUwnIK6xN2dnog6Cky8NmI7wRAdOGeduB7XkMx9UtwQtKooMScJl5ySCxc3?=
 =?us-ascii?Q?tufWNQ0xKDySyFkBkmy3K2tytTO6oggn3SUYWeUQlVPtI+DLI72xcQG/wZpE?=
 =?us-ascii?Q?sWJbPn44JRwoNV8GhSi76+By7io6eGi6GoOPjcm2WPRa0CI59BxcaL7SzC34?=
 =?us-ascii?Q?jSsjv9SkFJ2FQEDA2mUqI9vDgHjeftWL3f9rBfvw5tc6be29ntBbze2zLHBz?=
 =?us-ascii?Q?FHTSvKfoCWooQz+SeJK68X5vMIJGYf7lI3TSJx+VSShaBW4+HQijpvxgsSNQ?=
 =?us-ascii?Q?p5HIxahlOpAr79MQbHNLRfOf0ub/AO/LqridrLNwoCD8VnPHS8wSJkMc8Qxk?=
 =?us-ascii?Q?hT/FnYKVbOEDV+JOo4cEFGo9uQrLbpSRhgcxqo21wsHu3iNzD+3BvTxKyrfD?=
 =?us-ascii?Q?wG/VxGOTBQ6aXf4K7NkRPbbIGM82x6mfmzQQf7XDuHnoAF7nbA8rtVnb4kDx?=
 =?us-ascii?Q?B1AZORi2Ucj2OjBXKTetct/jU5LAGXnF5LpUooTyg2CgZL0bdRkQoVCRYsJD?=
 =?us-ascii?Q?ZSxOTcUNIXi7MMhofe15+X+pVm4NvzyleIQgAXd7vk3m+OduuzccKYJeopYV?=
 =?us-ascii?Q?PM3tKCo+bOjqzjv/FsqwAvJln4ttN9DVzJSMFRroB2V1fSD5Uglx4aMqz2Qq?=
 =?us-ascii?Q?sD8PDnpzr+NWOGEjrTlOozh18bqU8Gg5pN/qJ3kxepRK82lBOt4rg6by16Bd?=
 =?us-ascii?Q?w84Hb8ow8hAE1pjXHcsLxEYxLRVj8bSj8rF/v8Py4ltfBIaFhp/GgKEQQHbE?=
 =?us-ascii?Q?4ETSHNljCyKTk5qE52mYzXx8vNjwF03LQ2bsVEN2sIBjBO/cgMosqz4Kg89e?=
 =?us-ascii?Q?h/Vg3OQwRtbNmYceCLs2apiFFye4bA7WkmYErt0WEOWr2gFg/Q/MqeGV91mx?=
 =?us-ascii?Q?fAAKznQxBpQkqwOMUv/bzOJ27ml448q9YqDxj5cxMNuCLvSS/fRNdzC6Jl9P?=
 =?us-ascii?Q?VczKcIY+qN9+2UTLEhfJUMxw8Zq3LlsZslmXuTpcgvbDF4kXngnnGVdbNnEh?=
 =?us-ascii?Q?DdDX5DuUFmUKJA1gjRSEv9VdscokVF3uxf7TIsp3RNBWT08NusOLDUoupeFt?=
 =?us-ascii?Q?OJukIzQcvvt5LGdFMWL44O93/xBbYh9ZvhWc6MXyMzIHg5Pl6x5yPwYhXkB1?=
 =?us-ascii?Q?u/Pxy8rVKNWIT+vp77uzQmfk0CGJyS9Dtfm9qtTGKpAmhgyVLonSs/iGYeXx?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913ce892-71a2-4fc8-5608-08dc306ad813
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2024 10:17:43.0641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FsgJafBHxZzyZYrR8U69Ge4vYj+LtZim7M4zh6Yh+2jRlBlHuRUrk70kSeIoTVjH/ewk0vVNaFCDBe1XSCCvn7KVHJbNBhxmN5KcUS1obMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_021757_169585_88C774BF 
X-CRM114-Status: GOOD (  11.27  )
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

Rename two setup functions to plda prefix. Prepare to re-use these two
setup function.

For two setup functions names are similar, rename mc_pcie_setup_windows()
to plda_pcie_setup_iomems().

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../pci/controller/plda/pcie-microchip-host.c | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
index a554a56cc0e8..9b367927cd32 100644
--- a/drivers/pci/controller/plda/pcie-microchip-host.c
+++ b/drivers/pci/controller/plda/pcie-microchip-host.c
@@ -838,9 +838,9 @@ static int mc_pcie_init_irq_domains(struct plda_pcie_rp *port)
 	return mc_allocate_msi_domains(port);
 }
 
-static void mc_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
-				 phys_addr_t axi_addr, phys_addr_t pci_addr,
-				 size_t size)
+static void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
+				   phys_addr_t axi_addr, phys_addr_t pci_addr,
+				   size_t size)
 {
 	u32 atr_sz = ilog2(size) - 1;
 	u32 val;
@@ -876,8 +876,8 @@ static void mc_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
 	writel(0, bridge_base_addr + ATR0_PCIE_WIN0_SRC_ADDR);
 }
 
-static int mc_pcie_setup_windows(struct platform_device *pdev,
-				 struct plda_pcie_rp *port)
+static int plda_pcie_setup_iomems(struct platform_device *pdev,
+				  struct plda_pcie_rp *port)
 {
 	void __iomem *bridge_base_addr = port->bridge_addr;
 	struct pci_host_bridge *bridge = platform_get_drvdata(pdev);
@@ -888,9 +888,9 @@ static int mc_pcie_setup_windows(struct platform_device *pdev,
 	resource_list_for_each_entry(entry, &bridge->windows) {
 		if (resource_type(entry->res) == IORESOURCE_MEM) {
 			pci_addr = entry->res->start - entry->offset;
-			mc_pcie_setup_window(bridge_base_addr, index,
-					     entry->res->start, pci_addr,
-					     resource_size(entry->res));
+			plda_pcie_setup_window(bridge_base_addr, index,
+					       entry->res->start, pci_addr,
+					       resource_size(entry->res));
 			index++;
 		}
 	}
@@ -1023,15 +1023,15 @@ static int mc_platform_init(struct pci_config_window *cfg)
 	int ret;
 
 	/* Configure address translation table 0 for PCIe config space */
-	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start,
-			     cfg->res.start,
-			     resource_size(&cfg->res));
+	plda_pcie_setup_window(bridge_base_addr, 0, cfg->res.start,
+			       cfg->res.start,
+			       resource_size(&cfg->res));
 
 	/* Need some fixups in config space */
 	mc_pcie_enable_msi(port, cfg->win);
 
 	/* Configure non-config space outbound ranges */
-	ret = mc_pcie_setup_windows(pdev, &port->plda);
+	ret = plda_pcie_setup_iomems(pdev, &port->plda);
 	if (ret)
 		return ret;
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
