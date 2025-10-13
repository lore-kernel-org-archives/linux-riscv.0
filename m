Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981DCCCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 18:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C8PprMt2WsJeMeNorBQU3kfhp8cveoRzcTwFTC0yoko=; b=DRW/0Bw9+j8VK3
	jcgn1XVDly6Pjqcvk4H8/yN/3Rlp7tK3/sDotZ435eVegVUMZ+pwFJJYdyhNXtrXyavalg+axZkkO
	baRj7Wztmn1AkYs92+jGPc3EZeCR5Y7jHeO0yQEocO6xNxS2Qx1IfsPwTDa6xs3sTNTh9YGtE8dlh
	PgPKEkBsenDzsohgchEmATI5u9m/bIHr+3AIwRER96FOv9TXySY/4qiPqUvYcGISQV5vZXaSK5SI3
	YR0uDpP1kWdhDuGIckdahRMDUSvoSYHNyigBHhwU7+mPwyLdQYKcbkbPA79yvf82QyAjRpDiVCNDW
	exZDhFX5Kiq+z7NHdWsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8N9N-0000000E8ag-3rb5;
	Mon, 13 Oct 2025 18:20:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8N9L-0000000E8a2-139t
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 18:20:00 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-27eed7bdfeeso49681215ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 11:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760379598; x=1760984398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qgS28ji+B97qItp4AzHMdPygisOKxR0wELKF1U991to=;
        b=Mz0av5qrPBf5ecI5QDLf5BOT36Syr7/kVIoYtP/uJ9elC/ls0TXogtVCp6rODhkDSF
         7mzF8Gf/2CIETll2iv640QE9/UsGZWX72/t+ogO+YkJF9DHOmFx8jzU5DCTozDlr4kHD
         pHf+ZM2Aon33fmedmE4EblKEdXXj39Zj/IKI1NnT1WZpuSZCsfpAb5BFo8JtB41LlDdz
         3I9KQtoZgfmpbj30sWL3vtpswMpEqPOYpAPo36WjLaQnB8xHK4QbUFlVvbLmTnywpkPG
         /bM4xZZDwUaTF/NIwtZ8CfurVKrDVI6lAAZ8rzKGTywtDJaJVR7tjt6tdkMc2MLacDFP
         Pq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760379598; x=1760984398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgS28ji+B97qItp4AzHMdPygisOKxR0wELKF1U991to=;
        b=xBkUVEZ/V4Q3D/wBpYG3JuJdy02hw7JYaQxKu+XkM40GtnRo72VN/aGyBr8K55KIRf
         dWkrNaiM4qKy02SP7E0B1onpPqLD1iRMaddUsLRx2LgORaJNkqjyQQyxxWiVEf/4Wmht
         1vW3wcOUHKyfL7z/60Y3IGo+dFreDBjIRDNUvDg/gsUWuu/k7dAMRkxxcTnFgo2D0nui
         3z3EIEkom/e5OK8XNOJob61uqLhHWo3xxlIRC+yPXnojp8/NtKLsAx65cpn2fdyb+KMB
         5cVrs/EnVKrChvvjAiNeSnz42/L7qk7OoiECJHVp3RYqmJKvEuDUeUxa4h4mU7CPmqkE
         MovQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqT1UAWZyWQJO2k9M3jtan5e+l+/QJ551to5Oe1qA5Y8XRVpCADU6O62tua8ij8I6WzRlfSMGCpe65gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKcuRuRo+USJVXwHI4L4j0uUN3xutBa7jD3tbyO1uyBIKBSf47
	cpUrRdcbIYPaRhKQZN579H1ck6rla9o4/ZT8i3Z75nD94vBqhyu0cyZOr/lqiQUVDDU=
X-Gm-Gg: ASbGncsWH/tXmEPoHCionOAgMbT8qtdK/fzQgrmysSlajqCMG/cJz5Qo4/X5rdEu1wp
	68bHzA9U9jMF5s+9bSk06Z293rR3MnDxF7VnwS4d8wayr5BLeO+nxScHBvykzv8wEP/BfTH/zBG
	KyeEhd35WheIEJQvDpI+YRYAWbYhC1uXw1yBNgtMhtXxLCSYn5V5fakRBKUSo7IfApMWchRpGs5
	cZHRl7yMaXp8FYoIa3KyRGHwiQmoGJOjwilWqv6aZKeXzZFVjFdiCpqsXswarZXNLw/mAgSypEU
	Nud+6U+5kweB26L+sqLAS1JUU/uQduag2Bqd+J/ZpecwILHyReVa7V73o1ie1kKaXFQC/dIuo6F
	5H9NQImxULgfQrhFSMJxacm6bUVHYBX2FR6SvzozonF7xyaUbqdGfMTaOFwH+IdCLVHc=
X-Google-Smtp-Source: AGHT+IFpFqK+ccAxZeSzlfsUYTQajx+NLQOJnyFNLwylalWZUDxsky2kTMEhpS6+sgdWpJGowGzqpQ==
X-Received: by 2002:a17:902:c410:b0:249:71f5:4e5a with SMTP id d9443c01a7336-29027f3e32emr309779485ad.26.1760379598009;
        Mon, 13 Oct 2025 11:19:58 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36738sm140048525ad.87.2025.10.13.11.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 11:19:57 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ACPI: RIMT: Fix unused function warnings when CONFIG_IOMMU_API is disabled
Date: Mon, 13 Oct 2025 23:49:47 +0530
Message-ID: <20251013181947.261759-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_111959_314003_657921C5 
X-CRM114-Status: GOOD (  17.34  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, kernel test robot <lkp@intel.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Joerg Roedel <joerg.roedel@amd.com>, Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When CONFIG_IOMMU_API is disabled, some functions defined outside its
conditional scope become unused, triggering compiler warnings reported
by the kernel test robot.

Move these function definitions inside the #ifdef CONFIG_IOMMU_API block
to prevent unused function warnings when the configuration is disabled.

Fixes: 8f7729552582 ("ACPI: RISC-V: Add support for RIMT")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509280031.8Sjkr4bh-lkp@intel.com/
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/rimt.c | 122 +++++++++++++++++++-------------------
 1 file changed, 61 insertions(+), 61 deletions(-)

diff --git a/drivers/acpi/riscv/rimt.c b/drivers/acpi/riscv/rimt.c
index 683fcfe35c31..7f423405e5ef 100644
--- a/drivers/acpi/riscv/rimt.c
+++ b/drivers/acpi/riscv/rimt.c
@@ -61,30 +61,6 @@ static int rimt_set_fwnode(struct acpi_rimt_node *rimt_node,
 	return 0;
 }
 
-/**
- * rimt_get_fwnode() - Retrieve fwnode associated with an RIMT node
- *
- * @node: RIMT table node to be looked-up
- *
- * Returns: fwnode_handle pointer on success, NULL on failure
- */
-static struct fwnode_handle *rimt_get_fwnode(struct acpi_rimt_node *node)
-{
-	struct fwnode_handle *fwnode = NULL;
-	struct rimt_fwnode *curr;
-
-	spin_lock(&rimt_fwnode_lock);
-	list_for_each_entry(curr, &rimt_fwnode_list, list) {
-		if (curr->rimt_node == node) {
-			fwnode = curr->fwnode;
-			break;
-		}
-	}
-	spin_unlock(&rimt_fwnode_lock);
-
-	return fwnode;
-}
-
 static acpi_status rimt_match_node_callback(struct acpi_rimt_node *node,
 					    void *context)
 {
@@ -202,6 +178,67 @@ static struct acpi_rimt_node *rimt_scan_node(enum acpi_rimt_node_type type,
 	return NULL;
 }
 
+/*
+ * RISC-V supports IOMMU as a PCI device or a platform device.
+ * When it is a platform device, there should be a namespace device as
+ * well along with RIMT. To create the link between RIMT information and
+ * the platform device, the IOMMU driver should register itself with the
+ * RIMT module. This is true for PCI based IOMMU as well.
+ */
+int rimt_iommu_register(struct device *dev)
+{
+	struct fwnode_handle *rimt_fwnode;
+	struct acpi_rimt_node *node;
+
+	node = rimt_scan_node(ACPI_RIMT_NODE_TYPE_IOMMU, dev);
+	if (!node) {
+		pr_err("Could not find IOMMU node in RIMT\n");
+		return -ENODEV;
+	}
+
+	if (dev_is_pci(dev)) {
+		rimt_fwnode = acpi_alloc_fwnode_static();
+		if (!rimt_fwnode)
+			return -ENOMEM;
+
+		rimt_fwnode->dev = dev;
+		if (!dev->fwnode)
+			dev->fwnode = rimt_fwnode;
+
+		rimt_set_fwnode(node, rimt_fwnode);
+	} else {
+		rimt_set_fwnode(node, dev->fwnode);
+	}
+
+	return 0;
+}
+
+#ifdef CONFIG_IOMMU_API
+
+/**
+ * rimt_get_fwnode() - Retrieve fwnode associated with an RIMT node
+ *
+ * @node: RIMT table node to be looked-up
+ *
+ * Returns: fwnode_handle pointer on success, NULL on failure
+ */
+static struct fwnode_handle *rimt_get_fwnode(struct acpi_rimt_node *node)
+{
+	struct fwnode_handle *fwnode = NULL;
+	struct rimt_fwnode *curr;
+
+	spin_lock(&rimt_fwnode_lock);
+	list_for_each_entry(curr, &rimt_fwnode_list, list) {
+		if (curr->rimt_node == node) {
+			fwnode = curr->fwnode;
+			break;
+		}
+	}
+	spin_unlock(&rimt_fwnode_lock);
+
+	return fwnode;
+}
+
 static bool rimt_pcie_rc_supports_ats(struct acpi_rimt_node *node)
 {
 	struct acpi_rimt_pcie_rc *pci_rc;
@@ -290,43 +327,6 @@ static struct acpi_rimt_node *rimt_node_get_id(struct acpi_rimt_node *node,
 	return NULL;
 }
 
-/*
- * RISC-V supports IOMMU as a PCI device or a platform device.
- * When it is a platform device, there should be a namespace device as
- * well along with RIMT. To create the link between RIMT information and
- * the platform device, the IOMMU driver should register itself with the
- * RIMT module. This is true for PCI based IOMMU as well.
- */
-int rimt_iommu_register(struct device *dev)
-{
-	struct fwnode_handle *rimt_fwnode;
-	struct acpi_rimt_node *node;
-
-	node = rimt_scan_node(ACPI_RIMT_NODE_TYPE_IOMMU, dev);
-	if (!node) {
-		pr_err("Could not find IOMMU node in RIMT\n");
-		return -ENODEV;
-	}
-
-	if (dev_is_pci(dev)) {
-		rimt_fwnode = acpi_alloc_fwnode_static();
-		if (!rimt_fwnode)
-			return -ENOMEM;
-
-		rimt_fwnode->dev = dev;
-		if (!dev->fwnode)
-			dev->fwnode = rimt_fwnode;
-
-		rimt_set_fwnode(node, rimt_fwnode);
-	} else {
-		rimt_set_fwnode(node, dev->fwnode);
-	}
-
-	return 0;
-}
-
-#ifdef CONFIG_IOMMU_API
-
 static struct acpi_rimt_node *rimt_node_map_id(struct acpi_rimt_node *node,
 					       u32 id_in, u32 *id_out,
 					       u8 type_mask)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
