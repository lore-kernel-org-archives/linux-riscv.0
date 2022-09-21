Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEDAC6FA8E
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 12:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UJYJb62TnweFQJe+NeEiYtwzaCw4bPzF37YvZhzAjBo=; b=OjiDbNAgpbzLeM
	b415A1etOg6lOacuaEi50ezj5IknaQcybe0Jv+vTelQoOHCiMCI8nCc1qxEb+O+66IhD9CQ+PXLdU
	4pF0mPIEq+O0mT3dqkn4Y3ItB+s431BEndx34FNDqOPMdZIyKbvAdVeq1fSHplLnLKXBAyvbmhau7
	AkIx0hD05GDteN/JHd4XCu9neq2ruThTGzxyWizOhGc7vq7i6N1oN3X/H3cxd+qkYAb0Eilv/MRfr
	L/D5tkHfoCLCIa7/ZWxv2uVoRBdvDxi6KBwOLh2xJOOBPyj/pqFgxm3iZ+N6Za3+zuKZn64ncOS6v
	0cteCDmNvm9lbyoP3EnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oazG4-00BMpq-PN; Wed, 21 Sep 2022 12:55:20 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oazFx-00BMlZ-VT
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 12:55:18 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MXdZK2CM9z14RgH;
	Wed, 21 Sep 2022 20:51:05 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 20:55:09 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 20:55:09 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<namhyung@kernel.org>, <jolsa@kernel.org>, <guoren@kernel.org>,
	<frederic@kernel.org>, <vincent.chen@sifive.com>, <ardb@kernel.org>,
	<mhiramat@kernel.org>, <rostedt@goodmis.org>, <keescook@chromium.org>,
	<catalin.marinas@arm.com>, <chenzhongjin@huawei.com>
Subject: [PATCH for-next v2 0/4] riscv: Improvments for stacktrace
Date: Wed, 21 Sep 2022 20:51:23 +0800
Message-ID: <20220921125128.33913-1-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_055514_379056_67E48F1F 
X-CRM114-Status: UNSURE (   9.99  )
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

Currently, the stacktrace with FRAME_POINTER on riscv has some problem:

1. stacktrace will stop at irq so it can't get the stack frames before
irq entry.
2. stacktrace can't unwind all the real stack frames when there is
k{ret}probes or ftrace.

These are mainly becase when there is a pt_regs on stack, we can't unwind
the stack frame as normal function.

Some architectures (e.g. arm64) create a extra stackframe inside pt_regs.
However this doesn't work for riscv because the ra is not ensured to be
pushed to stack. As explained in:
commit f766f77a74f5("riscv/stacktrace: Fix stack output without ra on the stack top")

So, I choosed the method of x86 that, if there is a pt_regs on stack,
we encoded the frame pointer and save it. When unwinding stack frame,
we can get pt_regs and registers required for unwinding stacks.

In addition, the patch set contains some refactoring of stacktrace.c to
keep the stacktrace code on riscv consistent with other architectures.

Stacktrace before for kretprobes:

  Call Trace:
  ...
  [<ffffffff800d5d48>] __kretprobe_trampoline_handler+0xc2/0x13e
  [<ffffffff808b766c>] trampoline_probe_handler+0x30/0x46
  [<ffffffff800070de>] __kretprobe_trampoline+0x52/0x92
  [<ffffffff0163809c>] kprobe_init+0x9c/0x1000 [kprobe_unwind]
  [<ffffffff800027c8>] do_one_initcall+0x4c/0x1f2
  ...

Stacktrace after:

  Call Trace:
  ...
  [<ffffffff800d5d48>] __kretprobe_trampoline_handler+0xc2/0x13e
  [<ffffffff808b766c>] trampoline_probe_handler+0x30/0x46
  [<ffffffff800070de>] __kretprobe_trampoline+0x52/0x92
+ [<ffffffff01633076>] the_caller+0x2c/0x38 [kprobe_unwind]
  [<ffffffff0163809c>] kprobe_init+0x9c/0x1000 [kprobe_unwind]
  [<ffffffff800027c8>] do_one_initcall+0x4c/0x1f2
  ...

Stacktrace before for ftrace:

  Call Trace:
  ...
  [<ffffffff80006df0>] kprobe_ftrace_handler+0x13e/0x188
  [<ffffffff80008e7e>] ftrace_regs_call+0x8/0x10
  [<ffffffff80002540>] do_one_initcall+0x4c/0x1f2
  [<ffffffff8008a4e6>] do_init_module+0x56/0x210
  ...

  Stacktrace after:

  Call Trace:
  ...
  [<ffffffff016150e0>] handler_pre+0x30/0x4a [kprobe_unwind]
  [<ffffffff800bce96>] aggr_pre_handler+0x60/0x94
  [<ffffffff80006df0>] kprobe_ftrace_handler+0x13e/0x188
  [<ffffffff80008e82>] ftrace_regs_call+0x8/0x10
+ [<ffffffff01615000>] traced_func+0x0/0x1e [kprobe_unwind]
  [<ffffffff80002540>] do_one_initcall+0x4c/0x1f2
  [<ffffffff8008a4ea>] do_init_module+0x56/0x210
  ...

Noticed that the caller of ftrace and probed func of kretprobe
cannot be unwind because they are inside function pro/epilogue.

---
v1 -> v2:
- Merge three patches which add ENCODE_FRAME_POINTER together
- Update commit message
- Delete the KRETPORBES stuff added in unwind_state, we don't need them
to recover the kretporbes ret_addr because we can get it in pt_regs
---
Chen Zhongjin (4):
  riscv: stacktrace: Replace walk_stackframe with arch_stack_walk
  riscv: stacktrace: Introduce unwind functions
  riscv: stacktrace: Save pt_regs in ENCODE_FRAME_POINTER
  riscv: stacktrace: Implement stacktrace for irq

 arch/riscv/include/asm/frame.h                |  45 ++++++
 arch/riscv/include/asm/stacktrace.h           |   9 +-
 arch/riscv/kernel/entry.S                     |   3 +
 arch/riscv/kernel/mcount-dyn.S                |   7 +
 arch/riscv/kernel/perf_callchain.c            |   2 +-
 arch/riscv/kernel/probes/kprobes_trampoline.S |   7 +
 arch/riscv/kernel/stacktrace.c                | 150 ++++++++++++------
 7 files changed, 174 insertions(+), 49 deletions(-)
 create mode 100644 arch/riscv/include/asm/frame.h

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
