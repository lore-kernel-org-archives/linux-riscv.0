Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5788CFC5EC
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUS0d2hawXWqOtuR6vYeQ5C6CsYCPK72Bn5AzTSzUyA=; b=iyxMoeuQiSWw3w
	/j6pW0yyCqsS96nLwmB17Cgk2oeXSP6m1deRXpECMoYRIFd+qvpoavVc/xzvFNRUKm52RYsD+JdrY
	30U1ctARoKgeP54C4Yd5NA/UWgubLDxOyris4a+v1OaGJfTAs00GnYxgQ0Xuu0H21/tbqqo3kyeL5
	2aLmA3NFnGYLJN8Fg/dCtQ9it4oGsrbnhnyjyP5Dp9QT2yF1b1ba2LM/1M5cST6MuhquZWX//1p6N
	rBBrrVyvsTNNyBD4eJb6Gk/PWVpAUI2a8ttRxj+g43sCjUJ6O/OQ9fOKRjj4sFzgUXHKyQTFgpy0t
	+Rj2zuM/N+OOxbGiP/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syy2f-0000000Dw4X-1MCC;
	Thu, 10 Oct 2024 18:37:41 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxqQ-0000000Dphq-3yHw
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:05 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e290947f6f8so1842485276.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584701; x=1729189501; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pPAj0F/7+N3G0fgp8rSBmKqwV8uR3Qu6XgX2gyD+fUo=;
        b=uho4rH1Ltyn1x521PuC9kj2h8uorL+rNfA819qT8YPYqGmkARzx2HIJ5RX8b2Scx4o
         pw/8G2HLJn/wBNNPeQ6BOz9/y0sV2YGDI5/YkZ17dMebLtTQ+0YWwHuVk4SmdTx5MAgN
         FHZZCWw/6icoy28KbaiYRQKg61SsybK9ggVaoLwVN3TJAUYXjGF9WxagSKJzPcFWeglj
         f9BIxNwTn3XGX8Vv/64aL2hbxWVunNr959SYvURuL3nwI+eRAI4hyJWuaoB/ScpM0t93
         kQuWM2/o9Ivo3R1Z7sbhcoTCwzmOGAQTziNvlKTG8eLizopDKY05CWMPLITK8cJOPl76
         waBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584701; x=1729189501;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPAj0F/7+N3G0fgp8rSBmKqwV8uR3Qu6XgX2gyD+fUo=;
        b=s6hO4cLY5uPl3A5xrt0Q56jXZqOyeEkxGRNq5gCac8dElf31DWhxJcDbbU3/T5+2M1
         iqKMit32GW9XzRwxP4p3mJYbdf+W5Yl9U21dvBnOQkXTWvlHJpgFA6NTP39bpPwxNULT
         FY0NX7UqP7+QtciFdcNxl4pCNWXcZ6STrJ/iTREx63IYUImLFAo619YW4C+uXsu8QNRm
         D9pxwAhTBcsDX+6KVbO4kfMHy+TnXj4Evx180z5l3gBMPt4QTOM3X+E9SqyWatJQclk5
         Xcrr6G9imL8wF3TOvxFAI2P9MHCDI3N73itDruM+c08Ay+ompljZpfSblKLWrIsK8rDY
         zc0g==
X-Forwarded-Encrypted: i=1; AJvYcCV7BxWh5D+cqIJOvyhKFBfXVIM4MebFMeUlW1F5bSou1qcG4MpIj7i8DcOoS0ZlPpOsfxyF0zVSplwDAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq6oblKDlfUXpqPYbF4D8KoYviby9dUr8AWmbuGBmPV3+kE76e
	wcFuvnJKoWYiCKOlGlTg8ZlksL4AXHQAXNQWoEKF5dd8B+Oxjc0iReocbxvzbCoIjGbF7JCTEe2
	xCg==
X-Google-Smtp-Source: AGHT+IHQgMXiDY3ifHkkle2NgOnYNSR5nXtws6LnwLsJ4J6Fqip1dtdD5j5lAqBgp/4MJdCcEXFALInKEMI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:69c3:0:b0:e1a:9ed2:67f4 with SMTP id
 3f1490d57ef6-e28fe4313ffmr4949276.2.1728584700890; Thu, 10 Oct 2024 11:25:00
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:07 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-6-seanjc@google.com>
Subject: [PATCH v13 05/85] KVM: x86/mmu: Don't overwrite shadow-present MMU
 SPTEs when prefaulting
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112503_159300_477B7906 
X-CRM114-Status: GOOD (  11.85  )
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

Treat attempts to prefetch/prefault MMU SPTEs as spurious if there's an
existing shadow-present SPTE, as overwriting a SPTE that may have been
create by a "real" fault is at best confusing, and at worst potentially
harmful.  E.g. mmu_try_to_unsync_pages() doesn't unsync when prefetching,
which creates a scenario where KVM could try to replace a Writable SPTE
with a !Writable SPTE, as sp->unsync is checked prior to acquiring
mmu_unsync_pages_lock.

Note, this applies to three of the four flavors of "prefetch" in KVM:

  - KVM_PRE_FAULT_MEMORY
  - Async #PF (host or PV)
  - Prefetching

The fourth flavor, SPTE synchronization, i.e. FNAME(sync_spte), _only_
overwrites shadow-present SPTEs when calling make_spte().  But SPTE
synchronization specifically uses mmu_spte_update(), and so naturally
avoids the @prefetch check in mmu_set_spte().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c     | 3 +++
 arch/x86/kvm/mmu/tdp_mmu.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a9a23e058555..a8c64069aa89 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2919,6 +2919,9 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
 	}
 
 	if (is_shadow_present_pte(*sptep)) {
+		if (prefetch)
+			return RET_PF_SPURIOUS;
+
 		/*
 		 * If we overwrite a PTE page pointer with a 2MB PMD, unlink
 		 * the parent of the now unreachable PTE.
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 3b996c1fdaab..3c6583468742 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1026,6 +1026,9 @@ static int tdp_mmu_map_handle_target_level(struct kvm_vcpu *vcpu,
 	if (WARN_ON_ONCE(sp->role.level != fault->goal_level))
 		return RET_PF_RETRY;
 
+	if (fault->prefetch && is_shadow_present_pte(iter->old_spte))
+		return RET_PF_SPURIOUS;
+
 	if (unlikely(!fault->slot))
 		new_spte = make_mmio_spte(vcpu, iter->gfn, ACC_ALL);
 	else
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
