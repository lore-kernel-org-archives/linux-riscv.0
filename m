Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A3AC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4SAsqs62yNW/913Tgsua2i+bTCP676472NL9wwqVHM=; b=osvpDd+44zLVny
	LN7N3oM/lEBY8drjZSOU/efgAkF9Kr+t6Hap29zftoy9lP4UG1NeewxPrJ65DF8WWmya39mswE48l
	6mVsXktOkkIDP1yu8Qe5uy2o54o2HZPrOfBDdmDmvADc7hIciespxlIdDCbExFXg2hBm7kG2PWDs/
	8zRYAVz6ZPikUqPucKGN4HrFKqN45zEQqKRyh1S0fNehYR4LeX+yDj8iQBZbsIe4q6YfiQLnIAUfX
	yf+q5ZsUNi3rbRBPZUPex7C0jiaCmvfgPq/I6Y9lu6Jhkj9DOjd0z6+uVbI3G0uQLjPkrCSe7aAZ4
	2DRSJXww2NX7Jx6MgltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUu9-00000005VZ8-1xYO;
	Sat, 27 Jul 2024 00:03:21 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUke-00000005PpE-2KSt
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:34 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2cb51290896so1531689a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038011; x=1722642811; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=R2I4/1amdIANY6ZAXPe7SG9ch9BlLbSqRy3xqYz3ZKo=;
        b=usE+cDUWTYA9NxUNXAKflQvcZWMbnzlvgsbtIY9kIIPY14ngsjqdMlQgYrtrtZJMV3
         3aAgew+dPMKRL+8GcVCwpYTwngmkHGC1A2XpvdUl8NjZwDq+zY56/QtUKZNAXboM7vV+
         ZO4Y1FzHnsB4xrVD0PbLRCi+dBGtALRWIG4O1bcJU956l/gWIMs2VY3e6hnEtTvhy7gB
         5PI8oUeat1ydranbOfGQlPCBhX3zfZ9mE8/6LxrFxCoAQMmDRrbWZc/pcCdLu8fK08pR
         ifjP9ykxBtBzhO+fbDqQDTZm3Mzobt5Y5ihbHER8PuXRjsnW21d9CkCWK+Xauc+RGMdc
         oJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038011; x=1722642811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2I4/1amdIANY6ZAXPe7SG9ch9BlLbSqRy3xqYz3ZKo=;
        b=Q8Mu7Mp0OE4/w+yyl7gC38g1M5SwieDcmaTK5CbECsaM+S9oZxF5uihiRAaBIspguN
         vmysbRvLcrTsk03HbArVvnoOV+DpRrC0Sp4oCgzHb7xHLfuTPDCMFXKjhb9gYEYn5fAf
         NIlBhGF9yXS5TLvHR0wh8cr5txzo9wXsbjb5vbL67L8W8nJhYRd83Ltc82R9XvR3R2Ti
         5WFCzbAIyfIJECHKqwvQHGoK9rQgilv1aaMfgQk47BYrzKETFhfK70YNKSzKnUNElG+/
         8PojoRUEFwk5kKwqNi5S2UzFVXuT3a1FtRlzpqV7RYG0esWRRmprKqA0CjDIfcCpud3N
         gSuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGDt+7VQvMQpsfi4ix1eI51BdJeheKhVRmZ5y/VuioFU+8RXzFhU8SeWox7nDJ7d0cWKbSNjGCinCcLaAQpGGha6W4IZiC+v/gB4BXOL2M
X-Gm-Message-State: AOJu0YwfcWuwU+nX+stgp9XmctziCvoH3VKl1pmI0ijzm8EiuEGYtM+W
	zM/VKIg16dzmHo68Y3VkGYvP3cD8/SlHb0OTYbQAerxBBQMUxQ17NDZF12HRnf1X2AK46fhXGkE
	xng==
X-Google-Smtp-Source: AGHT+IHKOaCbBS38DB3+XV8s1t7JOWc+aANKzUQK49zxzSlWFwYOsfXU8rtGTN4QUDwCdEEeB4LXs+kD0Xc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:890d:b0:2c8:637:7390 with SMTP id
 98e67ed59e1d1-2cf7e97d380mr2244a91.6.1722038011380; Fri, 26 Jul 2024 16:53:31
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:35 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-27-seanjc@google.com>
Subject: [PATCH v12 26/84] KVM: Move kvm_{set,release}_page_{clean,dirty}()
 helpers up in kvm_main.c
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
X-CRM114-CacheID: sfid-20240726_165332_711321_BC793550 
X-CRM114-Status: GOOD (  10.20  )
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

Hoist the kvm_{set,release}_page_{clean,dirty}() APIs further up in
kvm_main.c so that they can be used by the kvm_follow_pfn family of APIs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 82 ++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 31570c5627e3..48b626f1b5f3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2748,6 +2748,47 @@ unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *w
 	return gfn_to_hva_memslot_prot(slot, gfn, writable);
 }
 
+static bool kvm_is_ad_tracked_page(struct page *page)
+{
+	/*
+	 * Per page-flags.h, pages tagged PG_reserved "should in general not be
+	 * touched (e.g. set dirty) except by its owner".
+	 */
+	return !PageReserved(page);
+}
+
+static void kvm_set_page_dirty(struct page *page)
+{
+	if (kvm_is_ad_tracked_page(page))
+		SetPageDirty(page);
+}
+
+static void kvm_set_page_accessed(struct page *page)
+{
+	if (kvm_is_ad_tracked_page(page))
+		mark_page_accessed(page);
+}
+
+void kvm_release_page_clean(struct page *page)
+{
+	if (!page)
+		return;
+
+	kvm_set_page_accessed(page);
+	put_page(page);
+}
+EXPORT_SYMBOL_GPL(kvm_release_page_clean);
+
+void kvm_release_page_dirty(struct page *page)
+{
+	if (!page)
+		return;
+
+	kvm_set_page_dirty(page);
+	kvm_release_page_clean(page);
+}
+EXPORT_SYMBOL_GPL(kvm_release_page_dirty);
+
 static inline int check_user_page_hwpoison(unsigned long addr)
 {
 	int rc, flags = FOLL_HWPOISON | FOLL_WRITE;
@@ -3125,37 +3166,6 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool dirty)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
 
-static bool kvm_is_ad_tracked_page(struct page *page)
-{
-	/*
-	 * Per page-flags.h, pages tagged PG_reserved "should in general not be
-	 * touched (e.g. set dirty) except by its owner".
-	 */
-	return !PageReserved(page);
-}
-
-static void kvm_set_page_dirty(struct page *page)
-{
-	if (kvm_is_ad_tracked_page(page))
-		SetPageDirty(page);
-}
-
-static void kvm_set_page_accessed(struct page *page)
-{
-	if (kvm_is_ad_tracked_page(page))
-		mark_page_accessed(page);
-}
-
-void kvm_release_page_clean(struct page *page)
-{
-	if (!page)
-		return;
-
-	kvm_set_page_accessed(page);
-	put_page(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_page_clean);
-
 void kvm_release_pfn_clean(kvm_pfn_t pfn)
 {
 	struct page *page;
@@ -3171,16 +3181,6 @@ void kvm_release_pfn_clean(kvm_pfn_t pfn)
 }
 EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
 
-void kvm_release_page_dirty(struct page *page)
-{
-	if (!page)
-		return;
-
-	kvm_set_page_dirty(page);
-	kvm_release_page_clean(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_page_dirty);
-
 void kvm_release_pfn_dirty(kvm_pfn_t pfn)
 {
 	struct page *page;
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
