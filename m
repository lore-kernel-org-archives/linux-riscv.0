Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD16C88E6A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zN43leOZPPZtOb2oMTY9J2TPwyBS7PLw5dBzHSP+024=; b=jIqMsVT4rcGa7e
	8cu3SuNHMfJUWUA96fX524XMquGYTyorvjSw35DwSxmkbzAVnm5SaYtsZ+oxNAYOEZw3JJ3pRke9x
	C+GTd9oRGR2osjuMhaZ0q+McmPEZvOcIDbqTci8H1utyG20XDfv2aAc6JSyi95tped/+gVQmNWqTn
	svGJnWq6IRIsHNwM8r7Mb2zPycFAiispYywSRstRf8jz87RN1GtnMbe1iLtRG7s3qIrCZGdA3H/U/
	E6T4PSjcFQOQHyfQwyEJsIt+Gd+81Pj03gLJCFm7IvJR4jV3tnVJ0jgKX8qszTBUi+jGZbJetExGs
	9lIdeortnTmaTtnJrzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62xn-00000002wo0-1Iat;
	Mon, 14 Sep 2026 09:26:59 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62xi-00000002wn5-3O2F
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 09:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789378013; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=P8sYn4OtnNWo+w2hJIg0kIU0ugjITLBiiIHDjl7eYks=;
	b=odbYtClVXrsFIzs2aUvmmmGYlpcgatdh7tPjlLOBOup0YNl8bZDc4ApFuY/EPeb48izp8F4ccRv1fGqOHRFxs3nMHC82Ht8uMRR8EYU1iBJ/WiPxZ8N5tvxH5ZjiQ8bsClItuFOZsznJcLR03vR7r+dZVQscin1yZPZ/nDmnPo4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0XAuO-lA_1789378009;
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XAuO-lA_1789378009 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Sep 2026 17:26:51 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	oleg@redhat.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	shuah@kernel.org,
	mpdesouza@suse.com,
	oliver.yang@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	xueshuai@linux.alibaba.com,
	jkchen@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v6 0/7] riscv: Add reliable stack unwinding for livepatch
Date: Mon, 14 Sep 2026 17:26:41 +0800
Message-Id: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_022656_359277_D9C1D830 
X-CRM114-Status: UNSURE (   9.92  )
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

Hi,

This is v6 of the RISC-V reliable stack unwinding series for livepatch.
Wang Han has left our team, so I am taking over this series from now on.

The series adds explicit frame-record metadata, preserves the frame
pointer through dynamic ftrace, and replaces the open-coded stack walker
with a conservative frame-pointer based unwinder. It then enables the
RISC-V livepatch capability and adds the syscall-wrapper selftest prefix.

Changes since v5:
* Rebase onto the current riscv/for-next; no functional changes.
* Fold in the tags collected from the v5 thread:
  - Reviewed-by: Shuai Xue on 2/7, 3/7, 4/7 and 6/7
  - Acked-by: Miroslav Benes on 7/7
* Add my sign-off as the new sender.

Since the patches are otherwise identical to v5, the v5 validation
results still apply. For reference, from the v5 cover letter:
* Built Linux 7.2.0-rc6 with riscv64-unknown-linux-gnu-gcc 15.2.0
  and binutils 2.46.
* Standard livepatch configuration built successfully, including
  Image, vmlinux, modules, compile_commands.json and GDB scripts.
* CONFIG_IRQ_STACKS=n variant linked successfully with GCC.
* QEMU 8.2.2, 1 CPU: livepatch selftests PASS: 7, SKIP: 1,
  FAIL: 0; ftrace function graph 3 passed, 0 failed, 3 unsupported.
* QEMU 8.2.2, 4 CPUs: livepatch selftests PASS: 7, SKIP: 1,
  FAIL: 0; ftrace function graph 3 passed, 0 failed, 3 unsupported.
* No BUG, WARNING, Oops, panic, unreliable stack or Call Trace found
  by the validation log scans. Expected negative livepatch errors are
  part of the selftests.

v5 was posted in early August and has been quiet since then. I would
appreciate it if the series could be considered for the upcoming merge
window. Happy to address any remaining feedback.

Base:
riscv/for-next 77ae27fd98f3 ("Merge tag 'printk-for-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux")

Previous versions:
v5: https://lore.kernel.org/r/20260804103626.2803112-1-wanghan@linux.alibaba.com
v4 RESEND: https://lore.kernel.org/r/20260629072713.3273743-1-wanghan@linux.alibaba.com
v3: https://lore.kernel.org/r/cover.194d76e3a15b.v3.riscv-livepatch.wanghan@linux.alibaba.com
v2: https://lore.kernel.org/r/20260528082310.1994388-1-wanghan@linux.alibaba.com
v1: https://lore.kernel.org/r/20260527123530.2593918-1-wanghan@linux.alibaba.com

Assisted-by: Qoder:Qwen-3.8-MAX-Preview

Wang Han (7):
  riscv: stacktrace: Add frame record metadata
  riscv: stacktrace: disable KASAN and KCOV instrumentation for
    stacktrace.o
  riscv: ftrace: always preserve s0 in dynamic ftrace register frame
  riscv: stacktrace: introduce stack-bound tracking helpers
  riscv: stacktrace: switch to frame-pointer based unwinder
  riscv: Kconfig: enable HAVE_RELIABLE_STACKTRACE and HAVE_LIVEPATCH
  selftests/livepatch: Add RISC-V syscall wrapper prefix

 arch/riscv/Kconfig                            |   4 +
 arch/riscv/include/asm/ptrace.h               |   9 +
 arch/riscv/include/asm/stacktrace.h           |  67 ++-
 arch/riscv/include/asm/stacktrace/common.h    | 159 +++++
 arch/riscv/include/asm/stacktrace/frame.h     |  53 ++
 arch/riscv/kernel/Makefile                    |   6 +
 arch/riscv/kernel/asm-offsets.c               |   6 +
 arch/riscv/kernel/entry.S                     |  39 +-
 arch/riscv/kernel/ftrace.c                    |   6 +-
 arch/riscv/kernel/head.S                      |  23 +
 arch/riscv/kernel/mcount-dyn.S                |   4 -
 arch/riscv/kernel/perf_callchain.c            |   2 +-
 arch/riscv/kernel/process.c                   |  33 +-
 arch/riscv/kernel/stacktrace.c                | 561 +++++++++++++++---
 .../livepatch/test_modules/test_klp_syscall.c |   2 +
 15 files changed, 868 insertions(+), 106 deletions(-)
 create mode 100644 arch/riscv/include/asm/stacktrace/common.h
 create mode 100644 arch/riscv/include/asm/stacktrace/frame.h

base-commit: 77ae27fd98f3b9ab376239051ec7f9ee34c2c072
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
