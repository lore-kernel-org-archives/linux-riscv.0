Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4EFC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7N2cuAbMdGEgO7uOqoFSGXSuzg7H0jBhmBCTXtrSTc0=; b=L/dytLw9RTfRJP
	2FjIsP0bgGBoK8O5fOSt2RHRDE+8jIwJsCh4k+0fjyiJYB8Hhg3Wb2c08zGmRN2jeOCR2iAmEuJdg
	qjMWJaqpFaN6qYZ08o+p98azd3Pydyx8kseKB2zI09Vnz7jaAslVLU8UiapV9HEwrNsX8ZlOh8LCZ
	ajckf0J8pq6Ttnxk4IHZHoZT3VMFYThZCH2aZ98grDKSt24a2S22b+e6ggOU9oQLldzHDyvkmYv00
	pdIzTyN4nAVNTxmw79aZEy33xrengWelrVwsT1ZxreZgEiowjLFcnprsc7aviLATiNHSXqAw6QIpa
	3Rb6AZiBGQaWApMuyYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXV0y-00000005ZMA-2nz6;
	Sat, 27 Jul 2024 00:10:24 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlB-00000005QI1-1puW
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:07 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-672bea19bedso6263317b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038044; x=1722642844; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=66tkjZePX8REZ4BHWwuGWSSOzSubgrfSmhtIFHX3PRM=;
        b=ju9p12X6+p/wDCj4zrSzx9/mhrb1zDVyOW9r7wxMqRb8NYmjAwtIFiJGGexQL5m4j0
         ZIOPgjki2wu4af6yEX8NIcndPzvQE9VDNW9Z7f4BY2LZGpqhsZme6kf4Gona6LJeX7qU
         uVX3qdmF6zRPTkQ3ylh0O22ITk9LaixbXYH1xMAwQrYRaiRNhnhtT4CO49iIqChF184p
         aPFXcyQgmoG36OkGV2SU75GHbu9oSLMM7BM6YrMSdflBZSoxR8TwQLLOWv3l116AblTw
         giH3fB2yzx5rBumzR11mFuF60VCtpPI5VK53DdBSpDjPc898qju+AvC90enREb1a76pt
         IQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038044; x=1722642844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66tkjZePX8REZ4BHWwuGWSSOzSubgrfSmhtIFHX3PRM=;
        b=V0KgxvOGQHQc9PRy+fYrXKdOG2gVfRFR0N8keQsAK/XfB65X0a9196MXmChpzfMVZo
         YKZxFzsyfbHMrBFrlsJQ8mkt2vgE0C/KKwcS4GiWUn2zoAoTZ2JomSeuN9H5t0yDMVRN
         lrdOCMGRBKmKS722jsKkEw1QJlQiI8Df5RofdowM1qhwtvRx3fVO6CR44+rX9Goq8/aX
         VdRg14JI7r3+YmuGgXZW7SIecpqj833hPKr2My5t4g7yDaiWksn/uNHZVRsDh0QbnBM+
         Mmay9tZdWvT4LZKbcBYVeA/5NRbCHCRsH9kbd347fOy9u3WgJQJPg/AuQgJ0UQDEHy7W
         nwQg==
X-Forwarded-Encrypted: i=1; AJvYcCWhWiXQQ/QN2GVcAT4zHPVi4dgMQOcHwWYCfr3mcbt2B3za7Jvo/p6+Sn+I3XwX1GBWYpmdOSmpjNJ1lVCD6yO2pEtEyAfx8bnkcPd1K64u
X-Gm-Message-State: AOJu0YydKR86RvPRvNM0VG+vCUcqfacE6TXKthYGNyQE+RjGLhrHfjXR
	q/e3Vqd3uoDTH5mtd+aFK7LEZhBAKrpiZ8fcIz4fIQLn0ZtneONvabVYhw5qbMXHqF4HAgr63Do
	IUw==
X-Google-Smtp-Source: AGHT+IEXCHhy0parcxZWaUKhAkA9z5ds6aScUvbMwsWWyatCr0tT87bBO0XasR4cX5mU+wgB/x+9BeJQnC8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:f92:b0:673:b39a:92f2 with SMTP id
 00721157ae682-67a0a7fd778mr244297b3.7.1722038044118; Fri, 26 Jul 2024
 16:54:04 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:51 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-43-seanjc@google.com>
Subject: [PATCH v12 42/84] KVM: Move declarations of memslot accessors up in kvm_host.h
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
X-CRM114-CacheID: sfid-20240726_165405_617128_892F5A52 
X-CRM114-Status: UNSURE (   8.60  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Move the memslot lookup helpers further up in kvm_host.h so that they can
be used by inlined "to pfn" wrappers.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5a572cef4adc..ef0277b77375 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1153,6 +1153,10 @@ static inline bool kvm_memslot_iter_is_valid(struct kvm_memslot_iter *iter, gfn_
 	     kvm_memslot_iter_is_valid(iter, end);			\
 	     kvm_memslot_iter_next(iter))
 
+struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn);
+struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
+struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn_t gfn);
+
 /*
  * KVM_SET_USER_MEMORY_REGION ioctl allows the following operations:
  * - create a new memory slot
@@ -1290,15 +1294,13 @@ int kvm_gfn_to_hva_cache_init(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 })
 
 int kvm_clear_guest(struct kvm *kvm, gpa_t gpa, unsigned long len);
-struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn);
 bool kvm_is_visible_gfn(struct kvm *kvm, gfn_t gfn);
 bool kvm_vcpu_is_visible_gfn(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_host_page_size(struct kvm_vcpu *vcpu, gfn_t gfn);
 void mark_page_dirty_in_slot(struct kvm *kvm, const struct kvm_memory_slot *memslot, gfn_t gfn);
 void mark_page_dirty(struct kvm *kvm, gfn_t gfn);
 
-struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
-struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn_t gfn);
+
 kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn);
 
 int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa, struct kvm_host_map *map,
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
