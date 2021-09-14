Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318D5C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:15:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E46E66113B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E46E66113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHqv9ZgeJsD/hZH1VMlXyENn0v+Ku1FthcWfWi9Y9Jc=; b=oq+g1dIqqPuqaP
	lEDICzuYMACQVxarAUfHWX5I8w+sDR8wDxZvMwzB7kkdWhsf+phAMrJxeW9v06aQSHW/CluiL9Hdj
	Kf4Nxj4TQoqkL3zPIrTHvNzAozh3zTo9MKQvtTKBMBKFIojOtb3GTEJqWehTCs1MfLNeQgj+J5wR4
	rRN9oyb1t/IkwYOawCEoAK7s3OVCiqMFWFr6Yk5RhrWpmOcaBrSItpbk4iG2IulD81rS202SV6NW8
	xmGVoSHnIlflQbq02o1JtSoptXfTsESNCKxjeVC8b+9LMlLFh6B4ShlYb1nnLIFeEq7rHfpthTchz
	lra1xHoDB3IW9dPovFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ7Kw-005axc-1n; Tue, 14 Sep 2021 12:14:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ7HW-005YzH-NR; Tue, 14 Sep 2021 12:11:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1B9061130;
 Tue, 14 Sep 2021 12:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631621482;
 bh=gTE6Maj6qRThpm0j9WlP+9jacEHHOVPzS1LeC09xFzg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sq4xNJYSujytX0giN9tZTKEaOzYD99AoPZb5diJ6v8ZAjwO5L9EID0jPVwA1owf1M
 TUkNBA2g8rKZnUhOWZqFpX4YIsAShnVKKwNDiVXjBuR/tzUEJxrxofKcFpvIX+0irJ
 +JrqZCjv8Mn0uOgKR/MhH1uWWih3JrcuHdrVCFAJU5Sln4k9/Qqo0VgLXkwbpSs4U4
 imre3233wp3Ze4O59wpDEi+UlzgF2CR5ZwoHG0NdUSH8s4hlC16/ymCV3ijg3efUrD
 ri2dJ8UalQ4h3SdQLeA+gTmhy9W6yusoyBSnHFId2k8x9mekBA7KST/0d7RiSOBFcM
 7x18E6ko3mTPQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Keith Packard <keithpac@amazon.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>,
 Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
Subject: [RFC PATCH 6/8] powerpc: smp: remove hack to obtain offset of
 task_struct::cpu
Date: Tue, 14 Sep 2021 14:10:34 +0200
Message-Id: <20210914121036.3975026-7-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914121036.3975026-1-ardb@kernel.org>
References: <20210914121036.3975026-1-ardb@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_051123_003642_881B899F 
X-CRM114-Status: GOOD (  17.78  )
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

Instead of relying on awful hacks to obtain the offset of the cpu field
in struct task_struct, move it back into struct thread_info, which does
not create the same level of circular dependency hell when trying to
include the header file that defines it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/powerpc/Makefile             | 11 -----------
 arch/powerpc/include/asm/smp.h    | 17 +----------------
 arch/powerpc/kernel/asm-offsets.c |  2 --
 3 files changed, 1 insertion(+), 29 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index aa6808e70647..54cad1faa5d0 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -446,17 +446,6 @@ else
 endif
 endif
 
-ifdef CONFIG_SMP
-ifdef CONFIG_PPC32
-prepare: task_cpu_prepare
-
-PHONY += task_cpu_prepare
-task_cpu_prepare: prepare0
-	$(eval KBUILD_CFLAGS += -D_TASK_CPU=$(shell awk '{if ($$2 == "TASK_CPU") print $$3;}' include/generated/asm-offsets.h))
-
-endif # CONFIG_PPC32
-endif # CONFIG_SMP
-
 PHONY += checkbin
 # Check toolchain versions:
 # - gcc-4.6 is the minimum kernel-wide version so nothing required.
diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index 7ef1cd8168a0..007332a4a732 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -87,22 +87,7 @@ int is_cpu_dead(unsigned int cpu);
 /* 32-bit */
 extern int smp_hw_index[];
 
-/*
- * This is particularly ugly: it appears we can't actually get the definition
- * of task_struct here, but we need access to the CPU this task is running on.
- * Instead of using task_struct we're using _TASK_CPU which is extracted from
- * asm-offsets.h by kbuild to get the current processor ID.
- *
- * This also needs to be safeguarded when building asm-offsets.s because at
- * that time _TASK_CPU is not defined yet. It could have been guarded by
- * _TASK_CPU itself, but we want the build to fail if _TASK_CPU is missing
- * when building something else than asm-offsets.s
- */
-#ifdef GENERATING_ASM_OFFSETS
-#define raw_smp_processor_id()		(0)
-#else
-#define raw_smp_processor_id()		(*(unsigned int *)((void *)current + _TASK_CPU))
-#endif
+#define raw_smp_processor_id()		(current_thread_info()->cpu)
 #define hard_smp_processor_id() 	(smp_hw_index[smp_processor_id()])
 
 static inline int get_hard_smp_processor_id(int cpu)
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index e37e4546034e..cc05522f50bf 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -9,8 +9,6 @@
  * #defines from the assembly-language output.
  */
 
-#define GENERATING_ASM_OFFSETS	/* asm/smp.h */
-
 #include <linux/compat.h>
 #include <linux/signal.h>
 #include <linux/sched.h>
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
