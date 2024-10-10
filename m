Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9310BD24442
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMz3rohP/rD1541BBuHPF24mEDru8OxMRLzuanxS4NY=; b=La6EvMWlI4dXKB
	4j8ZSgSJQuNlyoW9QEhzUp/r/fMyEtnI5Yi3f+i5XoZThyzC9taVdrriUF3niraS9/oqczXNEOBVn
	0Q1UD7aaaG2hdm95fVnVB+lM1yHVs+39oiem2vthDCAUZrtZdmwhSiAqIQAVi+9pAlIpovzoKoll/
	sf1jP2buKJsrKOh7W6vd8v48uHm6j51aGz72FX2O5Vya4SgJ7UeeoGwB6kcnm6tSzYkrG3uMgYEOf
	ZOlcS7QMQVvFhFXioeVG+OqQibrGSgMIb8EJqb0Mq35tBAuONMw5S3a/X/GCk1eMYl1XI+ffrauFf
	iK1RByfumMMV2WIrjNeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syz7I-0000000EAu0-2t72;
	Thu, 10 Oct 2024 19:46:32 +0000
Received: from mail-yb1-f201.google.com ([209.85.219.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxqo-0000000Dq0T-0g0y
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:27 +0000
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e28fc60660dso1617033276.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584724; x=1729189524; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=86tNdlyX8HXR/WHFYCj/131p34DPDBwWgQrhOuSjETM=;
        b=N4gnYeeGDWzC78e3rSacwyrZQ1zS2o0yOL0hz9MvZ+3DIzi+69xBA6zHHWOtGMJ2o4
         +J6iT1n1ARNhvB5RJoFHzuv+22xh20DwcLqiRfU5Zh/1hVlsG256CSfzaJoTeA5X+f+O
         UPmmk1Ezb4cnGxfvJW/RfYmICQgZLA1KjSgMaAfaIwOXS+Pv6DWInlDP9pObpC3C/KlX
         qpCk6StQ5PCtNMk2Jmk2O/6M9v2d2dl4d70qhqpBoXa+gnO5zGGVilZrXdQ2IvvB5vYN
         MmC7jNDHog6vNvFcJPnquCCHzR84iug+bqTRoJkTuXfv6KQUKKv6mk+mlcXTwCkqfzBN
         kuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584724; x=1729189524;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86tNdlyX8HXR/WHFYCj/131p34DPDBwWgQrhOuSjETM=;
        b=K+CePWNZ3jtZx3wq0evWheehaCLcFh/4dVMJGNLujbFrXSys7Lpq5TeIyl77WK+0Zg
         MmB13yhv+ydA7YZLW6gNdFspVf044QF+YfTWKfprCgvFX7DjR/Qkd/2gOXMtqCSUD8DW
         xmnQGyKu7+biUQK/H0uMHMiv0iZZqgr8B0XLcybDwlTarG8jVZZsJmAzeh5+tGlJmlpu
         rwdp1JAumqFhO5VFreSv1JmtLu+4MxBvWzRPAZ/eIMUo4Y/jACdYppQc6CVlkq3Lcv+N
         TjodAUfoDN469cm4zxQ16y1oTg7eQSAve72pjkaVASq+XleYqwedEGKjQtw7+fc3lBRf
         KgCA==
X-Forwarded-Encrypted: i=1; AJvYcCWZlPx3do3GzI8aLQGEgMY1yJAK4jz6Hy0sh5S5yPctQnwrjv45o1G2XgkLKGfTDUiFL+Idarv2wK6nhg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMmQVz4WJtCz2w/Qa5r5oEtVjybsFMJAh4dd5ZkgcInnqwjZcP
	2OYcltwLoq8zFncewnwOS/5oDNiuBnx7Zitp0Ythmgn5qbOshtmwATSJSd0MQC3H0bfw4xazBCX
	5XA==
X-Google-Smtp-Source: AGHT+IGf82b/hxj2IWFe54/TAnEDS4XyhakmYGUWxryxrCLTzb83+cUU5J1DZhSXbLBNZQvipdjBbhmVkR8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:8e09:0:b0:e28:ef25:5f13 with SMTP id
 3f1490d57ef6-e28fe0e7352mr200743276.0.1728584723790; Thu, 10 Oct 2024
 11:25:23 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:17 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-16-seanjc@google.com>
Subject: [PATCH v13 15/85] KVM: Drop extra GUP (via check_user_page_hwpoison())
 to detect poisoned page
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
X-CRM114-CacheID: sfid-20241010_112526_316810_53522E39 
X-CRM114-Status: GOOD (  10.98  )
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

Remove check_user_page_hwpoison() as it's effectively dead code.  Prior to
commit 234b239bea39 ("kvm: Faults which trigger IO release the mmap_sem"),
hva_to_pfn_slow() wasn't actually a slow path in all cases, i.e. would do
get_user_pages_fast() without ever doing slow GUP with FOLL_HWPOISON.

Now that hva_to_pfn_slow() is a straight shot to get_user_pages_unlocked(),
and unconditionally passes FOLL_HWPOISON, it is impossible for hva_to_pfn()
to get an -errno that needs to be morphed to -EHWPOISON.

There are essentially four cases in KVM:

  - npages == 0, then FOLL_NOWAIT, a.k.a. @async, must be true, and thus
    check_user_page_hwpoison() will not be called
  - npages == 1 || npages == -EHWPOISON, all good
  - npages == -EINTR || npages == -EAGAIN, bail early, all good
  - everything else, including -EFAULT, can go down the vma_lookup() path,
    as npages < 0 means KVM went through hva_to_pfn_slow() which passes
    FOLL_HWPOISON

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ebba5d22db2d..87f81e74cbc0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2746,14 +2746,6 @@ unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *w
 	return gfn_to_hva_memslot_prot(slot, gfn, writable);
 }
 
-static inline int check_user_page_hwpoison(unsigned long addr)
-{
-	int rc, flags = FOLL_HWPOISON | FOLL_WRITE;
-
-	rc = get_user_pages(addr, 1, flags, NULL);
-	return rc == -EHWPOISON;
-}
-
 /*
  * The fast path to get the writable pfn which will be stored in @pfn,
  * true indicates success, otherwise false is returned.
@@ -2948,14 +2940,10 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 		return pfn;
 	if (npages == -EINTR || npages == -EAGAIN)
 		return KVM_PFN_ERR_SIGPENDING;
+	if (npages == -EHWPOISON)
+		return KVM_PFN_ERR_HWPOISON;
 
 	mmap_read_lock(current->mm);
-	if (npages == -EHWPOISON ||
-	      (!async && check_user_page_hwpoison(addr))) {
-		pfn = KVM_PFN_ERR_HWPOISON;
-		goto exit;
-	}
-
 retry:
 	vma = vma_lookup(current->mm, addr);
 
@@ -2972,7 +2960,6 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 			*async = true;
 		pfn = KVM_PFN_ERR_FAULT;
 	}
-exit:
 	mmap_read_unlock(current->mm);
 	return pfn;
 }
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
