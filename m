Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE72C3ABCB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 05:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WUB2aCR2gZ3JCFFKfQfDtTjIsPblUqW0UrfM9pj9NM=; b=crGX2ZIbECoe3T
	FqTb9v2ORGhW4xnzMJvMNhT102ngfKPNTlC9gsKe529rmRKD5jQNC5S/2l4De5y4cYoErUZJnFlxl
	wtTlmW43Zw0m1CAZsbrE0ty4wUZoEpzEW+Si933UQN+PKNmiWX9tnUEIiJcabgSkp2g5czwo1Pb1A
	6vLcpVehBDvgOzlDfFz5b+FAaSzgDrzcNcF670OwlUfMIJpl67Pm3lerWVdKMbPDbh+I1Soh2BRX0
	rl85Gp1fBgnCoMbr6TWY/rzdrQ1KzYmzpiGAePPVpSBZn45UqrPIbFSTrcj4aAywrKOwz/U+ECXj3
	8fMFKv+SOOuGYtzl1How==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF57e-0000000E7JJ-3Wwe;
	Wed, 14 May 2025 05:57:42 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF57c-0000000E7IV-1nVj
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 05:57:41 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22e70a9c6bdso89802375ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 22:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747202259; x=1747807059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3mv/YR2xZRmrbZBh7XLVUMsC3Lat0ehLZET0BefXjE=;
        b=AMwTSeEIV1f+9YmS2yDfhljMYgZL/7Shb7d7aNK78HlaNwHLB1wNRS+thk55X/rv4h
         lCuoXM5/gxoYJhEoAwEwDGnEXTh4qbVc1iWYTaRnDRFT1PoK0P7HnvNkP3o7DCBRH8Mx
         Tv41Vl3tlrOqNto59Yp9iZa4c3Cwam8NT/pWrmG2GB2LILVqYQZcNB6uNxxbDMBFwkw5
         excRLvCeKjbrsXuO6HQEMzJopaqm+l4w9QuRGgq4EH0Rc/tp5VnfK0vPD3sOp/+vGsEl
         Uz/iOKvw6uyhFD3kqad6EF3sESTAZ6Sb+icZNTE1Ukz8CCTA9RJU4Q/WikD8/TYBIpqs
         THEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747202259; x=1747807059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3mv/YR2xZRmrbZBh7XLVUMsC3Lat0ehLZET0BefXjE=;
        b=VHexuSb3w3bZjyxDNs5nncPVaiMmweLyA9knhBPDzGireJmX8QC0koSfGbFJFE97M3
         C1whn5+vKcGKIeiXLL8F4nqPgXaDYX/C59/I8s45cOcDaKGuymgTbB9TQpqs0Hvpr74i
         mRxdbL0qqCU+uP5XCaa3Cg0BvZ2632WV7M+Q4VJjnnIeTiqQg52lcKP+GIr9Et9cSH54
         Kvwe6eHX9hm2u3tMyIuT4FeTSLTSR2Jw28zSH8qtaol3BepLTQWoTKEoFTXQOX1KqOHN
         XyJ2pW7JGbG5EBISlDWI420ZIBdTR/YDWZP/A7xgw+GKNoQKwxabOpCYHlCEjeVHFCwS
         vXWg==
X-Forwarded-Encrypted: i=1; AJvYcCWK2qM83lNN7qLlaynz1RHTowXJXpqDNHYTGPF5ecqhLwWdgoXYFQREgdLD6o3l5wQWQjpcK9qVIuClow==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeTmxaTclNo4A6TlAFGvpNgOv4M4hr+v88IQZRmjKJ3/2bK5CN
	VO3ALZhddn6BW5omJdPTDZ+0QUOaaz0TtpPCJvlpfg08CPfSdw2grZHyjGz99eM=
X-Gm-Gg: ASbGnct+yxcPGY98GA9ybQzQzPM7gI3FQpApOPH03/2JOKnd+UFfy8OmNUe/EJtawFu
	+3dORLVREtEP32SzNk5X7cguDwW9Q/dcZG45xBZv0cwPMFvFsXsCJzMdMHLmEiCEj0SYYuzgcQA
	BfjFiIstnGmopl13crLFK/ESk96lq2djwwJHyEe8xCMH4YQT01c2+YjByPus/PmEBidY7VyfXjE
	Yz/PEwW3MBdLERuBz9eJK7qN4rwdfUQsAl+m6kML52VrTn6NTZhOy3nWFrszQiKCMPXuP2vRloB
	c4/ncWaAKZzkzhIs3APdQOyZpI8yaRGwI5dIH+nGrZjGX5JWjl7G7PAKmQOdhQ==
X-Google-Smtp-Source: AGHT+IHE6ExFWnu/zrAvRfvX4AYC0RkEswg44e9W2VNDqbKcdiZ15MPr+ykcmRts8B4KvtHH+QD0iA==
X-Received: by 2002:a17:903:41c5:b0:21f:1bd:efd4 with SMTP id d9443c01a7336-231980d04a3mr31983045ad.19.1747202259577;
        Tue, 13 May 2025 22:57:39 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.196.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c2dsm91721615ad.135.2025.05.13.22.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 22:57:39 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev,
	acpica-devel@lists.linux.dev
Subject: [PATCH 1/4] ACPICA: actbl2: Add definitions for RIMT
Date: Wed, 14 May 2025 11:27:20 +0530
Message-ID: <20250514055723.1328557-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514055723.1328557-1-sunilvl@ventanamicro.com>
References: <20250514055723.1328557-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_225740_470255_3120F16B 
X-CRM114-Status: GOOD (  10.92  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Atish Kumar Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ACPICA commit 73c32bc89cad64ab19c1231a202361e917e6823c

RISC-V IO Mapping Table (RIMT) is a new static table defined for RISC-V
to communicate IOMMU information to the OS. The specification for RIMT
is available at [1]. Add structure definitions for RIMT.

[1] - https://github.com/riscv-non-isa/riscv-acpi-rimt

Link: https://github.com/acpica/acpica/commit/73c32bc8
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 include/acpi/actbl2.h | 83 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index 2e917a8f8bca..99ea8bfe47de 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -50,6 +50,7 @@
 #define ACPI_SIG_RAS2           "RAS2"	/* RAS2 Feature table */
 #define ACPI_SIG_RGRT           "RGRT"	/* Regulatory Graphics Resource Table */
 #define ACPI_SIG_RHCT           "RHCT"	/* RISC-V Hart Capabilities Table */
+#define ACPI_SIG_RIMT           "RIMT"	/* RISC-V IO Mapping Table */
 #define ACPI_SIG_SBST           "SBST"	/* Smart Battery Specification Table */
 #define ACPI_SIG_SDEI           "SDEI"	/* Software Delegated Exception Interface Table */
 #define ACPI_SIG_SDEV           "SDEV"	/* Secure Devices table */
@@ -3002,6 +3003,88 @@ struct acpi_rhct_hart_info {
 	u32 uid;		/* ACPI processor UID */
 };
 
+/*******************************************************************************
+ *
+ * RIMT - RISC-V IO Remapping Table
+ *
+ * https://github.com/riscv-non-isa/riscv-acpi-rimt
+ *
+ ******************************************************************************/
+
+struct acpi_table_rimt {
+	struct acpi_table_header header;	/* Common ACPI table header */
+	u32 num_nodes;		/* Number of RIMT Nodes */
+	u32 node_offset;	/* Offset to RIMT Node Array */
+	u32 reserved;
+};
+
+struct acpi_rimt_node {
+	u8 type;
+	u8 revision;
+	u16 length;
+	u16 reserved;
+	u16 id;
+	char node_data[];
+};
+
+enum acpi_rimt_node_type {
+	ACPI_RIMT_NODE_TYPE_IOMMU = 0x0,
+	ACPI_RIMT_NODE_TYPE_PCIE_ROOT_COMPLEX = 0x1,
+	ACPI_RIMT_NODE_TYPE_PLAT_DEVICE = 0x2,
+};
+
+struct acpi_rimt_iommu {
+	u8 hardware_id[8];	/* Hardware ID */
+	u64 base_address;	/* Base Address */
+	u32 flags;		/* Flags */
+	u32 proximity_domain;	/* Proximity Domain */
+	u16 pcie_segment_number;	/* PCIe Segment number */
+	u16 pcie_bdf;		/* PCIe B/D/F */
+	u16 num_interrupt_wires;	/* Number of interrupt wires */
+	u16 interrupt_wire_offset;	/* Interrupt wire array offset */
+	u64 interrupt_wire[];	/* Interrupt wire array */
+};
+
+/* IOMMU Node Flags */
+#define ACPI_RIMT_IOMMU_FLAGS_PCIE      (1)
+#define ACPI_RIMT_IOMMU_FLAGS_PXM_VALID (1 << 1)
+
+/* Interrupt Wire Structure */
+struct acpi_rimt_iommu_wire_gsi {
+	u32 irq_num;		/* Interrupt Number */
+	u32 flags;		/* Flags */
+};
+
+/* Interrupt Wire Flags */
+#define ACPI_RIMT_GSI_LEVEL_TRIGGERRED  (1)
+#define ACPI_RIMT_GSI_ACTIVE_HIGH       (1 << 1)
+
+struct acpi_rimt_id_mapping {
+	u32 source_id_base;	/* Source ID Base */
+	u32 num_ids;		/* Number of IDs */
+	u32 dest_id_base;	/* Destination Device ID Base */
+	u32 dest_offset;	/* Destination IOMMU Offset */
+	u32 flags;		/* Flags */
+};
+
+struct acpi_rimt_pcie_rc {
+	u32 flags;		/* Flags */
+	u16 reserved;		/* Reserved */
+	u16 pcie_segment_number;	/* PCIe Segment number */
+	u16 id_mapping_offset;	/* ID mapping array offset */
+	u16 num_id_mappings;	/* Number of ID mappings */
+};
+
+/* PCIe Root Complex Node Flags */
+#define ACPI_RIMT_PCIE_ATS_SUPPORTED   (1)
+#define ACPI_RIMT_PCIE_PRI_SUPPORTED   (1 << 1)
+
+struct acpi_rimt_platform_device {
+	u16 id_mapping_offset;	/* ID Mapping array offset */
+	u16 num_id_mappings;	/* Number of ID mappings */
+	char device_name[];	/* Device Object Name */
+};
+
 /*******************************************************************************
  *
  * SBST - Smart Battery Specification Table
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
