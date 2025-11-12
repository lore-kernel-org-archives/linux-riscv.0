Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBBECCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 06:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lllD0qIoy8M4AM4y2xOFXPeEDrdj4W8tDpg47Ex7o6I=; b=rZ4eL5GruE0rJw
	vo77T+qtxiGhj70Zbihu41EAj4sYPofHBvHF3VFDSoD1gEbiQZdw/QdLcwLMcNX2Br1WL9B/ETnQD
	+1GR767GxXlvU9D54+Yp6IDXm77TftivS3n+cnw3b2dxkyz38QUYFG7BydNSLJtjrh2FEKLb7o6Hj
	w/0GBCYk6rVYSTK2VNsTyy0ot+7W2lOND7uc70xiif1kDQ4OpRDDOAPccwYJS4FSK3ZywAOK3SAAv
	GdWJCbV9mUrZJ8ExnOlJFPd2cUR/4dRLzEdTNQXYNf+pPCsaiYzSW0KRYgmdBNMWv6NFQ8ZkoRpyx
	ZGY+VlgX0jXLs0BJ9KaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4TL-00000008D0i-3NBE;
	Wed, 12 Nov 2025 06:36:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4TJ-00000008Cyr-1dnq
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 06:36:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CE3443C50
	for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 06:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1383CC4CEF7
	for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 06:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762929408;
	bh=58cNW3q8wtf20Gt0V2Q6GFfCraW2CWPIgpayY1ON4zg=;
	h=Date:From:To:Subject:From;
	b=QhM9qaEKe5PA5TfeudB5QIjORv2jNN+eyOKvsuYQa1cLOfaUcNCJB3JyHbz/DZfwq
	 P81248cPFow/Ye9wZGCp6mTbYe+cBSvPg8JxgB2pI++M5I16woQW86kDOJNvq0lQah
	 56pwfZPA4RbdVc4Lx3gvjZF5wIx0h5HPmWRlLEz0FeHMh/DqUpHXoIWbzkEqsdCTPu
	 OylY60VlNVQu2siiukGTFFV9IwrfRivPikt5lklt5vEpOx5sGzjE+K2Z1uwAVaxDQ7
	 7OOv1DMeDkVWlsVFWKb9lWW+YFllI3HsEVIUUDBngqsfJbX3aJXne2a0gBmNZum9DN
	 MhFRCiodOfOPw==
Date: Tue, 11 Nov 2025 23:36:46 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: RISC-V experimental branch updated (tag:
 riscv-experimental-for-v6.19-2025111101)
Message-ID: <93832a0d-eb0e-7da3-d166-2eb5fba3d5b3@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_223649_474831_CB821BCA 
X-CRM114-Status: UNSURE (   9.38  )
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


A new experimental tag, riscv-experimental-for-v6.19-2025111101, is 
available for testing:

   https://git.kernel.org/pub/scm/linux/kernel/git/pjw/riscv.git/tag/?h=riscv-experimental-for-v6.19-2025111101

Any feedback from testing, particularly on pre-release hardware, would be 
appreciated.


- Paul

riscv-experimental-for-v6.19-2025111101 contains patches from:

- experimental/hotplug-parallel 
- experimental/sse-v8
- experimental/zicbop-v3
- experimental/svrsw60t59b-v14
- experimental/has-extension-likely-v4
- experimental/clean-up-pgtable-h
- experimental/raid6-remainder-v3
- experimental/vector-regset-v2
- experimental/zalasr-probing-v3
- experimental/cfi-v22

Diffstat from commit 4427259cc7f7:

 Documentation/admin-guide/kernel-parameters.txt    |   8 +
 Documentation/arch/riscv/hwprobe.rst               |  11 +-
 Documentation/arch/riscv/index.rst                 |   2 +
 Documentation/arch/riscv/zicfilp.rst               | 115 ++++
 Documentation/arch/riscv/zicfiss.rst               | 179 ++++++
 .../devicetree/bindings/riscv/extensions.yaml      |  25 +
 MAINTAINERS                                        |  15 +
 arch/riscv/Kconfig                                 |  40 +-
 arch/riscv/Makefile                                |   8 +-
 arch/riscv/configs/hardening.config                |   4 +
 arch/riscv/include/asm/arch_hweight.h              |  24 +-
 arch/riscv/include/asm/asm-prototypes.h            |   1 +
 arch/riscv/include/asm/asm.h                       |  14 +-
 arch/riscv/include/asm/assembler.h                 |  44 ++
 arch/riscv/include/asm/bitops.h                    |  32 +-
 arch/riscv/include/asm/checksum.h                  |  13 +-
 arch/riscv/include/asm/cmpxchg.h                   |  12 +-
 arch/riscv/include/asm/cpufeature.h                |  12 +
 arch/riscv/include/asm/csr.h                       |  16 +
 arch/riscv/include/asm/entry-common.h              |   2 +
 arch/riscv/include/asm/hwcap.h                     |   4 +
 arch/riscv/include/asm/hwprobe.h                   |   2 +-
 arch/riscv/include/asm/insn-def.h                  |  79 +++
 arch/riscv/include/asm/mman.h                      |  26 +
 arch/riscv/include/asm/mmu_context.h               |   7 +
 arch/riscv/include/asm/pgtable-bits.h              |  37 ++
 arch/riscv/include/asm/pgtable.h                   | 204 +++++-
 arch/riscv/include/asm/processor.h                 |   1 +
 arch/riscv/include/asm/sbi.h                       |  61 ++
 arch/riscv/include/asm/scs.h                       |   7 +
 arch/riscv/include/asm/sse.h                       |  47 ++
 arch/riscv/include/asm/switch_to.h                 |  14 +
 arch/riscv/include/asm/thread_info.h               |   4 +
 arch/riscv/include/asm/usercfi.h                   |  97 +++
 arch/riscv/include/asm/vdso.h                      |  13 +-
 arch/riscv/include/asm/vector.h                    |   4 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   5 +
 arch/riscv/include/uapi/asm/ptrace.h               |  34 +
 arch/riscv/include/uapi/asm/sigcontext.h           |   1 +
 arch/riscv/kernel/Makefile                         |   3 +
 arch/riscv/kernel/asm-offsets.c                    |  25 +
 arch/riscv/kernel/cpufeature.c                     |  29 +
 arch/riscv/kernel/entry.S                          |  38 ++
 arch/riscv/kernel/head.S                           |  27 +
 arch/riscv/kernel/process.c                        |  27 +-
 arch/riscv/kernel/ptrace.c                         | 119 +++-
 arch/riscv/kernel/sbi_sse.c                        | 162 +++++
 arch/riscv/kernel/sbi_sse_entry.S                  | 178 ++++++
 arch/riscv/kernel/signal.c                         | 148 ++++-
 arch/riscv/kernel/smpboot.c                        |  15 +
 arch/riscv/kernel/sys_hwprobe.c                    |   9 +
 arch/riscv/kernel/sys_riscv.c                      |  10 +
 arch/riscv/kernel/traps.c                          |  54 ++
 arch/riscv/kernel/usercfi.c                        | 544 ++++++++++++++++
 arch/riscv/kernel/vdso.c                           |   7 +
 arch/riscv/kernel/vdso/Makefile                    |  40 +-
 arch/riscv/kernel/vdso/flush_icache.S              |   4 +
 arch/riscv/kernel/vdso/gen_vdso_offsets.sh         |   4 +-
 arch/riscv/kernel/vdso/getcpu.S                    |   4 +
 arch/riscv/kernel/vdso/note.S                      |   3 +
 arch/riscv/kernel/vdso/rt_sigreturn.S              |   4 +
 arch/riscv/kernel/vdso/sys_hwprobe.S               |   4 +
 arch/riscv/kernel/vdso/vgetrandom-chacha.S         |   5 +-
 arch/riscv/kernel/vdso_cfi/Makefile                |  25 +
 arch/riscv/kernel/vdso_cfi/vdso-cfi.S              |  11 +
 arch/riscv/kernel/vector.c                         |   2 +
 arch/riscv/lib/csum.c                              |  53 +-
 arch/riscv/mm/init.c                               |   2 +-
 arch/riscv/mm/pgtable.c                            |  38 +-
 drivers/firmware/Kconfig                           |   1 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/riscv/Kconfig                     |  15 +
 drivers/firmware/riscv/Makefile                    |   3 +
 drivers/firmware/riscv/riscv_sbi_sse.c             | 694 +++++++++++++++++++++
 drivers/perf/Kconfig                               |  10 +
 drivers/perf/riscv_pmu.c                           |  23 +
 drivers/perf/riscv_pmu_sbi.c                       |  71 ++-
 fs/proc/task_mmu.c                                 |  15 +-
 fs/userfaultfd.c                                   |  22 +-
 include/asm-generic/pgtable_uffd.h                 |  17 +
 include/linux/cpu.h                                |   4 +
 include/linux/mm.h                                 |  10 +
 include/linux/mm_inline.h                          |   8 +-
 include/linux/perf/riscv_pmu.h                     |   5 +
 include/linux/pgtable.h                            |  12 +
 include/linux/riscv_sbi_sse.h                      |  57 ++
 include/linux/userfaultfd_k.h                      | 114 ++--
 include/uapi/linux/elf.h                           |   2 +
 include/uapi/linux/prctl.h                         |  27 +
 kernel/sys.c                                       |  30 +
 lib/raid6/recov_rvv.c                              |   7 +-
 lib/raid6/rvv.c                                    | 299 ++++-----
 lib/raid6/rvv.h                                    |  17 +
 lib/raid6/test/Makefile                            |   8 +
 mm/debug_vm_pgtable.c                              |  10 +-
 mm/huge_memory.c                                   |  13 +-
 mm/internal.h                                      |   2 +-
 mm/memory.c                                        |   6 +-
 mm/mmap.c                                          |   6 +-
 mm/mremap.c                                        |  13 +-
 mm/userfaultfd.c                                   |  10 +-
 mm/vma.c                                           |   6 +-
 mm/vma_exec.c                                      |   5 +-
 tools/testing/selftests/riscv/Makefile             |   2 +-
 tools/testing/selftests/riscv/cfi/.gitignore       |   3 +
 tools/testing/selftests/riscv/cfi/Makefile         |  16 +
 tools/testing/selftests/riscv/cfi/cfi_rv_test.h    |  82 +++
 tools/testing/selftests/riscv/cfi/riscv_cfi_test.c | 173 +++++
 tools/testing/selftests/riscv/cfi/shadowstack.c    | 385 ++++++++++++
 tools/testing/selftests/riscv/cfi/shadowstack.h    |  27 +
 tools/testing/selftests/riscv/hwprobe/cbo.c        | 188 +++++-
 tools/testing/selftests/riscv/sse/Makefile         |   5 +
 tools/testing/selftests/riscv/sse/module/Makefile  |  16 +
 .../selftests/riscv/sse/module/riscv_sse_test.c    | 511 +++++++++++++++
 tools/testing/selftests/riscv/sse/run_sse_test.sh  |  44 ++
 tools/testing/selftests/riscv/vector/Makefile      |   5 +-
 .../testing/selftests/riscv/vector/vstate_ptrace.c | 134 ++++
 117 files changed, 5487 insertions(+), 465 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
