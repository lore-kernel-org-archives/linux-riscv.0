Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9447CC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMz35Cd7i94gVGvd4BzU6UzMkrtvX4L2QPX0Ea0PBlU=; b=knxTvB8acB2X1H
	zbYL00nHQQJXfJ2IAglCz1VY7K6ej6K9gc5cSEwLqvj3rJ4L9Lsf/pUDtFCeBq2IJHdCrPWO7CIJv
	m/S6UJkaQfWWOHY/Y1en0CEcDoxV3ycohyWBRewd76ntoTh8+0IDrup3257oH8yTjO2/+KIFunL67
	izM+v3VcdShmR3U6MiwUx5Lqg7gVjU/9E6/h1BAjLhEuNPYbiCulROmJa3eKWNyOEG1EjzFyKbwwO
	nJkXgb2zsFVW5T5kH9F64JW2jd88GkQD5f5Dilxq5qzgylpMUqP8OhBIqJDcoSdm7CeoHJiacza6n
	d3Tcudw9tVgS8vd4t9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXV1R-00000005ZcV-4Bfh;
	Sat, 27 Jul 2024 00:10:54 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlE-00000005QKg-0mke
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:09 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7a30753fe30so1163756a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038047; x=1722642847; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=wxuzXAlWAmTLEMJkRQnxVQGU0NLqznOMJ0954FoR3Ro=;
        b=K3AZZMXbKStUlpEqnDA7Yiq3IrBAUw5pVtr5jVRsmGK4kEdHN/4REBaAbhTiuUc1cu
         hfUzFB8ky43XTmSxk1A8bCWtTdof58i29wVaFXQlUL7VZEFiVUfEIYBdPS1adFQxVza5
         keAyTpXut2Y5IKgJTatpz1m8PjW44DnpoQzdnb3gRvGuEaJh6lteHEEwHlNIs3LxrNVV
         L98zuBnVI+i4Lm+bKDRw8gO+Mm1deHKGSU4G1I2EpJgoxoOF0fZYPg38cc9ycnFD7peP
         Hzs7HkIu5oOsR23yh0f1Jm0datpauiY7TRD9jHu65ag5x0fwRvrdsjU/TcIiAgwuTTE2
         Jc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038047; x=1722642847;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxuzXAlWAmTLEMJkRQnxVQGU0NLqznOMJ0954FoR3Ro=;
        b=txkr0oQ+vSoxofm54HbXzRDMfenmpVi+CFR3Jm2mt6yFiWfQ0c/Je1NBQWBLm26IS1
         IyEr/VxDX6ismd3e/GJayiHB7i6U5r/7sgqAFhi2sYtPm6H31AxL6FMm2V0RsmNxeg5K
         n6IwC4lXJtH8wplnFO6Q32iXJ6mcy06VI/txus4niVR82hxoqeGeHXL63uJe67iY7MH4
         SmZcSTtNeN9bWJP3P2Bm6vEN4mHquaiJTcZkenkNVSudXo/stI8GQL1x/AQzG5tEwVAE
         vRZlNYKLT/DlT7qlBH6nD0pPGOIa7Kwrj5LtTL86Vw+WlJPtbUhrpNbD/IpajWpJUe4A
         DI4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJYy+illwP4H/AZIQ9UumQH42jAlkfnx3guRX89X9+zZ3LKHn1lUDiBDCynL45QNoA95uxsu/76n+cpFm202yDW8HFRn4AjkdfQkmTwrfd
X-Gm-Message-State: AOJu0Yykw9plrPMMmuDLdYhe+P5U+cyRxJsBa1hWI2ZiC8ir+ycK/zFO
	fU6THXZFzY1PAQfS0WNZOxSuZcBm7qvT7MJ0zWqoG4gExL7K8aYoXCNBk26iKuYWCKL+09ik4oO
	FTQ==
X-Google-Smtp-Source: AGHT+IHHkDF9jDFipyHQqfPDWUmaQYRR7lKWyDIChzQG4y5VknOXhGJqf1L9qSRAYqKwiuxxpki7u8BCvjE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:141f:0:b0:6e5:ef07:5922 with SMTP id
 41be03b00d2f7-7ac8d9d818bmr4158a12.1.1722038046008; Fri, 26 Jul 2024 16:54:06
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:52 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-44-seanjc@google.com>
Subject: [PATCH v12 43/84] KVM: Add kvm_faultin_pfn() to specifically service
 guest page faults
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
X-CRM114-CacheID: sfid-20240726_165408_256426_DF63BD62 
X-CRM114-Status: GOOD (  12.28  )
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

Add a new dedicated API, kvm_faultin_pfn(), for servicing guest page
faults, i.e. for getting pages/pfns that will be mapped into the guest via
an mmu_notifier-protected KVM MMU.  Keep struct kvm_follow_pfn buried in
internal code, as having __kvm_faultin_pfn() take "out" params is actually
cleaner for several architectures, e.g. it allows the caller to have its
own "page fault" structure without having to marshal data to/from
kvm_follow_pfn.

Long term, common KVM would ideally provide a kvm_page_fault structure, a
la x86's struct of the same name.  But all architectures need to be
converted to a common API before that can happen.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 11 +++++++++++
 virt/kvm/kvm_main.c      | 22 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ef0277b77375..e0548ae92659 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1217,6 +1217,17 @@ void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 
 kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn);
+kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
+			    unsigned int foll, bool *writable,
+			    struct page **refcounted_page);
+
+static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
+					bool write, bool *writable,
+					struct page **refcounted_page)
+{
+	return __kvm_faultin_pfn(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn,
+				 write ? FOLL_WRITE : 0, writable, refcounted_page);
+}
 
 kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ad84dab8c5dc..6dc448602751 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3134,6 +3134,28 @@ kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn)
 	return pfn;
 }
 
+kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
+			    unsigned int foll, bool *writable,
+			    struct page **refcounted_page)
+{
+	struct kvm_follow_pfn kfp = {
+		.slot = slot,
+		.gfn = gfn,
+		.flags = foll,
+		.map_writable = writable,
+		.refcounted_page = refcounted_page,
+	};
+
+	if (WARN_ON_ONCE(!writable || !refcounted_page))
+		return KVM_PFN_ERR_FAULT;
+
+	*writable = false;
+	*refcounted_page = NULL;
+
+	return kvm_follow_pfn(&kfp);
+}
+EXPORT_SYMBOL_GPL(__kvm_faultin_pfn);
+
 int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 		       struct page **pages, int nr_pages)
 {
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
