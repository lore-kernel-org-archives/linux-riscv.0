Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89649C433E1
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 07:29:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 595A020767
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 07:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cba2Muiz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSI/Rgh1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 595A020767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7iAsS3S/elLRdN2Xe5PkcyTBIYvSJZ8UdVw6TH5SNU=; b=Cba2MuizGe5XFC3uQCPxlXMSJs
	9c8TwbQqNc+rHsoGRY8uWcLCRDvzPntFibmnc4WiI6nU6RmV35TEBK3kbDDyEazPiyOi1i3YblH3B
	+FNuzt2TIMNLT1oRqKIa1Trv98cbyrsiPt7WtMxANamY97jB5jXVDFmBTORR1gqKysFZ45VsobrL/
	fwg+bM/aY/QhXcddDBJjxx4RT7qjDfl723sKTreXSsrQTtVhGtwDuB7MUxyF1zemC8ia+9fHPSDac
	/c2AZqHqN5H/MT9qtwHn2qZpm3mk6B/MzaiZHvyYaRKGf0MLqyZf7t3fuhlFp8eFwZaQApe+DSiX3
	EV2qHz8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtQzg-0002pg-Nx; Thu, 09 Jul 2020 07:29:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtQzd-0002ol-ST
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 07:29:18 +0000
Received: from localhost.localdomain (unknown [42.120.72.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 024492076A;
 Thu,  9 Jul 2020 07:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594279757;
 bh=sYXGN+ISBs9KPOjbyjpY1q+N4IQd2AK8zDLRacqq5qI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eSI/Rgh1kXZ1HlARWCrzTjim05pipMNwMfy1Uo8UBaJtpTBEOuNgOgMv0T/c2e8PC
 nCT+cTy8jHaW6SoOUhOnfVQANfKhtZSe0FcLV0aCl4oq4PoZ/Dp5jFoUHM2k9QqkUV
 0/9Xapw2ikat2PVTqylpEqAUOnFvvj71N5xMTJ5I=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, me@packi.ch,
 bjorn.topel@gmail.com, atish.patra@wdc.com
Subject: [PATCH v2 2/2] riscv: Enable per-task stack canaries
Date: Thu,  9 Jul 2020 07:28:17 +0000
Message-Id: <1594279697-72511-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594279697-72511-1-git-send-email-guoren@kernel.org>
References: <1594279697-72511-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_032918_077320_2A168F68 
X-CRM114-Status: GOOD (  15.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, guoren@kernel.org,
 cooper <cooper.qu@linux.alibaba.com>, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

This enables the use of per-task stack canary values if GCC has
support for emitting the stack canary reference relative to the
value of tp, which holds the task struct pointer in the riscv
kernel.

After compare arm64 and x86 implementations, seems arm64's is more
flexible and readable. The key point is how gcc get the offset of
stack_canary from gs/el0_sp.

x86: Use a fix offset from gs, not flexible.

struct fixed_percpu_data {
	/*
	 * GCC hardcodes the stack canary as %gs:40.  Since the
	 * irq_stack is the object at %gs:0, we reserve the bottom
	 * 48 bytes of the irq stack for the canary.
	 */
	char            gs_base[40]; // :(
	unsigned long   stack_canary;
};

arm64: Use -mstack-protector-guard-offset & guard-reg
	gcc options:
	-mstack-protector-guard=sysreg
	-mstack-protector-guard-reg=sp_el0
	-mstack-protector-guard-offset=xxx

riscv: Use -mstack-protector-guard-offset & guard-reg
	gcc options:
	-mstack-protector-guard=tls
	-mstack-protector-guard-reg=tp
	-mstack-protector-guard-offset=xxx

Here is riscv gcc's work [1].

[1] https://gcc.gnu.org/pipermail/gcc-patches/2020-July/549583.html

In the end, these codes are inserted by gcc before return:

*  0xffffffe00020b396 <+120>:   ld      a5,1008(tp) # 0x3f0
*  0xffffffe00020b39a <+124>:   xor     a5,a5,a4
*  0xffffffe00020b39c <+126>:   mv      a0,s5
*  0xffffffe00020b39e <+128>:   bnez    a5,0xffffffe00020b61c <_do_fork+766>
   0xffffffe00020b3a2 <+132>:   ld      ra,136(sp)
   0xffffffe00020b3a4 <+134>:   ld      s0,128(sp)
   0xffffffe00020b3a6 <+136>:   ld      s1,120(sp)
   0xffffffe00020b3a8 <+138>:   ld      s2,112(sp)
   0xffffffe00020b3aa <+140>:   ld      s3,104(sp)
   0xffffffe00020b3ac <+142>:   ld      s4,96(sp)
   0xffffffe00020b3ae <+144>:   ld      s5,88(sp)
   0xffffffe00020b3b0 <+146>:   ld      s6,80(sp)
   0xffffffe00020b3b2 <+148>:   ld      s7,72(sp)
   0xffffffe00020b3b4 <+150>:   addi    sp,sp,144
   0xffffffe00020b3b6 <+152>:   ret
   ...
*  0xffffffe00020b61c <+766>:   auipc   ra,0x7f8
*  0xffffffe00020b620 <+770>:   jalr    -1764(ra) # 0xffffffe000a02f38 <__stack_chk_fail>

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: cooper <cooper.qu@linux.alibaba.com>
Cc: cooper <cooper.qu@linux.alibaba.com>
Cc: Kees Cook <keescook@chromium.org>
---
Change v2:
 - Change to -mstack-protector-guard=tls for gcc final define
 - Solve compile error by changing position of KBUILD_CFLAGS in
   Makefile

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/Kconfig                      |  7 +++++++
 arch/riscv/Makefile                     | 10 ++++++++++
 arch/riscv/include/asm/stackprotector.h |  3 ++-
 arch/riscv/kernel/asm-offsets.c         |  3 +++
 arch/riscv/kernel/process.c             |  2 +-
 5 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4b0e308..d98ce29 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -394,6 +394,13 @@ config CMDLINE_FORCE
 
 endchoice
 
+config CC_HAVE_STACKPROTECTOR_TLS
+	def_bool $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=tp -mstack-protector-guard-offset=0)
+
+config STACKPROTECTOR_PER_TASK
+	def_bool y
+	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_TLS
+
 endmenu
 
 config BUILTIN_DTB
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index fb6e37d..f5f8ee9 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -68,6 +68,16 @@ KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
 # architectures.  It's faster to have GCC emit only aligned accesses.
 KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
 
+ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
+prepare: stack_protector_prepare
+stack_protector_prepare: prepare0
+	$(eval KBUILD_CFLAGS += -mstack-protector-guard=tls		  \
+				-mstack-protector-guard-reg=tp		  \
+				-mstack-protector-guard-offset=$(shell	  \
+			awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}' \
+					include/generated/asm-offsets.h))
+endif
+
 # arch specific predefines for sparse
 CHECKFLAGS += -D__riscv -D__riscv_xlen=$(BITS)
 
diff --git a/arch/riscv/include/asm/stackprotector.h b/arch/riscv/include/asm/stackprotector.h
index 8e1ef2c..bda4d83 100644
--- a/arch/riscv/include/asm/stackprotector.h
+++ b/arch/riscv/include/asm/stackprotector.h
@@ -28,6 +28,7 @@ static __always_inline void boot_init_stack_canary(void)
 	canary &= CANARY_MASK;
 
 	current->stack_canary = canary;
-	__stack_chk_guard = current->stack_canary;
+	if (!IS_ENABLED(CONFIG_STACKPROTECTOR_PER_TASK))
+		__stack_chk_guard = current->stack_canary;
 }
 #endif /* _ASM_RISCV_STACKPROTECTOR_H */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 07cb9c1..999b465 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -29,6 +29,9 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
 	OFFSET(TASK_THREAD_SP, task_struct, thread.sp);
 	OFFSET(TASK_STACK, task_struct, stack);
+#ifdef CONFIG_STACKPROTECTOR
+	OFFSET(TSK_STACK_CANARY, task_struct, stack_canary);
+#endif
 	OFFSET(TASK_TI, task_struct, thread_info);
 	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 6548929..cb4ac65 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -24,7 +24,7 @@
 
 register unsigned long gp_in_global __asm__("gp");
 
-#ifdef CONFIG_STACKPROTECTOR
+#if defined(CONFIG_STACKPROTECTOR) && !defined(CONFIG_STACKPROTECTOR_PER_TASK)
 #include <linux/stackprotector.h>
 unsigned long __stack_chk_guard __read_mostly;
 EXPORT_SYMBOL(__stack_chk_guard);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
