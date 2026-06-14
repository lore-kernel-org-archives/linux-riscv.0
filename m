Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A281BCD98D2
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jun 2026 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ELEThGQpmRUlL9cgaJHpb8WdeBT57vhx/YbV36fhtgQ=; b=A+87lVvQh2qjyI
	XP3wh8pD6HAPV+JgptdkMLjPM58UaltwuXplEvMnMPl4rJjXQWmXb34POEgEl6nnIbAUJVCcyum9v
	PfmjjGXU6OYQipl/ckoCs8viBqruxSvg+NHMv9CwxrVwJxorGey3Th/U+DWyMzRbIyRoTDJPajOnb
	P0IGBJCB15SJIgMl0HzzZMhMqhpGtYtBmI2oabPSeyBDg8iZ/MPdtuasFh74hT0TdCf9bt5e4puq4
	fqWPmvix8m8zOBbGQa29GO+fEFvA1P0cGjpFMX9DSUtcqMEasx/uKogi2rgzfhsyJMIAJczc8JIMY
	annOE4M2vwpSb3Ty81Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYhTl-0000000Cqxj-3GYx;
	Sun, 14 Jun 2026 09:50:09 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYhTi-0000000Cqx0-3809
	for linux-riscv@lists.infradead.org;
	Sun, 14 Jun 2026 09:50:08 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7e71dd64ea2so1426651a34.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jun 2026 02:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781430605; cv=none;
        d=google.com; s=arc-20240605;
        b=gwsVYdP0qK4tMqWElr6LlL5x+uXUIZHjzLtrPPq4QQhIFOsSbsNadVIfCVRWilVTDX
         TfGABFRWiExa//x+ybdii+TSpYfvCXpxRs80e58Jt7f11BhZemGKHsknmANsC5Fbidxo
         10iWGJR6y1hiVLgLrkxBEgNt0Li7mecZY1C0dc4G9ww4b6tqbnYkPIkOFVvvdCUIYAkT
         RncWr9KNSYwyx7++NU7hMsASuwt6MOIfwMq+3giCB8kYMKjN5l4nlCUtkTc2RS1JyKJr
         5nrJBdFMZQQUFx4ICSqbDk2FdhTiezcleGZI0FZkWja8iy54K/RlXhLH2m9dLi3Yufmv
         KpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=VcEaPc+InRyngVPx1TmveUSubcUpXss3FM5/ylmJY7w=;
        fh=nqedFrO6O5MP2Qbh9+wr25bPYVGYz8wG9cFNIUFTrxg=;
        b=VD20HU2WsBW57ksd1WIhQSHFhJZqiOUrx71bsap6wU49QDcGL/6XwYDrboNHpmVvkW
         pwHW4HpjFaxriOtoj5ktGYLpQr/iN8OJJz262kWEUuzJ5o4kAlZlL90ZRMFBy5juO22/
         mzsEcxCFJ/iwaX8zF5ZDhMdqTm2yNhhDCkLQO0YD+NeiLd409HEtz2rzfI4GUdWcFxQp
         YoYn9dX5LDaGhQqZMzFFZimJkVVNkKRBwyLQKcxX/4A1vduMo4IPlgAG0cLSLOUhoCDC
         wOVeN0f2Z9WEhEkC2TCc8UyDKCWvcE+D/rF53aRNJO15W1Ymw3B43bvLIfHCrv2coOEe
         xZOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1781430605; x=1782035405; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VcEaPc+InRyngVPx1TmveUSubcUpXss3FM5/ylmJY7w=;
        b=x3x3Xfw8Bn9q2Ug/f23jG4xQEq6aMIMwVLA/XoDG1alClpgEMFV1XXU1kWMoc/9ML2
         W1QEkLSPQQEvVByCDJbYx8Pe1hojT4ADTKLX6tHg233UfIFs0E4eOisyhAmW5b4QKs1C
         JMPtCes5p+Chc6BOov2c3g9ZV+S+/gtKvdT4dNRSlyGPnOoQ4U+IewD/OldnDDSwTcEf
         D65S4lH7hYrsmhpSaRiS8lcJ65NtxStBnjtBxlHq79YollQn8pPrJYM0RDItonRPemyC
         wgqVenPmf+q/0q44DPIRcuGVc987BhrSVfjVJK8iKR/eJkNUl4K4kFC7bQLyyR7wHdd+
         FF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781430605; x=1782035405;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VcEaPc+InRyngVPx1TmveUSubcUpXss3FM5/ylmJY7w=;
        b=MF15/CGjhYLi5XRglc9Gu6Quod6kKkaxvEMzCqkQEY7FxRf1zdBk8vUSDUsL0AMRvB
         +KeRnXpj9CviouLxVtWGglXoyiUAwSL0nCA0sD96yk3/jDgGV2RBBi5hmYfrb9cpQTsn
         iIVVnrFqDp1MKGU3CdAiXFliiJXme4ipggj30H5qTCeDuVSnb/ZcfT/7Lv4wUatV+0+G
         6kWcfmJYtc32ZzXoxZg4xlUawT68E/V50X0f5FVkIHqZk5sOhmkfwdeRINN9Pot/lcSg
         5hsf9rbBlFgGzeHo5etcXevY+YDKBTKPWNb//+65DDvOhwXiouZj0+2ZUMOyMIOrcz9W
         LOMw==
X-Forwarded-Encrypted: i=1; AFNElJ8JRqNR7SpxEWaEqphhA9UDWu6W4HbofTf3lrit9+ahvUzkoSqC5AdZDxq97DbEQJE0N+qL985pIcwOEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YygpHys8zR8iAVKQz8M/HCQxV2ifr0SyLSvIO7hTh/3H6gY/Au5
	5R7Pw/vHNOzfrgi+z1QmPPbYORIF8JwqfdUcE31FC2WKgxKMUdAi4JeQv4HDIxc7pRiLYfQB3mI
	+hLAbaQnHG9CemxksAnbupeQ3SfWyDrpFHtYvmxnrMw==
X-Gm-Gg: Acq92OFuHfGupArb4qvWzlJIKiOT8n+56sBZYPeafI3Agp6Fk78wMGN6+/Q2BbatCrQ
	GIvbhkVc4hDiWGnqoSRlWpDJ0dg+xDvToAihvWUIs23/7qwV75Ds2Hd8kxVFOJJG0t3K+8avma4
	09c0p7OOCBbQAwt8LakUIrpphRuZJXs4ShV8gOY8uzfcKRGP7q0bI87xzrFESRB/tNM551YK7qz
	w4zOpRtfq8mYw3nEBreDytEkTXtDOP1bci8Megx7kdCWEsbMGwW5Eoulj3YfDoX9Sw/OQ3g+ZND
	cM7o6Ir/K9RJLsOadQ/F5QjmxfdObvxJq8ukbso39hbXt8G5kmDWUtLQg40ffX+q6cmFp/PFUqt
	1U/JkqnDU4r3iy/jKzuQu4ttX
X-Received: by 2002:a05:6808:f8b:b0:47b:c703:4239 with SMTP id
 5614622812f47-48741bd0be7mr4157764b6e.37.1781430605198; Sun, 14 Jun 2026
 02:50:05 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sun, 14 Jun 2026 15:19:53 +0530
X-Gm-Features: AVVi8CfHnWnteBOIh40QsRCyc8p5St1as7WBgGCWiIu98anP84j67OfEd2A8iWA
Message-ID: <CAAhSdy0WTa-jDxg0cQxwqfGM+Det+WxM-ELV3F2ktrcbw8g7Bw@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 7.2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_025007_073281_4B7A1A9F 
X-CRM114-Status: UNSURE (   8.30  )
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

Hi Paolo,

We have the following KVM RISC-V changes for 7.2:
1) Batch G-stage TLB flushes for GPA range based page table updates
2) Convert HGEI line management to fully per-HART
3) Speed up dirty logging write faults using MMU rwlock and atomic
    PTE updates for permission-only changes
4) Use flexible array for APLIC IRQ state
5) FWFT fixes for missing CSR dirty marking and stale feature
    exposure to Guest/VM
6) Fix logging enable check on a memslot by using
    kvm_slot_dirty_track_enabled()
7) Fixes to avoid skipping valid pages in kvm_riscv_gstage_wp_range()
    and kvm_riscv_gstage_unmap_range()

Please pull.

Regards,
Anup

The following changes since commit e7ae89a0c97ce2b68b0983cd01eda67cf373517d:

  Linux 7.1-rc5 (2026-05-24 13:48:06 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-7.2-1

for you to fetch changes up to 52738352a6f29279e15285fcb7b50241ef867e27:

  riscv: kvm: Use endian-specific __lelong for NACL shared memory
(2026-06-14 11:09:41 +0530)

----------------------------------------------------------------
KVM/riscv changes for 7.2

- Batch G-stage TLB flushes for GPA range based page table updates
- Convert HGEI line management to fully per-HART
- Fix missing CSR dirty marking when FWFT state updated via ONE_REG
- Fix stale FWFT feature exposure to Guest/VM
- Speed up dirty logging write faults using MMU rwlock and atomic
  PTE updates using cmpxchg() for permission-only changes
- Use flexible array for APLIC IRQ state
- Use kvm_slot_dirty_track_enabled() for logging enable check on
  a memslot
- Avoid skipping valid pages in kvm_riscv_gstage_wp_range()
- Avoid skipping valid pages in kvm_riscv_gstage_unmap_range()
- Use endian-specific __lelong for NACL shared memory

----------------------------------------------------------------
Guo Ren (Alibaba DAMO Academy) (2):
      irqchip/riscv-imsic: Add nr_guest_files in per-HART local config
      RISC-V: KVM: AIA: Make HGEI number management fully per-CPU

Inochi Amaoto (1):
      RISC-V: KVM: Enhance the logging check for mmu mapping

Jiakai Xu (2):
      RISC-V: KVM: Document a TOCTOU race in SBI system suspend handler
      RISC-V: KVM: Fix NULL pointer dereference in AIA IMSIC functions

Jinyu Tang (8):
      RISC-V: KVM: Batch stage-2 TLB flushes
      KVM: riscv: Rely on common MMU notifier locking
      KVM: riscv: Use an rwlock for mmu_lock
      KVM: riscv: Add a G-stage PTE cmpxchg helper
      KVM: riscv: Update G-stage PTE permissions atomically
      KVM: riscv: Fast-path dirty logging write faults
      KVM: riscv: Check hugetlb block mappings against memslot bounds
      KVM: selftests: Add a hugetlb memslot alignment test mode

Mayuresh Chitale (1):
      RISC-V: KVM: Fix ebreak self test failure

Qiang Ma (1):
      RISC-V: KVM: Fix timer state restore

Rosen Penev (1):
      RISC-V: KVM: Use flexible array for APLIC IRQ state

Sean Chang (1):
      riscv: kvm: Use endian-specific __lelong for NACL shared memory

Wu Fei (2):
      RISC-V: KVM: Fix skip of valid pages in kvm_riscv_gstage_wp_range
      RISC-V: KVM: Fix skip of valid pages in kvm_riscv_gstage_unmap_range

Yong-Xuan Wang (5):
      KVM: RISC-V: SBI FWFT: Mark vCPU CSRs dirty after setting feature value
      KVM: RISC-V: SBI FWFT: Add optional init() callback for hardware probing
      KVM: RISC-V: SBI FWFT: Fix stale feature exposure after runtime
extension changes
      KVM: riscv: selftests: Refactor ISA and SBI extension sublist macros
      KVM: riscv: selftests: Split SBI FWFT into separate
feature-specific sublists

 arch/riscv/include/asm/kvm_aia.h                  |   2 +-
 arch/riscv/include/asm/kvm_gstage.h               |  10 +-
 arch/riscv/include/asm/kvm_host.h                 |   2 +
 arch/riscv/include/asm/kvm_nacl.h                 |  14 +-
 arch/riscv/include/asm/uaccess.h                  |   2 +-
 arch/riscv/kvm/aia.c                              |  88 +++++----
 arch/riscv/kvm/aia_aplic.c                        |  15 +-
 arch/riscv/kvm/aia_device.c                       |   4 +-
 arch/riscv/kvm/aia_imsic.c                        |   9 +
 arch/riscv/kvm/gstage.c                           | 100 ++++++----
 arch/riscv/kvm/main.c                             |   8 +-
 arch/riscv/kvm/mmu.c                              | 211 ++++++++++++++++++----
 arch/riscv/kvm/nacl.c                             |   2 +-
 arch/riscv/kvm/vcpu.c                             |   1 +
 arch/riscv/kvm/vcpu_sbi_fwft.c                    |  44 ++++-
 arch/riscv/kvm/vcpu_sbi_system.c                  |  14 ++
 arch/riscv/kvm/vcpu_timer.c                       |   2 +-
 drivers/irqchip/irq-riscv-imsic-state.c           |   9 +-
 include/linux/irqchip/riscv-imsic.h               |   5 +-
 tools/testing/selftests/kvm/kvm_page_table_test.c |  28 ++-
 tools/testing/selftests/kvm/riscv/get-reg-list.c  | 138 ++++++++------
 21 files changed, 499 insertions(+), 209 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
