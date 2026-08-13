Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006CEC5CFCF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 15:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqd/QfszJOhuJ71gNf7R1JYQ3t/4TDn2NKBi1ZQxB2s=; b=3LWRgzhBw/nEjV
	TiHxlUxhHFKD5lKCJ9HIjs5M9dRVJDhJ92hJSc4vJWY3F0y9DETYz30AZuvpsfJ82UawLzn91WpWA
	QRbWb/5+bLd9HEbl3NdhfFrqR9jAB7FPa2VG02BYLutypXpyBjU/riJLfvZmEML9npqdaVL1HzL9C
	A21qd5TYJQmi52tKm3PlHsTyH+sxOIDLMp2Ub/LJsqhA7RIyw6Yls3BYjJHOt1NMBihibictmSNTT
	p/k42HfxGSNjWG6jh5txnITu/YACOXERTHJWSRdLf10azXWb/TJFG8Uxiqb2iatc6y5yx87HEgH8p
	R7AC6jr/19J+dpBePl5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXbl-000000014CB-3I8S;
	Thu, 13 Aug 2026 15:44:41 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXbj-000000014Aw-2219
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 15:44:41 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAAX6+5h5n1qOm16BQ--.64263S2;
	Thu, 13 Aug 2026 23:44:33 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2 3/3] ACPI: RIMT: validate mapping references and ID arithmetic
Date: Thu, 13 Aug 2026 23:44:32 +0800
Message-ID: <20260813154432.57786-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260813153851.47947-1-pengpeng@iscas.ac.cn>
References: <20260813153851.47947-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAX6+5h5n1qOm16BQ--.64263S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar4DKFW5ZF1kWFyUtw1UZFb_yoW7Zrykp3
	y2grWYqrZ7XF4xWa1Iya1rZa4aq3W0qrW2kF40k3WDKw1q9ryxKF48ZFy3WF15JFWfGw42
	qrs8tas5ur4jyrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8Jw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbo5l5UUUUU==
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_084439_899963_CD11C13D 
X-CRM114-Status: GOOD (  19.20  )
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

RIMT ID mappings contain a destination node offset, a source-ID count and
a translated destination range.  The parser accepts offsets into the
middle of nodes, can follow cyclic mappings forever, and uses unchecked
u32 range arithmetic.

Resolve references only at validated node boundaries and limit a walk to
the table's node count.  Treat num_ids as the number of IDs, use
subtraction for source-range membership, and reject destination-ID
addition overflow.  Preserve the existing fallback of returning the input
ID unchanged.

Fixes: 8f7729552582 ("ACPI: RISC-V: Add support for RIMT")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/acpi/riscv/rimt.c | 81 ++++++++++++++++++++++++++++++---------
 1 file changed, 63 insertions(+), 18 deletions(-)

diff --git a/drivers/acpi/riscv/rimt.c b/drivers/acpi/riscv/rimt.c
index e8075f79b552..6e4b02e8ddd7 100644
--- a/drivers/acpi/riscv/rimt.c
+++ b/drivers/acpi/riscv/rimt.c
@@ -27,7 +27,6 @@ struct rimt_fwnode {
 static LIST_HEAD(rimt_fwnode_list);
 static DEFINE_SPINLOCK(rimt_fwnode_lock);
 
-#define RIMT_TYPE_MASK(type)	(1 << (type))
 #define RIMT_IOMMU_TYPE		BIT(0)
 
 /* Root pointer to the mapped RIMT table */
@@ -165,6 +164,39 @@ static bool rimt_node_data_valid(struct acpi_rimt_node *node)
 	}
 }
 
+static struct acpi_rimt_node *rimt_node_from_offset(u32 offset)
+{
+	struct acpi_rimt_node *node, *end;
+	struct acpi_table_rimt *rimt;
+	unsigned int i;
+
+	if (!rimt_table_valid())
+		return NULL;
+
+	rimt = (struct acpi_table_rimt *)rimt_table;
+	if (offset < rimt->node_offset || offset >= rimt->header.length)
+		return NULL;
+
+	node = ACPI_ADD_PTR(struct acpi_rimt_node, rimt, rimt->node_offset);
+	end = ACPI_ADD_PTR(struct acpi_rimt_node, rimt, rimt->header.length);
+
+	for (i = 0; i < rimt->num_nodes; i++) {
+		if (!rimt_node_valid(node, end))
+			return NULL;
+		if ((u8 *)node - (u8 *)rimt == offset)
+			return node;
+
+		node = ACPI_ADD_PTR(struct acpi_rimt_node, node, node->length);
+	}
+
+	return NULL;
+}
+
+static bool rimt_type_in_mask(u8 type, u8 type_mask)
+{
+	return type < 8 && BIT(type) & type_mask;
+}
+
 /**
  * rimt_set_fwnode() - Create rimt_fwnode and use it to register
  *		       iommu data in the rimt_fwnode_list
@@ -422,13 +454,19 @@ struct rimt_pci_alias_info {
 	const struct iommu_ops *ops;
 };
 
-static int rimt_id_map(struct acpi_rimt_id_mapping *map, u8 type, u32 rid_in, u32 *rid_out)
+static int rimt_id_map(struct acpi_rimt_id_mapping *map, u32 rid_in,
+		       u32 *rid_out)
 {
+	u32 id_offset;
+
 	if (rid_in < map->source_id_base ||
-	    (rid_in > map->source_id_base + map->num_ids))
+	    rid_in - map->source_id_base >= map->num_ids)
 		return -ENXIO;
 
-	*rid_out = map->dest_id_base + (rid_in - map->source_id_base);
+	id_offset = rid_in - map->source_id_base;
+	if (check_add_overflow(map->dest_id_base, id_offset, rid_out))
+		return -ERANGE;
+
 	return 0;
 }
 
@@ -469,7 +507,9 @@ static struct acpi_rimt_node *rimt_node_get_id(struct acpi_rimt_node *node,
 		return NULL;
 	}
 
-	parent = ACPI_ADD_PTR(struct acpi_rimt_node, rimt_table, map->dest_offset);
+	parent = rimt_node_from_offset(map->dest_offset);
+	if (!parent || !rimt_node_data_valid(parent))
+		return NULL;
 
 	if (node->type == ACPI_RIMT_NODE_TYPE_PLAT_DEVICE ||
 	    node->type == ACPI_RIMT_NODE_TYPE_PCIE_ROOT_COMPLEX) {
@@ -488,6 +528,13 @@ static struct acpi_rimt_node *rimt_node_map_id(struct acpi_rimt_node *node,
 	u32 id_mapping_offset, num_id_mapping;
 	struct acpi_rimt_pcie_rc *pci_node;
 	u32 id = id_in;
+	unsigned int depth = 0;
+	u32 num_nodes;
+
+	if (!rimt_table_valid())
+		goto fail_map;
+
+	num_nodes = ((struct acpi_table_rimt *)rimt_table)->num_nodes;
 
 	/* Parse the ID mapping tree to find specified node type */
 	while (node) {
@@ -495,10 +542,10 @@ static struct acpi_rimt_node *rimt_node_map_id(struct acpi_rimt_node *node,
 		int i, rc = 0;
 		u32 map_id = id;
 
-		if (!rimt_node_data_valid(node))
+		if (depth++ >= num_nodes || !rimt_node_data_valid(node))
 			goto fail_map;
 
-		if (RIMT_TYPE_MASK(node->type) & type_mask) {
+		if (rimt_type_in_mask(node->type, type_mask)) {
 			if (id_out)
 				*id_out = id;
 			return node;
@@ -522,16 +569,9 @@ static struct acpi_rimt_node *rimt_node_map_id(struct acpi_rimt_node *node,
 		map = ACPI_ADD_PTR(struct acpi_rimt_id_mapping, node,
 				   id_mapping_offset);
 
-		/* Firmware bug! */
-		if (!map->dest_offset) {
-			pr_err(FW_BUG "[node %p type %d] ID map has NULL parent reference\n",
-			       node, node->type);
-			goto fail_map;
-		}
-
 		/* Do the ID translation */
 		for (i = 0; i < num_id_mapping; i++, map++) {
-			rc = rimt_id_map(map, node->type, map_id, &id);
+			rc = rimt_id_map(map, map_id, &id);
 			if (!rc)
 				break;
 		}
@@ -539,8 +579,13 @@ static struct acpi_rimt_node *rimt_node_map_id(struct acpi_rimt_node *node,
 		if (i == num_id_mapping)
 			goto fail_map;
 
-		node = ACPI_ADD_PTR(struct acpi_rimt_node, rimt_table,
-				    rc ? 0 : map->dest_offset);
+		if (!map->dest_offset) {
+			pr_err(FW_BUG "[node %p type %d] ID map has NULL parent reference\n",
+			       node, node->type);
+			goto fail_map;
+		}
+
+		node = rimt_node_from_offset(map->dest_offset);
 	}
 
 fail_map:
@@ -561,7 +606,7 @@ static struct acpi_rimt_node *rimt_node_map_platform_id(struct acpi_rimt_node *n
 	if (!parent)
 		return NULL;
 
-	if (!(RIMT_TYPE_MASK(parent->type) & type_mask))
+	if (!rimt_type_in_mask(parent->type, type_mask))
 		parent = rimt_node_map_id(parent, id, id_out, type_mask);
 	else
 		if (id_out)
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
