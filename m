Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8118C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 10:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X+LwN/dT8A2tC5PrI4Ft78HmAx1GEZ3G9UM43AgZhBM=; b=M/zfFqeI8565gn
	ITC39IWP9OFlCDZbEaHClO8IwAdxNz1tKMmr9xiawmsdaWgqlZIT3Zts04H6aq+H9l2YO7Ok0yw2R
	Dj0VI2uSgVF8nGc2/N+vrF13t0M3wM2dT8BAW1OWGYH8VkKqmVy6sDQWNuaWo+vgLmNfzSzU9H+Gi
	rDuMzoUV0aOxCjRPWTYiCX0F+SYt9IN7yRD66AzMfnbagEpfwccfJkrM9pVnUXaP55KykhHdnlqbd
	92cZDRt+4vzQAOxOoftRfJNu0vquxvAo7H/ANpC9w4v2jNChsqdE2ipx/l0xnCBv2Z8kBZ4Ceez9E
	7I3dvKe8VNsDocym6mww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owhII-003Z8P-Vp; Sun, 20 Nov 2022 10:11:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owhIG-003Z7y-Gl
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 10:11:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3C75EB8094C;
	Sun, 20 Nov 2022 10:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387A7C433C1;
	Sun, 20 Nov 2022 10:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668939075;
	bh=QTDu4fLb9twOkqLiSjSp5OTaro/DCdN7tjTIlLKBosc=;
	h=From:To:Cc:Subject:Date:From;
	b=U/BTk09XUWCG08xPAg3hhWPph8uBDYe7Nf/RcI1+eSb0IPp6BEYD4b8bc6HIyco/M
	 rZL6D8ewyJqOER+zjXn7RrsFeBKyWUErX9eeUWIWqWjN0PkhvS60fAHSDoyktbY2PD
	 PuaFvIa33GFjkuEXojsVugjQKbNUz9yQbJM56kUhHLfDb8U3Qe/l3420lEbqOatZUN
	 9kCKfbb1BihoPLcS/26PQyWYcfkKi+/FC3EJmiz75njyr08Ekf4d7dVU1j1rkg3O9B
	 8CJjSkLId3xqActWV2EK+QEJ63f/volwbvjhYOP+uBsdTMXGcm55wL0S0pMi8O8q2m
	 2cKbOLyhrAppA==
From: guoren@kernel.org
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	mhiramat@kernel.org,
	changbin.du@intel.com,
	zong.li@sifive.com,
	rostedt@goodmis.org,
	boqun.feng@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changbin Du <changbin.du@gmail.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V2] riscv: patch: Fixup lockdep warning in stop_machine
Date: Sun, 20 Nov 2022 05:10:49 -0500
Message-Id: <20221120101049.2078117-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_021120_921651_DA334067 
X-CRM114-Status: GOOD (  13.95  )
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

From: Changbin Du <changbin.du@gmail.com>

The task of ftrace_arch_code_modify(_post)_prepare() caller is
stop_machine, whose caller and work thread are different tasks. The
lockdep checker needs the same task context, or it's wrong. That means
it's a bug here to use lockdep_assert_held because we don't guarantee
the same task context.

kernel/locking/lockdep.c:
int __lock_is_held(const struct lockdep_map *lock, int read)
{
        struct task_struct *curr = current;
        int i;

        for (i = 0; i < curr->lockdep_depth; i++) {
			^^^^^^^^^^^^^^^^^^^
                struct held_lock *hlock = curr->held_locks + i;
					  ^^^^^^^^^^^^^^^^
                if (match_held_lock(hlock, lock)) {
                        if (read == -1 || !!hlock->read == read)
                                return LOCK_STATE_HELD;

The __lock_is_held depends on current held_locks records; if
stop_machine makes the checker runing on another task, that's wrong.

Here is the log:
[   15.761523] ------------[ cut here ]------------
[   15.762125] WARNING: CPU: 0 PID: 15 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x72/0x364
[   15.763258] Modules linked in:
[   15.764154] CPU: 0 PID: 15 Comm: migration/0 Not tainted 6.1.0-rc1-00014-g66924be85884-dirty #377
[   15.765339] Hardware name: riscv-virtio,qemu (DT)
[   15.765985] Stopper: multi_cpu_stop+0x0/0x192 <- stop_cpus.constprop.0+0x90/0xe2
[   15.766711] epc : patch_insn_write+0x72/0x364
[   15.767011]  ra : patch_insn_write+0x70/0x364
[   15.767276] epc : ffffffff8000721e ra : ffffffff8000721c sp : ff2000000067bca0
[   15.767622]  gp : ffffffff81603f90 tp : ff60000002432a00 t0 : 7300000000000000
[   15.767919]  t1 : 0000000000000000 t2 : 73695f6b636f6c5f s0 : ff2000000067bcf0
[   15.768238]  s1 : 0000000000000008 a0 : 0000000000000000 a1 : 0000000000000000
[   15.768537]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
[   15.768837]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000000000
[   15.769139]  s2 : ffffffff80009faa s3 : ff2000000067bd10 s4 : ffffffffffffffff
[   15.769447]  s5 : 0000000000000001 s6 : 0000000000000001 s7 : 0000000000000003
[   15.769740]  s8 : 0000000000000002 s9 : 0000000000000004 s10: 0000000000000003
[   15.770027]  s11: 0000000000000002 t3 : 0000000000000000 t4 : ffffffff819af097
[   15.770323]  t5 : ffffffff819af098 t6 : ff2000000067ba28
[   15.770574] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[   15.771102] [<ffffffff80007520>] patch_text_nosync+0x10/0x3a
[   15.771421] [<ffffffff80009c66>] ftrace_update_ftrace_func+0x74/0x10a
[   15.771704] [<ffffffff800fa17e>] ftrace_modify_all_code+0xb0/0x16c
[   15.771958] [<ffffffff800fa24c>] __ftrace_modify_code+0x12/0x1c
[   15.772196] [<ffffffff800e110e>] multi_cpu_stop+0x14a/0x192
[   15.772454] [<ffffffff800e0a34>] cpu_stopper_thread+0x96/0x14c
[   15.772699] [<ffffffff8003f4ea>] smpboot_thread_fn+0xf8/0x1cc
[   15.772945] [<ffffffff8003ac9c>] kthread+0xe2/0xf8
[   15.773160] [<ffffffff80003e98>] ret_from_exception+0x0/0x14
[   15.773471] ---[ end trace 0000000000000000 ]---

Fixes: 0ff7c3b33127 ("riscv: Use text_mutex instead of patch_lock")
Cc: Changbin Du <changbin.du@gmail.com>
Co-developed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Zong Li <zong.li@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
Changes in v2:
 - Rewrite commit log with lockdep explanation [Guo Ren]
 - Rebase on v6.1 [Guo Ren]

v1:
https://lore.kernel.org/linux-riscv/20210417023532.354714-1-changbin.du@gmail.com/
---
 arch/riscv/kernel/patch.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 765004b60513..8619706f8dfd 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -55,13 +55,6 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
 	bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
 	int ret;
 
-	/*
-	 * Before reaching here, it was expected to lock the text_mutex
-	 * already, so we don't need to give another lock here and could
-	 * ensure that it was safe between each cores.
-	 */
-	lockdep_assert_held(&text_mutex);
-
 	if (across_pages)
 		patch_map(addr + len, FIX_TEXT_POKE1);
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
