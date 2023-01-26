Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981BFC05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 19:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=9pWcj8X0ue89hd5LOHa3BkmJHktVPmDI4VCGopLoD90=; b=4Oy
	VYSu/zO4/60af6fKCvzQNfF16FqI/xpQ39RlLidF+VTUxNXRGRH/0XarMioJ1iJakXeoMhaeylDCG
	B3qaX4k7VRrZLuJXTaXEqBn93fm4KATKX5/9Zzk1dc4tygO9ebZqcjwiUEEUyaBafWjDeKyC1RGzI
	/0IyHfefpWGF+J22AQPZbzuaXGEIHgle9lJtb31u9Txwn7dUdaaer0MeTPadZCPs+xGLsPf72BBp5
	vhZXsGutzl3HN7C8ni+s3xN7jaUriYmry5mwtAT1FlahSjkq7QPglZuTfWgqB0g0d+QoidOrMi3J6
	B/XHnF3IP7AWojlmEYL11ihrmc2nbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL8D9-00CN8d-Ls; Thu, 26 Jan 2023 19:47:03 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7B0-00CAVr-T8
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 18:40:51 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5065604854eso29634267b3.16
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 10:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ie07OawPNI+tJK8/hFSWiI7XFoX01SxG+4YwTEZViLQ=;
        b=D1zilxz/MrFwcNOLMT1LAITkqOyJHoIg1OvmdTgNrSXt2+8bKehEyhZdJ83wWYuURL
         Y0TlzIojPMrAY/CU2EgKBxKy8Nx8rmheh1GkuQRsxJHJN2NAKEqwzghdwiLNFihCDWAp
         xAqgswB2O5bVSkkHVOV/HJM6lOVfZSqt9ReqdJP9r1WG6enSrRiCbP2umw7Iz+8nswUx
         YO7YdtyP+HTlvOTCLKBJfy3cdltcIpQzviK1n84DUaBgb2qM5tqpM8I9zoSX/91t7Yqw
         jiFcfGub83bVeaJzvdpdizULguQj8McM0NB0eAlP96DiLVznXsRzwRYQJ3xMSNQhmSRM
         +wUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ie07OawPNI+tJK8/hFSWiI7XFoX01SxG+4YwTEZViLQ=;
        b=t8AzYMAr70I1KNBJ93ZWi+rQqt2q6s/ZPM6Ex9iFGppqN2aY7EPu5Em8RW3lXw9ufV
         jgSXBKCizClJFMEUh8rIngvCiPmhPstuSmr0C2OY4gZqT9nDVjsJjr/5WSOwQngue4YA
         S4uX7a9VhjCrhb4ZVjZtaIBVXteIzCBM0u7YlKo/Ywv2JpvcGkuPnDyhxacIcsDNFqXV
         e25QJuiMwj8gfW0kM+BAuyB4/FvRUnQEfyN8p4vC8p2kazOhkge4cmcJLzl2SINRYUuI
         nogB8GTrDbhh+5jpRnnjJRO+qwPb2ejkencnc+CQ95cBQVsbAw4TKzZ9h+W9hyDYuoD7
         y4dg==
X-Gm-Message-State: AFqh2krzMW+dEBEhJV4743rIdY5Ic8qL1q11SL868PKBFEyEAoxX73f2
	BaCp36CSnXJLUP5fX6EOr0dafJQh5icuXw==
X-Google-Smtp-Source: AMrXdXvYhsT+DA2KA1c/9P+wVBnv1OdnS37rNGakXvNF40eWFc5OqICy7ZZvOWGpLhibmaIEJb5soSQRpzz3bA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:4f81:0:b0:502:92ae:5123 with SMTP id
 d123-20020a814f81000000b0050292ae5123mr2486176ywb.99.1674758440211; Thu, 26
 Jan 2023 10:40:40 -0800 (PST)
Date: Thu, 26 Jan 2023 10:40:18 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230126184025.2294823-1-dmatlack@google.com>
Subject: [PATCH v2 0/7] KVM: Add a common API for range-based TLB invalidation
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_104047_082896_68F69EAF 
X-CRM114-Status: GOOD (  11.02  )
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

This series introduces a common API for performing range-based TLB
invalidation. This is then used to supplant
kvm_arch_flush_remote_tlbs_memslot() and pave the way for two other
patch series:

1. https://lore.kernel.org/kvm/20230109215347.3119271-1-rananta@google.com/

  Adds ARM support for range-based TLB invalidation and needs a
  mechanism to invoke it from common code. This series provides such a
  mechanism via kvm_arch_flush_remote_tlbs_range().

2. https://lore.kernel.org/kvm/20221208193857.4090582-1-dmatlack@google.com/

  Refactors the TDP MMU into common code, which requires an API for
  range-based TLB invaliation.

This series is based on patches 29-33 from (2.), but I made some further
cleanups after looking at it a second time.

Tested on x86_64 and ARM64 using KVM selftests.

Cc: Raghavendra Rao Ananta <rananta@google.com>

v2:
 - Rebased on top of kvm-x86/next to resolve conflicts in changes slated
   for 6.3 [Sean]
 - Drop CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL from virt/kvm/Kconfig
   [Oliver]

v1: https://lore.kernel.org/kvm/20230119173559.2517103-1-dmatlack@google.com/

David Matlack (7):
  KVM: Rename kvm_arch_flush_remote_tlb() to
    kvm_arch_flush_remote_tlbs()
  KVM: arm64: Use kvm_arch_flush_remote_tlbs()
  KVM: x86/mmu: Collapse kvm_flush_remote_tlbs_with_{range,address}()
    together
  KVM: x86/mmu: Rename kvm_flush_remote_tlbs_with_address()
  KVM: x86/MMU: Use gfn_t in kvm_flush_remote_tlbs_range()
  KVM: Allow range-based TLB invalidation from common code
  KVM: Move kvm_arch_flush_remote_tlbs_memslot() to common code

 arch/arm64/include/asm/kvm_host.h |  3 ++
 arch/arm64/kvm/Kconfig            |  1 -
 arch/arm64/kvm/arm.c              |  6 ----
 arch/arm64/kvm/mmu.c              |  6 ++--
 arch/mips/include/asm/kvm_host.h  |  4 +--
 arch/mips/kvm/mips.c              | 12 ++------
 arch/riscv/kvm/mmu.c              |  6 ----
 arch/x86/include/asm/kvm_host.h   |  7 +++--
 arch/x86/kvm/mmu/mmu.c            | 46 +++++++------------------------
 arch/x86/kvm/mmu/mmu_internal.h   |  7 ++---
 arch/x86/kvm/x86.c                |  2 +-
 include/linux/kvm_host.h          | 20 ++++++++++----
 virt/kvm/Kconfig                  |  3 --
 virt/kvm/kvm_main.c               | 35 +++++++++++++++++++----
 14 files changed, 73 insertions(+), 85 deletions(-)


base-commit: 503f0315c97739d3f8e645c500d81757dfbf76be
prerequisite-patch-id: 42a76ce7cec240776c21f674e99e893a3a6bee58
prerequisite-patch-id: c5ef6bbef252706b7e65b76dc9bd92cf320828f5
prerequisite-patch-id: c6e662cb6c369a47a027c25d3ccc7138a19b17f5
prerequisite-patch-id: 15a58bec64bf1537e6c9e2f52179fac652d441f7
prerequisite-patch-id: d5b6fea4724f4f2c3408b95d7ce5acdd4b528b10
-- 
2.39.1.456.gfc5497dd1b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
