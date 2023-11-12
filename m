Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24755C4167D
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Exkk7BpnumQvjoJdA07Ff7KVFXQzSAqX2VZqYXxWrN0=; b=zL6h38V76aTJVK
	P8kcPghVwZ+NG36U9ChTTg5pXPj+8NFbICeOH3hq1oNDznvFCOCamD86lKJsbVKkkD2MskapWTjrm
	MZ+LtWUq1c6KRmIizcIujaVb+hMfPIm3L20CUNO/8QGMpRkB/D9bxEG0urFzkoo/o/WwoQeBgRXih
	gtXFLwYS4BylUdwr27l1px0OClHMA/LVkHvUrt6p0riKjWI0ymoReBQAKsS7Gl+swIQwiC6yqsMnG
	0lhbT71gExPfqLo8Lna5ihBsIvTNOgggwDUCDB3SJgsKBPx3jLikbAOCJpfXVTt9ZvHfXPW9nh3CW
	U2FI7VZc+/3765H4UkEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23lf-00BjT0-0J;
	Sun, 12 Nov 2023 06:16:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23lb-00BjR3-0X
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 939A6B80A0C;
	Sun, 12 Nov 2023 06:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22DC5C433CB;
	Sun, 12 Nov 2023 06:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769776;
	bh=vpjhhhUmj1avFAQY8tW0355cR2hNJ8+HWWoICf4M/q4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tbmYH6qvjiwpurPDTM/NhvCyNM0BO9pDMaCHLOgToCuPIYab9D5pj1Pru7s5I5zH3
	 3EZpHOYlEz7SPUvEspv5L+ntRZzc7Cu9pkMJ7kLCXZ9h7PQd63b+UeUidrdSN0WSkA
	 6dHdTp7ipXNS/ZSQxbnuETUSCx/kEpXc9VvNk5zEb/oy5uSCt/XZXQECJEiy1sa94Z
	 4yz6iD4zm0oOVHE+huuWTqa705yDUvTwkqHE/b/egrGTwu28FeR2kvixkaS9B8y2Wp
	 v/asfaAmxC6JFNBTJpFBH/S61flYt5GgQ2C0+pM4/xWWLkKohmzBOlpE17LyUP/1MO
	 jXud+VjwKISQQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 08/38] riscv: u64ilp32: Adjust vDSO alternative for 64ilp32 abi
Date: Sun, 12 Nov 2023 01:14:44 -0500
Message-Id: <20231112061514.2306187-9-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221619_497568_348E60CF 
X-CRM114-Status: GOOD (  11.21  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The 64ilp32 uses the same ELF32 as 32ilp32 and the 64lp64 uses ELF64, so
separate apply_vdso_alternatives into 64 and 32 versions and serve for
three kinds of vDSO - vdso32, vdso64, vdso64ilp32.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/module.h | 30 ++++++++++++++++++++++
 arch/riscv/kernel/alternative.c | 45 ++++++++++++++++++++++++---------
 2 files changed, 63 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
index 0f3baaa6a9a8..9f556435a1a4 100644
--- a/arch/riscv/include/asm/module.h
+++ b/arch/riscv/include/asm/module.h
@@ -127,4 +127,34 @@ static inline const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
 	return NULL;
 }
 
+static inline const Elf64_Shdr *find_section64(const Elf64_Ehdr *hdr,
+					       const Elf64_Shdr *sechdrs,
+					       const char *name)
+{
+	const Elf64_Shdr *s, *se;
+	const char *secstrs = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
+
+	for (s = sechdrs, se = sechdrs + hdr->e_shnum; s < se; s++) {
+		if (strcmp(name, secstrs + s->sh_name) == 0)
+			return s;
+	}
+
+	return NULL;
+}
+
+static inline const Elf32_Shdr *find_section32(const Elf32_Ehdr *hdr,
+					       const Elf32_Shdr *sechdrs,
+					       const char *name)
+{
+	const Elf32_Shdr *s, *se;
+	const char *secstrs = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
+
+	for (s = sechdrs, se = sechdrs + hdr->e_shnum; s < se; s++) {
+		if (strcmp(name, secstrs + s->sh_name) == 0)
+			return s;
+	}
+
+	return NULL;
+}
+
 #endif /* _ASM_RISCV_MODULE_H */
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 73a2d7533806..ab9eb42a5502 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -181,17 +181,40 @@ static void __init_or_module _apply_alternatives(struct alt_entry *begin,
 				stage);
 }
 
-#ifdef CONFIG_MMU
-static void __init apply_vdso_alternatives(void *vdso_start)
+#ifdef CONFIG_VDSO64
+static void __init apply_vdso_alternatives64(void *vdso_start)
 {
-	const Elf_Ehdr *hdr;
-	const Elf_Shdr *shdr;
-	const Elf_Shdr *alt;
+	const Elf64_Ehdr *hdr;
+	const Elf64_Shdr *shdr;
+	const Elf64_Shdr *alt;
 	struct alt_entry *begin, *end;
 
-	hdr = (Elf_Ehdr *)vdso_start;
+	hdr = (Elf64_Ehdr *)vdso_start;
 	shdr = (void *)hdr + hdr->e_shoff;
-	alt = find_section(hdr, shdr, ".alternative");
+	alt = find_section64(hdr, shdr, ".alternative");
+	if (!alt)
+		return;
+
+	begin = (void *)hdr + alt->sh_offset,
+	end = (void *)hdr + alt->sh_offset + alt->sh_size,
+
+	_apply_alternatives((struct alt_entry *)begin,
+			    (struct alt_entry *)end,
+			    RISCV_ALTERNATIVES_BOOT);
+}
+#endif
+
+#if IS_ENABLED(CONFIG_VDSO32) || IS_ENABLED(CONFIG_VDSO64ILP32)
+static void __init apply_vdso_alternatives32(void *vdso_start)
+{
+	const Elf32_Ehdr *hdr;
+	const Elf32_Shdr *shdr;
+	const Elf32_Shdr *alt;
+	struct alt_entry *begin, *end;
+
+	hdr = (Elf32_Ehdr *)vdso_start;
+	shdr = (void *)hdr + hdr->e_shoff;
+	alt = find_section32(hdr, shdr, ".alternative");
 	if (!alt)
 		return;
 
@@ -202,8 +225,6 @@ static void __init apply_vdso_alternatives(void *vdso_start)
 			    (struct alt_entry *)end,
 			    RISCV_ALTERNATIVES_BOOT);
 }
-#else
-static void __init apply_vdso_alternatives(void *vdso_start) { }
 #endif
 
 void __init apply_boot_alternatives(void)
@@ -217,13 +238,13 @@ void __init apply_boot_alternatives(void)
 			    RISCV_ALTERNATIVES_BOOT);
 
 #ifdef CONFIG_VDSO64
-	apply_vdso_alternatives(vdso64_start);
+	apply_vdso_alternatives64(vdso64_start);
 #endif
 #ifdef CONFIG_VDSO32
-	apply_vdso_alternatives(vdso32_start);
+	apply_vdso_alternatives32(vdso32_start);
 #endif
 #ifdef CONFIG_VDSO64ILP32
-	apply_vdso_alternatives(vdso64ilp32_start);
+	apply_vdso_alternatives32(vdso64ilp32_start);
 #endif
 
 }
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
