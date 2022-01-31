Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF4FC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 18:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=938o1FKkVKcLU8bJEDvvqKZVS62MxhkyktqsmCLGqk8=; b=jngyO/cptCGgCR
	YxhlR/PGf6lxIUadgOpgPhsq977h1L4WDy75o8YIY5LMSYzxSamdXG8xb+ILsOSubdJvMAbkZZRjQ
	iNSclagxWGV9MxGgl7nW13Ez0fI5E3rL6sojoL9jqtpRTTpWNuyGHE+/kOhSh1NNlgORVTnmapFQp
	sO2jqy7UPedrceJUURfXcNIq/cS4ESLj7j2j1/v0CydvXFEhekSuR6qdz/hM4rEZgPBNs9q3Cchfd
	hf6ErvlB9+EoswSTbctw2ZUNl6qgfYGD0sAHGyr4enQC/hkwEoOxR4O4gOl5ndXG9Z1r3cgvif2Bh
	vB5Kz0k5b3pAqO0A+wig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEbP2-00ALBn-JP; Mon, 31 Jan 2022 18:27:48 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEbOy-00AL96-PG
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 18:27:46 +0000
Received: by mail-oi1-x22f.google.com with SMTP id m9so28297262oia.12
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 10:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YCCLljOzkZTWVhp4UcnxVmYpwCgumhAeXuk5FTxJkB0=;
 b=HZ220OEWLABp3aSXvxPQNJay8YMq8judO11CWtgvZ1gyUaqL8ZYaudw7PMHX1V580g
 GnLIYZLGx8ohGTmZqFeiMGuxWkyzqIYWKO1yOdgweCylB5F7apPKMWg+2jbdBj1QBL4f
 QRhAFMHIY6iKV5heV2a92ydHpDNOqeSWaiLm1Rw/Mw+ukfv/7L3FRcS7lYzFLjERFhJ2
 iwY3FA4Yw55OFcZFnoAy7FkSGZz0yWbw9ooKFwXbqENn1d5FC/MZQPlQIf3P/WEEWmMf
 1luCJH36Asqiac3lcfPC1Ta9PpPS9elHcNxDORDJZqlYkNzvcx1CgAKYpKMrGE4XjEYo
 mcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YCCLljOzkZTWVhp4UcnxVmYpwCgumhAeXuk5FTxJkB0=;
 b=svjxieJhTSPJHzOd0luE4x5tnclrPSRjn7SJ88/UWEAqmEi84F6W03meHR6P9xzMFI
 J68sLqjHyj//tG4CkZ6cj39P0FTTYV5zmGgcEhTZZGlf9EV0CtZ4ss8j5vAEoUb5gQn9
 tXiOnicLzRxQsMcdhRftJhtcb0upNMhsxGRD5W3QGr2/VhLUB5jsjyrzwPqPWYOF6LyJ
 6H38hgqX3fNrbzgQ3iJ3ZizZvLtwLObmio/Jz3jyEF5wtZE6WHFmaXUbwGp7yMMJTq5x
 uDM+hDDyNCGxtvHAFV0oTxGUYgme678pU4pVMTu68lpbBLmj/5dsLiO54r1sQDLH0uSh
 yMXw==
X-Gm-Message-State: AOAM530KN8m3NK/9DnSWjGaAjVQdiLjWqWi6vqIFxvhMN36NVjToRJEV
 Yv32Em3ozRMUjhMvUllrUuX5BuxipVsc9Q==
X-Google-Smtp-Source: ABdhPJwKrM5CvEkYXnzGhb6PF6RnsL6qpETWKpCPSqV4wqkW4E6AQWHPesBXyiHuVEjJ+So+Z8fShg==
X-Received: by 2002:a05:6808:1897:: with SMTP id
 bi23mr6779955oib.217.1643653662815; 
 Mon, 31 Jan 2022 10:27:42 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id a26sm16041676oiy.26.2022.01.31.10.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:27:42 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] riscv: Remove unneeded definitions from asm/module.h
Date: Mon, 31 Jan 2022 19:27:14 +0100
Message-Id: <20220131182720.236065-2-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220131182720.236065-1-kernel@esmil.dk>
References: <20220131182720.236065-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_102744_853156_768A6120 
X-CRM114-Status: GOOD (  19.58  )
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

The inline functions previously defined here are only ever
used in kernel/module-sections.c, so there is no need to
include them in every user of asm/module.h. Through
linux/module.h this is just about every driver.

Now that these functions are static in a single file
remove the inline marker to allow the compiler to make
its own decisions.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/include/asm/module.h     | 87 ----------------------------
 arch/riscv/kernel/module-sections.c | 90 +++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+), 87 deletions(-)

diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
index 76aa96a9fc08..570cd025f220 100644
--- a/arch/riscv/include/asm/module.h
+++ b/arch/riscv/include/asm/module.h
@@ -22,93 +22,6 @@ struct mod_arch_specific {
 	struct mod_section plt;
 	struct mod_section got_plt;
 };
-
-struct got_entry {
-	unsigned long symbol_addr;	/* the real variable address */
-};
-
-static inline struct got_entry emit_got_entry(unsigned long val)
-{
-	return (struct got_entry) {val};
-}
-
-static inline struct got_entry *get_got_entry(unsigned long val,
-					      const struct mod_section *sec)
-{
-	struct got_entry *got = (struct got_entry *)(sec->shdr->sh_addr);
-	int i;
-	for (i = 0; i < sec->num_entries; i++) {
-		if (got[i].symbol_addr == val)
-			return &got[i];
-	}
-	return NULL;
-}
-
-struct plt_entry {
-	/*
-	 * Trampoline code to real target address. The return address
-	 * should be the original (pc+4) before entring plt entry.
-	 */
-	u32 insn_auipc;		/* auipc t0, 0x0                       */
-	u32 insn_ld;		/* ld    t1, 0x10(t0)                  */
-	u32 insn_jr;		/* jr    t1                            */
-};
-
-#define OPC_AUIPC  0x0017
-#define OPC_LD     0x3003
-#define OPC_JALR   0x0067
-#define REG_T0     0x5
-#define REG_T1     0x6
-
-static inline struct plt_entry emit_plt_entry(unsigned long val,
-					      unsigned long plt,
-					      unsigned long got_plt)
-{
-	/*
-	 * U-Type encoding:
-	 * +------------+----------+----------+
-	 * | imm[31:12] | rd[11:7] | opc[6:0] |
-	 * +------------+----------+----------+
-	 *
-	 * I-Type encoding:
-	 * +------------+------------+--------+----------+----------+
-	 * | imm[31:20] | rs1[19:15] | funct3 | rd[11:7] | opc[6:0] |
-	 * +------------+------------+--------+----------+----------+
-	 *
-	 */
-	unsigned long offset = got_plt - plt;
-	u32 hi20 = (offset + 0x800) & 0xfffff000;
-	u32 lo12 = (offset - hi20);
-	return (struct plt_entry) {
-		OPC_AUIPC | (REG_T0 << 7) | hi20,
-		OPC_LD | (lo12 << 20) | (REG_T0 << 15) | (REG_T1 << 7),
-		OPC_JALR | (REG_T1 << 15)
-	};
-}
-
-static inline int get_got_plt_idx(unsigned long val, const struct mod_section *sec)
-{
-	struct got_entry *got_plt = (struct got_entry *)sec->shdr->sh_addr;
-	int i;
-	for (i = 0; i < sec->num_entries; i++) {
-		if (got_plt[i].symbol_addr == val)
-			return i;
-	}
-	return -1;
-}
-
-static inline struct plt_entry *get_plt_entry(unsigned long val,
-					      const struct mod_section *sec_plt,
-					      const struct mod_section *sec_got_plt)
-{
-	struct plt_entry *plt = (struct plt_entry *)sec_plt->shdr->sh_addr;
-	int got_plt_idx = get_got_plt_idx(val, sec_got_plt);
-	if (got_plt_idx >= 0)
-		return plt + got_plt_idx;
-	else
-		return NULL;
-}
-
 #endif /* CONFIG_MODULE_SECTIONS */
 
 #endif /* _ASM_RISCV_MODULE_H */
diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
index e264e59e596e..39d4ac681c2a 100644
--- a/arch/riscv/kernel/module-sections.c
+++ b/arch/riscv/kernel/module-sections.c
@@ -10,6 +10,28 @@
 #include <linux/module.h>
 #include <linux/moduleloader.h>
 
+struct got_entry {
+	unsigned long symbol_addr;	/* the real variable address */
+};
+
+static struct got_entry emit_got_entry(unsigned long val)
+{
+	return (struct got_entry) {val};
+}
+
+static struct got_entry *get_got_entry(unsigned long val,
+				       const struct mod_section *sec)
+{
+	struct got_entry *got = (struct got_entry *)(sec->shdr->sh_addr);
+	int i;
+
+	for (i = 0; i < sec->num_entries; i++) {
+		if (got[i].symbol_addr == val)
+			return &got[i];
+	}
+	return NULL;
+}
+
 unsigned long module_emit_got_entry(struct module *mod, unsigned long val)
 {
 	struct mod_section *got_sec = &mod->arch.got;
@@ -29,6 +51,74 @@ unsigned long module_emit_got_entry(struct module *mod, unsigned long val)
 	return (unsigned long)&got[i];
 }
 
+struct plt_entry {
+	/*
+	 * Trampoline code to real target address. The return address
+	 * should be the original (pc+4) before entring plt entry.
+	 */
+	u32 insn_auipc;		/* auipc t0, 0x0                       */
+	u32 insn_ld;		/* ld    t1, 0x10(t0)                  */
+	u32 insn_jr;		/* jr    t1                            */
+};
+
+#define OPC_AUIPC  0x0017
+#define OPC_LD     0x3003
+#define OPC_JALR   0x0067
+#define REG_T0     0x5
+#define REG_T1     0x6
+
+static struct plt_entry emit_plt_entry(unsigned long val,
+				       unsigned long plt,
+				       unsigned long got_plt)
+{
+	/*
+	 * U-Type encoding:
+	 * +------------+----------+----------+
+	 * | imm[31:12] | rd[11:7] | opc[6:0] |
+	 * +------------+----------+----------+
+	 *
+	 * I-Type encoding:
+	 * +------------+------------+--------+----------+----------+
+	 * | imm[31:20] | rs1[19:15] | funct3 | rd[11:7] | opc[6:0] |
+	 * +------------+------------+--------+----------+----------+
+	 *
+	 */
+	unsigned long offset = got_plt - plt;
+	u32 hi20 = (offset + 0x800) & 0xfffff000;
+	u32 lo12 = (offset - hi20);
+
+	return (struct plt_entry) {
+		OPC_AUIPC | (REG_T0 << 7) | hi20,
+		OPC_LD | (lo12 << 20) | (REG_T0 << 15) | (REG_T1 << 7),
+		OPC_JALR | (REG_T1 << 15)
+	};
+}
+
+static int get_got_plt_idx(unsigned long val, const struct mod_section *sec)
+{
+	struct got_entry *got_plt = (struct got_entry *)sec->shdr->sh_addr;
+	int i;
+
+	for (i = 0; i < sec->num_entries; i++) {
+		if (got_plt[i].symbol_addr == val)
+			return i;
+	}
+	return -1;
+}
+
+static struct plt_entry *get_plt_entry(unsigned long val,
+				       const struct mod_section *sec_plt,
+				       const struct mod_section *sec_got_plt)
+{
+	struct plt_entry *plt = (struct plt_entry *)sec_plt->shdr->sh_addr;
+	int got_plt_idx = get_got_plt_idx(val, sec_got_plt);
+
+	if (got_plt_idx >= 0)
+		return plt + got_plt_idx;
+	else
+		return NULL;
+}
+
 unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
 {
 	struct mod_section *got_plt_sec = &mod->arch.got_plt;
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
