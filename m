Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDEB60A3812
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 01:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SG2snSIj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=CywNxalX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zeu5cnUQENmnQwva7pweZ0ES/iX5jJwO7gHTISbWnh8=; b=SG2snSIjXokwouDCKl6Zl/ZX4L
	0PUaoZikm+smKuuHC54pIY6KcWOzYjbrjzMIuipsK8I4isRCQ9FNh5suj+SsMPX75fdkTE+Pxe/gL
	vxpBa+gUYImhPUg84+fFlZ6sR8NosLdlCkEODsNv/9KoAlWxVKVS5QrRe5bdLLdUCWB6z1WqoQiiO
	GZ3h5PIWLpk1ZxOxQ8mg9yrrGT0pj/5zDymsAma64QVSiJFuqyWLJme9uxxVOw7PRmNgynB5BEuZR
	c1tdyrKiRv2By17ErmWtEBd8UuFKM9DGiV0LRffAR0wiYyskBCrCs4EdELyXH6hwJwmBeH8sDLqbx
	d1dmE8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaoL-000000026EC-04ou;
	Tue, 10 Nov 2026 01:38:09 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaoH-000000026CZ-2Kwf
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 01:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794274676; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=hparW8e8dCEdVdkvsPSYalHwRzpVNFBZ+OuZJj5uJX0=;
	b=CywNxalXjvZi2M6RYiN7lM0nrQKXS0r23rhDdAU/fk0v/vLJ5i8ij9JPW+H75ix01IXn9PNtEwW7CGQ0OU2hdtfx6McGrDGdIpMQ+osxLMcvou+rKb1esQSJcQ2kAcdjOyB/e7rVKCeT949zzzsMPV+s6d2CBHsmrgLfusO/7p0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=36;SR=0;TI=SMTPD_---0XETOX.U_1794274671;
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XETOX.U_1794274671 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Nov 2026 09:37:53 +0800
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
	martin@kaiser.cx,
	kmehltretter@gmail.com,
	oliver.yang@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	xueshuai@linux.alibaba.com,
	jkchen@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v7 00/10] riscv: Add reliable stack unwinding for livepatch
Date: Tue, 10 Nov 2026 09:37:40 +0800
Message-Id: <20261110013750.36800-1-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
References: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_173805_931374_D6653BD9 
X-CRM114-Status: GOOD (  16.60  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This is v7 of the RISC-V reliable stack unwinding series for livepatch.

The series starts with three standalone fixes for the existing stack
walkers: Karl Mehltretter's fix for arch_stack_walk() reporting the
walker's own frame, its KUnit test, and a fix for the function-graph
return-address cookie that Martin Kaiser asked to be split out. The
main part of the series then adds explicit frame-record metadata,
preserves the frame pointer through dynamic ftrace, replaces the
open-coded stack walker with a conservative frame-pointer based
unwinder, enables the RISC-V livepatch capability and adds the
syscall-wrapper selftest prefix.

Changes since v6:

* Rebase onto the current riscv/for-next (based on 7.4-rc1).

* Fold in Karl Mehltretter's two patches [1] as 1/10 and 2/10. Patch
  1/10 stops arch_stack_walk() from reporting the walker's own frame as
  the first entry, which corrupts the skip-frame accounting of
  stack_trace_save() users (page_owner, perf), and adjusts
  return_address() level accounting accordingly. Patch 2/10 adds a KUnit
  test for the start frames. Both patches keep their original authorship;
  I added my Reviewed-by/Tested-by and sign-off. I asked Karl on
  3 November whether he would like to see his patches folded into this
  series; he has not replied so far. Since 8/10 reuses the walker
  extraction from 1/10 for its !CONFIG_FRAME_POINTER fallback, his
  patches are included here to keep the series self-contained.

* Split the function-graph return-address cookie change out of the old
  5/7, as suggested by Martin Kaiser. It is now a separate patch (3/10)
  that also fixes the old walker's cookie key, so it stands on its own
  without the rest of the series and can be picked independently; it is
  marked Fixes: and Cc: stable.

* Reworked the !CONFIG_FRAME_POINTER fallback of the unwinder switch
  patch (8/10) to use the __always_inline __walk_stackframe() helper
  from 1/10, so both walkers report the same start frame.

* Collected tags from the v6 review thread: Reviewed-by and Tested-by:
  Martin Kaiser for the patches carried over from v6 (rv64 QEMU and
  rv64 CHERI builds, livepatch working on both).

The patches carried over from v6 are unchanged, except for the
reworked !CONFIG_FRAME_POINTER fallback in 8/10, so the v6 validation
results still apply to them. The v7-specific changes were covered by
the fresh build and boot runs described below:

* Built with riscv64-unknown-linux-gnu-gcc 15.2.0 and binutils 2.46,
  including a CONFIG_IRQ_STACKS=n variant.
* QEMU 8.2.2, 1 and 4 CPUs: livepatch selftests PASS: 7, SKIP: 1,
  FAIL: 0; ftrace function graph 3 passed, 0 failed, 3 unsupported.
* No BUG, WARNING, Oops, panic, unreliable stack or Call Trace found by
  the validation log scans.

Patches 1-2/10 were tested by Karl with the KUnit suite from 2/10 on
QEMU's virt machine with clang 22 (LLVM=1) and GCC 15.2, and on a
BeagleV Ahead (TH1520), where all five test cases pass.

In addition, the combined v7 tree was freshly built and booted:

* Built with riscv64-unknown-linux-gnu-gcc 16.2.0 on top of 7.4-rc1:
  a full livepatch configuration (CONFIG_LIVEPATCH=y with dynamic ftrace
  and function graph tracer) and a !CONFIG_FRAME_POINTER variant both
  link successfully.
* QEMU 11.1.1, rv64 virt, 4 CPUs: the KUnit suite from 2/10 passes
  5/5 on the frame-pointer build; the !CONFIG_FRAME_POINTER build boots
  and its panic backtrace (no initramfs, by design) unwinds cleanly.

Base:
riscv/for-next 6628e7d4c6b2 ("Linux 7.4-rc1")

Previous versions:
v6: https://lore.kernel.org/r/20260914092648.51254-1-xueshuai@linux.alibaba.com
v5: https://lore.kernel.org/r/20260804103626.2803112-1-wanghan@linux.alibaba.com
v4 RESEND: https://lore.kernel.org/r/20260629072713.3273743-1-wanghan@linux.alibaba.com
v3: https://lore.kernel.org/r/cover.194d76e3a15b.v3.riscv-livepatch.wanghan@linux.alibaba.com
v2: https://lore.kernel.org/r/20260528082310.1994388-1-wanghan@linux.alibaba.com
v1: https://lore.kernel.org/r/20260527123530.2593918-1-wanghan@linux.alibaba.com

[1] https://lore.kernel.org/r/20261010132712.46931-1-kmehltretter@gmail.com

Karl Mehltretter (2):
  riscv: stacktrace: do not report the walker's own frame from
    arch_stack_walk()
  riscv: Add KUnit test for stack trace start frames

Shuai Xue (1):
  riscv: ftrace: use the frame pointer as the function graph
    return-address cookie

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
 arch/riscv/kernel/return_address.c            |   2 +-
 arch/riscv/kernel/stacktrace.c                | 583 +++++++++++++++---
 arch/riscv/kernel/tests/Kconfig.debug         |  12 +
 arch/riscv/kernel/tests/Makefile              |   1 +
 arch/riscv/kernel/tests/stacktrace_test.c      | 142 +++++
 .../livepatch/test_modules/test_klp_syscall.c |    2 +
 19 files changed, 1043 insertions(+), 110 deletions(-)
 create mode 100644 arch/riscv/include/asm/stacktrace/common.h
 create mode 100644 arch/riscv/include/asm/stacktrace/frame.h
 create mode 100644 arch/riscv/kernel/tests/stacktrace_test.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
