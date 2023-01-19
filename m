Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFE8C004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 18:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=u+99PLS+4eSgmZ9k2Upsk4pnU8PHkpZ8viLqMjUKQTg=; b=FkI
	x4ZkYE3Jzu5QTrTL8WRlB8fqsx+sz/EZpkIh89fisaPFaLmBaFp3hi2bHbB2GVQszb56f11AYdE1R
	YCcF5Z7p1bdProB5qc0bG3TiP/SXVpcexrjbsYBU+2AVrZtPdttq16Ai97erEJBUUCfVK7Ueur2t9
	+YMp0+scLQAziE+lBGAdI34kC2Z92hur1PVQNUwiRAde7Zi+oqVzEoG6mFhALnIsqDFa+QUpzkoC5
	ffubebuKszOzHr4TFVnS1/FsLIY0Ip1FP9JbBbbl6LYBuElFHd76utIgOsPRCXjrihjTh8TrKHgFF
	kb1e42vwrcNA0EKk8Ar++OlwpU7H87Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZvH-006cfB-FY; Thu, 19 Jan 2023 18:46:03 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYph-006Jsa-Du
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 17:36:15 +0000
Received: by mail-pg1-x54a.google.com with SMTP id s76-20020a632c4f000000b0049ceb0f185eso1306331pgs.7
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 09:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YXwKcERxaLuVKb5nhPV+CPBgH/1CDOfYUJatcNI9Lps=;
        b=OTqsYX12neD7rYwEWRn8ph1+Ivtv7Ny3gNRUzRN4gpl2Eo4fWlPbPU6In/4jxn719a
         2slMyQuQUGYeMW/mBJE87s2KFofWL2A+b2t0AGtJWafNEsGMAYWeQipZoQ1wuc/AwP98
         q6x1X0TMG1Ad+kT9cWeSraqE2aVQjTFYY8XrvpXdV5XrOCH5Z0/4P8kT8Gk2C8Whx2FG
         81gR4+aJciehqPLB3q7y9lYytTmBxQ2kqUF/pcLWKVy8x5Z3rc4oYcrFbsLGgX3dj310
         jjv6aYJuXYmn/PCkMZw8+4RuZGYn5ZS3Cw5swhmMDgbV/Bu5G0pBJ9SOJXuv6t7ZXXHT
         rVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YXwKcERxaLuVKb5nhPV+CPBgH/1CDOfYUJatcNI9Lps=;
        b=w4XagM4NnQu32uwhw7dICruaeF/PrUqUK3irIm4CNm8GpLvmZPguM73jf4DKl964VZ
         H6nHwzt1JNCYwdwaHJgC/4K5/fvCHeWB4p3KneWgs9G6KCbuAGTkIF4i1CkvqnMJS9un
         GFqn0rk+BFQyIKhbZs50c51TgseF7TMjDF+V2zzTHYDdV9mXkTCQTV660WXuYLqOLPsE
         CxLlyaKaWs8c+MTZ1KEZykxZoPagpfXkaxhjFygEyTsXPLoCRHsV4Bp68qzsQ3y1wPfI
         qSlcr1x881bWuV3dDVNaw/OOiFePHobhX9tR4ax2N+kzokfAlEEzxg1OkqW4K+cWiGcg
         kN3g==
X-Gm-Message-State: AFqh2kp0jepQakxwuiu+njoeRIriQfyBZWwjdVAiRqogJMwsnVyapTLY
	//gM3tdEMxVpMZLZFU/4d+GE8h5Kvx1R6Q==
X-Google-Smtp-Source: AMrXdXuXExC+O9r6ly79uchmV3y9bAojfkYhjynfBp2nNUiPyiTU/esa3EM+EgTfMCGZFP3dGppk25OULxh7DA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a05:6a00:24d4:b0:58b:a320:29b9 with SMTP
 id d20-20020a056a0024d400b0058ba32029b9mr1062701pfv.38.1674149769306; Thu, 19
 Jan 2023 09:36:09 -0800 (PST)
Date: Thu, 19 Jan 2023 09:35:52 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Message-ID: <20230119173559.2517103-1-dmatlack@google.com>
Subject: [PATCH 0/7] KVM: Add a common API for range-based TLB invalidation
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
X-CRM114-CacheID: sfid-20230119_093613_517780_A20DE2C9 
X-CRM114-Status: GOOD (  10.67  )
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
 arch/arm64/kvm/arm.c              |  6 ---
 arch/arm64/kvm/mmu.c              |  6 +--
 arch/mips/include/asm/kvm_host.h  |  4 +-
 arch/mips/kvm/mips.c              | 12 ++----
 arch/riscv/kvm/mmu.c              |  6 ---
 arch/x86/include/asm/kvm_host.h   |  7 +++-
 arch/x86/kvm/mmu/mmu.c            | 68 ++++++++++---------------------
 arch/x86/kvm/mmu/mmu_internal.h   |  2 -
 arch/x86/kvm/mmu/paging_tmpl.h    |  4 +-
 arch/x86/kvm/mmu/tdp_mmu.c        |  7 ++--
 arch/x86/kvm/x86.c                |  2 +-
 include/linux/kvm_host.h          | 20 ++++++---
 virt/kvm/kvm_main.c               | 35 +++++++++++++---
 15 files changed, 87 insertions(+), 96 deletions(-)


base-commit: de60733246ff4545a0483140c1f21426b8d7cb7f
prerequisite-patch-id: 42a76ce7cec240776c21f674e99e893a3a6bee58
prerequisite-patch-id: c5ef6bbef252706b7e65b76dc9bd92cf320828f5
prerequisite-patch-id: c6e662cb6c369a47a027c25d3ccc7138a19b17f5
prerequisite-patch-id: 15a58bec64bf1537e6c9e2f52179fac652d441f7
prerequisite-patch-id: d5b6fea4724f4f2c3408b95d7ce5acdd4b528b10
-- 
2.39.0.246.g2a6d74b583-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
