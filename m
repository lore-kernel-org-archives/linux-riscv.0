Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECA3C624A4
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 14:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DmxWkXT4dHOmYnFDYceDVUfnrULsK+k78+hp0NnWtYY=; b=sfeMDrRZpA6eeg
	Zpnigz9KqpEHNh1uxEmoXQl17ylV9mdq3ChOEZ8y1VWfy4HJDVBgGYKG4DhWt/ofV5LD0BmMMCmwz
	aiDJ1ru4hMjUL+Y1WJX8ZGg9/Tw22SuBRh3sCQ00nLDp/hxASSD4gVvfpAWJWsYVofThLAgafOxyz
	iwpcDJRg35FVtwsAqNugPjwnFUpmy21GrtMJzq6Q5fiSVapiHHzysvhzQjobw7QqhLkCjcxQfKOzN
	BDno7bwJ42Kn9WRMxODZnOZbRuu+6V1vD6lw8wQmr0Urpc/KXmWb5YcfgoSTIHg6uXdEuG0RqVvsw
	nRs8MzKtp3Vi/EG1vZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27zd-0000000HSro-3ug3;
	Thu, 03 Sep 2026 14:00:41 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27zb-0000000HSq6-3YF7
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 14:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788444036; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=EeH6bdDAEIQqh3qtw9ytOgfSyurKW+ipErCrXEGxYck=;
	b=I/oFtjVNs5VsfrZ7iqjjQHipCozMLhhZ3oKVgi6b+mTedDPgw0JsU4oIKbIIEj0qEUislYE48jyWJU5Heo/VDTa3OQykHMy7pFPVf/HTTvmIyP0hQPLc8vNd2X6lwMjefJ7KPMLs7fgoKFQVBrmKBUuQPfTmdbHiZRVMM9zGeOI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XAG8g3p_1788444033;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XAG8g3p_1788444033 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Sep 2026 22:00:34 +0800
From: fangyu.yu@linux.alibaba.com
To: sunilvl@oss.qualcomm.com,
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
Subject: [PATCH v2] ACPI: RIMT: Enable PCI ACS for root complexes mapped to an IOMMU
Date: Thu,  3 Sep 2026 22:00:31 +0800
Message-Id: <20260903140031.3684-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_070040_075972_F6B68C67 
X-CRM114-Status: GOOD (  14.03  )
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
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>

---
Changes in v2 (Suggested by Sunil):
    - Check the RIMT node type in riscv_acpi_rimt_init() and invoke
      rimt_enable_acs() only for PCIe root-complex nodes.
---
 drivers/acpi/riscv/rimt.c | 58 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/acpi/riscv/rimt.c b/drivers/acpi/riscv/rimt.c
index e4538fa6c2c8..edbd04a9e03b 100644
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
+	if (acs_enabled)
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
@@ -525,4 +564,23 @@ void __init riscv_acpi_rimt_init(void)
 
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
+		if (rimt_node->type == ACPI_RIMT_NODE_TYPE_PCIE_ROOT_COMPLEX)
+			rimt_enable_acs(rimt_node);
+
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
