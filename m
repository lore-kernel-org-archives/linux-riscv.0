Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08252C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jan 2022 12:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cAKFeD9eGO3zHedKF6uNY00DpkRqHP8iAMVoeslGms=; b=hJFA53OlrXMa/i
	beCVMETWjcke50CPNrxTNfzjYz33pFgwPKWPjtDQX2n8rGIIb/R+xx5riGBHBBveY3rftvMJBb3jv
	HerLR0HVCnZdi76hdXaUN6Et4S949O4ckIcC9wLCiw38q7v2qFEdoW4RxTvVEK5laGX/cfWBnj1VA
	Pqt+z+Id8+k2K7Wh0WjP3OCWm6dG0mqyhIqfhMuMdu448qhfQDtpj3QGIo8HHiKfz42HMdnO73oTG
	NVrxlTcxX0RfYLAb8sbrlaZxb3IK03m6/8Ne9evG90HRlmQC37lNfnLK2DnHtL6+z92owFgcEpwsa
	z/Hi4N68yXpc6fbh8Yeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDmoB-004gGI-Be; Sat, 29 Jan 2022 12:26:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDmh0-004cNL-Fo; Sat, 29 Jan 2022 12:19:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E77D960C13;
 Sat, 29 Jan 2022 12:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DFAC340F7;
 Sat, 29 Jan 2022 12:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643458737;
 bh=wJY/viP2IX4ozgXZJ3bElNJd5ppud36fV4/PGsPhwmA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NBDnwkyc7CcDA2PVE5uVZaPqgApwiIhf6+Kjo4YZSnL0fcciodrJInWZxy6ELSkwd
 FDRPsbDjlad4EF6A2puffTX3/+LBoFcZoyy9gbksEN3WNFi2gmsPtbhaEai53qNKSt
 h77qJcHY2ih4Is5+7NwKD7BqTxZYh2aUdrTGHE1lNXRianCuhIF7xkjmnIVGKuEvB+
 mSZXdiN9HD7Ibh7Y2W8P017BQn7xuK/xDQ4FbFX3KLya5+Yi7Lh2kmdc3coXg2+x7O
 1lHXylX511RbNy2eJePmR55RMH5ky3z12EOwfj8PZ0vaYqcxuCxtqEwN2hhgtvGtsv
 hDJuMszGaL/CQ==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de,
 hch@infradead.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 11/17] riscv: compat: Add elf.h implementation
Date: Sat, 29 Jan 2022 20:17:22 +0800
Message-Id: <20220129121728.1079364-12-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220129121728.1079364-1-guoren@kernel.org>
References: <20220129121728.1079364-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_041858_623127_BD5E1A8D 
X-CRM114-Status: GOOD (  15.94  )
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
---
 arch/riscv/include/asm/elf.h | 48 +++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index f53c40026c7a..c1fc31629d40 100644
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
 
@@ -31,6 +35,15 @@
  */
 #define elf_check_arch(x) ((x)->e_machine == EM_RISCV)
 
+#ifdef CONFIG_COMPAT
+/*
+ * Use the same code with elf_check_arch, because elf32_hdr &
+ * elf64_hdr e_machine's offset are different. The checker is
+ * a little bit simple compare to other architectures.
+ */
+#define compat_elf_check_arch(x) ((x)->e_machine == EM_RISCV)
+#endif
+
 #define CORE_DUMP_USE_REGSET
 #define ELF_EXEC_PAGESIZE	(PAGE_SIZE)
 
@@ -43,8 +56,14 @@
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
@@ -60,11 +79,19 @@ extern unsigned long elf_hwcap;
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
@@ -90,4 +117,23 @@ do {							\
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
