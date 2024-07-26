Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCD4C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KI33+4dL0T6YBJstl0zuEegOkLq1HxPtdrEMiGKc+2c=; b=FPsQv+eOT5UDot
	hPsYeMW1uqjK1E2q8lHbKODYrki4ldxX0INovLDvUeCrp7z9Avkt0qtzSY7harB57bLFKAcEulZ12
	mU9vS0jjl7n9GPLDBgAzRgr4sm3PYQmcO6ozykDllsaHkzGsOCMICRc6mGejXCVEH6ELvDA1q31AC
	4Qi18wbkBOoO9OUJOxmpxQ2HZOPc4Utnje6YOO1q/Dsu02EI55WK4eFHThUMOjJlW6tZBgX+3ZBHx
	pk77GCromYf4UqM6a17QiBUgCpx3Vo+TO3adE8WFnhA5+rSxGckmfa92laekML3sxEwmShCunaJdK
	3OIZB5wIXVrtj37E2nzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUy5-00000005Xm3-1NEq;
	Sat, 27 Jul 2024 00:07:25 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkz-00000005Q8h-06qa
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:54 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2cb5847ff53so1672205a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038032; x=1722642832; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4+b7zhduK4lVkLFwoy0UCXuK8f7LQragdXHyxQERLss=;
        b=jOgmo1Kvu0Il2tltdTiW7hgTLp/6boECR2qoxz2C3M6DuqGqfEvD6rxMFJao7ANMJC
         ZKDrQfZMIQpU+VtyB1uuiHiPTeSJoGwLLZ3sYBZPnn2CMsBXgYChW1xF71yGUKT3x1sR
         Fdd309XxfMlP2vsu4SALW0c/gnZ/uCJTG9067EVKmbothMcXsC3ccHwB1HSqsl+XiWaD
         02RZs8Qmc15ZgFoAjOhqo0V2ViMrHvq6ejrNIMpGm9hDxQUhJgl4YP2uWic+JAGlZTTh
         0LtJe6rpMqLGG0UJVQPYcJCvjTAvAx6Dgtuiy2zlP8PLmN7eNM/QhAr/wS+gV0QkhpDB
         JJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038032; x=1722642832;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+b7zhduK4lVkLFwoy0UCXuK8f7LQragdXHyxQERLss=;
        b=G/kf3+rqabDMaKBVEqHGXo+go1JtgW6rjJg7D6AhuI3k53xh8bMZLYGA985F4i1TPH
         PjgoeP5K1WFW+n/wXvenn2EQAcgUb8oUJAxvQ0x9I6CTcxaEVY0bPnf5dQcUIeXbmsjX
         IlHs0Ab8G/o3arRs0wAu1+1hYuw0Rg2YinODZMwbX400maWmho8snB90AB0tlxBdwFyA
         s71kH+D+kjdQ4UPVv+d3gVu6qdYO25n+Z0sKSIXSYtDMiJYtn1meLFUiIXAylFZ7k2b2
         iOR29Z26KumOJj5vTA0fsC96T6M6NaLviBWu9QQEXGnAbOKdjXP4NzR2iIijHzNjhB5N
         q8Rg==
X-Forwarded-Encrypted: i=1; AJvYcCX/ZZ8BEDBFj7aiOasIGH2ySe/0Db85ODeIketryAbNpsV/WIh5oFkHlM9oG0RErC/LFTV24e1tNWBmPP7Npp5BBMIwoaRyX4IHWyEovZDK
X-Gm-Message-State: AOJu0Yz6pdTMpb1RYExuh1kuefCjbwiuR7GNzS5NWTfYF9FrcE1scayP
	W0NB7i6UslhVRUdWa0xg+NHecpPW5DXZytYBRejSPF0wtt45dc6Tmpl9qCbJ1J99w46w50NYpMw
	uTQ==
X-Google-Smtp-Source: AGHT+IH83fBTCbgjCdiYRsrBHzQDSmPEXzxw/dBUECcFBZL6/864S5lAdfsy5Zb31ECaUXnMa239gb1WZDE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4f8b:b0:2c9:759f:a47d with SMTP id
 98e67ed59e1d1-2cf7e84e558mr8570a91.4.1722038031713; Fri, 26 Jul 2024 16:53:51
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:45 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-37-seanjc@google.com>
Subject: [PATCH v12 36/84] KVM: x86: Use kvm_lookup_pfn() to check if APIC
 access page was installed
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
X-CRM114-CacheID: sfid-20240726_165353_130361_F1AFC9F2 
X-CRM114-Status: GOOD (  11.85  )
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

Use kvm_lookup_pfn() to verify that the APIC access page was allocated and
installed as expected.  The mapping is controlled by KVM, i.e. it's
guaranteed to be backed by struct page, the purpose of the check is purely
to ensure the page is allocated, i.e. that KVM doesn't point the guest at
garbage.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 6d65b36fac29..88dc43660d23 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2612,8 +2612,8 @@ void kvm_apic_update_apicv(struct kvm_vcpu *vcpu)
 
 int kvm_alloc_apic_access_page(struct kvm *kvm)
 {
-	struct page *page;
 	void __user *hva;
+	kvm_pfn_t pfn;
 	int ret = 0;
 
 	mutex_lock(&kvm->slots_lock);
@@ -2628,17 +2628,16 @@ int kvm_alloc_apic_access_page(struct kvm *kvm)
 		goto out;
 	}
 
-	page = gfn_to_page(kvm, APIC_DEFAULT_PHYS_BASE >> PAGE_SHIFT);
-	if (!page) {
-		ret = -EFAULT;
-		goto out;
-	}
-
 	/*
 	 * Do not pin the page in memory, so that memory hot-unplug
 	 * is able to migrate it.
 	 */
-	put_page(page);
+	pfn = kvm_lookup_pfn(kvm, APIC_DEFAULT_PHYS_BASE >> PAGE_SHIFT);
+	if (is_error_noslot_pfn(pfn)) {
+		ret = -EFAULT;
+		goto out;
+	}
+
 	kvm->arch.apic_access_memslot_enabled = true;
 out:
 	mutex_unlock(&kvm->slots_lock);
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
