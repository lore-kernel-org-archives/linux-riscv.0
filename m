Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41DCCFC5FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dhd/DztSMRsR8kdPc+AsBfX5TvLAkDZ/Vw2uUxTpMOQ=; b=fdbxI7sPdw3mhQ
	XquwArOjbQTQzjESx5NI+Ij42OpnpNh+M3H7cljNkmbNf/ZZiYFz7S9a4pbwAjroWXn63npMf4+Kp
	FVqDKX904TCeG6McP0dZ523u7kg8PGnxjm1PJwZBkG9Eb+P8BQiwSYFkXmI0o6y1hS5zuVeExz6JM
	u5cvB4gEZmu2OfUJFb2e5NfGSBlT3B+BCuxapdHxIvzupxRuhUHAvKESgA1M47+NflgFvd5KGGfxD
	XJchieU3ftmrWxqwAPFPp7nOhzpRM37+a3hiwFdHZjwN0IEBRpSgIHaNEEK/0AfrlVD/agV3v8mol
	Z3YZf4uvE5OM2OK4tNcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syysf-0000000E7Es-2kMA;
	Thu, 10 Oct 2024 19:31:25 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsL-0000000DrJT-1Ahv
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:04 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e294f38bddso22119737b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584820; x=1729189620; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SD6mqWUZeYJtl6GnT7U0LdjoV3gPIs/AdF7iNpavyUo=;
        b=aBDkusJdX7g5BtG4H5fZwYumgK8uIRaVDx6oulzlDnAE3QYd/mM7atYX1oex5UM4kp
         36HYJ8PnDzc4AfK9p/87+lpLgfHVh0ndquokKS44VTbMF2Oucv/TNfFgaSF5koQ84Xx+
         eB1oBqtktOPbKyCDITEKMRpMt/zheIQaROymC4XkoClTL+P0IlaWL4HGnExqhsEfvMNX
         Grcu4zqEHuWTwdwnkzgTXcXDWS+EhrV5yrg6rh0PIUpcmQja2DfSNNDcjEgoXjjL+DOb
         4f1UgnylDz6N1QWZCTJX94ziWXvHKu5BciXd0kjBuyWLffYTsruMTc2z38kb5Ir5V3zW
         suxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584820; x=1729189620;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SD6mqWUZeYJtl6GnT7U0LdjoV3gPIs/AdF7iNpavyUo=;
        b=l5xSUZrpHvKdeGoLhgVP5TvWhBPzLXlBwad6VgWFuTygx0o7K2QA1mU18SmFHD2Q3t
         cnWW8qj+gAZZ63LNO42ZLUY55365PN/HMtW8hcK9teNNncoIIjmcfgKDQnjeAc/bMT5J
         jqBoeD+sQAi1BHk3bZR3KMrfcWGNrfOnlOKBcs5TRQ85uXx5B+luQDXLDCgSuoO6/Sn7
         j5R0cB3GsnTjf19GqedrKH/0p89qnapKlhfLOCFHpTw8v7N3xdzUMPD5HGJByAmP4NaU
         sgjWYfiaefa71HXkMXFDAHK7EdKY++TcgGdM9/rXtFF+PvXY6eWTD3j8z9fLiFOaGzk6
         eTww==
X-Forwarded-Encrypted: i=1; AJvYcCV8oLtpTzP+UufuOFLUtpVOK9AQuzzkuTC3QOjlrbCRbuO5CtZ4bV7FLAne+hO6TBuE7HXH7/u9i5CuhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKP7DkrZvUu48zwJGnpR2KX36RykGEpnATIDHUu0aXnFTNVI/T
	GTO4XC+e1DgvBJgDdhmETMd+ABo8t7jD/2KUJGCiv4RBTx9j3hy1gEoFJmaVzkGpD6EzE/E1dHz
	eTg==
X-Google-Smtp-Source: AGHT+IGRQvxFZI4ySDHPZ8aV1dJi8vCYkQEt4dLiT8ndc3AvxflLIddldJBCv79vdNFr7/DaBU5iasgDdOk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:ce11:0:b0:e28:fb96:d0f4 with SMTP id
 3f1490d57ef6-e28fe33505emr40781276.2.1728584819828; Thu, 10 Oct 2024 11:26:59
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:02 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-61-seanjc@google.com>
Subject: [PATCH v13 60/85] KVM: PPC: Use __kvm_faultin_pfn() to handle page
 faults on Book3s HV
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
X-CRM114-CacheID: sfid-20241010_112701_453553_EF965D4E 
X-CRM114-Status: GOOD (  12.49  )
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

Replace Book3s HV's homebrewed fault-in logic with __kvm_faultin_pfn(),
which functionally does pretty much the exact same thing.

Note, when the code was written, KVM indeed didn't do fast GUP without
"!atomic && !async", but that has long since changed (KVM tries fast GUP
for all writable mappings).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 2f1d58984b41..f305395cf26e 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -603,27 +603,10 @@ int kvmppc_book3s_hv_page_fault(struct kvm_vcpu *vcpu,
 	write_ok = writing;
 	hva = gfn_to_hva_memslot(memslot, gfn);
 
-	/*
-	 * Do a fast check first, since __gfn_to_pfn_memslot doesn't
-	 * do it with !atomic && !async, which is how we call it.
-	 * We always ask for write permission since the common case
-	 * is that the page is writable.
-	 */
-	if (get_user_page_fast_only(hva, FOLL_WRITE, &page)) {
-		write_ok = true;
-	} else {
-		/* Call KVM generic code to do the slow-path check */
-		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-					   writing, &write_ok);
-		if (is_error_noslot_pfn(pfn))
-			return -EFAULT;
-		page = NULL;
-		if (pfn_valid(pfn)) {
-			page = pfn_to_page(pfn);
-			if (PageReserved(page))
-				page = NULL;
-		}
-	}
+	pfn = __kvm_faultin_pfn(memslot, gfn, writing ? FOLL_WRITE : 0,
+				&write_ok, &page);
+	if (is_error_noslot_pfn(pfn))
+		return -EFAULT;
 
 	/*
 	 * Read the PTE from the process' radix tree and use that
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
