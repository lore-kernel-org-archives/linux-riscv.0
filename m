Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07673C636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MoGNRjelKrQBwH0aIpbh4cIlJB9sgCglx9NFBtPs6Q=; b=wylg0CD2kL/L2k
	i6oDedk48WpHtTYvxS2TQQIhLldXMKM1tSGC//noK61av9qNS9OLghqYdmHO2oPTZsyYl5DM6oBIk
	5Vlr5s6R4gUIft20jIGAHIFEpI0+PWZ3K97G8huYJiZ8lhUcfRWoyKJ5sIyi5ClSZkWBKeynRF1eU
	gIz+L1wnb7vswZAr9swhB6HAmzHCPsFUcCLqfTHkNhvXTLNqqueNSCkXjgZ4cQg6FZW7pItC33waH
	SpuN9aR76LVqNSErJ6EsgRYMVuqwc+pEca90SyAnXXD+SplaSpu4yjcbZe3laJ5J+Rl4DValDskf+
	rABp5bugCi2Kr+k2Ey/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSisa-00BTTV-UE; Thu, 16 Feb 2023 18:21:12 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSisX-00BTQM-S9
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:21:11 +0000
Received: by mail-pj1-x1035.google.com with SMTP id fu4-20020a17090ad18400b002341fadc370so6733971pjb.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfyzZGOgFR8JpdppLMBGRahWign1okVbjuzaxShQLj4=;
        b=UUpqTB6AUMM+Rdx7uT+Js1SJiUxUEqdBUlVRwfmgNPvgDY5tG85Wxm3Gwp/IEKUHuZ
         ENhr7womW2HoZ2BMwxNaM80t9Mvqr8Up6T/0VnSGLxjBCRKnZWmt4kPZ7ak3QDJZv38W
         qJ3Eq+45h+1FPXzR2jouMZbuuDxkDkqWPQU7lF74NAfc9C2Llq3uqjKOOiXVLcP+8X6z
         vlBl/lo7NfD/254ux+cQuNFC7vQUjHKUORmYpITy0o+zFBNrvthGinJGsCd+7+5jXJMq
         vbkDxrrOWBj6Rv701fRDlfv0umCjx8f2ReLN9OtGGlcJq8i+Fm+1hQ53vTXUZ91JcZDU
         4sLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfyzZGOgFR8JpdppLMBGRahWign1okVbjuzaxShQLj4=;
        b=SWkR/PVCCvSpBay6R8e8hmPDdbSX5/piFIoIX1d0564LAl9gCO7sBeUIo1IrZMF9jk
         S7aE+rr9+uXwSO2w4jjbBP117TXwuWgj8qimg4/ZrBOuUJW1NxnOhi2WWK4sE20HyCVl
         pMhyJ9KGpK1NUAQkjOji2IJRvmNFTzv4XmyAEeQ7lq4/ELCcRshJ26iCy2f0UXbLC4H9
         iGpDX2oZk0UQ8U3x36MOvXm8JX5mKVWzJn0HpK26ta3Vbj81gnOnICjSXqmahTW9FdKO
         Dp97gul+bvMi1YuuzBxz+DUPG8C8wb3SLsjr34KDxhFueEdrpsUIyffw9WcBWAZ7fDmK
         IaWA==
X-Gm-Message-State: AO0yUKUa8IuzvTrmmKjEZDMptuHQvA7WrWMLURr2cASaYfzace/cJlBh
	jRpU7gCcppUPmRg5y8e7k/DA/Q==
X-Google-Smtp-Source: AK7set8JpufQhWdcRJ+BEmmVhZstiF26E90Ef0t3jfC9+K2OuXgwMWuOeImG6W7vD/tbgaaMq/DBCQ==
X-Received: by 2002:a05:6a21:6d88:b0:c7:20d8:dc1e with SMTP id wl8-20020a056a216d8800b000c720d8dc1emr3483559pzb.27.1676571666717;
        Thu, 16 Feb 2023 10:21:06 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:06 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 03/21] ACPICA: Add structure definitions for RISC-V RHCT
Date: Thu, 16 Feb 2023 23:50:25 +0530
Message-Id: <20230216182043.1946553-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102109_939730_2F854B65 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, acpica-devel@lists.linuxfoundation.org, Andrew Jones <ajones@ventanamicro.com>
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
