Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6704CC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ph4NmL1RDsD0QAUdu9/Ltbz6uztoocyUpV4y7L5+cEY=; b=yi9Rwasw9LpxDo
	64Lfn6WIURgf7E0k5mnoZV9iDR754TiLm3Zn77h7MP44Zhhb9ROX8EDPtbDRk82IPnmKcdEdyzLYH
	LrKTZCqRTDXDVIhHmqB3y63Vqf8QoYZ+WiTXqgcaKXGc8NYyjcCDet7jNcfyOFhDz0TlUSEPZvcqj
	dMGCz90pisd7h6U0APAkpYUsIehiAABVfDxxUHkfc+YpIzB687/CZQg69HHjkJQDRpI4VWBqg6tDM
	kWPNktENwhfTu6Fmi7QEN0jBnXwJjnR6SNqtLoTQ+4MzHcDrADI5/Kfesb7HrAaWSsZZj5Dc46UtJ
	SAexc6BeZSI7WUYUFzkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVNf-00000005kTv-1lo5;
	Sat, 27 Jul 2024 00:33:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUme-00000005RaL-2cgP
	for linux-riscv@bombadil.infradead.org;
	Fri, 26 Jul 2024 23:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jpI7lTRxFmJ8IejB0Qdg95emli3A+yh4X5lHdX1qdPI=; b=SFbEzVdz/Z3Eehqfh/wTNKzrKj
	qSes4bY5AvKcd8FbJDzUCgxOiXb/ADouHm6zGs49lUAoq71Jz93vbzgyWSFbGCzDJqnj/ag3I0ICT
	x+m+1qNOvhowosyLUax1VyPH4a688MyH6R+g308nAIkuH1N4U6tlrW9FXTlODh8tG0BXv/7XnyvUo
	VzM9bhUjeoDj4wQhlcus1l5CQfv4ri5ooQA+mEPrgBAGxIOXDJAp4PFmHIhPwhmkVBVGplSJcQtnJ
	rYUxO+VrRAlNN+BK64NszPlK4lSHcntS9GzkPBC8SfB9lCO2KUXxiCBZjNg5xpmLr1BcLpLpafrh7
	yxZDhDqQ==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmb-00000004K62-0WOb
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:35 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2cb600e1169so1650552a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038130; x=1722642930; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jpI7lTRxFmJ8IejB0Qdg95emli3A+yh4X5lHdX1qdPI=;
        b=ekjcoN5WbTzN6fVlgke7IKaXdIbLufxQundkgaUu9xBMfqR3dAwAAI6RnWyG4gr8WH
         zM9Cf8iIBWQkPTazAW9eUfsegaqEVyP6bF4mxlA7Ew3kXO9wpoOejVIp5uRG000bQpp5
         x6B3sYIQx6iwE7bzmuKd8YKotf1ZMjRZNyb05ompSdOhOBa6G6IEvMlqCMG6CewBCOrG
         AADVm4xBLGDaVAyRGd/HiKPp4VWf21/czjWdQWMKV+/uO09MXK4NLcBbR88HaeAfUIXh
         vZmjpSReuZnpjmcJD541EQ69G9jlxvgu065gnMMgrOdhe+ofaK42PVkfdjWbSuJjFgdz
         iL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038130; x=1722642930;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpI7lTRxFmJ8IejB0Qdg95emli3A+yh4X5lHdX1qdPI=;
        b=YZHVyr/Mx76LFDDkm6/svMACZ+HSohTwqj3w/OqbXD39jQSn0KSuEX/8FEsPjMYdMr
         GvvYWbqbkIAfAvaEzjANbzUWlhK9gtrLNnx/s+fKvhPpCf1BafIq+2zECB2LmYPmpG9Y
         Isc5varDkQ2yx9fapCcUgQyVH6i0XeHmmNk3V+hwRBkPCKRYRkuR0DvUrzZck5R8uaB0
         pZm+SZeshCTektuM6UHxheo6CAk+vkf5dp2dq6z/Gpxk3ICyTVttkPLxKgv75XfhQfsA
         Gw1B2iJwyg7lvaqsmToHzUAJihpS0xFMZmmxhvRY2sD3Eo3ZAjL8dcyxaffrX2M8cEwL
         Fz5w==
X-Forwarded-Encrypted: i=1; AJvYcCXNFlOP1L7goRcIy+/f9I5ReEYsQHFqv2DdU75LSgnCPyFgwB76Hs5g0RmSMm1EnhrNUMCXp5kIfccy1sazATOus0v+nQkwxhTcK25eWUVu
X-Gm-Message-State: AOJu0YxDEK6knbVpT01q6y9UDObZTLVOeCeOwuxR8ynqK0HM6u4g4wGO
	sLfcZfu0FEuEfptVVkGQQLy1XCo/F5n5Vk+rUJ+BHceLqCr/xegbUBA/abNsA+1sAsj3kzq3D4c
	mgA==
X-Google-Smtp-Source: AGHT+IFv8CQNcqhsspCtIqnm+Y+lStR0ot3kSIK9X3XaAk7UtrG+09935pql8gySUvK94zWnbXq5q/tu644=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:fb47:b0:2c9:61f9:9aea with SMTP id
 98e67ed59e1d1-2cf7e618b7dmr21168a91.5.1722038129745; Fri, 26 Jul 2024
 16:55:29 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:32 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-84-seanjc@google.com>
Subject: [PATCH v12 83/84] KVM: Drop APIs that manipulate "struct page" via pfns
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
X-CRM114-CacheID: sfid-20240727_005533_424845_CED5262E 
X-CRM114-Status: GOOD (  10.08  )
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

Remove all kvm_{release,set}_pfn_*() APIs not that all users are gone.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  5 ----
 virt/kvm/kvm_main.c      | 55 ----------------------------------------
 2 files changed, 60 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 34a1cadb1b80..87d61f16a449 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1260,11 +1260,6 @@ static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
 				 write ? FOLL_WRITE : 0, writable, refcounted_page);
 }
 
-void kvm_release_pfn_clean(kvm_pfn_t pfn);
-void kvm_release_pfn_dirty(kvm_pfn_t pfn);
-void kvm_set_pfn_dirty(kvm_pfn_t pfn);
-void kvm_set_pfn_accessed(kvm_pfn_t pfn);
-
 int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset,
 			int len);
 int kvm_read_guest(struct kvm *kvm, gpa_t gpa, void *data, unsigned long len);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 030a08d4b21d..8b85e1130a63 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3200,61 +3200,6 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
 
-void kvm_release_pfn_clean(kvm_pfn_t pfn)
-{
-	struct page *page;
-
-	if (is_error_noslot_pfn(pfn))
-		return;
-
-	page = kvm_pfn_to_refcounted_page(pfn);
-	if (!page)
-		return;
-
-	kvm_release_page_clean(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
-
-void kvm_release_pfn_dirty(kvm_pfn_t pfn)
-{
-	struct page *page;
-
-	if (is_error_noslot_pfn(pfn))
-		return;
-
-	page = kvm_pfn_to_refcounted_page(pfn);
-	if (!page)
-		return;
-
-	kvm_release_page_dirty(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_pfn_dirty);
-
-/*
- * Note, checking for an error/noslot pfn is the caller's responsibility when
- * directly marking a page dirty/accessed.  Unlike the "release" helpers, the
- * "set" helpers are not to be used when the pfn might point at garbage.
- */
-void kvm_set_pfn_dirty(kvm_pfn_t pfn)
-{
-	if (WARN_ON(is_error_noslot_pfn(pfn)))
-		return;
-
-	if (pfn_valid(pfn))
-		kvm_set_page_dirty(pfn_to_page(pfn));
-}
-EXPORT_SYMBOL_GPL(kvm_set_pfn_dirty);
-
-void kvm_set_pfn_accessed(kvm_pfn_t pfn)
-{
-	if (WARN_ON(is_error_noslot_pfn(pfn)))
-		return;
-
-	if (pfn_valid(pfn))
-		kvm_set_page_accessed(pfn_to_page(pfn));
-}
-EXPORT_SYMBOL_GPL(kvm_set_pfn_accessed);
-
 static int next_segment(unsigned long len, int offset)
 {
 	if (len > PAGE_SIZE - offset)
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
