Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6C8C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+VgyOd8Xc5dY4d98fp6ThJF9dgT1e0vikG5Kj/gruc=; b=lLEdHS2rEhYXSa
	FDPqQ8UoqP8L+tltcPgYDlA2sme+BgumWJ1qLj1mskML3ofIG45wGCTw+v2Qg4Ufrj/JVGcg7vWlH
	nJXmDZBWKstZpdBUTY+piDP/ZiMFrtKLfyFflfzs91b3BZTRcvFQnbCNQASNYZ+femeBhq2kI2/Gl
	NccP+1KcE74Q4HJyYSRQZCaeYBn+uNM3sy1PeVzhOE/ueYEi/xtyi4q1YhBJ/xsLQTDm2pjCphtAo
	yvu7cNWJkKyhyZiQUOpv+s3OBKP6IXIhroK1MbXz/t53iJQiZ5Td+BLaA+B8OSrSgLyHdyO/4Cp6h
	P5i3f0d4cONnxVgCofhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYpr-004xk2-Sk; Mon, 30 Jan 2023 18:24:55 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYno-004wnx-IQ
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:22:50 +0000
Received: by mail-pl1-x634.google.com with SMTP id jh15so3493143plb.8
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQmlSJt1mKnn8ZkMRDOuhHD/tvDeAwvwL75cA/i0XSQ=;
        b=QbvfBF3x8sRkM0Mnn/7yhdTo3EWPdiIllJBGkCmj/QGpf48KiP8LeNvULdX9sxCZOk
         xiFP+O2wlVL4Gq4cbuWRkJSt535XiYpwSdTb8m4eas8zTtvyr1acHedmKNvCJLRynZMv
         WOwZeKIHlMjKS3CS5V1Lq5PLZ+AdjrFEoGcYU05bT9wYYfYrk/Nv5Q1PxKPqveXNaiqY
         etq/G5VtbzZ69YGHfX2qubxDR8qDQNQqcv5bRx4sFIwJTdaXGYWkyz9C8Vu1WbgZ52L7
         KEoUJrdXZq8DH0h8L9/OLNamDd2vJtvBnCGv4io/LoAh46QsdpppGSyMk3smSCnDOFo6
         66Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQmlSJt1mKnn8ZkMRDOuhHD/tvDeAwvwL75cA/i0XSQ=;
        b=f12Q9qzsW7jgpndArvnbv1MpDTPy0OXiSFnxBPJ+W97eh55TAZYUf0imbfbsDLtE9+
         MMXdA32RuBsK0vzE03riOLruVXC8gc6ayI5QA/nCnbZXHSJs8btJBJX5+74x9Crq9z50
         hV59D5Iyf5nOPQKxQfsy5Ujl4viG98ZzAVlw3+/PbJkQSWoTsgBMVF55dPv8E3x63RZr
         idiSNTvvgiGEV2plJ9QyhTC3+Bh5XF/pzhxkO8ThjzyGJ+nBMpUO7o89DpLtNwzTDt22
         4vwhMixAjUOlxqDeA5+W2YvbW+XNK0CFRgS1Do+h0MOtCJgG/DeyfUzuatyziBFslrgS
         N/pA==
X-Gm-Message-State: AO0yUKWPLich+N7gsdETBYUN8POMRLX1wm7HheiJWnkeA1SB4PInjntP
	sxhKtL/oWdYi3zs50UrQ/d40BA==
X-Google-Smtp-Source: AK7set/VYyvu92zZ3Xjk7mGEuU3c3+cw5HP/k76M0jAq7oPCWLADq7XR3KkvpFIG2EbGQYv5z3LwlQ==
X-Received: by 2002:a05:6a21:7885:b0:bc:f189:505d with SMTP id bf5-20020a056a21788500b000bcf189505dmr6444557pzc.48.1675102968293;
        Mon, 30 Jan 2023 10:22:48 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:22:47 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 03/24] ACPICA: Add structure definitions for RISC-V RHCT
Date: Mon, 30 Jan 2023 23:52:04 +0530
Message-Id: <20230130182225.2471414-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102248_646405_FCF4452C 
X-CRM114-Status: GOOD (  11.83  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, acpica-devel@lists.linuxfoundation.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V Hart Capabilities Table (RHCT) is a new static table.
The ECR to add RHCT is approved by the UEFI forum and will be
available in the next version of the ACPI spec.

This patch is not yet merged in ACPICA but a PR is raised.

ACPICA PR: https://github.com/acpica/acpica/pull/804
Reference: Mantis: 2349

Cc: Robert Moore <robert.moore@intel.com>
Cc: acpica-devel@lists.linuxfoundation.org
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 include/acpi/actbl2.h | 48 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index c432fd15db65..86bb79fdfa62 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -47,6 +47,7 @@
 #define ACPI_SIG_PRMT           "PRMT"	/* Platform Runtime Mechanism Table */
 #define ACPI_SIG_RASF           "RASF"	/* RAS Feature table */
 #define ACPI_SIG_RGRT           "RGRT"	/* Regulatory Graphics Resource Table */
+#define ACPI_SIG_RHCT           "RHCT"	/* RISC-V Hart Capabilities Table */
 #define ACPI_SIG_SBST           "SBST"	/* Smart Battery Specification Table */
 #define ACPI_SIG_SDEI           "SDEI"	/* Software Delegated Exception Interface Table */
 #define ACPI_SIG_SDEV           "SDEV"	/* Secure Devices table */
@@ -2604,6 +2605,53 @@ enum acpi_rgrt_image_type {
 	ACPI_RGRT_TYPE_RESERVED = 2	/* 2 and greater are reserved */
 };
 
+/*******************************************************************************
+ *
+ * RHCT - RISC-V Hart Capabilities Table
+ *        Version 1
+ *
+ ******************************************************************************/
+
+struct acpi_table_rhct {
+	struct acpi_table_header header;	/* Common ACPI table header */
+	u32 reserved;
+	u64 time_base_freq;
+	u32 node_count;
+	u32 node_offset;
+};
+
+/*
+ * RHCT subtables
+ */
+struct acpi_rhct_node_header {
+	u16 type;
+	u16 length;
+	u16 revision;
+};
+
+/* Values for RHCT subtable Type above */
+
+enum acpi_rhct_node_type {
+	ACPI_RHCT_NODE_TYPE_ISA_STRING = 0x0000,
+	ACPI_RHCT_NODE_TYPE_HART_INFO = 0xFFFF,
+};
+
+/*
+ * RHCT node specific subtables
+ */
+
+/* ISA string node structure */
+struct acpi_rhct_isa_string {
+	u16 isa_length;
+	char isa[];
+};
+
+/* Hart Info node structure */
+struct acpi_rhct_hart_info {
+	u16 num_offsets;
+	u32 uid;		/* ACPI processor UID */
+};
+
 /*******************************************************************************
  *
  * SBST - Smart Battery Specification Table
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
