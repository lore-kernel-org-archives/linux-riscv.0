Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F58D24450
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 20:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PaIjMym6rlZ7pDV/m1+7CNUf46wqjgd8B44fc6rrUg=; b=WjrcMUtEdY3SMm
	tFrRkfMxbSHix5D1JqM3s3v+b2SzdXJZmUh7uzJSeGUjqnPzZ3m8kAFXEOHPb7muBWLuze4e/UKGS
	hSA8hFBHJFshcV2BO0pD6cfyc5Ba2XlOJYQzTF8VgSPHlfgZSuc3rzlvptFLYIUhCN69/6/rG5wli
	ueO4ORl7f1RLOnGdn1KVxl8gkDJGSJFwFe5IY/fwXjvnqKCp2Q/XwROT3qsMhNHpXXUeRQf2885TD
	u9S97jZjqN9X3N0POsCKmuUwRSN4zCRbTsp8BPK1HU8zNrKnjL/JvAqoW6ZN0LqPVLEFCT3JO1BXn
	e3IJVFlEP5NGptE0qYUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzoo-0000000EGqc-1X2S;
	Thu, 10 Oct 2024 20:31:30 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxs4-0000000Dr49-3wCe
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:46 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e29b4f8837so18952217b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584803; x=1729189603; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/fC7L3Fchvvuu9GyGKk9VEzuiyLOIeBtO2SWEaXDNWE=;
        b=BnLmoeZUgDZeTfvLJFFaz58gmWaTmR+ISKXM1NM9+8Tz6u4K97yuHNDt/+ETUMaj+3
         fbCJPJ11scsCf1SP+PIrpg0K/mVzzcYJSLqADVfzCIHdWlRu3FqR50x4ezGvzQsafiwI
         V/afjWOZ/n1EQinWq7bWXdQ4rQ6WU70i1MUJGIwMRhIC/nDA9OKg2xkV95XZg4jVhnIq
         MCaeu9xDMI7eJlCThHlmOwEzeN/sh1eYMUjy5l3EXfzuPM2unnM2PEBaD7dRrjT1aG9O
         8Z7SFpLghppE2P8lmROc1IplRfOtIfNZcuJoAatjBuBbu51DS2IopbOgls6I3ZHBiyPh
         LPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584803; x=1729189603;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fC7L3Fchvvuu9GyGKk9VEzuiyLOIeBtO2SWEaXDNWE=;
        b=Dm0kAWP5xXqGTftce5t2xgTGUj1dXoxBeVY2PlxfL9ob2k42g1R8yZdw+5a3UKZPe3
         Fc3GvWhqNrEkWVDFlEx3jNJATz0+Ls1hlKaKpEZLPZ9KqeOmL/MVMrEJXKRRHkLvWg4k
         Y617mV/E5REH20UbzCCY0oSPX0E3HmaEktX3yW27XenqBGEDleuPkxoznO72TowLqGAw
         /BcSrmBaPCHre6oa6i+2I6E12fQI2fpEiG/lB80LPD8L/uGB0eol9wsJ1dH33i7n+FZ+
         Eb6pHa3cC4g7K7HfRXLHF0CNnCDdopVsKQZXr78FBbXlilvdBn6zxfG630BriclepZcO
         EHNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd+44H5Ud5s3W4WpXxgc19wJnNabudVgMB2C5U28WljzHsbsr3Q61S1UzOW6SRPUk7On5nBXiUAHUlrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMuwIWclQlyKOv9coLqdrjuVenk5Zdl+v7aZp2HFvg/FKqS+Ju
	aPwZAigy4CyFNIR3SA2W4x7DI0h2VHWW0P+yqjKgeovVhL/QKMnatStVsrY9zKJwizaJjDJ6J07
	CjQ==
X-Google-Smtp-Source: AGHT+IF0bQSeBV+k7XDKFBXYzNvC7N99ueMTlOEEH5KNk6JZHzu/00W1ndtLnT51eyBFoV94Bmz3yNyB+P4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:dd1:b0:6db:e464:addc with SMTP id
 00721157ae682-6e344ce9308mr1337b3.4.1728584803335; Thu, 10 Oct 2024 11:26:43
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:54 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-53-seanjc@google.com>
Subject: [PATCH v13 52/85] KVM: PPC: e500: Mark "struct page" dirty in kvmppc_e500_shadow_map()
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
X-CRM114-CacheID: sfid-20241010_112645_112435_6D23657D 
X-CRM114-Status: GOOD (  11.69  )
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

Mark the underlying page as dirty in kvmppc_e500_ref_setup()'s sole
caller, kvmppc_e500_shadow_map(), which will allow converting e500 to
__kvm_faultin_pfn() + kvm_release_faultin_page() without having to do
a weird dance between ref_setup() and shadow_map().

Opportunistically drop the redundant kvm_set_pfn_accessed(), as
shadow_map() puts the page via kvm_release_pfn_clean().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index c664fdec75b1..5c2adfd19e12 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -242,7 +242,7 @@ static inline int tlbe_is_writable(struct kvm_book3e_206_tlb_entry *tlbe)
 	return tlbe->mas7_3 & (MAS3_SW|MAS3_UW);
 }
 
-static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
+static inline bool kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 					 struct kvm_book3e_206_tlb_entry *gtlbe,
 					 kvm_pfn_t pfn, unsigned int wimg)
 {
@@ -252,11 +252,7 @@ static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 	/* Use guest supplied MAS2_G and MAS2_E */
 	ref->flags |= (gtlbe->mas2 & MAS2_ATTRIB_MASK) | wimg;
 
-	/* Mark the page accessed */
-	kvm_set_pfn_accessed(pfn);
-
-	if (tlbe_is_writable(gtlbe))
-		kvm_set_pfn_dirty(pfn);
+	return tlbe_is_writable(gtlbe);
 }
 
 static inline void kvmppc_e500_ref_release(struct tlbe_ref *ref)
@@ -337,6 +333,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	unsigned int wimg = 0;
 	pgd_t *pgdir;
 	unsigned long flags;
+	bool writable = false;
 
 	/* used to check for invalidations in progress */
 	mmu_seq = kvm->mmu_invalidate_seq;
@@ -490,7 +487,9 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 			goto out;
 		}
 	}
-	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
+	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
+	if (writable)
+		kvm_set_pfn_dirty(pfn);
 
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
