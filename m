Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5C1C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 16:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahcNu2AiHdm4U4w5kg9AgU2HvNQjyuVTmRAlUYvl2aY=; b=BORS8xYvgv2xPl
	L6d+XAkW8bE4385Rmukmj0WfvtURIP47cC03+S73whKMjF/8Qd6+i8UyJpA4nHruDVfCCmJqBQ4hf
	Q01qoKaU0cORC0KM3SmfOGlnppFFZU4olKyc4yhb+NqugdAXNn+i1glL6XkE1ubz80OUg4lpOkeix
	yruoCY8CKNvJcZAtYZaVFS2s4sB47Ys8r5EzCa9rOwVHF6AetDANCxd7JfWw1Clz/WNr3Z5jSKBSz
	C2RXyww8oow+RmoEPl/BPXE7QfnI7noPibw+VHDsCqQAJhauCSP2MHVbGb5mG+YyLULDnitlpu8G3
	MHxquj2+yH27/y4JRCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzi7g-007a7S-H5; Tue, 21 Dec 2021 16:36:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzi7c-007a3u-6r
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 16:36:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A230A6167F;
 Tue, 21 Dec 2021 16:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31437C36AFC;
 Tue, 21 Dec 2021 16:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640104575;
 bh=P1KXPJVc0uF2McVIgYSbKY226nQDQV6xLJ8uZLP12bI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lvRwFBKj3auRlx0iE8ICGY/OVB+2bgk2t9YAsnSYjaIzrKXLHkaYoY/pIRJpsD0nh
 bsJlB5c+vXbAlK8qzfdrIqxTibubgaIxUExYfekObkEKDTqqHhbE/w3wTWTLLzzai1
 /8wCw1F4h5GE78DRC7X5zUD+Ix1dopEoamsT8pDyxDCvhRDKCc1Lf+qaIm6yjB6loD
 vu1PZGzGBQlNTMhqjcMlLzxRwXGD9ZwcDcuhBppO6DA5BoMHQsxeIBnydEF72nD6hA
 QllFYYGTxrzSycp9hqIu+78ZlsACiwaMYCMvGke6rvzpSOPQAgvMTYvSsecc5f3W9p
 wG4PQtpD0oqoQ==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup.patel@wdc.com,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 07/13] riscv: compat: Add elf.h implementation
Date: Wed, 22 Dec 2021 00:35:26 +0800
Message-Id: <20211221163532.2636028-8-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221163532.2636028-1-guoren@kernel.org>
References: <20211221163532.2636028-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_083616_356083_C488BCA4 
X-CRM114-Status: GOOD (  14.57  )
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

Implement necessary type and macro for compat elf. See the code
comment for detail.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/include/asm/elf.h | 42 +++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index f53c40026c7a..48c116f3c12d 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -8,6 +8,8 @@
 #ifndef _ASM_RISCV_ELF_H
 #define _ASM_RISCV_ELF_H
 
+#include <uapi/linux/elf.h>
+#include <linux/compat.h>
 #include <uapi/asm/elf.h>
 #include <asm/auxvec.h>
 #include <asm/byteorder.h>
@@ -18,11 +20,13 @@
  */
 #define ELF_ARCH	EM_RISCV
 
+#ifndef ELF_CLASS
 #ifdef CONFIG_64BIT
 #define ELF_CLASS	ELFCLASS64
 #else
 #define ELF_CLASS	ELFCLASS32
 #endif
+#endif
 
 #define ELF_DATA	ELFDATA2LSB
 
@@ -31,6 +35,8 @@
  */
 #define elf_check_arch(x) ((x)->e_machine == EM_RISCV)
 
+#define compat_elf_check_arch(x) ((x)->e_machine == EM_RISCV)
+
 #define CORE_DUMP_USE_REGSET
 #define ELF_EXEC_PAGESIZE	(PAGE_SIZE)
 
@@ -43,8 +49,14 @@
 #define ELF_ET_DYN_BASE		((TASK_SIZE / 3) * 2)
 
 #ifdef CONFIG_64BIT
+#ifdef CONFIG_COMPAT
+#define STACK_RND_MASK		(test_thread_flag(TIF_32BIT) ? \
+				 0x7ff >> (PAGE_SHIFT - 12) : \
+				 0x3ffff >> (PAGE_SHIFT - 12))
+#else
 #define STACK_RND_MASK		(0x3ffff >> (PAGE_SHIFT - 12))
 #endif
+#endif
 /*
  * This yields a mask that user programs can use to figure out what
  * instruction set this CPU supports.  This could be done in user space,
@@ -60,11 +72,19 @@ extern unsigned long elf_hwcap;
  */
 #define ELF_PLATFORM	(NULL)
 
+#define COMPAT_ELF_PLATFORM	(NULL)
+
 #ifdef CONFIG_MMU
 #define ARCH_DLINFO						\
 do {								\
+	/*							\
+	 * Note that we add ulong after elf_addr_t because	\
+	 * casting current->mm->context.vdso triggers a cast	\
+	 * warning of cast from pointer to integer for		\
+	 * COMPAT ELFCLASS32.					\
+	 */							\
 	NEW_AUX_ENT(AT_SYSINFO_EHDR,				\
-		(elf_addr_t)current->mm->context.vdso);		\
+		(elf_addr_t)(ulong)current->mm->context.vdso);	\
 	NEW_AUX_ENT(AT_L1I_CACHESIZE,				\
 		get_cache_size(1, CACHE_TYPE_INST));		\
 	NEW_AUX_ENT(AT_L1I_CACHEGEOMETRY,			\
@@ -90,4 +110,24 @@ do {							\
 		*(struct user_regs_struct *)regs;	\
 } while (0);
 
+#ifdef CONFIG_COMPAT
+
+/*
+ * FIXME: not sure SET_PERSONALITY for compat process is right!
+ */
+#define SET_PERSONALITY(ex)						   \
+do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)			   \
+		set_thread_flag(TIF_32BIT);				   \
+	else								   \
+		clear_thread_flag(TIF_32BIT);				   \
+	set_personality(PER_LINUX | (current->personality & (~PER_MASK))); \
+} while (0)
+
+#define COMPAT_ELF_ET_DYN_BASE		((TASK_SIZE_32 / 3) * 2)
+
+/* rv32 registers */
+typedef compat_ulong_t			compat_elf_greg_t;
+typedef compat_elf_greg_t		compat_elf_gregset_t[ELF_NGREG];
+
+#endif /* CONFIG_COMPAT */
 #endif /* _ASM_RISCV_ELF_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
