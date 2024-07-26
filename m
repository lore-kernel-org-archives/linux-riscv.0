Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E1AC3DA7F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAaaOhz3C9n+ZKAgu7jHY27xC3ctnfpDNSq3m/Sqvwc=; b=A7Ne855WR2pI9C
	tmw1rbcABNyYqQqPeAeDGn1q6xjT/KiNrl7p376/0y5EtgdGCOONSUVImzBSIw7Dd/MhI9+8lVjyi
	9ouat4fjUrlRwTkTHlCzSj+/qo4EPrMpZpNSae+8wtGx0G7TSxwpU3/gd1CJJGzkols23cs2OtSNe
	G6DmOEIcNoCWt9IbsnC6gfTk+6dgsVs3IpRcGTAN1ym00HWjotjQ28uyyIzofu+nvttEr5RrlQTNN
	0efvrW1Wtd1FfaRvFG8UMPHHGGdXLCUvFQZ6xYKorkvDyJMBFKty2Y7OpBDSTHVEMTgOj9r4VvxZ6
	F2Vup3hjeiMGammZIV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUxN-00000005XIP-1WFP;
	Sat, 27 Jul 2024 00:06:41 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUku-00000005Q4N-3krc
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:51 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fee7c9e4a4so10496695ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038028; x=1722642828; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=f0UOaTihDpRJ7PP+Ej2doGcOk+AHWo0BkuOsHzozLVI=;
        b=euoXExK9GWAFuMpIdFQ7q8HBipFFrXmajA3RSJ0IUws9NyIaLOSByOXhNl74zIRdvE
         VSE/px8NDztYc0LeivyQjS8KKxIEKYMjKDpgGXeCdKensDYIUXnwhS3EoCWtoTrs8Ukr
         yXI+wZ2PSQMVVgDD3HhXLkin7p13ft0zh6hWSGOVbkj6N1yQOP/h8LSIy11Hm69GTpp3
         izYwkBJu2zF+H98+30h/NBmgLub4s4DLNPQso4Acl47SqXicQnUNZV0HSzCxp4jGzHn3
         3q1GfmGJ/S/s8x3l8rpP4cQ5LKwGpy+gL0QZscNe3m3L2tHcSGLf7/7FtKrWLxSwo4GE
         VmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038028; x=1722642828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0UOaTihDpRJ7PP+Ej2doGcOk+AHWo0BkuOsHzozLVI=;
        b=cPJw9MMg/C6XkhlpxDC4mEb02stA/GxIvY6uHQkDmcyA9aBsYpZmhetWq3lMb+lNQR
         kFQES3s/sLQguFQC1fQpiiqOGBWs78Q1kFQkDLiS8CvKe+rdFZOOUcj6O8sBFE/3z1Pk
         ieprqJfyq53zMpVZqmtoDJZoqVUVStvaemgpMwbNUG/gbSXCuXp9RnTCxMZh9qXhCyMu
         VKOdTboojuszW/mkbn7x9y24Ax76AUljceRcA9OXxBMfRQnk7hh1QcmvjVkhhcwVA7Ea
         5L14poSutaVe51+7KiX7gdpvTz4O7trwTOhMu8+0G+VEDnjpTXry/rV6X9K73O3bpWe1
         GFSA==
X-Forwarded-Encrypted: i=1; AJvYcCWIYo3gUhe3VcCX8gtFnC/IKB9JgGpPm7H3bMVvsN1e3ewVB04B2Fa6z8tEbJV4mza1ESOG18T1Tm94iA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzym4gQlXz4ZuaK1zocFJOYhJM1DIdy3v60xnM60g3It59Q84LF
	3dqgNt5d9zIjJDY/uzAYBSPO9IbiCJwuDEawcdqTBDAISUS00CHi3DlFG2XnM3AKgdGYLQf1bLb
	bmA==
X-Google-Smtp-Source: AGHT+IGYUMRc1uUxr912DKcgHH4gUUnvf0wLEKnF8dkY5ruUFOJLgoqFTBS1LD3evC3JUrfTD0ZWGbhz678=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:cecd:b0:1fd:6529:7443 with SMTP id
 d9443c01a7336-1ff0486a65amr545105ad.11.1722038027663; Fri, 26 Jul 2024
 16:53:47 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:43 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-35-seanjc@google.com>
Subject: [PATCH v12 34/84] KVM: Add a helper to lookup a pfn without grabbing
 a reference
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
X-CRM114-CacheID: sfid-20240726_165349_094140_489D4E01 
X-CRM114-Status: GOOD (  11.82  )
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

Add a kvm_follow_pfn() wrapper, kvm_lookup_pfn(), to allow looking up a
gfn=>pfn mapping without the caller getting a reference to any underlying
page.  The API will be used in flows that want to know if a gfn points at
a valid pfn, but don't actually need to do anything with the pfn.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 82ca0971c156..5a572cef4adc 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1212,6 +1212,8 @@ static inline void kvm_release_page_unused(struct page *page)
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 
+kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn);
+
 kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 0b3c0bddaa07..ad84dab8c5dc 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3118,6 +3118,22 @@ kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn);
 
+kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn)
+{
+	struct page *refcounted_page = NULL;
+	struct kvm_follow_pfn kfp = {
+		.slot = gfn_to_memslot(kvm, gfn),
+		.gfn = gfn,
+		.flags = FOLL_WRITE,
+		.refcounted_page = &refcounted_page,
+	};
+	kvm_pfn_t pfn;
+
+	pfn = kvm_follow_pfn(&kfp);
+	kvm_release_page_unused(refcounted_page);
+	return pfn;
+}
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
