Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB88DC433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 22 May 2022 15:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2XERpDQ4xo+YjffJxkmm0EBI93E91HKPt/wqlQaqhk=; b=pF/Xc2H0Dqovke
	4NibT1WpmsUb/tFeAVlrV9Uff1cgXTvwco7wEJiPhfgKdb3+5Xq/hh6MGW57N83zlmTXE7/C8gi43
	knNsR54TeFMz9i8JBxwHpwi7tD9BFh1rQ4XIKE/2+IigYh8siTpiTykarD2YKg0rekYtCeB5e/onj
	56QS3gp59JUg3a+bBqn+WcOFJk24GBom5XG+PjXBQUCQlodxuqKTcIaugTMa/YIWAguNW4xuVklQ1
	Kc6H7Bd9kA693mwUVsVSVkwHZDrLARKNHmaE5nsqV1mmB1XMJ0wdrWONIsTK6Al3KNoF4q6mUNAKL
	66EnsxJ0Z4kbhgIIp0CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsnkw-001bdk-9z; Sun, 22 May 2022 15:44:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsnkt-001bch-Eh
 for linux-riscv@lists.infradead.org; Sun, 22 May 2022 15:44:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9555260FF8;
 Sun, 22 May 2022 15:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F418DC34113;
 Sun, 22 May 2022 15:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653234270;
 bh=lCSXZUmp2XpJTlxqmcLhDoFxLAVPQOfR1UxKkPK1zio=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iOlqu/xxnnOsLiSZ0Z2RlhhRSow89I7Q/7Rj9UuV3DJ5yC9hwu5OxfZck5IMVqYZh
 7LVeCtb1iMGpkmSAUm9WRbUp5/wZCI6+bDPk5XCMUHoD5i+wE2VbWfZKcJEbzvl8u0
 ctUrihTcckQDZLHkgZogdVFlBRKRBkpsJQVGTAcsBdfs0+ZjxB4pg97bASmweRrRqk
 0O1somznEwwm0jU7a52++5Yh4RQpjLhu91a8MN/luOlfnJSbvPOAFpno+gelA+1yyY
 czDss6+ZiYWfZiP3QVjlbPYLPPxteeWcqlvklTBVVxzYd2hyjTCm6Q8/F+7LyqXZRn
 I9928bfxSZWTw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] riscv: switch has_fpu() to the unified static key
 mechanism
Date: Sun, 22 May 2022 23:35:43 +0800
Message-Id: <20220522153543.2656-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220522153543.2656-1-jszhang@kernel.org>
References: <20220522153543.2656-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_084431_568583_0E56377A 
X-CRM114-Status: GOOD (  11.53  )
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
 arch/riscv/include/asm/switch_to.h | 4 ++--
 arch/riscv/kernel/cpufeature.c     | 7 -------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0a3f4f95c555..11463489fec6 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -8,6 +8,7 @@
 
 #include <linux/jump_label.h>
 #include <linux/sched/task_stack.h>
+#include <asm/hwcap.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/csr.h>
@@ -56,10 +57,9 @@ static inline void __switch_to_aux(struct task_struct *prev,
 	fstate_restore(next, task_pt_regs(next));
 }
 
-extern struct static_key_false cpu_hwcap_fpu;
 static __always_inline bool has_fpu(void)
 {
-	return static_branch_likely(&cpu_hwcap_fpu);
+	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_FPU]);
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
