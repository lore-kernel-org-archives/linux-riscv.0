Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CE1C3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 23:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfMi8yMqB8XqzATHk2DbD9RPt53vmyavsIweXRP7D/s=; b=asGtAZM8Xvcftu
	Pu2gK1aDrhdhoBVOhpK+PqprN/sQ7Ls9NFakGZC+Oc642vrAFSGm7CVT6226r/CtLyF31uY1LK6KX
	lr3waoP5hYGWvfl1YrJR004PVSPp3Y2TzHuuzi9xqmb8rqd/HbJYYq/QdCjFeRJwhSGgzKSb3l+Nt
	o/AYWwNWMqKuDg0odkakYC02EjrrDFWFJxqIBe+NaFMdQjl0FYVuBU2xh0KqtEWO64fmtLblyUmbR
	i/OAJ/vNsq555KamQyUXxGfJDIxuQzAhfWCSsZTGI2Dx01unKdw5t/jB6kN9rAaMEQjaUGaDEEuwe
	jTpjQz2ILa3t05p2Kmqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUpf-00000005TBv-2s8V;
	Fri, 26 Jul 2024 23:58:43 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkD-00000005PRI-2CVh
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:09 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2cb6c5f9810so1641239a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037984; x=1722642784; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=G8vTlhvtYFVN9mhfz5x+cQCHJ6x1sNjhm2Vdu8bZ6Vo=;
        b=Nu+8mYXFrYQ5YGwtZj98aR8Bpk4QcMuLT6l7jV9IsZjg3lTutavr/cvyPs6tcwrFs8
         KPWEPH8Amfj9zJmEfsrHoTcXY4sA6UPjsP0m5qqmhPjweB5/7J7uQMeLfoQtFXp3qmce
         a0wxJeC7vcAYd1cpEq9sri3nrvZycIeKbX3BbeQJVjVwqeA66HSueDrGq8exAFokz9mx
         ahpm6ZNkiRGaN34K+NkIXW997l2nYvEe1zRd7cTp2k8cACI5pbJsPNdN3R4nVsrLpk9L
         /bjZCyhwuppDXmcy7IV+A2B7ix5Hj+EWUZWdbOkPk+nfftcc9iq/AoN2ad7zUCqXM8Ih
         bPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037984; x=1722642784;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8vTlhvtYFVN9mhfz5x+cQCHJ6x1sNjhm2Vdu8bZ6Vo=;
        b=TwRtMptS0JleT2R0A5lQRSdCKwFjM3nKVNou3j2sA09n58j4iaofV3wZuUQUNIuyAI
         Dw9qifxuYtwuThlgZlKtWuh6Rg6QlcCVyjcby2tWg/YGgsMddxGt9C+r/oCAQHXHLXzX
         Pol/K61OIusYlpcjWkN6fpHRKgoej3GJEuc93KENRRlNmHmd8VChkGz/qBTyVDSasZ1V
         ZJNihoOidGDtVtMgXwsGshSdZZRO5RMM/bGKO8yn37PjOtt/fXpWCQVHcqn6GhpGBIdJ
         HkEZnL/UXWgeYS3h0/jPWZa9PQT0oflJP0pnBiOL6C+oEKje08cGzg1klzumY/srDcgB
         Ei8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6oq5WrOPN4SU35VXXYBDFkCXVBo/r6cB9B9OtZhQifwev3tzJXsigeZxrc+5U5B9lOsej1Yx589ltn/zXU2+r/hawJJbxUIZbYyitEqvH
X-Gm-Message-State: AOJu0YwzYcZcU2DUdzARsiwbhXR1EcOqKft1RHOmL2K4uN2JYnLumzgy
	zdbA0lSSEz2a2eiJ0HJgKRuxiR9B57FjQk7izxAf42pP7WP/bqv06wPD1hikgK0oipr5JvRCJyW
	8ig==
X-Google-Smtp-Source: AGHT+IGcvEjw3oRLgbDLJZa9I5d4JQMYDdZeA/FUbXpEzYyt5G6Xd+JdRMAKGNKsfMlLtXc62VqHMV40c8I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:234e:b0:1f6:2964:17b8 with SMTP id
 d9443c01a7336-1ff0492c71fmr137005ad.10.1722037983933; Fri, 26 Jul 2024
 16:53:03 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:22 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-14-seanjc@google.com>
Subject: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn() might sleep
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
X-CRM114-CacheID: sfid-20240726_165305_738887_B4688A65 
X-CRM114-Status: UNSURE (   9.94  )
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

Now that hva_to_pfn() no longer supports being called in atomic context,
move the might_sleep() annotation from hva_to_pfn_slow() to hva_to_pfn().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 84c73b4fc804..03af1a0090b1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2807,8 +2807,6 @@ static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
 	struct page *page;
 	int npages;
 
-	might_sleep();
-
 	if (writable)
 		*writable = write_fault;
 
@@ -2947,6 +2945,8 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 	kvm_pfn_t pfn;
 	int npages, r;
 
+	might_sleep();
+
 	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
 		return pfn;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
