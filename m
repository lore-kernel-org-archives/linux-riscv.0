Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E987CC25B70
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 18:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCQUe7ClZ27c90n09h5U9cKiGYgfzky+IXCNbSff2bM=; b=N2NXoRMEVjUM3I
	nE5HW/PWAK3B+aTXZehlp5CDpCGuRyjpF5cjSkK+VOLkff3vOd6nTgxeYmCQHf3su9balXmZ5mVM3
	7ipFvm7TSEW3QWa9299XAHlEdiRc6nwb+X7/3GaBCnEW2PrASU38/501cGCNngJcSbZ8Xs0UujeNV
	RTj9g8jkHb2484qSTrcwH4fjehw3nwBOZtaHmmq2LbQ/eAn15hKn7qQbTMQZ5ADcILNz/tJvjEXPB
	+0qk3MdT2rRr5XLPIX9+4BGWmrB4YOcNF9YDBe+075eMyiOVTzLqLBWWH8z0eFd0c8+SqpmhV7f84
	3j9OXIbUp65OFOzgGj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRWY-00GzJ1-2X;
	Fri, 27 Oct 2023 18:25:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUM-00GxYb-2t
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:23:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+S4AiipPfUUKpJ2ruaZ4ElxK7cYS7w8+XYANZ6GAwNM=; b=DdNbdgMspCg6aXrEUU6bBsI1Eu
	kpYzpH0CgOs9ALdw8VUi6qDBSpLvEXmyw/iCIZoBpjIdIUsGnXYnrfeFRt1/IlU99ChgxZeYEYfUB
	GvaAXIiUtPXVQiKdVF3zjSUHlFFhhIad8iHreN2FFTku7ngqtUtz9tGlH6Dsai746mlenlCPZ2DHS
	2Z3dE9LVmO/SemsVdmGJMLBRnDsMGT1Y64Md5SYsuQxaGJU+YL2qqOnWIovogx3B5StANGEALZLhc
	ozVno8avcqnDFWlGQkpunAUud9MsoaxewrTqnb0C+R9FAZFjnK01Nl/BKtIYuv1FzeC9KDP6gYkc+
	WVtJBktQ==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qwRUJ-004t8K-PZ
	for linux-riscv@lists.infradead.org; Fri, 27 Oct 2023 18:23:17 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1cc252cbde2so6362845ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430993; x=1699035793; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+S4AiipPfUUKpJ2ruaZ4ElxK7cYS7w8+XYANZ6GAwNM=;
        b=EUc7gYj2gfWg1rfvOcVrYaoXdlw4TxSj4F63QBpZFPEq7zehBQOTgp3UjKGXDKsCg4
         PesaYCAqvPSRz2NhMO+UE0rZyf8kyWK1I+QA3DmubAKC13uRokw1+oxSu74Foj0WD485
         HD9oBhUxDKtHQKR5UD1Ru+Nmo00976e3IaE25mu8dfn90w6UEeJPFbF65YRl5RwqFliH
         3dgDPeGZbXkZ3Ao3DvhbY5gzEfUqzNJj57fmeT8EEH07PmBmF9zx34yxMsSW5U6U8bzr
         vQevSy2VD1HQ2H9gThlcmQlzHlgyUvj08zSPHkV3vmaObXUyfu7ZJfaQKB8Ib8BdkHx/
         g0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430993; x=1699035793;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+S4AiipPfUUKpJ2ruaZ4ElxK7cYS7w8+XYANZ6GAwNM=;
        b=ft+CL3qLnlfUhZ+kob98yHwEJpAO9Fj4s9vaXR9wPyikyp3glRwnojPK7i3irbIYZ5
         4ejbl0byATq8OVTfQRMni1E9NHbPUbDMk2c2GNo9Z7qAzo6ERD17ASWHV9Xlo7RDajQ5
         hjhSV1bFpoL7PBa45/TiGimaQBccqYuTIFnGGZrI+nJw+D9zqEK50G/s/fvFTHNLwORl
         5lwiZf5+3FUzbNMOipHbtKb2wCpDDKKPoo2cL7WJH7dn2DOn4llrdmb9vbNmyv5ZC/iv
         fgisC9R6h/M5IGpJZ8KsOEzX80COqCcmAIah4OIISIQ04D+VLTGBsCAFx3o/8g97wmgf
         UYhg==
X-Gm-Message-State: AOJu0Yz2WLfyuXf+VbEAbA0fOAJbj8ZdW9v7MM6kwdpgPRneU0Q4S/FM
	Gr5ZpKeudkV2zQ60GZAhOEdDTQDbumo=
X-Google-Smtp-Source: AGHT+IEqIkKuv5DX25uHuP2fYVc0fUSbsifhQGdV1yLQ889bX1DKci/qdjsCIFlDcD5dVWlFtax8M8nrsME=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:4296:b0:1c9:e3ea:750d with SMTP id
 ju22-20020a170903429600b001c9e3ea750dmr58852plb.11.1698430993223; Fri, 27 Oct
 2023 11:23:13 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:22:06 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-25-seanjc@google.com>
Subject: [PATCH v13 24/35] KVM: selftests: Drop unused kvm_userspace_memory_region_find()
 helper
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_192315_836835_D5DF3712 
X-CRM114-Status: UNSURE (   7.19  )
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
index a18db6a7b3cf..967eaaeacd75 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -776,10 +776,6 @@ vm_adjust_num_guest_pages(enum vm_guest_mode mode, unsigned int num_guest_pages)
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
index 7a8af1821f5d..f09295d56c23 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -590,35 +590,6 @@ userspace_mem_region_find(struct kvm_vm *vm, uint64_t start, uint64_t end)
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
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
