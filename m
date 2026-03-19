Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351E9107526D
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 07:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=caL4CsSnN23tvIpsWIT0XdKaKiMaHIygakpHvfOCzk4=; b=Ckf5fJq9KRs9TW
	31U8BWz9oAToZtOhpy0cLENt/NCEr3XFO6pAPOOEgvgj7f3FiChpjUMz71/MIFMIBIALjt33j/A9A
	y9+gzfgJm3HHUdsg0Qh7EYF4MKx2c6apsXTvMl+gO+i8zPMWnQ0Zfag/p1MU5FuOsAF1uZvqg2inS
	hK31f5DUhmD+7Uj/vfvKdo8GP/BMXa0wAtPvM+xKKU+i5dTusaGTp55Ci1fpFHiZ3vhO5BzX4vM5d
	FLhQW3mgeRCxHV5gYDpjpQwejEzz4yVARDdVCw/CHvLoPFP4YM5GhcRxYCeVlSavs7tc/i1jMP4jU
	428lTobpH+hwWqdLWDSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37wY-0000000AAG8-2j4t;
	Thu, 19 Mar 2026 07:37:22 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37wT-0000000AAEO-3yGl
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 07:37:21 +0000
Received: from localhost.localdomain (unknown [121.237.245.153])
	by APP-05 (Coremail) with SMTP id zQCowAC3Sg6op7tpCPfXCg--.53234S2;
	Thu, 19 Mar 2026 15:37:12 +0800 (CST)
From: daichengrong <daichengrong@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daichengrong <daichengrong@iscas.ac.cn>
Subject: [RFC PATCH] riscv: clarify vector state semantics on syscall and context switch
Date: Thu, 19 Mar 2026 15:37:09 +0800
Message-Id: <20260319073709.18562-1-daichengrong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAC3Sg6op7tpCPfXCg--.53234S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur47ZFy5Ww1kArW5CryfWFg_yoW5Arykpr
	Z8Cr43CrWUGa1xZr9Fqw48XrZ5G3yrW3y5ArZxGayrGF1fKr93CFn5t34qvFWDJFyFkFyj
	yayvg348Zw4DArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JU92-nUUUUU=
X-Originating-IP: [121.237.245.153]
X-CM-SenderInfo: pgdluxxhqj201qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_003718_365055_A65ACB45 
X-CRM114-Status: GOOD (  12.90  )
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

The RISC-V vector specification states that executing a system call
causes all caller-saved vector registers (v0-v31, vl, vtype) and vstart
to become unspecified.

Currently, after calling riscv_v_vstate_discard(), the vector state 
may still be marked as DIRTY, which can mislead the context switch 
logic into treating the registers as containing valid user data.

This patch clarifies and tightens the kernel-side semantics:

1. On syscall entry, the kernel checks the vector state via mstatus
   and discards it if necessary. After discard, the state is explicitly
   set to INIT instead of DIRTY, indicating that the vector registers
   no longer contain meaningful user data.

2. During context switch, the vector state is interpreted as follows:
   - INIT: no valid user data is present, so vector register data does
     not need to be saved.
   - non-INIT (e.g. DIRTY): vector register data must be saved.

3. On restore, if the state is INIT, the vector registers are treated
   as invalid and are not restored from memory. Instead, they are
   overwritten with a known initial value to avoid potential data
   leakage from a previous task.

This aligns the kernel's vector state tracking with the architectural
"unspecified" semantics while ensuring correct lazy context switching
and preventing cross-task data leakage.

Signed-off-by: daichengrong <daichengrong@iscas.ac.cn>
---
 arch/riscv/include/asm/vector.h | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 00cb9c0982b1..93c68a549b72 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -298,8 +298,9 @@ static inline void __riscv_v_vstate_discard(void)
 static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 {
 	if (riscv_v_vstate_query(regs)) {
-		__riscv_v_vstate_discard();
-		__riscv_v_vstate_dirty(regs);
+		if (!__riscv_v_vstate_check(regs->status, INITIAL))
+			__riscv_v_vstate_discard();
+		riscv_v_vstate_on(regs);
 	}
 }
 
@@ -315,19 +316,17 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
-	if (riscv_v_vstate_query(regs)) {
+	if (__riscv_v_vstate_check(regs->status, INITIAL))
+		__riscv_v_vstate_discard();
+	else if (__riscv_v_vstate_check(regs->status, CLEAN))
 		__riscv_v_vstate_restore(vstate, vstate->datap);
-		__riscv_v_vstate_clean(regs);
-	}
 }
 
 static inline void riscv_v_vstate_set_restore(struct task_struct *task,
 					      struct pt_regs *regs)
 {
-	if (riscv_v_vstate_query(regs)) {
+	if (riscv_v_vstate_query(regs))
 		set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
-		riscv_v_vstate_on(regs);
-	}
 }
 
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
