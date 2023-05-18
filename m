Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A04C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQBH+jfJatgddCDG5N9n0baUhQT2B2L7UXG+N254ym4=; b=3f1HE4bfazzXdC
	H2G/hiJWZLyFhgUDTimKlP6i6cMCdWlevLE6uKlj7Jlv0IxGblfshzZM8ji3W/WlFwxJy2YEayc18
	1pqwVOEocuenDSHjsl2O/GAiTPBV7lUSq43DUUa9IJvxeZawpcm0gRlnxzZLQB3DVI+I/XZw1xPRj
	CZNMeU+BL3/zhFLMRbOhxyRbfWgZmQdf0RZklXkszm9zbgHEXVLtWn+WQmEVd4nk9lW97C1GUb1G/
	PxKDlFOV5Chix5ByA2P2TDwucVieRwMUAv/RVGd83+bJf7RVrG7uZ3lLOqcUhkpZ52X1pGEAKLT7s
	Ti/y5VagSQY6bWla7bMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhl2-00Dihs-0I;
	Thu, 18 May 2023 17:49:44 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhky-00Dig6-2j
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 17:49:43 +0000
X-QQ-mid: bizesmtp88t1684432135tfx7wokx
Received: from linux-lab-host.localdomain ( [119.123.131.162])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 May 2023 01:48:53 +0800 (CST)
X-QQ-SSF: 01200000000000C0V000000A0000000
X-QQ-FEAT: hHcwae2JLGfuH8pmxr66niirhO9FN85Q4020z1tNLbFaepfrIsOmZXfQnsS1P
	O5/kioeDklqs33OlLwBqAvm/1Dmy/FSSFYiIlndpaLd8Omw4szDLq7PPWwBsiBUiY98QYGr
	Qips6s96IGh8ZacoJWQ11+gU9tZxC46fHpEjF6nLWT8xDzOCEp+uUyeS9/tTxVN7qebyo/q
	mqDTS+BK52JsyVi5pdWqySzRGqHIuykuDrtKaLqbILscfIGLckCcAVoFuuGxb5AEoCqExBv
	V9NRHkFhhTx33dPevbm6A/KxEtJE7MDblTBt38EmmR65fX1a4aOLyjtXiCkQceeUOAA4O6U
	KzfjKEZXc3cnDOU2UBwB6UcuAo20TreR+GO1CAQhcfcU0vAXlXUep8JoZ0uDg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11788321050331074283
From: Zhangjin Wu <falcon@tinylab.org>
To: Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	Zhangjin Wu <falcon@tinylab.org>
Subject: [RFC PATCH 1/1] riscv: add Kconfig.vdso
Date: Fri, 19 May 2023 01:48:52 +0800
Message-Id: <95c2e86acbcaf8966251a471997b3f0cd3c64fbd.1684430522.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1684430522.git.falcon@tinylab.org>
References: <cover.1684430522.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_104941_185248_C0EAFDBD 
X-CRM114-Status: GOOD (  21.58  )
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

Allow users to disable the vdso and compat vdso in Kconfig.

Copied and adapted some code from arm and arm64.

Size measured with a small rv64 config of v6.4-rc2:

            Config | Size      | Shrink
    ---------------|-----------|--------
           default | 1588 KB   |
    no compat vdso | 1584 KB   | -4 KB
     (and) no vdso | 1576 KB   | -12 KB

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 arch/riscv/Kconfig                |  6 +-----
 arch/riscv/Kconfig.vdso           | 28 ++++++++++++++++++++++++++++
 arch/riscv/Makefile               |  8 +++++---
 arch/riscv/include/asm/elf.h      |  6 ++++--
 arch/riscv/include/asm/mmu.h      |  2 ++
 arch/riscv/include/asm/vdso.h     |  8 ++++----
 arch/riscv/kernel/Makefile        |  4 ++--
 arch/riscv/kernel/alternative.c   |  2 +-
 arch/riscv/kernel/compat_signal.c |  2 ++
 arch/riscv/kernel/entry.S         |  2 +-
 arch/riscv/kernel/signal.c        |  4 ++--
 arch/riscv/kernel/sys_riscv.c     |  2 +-
 arch/riscv/kernel/vdso.c          | 10 +++++-----
 13 files changed, 58 insertions(+), 26 deletions(-)
 create mode 100644 arch/riscv/Kconfig.vdso

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 348c0fa1fc8c..79a6b3f1e697 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -34,7 +34,6 @@ config RISCV
 	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
-	select ARCH_HAS_VDSO_DATA
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
@@ -63,7 +62,6 @@ config RISCV
 	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
 	select GENERIC_EARLY_IOREMAP
 	select GENERIC_ENTRY
-	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IOREMAP if MMU
 	select GENERIC_IRQ_IPI if SMP
@@ -76,8 +74,6 @@ config RISCV
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
-	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
-	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT if MMU
 	select HAVE_ARCH_AUDITSYSCALL
@@ -105,7 +101,6 @@ config RISCV
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_GCC_PLUGINS
-	select HAVE_GENERIC_VDSO if MMU && 64BIT
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
@@ -262,6 +257,7 @@ config RISCV_DMA_NONCOHERENT
 config AS_HAS_INSN
 	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
 
+source "arch/riscv/Kconfig.vdso"
 source "arch/riscv/Kconfig.socs"
 source "arch/riscv/Kconfig.errata"
 
diff --git a/arch/riscv/Kconfig.vdso b/arch/riscv/Kconfig.vdso
new file mode 100644
index 000000000000..3c7ec638361d
--- /dev/null
+++ b/arch/riscv/Kconfig.vdso
@@ -0,0 +1,28 @@
+menu "VDSO selection"
+	depends on MMU
+
+config VDSO
+	bool "Enable VDSO for acceleration of some system calls" if EXPERT
+	default y
+	select HAVE_GENERIC_VDSO if 64BIT
+	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
+	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
+	select GENERIC_TIME_VSYSCALL if 64BIT
+	select ARCH_HAS_VDSO_DATA
+	help
+	  Place in the process address space an ELF shared object
+	  providing fast implementations of gettimeofday and
+	  clock_gettime.
+
+config COMPAT_VDSO
+	bool "Enable vDSO for 32-bit applications" if EXPERT
+	default y
+	depends on VDSO
+	depends on COMPAT
+	select GENERIC_COMPAT_VDSO
+	help
+	  Place in the process address space of 32-bit applications an
+	  ELF shared object providing fast implementations of gettimeofday
+	  and clock_gettime.
+
+endmenu # "VDSO selection"
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0fb256bf8270..6aa32e83f812 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -130,18 +130,20 @@ endif
 libs-y += arch/riscv/lib/
 libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
 
+ifeq ($(CONFIG_VDSO),y)
 PHONY += vdso_install
 vdso_install:
 	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
-	$(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
+	$(if $(CONFIG_COMPAT_VDSO),$(Q)$(MAKE) \
 		$(build)=arch/riscv/kernel/compat_vdso compat_$@)
+endif
 
 ifeq ($(KBUILD_EXTMOD),)
-ifeq ($(CONFIG_MMU),y)
+ifeq ($(CONFIG_VDSO),y)
 prepare: vdso_prepare
 vdso_prepare: prepare0
 	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso include/generated/vdso-offsets.h
-	$(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
+	$(if $(CONFIG_COMPAT_VDSO),$(Q)$(MAKE) \
 		$(build)=arch/riscv/kernel/compat_vdso include/generated/compat_vdso-offsets.h)
 
 endif
diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 30e7d2455960..e67ed2696f23 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -78,7 +78,7 @@ extern unsigned long elf_hwcap;
 
 #define COMPAT_ELF_PLATFORM	(NULL)
 
-#ifdef CONFIG_MMU
+#ifdef CONFIG_VDSO
 #define ARCH_DLINFO						\
 do {								\
 	/*							\
@@ -110,7 +110,7 @@ do {								\
 struct linux_binprm;
 extern int arch_setup_additional_pages(struct linux_binprm *bprm,
 	int uses_interp);
-#endif /* CONFIG_MMU */
+#endif /* CONFIG_VDSO */
 
 #define ELF_CORE_COPY_REGS(dest, regs)			\
 do {							\
@@ -136,10 +136,12 @@ do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)		\
 typedef compat_ulong_t			compat_elf_greg_t;
 typedef compat_elf_greg_t		compat_elf_gregset_t[ELF_NGREG];
 
+#ifdef CONFIG_COMPAT_VDSO
 extern int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
 					      int uses_interp);
 #define compat_arch_setup_additional_pages \
 				compat_arch_setup_additional_pages
+#endif
 
 #endif /* CONFIG_COMPAT */
 #endif /* _ASM_RISCV_ELF_H */
diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index 0099dc116168..8e88e81fcc32 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -15,7 +15,9 @@ typedef struct {
 #else
 	atomic_long_t id;
 #endif
+#ifdef CONFIG_VDSO
 	void *vdso;
+#endif
 #ifdef CONFIG_SMP
 	/* A local icache flush is needed before user execution can resume. */
 	cpumask_t icache_stale_mask;
diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index f891478829a5..a4cedac5bdc9 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -12,7 +12,7 @@
  * All systems with an MMU have a VDSO, but systems without an MMU don't
  * support shared libraries and therefore don't have one.
  */
-#ifdef CONFIG_MMU
+#ifdef CONFIG_VDSO
 
 #define __VVAR_PAGES    2
 
@@ -22,7 +22,7 @@
 #define VDSO_SYMBOL(base, name)							\
 	(void __user *)((unsigned long)(base) + __vdso_##name##_offset)
 
-#ifdef CONFIG_COMPAT
+#ifdef CONFIG_COMPAT_VDSO
 #include <generated/compat_vdso-offsets.h>
 
 #define COMPAT_VDSO_SYMBOL(base, name)						\
@@ -30,12 +30,12 @@
 
 extern char compat_vdso_start[], compat_vdso_end[];
 
-#endif /* CONFIG_COMPAT */
+#endif /* CONFIG_COMPAT_VDSO */
 
 extern char vdso_start[], vdso_end[];
 
 #endif /* !__ASSEMBLY__ */
 
-#endif /* CONFIG_MMU */
+#endif /* CONFIG_VDSO */
 
 #endif /* _ASM_RISCV_VDSO_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index fbdccc21418a..0bc4eb093e47 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -52,7 +52,7 @@ obj-y	+= stacktrace.o
 obj-y	+= cacheinfo.o
 obj-y	+= patch.o
 obj-y	+= probes/
-obj-$(CONFIG_MMU) += vdso.o vdso/
+obj-$(CONFIG_VDSO) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
@@ -89,6 +89,6 @@ obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 obj-$(CONFIG_EFI)		+= efi.o
 obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
 obj-$(CONFIG_COMPAT)		+= compat_signal.o
-obj-$(CONFIG_COMPAT)		+= compat_vdso/
+obj-$(CONFIG_COMPAT_VDSO)	+= compat_vdso/
 
 obj-$(CONFIG_64BIT)		+= pi/
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 6b75788c18e6..16e9a10e24b4 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -181,7 +181,7 @@ static void __init_or_module _apply_alternatives(struct alt_entry *begin,
 				stage);
 }
 
-#ifdef CONFIG_MMU
+#ifdef CONFIG_VDSO
 static void __init apply_vdso_alternatives(void)
 {
 	const Elf_Ehdr *hdr;
diff --git a/arch/riscv/kernel/compat_signal.c b/arch/riscv/kernel/compat_signal.c
index 6ec4e34255a9..9405880b1df6 100644
--- a/arch/riscv/kernel/compat_signal.c
+++ b/arch/riscv/kernel/compat_signal.c
@@ -217,8 +217,10 @@ int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	if (err)
 		return -EFAULT;
 
+#ifdef CONFIG_COMPAT_VDSO
 	regs->ra = (unsigned long)COMPAT_VDSO_SYMBOL(
 			current->mm->context.vdso, rt_sigreturn);
+#endif
 
 	/*
 	 * Set up registers for signal handler.
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 3fbb100bc9e4..11c5e6edae3c 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -345,7 +345,7 @@ SYM_CODE_START(excp_vect_table)
 excp_vect_table_end:
 SYM_CODE_END(excp_vect_table)
 
-#ifndef CONFIG_MMU
+#ifndef CONFIG_VDSO
 SYM_CODE_START(__user_rt_sigreturn)
 	li a7, __NR_rt_sigreturn
 	scall
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 9aff9d720590..bb8ee87ae28f 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -29,7 +29,7 @@ extern u32 __user_rt_sigreturn[2];
 struct rt_sigframe {
 	struct siginfo info;
 	struct ucontext uc;
-#ifndef CONFIG_MMU
+#ifndef CONFIG_VDSO
 	u32 sigreturn_code[2];
 #endif
 };
@@ -201,7 +201,7 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 		return -EFAULT;
 
 	/* Set up to return from userspace. */
-#ifdef CONFIG_MMU
+#ifdef CONFIG_VDSO
 	regs->ra = (unsigned long)VDSO_SYMBOL(
 		current->mm->context.vdso, rt_sigreturn);
 #else
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 5db29683ebee..8691bc8d247b 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -246,7 +246,7 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
 	return 0;
 }
 
-#ifdef CONFIG_MMU
+#ifdef CONFIG_VDSO
 
 static int __init init_hwprobe_vdso_data(void)
 {
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 9a68e7eaae4d..8a4cb4e4bd8b 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -50,7 +50,7 @@ struct __vdso_info {
 };
 
 static struct __vdso_info vdso_info;
-#ifdef CONFIG_COMPAT
+#ifdef CONFIG_COMPAT_VDSO
 static struct __vdso_info compat_vdso_info;
 #endif
 
@@ -115,7 +115,7 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
 	for_each_vma(vmi, vma) {
 		if (vma_is_special_mapping(vma, vdso_info.dm))
 			zap_vma_pages(vma);
-#ifdef CONFIG_COMPAT
+#ifdef CONFIG_COMPAT_VDSO
 		if (vma_is_special_mapping(vma, compat_vdso_info.dm))
 			zap_vma_pages(vma);
 #endif
@@ -179,7 +179,7 @@ static struct __vdso_info vdso_info __ro_after_init = {
 	.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO],
 };
 
-#ifdef CONFIG_COMPAT
+#ifdef CONFIG_COMPAT_VDSO
 static struct vm_special_mapping rv_compat_vdso_maps[] __ro_after_init = {
 	[RV_VDSO_MAP_VVAR] = {
 		.name   = "[vvar]",
@@ -203,7 +203,7 @@ static struct __vdso_info compat_vdso_info __ro_after_init = {
 static int __init vdso_init(void)
 {
 	__vdso_init(&vdso_info);
-#ifdef CONFIG_COMPAT
+#ifdef CONFIG_COMPAT_VDSO
 	__vdso_init(&compat_vdso_info);
 #endif
 
@@ -254,7 +254,7 @@ static int __setup_additional_pages(struct mm_struct *mm,
 	return PTR_ERR(ret);
 }
 
-#ifdef CONFIG_COMPAT
+#ifdef CONFIG_COMPAT_VDSO
 int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
 				       int uses_interp)
 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
