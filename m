Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E342C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7zHT9+ILBI63Bc0LraZ6b8fEZx6CTUaRbDH+hIrilg=; b=1OJkz9HJBcc4k2
	ycVhzus7g8OVpuwgJD88R0OhSBE4kYBKdwotcjyvpx6xXji7spNZAH9YJlgmIEbrLhwOtLQTk2VaR
	dSvDHJxyH3uO1mZKP0HfgBOlCXaqAwUWslxt+2JliovbRrG8kcEWSFqcWfp4P3RWiRV3mufN4CobJ
	o11pEugy04jppIQMwuEzoBdO/8iY9ruILRk5aMQvsofG4vpEZ8Ut9HZebY55ljyH8NEEQxac6eO/J
	9QtfJXVjyMQ7dH217bMrcDen9K+Ey/TO29oXJ2FocfFzgEAEov61yd0Pm2K2XIoUZuPLhIU8IigEe
	qpz/5AqIG3OTgfYn3fRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVLv-00000005jeW-0gwb;
	Sat, 27 Jul 2024 00:32:03 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmN-00000005RM6-1MvN
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:23 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc5acc1b96so12431265ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038118; x=1722642918; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6h2fNXv3Lnt/1e1wvaAdv81wiOKkGDK2sT+OsnVLOZA=;
        b=bv6x8e7OzatgWEM16HtzYx9P+gZE7PcN+IJjInGpYx8HBYfvejXKBlTdfiXW+T+1hF
         DOMaMF6AivchVERIVt3iw1O1hk17BS5qwimdf2dc91rSqXlUAiWZKQMzv0jBwbEZnWCW
         gBfTdwQPmncfUlLNA7Mwe8X0Zz52tFczeLXekeUP3aMR63YIlv63KTDnJFiSvM1N7rXe
         gxyQSjzpztUkkYIKd0hWwG97nj3aDfxpYghsBnUGyoZyMD3HslXy5oQJKAEIfZMi9cgf
         bz1/XI3D85JPaOLOEGxWUxbSU9BpG9zYyVZnXAgHlL64p1pFuV5sbVPuwX9PmVza/87O
         N0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038118; x=1722642918;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6h2fNXv3Lnt/1e1wvaAdv81wiOKkGDK2sT+OsnVLOZA=;
        b=u42i2Cng0AbAQAqCTJuGnoll88tu5IfEnhZou/nx+K2P+syaozgQvC4hH5NpeOk7kM
         EfkpxHk+T0edZsZmrk1c57Wn0BeVvhK4dAVlTPOGe+5hFC+Q0aNQqez22+N3MmM7v2cH
         QBkK4fTC40XIl3ESUnCmqV4mEs8dZO8WulX8Tczt6UuGDTbGolb4Mgfb3dOgShmiekdZ
         FH4xjcMfsjUmVVyHmWfsCY595w+ESXj4QL8k6Av6UsXjt/8WDcm0Wlc++E6lI8fxtcRW
         VEn0iXjILpav59OjESEGAS9ICOlQzvXbNroz89hEn1vYFx8pLR9rzrAHaI8NL1TVJgIg
         bXqw==
X-Forwarded-Encrypted: i=1; AJvYcCUeYzaJHgwqW1XMy1kmSrweSqTI828loL/6So6wQBV+2PnbP0uswzxk03xJdEenEU1F3lSgYfc2dFDmlMC8/4yVb75STPXDRic2409qeVRA
X-Gm-Message-State: AOJu0Yw5KzKvBqJM2QQTjPNzxPtivf9fdqvEwkqUIHuCrpdLrlVYX/X0
	OWE1ly42xrmmFNTF5rZpmrl8AsjA1C2Gb2bHfxwBZw4p/p26Y+OYs85ovTSJHcHlQ/71T2f1fge
	4VQ==
X-Google-Smtp-Source: AGHT+IEudPW7JEwYI6UrgE0ex8JC6EzLtvCIl4+qVoUW1lZq2cn7k6X5ytnrRNqYuzfOTIfNZ2CfrPbG7k4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f693:b0:1fb:b3f:b9bf with SMTP id
 d9443c01a7336-1ff046e1217mr520495ad.0.1722038117916; Fri, 26 Jul 2024
 16:55:17 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:26 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-78-seanjc@google.com>
Subject: [PATCH v12 77/84] KVM: PPC: Explicitly require struct page memory for
 Ultravisor sharing
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
X-CRM114-CacheID: sfid-20240726_165520_257572_07ACE910 
X-CRM114-Status: GOOD (  10.58  )
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

Explicitly require "struct page" memory when sharing memory between
guest and host via an Ultravisor.  Given the number of pfn_to_page()
calls in the code, it's safe to assume that KVM already requires that the
pfn returned by gfn_to_pfn() is backed by struct page, i.e. this is
likely a bug fix, not a reduction in KVM capabilities.

Switching to gfn_to_page() will eventually allow removing gfn_to_pfn()
and kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 92f33115144b..3a6592a31a10 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -879,9 +879,8 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 {
 
 	int ret = H_PARAMETER;
-	struct page *uvmem_page;
+	struct page *page, *uvmem_page;
 	struct kvmppc_uvmem_page_pvt *pvt;
-	unsigned long pfn;
 	unsigned long gfn = gpa >> page_shift;
 	int srcu_idx;
 	unsigned long uvmem_pfn;
@@ -901,8 +900,8 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 
 retry:
 	mutex_unlock(&kvm->arch.uvmem_lock);
-	pfn = gfn_to_pfn(kvm, gfn);
-	if (is_error_noslot_pfn(pfn))
+	page = gfn_to_page(kvm, gfn);
+	if (!page)
 		goto out;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
@@ -911,16 +910,16 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 		pvt = uvmem_page->zone_device_data;
 		pvt->skip_page_out = true;
 		pvt->remove_gfn = false; /* it continues to be a valid GFN */
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_unused(page);
 		goto retry;
 	}
 
-	if (!uv_page_in(kvm->arch.lpid, pfn << page_shift, gpa, 0,
+	if (!uv_page_in(kvm->arch.lpid, page_to_pfn(page) << page_shift, gpa, 0,
 				page_shift)) {
 		kvmppc_gfn_shared(gfn, kvm);
 		ret = H_SUCCESS;
 	}
-	kvm_release_pfn_clean(pfn);
+	kvm_release_page_clean(page);
 	mutex_unlock(&kvm->arch.uvmem_lock);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
@@ -1083,21 +1082,21 @@ kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gpa,
 
 int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
 {
-	unsigned long pfn;
+	struct page *page;
 	int ret = U_SUCCESS;
 
-	pfn = gfn_to_pfn(kvm, gfn);
-	if (is_error_noslot_pfn(pfn))
+	page = gfn_to_page(kvm, gfn);
+	if (!page)
 		return -EFAULT;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
 	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, NULL))
 		goto out;
 
-	ret = uv_page_in(kvm->arch.lpid, pfn << PAGE_SHIFT, gfn << PAGE_SHIFT,
-			 0, PAGE_SHIFT);
+	ret = uv_page_in(kvm->arch.lpid, page_to_pfn(page) << PAGE_SHIFT,
+			 gfn << PAGE_SHIFT, 0, PAGE_SHIFT);
 out:
-	kvm_release_pfn_clean(pfn);
+	kvm_release_page_clean(page);
 	mutex_unlock(&kvm->arch.uvmem_lock);
 	return (ret == U_SUCCESS) ? RESUME_GUEST : -EFAULT;
 }
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
