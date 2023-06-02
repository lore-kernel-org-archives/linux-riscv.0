Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBCEC7EE2E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 16:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Z2GneDaD7Ny/6RjNj/kuhoS6+6N28hpJ+llYH+NWW0o=; b=B20
	weQIfMnjIxiIScSp24Q9eya19Jalt9Di0fhlEGZjWR6heTYeP8AoNYGbpRU5U3tlW1s5h+mWiX5rr
	V2FyZSGObWQil436ikPCLQ1VgI/bmx6ydWdM9BxjvLcQRzbYhKb1XdCXh+vmlNpXF+URaI61naMfg
	dAyJuwx2p1Dt89ix5GwaXJ5g/zcns6HRJvNV8Rk3fHZE6ddmUmaxwe0E/nP6moOPvqp4176qqeA12
	FkEaip1sRcKbJ9DoLPbYzHFwWeMYDNCyM2WJfP6oXwvg2aFIRdhF2a106vAC9+0kEZA80yEIATNdh
	LGxI81sbAC7LNOAGMTkrbqIeF1JY6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q57LC-007LT4-2W;
	Fri, 02 Jun 2023 16:09:26 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57L9-007LQ3-1G
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 16:09:25 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-25628b56c18so943577a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 09:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685722160; x=1688314160;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CrBznNpfIektl+0F56DGUskRV9SVRyyJJNGSAgJCWsU=;
        b=b0EK5EkQAvUbJd/5CI9JmaBA2AcS63I/nUtDpTen2VS8L6qUHg6hJhg/pSoRsKwY4v
         4zc/VohGEqRAQaxYJ8s5Q2wlDDmC09ip4PGnO085kJMhMWxl9YRHBs93r34YaRgw4pZ1
         huwuhwxN1DFxBu/3v8+NwObO937gaBYARAS9sxQSrfflMOhQ8yJa+YtpjeBho/o4y8iI
         9xCfS18WMita6JT6dnI49ZMdliDI9SVor79yYAeB5DCtqlu7a26jmHwHKghM4bNAYrAD
         e0AM/+ZNxKbH+7lx5Q1/kxruJPXl4BFhClRg34UJpUKntukQdSbuPskeuSipMWVufF4z
         6C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722160; x=1688314160;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CrBznNpfIektl+0F56DGUskRV9SVRyyJJNGSAgJCWsU=;
        b=XjtqA9IeCcVjrhxbpOB6FQ0XiwRWSp6FuhWFlDKpD1lrxjdgHi+asw6v8xaCFG4xWA
         jlhc1rFxraa5NxoNcADFPHjZ/6QviDq1cXBRO3yGry2srDGuoBO36xK1tZcBmL+PSB5v
         S8lHCytf+ZMx9AAVWg5YdxLyL2sAYcWq42T01BPTREEDN8JK4xcCsYEGRsIFBKJ+OYR5
         6G17OGwO1jcbVdqKJg4ZiiqGoPuQmJ3sI9yk7b9X8SCC19WiFmEu8rkjeHdMdjrgPfs+
         lkWHR6kRFA3ywmrLx3G1UNcMi24Igm8y8lxyJ4jlhGIgbZKghCSRU7IxJSG7QXPRwSGp
         G45A==
X-Gm-Message-State: AC+VfDyFzxKx6qQM4Fku85oQZ8CPpMzPQPukE3HJApSu2YvwlqGkWlb4
	JsHL/CEguPOwLjb9VV6WtPee08nenBNi
X-Google-Smtp-Source: ACHHUZ5ZGxbo+gkDx4JqKh+NeWoLt4VdzZkYMyMMkIG5LjQfWBJtHb0cBRHXtDUdDevPcUhc5Nq9rRO9T/h3
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a17:902:eac5:b0:1b1:7e1e:5ddd with SMTP id
 p5-20020a170902eac500b001b17e1e5dddmr91433pld.9.1685722159787; Fri, 02 Jun
 2023 09:09:19 -0700 (PDT)
Date: Fri,  2 Jun 2023 09:08:58 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602160914.4011728-1-vipinsh@google.com>
Subject: [PATCH v2 00/16] Use MMU read lock for clear-dirty-log
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
X-CRM114-CacheID: sfid-20230602_090923_427193_C350E739 
X-CRM114-Status: GOOD (  16.51  )
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

This series is on top of kvmarm/next as I needed to also modify Eager
page splitting logic in clear-dirty-log API. Eager page splitting is not
present in Linux 6.4-rc4.

Also, I had to change selftests patches (1 to 5) as some commits were
removed from kvm/queue remote. This caused issue due to different APIs
being present in dirty_log_perf_test when I was rebasing v2. Those
removed commits are now back in kvm-x86 branch of Sean [1] but not in
kvmarm/next or kvm/queue. I didn't want to wait for review of v2, so I
changed dirty_log_perf_test to work with kvmarm/next branch. When Sean's
kvm-x86 branch is merged, sleftests in this patch series need to be
modified to use new APIs or whoever merges last need to take care of
that.

This patch series modifies clear-dirty-log operation to run under MMU
read lock. It write protects SPTEs and split huge pages using MMU read
lock instead of MMU write lock.

Use of MMU read lock is made possible by using shared page table
walkers. Currently only page fault handlers use shared page table
walkers, with this series, clear-dirty-log operation will also use
shared page table walkers.

Patches 1 to 5:
These patches are modifying dirty_log_perf_test. Intent is to mimic
production scenarios where guest keeps on executing while userspace
thread collects and clears dirty logs independently.

Three new command line options are added:
1. j: Allows to run guest vCPUs and main thread collecting dirty logs
      independently of each other after initialization is complete.
2. k: Allows to clear dirty logs in smaller chunks compared to existing
      whole memslot clear in one call.
3. l: Allows to add customizable wait time between consecutive clear
      dirty log calls to mimic sending dirty memory to destination.

Patch 7-16:
These patches refactor code to move MMU lock operations to arch specific
code, refactor Arm's page table walker APIs, and change MMU write lock
for clearing dirty logs to read lock. Patch 16 has results showing
improvements based on dirty_log_perf_test.


1. https://lore.kernel.org/lkml/168565341087.666819.6731422637224460050.b4-ty@google.com/

v2:
- Fix compile warning for mips and riscv.
- Added logic to continue or retry shared page walk which are not fault
  handler.
- Huge page split also changed to run under MMU read lock.
- Added more explanations in commit logs.
- Selftests is modified because a commit series was reverted back in
  dirty_log_perf_test on kvm/queue.

v1: https://lore.kernel.org/lkml/20230421165305.804301-1-vipinsh@google.com/

Vipin Sharma (16):
  KVM: selftests: Clear dirty logs in user defined chunks sizes in
    dirty_log_perf_test
  KVM: selftests: Add optional delay between consecutive clear-dirty-log
    calls
  KVM: selftests: Pass the count of read and write accesses from guest
    to host
  KVM: selftests: Print read-write progress by vCPUs in
    dirty_log_perf_test
  KVM: selftests: Allow independent execution of vCPUs in
    dirty_log_perf_test
  KVM: arm64: Correct the kvm_pgtable_stage2_flush() documentation
  KVM: mmu: Move mmu lock/unlock to arch code for clear dirty log
  KMV: arm64: Pass page table walker flags to stage2_apply_range_*()
  KVM: arm64: Document the page table walker actions based on the
    callback's return value
  KVM: arm64: Return -ENOENT if PTE is not valid in stage2_attr_walker
  KVM: arm64: Use KVM_PGTABLE_WALK_SHARED flag instead of
    KVM_PGTABLE_WALK_HANDLE_FAULT
  KVM: arm64: Retry shared page table walks outside of fault handler
  KVM: arm64: Run clear-dirty-log under MMU read lock
  KVM: arm64: Pass page walker flags from callers of stage 2 split
    walker
  KVM: arm64: Provide option to pass page walker flag for huge page
    splits
  KVM: arm64: Split huge pages during clear-dirty-log under MMU read
    lock

 arch/arm64/include/asm/kvm_pgtable.h          |  42 +++--
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         |   4 +-
 arch/arm64/kvm/hyp/pgtable.c                  |  68 ++++++--
 arch/arm64/kvm/mmu.c                          |  65 +++++---
 arch/mips/kvm/mmu.c                           |   2 +
 arch/riscv/kvm/mmu.c                          |   2 +
 arch/x86/kvm/mmu/mmu.c                        |   3 +
 .../selftests/kvm/dirty_log_perf_test.c       | 147 ++++++++++++++----
 tools/testing/selftests/kvm/lib/memstress.c   |  13 +-
 virt/kvm/dirty_ring.c                         |   2 -
 virt/kvm/kvm_main.c                           |   4 -
 11 files changed, 265 insertions(+), 87 deletions(-)


base-commit: 532b2ecfa547f02b1825108711565eff026bce5a
-- 
2.41.0.rc0.172.g3f132b7071-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
