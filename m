Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D889AC5DF67
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTlgStGABazFw1TYw7HhWNWDUcYBP9tXjT+io+AD3Ak=; b=u6kFWZ1SfHpDQR
	NTbkbCD8I22dydD0GT5P1UZguT/kOPsjxekt+cVdKy/kEIxTl8UQy4i5ArlrLjCVpM6R4Cz/El22s
	RWI9Pl8tNGA7/P9c6AkxuMOn9omtrbr1jw6NFI4+5sLVcASxMThS61KUQdozeVlgJIYDDl3ONaTDZ
	QI7cKyYKs1vl83pPz5Nx6QAm6CGIsU6OeFs4zTBVctrwh5o4JuzYwLxYiT7oDyWDBYEckAVvm46iL
	Yl2e24gPmlvmtS2Taqb1gyGhd5+rVgGPZ/oQ1/SefyL8XjhjUE1YuiaMI8Rk3Q1JXGxntMB1IZfg3
	2fl4fp+v8mf8IQ1BCR5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXqT-0000000161H-44t6;
	Thu, 13 Aug 2026 15:59:53 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXqQ-000000015z0-3tcD
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 15:59:52 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAAX6+7w6X1qLAt7BQ--.64323S2;
	Thu, 13 Aug 2026 23:59:44 +0800 (CST)
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
Subject: [PATCH v2 3/3] ACPI: RHCT: validate ISA and CMO node payloads
Date: Thu, 13 Aug 2026 23:59:44 +0800
Message-ID: <20260813155944.68729-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260813154600.58861-1-pengpeng@iscas.ac.cn>
References: <20260813154600.58861-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAX6+7w6X1qLAt7BQ--.64323S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1UWr4rJFW5Cw1fJr4rGrg_yoWrtF1UpF
	1a9a4rAa4UJw43Wr10q3y5uay3X34Syr4jqrWfGas8tw4kKr4UJF42kFy7uFyrZF4kWw4x
	Zw4DtFyFkFs5Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
	nIWIevJa73UjIFyTuYvjfU5dgADUUUU
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_085951_345912_7ADB484E 
X-CRM114-Status: GOOD (  13.14  )
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

Hart-info references can select ISA-string and cache-management-operation
nodes.  The consumers read those type-specific payloads without first
proving that they fit, and return ISA bytes as a C string without enforcing
the RHCT requirement that isa_length include a terminating NUL.

Require the CMO payload to be present and the final advertised ISA byte to
be NUL.  Accumulate CMO values locally and publish them only after the
complete table walk succeeds, so a malformed later node cannot leave
partial output.

Fixes: e6b9d8eddb17 ("drivers/acpi: RISC-V: Add RHCT related code")
Fixes: 9ca87564190c ("RISC-V: ACPI: RHCT: Add function to get CBO block sizes")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/acpi/riscv/rhct.c | 57 +++++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
index b1b850d58efd..03f84a433072 100644
--- a/drivers/acpi/riscv/rhct.c
+++ b/drivers/acpi/riscv/rhct.c
@@ -109,6 +109,26 @@ static bool rhct_hart_info_valid(struct acpi_rhct_node_header *node)
 	return true;
 }
 
+static bool rhct_isa_string_valid(struct acpi_rhct_node_header *node)
+{
+	struct acpi_rhct_isa_string *isa_node;
+	size_t remaining;
+
+	if (!rhct_node_has_data(node, sizeof(*isa_node)))
+		return false;
+
+	isa_node = ACPI_ADD_PTR(struct acpi_rhct_isa_string, node,
+				sizeof(*node));
+	remaining = node->length - sizeof(*node) - sizeof(*isa_node);
+	if (!isa_node->isa_length || isa_node->isa_length > remaining ||
+	    isa_node->isa[isa_node->isa_length - 1] != '\0') {
+		pr_err(FW_BUG "Invalid RHCT ISA string\n");
+		return false;
+	}
+
+	return true;
+}
+
 static struct acpi_table_rhct *acpi_get_rhct(void)
 {
 	static struct acpi_table_header *rhct;
@@ -137,7 +157,6 @@ static struct acpi_table_rhct *acpi_get_rhct(void)
 int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const char **isa)
 {
 	struct acpi_rhct_node_header *node, *ref_node, *end;
-	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
 	struct acpi_rhct_hart_info *hart_info;
 	struct acpi_rhct_isa_string *isa_node;
 	struct acpi_table_rhct *rhct;
@@ -190,12 +209,16 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
 					    ref_node->type == ACPI_RHCT_NODE_TYPE_HART_INFO)
 						return -EINVAL;
 
-					if (ref_node->type == ACPI_RHCT_NODE_TYPE_ISA_STRING) {
-						isa_node = ACPI_ADD_PTR(struct acpi_rhct_isa_string,
-									ref_node, size_hdr);
-						*isa = isa_node->isa;
-						return 0;
-					}
+					if (ref_node->type != ACPI_RHCT_NODE_TYPE_ISA_STRING)
+						continue;
+					if (!rhct_isa_string_valid(ref_node))
+						return -EINVAL;
+
+					isa_node = ACPI_ADD_PTR(struct acpi_rhct_isa_string,
+								ref_node,
+								sizeof(*ref_node));
+					*isa = isa_node->isa;
+					return 0;
 				}
 			}
 		}
@@ -212,7 +235,6 @@ static bool acpi_parse_hart_info_cmo_node(struct acpi_table_rhct *rhct,
 					  u32 *cbom_size, u32 *cboz_size,
 					  u32 *cbop_size)
 {
-	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
 	struct acpi_rhct_node_header *ref_node;
 	struct acpi_rhct_hart_info *hart_info;
 	struct acpi_rhct_cmo_node *cmo_node;
@@ -232,8 +254,11 @@ static bool acpi_parse_hart_info_cmo_node(struct acpi_table_rhct *rhct,
 			return false;
 
 		if (ref_node->type == ACPI_RHCT_NODE_TYPE_CMO) {
+			if (!rhct_node_has_data(ref_node, sizeof(*cmo_node)))
+				return false;
+
 			cmo_node = ACPI_ADD_PTR(struct acpi_rhct_cmo_node,
-						ref_node, size_hdr);
+						ref_node, sizeof(*ref_node));
 			if (cbom_size && cmo_node->cbom_size <= 30) {
 				if (!*cbom_size)
 					*cbom_size = BIT(cmo_node->cbom_size);
@@ -270,6 +295,7 @@ void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
 {
 	struct acpi_rhct_node_header *node, *end;
 	struct acpi_table_rhct *rhct;
+	u32 cbom = 0, cboz = 0, cbop = 0;
 	unsigned int i;
 
 	if (acpi_disabled)
@@ -305,11 +331,20 @@ void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
 			return;
 
 		if (node->type == ACPI_RHCT_NODE_TYPE_HART_INFO &&
-		    !acpi_parse_hart_info_cmo_node(rhct, node, cbom_size,
-						   cboz_size, cbop_size))
+		    !acpi_parse_hart_info_cmo_node(rhct, node,
+						   cbom_size ? &cbom : NULL,
+						   cboz_size ? &cboz : NULL,
+						   cbop_size ? &cbop : NULL))
 			return;
 
 		node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node,
 				    node->length);
 	}
+
+	if (cbom_size)
+		*cbom_size = cbom;
+	if (cboz_size)
+		*cboz_size = cboz;
+	if (cbop_size)
+		*cbop_size = cbop;
 }
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
