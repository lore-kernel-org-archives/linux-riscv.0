Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D37C7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 16:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=uP2HBO29FD5PRMLUHLSMzEplbBOVqC2H3TJT2+VS0h8=; b=FX2
	MOqDZ80ouCWJZZGq9ueut7J8cTLlxrq/1Zk0AUHEX7/v5LZnnooN85+QkZHFL9UB4bCgXYRhYsqMO
	4qp5+GERVThmBQF2tTrDGYo5oLJ1hgfzkqKukNdJqyfaSh2x4Wks4CoGrZD2W8DhZMzOxxiICwvui
	IP+tOGPhKYpfkY1YhjTdTcuq91OYG/pZFtJue2PTqYT2BjebKt3PeVX/Ono8+XYeTR1Aps3Utnqno
	HAcraaE3jTyyLGYVIBfvUQ//EuNVGK2CeQyyXZa2XpBqanZzuH2ULrBexbP+meBX67xGTYukQJafM
	J/5wgWxG0z/RfZONfu7dwxw3Mr/tbPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppu0a-00BR7C-0x;
	Fri, 21 Apr 2023 16:53:16 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppu0V-00BR3q-16
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 16:53:13 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-63b41df6c5aso1750849b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 09:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682095989; x=1684687989;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bpz9GCI4OFqr9DlnIkg8fh50O4zOZAPmw/GqyWI1sUY=;
        b=DGn7gCykqxE1wl2tXEHxtzFbscSQI+JYs1BOyBXnwpOUa0v37O5EWPBn/ZgODYtQlN
         ucm2bl+oRpYs66hkDH2OsTMMwYnJjHqmfL1Gfoz55eaPsC+KkP0XkEqAwZ6rs8pd6Rpz
         FUqoTwNDb4fdpZO/bATUsOleiUawwODIJsv2oBaDLHov514nHeOp01TeHl5biXsvmD+B
         drB6ioShN8gZ615eSTgzwj90uRL3MtckEF9+PdrDWulnCx0CuSxldhcUkAHan3z7jBnk
         tHJsR2+7JQcAF/jPDdgXfTyng+EIcBFq/MixhtIbZMOElAUZCqnEM9rZEPv1BqgcbQ1G
         Ek/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095989; x=1684687989;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bpz9GCI4OFqr9DlnIkg8fh50O4zOZAPmw/GqyWI1sUY=;
        b=IrBFZ1HM5FMlyVPiIQ4MlhcQtu/UGKxTdtY/A4sm7cNXKuiNyF1rP6a3Sh21jpahbu
         s4ytb3g85ae1Svk+eId6bTyOpVXuKrRRn2c27U7BkLf20vKVrum1DjyVnTSW6vCoBSHe
         w/1wmORdTXcX68f+i1ftl/Ljqe9pfNRZ/6cg0Z/IEPr4LSGkmAPSKkDFq2csfoYHQiz/
         sCe5q1qj/B8zVspzYMZEEkrsYFF/RMY2yaJbtzKkKvDPep0vjYjU5IFtA2zyHc+ufcwX
         SiAR2is3KxgHBppzPZ4n6tOpfgqhmr26DKepZN9XVoOuGRbgzoKp4BFqCHU04q9nra12
         sYIw==
X-Gm-Message-State: AAQBX9eNpOnwj3KxvQLbx2K97RctlCOORVSw/Ti3a7tIKLw9bQixvQyn
	4WFD6P55+4zxj+k4B80z/0emDwQf3nX8
X-Google-Smtp-Source: AKy350ZhH26lR6IB3CnQ8CLF2JwssN6KagmxAVm6T/W0c2gS8Zvsk3hHnJOD9Yv5ucUQ9FKvawPIRN1PXzlu
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a05:6a00:b94:b0:63d:397a:8fdd with SMTP id
 g20-20020a056a000b9400b0063d397a8fddmr2339440pfj.0.1682095989138; Fri, 21 Apr
 2023 09:53:09 -0700 (PDT)
Date: Fri, 21 Apr 2023 09:52:56 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <20230421165305.804301-1-vipinsh@google.com>
Subject: [PATCH 0/9] KVM: arm64: Use MMU read lock for clearing dirty logs
From: Vipin Sharma <vipinsh@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, 
	tsbogend@alpha.franken.de, anup@brainfault.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, pbonzini@redhat.com, dmatlack@google.com, 
	ricarkol@google.com
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_095311_377741_E703E570 
X-CRM114-Status: GOOD (  10.10  )
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

This patch series improves guest vCPUs performances on Arm during clearing
dirty log operations by taking MMU read lock instead of MMU write lock.

vCPUs write protection faults are fixed in Arm using MMU read locks.
However, when userspace is clearing dirty logs via KVM_CLEAR_DIRTY_LOG
ioctl, then kernel code takes MMU write lock. This will block vCPUs
write protection faults and degrade guest performance.  This
degradation gets worse as guest VM size increases in terms of memory and
vCPU count.

In this series, MMU read lock adoption is made possible by using
KVM_PGTABLE_WALK_SHARED flag in page walker.

Patches 1 to 5:
These patches are modifying dirty_log_perf_test. Intent is to mimic
production scenarios where guest keeps on executing while userspace
threads collect and clear dirty logs independently.

Three new command line options are added:
1. j: Allows to run guest vCPUs and main thread collecting dirty logs
      independently of each other after initialization is complete.
2. k: Allows to clear dirty logs in smaller chunks compared to existing
      whole memslot clear in one call.
3. l: Allows to add customizable wait time between consecutive clear
      dirty log calls to mimic sending dirty memory to destination.

Patch 7-8:
These patches refactor code to move MMU lock operations to arch specific
code, refactor Arm's page table walker APIs, and change MMU write lock
for clearing dirty logs to read lock. Patch 8 has results showing
improvements based on dirty_log_perf_test.

Vipin Sharma (9):
  KVM: selftests: Allow dirty_log_perf_test to clear dirty memory in
    chunks
  KVM: selftests: Add optional delay between consecutive Clear-Dirty-Log
    calls
  KVM: selftests: Pass count of read and write accesses from guest to
    host
  KVM: selftests: Print read and write accesses of pages by vCPUs in
    dirty_log_perf_test
  KVM: selftests: Allow independent execution of vCPUs in
    dirty_log_perf_test
  KVM: arm64: Correct the kvm_pgtable_stage2_flush() documentation
  KVM: mmu: Move mmu lock/unlock to arch code for clear dirty log
  KMV: arm64: Allow stage2_apply_range_sched() to pass page table walker
    flags
  KVM: arm64: Run clear-dirty-log under MMU read lock

 arch/arm64/include/asm/kvm_pgtable.h          |  17 ++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         |   4 +-
 arch/arm64/kvm/hyp/pgtable.c                  |  16 ++-
 arch/arm64/kvm/mmu.c                          |  36 ++++--
 arch/mips/kvm/mmu.c                           |   2 +
 arch/riscv/kvm/mmu.c                          |   2 +
 arch/x86/kvm/mmu/mmu.c                        |   3 +
 .../selftests/kvm/dirty_log_perf_test.c       | 108 ++++++++++++++----
 .../testing/selftests/kvm/include/memstress.h |  13 ++-
 tools/testing/selftests/kvm/lib/memstress.c   |  43 +++++--
 virt/kvm/dirty_ring.c                         |   2 -
 virt/kvm/kvm_main.c                           |   4 -
 12 files changed, 185 insertions(+), 65 deletions(-)


base-commit: 95b9779c1758f03cf494e8550d6249a40089ed1c
-- 
2.40.0.634.g4ca3ef3211-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
