Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A99C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w4FuOZhCqCT4FMhuu/4lSchZLCqz6ShXfFE79wYiv90=; b=X01ZxHecFF1ODI
	+aq12+Z9cXoUOBVGxykHiH1Kb1lw8g58DwMn/5x7JZ7BkwLpxVgIfIknR90DpRG72HZmojenyT3De
	1GKTmhg5qrtBR6G7EatrMJPkOSE/eNCN9JuxhhcMiMkYvLJPth8Ty9lMPbwv5D3tA0mZE1dQtjDMv
	fSYg8AKEPBnegpC4g8DeGOYEF9EWAwEGu9rAzB/lcnauPofIvWW39uG3uwUxBdCDrEpYLzjRJMb2Z
	rKnImXv9dnV2Uzf4BmjZWWS/SkW+WBsJOQvgzHb2vEJimy+h5xRnE1OIxH+fo/f/FbbPD1ftSmH52
	/E4J1l60TsvSmKWhzHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeyh-004mgY-2j; Tue, 20 Sep 2022 15:16:03 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeya-004mY6-BQ
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 15:15:58 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MX4kz4rknzlW0y;
	Tue, 20 Sep 2022 23:11:39 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:15:45 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:15:45 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<namhyung@kernel.org>, <jolsa@kernel.org>, <guoren@kernel.org>,
	<nsaenzju@redhat.com>, <frederic@kernel.org>, <changbin.du@intel.com>,
	<vincent.chen@sifive.com>, <ardb@kernel.org>, <mhiramat@kernel.org>,
	<rostedt@goodmis.org>, <keescook@chromium.org>, <catalin.marinas@arm.com>,
	<chenzhongjin@huawei.com>
Subject: [PATCH -next 0/7] riscv: Improvments for stacktrace
Date: Tue, 20 Sep 2022 23:11:55 +0800
Message-ID: <20220920151202.180057-1-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_081556_713135_A987B07D 
X-CRM114-Status: UNSURE (   9.30  )
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

Chen Zhongjin (7):
  riscv: stacktrace: Replace walk_stackframe with arch_stack_walk
  riscv: stacktrace: Introduce unwind functions
  riscv: stacktrace: Save pt_regs in encoded fp on irq entry
  riscv: syscall: Don't clobber s0 when syscall
  riscv: stacktrace: Implement stacktrace for irq
  riscv: stacktrace: Fix unwinding on ftrace_regs_call
  riscv: stacktrace: Fix unwinding on __kretporbe_trampoline

 arch/riscv/include/asm/frame.h                |  45 +++++
 arch/riscv/include/asm/stacktrace.h           |  13 +-
 arch/riscv/kernel/entry.S                     |  23 +--
 arch/riscv/kernel/mcount-dyn.S                |   8 +
 arch/riscv/kernel/perf_callchain.c            |   2 +-
 arch/riscv/kernel/probes/kprobes_trampoline.S |   8 +
 arch/riscv/kernel/stacktrace.c                | 155 ++++++++++++------
 7 files changed, 195 insertions(+), 59 deletions(-)
 create mode 100644 arch/riscv/include/asm/frame.h

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
