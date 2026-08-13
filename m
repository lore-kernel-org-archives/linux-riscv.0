Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54476C5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IIEZlz4cgmbKc69tBy0/3y32hKi8118gPtcs6GQZDGk=; b=lF03+eGal2NA+y
	RyVGBYtix24ff22OC/7GcDZ7nLiftxRvwxxe21OTvqT/vfD94XrhixIGR3axnIcIr4RxPN6VmPXo5
	vOSVzsDoKdzkDS6EhJkZE09Zd4qOGk38hzFa+BR5Mn1EBSr6AvZOA3EILvFM66qtdFLP1ZF0vy6DS
	0znd4LPusd7sfBZHyIMTn7xKM4bukBmXGhZ8WUi7XiRaOk/KLg8y4ZSYpu3FrRNKVanfQH6xVaJhs
	QCPpxYPxOzQthGExMnPFDlpH5L57uKRPsDnAth5hRkkYk8P8bKIBRSChrGbt4aNSukam5LP6of6R7
	bCcAuFptHeAT0DkQmfZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXoE-000000015c7-1SWi;
	Thu, 13 Aug 2026 15:57:34 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXoB-000000015bN-1346
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 15:57:32 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAC3iu5l6X1qMvN6BQ--.13638S2;
	Thu, 13 Aug 2026 23:57:25 +0800 (CST)
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
Subject: [PATCH v2 2/3] ACPI: RHCT: validate hart-info offsets and node references
Date: Thu, 13 Aug 2026 23:57:25 +0800
Message-ID: <20260813155725.67361-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260813154600.58861-1-pengpeng@iscas.ac.cn>
References: <20260813154600.58861-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAC3iu5l6X1qMvN6BQ--.13638S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKw4DZw13CFyrJr1fArW3trb_yoW3Gry3pF
	4S9ry5AFs8Jw13Wr10qw4ruay3J34rZr4UXFZ3Ga4jyr1vkF1UKF4jk3429F1rtF1vgw4x
	Zr4DtFyDGF48ArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbo5l5UUUUU==
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_085731_665291_07FB715E 
X-CRM114-Status: GOOD (  14.95  )
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

Each RHCT hart-info node contains a count followed by offsets to other RHCT
nodes.  Consumers trust both the offset-array extent and every referenced
address.

Require the complete offset array to fit in its hart-info node.  Resolve
each reference only when it exactly matches a validated node boundary, and
reject references to another hart-info node as required by the RHCT
definition.

Fixes: e6b9d8eddb17 ("drivers/acpi: RISC-V: Add RHCT related code")
Fixes: 9ca87564190c ("RISC-V: ACPI: RHCT: Add function to get CBO block sizes")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/acpi/riscv/rhct.c | 124 +++++++++++++++++++++++++++++++-------
 1 file changed, 101 insertions(+), 23 deletions(-)

diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
index 01d6e39c0c5a..b1b850d58efd 100644
--- a/drivers/acpi/riscv/rhct.c
+++ b/drivers/acpi/riscv/rhct.c
@@ -9,6 +9,7 @@
 
 #include <linux/acpi.h>
 #include <linux/bits.h>
+#include <linux/overflow.h>
 
 static bool rhct_table_valid(struct acpi_table_rhct *rhct)
 {
@@ -48,6 +49,66 @@ static bool rhct_node_valid(struct acpi_rhct_node_header *node,
 	return true;
 }
 
+static bool rhct_node_has_data(struct acpi_rhct_node_header *node,
+			       size_t data_size)
+{
+	if (node->length < sizeof(*node) ||
+	    data_size > node->length - sizeof(*node)) {
+		pr_err(FW_BUG "Truncated RHCT node type %u\n", node->type);
+		return false;
+	}
+
+	return true;
+}
+
+static struct acpi_rhct_node_header *
+rhct_node_from_offset(struct acpi_table_rhct *rhct, u32 offset)
+{
+	struct acpi_rhct_node_header *node, *end;
+	unsigned int i;
+
+	if (!rhct_table_valid(rhct) || offset < rhct->node_offset ||
+	    offset >= rhct->header.length)
+		return NULL;
+
+	node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct,
+			    rhct->node_offset);
+	end = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct,
+			   rhct->header.length);
+
+	for (i = 0; i < rhct->node_count; i++) {
+		if (!rhct_node_valid(node, end))
+			return NULL;
+		if ((u8 *)node - (u8 *)rhct == offset)
+			return node;
+
+		node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node,
+				    node->length);
+	}
+
+	return NULL;
+}
+
+static bool rhct_hart_info_valid(struct acpi_rhct_node_header *node)
+{
+	struct acpi_rhct_hart_info *hart_info;
+	size_t offsets_size;
+
+	if (!rhct_node_has_data(node, sizeof(*hart_info)))
+		return false;
+
+	hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node,
+				 sizeof(*node));
+	if (check_mul_overflow(hart_info->num_offsets, sizeof(u32),
+			       &offsets_size) ||
+	    offsets_size > node->length - sizeof(*node) - sizeof(*hart_info)) {
+		pr_err(FW_BUG "Invalid RHCT hart-info offset array\n");
+		return false;
+	}
+
+	return true;
+}
+
 static struct acpi_table_rhct *acpi_get_rhct(void)
 {
 	static struct acpi_table_header *rhct;
@@ -77,13 +138,12 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
 {
 	struct acpi_rhct_node_header *node, *ref_node, *end;
 	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
-	u32 size_hartinfo = sizeof(struct acpi_rhct_hart_info);
 	struct acpi_rhct_hart_info *hart_info;
 	struct acpi_rhct_isa_string *isa_node;
 	struct acpi_table_rhct *rhct;
 	u32 *hart_info_node_offset;
-	u32 acpi_cpu_id;
-	unsigned int i;
+	u32 acpi_cpu_id, ref_offset;
+	unsigned int i, j;
 	int ret;
 
 	BUG_ON(acpi_disabled);
@@ -115,12 +175,21 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
 			return -EINVAL;
 
 		if (node->type == ACPI_RHCT_NODE_TYPE_HART_INFO) {
-			hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node, size_hdr);
-			hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info, size_hartinfo);
+			if (!rhct_hart_info_valid(node))
+				return -EINVAL;
+
+			hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node,
+						 sizeof(*node));
+			hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info,
+							     sizeof(*hart_info));
 			if (acpi_cpu_id == hart_info->uid) {
-				for (int j = 0; j < hart_info->num_offsets; j++) {
-					ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
-								rhct, hart_info_node_offset[j]);
+				for (j = 0; j < hart_info->num_offsets; j++) {
+					ref_offset = hart_info_node_offset[j];
+					ref_node = rhct_node_from_offset(rhct, ref_offset);
+					if (!ref_node ||
+					    ref_node->type == ACPI_RHCT_NODE_TYPE_HART_INFO)
+						return -EINVAL;
+
 					if (ref_node->type == ACPI_RHCT_NODE_TYPE_ISA_STRING) {
 						isa_node = ACPI_ADD_PTR(struct acpi_rhct_isa_string,
 									ref_node, size_hdr);
@@ -138,20 +207,30 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
 	return -1;
 }
 
-static void acpi_parse_hart_info_cmo_node(struct acpi_table_rhct *rhct,
-					  struct acpi_rhct_hart_info *hart_info,
-					  u32 *cbom_size, u32 *cboz_size, u32 *cbop_size)
+static bool acpi_parse_hart_info_cmo_node(struct acpi_table_rhct *rhct,
+					  struct acpi_rhct_node_header *node,
+					  u32 *cbom_size, u32 *cboz_size,
+					  u32 *cbop_size)
 {
-	u32 size_hartinfo = sizeof(struct acpi_rhct_hart_info);
 	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
 	struct acpi_rhct_node_header *ref_node;
+	struct acpi_rhct_hart_info *hart_info;
 	struct acpi_rhct_cmo_node *cmo_node;
 	u32 *hart_info_node_offset;
+	unsigned int i;
+
+	if (!rhct_hart_info_valid(node))
+		return false;
+
+	hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node,
+				 sizeof(*node));
+	hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info,
+					     sizeof(*hart_info));
+	for (i = 0; i < hart_info->num_offsets; i++) {
+		ref_node = rhct_node_from_offset(rhct, hart_info_node_offset[i]);
+		if (!ref_node || ref_node->type == ACPI_RHCT_NODE_TYPE_HART_INFO)
+			return false;
 
-	hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info, size_hartinfo);
-	for (int i = 0; i < hart_info->num_offsets; i++) {
-		ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
-					rhct, hart_info_node_offset[i]);
 		if (ref_node->type == ACPI_RHCT_NODE_TYPE_CMO) {
 			cmo_node = ACPI_ADD_PTR(struct acpi_rhct_cmo_node,
 						ref_node, size_hdr);
@@ -177,6 +256,8 @@ static void acpi_parse_hart_info_cmo_node(struct acpi_table_rhct *rhct,
 			}
 		}
 	}
+
+	return true;
 }
 
 /*
@@ -187,9 +268,7 @@ static void acpi_parse_hart_info_cmo_node(struct acpi_table_rhct *rhct,
 void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
 			     u32 *cboz_size, u32 *cbop_size)
 {
-	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
 	struct acpi_rhct_node_header *node, *end;
-	struct acpi_rhct_hart_info *hart_info;
 	struct acpi_table_rhct *rhct;
 	unsigned int i;
 
@@ -225,11 +304,10 @@ void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
 		if (!rhct_node_valid(node, end))
 			return;
 
-		if (node->type == ACPI_RHCT_NODE_TYPE_HART_INFO) {
-			hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node, size_hdr);
-			acpi_parse_hart_info_cmo_node(rhct, hart_info, cbom_size,
-						      cboz_size, cbop_size);
-		}
+		if (node->type == ACPI_RHCT_NODE_TYPE_HART_INFO &&
+		    !acpi_parse_hart_info_cmo_node(rhct, node, cbom_size,
+						   cboz_size, cbop_size))
+			return;
 
 		node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node,
 				    node->length);
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
