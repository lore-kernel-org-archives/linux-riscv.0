Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA87C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 15:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=938o1FKkVKcLU8bJEDvvqKZVS62MxhkyktqsmCLGqk8=; b=HngBzFfdmpatR9
	Frn//kKEZLgtLQTcHk8ULNXAnJNAtvMJZk5HdVcniIb5rLCeO9+NGluS67ryW8JfipBa1cp5P1mNa
	jEH/rS1miUtMDL0oc+AjdgpekB92axqWOaUoGxinSe2Iwwpy/kxry4C4JL0JoP5BKqFDKOhTUBsxf
	/sd6aSkjEjIIIhEMcZ9yRLPKi6dAw87bbmOZytvHzVv2VGh7k/fceIoV6kE6HBYhvB5Cnlxeihzz1
	sB+12QFIuMC4M15DjjYyqi/VJ4S2RTDnWXWfFRDLSgEGeZysYOgYPRo4gPGlm1UuR3DU/SjQYIOr9
	j3t4f34iiN8zx15DTrfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNFzt-001I3r-57; Thu, 24 Feb 2022 15:25:37 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNFzb-001HtX-PM
 for linux-riscv@lists.infradead.org; Thu, 24 Feb 2022 15:25:23 +0000
Received: by mail-ej1-x630.google.com with SMTP id bg10so5132292ejb.4
 for <linux-riscv@lists.infradead.org>; Thu, 24 Feb 2022 07:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YCCLljOzkZTWVhp4UcnxVmYpwCgumhAeXuk5FTxJkB0=;
 b=TiFvJ0dV8oZgGXJzw3d5vMthSlHC7N/ou80D7XIhS6zXizdQQ9fT7xARchhB1K989M
 sqvbYGdOf26hgiJpp0Mmshu/fPhlntJU1t+XNdqJUGxprWcV6ZKCGfykIl0Scgm3fYXC
 rP3b4kAIMhOhIQzbVGd3StT+r0HPCyyI7zELHOkPvFUCOmwX6prXOPCKYWYotiq18VMZ
 MN6C9H9BZaTU1RgKK+J/E4wxu7dvxDDkxc8NO25dyYzV4j6OjvCTgA5/L4Xdr9QnaOng
 pODMwpsmRd5PV+pl4hChgJNgqe8M8Gseg7MFHnKpScIo1ppmyp9OCME/fwKniob97ArX
 18Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YCCLljOzkZTWVhp4UcnxVmYpwCgumhAeXuk5FTxJkB0=;
 b=04XnGvJvYU5VjumTyVI6jQyJaz+8r+pn17Lyy2zzFl6+N27JiRO13VWw31/6WXVxgs
 zgaKYS7Yg5xRXFK3+sEr541Mq+OOvj2t2QgaOBt8MJuICQKsFkL94e5NLZlh1C47SITK
 R7spVc4CNbjTrD1hAG6TwEBiXqUAxV+YQqLWVksTAK7IHMkyCw9KkL3zGPkFHBIkAKYx
 O/2rrAGiwOiZVdyVZTnz0iMYiPdVkmIG1nWIjb2y5SN4MOMp1TG7xrR/eXYT7Zn6BRk7
 qjE2hPJD6+NP+owtrHDnes+5m1SwSRCQ/FtoBL/vI2oLQCl46ybrkWXYYK51/hvj26iE
 2AUw==
X-Gm-Message-State: AOAM531tHmiD41MsEr6yVS0SNwjGz533cntsykUUVQrABpAbV2pgNBiz
 egPIq+8HthMDics+kriPofTvH2vHV4SPUPHW
X-Google-Smtp-Source: ABdhPJzbc4J9AQJ7JJ5b/LrjFjbCOzAT+PXAgLjfQPliRCa02sLFO4rQw8CytIS537W0EB6TGsW2Hg==
X-Received: by 2002:a17:906:aad7:b0:6cc:c9aa:d9ad with SMTP id
 kt23-20020a170906aad700b006ccc9aad9admr2708800ejb.726.1645716318467; 
 Thu, 24 Feb 2022 07:25:18 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id s11sm1509693edt.10.2022.02.24.07.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:25:18 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] riscv: Remove unneeded definitions from asm/module.h
Date: Thu, 24 Feb 2022 16:24:50 +0100
Message-Id: <20220224152456.493365-3-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224152456.493365-1-kernel@esmil.dk>
References: <20220224152456.493365-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_072519_916071_E16107FC 
X-CRM114-Status: GOOD (  19.27  )
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
