Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32038EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1shTyObVAHxuSjwsAPqNNhFVs0apnhjlLpqkIg6sbBY=; b=XFni0tH6I2uevm
	F9u+3/dRKHL5cmINgetmwO7N04XlFGV/7ALpGhkui/EhW2QI9Mcmtk9asOjFcKPECS3iH0/xyOPX2
	ZgCfb3thYvGLuqAz0q3sybK087U4YGuqGJlfKll8NmahqzTeOwr9R3P+3PxtlBNkwZnmZM52RHlfo
	x3jsrdEBCRO/yuxioo57GFu4wzDACyqf95+dZLhA3hrkqRg0L4zh93CBDdZAM32RyWQ9XWP3VDQuC
	L/rk20VQtZcFpthPx9R+1vBQ4e8pcN9kITooWZnFVFtS8J6aV3LhZTQ0HaM+tYT4KZIHoE5+UwaIc
	izMR3GhQ+r1nyel98LOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzdA-005F7R-2h;
	Wed, 19 Jul 2023 05:21:44 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzbg-005Dg5-19
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jNVa/iQ+AVctjdypzscw/wZ/omqP7xdpmmirAsZhWLw=; b=fthdUitazrHnRnX2+PSyVxTPBO
	CG6IZyiAMSGjBTOxwBxiHqQmgl/C5XjOe2PeTYRgSj1jZ0KvvsAxyRa7aOlnRN47FPMhZ16Wed+ip
	RX5pzPMxAKWNSIjBh98wDvNCY4mi0/hzrpnov2PyRBFhFsDe9910Gj1JWDQ7hw7bVLk/S+z1sIHfs
	KJIajg7/bvSfbfJ9GJMkgo9/UIAD2Wnvs8UzF8rZqZAAdcCfNErQjXes60iykRLDhhSXIYcZnBcSq
	cU+EcFa2j99Wdn3PX094kerM+nmrz3kVxmZ7oKwKfVEDVD4KMffZheePseVXO3Lc6EkpbobrQ6YLs
	0oDmGmIw==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qLuSH-005QoA-08
	for linux-riscv@lists.infradead.org; Tue, 18 Jul 2023 23:50:11 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1b9de7951easo32356765ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724146; x=1692316146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jNVa/iQ+AVctjdypzscw/wZ/omqP7xdpmmirAsZhWLw=;
        b=S9i20yQ7jB4hVddDMJ4CkO5T1TWmd4hfWWkq8Xl9LowlAEQdj2ZBN4AmHJWPyNUeoT
         CkrrWKNwK4ZqQLVQM2y6BQWzimiT4YCPNLG/XY2OgxS9elbM94AeEwd6oVkZtS5CMdNQ
         enYmJItt+taFRfJF03P5U3tsXYvhEykGsai5MRAd/rpILORWE8Nwwq/35e1lrZlSdKCf
         nnux/I5fy00kI9O4nAFwoaKQfkECwHaMBer7UN6aWCOBJCp2NOyFIamjX8g6Muuevcj+
         zN2G8rzvgNhVTfZL/D1gpgeoLq9Z9aveGPtzRcTPzuDzimSMVNdowxyXn99BRYpLpXYL
         a5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724146; x=1692316146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNVa/iQ+AVctjdypzscw/wZ/omqP7xdpmmirAsZhWLw=;
        b=XJ6za94IuLdfWBzUl5rM76aXHzPSis2JO1nu32p6X9Im9sYFeEmETd9RboCEPjoz+R
         zVctynR4zMGHB7v2hoLVhqfHlWx6J395y9jlOZMBUS9AjSafVJR6AOvyOmlweeN+UajE
         xZlPDJGifxAretLBXGt/hhQt6ANNekjUYxcd/VuAGBwwpkwSdrRks3tIe+4+Euns+BFN
         b1diQeN3g3bl1PwwY15DJcCviibNtahQ/BvfDK2cEqUhLjUxw3qyjL3idwCcGfcikmyj
         oeQxYTp8H6GYi6eNDNZXQLdaQ/qn/ivzsq9xAeChnc1cgr7TJuEnSN50Ck1nEULYtdMz
         FxAA==
X-Gm-Message-State: ABy/qLavePkiqJUYu5MVtQBwAP2oTBIyV82jBrucbkJvLkGDls2DXcX2
	uCSfAmj3NnlArsvLesGVkfYfT6dGd1g=
X-Google-Smtp-Source: APBJJlG/sMr3G/sYhFjIAPMZFMzUGPYNnqDIC48VMqcoxoy+9ZQXw2cmdVjFEV6r5k/FZaKWiRT4xFOW180=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d503:b0:1b8:8c7:31e6 with SMTP id
 b3-20020a170902d50300b001b808c731e6mr17710plg.1.1689724146247; Tue, 18 Jul
 2023 16:49:06 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:45:01 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-19-seanjc@google.com>
Subject: [RFC PATCH v11 18/29] KVM: selftests: Drop unused kvm_userspace_memory_region_find()
 helper
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_005009_040105_AB522BA0 
X-CRM114-Status: UNSURE (   6.83  )
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

Drop kvm_userspace_memory_region_find(), it's unused and a terrible API
(probably why it's unused).  If anything outside of kvm_util.c needs to
get at the memslot, userspace_mem_region_find() can be exposed to give
others full access to all memory region/slot information.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     |  4 ---
 tools/testing/selftests/kvm/lib/kvm_util.c    | 29 -------------------
 2 files changed, 33 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 07732a157ccd..6aeb008dd668 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -753,10 +753,6 @@ vm_adjust_num_guest_pages(enum vm_guest_mode mode, unsigned int num_guest_pages)
 	return n;
 }
 
-struct kvm_userspace_memory_region *
-kvm_userspace_memory_region_find(struct kvm_vm *vm, uint64_t start,
-				 uint64_t end);
-
 #define sync_global_to_guest(vm, g) ({				\
 	typeof(g) *_p = addr_gva2hva(vm, (vm_vaddr_t)&(g));	\
 	memcpy(_p, &(g), sizeof(g));				\
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9741a7ff6380..45d21e052db0 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -586,35 +586,6 @@ userspace_mem_region_find(struct kvm_vm *vm, uint64_t start, uint64_t end)
 	return NULL;
 }
 
-/*
- * KVM Userspace Memory Region Find
- *
- * Input Args:
- *   vm - Virtual Machine
- *   start - Starting VM physical address
- *   end - Ending VM physical address, inclusive.
- *
- * Output Args: None
- *
- * Return:
- *   Pointer to overlapping region, NULL if no such region.
- *
- * Public interface to userspace_mem_region_find. Allows tests to look up
- * the memslot datastructure for a given range of guest physical memory.
- */
-struct kvm_userspace_memory_region *
-kvm_userspace_memory_region_find(struct kvm_vm *vm, uint64_t start,
-				 uint64_t end)
-{
-	struct userspace_mem_region *region;
-
-	region = userspace_mem_region_find(vm, start, end);
-	if (!region)
-		return NULL;
-
-	return &region->region;
-}
-
 __weak void vcpu_arch_free(struct kvm_vcpu *vcpu)
 {
 
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
