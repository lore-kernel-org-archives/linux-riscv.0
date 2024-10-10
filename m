Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFD9D24462
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 00:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2yS4EjTXSUuHl8zP7Dlq8rnQGVfvAkDWYpjRt9thxw=; b=4ZMso+pFg5fYa3
	IomO0fmcOs27D+Pc0XwSLU59NroqJ/4FZjmd2kJpdG8k5q6hUvDC0HNJHrP2HnClNh9jfGzdvjRsi
	0m2QbWFGsIDf3vULrEyG7WcH/qCzu/4XdKsIEnMqsfP/28+LDr+BH2jFYm3zbcX+kuqGfGPdT+KPe
	u2yzx0dfRHnkuoOo348AdSx72gZ3XxphB0DznuY1ApAz9ewzsulKX5AYNGVjD21cOMX2LWRKwbeWq
	mJmyAin8M2dM0pM00nWtQisdn7Ej4fzgXUfE8jRWGbOnqAXPd2jDKI/inOtPgeoOU7DQKS2xsRHm5
	FC05rr/OYbRQ9bNp2B4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz362-0000000EiKM-0GPl;
	Fri, 11 Oct 2024 00:01:30 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsi-0000000DraI-0ICc
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:26 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e31e5d1739so25061577b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584842; x=1729189642; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ/c8QPJoSxQXGCWT5aWp1nMy1t7EEzE7+N8fqq+BFY=;
        b=v6KPJlqYJR4mGmcmL/AsMF84scs4V0oyq2QlyNfixKKzIATDSNUV+0XlnkYG0wXdfG
         1TGlx8Q3aEM7vHjZJ7j9Aff5MlUcPnC5NpHxe2emoEMK6I3xeIS+wrEnMFX0gGMrKMd6
         3o+8Tcuf41G1Rd4uU3ujqDhOcby0NH+Z3wn6chCUf85Q1DZyOLbb/v5kRcBVgBP2tXFX
         wAs/sI95wXa968+EifVDV5rU72Gj02WH3yR+CxwZG+eE0WG8Dd7khjpUpzuT79kEnRBO
         BRi/5p+4SSJNd/ZT54cjZaN3WBY1yijvzhZ2QmbtJmCAtVIifH/3gMdwG9OHl/0vDIL0
         j49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584842; x=1729189642;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZ/c8QPJoSxQXGCWT5aWp1nMy1t7EEzE7+N8fqq+BFY=;
        b=FEQNMDQU/h1MK4L8oD/hJWVJY4jVDtrvxD5QwGoq8un//NDK6C3LXYMCn/qU934QOF
         NkxkJIXoAHxVhYiMPB/0uxEV1BxN+bBKbZnjT6cq71SXVzm0ajZ8yd3wbH9qtuincuXQ
         Tf/nXT1vnSb6pZ55Ax0yRNbnhITjqtkMKza87S6LtvEiYhEwvpvcD8W1fWBhh1+blIlp
         xCvSLCfEuXC/2ttR4YBGiLFL21ElChYbQhfIzy3CaYWbyDKBqna/TI/81xAjQU3ejSxd
         RAUYQ3cwyEnbM9ehcDs8kV4Yd/rfVV4OkS8IUNduhVHwqrTDIW859o6Xorqli5H1YnkL
         vhBw==
X-Forwarded-Encrypted: i=1; AJvYcCXRLGs4JK32yLVeZWrUOLPqoeB51bXuJ0gihNmfJJFiLcUT0z0k1q0vkKWZUKeqGi3pKKCAE0ba0+uHnA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs0MRnGTCTFG9G2Sm8wL+UYr7J4HXMKxFfT7Kr5HckPDCjB7B/
	OoGLxM+Z8IJKeBcQY/wWIufhU49o96p3lQ3yxZRjOpaUl0F3keu5FiB+hXZtowr5J6FypMtr8rZ
	wGg==
X-Google-Smtp-Source: AGHT+IHhD+Vk6TwFIS5v8fA24SNPRWU4vCcQM+1g+zVw6L+6pfrMpIdoNti+PehtHCeQDGmk8Jps/9lQ5Ek=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:d30a:0:b0:e28:fe07:9cc1 with SMTP id
 3f1490d57ef6-e28fe4a3a81mr68085276.3.1728584842321; Thu, 10 Oct 2024 11:27:22
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:13 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-72-seanjc@google.com>
Subject: [PATCH v13 71/85] KVM: MIPS: Mark "struct page" pfns accessed prior
 to dropping mmu_lock
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
X-CRM114-CacheID: sfid-20241010_112724_262725_85FB71E1 
X-CRM114-Status: UNSURE (   8.31  )
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

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that MIPS can convert to kvm_release_faultin_page() without tripping
its lockdep assertion on mmu_lock being held.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index f1e4b618ec6d..69463ab24d97 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -634,10 +634,9 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 	if (writeable)
 		kvm_set_pfn_dirty(pfn);
-
-	spin_unlock(&kvm->mmu_lock);
 	kvm_release_pfn_clean(pfn);
-	kvm_set_pfn_accessed(pfn);
+
+	spin_unlock(&kvm->mmu_lock);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return err;
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
