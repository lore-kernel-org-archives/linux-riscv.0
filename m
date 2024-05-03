Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8DCC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 18:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5Rtq3nZ43TUlnG9AaEzsUmauLRImTaiiZTDPd+V1KVw=; b=wl+
	baX9xygl5N4yhBQhltfQmOe5Xjlap1LXzE1odMoWhhynSg6x/Swy8OuSKFLXPMCXWqT8toe6qhTAW
	V/ia84ybbHXE+t8zwopMN4YYRw5fNDg1Pf7JaO2yfuWFOcMaLVzK2Lxnm8TYkGv99GtYbAOA3XapD
	2z17KwkJjs4RbsUgcTESIwGQd+X/HKPQEOxhBysO2PqiyqPptvAscbIPSJFv5/i593WG1nYCRzZ44
	+D9rsQzF6por2YWbwWZWQc2+ExQtldEr9GX7w7Z6L5XFdbqS3e5MWsVAxTEl9rj8W4zsAkguZb7wE
	ZFj6gxBQ15HugeCNMIGhUmQ4qUgw2DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xTf-0000000HW9j-3wt6;
	Fri, 03 May 2024 18:17:47 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xTa-0000000HW3d-1vSX
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:17:45 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61be75e21fdso94004887b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714760258; x=1715365058; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u5lOataUl4CqNIE0BOfGoSKjtAnehJHFOaimjTGPj/Y=;
        b=jX/9Gxq6Qc5KG5Vm83tinqrPoSpnOzVSrnY8ugUQm0Z7ZOhrB1j+PX5fW2EvJ+A8/D
         PrPe6GcL61r3l+pSiWInfZWj4ZRKupa54pGOkqmXCkmwxM1+KbiHLKeOodN38uCH72MQ
         BsKFBW5D79iGPkKex4FztynWP5i0z+HiOCGOn3n7MqQ7DgrD7SYX0tAj+J6k5I3X5FQR
         XjegioLbI/Ygf5lA2yJaW8mxJNSZGOm15DAGzzrvoNV7nJNfpXkgnG5GPZQlNYT792pe
         fQpO2QazFJvAN/pqNLTwmNkXp42oYNNxc0rCwOUx4AbU5P4yHdk4YKliasbtoDfJYG36
         8ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760259; x=1715365059;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u5lOataUl4CqNIE0BOfGoSKjtAnehJHFOaimjTGPj/Y=;
        b=qi8kAnT6EzZyVu57DX/gyS+xUM+A3K4BBrEK6EXvAd04GdK+iRWBEX/AQ6PqXTzggX
         gFL+84iF6OghJOw4peIxTGXqS0o7RhtLZP9lVUiuRwdPAHy4cV2/JASHxUbH7yT9et1J
         ZlDS5uI+/4G0GOPxAGkvPaMDOL2JoVHR5aRmwmhNneL/B5avwxRpZjI3m+Z1vSAsFz3A
         MLMBsyByroZbK/L1gUOvWlfNgmZmo7L7HfZes6loTXdtcDCWVRe+96Y93gOjzmD2feOO
         wOj6OzzCvM7RRG4AlxhaHpQ4v9YxaQVnyYFZeb+ITh9CBWJJp4ifhnAloqICRDTIOIUr
         Ncog==
X-Forwarded-Encrypted: i=1; AJvYcCXhCgFqefVKQjjgguKDSottWKgIV4w8xkDn0PMtvCkZbJ7uMEEgdqWPTUmNOnClqTNmyOSIXzxXUyjqJEo9amfm32CWveOpTXHgm4fL0zof
X-Gm-Message-State: AOJu0YwABOdbQ6Pf9vJdAyNFQM2TbgYhFP9DAUN6T3RaXG+CaYDCTL00
	pCHZmNVFpUm9z0UIbRJVWP2HA15eHTK0DJvkm5Et/pL5X/VwTUq58BHB7riO9uAO8B08lNC/N0F
	PSPQPChJ3iw==
X-Google-Smtp-Source: AGHT+IGi/6BGSqLUvb7wYnWHXOlhd9obpauunW/BcufWuEVmkE7H211A4Dm9y03t3pfp70UoCYU1Se1aO50snA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a05:6902:729:b0:dcc:c57c:8873 with SMTP
 id l9-20020a056902072900b00dccc57c8873mr1104781ybt.9.1714760258668; Fri, 03
 May 2024 11:17:38 -0700 (PDT)
Date: Fri,  3 May 2024 11:17:31 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240503181734.1467938-1-dmatlack@google.com>
Subject: [PATCH v3 0/3] KVM: Set vcpu->preempted/ready iff scheduled out while running
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_111742_521751_926D24FA 
X-CRM114-Status: GOOD (  12.51  )
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

This series changes KVM to mark a vCPU as preempted/ready if-and-only-if
it's scheduled out while running. i.e. Do not mark a vCPU
preempted/ready if it's scheduled out during a non-KVM_RUN ioctl() or
when userspace is doing KVM_RUN with immediate_exit=true.

This is a logical extension of commit 54aa83c90198 ("KVM: x86: do not
set st->preempted when going back to user space"), which  stopped
marking a vCPU as preempted when returning to userspace. But if userspace
invokes a KVM vCPU ioctl() that gets preempted, the vCPU will be marked
preempted/ready. This is arguably incorrect behavior since the vCPU was
not actually preempted while the guest was running, it was preempted
while doing something on behalf of userspace.

In practice, this avoids KVM dirtying guest memory via the steal time
page after userspace has paused vCPUs, e.g. for Live Migration, which
allows userspace to collect the final dirty bitmap before or in parallel
with saving vCPU state without having to worry about saving vCPU state
triggering writes to guest memory.

Patch 1 introduces vcpu->wants_to_run to allow KVM to detect when a vCPU
is in its core run loop.

Patch 2 renames immediated_exit to immediated_exit__unsafe within KVM to
ensure that any new references get extra scrutiny.

Patch 3 perform leverages vcpu->wants_to_run to contrain when
vcpu->preempted and vcpu->ready are set.

v3:
 - Use READ_ONCE() to read immediate_exit [Sean]
 - Replace use of immediate_exit with !wants_to_run to avoid TOCTOU [Sean]
 - Hide/Rename immediate_exit in KVM to harden against TOCTOU bugs [Sean]

v2: https://lore.kernel.org/kvm/20240307163541.92138-1-dmatlack@google.com/
 - Drop Google-specific "PRODKERNEL: " shortlog prefix [me]

v1: https://lore.kernel.org/kvm/20231218185850.1659570-1-dmatlack@google.com/

David Matlack (3):
  KVM: Introduce vcpu->wants_to_run
  KVM: Ensure new code that references immediate_exit gets extra
    scrutiny
  KVM: Mark a vCPU as preempted/ready iff it's scheduled out while
    running

 arch/arm64/kvm/arm.c       |  2 +-
 arch/loongarch/kvm/vcpu.c  |  2 +-
 arch/mips/kvm/mips.c       |  2 +-
 arch/powerpc/kvm/powerpc.c |  2 +-
 arch/riscv/kvm/vcpu.c      |  2 +-
 arch/s390/kvm/kvm-s390.c   |  2 +-
 arch/x86/kvm/x86.c         |  4 ++--
 include/linux/kvm_host.h   |  1 +
 include/uapi/linux/kvm.h   | 15 ++++++++++++++-
 virt/kvm/kvm_main.c        |  5 ++++-
 10 files changed, 27 insertions(+), 10 deletions(-)


base-commit: 296655d9bf272cfdd9d2211d099bcb8a61b93037
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
