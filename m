Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DF9C3DA7F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+JAuUdO7w9d6ED89U2R1CpZ+mNSTWngCakiUhhqckk=; b=E9bbBWW6iR+tsu
	yKShTYD+oGz5cItAX5WEr968M/ucvcW3qWJwUreY9TBMsWyFmyeNFM6ersBpW0Xw2MD1LQhiHQMjg
	o6wMZhNmWI5nr9PcP6wNQnUkIWMLqcRU+BCQ8D3pbJcnVaMeOZKhh8VkAkYWztr+f1bUImVIzOrgy
	BuZ47cqJDG1HBe4GvwmJKRcmeWaklh9e2wTh8Jue8hqQP17rZGiD09B4dPIu1JxeDV9uM7GTYvnJD
	lirE0u4ccNkDjDY4aGWKjyw4WbM9W4YcjOmPAShA9td5EAzUoh8/wT2N6O0PNZu+gZW2UxhPU5F1+
	9+9OIOMmnPDTuODicMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVLw-00000005jfA-10Kr;
	Sat, 27 Jul 2024 00:32:04 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmP-00000005RNY-2OAu
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:25 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e0b3742b30bso424595276.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038120; x=1722642920; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=B5cS3fQCyroPznI2D76vYSWht1aEO90tb+OiOa938C4=;
        b=IBsDS6Weschrfr/Y8bjtKGCfkJKvEgOR0klko/q5tcsUNRZEdF0j8jjHz0gSgRdeQX
         EYVYT2ei2pPK+ar54+5intb3VhJfjDgfLPmLeg+ja3Sg73mIxnIGkwAhtxhFZAEAMwVQ
         Tg+KhTBFyI0pJclVZHFg3yp/K1Ev6skm/7du92jK3tPFxOqhTtCb62P5U8LLxBBsENhz
         46ZW6fbkKlGDiqls6wwB5gT6wR5w4bDosvoqDyoneDzLMfBpgd0gKdmE5N/iY21Er0FE
         zNs7O8DElN2bzSBpPuT1dkf6aavBvaAeg0Bn14IJO9wV+VajhaQ1PZrNgr5LVP/EIjWA
         Kodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038120; x=1722642920;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5cS3fQCyroPznI2D76vYSWht1aEO90tb+OiOa938C4=;
        b=byqKOq853eLMFjUuErZ8lTvtbR5Nb5BG2QEzhmps5CmeNB6ZxpuERmVzT4TxCZKPMN
         4s0sPZjIdB21mnfNs653uVvV6XtAgEklA68VKNSTtef3+K4JHASPxxn65UninuWMgO4N
         l2MefsM3qR8MTxvSZ7n4GS2+cJiefE1JZF58Uigg0FrpcNqxyHzUNjXM826AEoYILYWO
         194jkeMb9FYXOJrDd9kQWOI/3NXMesgRIv1g2dzT0Vu1GIM/4yBo18MauzWF2qFVpW+o
         vFpUdA3OE+MzLevQ3ci+VZoyw+ifJpuYYV7DujYSkS8qrxHgzILpFkgp+WyTlsMZUPif
         vLhw==
X-Forwarded-Encrypted: i=1; AJvYcCVfk7wJyZ5L7w6VE+XbWdQw4PehmY22NtuBEcnHT+aAB24h7N5BAUyHjidYax1CRN8SedimGRfmpoq4Ypm1aikNvhfiAtQBs9jtWWpmejKQ
X-Gm-Message-State: AOJu0YwPFvq4TiHtTVrboBjmCjkK0JavluveVFacZysFn6jHrpRwLHwE
	dXkvO1MEMZGaEGKvL9fuHjiHBwAJpOdGUqdyO93HL1/0PDsZrmZSmYI8obQ6nihLqsi0ZFcgWjK
	Ffg==
X-Google-Smtp-Source: AGHT+IFMnVGgr4kpL4f9GKaKFvGezuIshpJ8eZPypNhpoA7Mjxc5gf+mvj1jThnEcafAjrCOymr+lPlnWyQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a5b:606:0:b0:e0b:3139:7ce5 with SMTP id
 3f1490d57ef6-e0b55d079camr27265276.5.1722038119814; Fri, 26 Jul 2024 16:55:19
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:27 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-79-seanjc@google.com>
Subject: [PATCH v12 78/84] KVM: Drop gfn_to_pfn() APIs now that all users are gone
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
X-CRM114-CacheID: sfid-20240726_165521_860113_2EA61981 
X-CRM114-Status: UNSURE (   8.21  )
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

Drop gfn_to_pfn() and all its variants now that all users are gone.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 11 --------
 virt/kvm/kvm_main.c      | 59 ----------------------------------------
 2 files changed, 70 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f2d3c3c436cc..34a1cadb1b80 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1260,14 +1260,6 @@ static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
 				 write ? FOLL_WRITE : 0, writable, refcounted_page);
 }
 
-kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
-kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
-		      bool *writable);
-kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn);
-kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
-			       bool interruptible, bool no_wait,
-			       bool write_fault, bool *writable);
-
 void kvm_release_pfn_clean(kvm_pfn_t pfn);
 void kvm_release_pfn_dirty(kvm_pfn_t pfn);
 void kvm_set_pfn_dirty(kvm_pfn_t pfn);
@@ -1342,9 +1334,6 @@ unsigned long kvm_host_page_size(struct kvm_vcpu *vcpu, gfn_t gfn);
 void mark_page_dirty_in_slot(struct kvm *kvm, const struct kvm_memory_slot *memslot, gfn_t gfn);
 void mark_page_dirty(struct kvm *kvm, gfn_t gfn);
 
-
-kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn);
-
 int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa, struct kvm_host_map *map,
 		   bool writable);
 void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 16bc3ac3ff84..5dcf3561b829 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3059,65 +3059,6 @@ static kvm_pfn_t kvm_follow_pfn(struct kvm_follow_pfn *kfp)
 	return hva_to_pfn(kfp);
 }
 
-kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
-			       bool interruptible, bool no_wait,
-			       bool write_fault, bool *writable)
-{
-	struct kvm_follow_pfn kfp = {
-		.slot = slot,
-		.gfn = gfn,
-		.map_writable = writable,
-	};
-
-	if (write_fault)
-		kfp.flags |= FOLL_WRITE;
-	if (no_wait)
-		kfp.flags |= FOLL_NOWAIT;
-	if (interruptible)
-		kfp.flags |= FOLL_INTERRUPTIBLE;
-
-	return kvm_follow_pfn(&kfp);
-}
-EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
-
-kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
-		      bool *writable)
-{
-	struct kvm_follow_pfn kfp = {
-		.slot = gfn_to_memslot(kvm, gfn),
-		.gfn = gfn,
-		.flags = write_fault ? FOLL_WRITE : 0,
-		.map_writable = writable,
-	};
-
-	return kvm_follow_pfn(&kfp);
-}
-EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
-
-kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn)
-{
-	struct kvm_follow_pfn kfp = {
-		.slot = slot,
-		.gfn = gfn,
-		.flags = FOLL_WRITE,
-	};
-
-	return kvm_follow_pfn(&kfp);
-}
-EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
-
-kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn)
-{
-	return gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn);
-}
-EXPORT_SYMBOL_GPL(gfn_to_pfn);
-
-kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn)
-{
-	return gfn_to_pfn_memslot(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn);
-}
-EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn);
-
 kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn)
 {
 	struct page *refcounted_page = NULL;
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
