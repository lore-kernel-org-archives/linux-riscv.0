Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C64AC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/AssPJHMp4XEByPsIzQBm6q9rPDQPCad0mZcXTd6WQ=; b=T/p0WmIVR2Wv+4
	mgAz+1Ju8DjdXrxTEpE7kVmZAUP0eEt2HK//0WpYjY3vj7t4Sc2UQJ+jUcO8Mscr+pgCSW35qfBe2
	7uDfHIn14VBMELmrSgKlwkPJaoX/q0y31gnUM9amS34x/M7wNfm0DJDwB/KorSmH6HqkRG4r4/Gz4
	8MZrPA1I0uke1TEpVKeX//v4eAVKKQUpom/zdtrOLHxxyZK+xvDWWWhEXlfNpvIGbCM6AE8iQZ1hB
	98FYQSGDazkiRDOvhTxsPGPvjLuZqzTWt/mDWJIwYU8QkgTtOaQ0MCD+YVjot0z9VfKNMXo9U2dMQ
	i4rrylKKt1RF+Sfe1ITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUs0-00000005UVr-0Spm;
	Sat, 27 Jul 2024 00:01:08 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkR-00000005PeT-2Q29
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:22 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6648363b329so5156147b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037998; x=1722642798; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=F7WgJlT5NNtid7p2jwFbPV8b+lTnD+3vJbPsQDaWDdo=;
        b=3XOSA5RM933aJg+axcS/dYfGlr9c9Wsd4XCEY4eI/LI4a5R2AACLRHOV2Q3NMtLd8+
         L/Nk+bi6Jr7LUskYlXc75vukLpLzRywEBs3oNvi9uM3EihuApuPeeuKDMXbB6IXduljo
         A4US1UPTvJS5f3e+CcyUggxeinwnK4yslhBw/uXLx7ATn0s1jZUP0TZrDhprz9+56Z2n
         Hf8v/czfOcqKPCEvISfFxPJQDDKvrM7NiplzKZOABbdjz04EMt/qzwkYQmi73B5Lq1pK
         KC37Rxj0dInApheZoLxp8RvMCqYIQbLs0e4kyUwCFVRsuQMNONUE1qSaG9YBk0PMIo6m
         wkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037998; x=1722642798;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7WgJlT5NNtid7p2jwFbPV8b+lTnD+3vJbPsQDaWDdo=;
        b=VcBqo5+vezAbkn+hjZTNI/acUufeZOco7QwTCq91DvSBXOGd6JaUso79BGg1Roh0nY
         KmGx0mf17A1LpzVyZeDiKC8aFaILxCaDvq0sHbIDulJx2Q+QZQOwBCJMiOFps3Ei+8+r
         1QI3bY3i0RDxucF3yT7W+W0e3zxmqKcApKFitUudawEKrEdzjaNWtUMIEuQjgznOAn9r
         xYWa0Zbo/jpjhFmfdHvsH4Vk3ZdnzOs0+yyr/AfQZwvwXxSEY8kJA7Qoj/V16OgiaoPr
         ApR6YVM+ETIAJKKCyPQJwDQxpvnIEacUYmiAP7LZt+9eWXK4TzObVOWHaj0R8xJiVIpz
         gQeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaG1H+t+eRYV/Bv89G2GNi8YTY6hFenPk05Gw8AQBcOfN+H9K/O+gMy3ot6nGUnTPI7ujuFj1esXQrhRgx0ifanZgWQ5zLCLBJvtypAovu
X-Gm-Message-State: AOJu0YxXEny1t4gaxf1OtMtbZuhZlKrwYls4VZYxzgvgCNu9/7OEFI44
	mGAT62D993XnQmBitSUn+9w8B8MNER0AU3FNNfClX+ms2tzY9aE/iFIEU4VzXS4mzU6EnouAPe+
	E7A==
X-Google-Smtp-Source: AGHT+IHz6CGF/LJ/2Irg7XXoFs/UlO9MjKavvm7YGPRddocT798mRWwGF7hDBEuQel+TJyAfnYN45In/DfE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:120b:b0:e0b:4dd5:397e with SMTP id
 3f1490d57ef6-e0b5455c058mr1734276.7.1722037998118; Fri, 26 Jul 2024 16:53:18
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:29 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-21-seanjc@google.com>
Subject: [PATCH v12 20/84] KVM: Use NULL for struct page pointer to indicate
 mremapped memory
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
X-CRM114-CacheID: sfid-20240726_165319_853301_CBBDFB4C 
X-CRM114-Status: GOOD (  14.97  )
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

Drop yet another unnecessary magic page value from KVM, as there's zero
reason to use a poisoned pointer to indicate "no page".  If KVM uses a
NULL page pointer, the kernel will explode just as quickly as if KVM uses
a poisoned pointer.  Never mind the fact that such usage would be a
blatant and egregious KVM bug.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 4 ----
 virt/kvm/kvm_main.c      | 4 ++--
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f42e030f69a4..a5dcb72bab00 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -273,16 +273,12 @@ enum {
 	READING_SHADOW_PAGE_TABLES,
 };
 
-#define KVM_UNMAPPED_PAGE	((void *) 0x500 + POISON_POINTER_DELTA)
-
 struct kvm_host_map {
 	/*
 	 * Only valid if the 'pfn' is managed by the host kernel (i.e. There is
 	 * a 'struct page' for it. When using mem= kernel parameter some memory
 	 * can be used as guest memory but they are not managed by host
 	 * kernel).
-	 * If 'pfn' is not managed by the host kernel, this field is
-	 * initialized to KVM_UNMAPPED_PAGE.
 	 */
 	struct page *page;
 	void *hva;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 67a50b87bb87..3d717a131906 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3088,7 +3088,7 @@ void kvm_release_pfn(kvm_pfn_t pfn, bool dirty)
 
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 {
-	map->page = KVM_UNMAPPED_PAGE;
+	map->page = NULL;
 	map->hva = NULL;
 	map->gfn = gfn;
 
@@ -3114,7 +3114,7 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool dirty)
 	if (!map->hva)
 		return;
 
-	if (map->page != KVM_UNMAPPED_PAGE)
+	if (map->page)
 		kunmap(map->page);
 #ifdef CONFIG_HAS_IOMEM
 	else
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
