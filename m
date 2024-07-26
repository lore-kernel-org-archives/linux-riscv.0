Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268D1C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 01:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L27LOI+ySHqSrXMjIbIxoD9bOQi7nJOYjTD5i/ijUmQ=; b=hQS323hyg6NRSP
	ze/11+PBPmcpcHaq7B/YAzjyLFK0hC66p3haVjjSS2hZL0gIbDufxJ2Lw1iibNZTOIhKRwa6O2aYt
	9mUqrFbmlSG75eOWPrxF1ObNrvgigrwlM+NDsZLXV+b0i5mO4tL4T0lCizHj4eW032SdpATry++4G
	6T/1JaRYqtkcRf0TiqLddJqC3FjFdrLvDGU6NymVhwGqr1WFzUWP2kBX+5S2FnQnHQVWMgOHpAi5D
	k8zwegdE7Mpik/5+Safja7I0OU4/UNTF3eaTSFNguIqEuCmNGIlYhBew0rp7RzgJpm0k2HNhDgcQ+
	vQx+5Gd13uVymP4fsoUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVnw-00000005nOE-33T6;
	Sat, 27 Jul 2024 01:01:00 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUjz-00000005PEn-1tjv
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:52:53 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-66b8faa2a4aso7040127b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037970; x=1722642770; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VnEAHRC1zG591I39OowzIjQNXTqQsRDXyh/rUn6sicQ=;
        b=Zv2y5TGBu4jNjYjDqYMpQ7ctqA0RMqIRWZC1+t8BWrFI4iRKunriZE25YMEHTn5JN6
         3Mp1PzUU2/0hJSPDCCgx4sx6PhAFzeCrSkf3hvV4Zaq78s0DPV7TJv34rhVCVpaHb62M
         r24KMJq7BXh0RbOeXcYCAAYdIwmgkOhouuTXfZM0vzugLZteTUFPOf1901Q17cSB2p+u
         qjVxn5ZS2KnY3PjEw2/oqb4IXElFT84/rvXh3DKfIDh/bwbck2zqTepCGKgY7XB6BZgJ
         pi85lCwbKL/Ajhlkj7OwnOyeCrqP10BMBchVSody8iZKmohVCSLhssfe9MTEC/YRdwor
         /Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037970; x=1722642770;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnEAHRC1zG591I39OowzIjQNXTqQsRDXyh/rUn6sicQ=;
        b=FY0hEJpn9HUc+cWSKfb0OkJIfweSUQ5ehiIJ5B9v4xL8HFLEVDmrBaVmiw3yOVczg8
         prf1O0gUODjJotNqf3ZIbfmemOjFnr2zAIzvcQbnamcl1LuZzpxtp9HaoOZu12R8IGD1
         D/OUmW68oCU2XTo0OKZSP8q6NbCYPJgLEU5cNWVQ/J7EeXl1fT/z+0o3Fh/kQC+QV8Jx
         HPmh08EMxEZUMjfYeoyysugXLT9CLoBzIJfZ5ggFvU4N4zwToUuo5sgRYlwABtldcXZv
         8A0VMPDpbWI57VaB5cC8uGBRVnbrBnBTw9u1HHBXpkawqu8f6qQUTvTrtN0Xe/wexEJJ
         kRFg==
X-Forwarded-Encrypted: i=1; AJvYcCXyJcSOJNP7qXC4MIxPl2l6WEY+O30VX67D54HzlRXYjt9K9qpe/9+tllxJnebNV51ykH7MFLLtEZeAMdkNCN4tHJLlgMA7N7fnlyE4sLFl
X-Gm-Message-State: AOJu0YxZjAEZLo9qkKThYLLkWike5LX5gRkW6T6si/UgrP2/CH7B1oyw
	iK6UsbATYSBEdiJl3sI3fBX0BcTwm/pRAUbxvDl/dQB1F9BiTV4leAeiXS73o1q6Uq9rtSzCeZT
	hSg==
X-Google-Smtp-Source: AGHT+IFPOoUYsYyJmRjA25F0UYC9yeYKs61mDA/QqS/vgTcAgpqjjzQfUfGqPl0MU2c7vZElDBuLLOtKUts=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:fc9:b0:648:afcb:a7ce with SMTP id
 00721157ae682-67a05a9d90bmr269367b3.3.1722037969718; Fri, 26 Jul 2024
 16:52:49 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:15 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-7-seanjc@google.com>
Subject: [PATCH v12 06/84] KVM: x86/mmu: Skip the "try unsync" path iff the
 old SPTE was a leaf SPTE
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
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165251_524464_533B578E 
X-CRM114-Status: GOOD (  12.93  )
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

Apply make_spte()'s optimization to skip trying to unsync shadow pages if
and only if the old SPTE was a leaf SPTE, as non-leaf SPTEs in direct MMUs
are always writable, i.e. could trigger a false positive and incorrectly
lead to KVM creating a SPTE without write-protecting or marking shadow
pages unsync.

This bug only affects the TDP MMU, as the shadow MMU only overwrites a
shadow-present SPTE when synchronizing SPTEs (and only 4KiB SPTEs can be
unsync).  Specifically, mmu_set_spte() drops any non-leaf SPTEs *before*
calling make_spte(), whereas the TDP MMU can do a direct replacement of a
page table with the leaf SPTE.

Opportunistically update the comment to explain why skipping the unsync
stuff is safe, as opposed to simply saying "it's someone else's problem".

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/spte.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index d4527965e48c..a3baf0cadbee 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -226,12 +226,20 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		spte |= PT_WRITABLE_MASK | shadow_mmu_writable_mask;
 
 		/*
-		 * Optimization: for pte sync, if spte was writable the hash
-		 * lookup is unnecessary (and expensive). Write protection
-		 * is responsibility of kvm_mmu_get_page / kvm_mmu_sync_roots.
-		 * Same reasoning can be applied to dirty page accounting.
+		 * When overwriting an existing leaf SPTE, and the old SPTE was
+		 * writable, skip trying to unsync shadow pages as any relevant
+		 * shadow pages must already be unsync, i.e. the hash lookup is
+		 * unnecessary (and expensive).
+		 *
+		 * The same reasoning applies to dirty page/folio accounting;
+		 * KVM will mark the folio dirty using the old SPTE, thus
+		 * there's no need to immediately mark the new SPTE as dirty.
+		 *
+		 * Note, both cases rely on KVM not changing PFNs without first
+		 * zapping the old SPTE, which is guaranteed by both the shadow
+		 * MMU and the TDP MMU.
 		 */
-		if (is_writable_pte(old_spte))
+		if (is_last_spte(old_spte, level) && is_writable_pte(old_spte))
 			goto out;
 
 		/*
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
