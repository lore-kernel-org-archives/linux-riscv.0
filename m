Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689BCCD8CBD
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 06:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wpT/Rpn2ucj55tTLCtcVnxpzuFcXMo+bZZHhmf6jYFs=; b=IasN45ntQCm7Yt
	tHmzUwKmpsqVXao83ZSFUqwqXmF4htThEWWBhwOokHM9nJjwDlEMMq2bcW/7xBrSnFwrAidUal7/w
	Duxpn3/cNJEkJ+8WMSARvBcUTHGhk/ZfMcHh8ZJG9k4IyKu4F8cQISv8aCAkgA0IvFpxfGt7nX1Rj
	XmDcYAP5ojHq6X9ucAg5/NhX2X/kLLULVVF72St83LFmA86RqFl9gaL4/J7lCqS+VrusS1ez6BH9x
	9A0UOSA/LSIT0L9NNh1VhNFUZUfhGeW5gs5TxHqvtZkg7/fCi4R1D96mg2Jroex4+3baiTUG7vqZo
	HMixTmDQy27OmtIegXfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpyp-00000004rxt-3PoI;
	Tue, 09 Jun 2026 06:30:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpyn-00000004rvf-1hKC
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 Jun 2026 06:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ipNiCgq1zQDmCfj6MBMo/UwiU6bdUS/uJE7SlSsGs3U=; b=R3CoPns6/PG6vyqetubtCkatNM
	3ZB26uA9HBIULZGvghPZPjM13iaWeBQfKwCyPsS4dBo384mODGZnco96GvRgONf4o0RSMAVTfI0Pi
	KffpU3dSPRVEjLgMOrcmci689XVDtnI/SDaMzkchE/JK6dGF/BeSAsOBmwWNiMcAolcujD5DXIDQv
	sOfaIl5+7frePyvc1Afv21q2U2ju0bQd2vTwIF8a4zHh2fF2HOMSy4HTZBZ2enIwwEq+KXcRmjo/E
	li93xTFxedsj/sHX3etIyHTGgXy934lhVDi42eG0MIa2G0v+AePR2cdbJuxSx4vCQoGZGcNnGoKMo
	qCGV3qkg==;
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWpyi-000000022Ch-0xQ6
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 06:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780986617; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=ipNiCgq1zQDmCfj6MBMo/UwiU6bdUS/uJE7SlSsGs3U=;
	b=UXqX9jEhkHZoaFPXlHnkj1yN5/DyV6yZVWAPgJvc8nqgn3wJLspRp0k5Cl8mm+YIwO4ApGnmmXPFT+ncJKhbUfMNb4jFLpwK+kImwyXNg+AiACAu6MlSd1DVvzALkkSgjuP/+dTFwGPEEJND7KM+CjKFN9nPWT+7T4yT7as6mq4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=wanghan@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X4VD53s_1780986613;
Received: from wanghan-Workstation..(mailfrom:wanghan@linux.alibaba.com fp:SMTPD_---0X4VD53s_1780986613 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 09 Jun 2026 14:30:14 +0800
From: Wang Han <wanghan@linux.alibaba.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Andy Chiu <andybnac@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	oliver.yang@linux.alibaba.com,
	xueshuai@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	jkchen@linux.alibaba.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH v3 7/8] riscv: Kconfig: enable HAVE_RELIABLE_STACKTRACE and HAVE_LIVEPATCH
Date: Tue,  9 Jun 2026 14:29:58 +0800
Message-ID: <20260609063002.3943001-7-wanghan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.194d76e3a15b.v3.riscv-livepatch.wanghan@linux.alibaba.com>
References: <20260528082310.1994388-1-wanghan@linux.alibaba.com> <cover.194d76e3a15b.v3.riscv-livepatch.wanghan@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_073024_858610_33BB00D0 
X-CRM114-Status: UNSURE (   9.74  )
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

Now that the metadata frame records, the kunwind state machine and
arch_stack_walk_reliable() are all in place, advertise the capability
to the rest of the kernel:

  * select HAVE_RELIABLE_STACKTRACE under FRAME_POINTER && 64BIT, so
    only the configurations with the tested metadata records and
    FP-based reliable walker enable it.
  * select HAVE_LIVEPATCH under the same condition and source
    kernel/livepatch/Kconfig so the livepatch menu is reachable from
    the RISC-V configuration.

The 64BIT dependency is conservative scoping rather than a hard
technical requirement: the metadata frame record, kunwind state machine
and arch_stack_walk_reliable() also build on RV32, and the IRQ-stack
frame-record adjustment fixes a latent RV32 issue. However, the syscall
livepatch selftest and module relocation path have only been exercised
on RV64 QEMU virt so far. The 64BIT gate can be relaxed in a follow-up
once RV32 has equivalent coverage.

This is split out from the unwinder change so the policy decision and
the implementation can be reviewed and reverted independently.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
---
 arch/riscv/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 674044754378..2921680d2132 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -185,6 +185,7 @@ config RISCV
 	select HAVE_KRETPROBES
 	# https://github.com/ClangBuiltLinux/linux/issues/1881
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
+	select HAVE_LIVEPATCH if FRAME_POINTER && 64BIT
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
 	select HAVE_PAGE_SIZE_4KB
@@ -195,6 +196,7 @@ config RISCV
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_PREEMPT_DYNAMIC_KEY
 	select HAVE_REGS_AND_STACK_ACCESS_API
+	select HAVE_RELIABLE_STACKTRACE if FRAME_POINTER && 64BIT
 	select HAVE_RETHOOK
 	select HAVE_RSEQ
 	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
@@ -1394,3 +1396,5 @@ endmenu # "CPU Power Management"
 source "arch/riscv/kvm/Kconfig"
 
 source "drivers/acpi/Kconfig"
+
+source "kernel/livepatch/Kconfig"
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
