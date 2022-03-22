Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E649C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8i6p9mYkcwTP1DllJvawSHlFxL2kvln+yKV8UXukxtU=; b=b4MxwsaAwyJpZC
	lotSyAeIrH1zW+B8eRoBgn/zSLRyJqycWG/gTc9NNGG4xZycEUiG6AdAy/zude/seaVakDjFOTNJ8
	PBBkWK9QxfKfc4L+CD4870RI8pnJW7WeAAJphNaUAsXF5YiF9vWE8fGyvrb/9R6SFRxE7H/YY3Q6D
	Kz7t/ESzgfGTmUPse0mMp2WtgWZQK3w3PAUhjn68bXvza7biRgyoVt7ZHGWLKtqaNTKnMzJCIbmc3
	vaLBYI+KRkdo3BzPkUD3cHMttM90gWvlVNnWNqEcbSUKKGCzOC/NwrUGm8F6G5nEqrzuManfEsr4s
	vPKhrxxM6D823rj8DX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWfrS-00BN4n-SF; Tue, 22 Mar 2022 14:51:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWfhl-00BHYV-6D; Tue, 22 Mar 2022 14:41:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 12453B81D07;
 Tue, 22 Mar 2022 14:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2B2C340EC;
 Tue, 22 Mar 2022 14:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647960104;
 bh=0gzQGGxdHWRt9A+64eem+dLQzBOPjB9Pfn9kxqzAZaI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CpikaUWuQt56x1sx9EXwKtcq6scEeta+u7wRO4aGANqT0USCNDCqzgJnWqma8zQjw
 DaeEWdV/uqRzKCRUqcq+/UScLNmBwObdYenLG0hwjuUu5ttah1dXGhFKt2hWfPNNBo
 KDe6xISHwnDIwgW8bz8Y3ZPqJ9cM+Xw+ygmkd+1E1Rgnw086H1yWIfs3+0mSCqIjeI
 o5/mcKdoW0rO8xKkD3IBVBFhNNRkNhWbDBsY6uynB6zKvLeUV/6992AZlzG5dRDHdh
 9tABuHiGzLThbMFH45ixkzChZ3afonhVK7Bv/ZBhiixYpGsF0xR8Dq2/N64JpfqXgz
 p6D/p4pQTjmSA==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, hch@lst.de
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, heiko@sntech.de, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V9 14/20] riscv: compat: Add elf.h implementation
Date: Tue, 22 Mar 2022 22:39:57 +0800
Message-Id: <20220322144003.2357128-15-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322144003.2357128-1-guoren@kernel.org>
References: <20220322144003.2357128-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_074149_551666_6393C2FD 
X-CRM114-Status: GOOD (  15.36  )
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
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/elf.h | 41 +++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index f53c40026c7a..a234656cfb5d 100644
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
@@ -90,4 +110,23 @@ do {							\
 		*(struct user_regs_struct *)regs;	\
 } while (0);
 
+#ifdef CONFIG_COMPAT
+
+#define SET_PERSONALITY(ex)					\
+do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)		\
+		set_thread_flag(TIF_32BIT);			\
+	else							\
+		clear_thread_flag(TIF_32BIT);			\
+	if (personality(current->personality) != PER_LINUX32)	\
+		set_personality(PER_LINUX |			\
+			(current->personality & (~PER_MASK)));	\
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
