Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D45C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNcUiaB7dEsndtdXj4L1FL0t2gw2tx5g/nPEaUtsWuk=; b=AusOKKlpL9lKX0
	lbgo63uctob/NUkY3lOIjfKxWNKTL6BVU6KRCCxad9CXnKe/O2ehwLj+9Wrow4WHRzPi6vHORPGai
	y5VNGdCzl5iVruqz5e76q05e2RF6hM6E3meza8sw4CbCf4gMR5P5HzaqRTn6919Tick0I1uotgyur
	lVpYfqsBKEoUhtv3IrrWVFCK8jTOXY0+PX5McXkUvEzzWqKAMBWUhHph9w49GAyy3IoKnR4Mns0lq
	nESdTuOa8w5eRtCKj43FENdgzIMjsLpovvks6pxxSZoAICUqc+aTumRb0VW7ksnpZT4O9SrM4KH2Z
	wbIzKpKrKy0d57PP4JaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUxL-00000005XGj-0Q0i;
	Sat, 27 Jul 2024 00:06:39 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkt-00000005Q2b-0iYz
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:50 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e05e3938a37so395430276.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038026; x=1722642826; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TLCx2qDCvkD9gyhhD5S2JLlOeuoeLAn7xH7FruJz3kQ=;
        b=ViVkUxx3zfWX1yD6qzk5hPWzIEjkXj8anpcFGSg2HFKjPFXWLz28h5jJT+y9/W+XSq
         Mj1mgTdh1bOa8RPk001AHy0jep4nsL6sCKis+wtlc+BI5youohH3VEMS4UMccor+0bIO
         RxdaAMHAoD0lwMuhL9cKJuzj+CCtXFjttHgqCHqVQ63RE4jX3Y17mhEQX5ldahrN/Wf0
         W1F/xI/h2fR1P9Wa3MFNhJXK7qOK0hAjG89lVyjqf9SBoBy8TaHB8EuBUmL0vVZde6qu
         B4y1UG7EsYwM2labztv9XN+dXN5giJ9SyLySkrXHmTn4YBxkHms7mvskXKVIEsjXTlmC
         zzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038026; x=1722642826;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLCx2qDCvkD9gyhhD5S2JLlOeuoeLAn7xH7FruJz3kQ=;
        b=LciN33dKa2bqhXvqXvbp1TY2eDlDJxE9lGXa9sqgZf10Kw6Qj0fTJt6PTFW6djmdX+
         Mx/2oqHn3d+ydTFzx2iE4mX+tEstmjOK5cgR+hoVMoeeNstGt8bXlrhYTRsHnTLk3Tr1
         MsEV+1vEL1yasJE78g8gtZTBsC96iaS+vyN66XJhmvMtGYCV3xLg9ABICsWPDdpHp2PO
         vXPQNuBf41+LuqYAZkhkujjXTMpUp2LrdR8KPtbhmtEBk1wX7XwfaWX8fRNlcl1twYmI
         aR9L/txvGF3cRLF1UcKNgBSPayO47K0PWvkfzqojH+xRHQjtR+JW/QzE4+Zjd+sd6f/N
         /puQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyVDzpiS/mV05C4n799jAQsrqTC7TEErRdhcIKhrrQLItZC7OPYE9jo04IWbm8O/GNbG/wIqGyE4qO7NofCvzJ1MF8iZZTkMV3x5Owq3nY
X-Gm-Message-State: AOJu0YxsqUvoSIzFdr+PmfDa8hjodvIulga/M0ihFVzayV+aWB0y92h2
	xy7jpMSO11b4PRn72FH3HSO0OzRHGDHy3v5a7cQBkaqQa8dAZKGjfYgaPktLQQaHTIiK46WUyPa
	F5A==
X-Google-Smtp-Source: AGHT+IFuGqnDYAUSJ5FmVd85CGAsbS7YYsLTPQN/3Ul7QhkRMd8+dVyQHeeD8wiMpZyrbrthnX4Q+b9wtNM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1005:b0:e0b:f93:fe8c with SMTP id
 3f1490d57ef6-e0b5427fa67mr79832276.0.1722038025699; Fri, 26 Jul 2024 16:53:45
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:42 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-34-seanjc@google.com>
Subject: [PATCH v12 33/84] KVM: Disallow direct access (w/o mmu_notifier) to
 unpinned pfn by default
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
X-CRM114-CacheID: sfid-20240726_165347_392232_715335BF 
X-CRM114-Status: GOOD (  15.67  )
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

Add an off-by-default module param to control whether or not KVM is allowed
to map memory that isn't pinned, i.e. that KVM can't guarantee won't be
freed while it is mapped into KVM and/or the guest.  Don't remove the
functionality entirely, as there are use cases where mapping unpinned
memory is safe (as defined by the platform owner), e.g. when memory is
hidden from the kernel and managed by userspace, in which case userspace
is already fully trusted to not muck with guest memory mappings.

But for more typical setups, mapping unpinned memory is wildly unsafe, and
unnecessary.  The APIs are used exclusively by x86's nested virtualization
support, and there is no known (or sane) use case for mapping PFN-mapped
memory a KVM guest _and_ letting the guest use it for virtualization
structures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a28479629488..0b3c0bddaa07 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -94,6 +94,13 @@ unsigned int halt_poll_ns_shrink = 2;
 module_param(halt_poll_ns_shrink, uint, 0644);
 EXPORT_SYMBOL_GPL(halt_poll_ns_shrink);
 
+/*
+ * Allow direct access (from KVM or the CPU) without MMU notifier protection
+ * to unpinned pages.
+ */
+static bool allow_unsafe_mappings;
+module_param(allow_unsafe_mappings, bool, 0444);
+
 /*
  * Ordering of locks:
  *
@@ -2821,6 +2828,9 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
 	 * reference to such pages would cause KVM to prematurely free a page
 	 * it doesn't own (KVM gets and puts the one and only reference).
 	 * Don't allow those pages until the FIXME is resolved.
+	 *
+	 * Don't grab a reference for pins, callers that pin pages are required
+	 * to check refcounted_page, i.e. must not blindly release the pfn.
 	 */
 	if (pte) {
 		pfn = pte_pfn(*pte);
@@ -2942,6 +2952,14 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 	bool write_fault = kfp->flags & FOLL_WRITE;
 	int r;
 
+	/*
+	 * Remapped memory cannot be pinned in any meaningful sense.  Bail if
+	 * the caller wants to pin the page, i.e. access the page outside of
+	 * MMU notifier protection, and unsafe umappings are disallowed.
+	 */
+	if (kfp->pin && !allow_unsafe_mappings)
+		return -EINVAL;
+
 	r = follow_pte(vma, kfp->hva, &ptep, &ptl);
 	if (r) {
 		/*
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
