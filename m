Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5ACD24450
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 20:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPaz6imQoa1VkT+pK3kB9rJlmjGBgz55q5ibS634j14=; b=pCoqnHLZIoPtAj
	QVuGj88r0+NU5K8yOboIts1xh0Ew9A2eZJCwEH3DVCtSk67TvfzkQmenNASe5rbgxrMtbFz3VNzyi
	FzGk1fG8OE7UxoqCNf5g2nugzeQUP1hFpY6c+z5MPsoSIGCB62ZJ6ak9lUDks4OnpFS2owhXLY/wB
	e3KKAQdU7gyzh8//cdLb2iRa569OsOzd7Mm4zPsTYPmBd8dCDVY5mSjtBwchMjoXdjvKMKILcf6G2
	KISO1zlv/zYMDOsgJ2gb5nBToKmtExQGKFYRT5GoZ0UG2Wb7M1iNKs5U1V7WVkAVEq2kQJPphisTE
	hGgB7QedI72YOVz8bXIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzok-0000000EGnW-22j3;
	Thu, 10 Oct 2024 20:31:26 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxro-0000000Dqq0-01in
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:30 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-71e0228d71dso1225534b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584787; x=1729189587; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=uRLwC7za7TRhyOe/CfUzhvpHD8RlodmrAsAEh9/RrLY=;
        b=PKoD/wJAb5njzUtpsWhaiNM2r+OCsHfWtiV/apSkhgK99vTei83ZnneTKYniaGobtS
         J45i/TolbRzdp5c0H22Luy6Rs4kKlLJaRGcpt/l3Ev+zc3SHfJ9EHEt2Wsh5CiYgVmOL
         SGYSWmYIMPQNWdysyBr7Fl4AZNrhGBJq/a7zAXoeKDXdLH9srkAQl32RTPc6myO/6pT+
         +U1xZ7bie0Oj+11nv8QY/+JxDm6Kylusn84ikqXYk1Ql5f+RfVxJAVfljbZTD77+jbRg
         HvSzJHmdhjQLWIuP1P/nY+XLd0JF6+Ao5kyRK9GS8cjA6e6dQHUvz3M5OWWBXCiJa34T
         JjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584787; x=1729189587;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRLwC7za7TRhyOe/CfUzhvpHD8RlodmrAsAEh9/RrLY=;
        b=uWM+bqWBNbIyJwUhotCbdX1PCYMMOKgPUAe/qH+8gB8l9SH2I2kv8Ua6JVuHD6soh5
         td9I1i9TWyR7TpFGke2EtCHZ6QMoyyrdQIn6ilTOEfOVhLVIh9B4HsNd025C0HV/rTSK
         uKRlufQVartrl1+QvC5Kjgby/6d93iaMxEhfiATnF7jCclAYdx+axn3IcBOn2+N/Z+5k
         G4q2jumtaBt6x2twcg4cFKyenqb4WSsx1ha3AUkGrVFmqQz2l3CENdylHWhMQhCME+TV
         qlixBSp0nk9XL0kNUYeq/FThFtX1VogdGbPp8/rmVXU3JqF/PJBFzgIdBhNgOh+jO+A1
         D7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUrW7mPdbg/dclLL6pRsj+tv1pZFScU/436ByESqCANbl8ll5tNafphBA5fJE/P8cZXj+NlJZvZlF+kTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe7FuRM8PMhyFkGbGE3OeNzHzP8Ri9AMbITOSZ/jAfB5dOYcEU
	lvTC8OpYlS6uwOa3okVbHVuJBCqOC45STru/4irVQy0F/g6nrBkZt+FUxShuyD9ZwK3nPATv49h
	ZxQ==
X-Google-Smtp-Source: AGHT+IHljZntO7iRsDkdAW1llbbIMc26iesy/7PCA9rtG6130gQpp6naB/6JGeYrnZXaXdo41CPgD6F3FKs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:aa7:9184:0:b0:71d:f7c9:8cb3 with SMTP id
 d2e1a72fcca58-71e1dbf1ab5mr7795b3a.5.1728584785442; Thu, 10 Oct 2024 11:26:25
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:47 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-46-seanjc@google.com>
Subject: [PATCH v13 45/85] KVM: guest_memfd: Pass index, not gfn, to __kvm_gmem_get_pfn()
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
X-CRM114-CacheID: sfid-20241010_112628_103491_9E1FA2B7 
X-CRM114-Status: GOOD (  14.86  )
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

Refactor guest_memfd usage of __kvm_gmem_get_pfn() to pass the index into
the guest_memfd file instead of the gfn, i.e. resolve the index based on
the slot+gfn in the caller instead of in __kvm_gmem_get_pfn().  This will
allow kvm_gmem_get_pfn() to retrieve and return the specific "struct page",
which requires the index into the folio, without a redoing the index
calculation multiple times (which isn't costly, just hard to follow).

Opportunistically add a kvm_gmem_get_index() helper to make the copy+pasted
code easier to understand.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 8f079a61a56d..8a878e57c5d4 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -302,6 +302,11 @@ static inline struct file *kvm_gmem_get_file(struct kvm_memory_slot *slot)
 	return get_file_active(&slot->gmem.file);
 }
 
+static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
+{
+	return gfn - slot->base_gfn + slot->gmem.pgoff;
+}
+
 static struct file_operations kvm_gmem_fops = {
 	.open		= generic_file_open,
 	.release	= kvm_gmem_release,
@@ -551,12 +556,11 @@ void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 }
 
 /* Returns a locked folio on success.  */
-static struct folio *
-__kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
-		   gfn_t gfn, kvm_pfn_t *pfn, bool *is_prepared,
-		   int *max_order)
+static struct folio *__kvm_gmem_get_pfn(struct file *file,
+					struct kvm_memory_slot *slot,
+					pgoff_t index, kvm_pfn_t *pfn,
+					bool *is_prepared, int *max_order)
 {
-	pgoff_t index = gfn - slot->base_gfn + slot->gmem.pgoff;
 	struct kvm_gmem *gmem = file->private_data;
 	struct folio *folio;
 
@@ -592,6 +596,7 @@ __kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
 {
+	pgoff_t index = kvm_gmem_get_index(slot, gfn);
 	struct file *file = kvm_gmem_get_file(slot);
 	struct folio *folio;
 	bool is_prepared = false;
@@ -600,7 +605,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (!file)
 		return -EFAULT;
 
-	folio = __kvm_gmem_get_pfn(file, slot, gfn, pfn, &is_prepared, max_order);
+	folio = __kvm_gmem_get_pfn(file, slot, index, pfn, &is_prepared, max_order);
 	if (IS_ERR(folio)) {
 		r = PTR_ERR(folio);
 		goto out;
@@ -648,6 +653,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 	for (i = 0; i < npages; i += (1 << max_order)) {
 		struct folio *folio;
 		gfn_t gfn = start_gfn + i;
+		pgoff_t index = kvm_gmem_get_index(slot, gfn);
 		bool is_prepared = false;
 		kvm_pfn_t pfn;
 
@@ -656,7 +662,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 			break;
 		}
 
-		folio = __kvm_gmem_get_pfn(file, slot, gfn, &pfn, &is_prepared, &max_order);
+		folio = __kvm_gmem_get_pfn(file, slot, index, &pfn, &is_prepared, &max_order);
 		if (IS_ERR(folio)) {
 			ret = PTR_ERR(folio);
 			break;
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
