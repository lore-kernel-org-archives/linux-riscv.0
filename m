Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE02CC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X59S8vP6LP9iIDnuqwjIaB7+gLPURkZ3Dproh51pOkA=; b=p3348C9+HVPYAK
	0bhqdO4K9FiwLccpu52+I4u/xfnc4R2sCHkFPrfytMxFg5Xu2/hhO7HWYadMvMh5dH6D3KtN32f7E
	ZtBXbDSV46xD61zRPsgFVPQadr7JXwb//CVkVg05oy7Zr5xaUf0ay1Jo6TrmZyvaA4laX86/L8xti
	DPQCQTAXt3CYN/+kdPKTMOfGWmA5Ko74rPtcU5OizI7gKVEbC1nMUGkVGkAvdkPa4dxX19Bs3LrQB
	VftSBc+HEFiq5YnZJpJMQV+G+cP2luMXQKPzgAr+ORg/xjAOYrJlyQbka2oxBH/MB+30421mEnJEG
	6ACSLbjR7Wf4zbwR6aVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVNg-00000005kUq-38YE;
	Sat, 27 Jul 2024 00:33:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmg-00000005RbU-0B0L
	for linux-riscv@bombadil.infradead.org;
	Fri, 26 Jul 2024 23:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=diuq/5OTzA7KvKsX4AEile2HlGAF4SgNWi1szy67iaM=; b=KuKgJ2udL3Y1QealZobthOh+bF
	Fq0cgzP4YEw30vdv7GRlsYaSs/HXfftXMnmKpclwvehzdF0UdnVtSP8T0h7WOiXLuprSQg3PANyGo
	2iPiOVVa0VyE6w0UMnAIwjzMl7hElN2ms1clgX4MpxK10q5U8D3UK+402qrKuLpqZxdvXFsdPH0n0
	9qfca/FDS3SXl06HKuO00WIcQ34J7Oh3cMU2idzvIvnuu904+bK3BC+XAV+RaParerPbdxXeB3J/5
	skqAkTuQkicWCiSTa4eC7nd7l/5JWGL56b0XfCLBZWalO7mvZmvNQ5ajrsCUXuKIEvdaTwwnDcoXM
	/LkRBSsg==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmc-00000004K6H-0xBD
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:36 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-70d26115cd5so1194220b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038132; x=1722642932; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=diuq/5OTzA7KvKsX4AEile2HlGAF4SgNWi1szy67iaM=;
        b=uNv/hXtg8S753DpdEml61zsDUsMp1LcW/lR5JnxqJO7/Tusb0OAi1+C6yO8KXYsyq4
         R2mJ4zC2EBM5dEjitRsr6UxrywSiJJVS48i647XcBc7jUlj99hXL6iLuBzoS9AKnTsY7
         k9waw7JyXbP16iDKQOjToiSxm7glIqDN82YIjbZ7lQ+6hAlx2Q/lMSpErCVX1L0THGlX
         cxZbN6Xxpji5Hm8NtN0cpDeeK5g5Vw1Fq76o54C/BNvtghIs7RiENbxIzFhrVz4sZLYz
         ni87+jdyiOmNddHLQ5ZRqJ6tOBNSiGCSh/0lwm5aWJP3FwnoBOKPCUQ9gOUa+NicvqKF
         S/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038132; x=1722642932;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=diuq/5OTzA7KvKsX4AEile2HlGAF4SgNWi1szy67iaM=;
        b=nZhbr7MNZzMFQhE5h7ZtJCZc65YNq3CPajg1YLNe16J43htsQ8z/HYnMFO5lfvD3U+
         t0/CPyTQK6E1cws26z2mRhM6YAaEnW5uqnOyGyih1JjMM9wCNu9gemmYLlrHuBl+UX/e
         q+6FR8WnudMpzCaH+BjdHrjnnCfGXAVh8KuRNQDGU0ZucEy/A0VMgTW1EY6mUzCzmBWY
         B8GBM9JqzJF9r6S1N24E8Lrwhv9DDnPH2KZNZey6Y7WcuhRGdOnQUkwhr0VVCk/xX6La
         mdQUH3mUfrF4XpmvrIschao1iNHXtbGs9L0PkT5NhH+kkcOSwBn9SOFfFTloKYnF5ugH
         RJBw==
X-Forwarded-Encrypted: i=1; AJvYcCXrGqZzopytB1UlLYl2GZ9ZyJpb5MyE8Xw85RFNzJML+PuxkNQHIu9QOiEFvz72yGaXLu54oMehm4csnKSy5C/Yq+vM5PxA4QQsCOktGHRj
X-Gm-Message-State: AOJu0YwfvGtwXthAXgQK73TzLrY1YrhTBSZLZTgbIQta5UdFe/OIFCbP
	afKqNbU/W4QCCh0Vk6kGuQS2ApjG7IRMN7t0uj0a9rdq83p1cxoTQ50WutTCdFjoIWu4kZYLZOg
	77g==
X-Google-Smtp-Source: AGHT+IHhZHDOMBimQWMolk5T4YvfOEDeWobwSpVEA59XfGWHoVcD5oY/zbLuHzkbg8Phg0CxGQdxohIyYms=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:66e5:b0:70d:27ca:96b8 with SMTP id
 d2e1a72fcca58-70ece926ad1mr25428b3a.0.1722038131828; Fri, 26 Jul 2024
 16:55:31 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:33 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-85-seanjc@google.com>
Subject: [PATCH v12 84/84] KVM: Don't grab reference on VM_MIXEDMAP pfns that
 have a "struct page"
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
X-CRM114-CacheID: sfid-20240727_005534_441675_5B893ED1 
X-CRM114-Status: GOOD (  20.52  )
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

Now that KVM no longer relies on an ugly heuristic to find its struct page
references, i.e. now that KVM can't get false positives on VM_MIXEDMAP
pfns, remove KVM's hack to elevate the refcount for pfns that happen to
have a valid struct page.  In addition to removing a long-standing wart
in KVM, this allows KVM to map non-refcounted struct page memory into the
guest, e.g. for exposing GPU TTM buffers to KVM guests.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  3 --
 virt/kvm/kvm_main.c      | 75 ++--------------------------------------
 2 files changed, 2 insertions(+), 76 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 87d61f16a449..d4513ffaf2e1 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1702,9 +1702,6 @@ void kvm_arch_sync_events(struct kvm *kvm);
 
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu);
 
-struct page *kvm_pfn_to_refcounted_page(kvm_pfn_t pfn);
-bool kvm_is_zone_device_page(struct page *page);
-
 struct kvm_irq_ack_notifier {
 	struct hlist_node link;
 	unsigned gsi;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8b85e1130a63..e279140f2425 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -160,52 +160,6 @@ __weak void kvm_arch_guest_memory_reclaimed(struct kvm *kvm)
 {
 }
 
-bool kvm_is_zone_device_page(struct page *page)
-{
-	/*
-	 * The metadata used by is_zone_device_page() to determine whether or
-	 * not a page is ZONE_DEVICE is guaranteed to be valid if and only if
-	 * the device has been pinned, e.g. by get_user_pages().  WARN if the
-	 * page_count() is zero to help detect bad usage of this helper.
-	 */
-	if (WARN_ON_ONCE(!page_count(page)))
-		return false;
-
-	return is_zone_device_page(page);
-}
-
-/*
- * Returns a 'struct page' if the pfn is "valid" and backed by a refcounted
- * page, NULL otherwise.  Note, the list of refcounted PG_reserved page types
- * is likely incomplete, it has been compiled purely through people wanting to
- * back guest with a certain type of memory and encountering issues.
- */
-struct page *kvm_pfn_to_refcounted_page(kvm_pfn_t pfn)
-{
-	struct page *page;
-
-	if (!pfn_valid(pfn))
-		return NULL;
-
-	page = pfn_to_page(pfn);
-	if (!PageReserved(page))
-		return page;
-
-	/* The ZERO_PAGE(s) is marked PG_reserved, but is refcounted. */
-	if (is_zero_pfn(pfn))
-		return page;
-
-	/*
-	 * ZONE_DEVICE pages currently set PG_reserved, but from a refcounting
-	 * perspective they are "normal" pages, albeit with slightly different
-	 * usage rules.
-	 */
-	if (kvm_is_zone_device_page(page))
-		return page;
-
-	return NULL;
-}
-
 /*
  * Switches to specified vcpu, until a matching vcpu_put()
  */
@@ -2814,35 +2768,10 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
 	if (kfp->map_writable)
 		*kfp->map_writable = writable;
 
-	/*
-	 * FIXME: Remove this once KVM no longer blindly calls put_page() on
-	 *	  every pfn that points at a struct page.
-	 *
-	 * Get a reference for follow_pte() pfns if they happen to point at a
-	 * struct page, as KVM will ultimately call kvm_release_pfn_clean() on
-	 * the returned pfn, i.e. KVM expects to have a reference.
-	 *
-	 * Certain IO or PFNMAP mappings can be backed with valid struct pages,
-	 * but be allocated without refcounting, e.g. tail pages of
-	 * non-compound higher order allocations.  Grabbing and putting a
-	 * reference to such pages would cause KVM to prematurely free a page
-	 * it doesn't own (KVM gets and puts the one and only reference).
-	 * Don't allow those pages until the FIXME is resolved.
-	 *
-	 * Don't grab a reference for pins, callers that pin pages are required
-	 * to check refcounted_page, i.e. must not blindly release the pfn.
-	 */
-	if (pte) {
+	if (pte)
 		pfn = pte_pfn(*pte);
-
-		if (!kfp->pin) {
-			page = kvm_pfn_to_refcounted_page(pfn);
-			if (page && !get_page_unless_zero(page))
-				return KVM_PFN_ERR_FAULT;
-		}
-	} else {
+	else
 		pfn = page_to_pfn(page);
-	}
 
 	*kfp->refcounted_page = page;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
