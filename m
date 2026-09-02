Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A709C624D3
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9g6LuKGCIfBBhXn+eQUUNJwNlHaoJeImxUuOR8rz3g0=; b=Rf23DVzN7Z8IfP
	Fy+7zwXySfELf8R+FwqRmCjm8Wbbex3pBp51i1axohyVvokDzd9Qzn6/i1RtwSeVJaG2AO252Re8Z
	iUijIrBix1doEj2W+wDOYx0bmJNrfi67jLdAZGkBZXs+Rwvq9Ex9AdJ4pT3qKdhHRTpY77EyT0g9z
	pT3hdMj8/K7ACnM3F4ISIqHs+Hto6EAjxgLflScoetlB7mStlwprZaJ+eWZ8gM3Vydq3o1cRTPGNc
	/XOCGyJBeZha58919O+w4Uzyz18tpNOEJae6fWOP/V6/1RxAuNymlg8qKpT5PLVL+fhDYhWvE/J7Z
	/pVkdHEKlZmeMGYe3dkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lXK-0000000EscR-2MgQ;
	Wed, 02 Sep 2026 14:01:58 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lXH-0000000Esay-0p7v
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 14:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788357709; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ieuSBZhhWdeU16d5JMGFYFciQmx4AeBNBulSOZwl3X4=;
	b=E9tqt/fLcycL4Lp4LBMlzIV2CBt9DjfyT9ifpXrRw7etyH82wb1r1SXhl7+5aybIt69JIfqZFC4SMMIdzFZ9FB6Hkcp8Njss+MxLzLkkjR5XHG/cOuARPuK1kecvyUlk3RCeXL0mPC54cOAKlXF+cikWi1Q/KEM74BzA/yDwaNc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XACojEu_1788357707;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XACojEu_1788357707 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Sep 2026 22:01:48 +0800
From: fangyu.yu@linux.alibaba.com
To: sunilvl@oss.qualcomm.com,
	sunilvl@ventanamicro.com,
	rafael@kernel.org,
	lenb@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] ACPI: RIMT: Enable PCI ACS for root complexes mapped to an IOMMU
Date: Wed,  2 Sep 2026 22:01:45 +0800
Message-Id: <20260902140145.42094-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_070156_014327_138E591C 
X-CRM114-Status: GOOD (  13.74  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Mirror the ACPI IORT solution used on arm64 (see iort_enable_acs())
by scanning the RIMT table for PCIe root complex nodes during
riscv_acpi_rimt_init(), which runs before ACPI PCI enumeration. If a
root complex node's ID mapping points at an IOMMU node, call
pci_request_acs() immediately, so pci_acs_enable is already set by
the time any PCI device is scanned and pci_enable_acs() runs.

Only one call to pci_request_acs() is needed regardless of how many
root complexes are found, so track that with a static acs_enabled
flag, same as iort_enable_acs() does.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/acpi/riscv/rimt.c | 56 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/acpi/riscv/rimt.c b/drivers/acpi/riscv/rimt.c
index e4538fa6c2c8..f22e28c8211e 100644
--- a/drivers/acpi/riscv/rimt.c
+++ b/drivers/acpi/riscv/rimt.c
@@ -179,6 +179,42 @@ static struct acpi_rimt_node *rimt_scan_node(enum acpi_rimt_node_type type,
 	return NULL;
 }
 
+#ifdef CONFIG_PCI
+static void __init rimt_enable_acs(struct acpi_rimt_node *rimt_node)
+{
+	static bool acs_enabled __initdata;
+	struct acpi_rimt_pcie_rc *pci_rc;
+	struct acpi_rimt_id_mapping *map;
+	struct acpi_rimt_node *parent;
+	int i;
+
+	if (acs_enabled || rimt_node->type != ACPI_RIMT_NODE_TYPE_PCIE_ROOT_COMPLEX)
+		return;
+
+	pci_rc = (struct acpi_rimt_pcie_rc *)rimt_node->node_data;
+	if (!pci_rc->id_mapping_offset || !pci_rc->num_id_mappings)
+		return;
+
+	map = ACPI_ADD_PTR(struct acpi_rimt_id_mapping, rimt_node,
+			   pci_rc->id_mapping_offset);
+
+	for (i = 0; i < pci_rc->num_id_mappings; i++, map++) {
+		if (!map->dest_offset)
+			continue;
+
+		parent = ACPI_ADD_PTR(struct acpi_rimt_node, rimt_table,
+				      map->dest_offset);
+		if (parent->type == ACPI_RIMT_NODE_TYPE_IOMMU) {
+			pci_request_acs();
+			acs_enabled = true;
+			return;
+		}
+	}
+}
+#else
+static inline void rimt_enable_acs(struct acpi_rimt_node *rimt_node) { }
+#endif
+
 /*
  * RISC-V supports IOMMU as a PCI device or a platform device.
  * When it is a platform device, there should be a namespace device as
@@ -509,7 +545,10 @@ int rimt_iommu_configure_id(struct device *dev, const u32 *id_in)
 
 void __init riscv_acpi_rimt_init(void)
 {
+	struct acpi_rimt_node *rimt_node, *rimt_end;
+	struct acpi_table_rimt *rimt;
 	acpi_status status;
+	int i;
 
 	/* rimt_table will be used at runtime after the rimt init,
 	 * so we don't need to call acpi_put_table() to release
@@ -525,4 +564,21 @@ void __init riscv_acpi_rimt_init(void)
 
 		return;
 	}
+
+	rimt = (struct acpi_table_rimt *)rimt_table;
+	rimt_node = ACPI_ADD_PTR(struct acpi_rimt_node, rimt,
+				 rimt->node_offset);
+	rimt_end = ACPI_ADD_PTR(struct acpi_rimt_node, rimt_table,
+				rimt_table->length);
+
+	for (i = 0; i < rimt->num_nodes; i++) {
+		if (rimt_node >= rimt_end) {
+			pr_err("RIMT node pointer overflows, bad table\n");
+			return;
+		}
+
+		rimt_enable_acs(rimt_node);
+		rimt_node = ACPI_ADD_PTR(struct acpi_rimt_node, rimt_node,
+					 rimt_node->length);
+	}
 }
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
