Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13763C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:26:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C13E8611CA
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C13E8611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:
	Mime-Version:Message-Id:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Z0dU822y9mi2KrLnSTwDdE7S1lj+wGsfpJEcbDe+W7k=; b=mGD
	Ma1PN4IDjWMZOecZSGSFy87fi035gRrWnSyAEJ/ci9LZmSpqagr8UBZjpV1hYEGGuZp81pgZclT2w
	/Qa+9RwJrmtqou8gAPVsNa8IWLMJP/engLIUXyT+8nfqT41Az53k4wHV0PgjOmyuqyf6ovempIYir
	6AFoI9qh+3ra9nm70IoUAnuxRCDij0hZsUrtCfu/NG1jPWFGl3OqMWLKtSvqJUVNyvdN6mRU5nhO8
	gNn5K5kVYnrTpy3NzKzJjNRBi16dSg/hocPBpYa3Srs6Xev2DX8R2G5LwKvbnebeqBr7zST1dDCcB
	+u32BhPbZQoxTwCvXMjurYPHdLcgxFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQaD-007Ciq-AM; Thu, 04 Nov 2021 00:26:21 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQZr-007CV4-VS
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:04 +0000
Received: by mail-pf1-x449.google.com with SMTP id
 v62-20020a627a41000000b00492638b8ebfso2134280pfc.10
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:message-id:mime-version:subject:from:to:cc;
 bh=ANJRuFa6/N/mrCRTja+awZQkxH6czfCyQf64cMZwz24=;
 b=WcXudEzcD22tH+HPG355uae4O/TbLzq7rMXZkNlJ48SpnvVzn/SR3sHk8XQtIKtfFy
 48xyMqlSGgw1oTNAo0R/J1vgWG1e93UerRyqKUD5Qa2c4/ULYf5WGk93DChSYqJ9agNH
 Fa9nJgKDtBpUeiYCj9euvUxsBrArkkfyhnSH1PJXr2Gl/88Cl0a4CGn9Y4iADsm2poc/
 3MOL6YBHtOByIy6pf9yCo8zV4vME+dV5MfimvChSWTjN9iYTgoDtkS3nqw29fVsbEqKV
 PJA6Jv6ck5l08RPLmQ8vK5IF61aQorHOz4MISeHyAQxK20Y0bx5AN/DrWmyFqvqM0FL4
 ZOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
 :from:to:cc;
 bh=ANJRuFa6/N/mrCRTja+awZQkxH6czfCyQf64cMZwz24=;
 b=hXCk/vSDpyewLXvz1pQMZmT9pxDJkKHj1jGvhVw0Uj7LwHb2Pe570kacGh02nDm11q
 MkzKraP23xoYVoev7r8JPc8Mn6QXe8BUqBW9JJjgZs+CEOimKVZ5qbUBeX6djxaskGV1
 UWxNd9PEvz2PxtDAEjhPhdjMDMSKGJTn67mWHt+ghuUs1HylT8a9M760LgklUZrp5XV3
 ABMUoW49FfD/2vmQYuAw2R8Zlh4h+Cf6W96WIHjDTFNpv2n/jNjwKvCyldptIgHxCBeX
 OHHMpAwz2v6DXEZ0DJSsqOq17IXb5sNkTM3qosGhgHmYa6o6v9UEygp6XAZ1NHPWmWAK
 0IMQ==
X-Gm-Message-State: AOAM530sR4SRfW4S+/kBcg3beINTtJhXHXySs4KxN+sXkUW5ud5jvPDr
 Q+byaxpg5iFtpvnX9BRlxsDX3wFvkYk=
X-Google-Smtp-Source: ABdhPJzlsKffFyG0Dw31UftnkkBVRPshFrq8ZrwsZvAX9gzLEmIDzXxmuc9EMVEJieZwGIMkD2hcP4GKkP4=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90a:5285:: with SMTP id
 w5mr261213pjh.1.1635985558096; Wed, 03 Nov 2021 17:25:58 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:01 +0000
Message-Id: <20211104002531.1176691-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 00/30] KVM: Scalable memslots implementation
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, 
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ben Gardon <bgardon@google.com>, 
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_172600_047245_A468476F 
X-CRM114-Status: GOOD (  16.95  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series is an iteration of Maciej's scalable memslots work.  It
addresses most, but not all, of my feedback from v5, hence the "5.5"
moniker.  Specifically, I did not touch the iteration over gfn and hva
ranges as I would likely do more harm than good, especially in the gfn
iterator.

The core functionality of the series is unchanged from v5 (or at least,
it should be).  Patches "Resolve memslot ID via a hash table" and "Keep
memslots in tree-based structures" are heavily reworked (the latter in
particular) to provide better continuity between patches and to avoid
the swap() logic when working with the "inactive" set of memslots.  But
again, the changes are intended to be purely cosmetic.

Paolo, ideally I'd like get to patch 03 (and therefore patch 02) into 5.16.
The patch technically breaks backwards compatibility with 32-bit KVM, but
I'm quite confident none of the existing 32-bit architectures can possibly
work.  RISC-V is the one exception where it's not obvious that creating
more guest memslot pages than can fit in an unsigned long won't fall on its
face.  Since RISC-V is new in 5.16, I'd like to get that change in before
RISC-V can gain any users doing bizarre things.

s390 folks, please look closely at patch 11, "KVM: s390: Use "new" memslot
instead of userspace memory region".  There's a subtle/weird functional
change in there that I can't imagine would negatively affect userspace,
but the end result is odd nonetheless.

Claudio, I dropped your R-b from "KVM: Integrate gfn_to_memslot_approx()
into search_memslots()" because I changed the code enough to break the s390
build at least once :-)

Patches 01 and 02 are bug fixes.

Patch 03 is fix of sorts to require that the total number of pages across
all memslots fit in an unsigned long.  The existing 32-bit KVM
architectures don't correctly handle this case, and fixing those issues
would quite gross and a waste of time.

Patches 04-18 are cleanups throughout common KVM and all architectures
to fix some warts in the memslot APIs that allow for a cleaner (IMO)
of the tree-based memslots code.  They also prep for more improvements
that are realized in the final patch.

Patches 19-28 are the core of Maciej's scalable memslots work.

Patches 29-30 take advantage of the tree-based memslots to avoid creating
a dummy "new" memslot on the stack, which simplifies the MOVE case and
aligns it with the other three memslot update cases.

v5.5
  * Add all the pre- and post-work cleanups.
  * Rebase to kvm/queue, commit 0d7d84498fb4 ("KVM: x86: SGX must...")
  * Name innermost helper ____gfn_to_memslot() instead of ...approx. [Sean]
  * Rework hash list patch and all subsequent tree modifications to use
    common kvm_memslot_replace() helper. [Sean]
  * Rework tree-based approach to avoid swap() by always pulling the
    invalid memslot tree on-demand, and by relying on precise variables
    names and comments (for the invidual memslot pointers).

v5:
  * https://lkml.kernel.org/r/cover.1632171478.git.maciej.szmigiero@oracle.com
  * Rebase onto v5.15-rc2 (torvalds/master),
  * Fix 64-bit division of n_memslots_pages for 32-bit KVM,
  * Collect Claudio's Reviewed-by tags for some of the patches.

Early history can be found in the above lore link.
 
Maciej S. Szmigiero (10):
  KVM: Resync only arch fields when slots_arch_lock gets reacquired
  KVM: x86: Use nr_memslot_pages to avoid traversing the memslots array
  KVM: Integrate gfn_to_memslot_approx() into search_memslots()
  KVM: Move WARN on invalid memslot index to update_memslots()
  KVM: Resolve memslot ID via a hash table instead of via a static array
  KVM: Use interval tree to do fast hva lookup in memslots
  KVM: s390: Introduce kvm_s390_get_gfn_end()
  KVM: Keep memslots in tree-based structures instead of array-based
    ones
  KVM: Optimize gfn lookup in kvm_zap_gfn_range()
  KVM: Optimize overlapping memslots check

Sean Christopherson (20):
  KVM: Ensure local memslot copies operate on up-to-date arch-specific
    data
  KVM: Disallow user memslot with size that exceeds "unsigned long"
  KVM: Require total number of memslot pages to fit in an unsigned long
  KVM: Open code kvm_delete_memslot() into its only caller
  KVM: Use "new" memslot's address space ID instead of dedicated param
  KVM: Let/force architectures to deal with arch specific memslot data
  KVM: arm64: Use "new" memslot instead of userspace memory region
  KVM: MIPS: Drop pr_debug from memslot commit to avoid using "mem"
  KVM: PPC: Avoid referencing userspace memory region in memslot updates
  KVM: s390: Use "new" memslot instead of userspace memory region
  KVM: x86: Use "new" memslot instead of userspace memory region
  KVM: RISC-V: Use "new" memslot instead of userspace memory region
  KVM: Stop passing kvm_userspace_memory_region to arch memslot hooks
  KVM: Use prepare/commit hooks to handle generic memslot metadata
    updates
  KVM: x86: Don't assume old/new memslots are non-NULL at memslot commit
  KVM: s390: Skip gfn/size sanity checks on memslot DELETE or FLAGS_ONLY
  KVM: Don't make a full copy of the old memslot in
    __kvm_set_memory_region()
  KVM: x86: Don't call kvm_mmu_change_mmu_pages() if the count hasn't
    changed
  KVM: Wait 'til the bitter end to initialize the "new" memslot
  KVM: Dynamically allocate "new" memslots from the get-go

 arch/arm64/kvm/Kconfig              |   1 +
 arch/arm64/kvm/mmu.c                |  27 +-
 arch/mips/kvm/Kconfig               |   1 +
 arch/mips/kvm/mips.c                |   9 +-
 arch/powerpc/include/asm/kvm_ppc.h  |  18 +-
 arch/powerpc/kvm/Kconfig            |   1 +
 arch/powerpc/kvm/book3s.c           |  14 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c |   4 +-
 arch/powerpc/kvm/book3s_hv.c        |  28 +-
 arch/powerpc/kvm/book3s_hv_nested.c |   4 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c  |  14 +-
 arch/powerpc/kvm/book3s_pr.c        |  17 +-
 arch/powerpc/kvm/booke.c            |   7 +-
 arch/powerpc/kvm/powerpc.c          |   9 +-
 arch/riscv/kvm/mmu.c                |  34 +-
 arch/s390/kvm/Kconfig               |   1 +
 arch/s390/kvm/kvm-s390.c            |  98 ++--
 arch/s390/kvm/kvm-s390.h            |  14 +
 arch/s390/kvm/pv.c                  |   4 +-
 arch/x86/include/asm/kvm_host.h     |   1 -
 arch/x86/kvm/Kconfig                |   1 +
 arch/x86/kvm/debugfs.c              |   6 +-
 arch/x86/kvm/mmu/mmu.c              |  39 +-
 arch/x86/kvm/x86.c                  |  42 +-
 include/linux/kvm_host.h            | 240 +++++---
 virt/kvm/kvm_main.c                 | 868 ++++++++++++++++------------
 26 files changed, 855 insertions(+), 647 deletions(-)

-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
