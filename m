Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EE0C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MoGNRjelKrQBwH0aIpbh4cIlJB9sgCglx9NFBtPs6Q=; b=Uyd8XtV5EityOg
	ulHR0x4jnhpOJ+VEq7yt1f0TtgOs7XCpwoqUEIv2Fc5rGhQHzEU8VcC2G+c/YhoYph5H2HR2Vvm5v
	qniwlsd7r+UHB9+ZxBXVa+s2psjJNHmDdTDYidQMttaZH2Hv1Js9/0kjrcyR5KhpmCgR80DwEpTbr
	KbGMTjuZxih6txotBudLff9e8ioLi59zL1wN0VljYybAuaOKM6UfvQEXk/uoAMFyKSGLliezkj106
	+rDh+b9NtfcpWvtb8fdQJRObJzPvhciVEx3a/9eYSgtENnONkcXVyl+LHaUkwjsZxcpvwRG9XSG03
	4hSo49G2o5NS/4ABeMNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5az-006T1Z-PY; Fri, 03 Mar 2023 13:37:13 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5aw-006T0D-Si
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:37:12 +0000
Received: by mail-pl1-x62e.google.com with SMTP id n6so2677207plf.5
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfyzZGOgFR8JpdppLMBGRahWign1okVbjuzaxShQLj4=;
        b=QbfGLwIuluvMNX0Ta2fzSLSVBC7hhY3oQGitdmSvQddpboah2piDakV2DkzR8/PDMa
         p2SBD5il7DVwdWfqiIdTlKhiYt5Id3CvaIfe6KLTf3unakUrjwOsed2Ko6vkCY8QPAsX
         9gEx7ClulHt10YDsNZllZTSx9SRjIcWRIkXbRP0SQRO+x6irEX4LOiQIAtapl+xfDq12
         gD45eRlcsodYO3zsa81If1Pn2ShUj6hfFdqjoATwLkVFwkRrRxUYNtZsoFDS8+QvtCZy
         sh8IqiUHecMUJMAznYTCORyxmml4vRQLuB9Osxg1Pn52y4USC68J9O+zwsJ+OE2CA6EV
         H2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfyzZGOgFR8JpdppLMBGRahWign1okVbjuzaxShQLj4=;
        b=NwcpEGpxebz+7nJtRNofWllByeNdewsXa9rZKbqAw6DRemJz0ZVHHh/1rGNAq3rqxV
         o8noLeYzGpgBEcK7am1l2yrIW08o3jV8dcETgCbD4GCwE0IiQbhUloQ9S3EOyk5ntWHk
         Hw4SLwKCFaRdqc76YRnCgwHI/tOCIT+YsmlxfjBG+ml2FMwNr2rk0sfVvtW5wmpynIt+
         NP4Di5aHInIZ9vOhvy58e/t1HoNmgfRNRaVcRsmWYP8qX76Ef2GjBgSMvX/2EoXZmLrj
         f1Vnc6ViXPvzAa+cuSSi7XV8Ibv6wd1TFRxCp1rW43aVImz6HuNNU7hgqXSBTSElwgVv
         I2kQ==
X-Gm-Message-State: AO0yUKUjGPufOnDuAF9Ft0Grr9beaUzwjfkkAF8JLb7MtsKPdlitl8gC
	IqsyRY8zwZW9L2Hc3AuHtM28hZkojnGdaBy3
X-Google-Smtp-Source: AK7set/7mpqJYQyP2c7P7o6FdhEOlGmQ7gcqb5kaRjsFekLE9espZ/Nhpcj7/VMu31HKQhIxtlIxIw==
X-Received: by 2002:a17:902:e80f:b0:19e:747e:813e with SMTP id u15-20020a170902e80f00b0019e747e813emr2324704plg.23.1677850630195;
        Fri, 03 Mar 2023 05:37:10 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:09 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 03/20] ACPICA: Add structure definitions for RISC-V RHCT
Date: Fri,  3 Mar 2023 19:06:30 +0530
Message-Id: <20230303133647.845095-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053710_968854_229ED8CE 
X-CRM114-Status: GOOD (  11.74  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, 'Conor Dooley ' <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, acpica-devel@lists.linuxfoundation.org, Len Brown <lenb@kernel.org>
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
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 include/acpi/actbl2.h | 47 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index abb700d246df..0715e937a453 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -47,6 +47,7 @@
 #define ACPI_SIG_PRMT           "PRMT"	/* Platform Runtime Mechanism Table */
 #define ACPI_SIG_RASF           "RASF"	/* RAS Feature table */
 #define ACPI_SIG_RGRT           "RGRT"	/* Regulatory Graphics Resource Table */
+#define ACPI_SIG_RHCT           "RHCT"  /* RISC-V Hart Capabilities Table */
 #define ACPI_SIG_SBST           "SBST"	/* Smart Battery Specification Table */
 #define ACPI_SIG_SDEI           "SDEI"	/* Software Delegated Exception Interface Table */
 #define ACPI_SIG_SDEV           "SDEV"	/* Secure Devices table */
@@ -2606,6 +2607,52 @@ enum acpi_rgrt_image_type {
 
 /*******************************************************************************
  *
+ * RHCT - RISC-V Hart Capabilities Table
+ *        Version 1
+ *
+ ******************************************************************************/
+
+struct acpi_table_rhct {
+	struct acpi_table_header        header;             /* Common ACPI table header */
+	u32                             reserved;
+	u64                             time_base_freq;
+	u32                             node_count;
+	u32                             node_offset;
+};
+
+/*
+ * RHCT subtables
+ */
+struct acpi_rhct_node_header {
+	u16                             type;
+	u16                             length;
+	u16                             revision;
+};
+
+/* Values for RHCT subtable Type above */
+
+enum acpi_rhct_node_type {
+	ACPI_RHCT_NODE_TYPE_ISA_STRING = 0x0000,
+	ACPI_RHCT_NODE_TYPE_HART_INFO  = 0xFFFF,
+};
+
+/*
+ * RHCT node specific subtables
+ */
+
+/* ISA string node structure */
+struct acpi_rhct_isa_string {
+	u16                             isa_length;
+	char                            isa[];
+};
+
+/* Hart Info node structure */
+struct acpi_rhct_hart_info {
+	u16                             num_offsets;
+	u32                             uid;                /* ACPI processor UID */
+};
+
+/*******************************************************************************
  * SBST - Smart Battery Specification Table
  *        Version 1
  *
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
