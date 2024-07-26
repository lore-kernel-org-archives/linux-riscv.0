Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91FCC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkyfQ4BObELT8Vhr5bBa6CahtSRy5rAS+FdGGWqCe1E=; b=M+cwzpZWs9YLJG
	oko5F5i8sOn1iagWFo4x29fzgxiFgYjV8q635aLZnkqdUIVtMMM1Wg9PdHGk6jVXboOcoSa7GA1JL
	1He1bwpWoonkICZmMBxgXhF3b+vtHAaL9O75zJ5kUkF+z9E9TATU0gXATy1m0ETu/KYgHO875o8pg
	S16UIu7DxZsPXkE2p18zWyEtuFO3x5HhI56njJpGX88OqiS+v8/Wk6dQKgKSj+fsPvzJNrkJHTV1c
	BPGM75nSoY50R6AQrFWIq9LR7saOc0nk9I+De+Eyj0XQKu/3llvBKu6fR/8IP8igLYNcfAT5XvMMf
	hFhX3URh1eJWXC5Pl0yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUva-00000005WLW-0a95;
	Sat, 27 Jul 2024 00:04:50 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUki-00000005Ptk-3BOy
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:40 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc5651e888so10451435ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038016; x=1722642816; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cQ8Ke99Gz78IcD45RWrPNlFRmlyo3xxXp4XhOasYhk0=;
        b=pf/JNHBi2Jz/rx4qLf7VFjisoAs9HqzHYLIRBuDqTIYBwVtVxLE4+QTZuQDahHpKn7
         cftFOdz16favzPJOeJrSAYrPYdma0RSo+tngtSw1ONlNo1EHmhAL/eWLPDz+ISgsbyI8
         l9wyixbXkVlusbRR/kX3IA9/XUr+6/t6NoOD0di7thFyUDtzzM2j4qhoG5WXqhA5GL/h
         KmM5nOOuvke4KTyIXdH1AXiRATwrF2mbVP0ZR32MYlhyFB0QoaXkI0LFd44rHgzVn+aL
         nnMJ1THDEtCYWNHddAj9E1hYdR9FFhC2gnO92YdpWiCmCu0qllUE+1kyjLzulzONYjYK
         vsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038016; x=1722642816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQ8Ke99Gz78IcD45RWrPNlFRmlyo3xxXp4XhOasYhk0=;
        b=rRCwgKbGUMdxrGDtbLvWQuuIJsDrGhW/db6eb6YwGAsZERGWG3Y8Jqj6hIf0hYaa+i
         7ZVn0VN2UaKuTXSckiwfDRSDq9OaQwSa0v85Jqfn+Cu5IAcFzWiWoKcuCCGEOq0swZ29
         Vkcpuhm+CboP4+n4H0pYEaT9TbWsbMZb5xv0hHKmGYnwdP14LEXwDPxnIxDrXuJTwAoH
         EfgjcaohBlc8/mavLswAO7EqYEAthSzIErxB+jPZfivN2PXA6JpJ9THLACDuvF3B/NDB
         JNnpLQM6Fm77BVW3n/S5seS583PcGCflUxhqcw5rbJ5OeSH59ylvAVYvNbTeD1KV3p/1
         FK3g==
X-Forwarded-Encrypted: i=1; AJvYcCVKF7gWK14qhsou1cR8h9gfxkX/RepwSoOgaaDCx2Wgn6CWfrnN9dO8RwyTUekxwu5Qz6wpBYmrMkvxpqwwOkE0E1XN/+Vv3a5QEEvs7hTz
X-Gm-Message-State: AOJu0YyQVbmDzjfVCK89/cQ6lD/L81eZtELIUxQsUlfvEEz1qRC6Sekb
	EW5kSkU6AQkTxg1t2poWlHst8l5ShKYHQ9Q2Hv+ML+AKuG3fp5IiWE1vBRloGox3d9Vtr5I9t3/
	53A==
X-Google-Smtp-Source: AGHT+IEYmoKPicLFNTjAfXc3rW7QIOSCWQtpI+t2ZFjfSCVkTMXBL3j4sNtxlzg5xGSYJWPU8sNID0rjz8Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d481:b0:1fb:5f82:6a61 with SMTP id
 d9443c01a7336-1ff047b8ea6mr1156745ad.5.1722038015496; Fri, 26 Jul 2024
 16:53:35 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:37 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-29-seanjc@google.com>
Subject: [PATCH v12 28/84] KVM: Migrate kvm_vcpu_map() to kvm_follow_pfn()
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
X-CRM114-CacheID: sfid-20240726_165337_175102_2F4AB1CF 
X-CRM114-Status: GOOD (  15.63  )
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

From: David Stevens <stevensd@chromium.org>

Migrate kvm_vcpu_map() to kvm_follow_pfn(), and have it track whether or
not the map holds a refcounted struct page.  Precisely tracking struct
page references will eventually allow removing kvm_pfn_to_refcounted_page()
and its various wrappers.

Signed-off-by: David Stevens <stevensd@chromium.org>
[sean: use a pointer instead of a boolean]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  2 +-
 virt/kvm/kvm_main.c      | 26 ++++++++++++++++----------
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index a5dcb72bab00..8b5ac3305b05 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -280,6 +280,7 @@ struct kvm_host_map {
 	 * can be used as guest memory but they are not managed by host
 	 * kernel).
 	 */
+	struct page *refcounted_page;
 	struct page *page;
 	void *hva;
 	kvm_pfn_t pfn;
@@ -1223,7 +1224,6 @@ void kvm_release_pfn_dirty(kvm_pfn_t pfn);
 void kvm_set_pfn_dirty(kvm_pfn_t pfn);
 void kvm_set_pfn_accessed(kvm_pfn_t pfn);
 
-void kvm_release_pfn(kvm_pfn_t pfn, bool dirty);
 int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset,
 			int len);
 int kvm_read_guest(struct kvm *kvm, gpa_t gpa, void *data, unsigned long len);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 48b626f1b5f3..255cbed83b40 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3113,21 +3113,21 @@ struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
 }
 EXPORT_SYMBOL_GPL(gfn_to_page);
 
-void kvm_release_pfn(kvm_pfn_t pfn, bool dirty)
-{
-	if (dirty)
-		kvm_release_pfn_dirty(pfn);
-	else
-		kvm_release_pfn_clean(pfn);
-}
-
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 {
+	struct kvm_follow_pfn kfp = {
+		.slot = gfn_to_memslot(vcpu->kvm, gfn),
+		.gfn = gfn,
+		.flags = FOLL_WRITE,
+		.refcounted_page = &map->refcounted_page,
+	};
+
+	map->refcounted_page = NULL;
 	map->page = NULL;
 	map->hva = NULL;
 	map->gfn = gfn;
 
-	map->pfn = gfn_to_pfn(vcpu->kvm, gfn);
+	map->pfn = kvm_follow_pfn(&kfp);
 	if (is_error_noslot_pfn(map->pfn))
 		return -EINVAL;
 
@@ -3159,10 +3159,16 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool dirty)
 	if (dirty)
 		kvm_vcpu_mark_page_dirty(vcpu, map->gfn);
 
-	kvm_release_pfn(map->pfn, dirty);
+	if (map->refcounted_page) {
+		if (dirty)
+			kvm_release_page_dirty(map->refcounted_page);
+		else
+			kvm_release_page_clean(map->refcounted_page);
+	}
 
 	map->hva = NULL;
 	map->page = NULL;
+	map->refcounted_page = NULL;
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
