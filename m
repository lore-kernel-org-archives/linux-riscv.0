Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA052ECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 09:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vs1mEFcavAzjNlwWaNc29oJbEpDo+nukp2Q1GkQ7bPU=; b=hKfQbQrkq/X4O0
	DxbFL/xP3dP8vDrJGGTWtqExaHEBIpYNy8P4oq/DUgrBF/cQGLV2r5T+X1iqyPBmCwu0PrCl1QqyD
	2CwOAH0y1gx2lzoOpx6O6UnmFUNfoUL6FPxPqkslRMm4+0DdopKalOTXZmEAKCsLNtN/Rx/6I1jeH
	/vjW1aCqqdqsTuquttDPuZ4spLoK3gExVRwsfABRpaWa2irB+WJAeQmDSbgLCJIRdPSkbxKrRU7Zz
	jINsB+6DyjuX8BQ7lYirJKdi4WBIDp7fmHKImi53SnB5jNbxuf9v6ZN29IaFqHIPe+ONc2CEzyBlr
	/Iwg5i/evcOEFgXc53dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWaam-00F8lk-JO; Fri, 09 Sep 2022 09:46:32 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWaak-00F8j2-8N
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 09:46:32 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MP9yL39Zkz14QXZ;
	Fri,  9 Sep 2022 17:42:34 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 17:46:25 +0800
Received: from huawei.com (10.67.175.41) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 9 Sep
 2022 17:46:25 +0800
From: Yipeng Zou <zouyipeng@huawei.com>
To: <paul.walmsley@sifive.com>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <guoren@kernel.org>,
	<mark.rutland@arm.com>, <frederic@kernel.org>, <nsaenzju@redhat.com>,
	<paulmck@kernel.org>
CC: <zouyipeng@huawei.com>, <liaochang1@huawei.com>, <chris.zjh@huawei.com>
Subject: [PATCH] riscv: Fix TRACE_IRQFLAGS call points in entry.S
Date: Fri, 9 Sep 2022 17:42:30 +0800
Message-ID: <20220909094230.252031-1-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.41]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_024630_669540_923894FC 
X-CRM114-Status: UNSURE (   7.82  )
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

TRACE_IRQFLAGS need trace all {Enable,Disable} hard interrupts points
in entry.S.
We miss a path(work_notifysig) that cause an WARN as shown below.

[   50.362431] ------------[ cut here ]------------
[   50.363607] DEBUG_LOCKS_WARN_ON(!lockdep_hardirqs_enabled())
[   50.367229] WARNING: CPU: 3 PID: 74 at kernel/locking/lockdep.c:5510 check_flags+0x10a/0x1e0
[   50.368905] Modules linked in:
[   50.369440] CPU: 3 PID: 74 Comm: rcS Tainted: G
[   50.370225] Hardware name: riscv-virtio,qemu (DT)
[   50.370632] epc : check_flags+0x10a/0x1e0
[   50.371015]  ra : check_flags+0x10a/0x1e0
[   50.371751] epc : ffffffff808e2670 ra : ffffffff808e2670 sp : ff20000000c3bca0
[   50.372721]  gp : ffffffff817e2188 tp : ff60000002fe1800 t0 : ffffffff8162a2a8
[   50.373321]  t1 : 0000000000000001 t2 : 2d2d2d2d2d2d2d2d s0 : ff20000000c3bcc0
[   50.373903]  s1 : ffffffff817e3340 a0 : 0000000000000030 a1 : ffffffff81693fa8
[   50.374476]  a2 : 0000000000000010 a3 : fffffffffffffffe a4 : 083151a422b8df00
[   50.375039]  a5 : 083151a422b8df00 a6 : ffffffff8006891e a7 : 083151a422b8df00
[   50.376028]  s2 : ffffffff817e54e0 s3 : ffffffff81695070 s4 : ff600000027d7800
[   50.376978]  s5 : ffffffff80c22770 s6 : 0000000200000022 s7 : ffffffffffffffff
[   50.377779]  s8 : ffffffff82301ed0 s9 : 0000000000001000 s10: 00000000001a9905
[   50.378335]  s11: 000000000014f3e8 t3 : ffffffff822d714f t4 : ffffffff822d714f
[   50.378955]  t5 : ffffffff822d7150 t6 : ff20000000c3ba98
[   50.379783] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[   50.380810] [<ffffffff808e27be>] lock_is_held_type+0x78/0x14e
[   50.381477] [<ffffffff8003e850>] __might_resched+0x26/0x22c
[   50.382006] [<ffffffff8003ea92>] __might_sleep+0x3c/0x66
[   50.382477] [<ffffffff8002324e>] get_signal+0xaa/0x912
[   50.382947] [<ffffffff80005368>] do_notify_resume+0x82/0x434
[   50.383839] [<ffffffff80003bec>] ret_from_exception+0x0/0x10

Fixes: 3c4697982982 ("riscv: Enable LOCKDEP_SUPPORT & fixup TRACE_IRQFLAGS_SUPPORT")
Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
---
 arch/riscv/kernel/entry.S | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index b9eda3fcbd6d..f4d23995a4f1 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -370,16 +370,20 @@ resume_kernel:
 
 work_pending:
 	/* Enter slow path for supplementary processing */
-	la ra, ret_from_exception
 	andi s1, s0, _TIF_NEED_RESCHED
 	bnez s1, work_resched
 work_notifysig:
+#ifdef CONFIG_TRACE_IRQFLAGS
+	call __trace_hardirqs_on
+#endif
+	la ra, ret_from_exception
 	/* Handle pending signals and notify-resume requests */
 	csrs CSR_STATUS, SR_IE /* Enable interrupts for do_notify_resume() */
 	move a0, sp /* pt_regs */
 	move a1, s0 /* current_thread_info->flags */
 	tail do_notify_resume
 work_resched:
+	la ra, ret_from_exception
 	tail schedule
 
 /* Slow paths for ptrace. */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
