Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F83DC3A5A7
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 02:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9w2D25w+4m5lvyTCyFQnQS/bwsHN3BkKSKKKRfeqjHw=; b=xEYyaSb4/dL272
	mMyPue6PZIHb3VSYZFOwBd6XokCo79UTa/Io4lZLsKCo7fTcLFpEzMNaVuln5xn7L0lqW017FgiGD
	jwWpq+5QFs2bIK3Rh9QQeUctCRCUCRRBvmpI9ArZzZ+yxfCquM2TtoxbV+uLPeM0Z1dypJ1q6u6r3
	Ojh08CKnOLfZIRTgTlsB4LcgnaHhUm2tRLeKJLEbu51hsUzJMjmkna8a9MrFnasfFB07ofTEIeJGc
	t37W56pKh40qjO0ioq0NCjN9A9faJA8t0p10cnCgLe3u0JlJRGV/nPP3ZJDMvx/a0S8L4JJ8/L6WX
	DUtqYmzgpBGLWr+2Lf1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jmu-008Bv7-Uf; Wed, 07 Dec 2022 02:03:56 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jmr-008Bce-DD
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 02:03:55 +0000
Received: from dggpemm100009.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NRgTv283DzJp7Y;
	Wed,  7 Dec 2022 10:00:19 +0800 (CST)
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 7 Dec
 2022 10:03:49 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Changbin Du <changbin.du@intel.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Liu
 Shixin <liushixin2@huawei.com>
Subject: [PATCH v2] riscv: stacktrace: Fix missing the first frame
Date: Wed, 7 Dec 2022 10:50:38 +0800
Message-ID: <20221207025038.1022045-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_180353_866473_14E6A724 
X-CRM114-Status: GOOD (  10.25  )
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

When running kfence_test, I found some testcases failed like this:

 # test_out_of_bounds_read: EXPECTATION FAILED at mm/kfence/kfence_test.c:346
 Expected report_matches(&expect) to be true, but is false
 not ok 1 - test_out_of_bounds_read

The corresponding call-trace is:

 BUG: KFENCE: out-of-bounds read in kunit_try_run_case+0x38/0x84

 Out-of-bounds read at 0x(____ptrval____) (32B right of kfence-#10):
  kunit_try_run_case+0x38/0x84
  kunit_generic_run_threadfn_adapter+0x12/0x1e
  kthread+0xc8/0xde
  ret_from_exception+0x0/0xc

The kfence_test using the first frame of call trace to check whether the
testcase is succeed or not. Commit 6a00ef449370 ("riscv: eliminate
unreliable __builtin_frame_address(1)") skip first frame for all
case, which results the kfence_test failed. Indeed, we only need to skip
the first frame for case (task==NULL || task==current).

With this patch, the call-trace will be:

 BUG: KFENCE: out-of-bounds read in test_out_of_bounds_read+0x88/0x19e

 Out-of-bounds read at 0x(____ptrval____) (1B left of kfence-#7):
  test_out_of_bounds_read+0x88/0x19e
  kunit_try_run_case+0x38/0x84
  kunit_generic_run_threadfn_adapter+0x12/0x1e
  kthread+0xc8/0xde
  ret_from_exception+0x0/0xc

Fixes: 6a00ef449370 ("riscv: eliminate unreliable __builtin_frame_address(1)")
Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
v1->v2: Fix the incorrect Fixes tag found by Conor.

 arch/riscv/kernel/stacktrace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 08d11a53f39e..5fe2ae4cf135 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -30,6 +30,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		fp = (unsigned long)__builtin_frame_address(0);
 		sp = current_stack_pointer;
 		pc = (unsigned long)walk_stackframe;
+		level = -1;
 	} else {
 		/* task blocked in __switch_to */
 		fp = task->thread.s[0];
@@ -41,7 +42,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		unsigned long low, high;
 		struct stackframe *frame;
 
-		if (unlikely(!__kernel_text_address(pc) || (level++ >= 1 && !fn(arg, pc))))
+		if (unlikely(!__kernel_text_address(pc) || (level++ >= 0 && !fn(arg, pc))))
 			break;
 
 		/* Validate frame pointer */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
