Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D793C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 18:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N81z1SKzZ3J0+Wwd63cFjnTgsmSp7naqD5hLJ6csdN0=; b=nwBZ/72Ma/ge5A
	nBEbzvCAmicICAlT6mhu8ue6QJoktKnSHw77HFuXXQrVkr6WTj6rCaiBIsrtoZ9vlpWny5REU/i0k
	sTyAj6Ui9GoQQRdOI0mzjEjmJHXujydLbvfZb+itfPsASx14iwaqnukPBo4MsrdlFU2M9WZSZEG/A
	fa2lohSbnT62itYkbyeI94peCCE7xunS8IrCg0sHwPolmTgXkseTHEUV7WWlVLtJXeGzyAKuwKo5w
	WvJeO8fCERdCfWo2M8DFc0iJCCYkVFOe3MRUYPGe8Ic1VP15lDoe1SyvNvqIJPDFyHtakHKa2uWXU
	5bl+pZi4Uw90AYT2DxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr2K8-00FROP-0M; Tue, 17 May 2022 18:53:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr2K3-00FRMB-6j
 for linux-riscv@lists.infradead.org; Tue, 17 May 2022 18:53:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1422B81BDD;
 Tue, 17 May 2022 18:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A89DC385B8;
 Tue, 17 May 2022 18:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652813608;
 bh=LcIKTyeK4tmxJB9koH8qnVbXxAaq79HYjVBPayYCxz8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iuZ2Q6YsSJiu2DBUdKBu7CSFr2twcCWFoxz/MkvPHj0JASt6i4u6Ep8MJFpsvJX3y
 lSuAIU39tVkBhlykcnhmTNX4bKehkS0ncVtDuuvbIjIQ1n3SgfXC5+e2V30eC861A0
 wdiS0bXJ4vT0j20qSG+SGipIEGREOghZ8QFHvK3BMOz4+uldH/Y35gvt5UWb5CJM7W
 TpaGaFA+WL0mEb24JFSCg/mm+Ob4qzG5K9Nbhh03NNEOvHCCOe6o/cGF8oIL0feiPr
 TE9u8vaqamGC+Ap2rRraj6LDZEB1K105XjSgezzQdAcNfIq4MrpZuK2HKdLLyfeZ/5
 1VP5iOQIWfY+Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: switch has_fpu() to the unified static key
 mechanism
Date: Wed, 18 May 2022 02:44:53 +0800
Message-Id: <20220517184453.3558-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220517184453.3558-1-jszhang@kernel.org>
References: <20220517184453.3558-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_115331_430700_254179C1 
X-CRM114-Status: GOOD (  11.93  )
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

This is to use the unified static key mechanism instead of putting
static key related here and there.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/switch_to.h | 5 +++--
 arch/riscv/kernel/cpufeature.c     | 7 -------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0a3f4f95c555..3f407182080d 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -8,6 +8,7 @@
 
 #include <linux/jump_label.h>
 #include <linux/sched/task_stack.h>
+#include <asm/hwcap.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/csr.h>
@@ -56,10 +57,10 @@ static inline void __switch_to_aux(struct task_struct *prev,
 	fstate_restore(next, task_pt_regs(next));
 }
 
-extern struct static_key_false cpu_hwcap_fpu;
 static __always_inline bool has_fpu(void)
 {
-	return static_branch_likely(&cpu_hwcap_fpu);
+	return riscv_isa_have_key_extension(RISCV_ISA_EXT_d) ||
+		riscv_isa_have_key_extension(RISCV_ISA_EXT_f);
 }
 #else
 static __always_inline bool has_fpu(void) { return false; }
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 89f886b35357..0235391be84b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -21,9 +21,6 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
-#ifdef CONFIG_FPU
-__ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
-#endif
 __ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
 EXPORT_SYMBOL(riscv_isa_ext_keys);
 
@@ -239,8 +236,4 @@ void __init riscv_fill_hwcap(void)
 		if (j >= 0)
 			static_branch_enable(&riscv_isa_ext_keys[j]);
 	}
-#ifdef CONFIG_FPU
-	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
-		static_branch_enable(&cpu_hwcap_fpu);
-#endif
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
