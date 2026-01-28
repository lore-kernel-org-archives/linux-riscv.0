Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6439D46BFA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbYn5LONnH6KDa2Ii/16K2FHPBMG+NTSfmpix7F94ww=; b=xRnSCBcO5S2IhB
	8v2N6UUZU6TXozjum/8NWHOnSTrO5EmMd8O6DiQk3BCjlHK2PzB9iMSanqCHigFVRAmnK7Lv95+Us
	OWNZ+3DzuuYaYPB6C/RkCc5WYpwPZsWZCGBdwSqlF1tvw2a9bIEUOHmjZ0OY/+bUrYQ2gyPL9Q7mb
	W1zt7NjgS/CtSABpdq8utSItHIvsfkNh1rsUAsDdBsY2ft2PAYwReaulE0d5NcpZ/SI5AWjPxWaP5
	KHHTkXPZAp66Gj8PRf5pe4EGdbxXguAYJtspdoPbKkrH1PGB+KtCgkvi47CT9jsLSFQm9v0P4B08+
	1xts5nYYpKA0CiM3X8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC9N-0000000GkJ1-1bG2;
	Wed, 28 Jan 2026 20:28:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC95-0000000Gk19-2HWS
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47B27444F8;
	Wed, 28 Jan 2026 20:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FFAC16AAE;
	Wed, 28 Jan 2026 20:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632091;
	bh=jn4odfUh7D9q/BnIUXd595ocfV3eTkf4xm4P7+F2KGs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MDwDdAd9XRRNE3fXT1SsP2N74mIyBQurX5zlQpUC8Uwy5AxUyQrSaVBKvEKbod00f
	 3hInkZQcy1YLatEB3rGECMP/1IUZQsPXikMMnz8mqBG/N4WS0dCQJ/ncBfBhARqLkK
	 v993QwZbPlgeVFVHoLdS+YkInKWyqZru//r+yWQruQdzLUZppye1iEQoeUBJpei/r8
	 l8yDTPtdKEuywf61SCIRW85jAbXeJUxY+Y+yycda8PnEqfQvOWN6SYz0cA/51FeRWf
	 TTW453sP2DeaNW4ElCPILZLVN4riIItZH/nbq2wBlp8P4qsNwoKEJ5YV2lfrua3Cw7
	 7FuCBahkxxcow==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 28 Jan 2026 12:27:35 -0800
Subject: [PATCH RFC v2 14/17] include: acpi: actbl2: Add structs for RQSC
 table
MIME-Version: 1.0
Message-Id: <20260128-ssqosid-cbqri-v2-14-dca586b091b9@kernel.org>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, Rob Herring <robh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3784; i=fustini@kernel.org;
 h=from:subject:message-id; bh=jn4odfUh7D9q/BnIUXd595ocfV3eTkf4xm4P7+F2KGs=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWRWFQYuf+rF9cdUp/OLUNZB9dDmGU1v8/a8TDT4kd770
 Fs8T2hKRykLgxgXg6yYIsumD3kXlniFfl0w/8U2mDmsTCBDGLg4BWAiF7Yx/E/VP/jo2DT+dXOC
 L1V5Le1/cSEtaInd38bvD4/9YGFy+JTMyHB+ZtysU13nM+xZDl1pKptxhLP42asagWTH7GXyDe8
 murAAAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_122811_847458_8B3F1F92 
X-CRM114-Status: GOOD (  10.39  )
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

Add structs for the RQSC table which describes the properties of the
RISC-V QoS controllers (CBQRI) in the system. The table also describes
the topological arrangement of the QoS controllers and resources in the
system. The topology is expressed in terms of the location of the
resources within the system and the relation between the QoS Controller
and the resource it manages.

Link: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
Link: https://github.com/riscv-non-isa/riscv-rqsc/blob/main/src/chapter2.adoc
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 include/acpi/actbl2.h | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index f726bce3eb84..7367990349ee 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -53,6 +53,7 @@
 #define ACPI_SIG_RGRT           "RGRT"	/* Regulatory Graphics Resource Table */
 #define ACPI_SIG_RHCT           "RHCT"	/* RISC-V Hart Capabilities Table */
 #define ACPI_SIG_RIMT           "RIMT"	/* RISC-V IO Mapping Table */
+#define ACPI_SIG_RQSC           "RQSC"	/* RISC-V RISC-V Quality of Service Controller */
 #define ACPI_SIG_SBST           "SBST"	/* Smart Battery Specification Table */
 #define ACPI_SIG_SDEI           "SDEI"	/* Software Delegated Exception Interface Table */
 #define ACPI_SIG_SDEV           "SDEV"	/* Secure Devices table */
@@ -3165,6 +3166,97 @@ enum acpi_rgrt_image_type {
 	ACPI_RGRT_TYPE_RESERVED = 2	/* 2 and greater are reserved */
 };
 
+/*******************************************************************************
+ *
+ * RQSC - RISC-V Quality of Service Controller
+ *        Version 1
+ *
+ ******************************************************************************/
+
+struct acpi_table_rqsc_fields_res {
+	u8 type;	// 1
+	u8 resv;	// 1
+	u16 length;	// 2
+	u16 flags;	// 2
+	u8 resv2;	// 1
+	u8 id_type;	// 1
+	u64 id1;	// 8
+	u32 id2;	// 4
+};
+
+struct acpi_table_rqsc_fields {
+	u8 type;	//  1
+	u8 resv;	//  1
+	u16 length;	//  2
+	u32 reg[3];	// 12
+	u32 rcid;	//  4
+	u32 mcid;	//  4
+	u16 flags;	//  2
+	u16 nres;	//  2
+	struct acpi_table_rqsc_fields_res res; // 20
+};
+
+struct acpi_table_rqsc {
+	struct acpi_table_header header;	/* Common ACPI table header */
+	u32 num;
+	struct acpi_table_rqsc_fields f[6];
+};
+
+/* RQSC Flags */
+#define ACPI_RQSC_TIMER_CANNOT_WAKEUP_CPU       (1)
+
+/*
+ * RQSC subtables
+ */
+struct acpi_rqsc_node_header {
+	u16 type;
+	u16 length;
+	u16 revision;
+};
+
+/* Values for RQSC subtable Type above */
+enum acpi_rqsc_node_type {
+	ACPI_RQSC_NODE_TYPE_ISA_STRING = 0x0000,
+	ACPI_RQSC_NODE_TYPE_CMO = 0x0001,
+	ACPI_RQSC_NODE_TYPE_MMU = 0x0002,
+	ACPI_RQSC_NODE_TYPE_RESERVED = 0x0003,
+	ACPI_RQSC_NODE_TYPE_HART_INFO = 0xFFFF,
+};
+
+/*
+ * RQSC node specific subtables
+ */
+
+/* ISA string node structure */
+struct acpi_rqsc_isa_string {
+	u16 isa_length;
+	char isa[];
+};
+
+struct acpi_rqsc_cmo_node {
+	u8 reserved;		/* Must be zero */
+	u8 cbom_size;		/* CBOM size in powerof 2 */
+	u8 cbop_size;		/* CBOP size in powerof 2 */
+	u8 cboz_size;		/* CBOZ size in powerof 2 */
+};
+
+struct acpi_rqsc_mmu_node {
+	u8 reserved;		/* Must be zero */
+	u8 mmu_type;		/* Virtual Address Scheme */
+};
+
+enum acpi_rqsc_mmu_type {
+	ACPI_RQSC_MMU_TYPE_SV39 = 0,
+	ACPI_RQSC_MMU_TYPE_SV48 = 1,
+	ACPI__MMU_TYPE_SV57 = 2
+};
+
+/* Hart Info node structure */
+struct acpi_rqsc_hart_info {
+	u16 num_offsets;
+	u32 uid;		/* ACPI processor UID */
+};
+
 /*******************************************************************************
  *
  * RHCT - RISC-V Hart Capabilities Table

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
