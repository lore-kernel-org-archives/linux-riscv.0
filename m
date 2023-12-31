Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07428C47074
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Dec 2023 08:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3AK+Rfe0a6APib8C49Q65h4KA6ETquepn2S3ek4Fvo=; b=U7ujefN9i56en9
	8FSyW/ey0M4Bbc3JCajn8Xl+62NmcE08a0xuM3xWFIDOT/KkXARji0QYTW8ULu5RqkjijfmyKHSfe
	X+mU/RG4CZe8/IZtGztrW9sqC824r8Sftzh1k/7IyX9f+gzyJ/mGZKgjSPzJ6g9nwxANgWuqPKSbc
	1DUpopzXHnK4uCEcDgY5nlnNXXUe30qdsjZzc4zglNaUoykyXsFFsoflLBeS+sW/Vg9nDQcQPZqE6
	xQ8h9Bign3F/jHLMf5gbSklvSBJ6wydegJcZ8rfyYLAMxWc+kEvsNWCotYDnnDsLINSz3tjxeX8Dp
	0aLBRUNxILrbjdysgisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJrDC-004E5i-39;
	Sun, 31 Dec 2023 08:30:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJrDA-004E3x-31
	for linux-riscv@lists.infradead.org;
	Sun, 31 Dec 2023 08:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E076C60C8C;
	Sun, 31 Dec 2023 08:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8B8C433C7;
	Sun, 31 Dec 2023 08:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704011418;
	bh=D6VXuRwAKv9dO+mNmqMLcBG3Fo8hoXZOx0qi+4o2+wM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pV/cfNnlutV5oJo3GVEF+qPX7SM5xqctJKNU2amJ7TJU4IOiq3JWRgdUT3zEA+zi6
	 yA+d+w+GWovK1mBnqsKKPAxRFaGoEXNANQwL9/HeB2MfY2USxVQhZJ8gxA11tPd/ue
	 ATpwZ1PQR5TOJg2o5rIlKdnu3JGH35NPy7eQ+GPyknwR0xYo7c8BwjD5fehnihnKCX
	 T02m2Cg1NosuM5VC+Kz+A4jl4He+Eq8Jc6iqdT4m572jiZKEeAE+S8eMqhezNpsHe8
	 dHtKfAfC7klMoG5W7b00l4uXr43yVa8nE9paBEU8WFl2azCTQsVJosZ64QKwWKcfAX
	 iJLa9KiKs6u5w==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	panqinglin2020@iscas.ac.cn,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	leobras@redhat.com,
	peterz@infradead.org,
	keescook@chromium.org,
	wuwei2016@iscas.ac.cn,
	xiaoguang.xing@sophgo.com,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	uwu@icenowy.me,
	jszhang@kernel.org,
	wefu@redhat.com,
	atishp@atishpatra.org,
	ajones@ventanamicro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 2/3] riscv: Add ARCH_HAS_PRETCHW support with Zibop
Date: Sun, 31 Dec 2023 03:29:52 -0500
Message-Id: <20231231082955.16516-3-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231231082955.16516-1-guoren@kernel.org>
References: <20231231082955.16516-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231231_003021_014023_4EB3A533 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
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

Enable Linux prefetchw primitive with Zibop cpufeature, which preloads
cache line into L1 cache for the next write operation.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/processor.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f19f861cda54..8d3a2ab37678 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -13,6 +13,9 @@
 #include <vdso/processor.h>
 
 #include <asm/ptrace.h>
+#include <asm/insn-def.h>
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
 
 #ifdef CONFIG_64BIT
 #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
@@ -106,6 +109,19 @@ static inline void arch_thread_struct_whitelist(unsigned long *offset,
 #define KSTK_EIP(tsk)		(task_pt_regs(tsk)->epc)
 #define KSTK_ESP(tsk)		(task_pt_regs(tsk)->sp)
 
+#ifdef CONFIG_RISCV_ISA_ZICBOP
+#define ARCH_HAS_PREFETCHW
+
+#define PREFETCHW_ASM(x)						\
+	ALTERNATIVE(__nops(1), CBO_PREFETCH_W(x, 0), 0,			\
+		    RISCV_ISA_EXT_ZICBOP, CONFIG_RISCV_ISA_ZICBOP)
+
+
+static inline void prefetchw(const void *x)
+{
+	__asm__ __volatile__(PREFETCHW_ASM(%0) : : "r" (x) : "memory");
+}
+#endif /* CONFIG_RISCV_ISA_ZICBOP */
 
 /* Do necessary setup to start up a newly executed thread. */
 extern void start_thread(struct pt_regs *regs,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
