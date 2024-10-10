Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B21D24442
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LU5s+KB2Nmh6nl6V6rE3YW8uNys1tnFcjDpY+vGsEAE=; b=ykYOgQN7Hf8/WA
	tqa54YLLbVIwvZTnMJWxUOGa8kuoReT4ShjE0Xa9fL46u4aCfRLywWN8MHf0h7XEeuEe4tfY6lpU4
	mmRXU5TZqmrezUtJ3o+93XXjMhMbDM7MvuTY6NUN8xAbXz8hWMFhujhHwmKm6cZbV8cgk2jfi0Ls8
	k4Wbxg5Zyl7XRzTN41tCFREdezs524yzw20mI7SttLyq+oHb/+2Ls8VCGcbbjd6+bDC/8DVaOgLkv
	7qoMTz3ekRvAaihc2svNXup928NOflezuLeMIty/6FS+fhMwvIeeOyHoGHyHItxgyvdKmR2vudAMp
	m5BJ0mCY/FklFUvJeolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syz76-0000000EAk6-2Na2;
	Thu, 10 Oct 2024 19:46:20 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxqW-0000000DpmI-1u0w
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:11 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2e295559c37so1096520a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584707; x=1729189507; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=GZoCfd92gqYHwqsSYOai9KQfQ7K6dxh+JWKccmiJTPU=;
        b=h8kgmq5KMhiBhtsbuTJw6kU2LJ3f2iQP13uN81By+PdbuW2nwg9GE7cWKJK4SIKxe9
         aqQXNd0DGyY4m+d5ZAQ6AwjC5GPE0e8hdo5ZQn8POJbht1P2W0EOFPEf/SqHVj9VIEPG
         mTauj/V2pKKa8GfckVKm8AicpL2PyF2yZCj6/iuFPJChYGGr7qKDGMKW02z+t4+bIiJY
         2yCoRqfFPRISvLKxNhzo+zUQG2ARex/YqnovbrM3qvS88K07YwkBncJVeTp3tRusFkom
         BIOx4xdIwVY9lgLVDyE6HEqvbD5bvi0UkH09epNU5s/AYlbnV/veBkjfvxbSlpss22U0
         qsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584707; x=1729189507;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZoCfd92gqYHwqsSYOai9KQfQ7K6dxh+JWKccmiJTPU=;
        b=ZQAcfOlAh5UwGnVbqusItCDIWV1ggN4OBvp14N1CGheKwT2Z2pwSOh0aD00hO2a7YX
         fxeBghpraFNRnX1TeKO0Vdckfy/30I6FBNp8kgCr6a5GLCdrE6grpE/06z0bzoLDNU5c
         b00rp/cASfSesIYPxqymySi5qWeU8p5lnNggSjc91QhHMDhmOOTzmiftnz7xsXXFOSeN
         N7KzJrILCSLCFGzNvaZpOWcqJzWT4OMsG16TqKBO320TkiLkC8KqZ/Nb9X9FPOXiDqHe
         fibNSVvzoLiK4BxWxITgU7Udg3NNxwlH2xhRmT3PzsZVYn6WtM8Y3OZoR38En2jeRwSE
         7USg==
X-Forwarded-Encrypted: i=1; AJvYcCUcYS/4ALlx6GuZW8QWA3Vmj/FPvtm6Xo9JopZD65okTY8xG5MxE/9hWP4oP5ZLKIKMvNQtnk5+jaftzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkU0+GSjxPD7K0aALBeO2q/JRm7+f9qi/sk/kSHFkVTmQAmrxj
	SnSSa91p+NgGC86gvUqZw3TpQWHOP80j1yf4zJyzlwdfWpYOQdWJH5AvYCO32MGbpm0bwaJ7KOJ
	Now==
X-Google-Smtp-Source: AGHT+IH8UDk7ruln14ZDsSWqbj1uDcx7028dIle1wpc1As3ec3XNWN4cizl8I1jAsp9rsgJdiTjtCNc1iNw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:fa84:b0:2e2:da81:40c6 with SMTP id
 98e67ed59e1d1-2e2f0a524d4mr44a91.2.1728584705592; Thu, 10 Oct 2024 11:25:05
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:09 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-8-seanjc@google.com>
Subject: [PATCH v13 07/85] KVM: x86/mmu: Mark new SPTE as Accessed when
 synchronizing existing SPTE
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
X-CRM114-CacheID: sfid-20241010_112508_586377_41A6A042 
X-CRM114-Status: GOOD (  12.94  )
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

Set the Accessed bit when making a "new" SPTE during SPTE synchronization,
as _clearing_ the Accessed bit is counter-productive, and even if the
Accessed bit wasn't set in the old SPTE, odds are very good the guest will
access the page in the near future, as the most common case where KVM
synchronizes a shadow-present SPTE is when the guest is making the gPTE
read-only for Copy-on-Write (CoW).

Preserving the Accessed bit will allow dropping the logic that propagates
the Accessed bit to the underlying struct page when overwriting an existing
SPTE, without undue risk of regressing page aging.

Note, KVM's current behavior is very deliberate, as SPTE synchronization
was the only "speculative" access type as of commit 947da5383069 ("KVM:
MMU: Set the accessed bit on non-speculative shadow ptes").

But, much has changed since 2008, and more changes are on the horizon.
Spurious clearing of the Accessed (and Dirty) was mitigated by commit
e6722d9211b2 ("KVM: x86/mmu: Reduce the update to the spte in
FNAME(sync_spte)"), which changed FNAME(sync_spte) to only overwrite SPTEs
if the protections are actually changing.  I.e. KVM is already preserving
Accessed information for SPTEs that aren't dropping protections.

And with the aforementioned future change to NOT mark the page/folio as
accessed, KVM's SPTEs will become the "source of truth" so to speak, in
which case clearing the Accessed bit outside of page aging becomes very
undesirable.

Suggested-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/spte.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 0e47fea1a2d9..618059b30b8b 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -178,7 +178,7 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		spte |= SPTE_TDP_AD_WRPROT_ONLY;
 
 	spte |= shadow_present_mask;
-	if (!prefetch)
+	if (!prefetch || synchronizing)
 		spte |= spte_shadow_accessed_mask(spte);
 
 	/*
@@ -259,7 +259,7 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		spte |= spte_shadow_dirty_mask(spte);
 
 out:
-	if (prefetch)
+	if (prefetch && !synchronizing)
 		spte = mark_spte_for_access_track(spte);
 
 	WARN_ONCE(is_rsvd_spte(&vcpu->arch.mmu->shadow_zero_check, spte, level),
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
