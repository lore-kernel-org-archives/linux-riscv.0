Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412E1C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbwV20cGRl1C0RpEpmBFZbtHyua/VXwjWytZJoXHTTw=; b=hrvyj/YwE9crKE
	ImMACTGC3DG5CGlz+wrWCwnABtgtzr4bJbU8fJ3Zrf2ou2bc3mk4jXa7lM/t9XN6vselc1Mnchubn
	6Lvf9m5WOv3Ache5ol5eY7UQVmWUtUoF/o9MvRB5pyO58BUJ8yGiXjbZLU7gvFilRhvOTtfStlEcT
	je1yjK4r9TmbbSfXqyJsZOBBgWhmkgiFC8eeOhZu0B5Uas0UV7/0glJi1G8HphBZSsp49XWicVFtf
	XZy00clKGN/0fGAR6Rsq2yiUCndNunUY0cSkEb4k0f7nAdj5uuRuHG4ig8SSXKIYwC79sDCAPHm5L
	CN5tLBw3pkBbwc6qtZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUrl-00000005UOM-260k;
	Sat, 27 Jul 2024 00:00:53 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkP-00000005PcQ-0Zjk
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:19 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7a28f78c67aso1346208a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037996; x=1722642796; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=oqsp5dWmLf1ceGtEyEpwn2+TSiYr9kgkgYyCIEXijOU=;
        b=WU1l/bGUgOlXergvUUEZAmStGB6e2lkbKY6g92ISVXZNY42sPSvTXwyx4umZVR8Y5v
         cdUylVL646oU9Igaur6rLaAq+m+GjE3yC0Yndyoif6kELo/pbSHKQBBfE9fMRmNeyzpN
         2KZqn9K9lJrLjKDT8UKj9hEHZwih+bPlJAaF0VM+5J+p9R+s9kMswvBsVKQY+oni2/Eh
         fV0P91Corujow+DoDd7B82IT0/FlkYHfcUHmGji4+X//an9dQmlz5VM32+N7NrVOYMYB
         TVyZqNP50eEFVj7FNpwUg65FLJWOnTk2U4rKlABQmnwRVmSCebEzlM1kJbtiSGrQLfOM
         ONAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037996; x=1722642796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqsp5dWmLf1ceGtEyEpwn2+TSiYr9kgkgYyCIEXijOU=;
        b=HapuWHzj5OICZ7gY3yC4vP1ksDdXyIWw+NI4rkDKcldrjDbyEQwAX03xZ1Q5MaaLW0
         ciPR/WhepQ5Hotm4nYbadisDnjXnqo3k3zceHpMZ2uKmNpPDONt79la3rLEXTD93LF1V
         olVOlh9sJq36pCDAmp05TpRbErEdpDD8gPIIt74RdWEFuCBjM3L6J55i9ufWbYj6q1uO
         IPQjmqk7+o25J0ql+QIaVbUQhQnQ/ChCynh4eZPhwxJAD5tMfcE9LPp0OYyMGhi8zphq
         b2slj0MYgEs8x17UkwwzlWdHbjNgSYJsK4VpzWevs/ovfb5yuoeYsH7fQau46CzCXqO/
         RyNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqTOqlDjoocNVSYkPOV0M64NklPwg/5ig/uVxUNIpEn326ef5csibpIBkKwSxb8jILHKPycIQyiHKQ+GM6mudDFjnQiT8UKzVbqFshYJCI
X-Gm-Message-State: AOJu0Yxm/sNXijoJLXvkAdbZ7NBEL8IOzgcgoG3Ls/gM1+JcFIbGYpSG
	Uf7osbHOMQn08p2hEPUyA4dx3uZ6ok/inHjTyHjl53OAwYOT9CovUuY7xHfs5xvGraL6ktXSV9B
	uKQ==
X-Google-Smtp-Source: AGHT+IGPnVvSSR8GC4je1DUQj4K0eIO0wDIdrfABFjI4ae5Nt/lU6oCOfX0avnzwArksU/NKeR8FWd7ZKxM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:5a9:b0:6be:8aa5:bffb with SMTP id
 41be03b00d2f7-7ac8e0bb8cdmr3560a12.4.1722037995764; Fri, 26 Jul 2024 16:53:15
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:28 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-20-seanjc@google.com>
Subject: [PATCH v12 19/84] KVM: Explicitly initialize all fields at the start
 of kvm_vcpu_map()
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
X-CRM114-CacheID: sfid-20240726_165317_482806_D51071FA 
X-CRM114-Status: GOOD (  11.07  )
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

Explicitly initialize the entire kvm_host_map structure when mapping a
pfn, as some callers declare their struct on the stack, i.e. don't
zero-initialize the struct, which makes the map->hva in kvm_vcpu_unmap()
*very* suspect.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 21ff0f4fa02c..67a50b87bb87 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3088,32 +3088,24 @@ void kvm_release_pfn(kvm_pfn_t pfn, bool dirty)
 
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 {
-	kvm_pfn_t pfn;
-	void *hva = NULL;
-	struct page *page = KVM_UNMAPPED_PAGE;
-
-	pfn = gfn_to_pfn(vcpu->kvm, gfn);
-	if (is_error_noslot_pfn(pfn))
-		return -EINVAL;
-
-	if (pfn_valid(pfn)) {
-		page = pfn_to_page(pfn);
-		hva = kmap(page);
-#ifdef CONFIG_HAS_IOMEM
-	} else {
-		hva = memremap(pfn_to_hpa(pfn), PAGE_SIZE, MEMREMAP_WB);
-#endif
-	}
-
-	if (!hva)
-		return -EFAULT;
-
-	map->page = page;
-	map->hva = hva;
-	map->pfn = pfn;
+	map->page = KVM_UNMAPPED_PAGE;
+	map->hva = NULL;
 	map->gfn = gfn;
 
-	return 0;
+	map->pfn = gfn_to_pfn(vcpu->kvm, gfn);
+	if (is_error_noslot_pfn(map->pfn))
+		return -EINVAL;
+
+	if (pfn_valid(map->pfn)) {
+		map->page = pfn_to_page(map->pfn);
+		map->hva = kmap(map->page);
+#ifdef CONFIG_HAS_IOMEM
+	} else {
+		map->hva = memremap(pfn_to_hpa(map->pfn), PAGE_SIZE, MEMREMAP_WB);
+#endif
+	}
+
+	return map->hva ? 0 : -EFAULT;
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_map);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
