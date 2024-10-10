Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7A9D2445D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 22:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7hsaTlJW2pBR7xTxpMBuMIP79NssEbzzlCsAgl2vrA=; b=AcbPi/lxe59UNw
	b1LsZcP1p28jHk8vc5zgDSgbnHpK4QvzEXF2nZm1UXCXCHsaKuZxjMjc7l3mMCVmw4DZ3eHrkatFg
	vBy4RRHZ981lw5Pg8WpdnZnowZOipc6VZbl9i4VcyU5/kiOAnEmNXSvpne0EPZzkcxYfw9rVAhZIe
	L9q0BnHj+DO+aQP1vFGwFqFtaOJM5jcQmQYy9yYyYIfV62FFneVYA9kSruAItsn8jup4x6fWcfEcz
	OwgC+ENfGxEKD0C8fqM5TiGtr0ZhB508j9PYsCgLDtSlnR1EIdXWUPKvHGAc1BUpS1Sy7h1yNQe4K
	6B/xYhRhE+0dzbw85lKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1SZ-0000000EW1L-0yv2;
	Thu, 10 Oct 2024 22:16:39 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsx-0000000Drnx-1opc
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:41 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-778702b9f8fso1040813a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584858; x=1729189658; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=43Dd+lWRPu/QQcFLGDLhCyyiH7uAqu5vbmltTcj5okg=;
        b=ge/KVFe5o7m0CrYItpSkaRrqEs6HCvjuf4dtPzfv98KYlQGh/QLeT5Z5fSRGccyiyM
         L5Z9adg+js6Zw4rVdQ2gjoah1thpDjUSIdwA5BEg90iA0A65+u/GFFXrzuRt0RMsF8nc
         FjEi9xlv7xPIBxHYIHGj0TGsieacYRgZvJkfGXimSosPbUmJj+3ajkP7+MzdBEKWOnvp
         SHbcEfX0hrL5Pr7biZ1dmkKwIXNL+Zbo7SPItkvjjlFS+KCoBI062lzohEowRpVeDVTa
         7NPcGhOmHlAyjnfSrXiHN7Vs52TomwHW0GC81PbeGkG4HVA6M8JwCgLDg1dR+4rNISfj
         iZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584858; x=1729189658;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43Dd+lWRPu/QQcFLGDLhCyyiH7uAqu5vbmltTcj5okg=;
        b=FhqclAo2MWr2xIQpJsydhnwhh8N0F9Sy7Q3rd9HdMvLaI2Tpp7krIEt24KWtlXK3/m
         ceaRUi4st/UVR7dX+Tbd8bGLTHS/NB8Vyt05gyxjnpU9fS3YwXi6Q780RbMzqj0T2fqj
         vGdrv+nq9VHN6/0tft9Pg4UtbrYiKusTwPb+BnxoPbewbP7JfJ3BxeNbpUhZU1nv6Vcq
         nUz3m8kqCIiXn1Hpaw2jzjB65SNToH4dZfJV1+gxs+9T14PrQA1H/4PYjJb0qiTa4Xia
         nfFNbzWzX44lNib+1eTcH/9LAdgL9zrj32jG9C+XFh3gwLWog32Bb7p3Bbr6OBF9x1l3
         ftQA==
X-Forwarded-Encrypted: i=1; AJvYcCUIYVsSSvE0xS1nRDOPoDiI9pu5pnvfwgcT+2kN5x5AvVL2PFJhUzXlxrjeZbw/t9yyU9rjQ7GhvW/xhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPD9hRZhqliu9sO0lkkxu9pHTWDdN/2iJqQV3bUHGn5fjfYnPD
	x+qclDWe+/XSA9C9yNRP5w9eU/InDDW2BcykW/s5U5tXdM0e+SOcz9qlf5wVUp+0A6M8TVvZuAo
	Bog==
X-Google-Smtp-Source: AGHT+IGjs5y0lK7jvR8/zbNWJNDHfDWRUWSPa98vwOnU2bZ6sNQJgoH/6j7HDiYxyC+lHu033MhghQMujcY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:b208:0:b0:7e6:c3f2:24c2 with SMTP id
 41be03b00d2f7-7ea535dce6cmr30a12.6.1728584857741; Thu, 10 Oct 2024 11:27:37
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:20 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-79-seanjc@google.com>
Subject: [PATCH v13 78/85] KVM: PPC: Explicitly require struct page memory for
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112739_656492_24ABB1AA 
X-CRM114-Status: GOOD (  10.30  )
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
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
