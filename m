Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C306DC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0f9SIQgVoi4JxLLt8CRiKFEkOf3RtzD62gjFFY+Jfx0=; b=2ZvbHIW2eZqWf+
	WLADpfL53kofDKqkoz/MKbf4kfgcpkcfZA1EmJSChWdVixgzUko7WXdzfRPPpilDf2/WbpaRnly+8
	n5AQIKfC4VaLPwW+hNKlbQnJEPSldgcyCoK8XjZTG1aQ/ajb0YgK20O0hVdxMLNhIvLFAt6eNM6Lf
	yG71bKARJyrIc52ahdFM2ffxvv7ycN2yLn9auQPBHHZ/NzHySa8h4MDPS1ACo2CI/gIUYjHdnmmUe
	n6+SEwjhVQTXz+0jyh1+Yd4J+m8Wa7Gae2dDIHJg0BxcU6MJSlq6kvkf2gfP4VayIIGRBs8pYrCKD
	I1xlHsDSrkF4dWmU5vkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVEM-00000005g1Y-1wm0;
	Sat, 27 Jul 2024 00:24:14 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUll-00000005QnU-3bX1
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:44 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc52d3c76eso12300875ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038081; x=1722642881; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=eM04pE2oItbps9DzmNWUdptdfO1yLAvOtXUsQdNxOmg=;
        b=uZNIDEchj1DUpSbAExGQ2gxdUyZ5XEFg43Ir2gS9nJJQQQaFG3FUUDejjwRrhZDKFE
         bvRpyKj7seBMkPDNMbMVx8P80bvD/UzxH3fjCGf9NMGaoeKaE2Fhaj5Nv17Je21cXySH
         JyXY/9ANtL3fGhU3TqrOADJoc90XTprKVm6nVZ19gvLwymJWrhLooIEb8MiB4NDpUyrO
         Hxhn3wq3tPahUd7ZsFA7GIhyVDy8XQ/S8BHfZrQOOMtCSnN4toEkNftRm7Y0wtmWacDP
         Z3DpuLx6MZ+LzSgaeJUCXLH9VRtQXPo+257A2WZzC3X5JY8bIo0vehH6kPdIiYLXTqA1
         dIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038081; x=1722642881;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eM04pE2oItbps9DzmNWUdptdfO1yLAvOtXUsQdNxOmg=;
        b=pXaRrqxAA5MdY4WGSVh9d8XI0zJAGlFrkQeaB+MUKzgT/4H1EH9wGRfKAiib+7EyMc
         O36etpbsSdg6MRVB5dpyoRRZWjkVSFPu+0VZfgT1lQ3v4vvzgFea+5CBcKZ9rPaaN+kM
         aPMUusnMmoVY/6wjq6OD1XhbF8u+C7Eq6BRo50M5sE+hLhTKBIE1Gqg0p5TN+6lQ6bdG
         r2zStD0kG9KqR3hYGTc6uAlaC8bjavWOkcpn0W7feh03H5p3HKZggmN0+pWInIZUCZ6j
         wtLYSwP5nlfnVkQljOKEfsWwyIQEUh6AkSFSr4PesttSS2s6IqhPlRbf8oI07VT7O9fD
         GZSA==
X-Forwarded-Encrypted: i=1; AJvYcCX6JRCdRzzr6tE2VNB5eJcuucJi38ZNZ1T//owzuGDZJrRNBgFe3wcI7J4DOnLpgqSvXbFvHGQFPkYETG/B69W2f/bpwX/PtMrNRYuz3usc
X-Gm-Message-State: AOJu0YxlosImtC/a0hjkLhgliM8ij7w+G7vaBiNYGLCRO7ni3bo0WDU/
	x/6Z6bcsOojqKJM9wPIe1f6Zaxmh4bjJDb53vcnSfuK2gsvxVzWwEo0LW1cC6S6G8CgW0YfdmSD
	Daw==
X-Google-Smtp-Source: AGHT+IHO8zzuGkjlMSTl8Rqd7iW1pR8+tgiNg2ojfeAF3X7ugPbzXNjRAQyOFKQ91J/aSe/NwOtEVPH7LtU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:db11:b0:1f8:44f4:efd9 with SMTP id
 d9443c01a7336-1ff047d0af0mr1044175ad.2.1722038080667; Fri, 26 Jul 2024
 16:54:40 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:08 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-60-seanjc@google.com>
Subject: [PATCH v12 59/84] KVM: PPC: Use __kvm_faultin_pfn() to handle page
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
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165442_075661_5C6B9A8A 
X-CRM114-Status: GOOD (  12.59  )
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
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
