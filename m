Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66814C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6F7J2jQuklGt6pf5S8H/BCFvjGpGiv0A+Z3RVTIxnP0=; b=07XboFwxTVA22R
	lFpyHbTnErOljx/Z04Q7UEEg3g02Fn0WoLbZPc0qbgDtlavRAgx+NHtuSCrz/OvuUSZwLJFd8j8SY
	xuXEIRi4Yr+wmPmVKqzgD6WGScM2V+I0z5FOgs6ajmExOAKzCwGl2rvWPVnOp2rHYmuBzjlDOLsaG
	ubCgpeYOK/uQqP0R9EfmCAuqx7H1X7dogF9RATRjvSjgRywU+qcc86wYD0T5Or0jLL2c00bqlqiMU
	MA+bo1qEkbI7EZN4bsY8XunY85VvzHCN2gPxEuHUi8Eult+o5szDBBM7ymcBFxpAKvJgEzQ8xAVr1
	ZWUvDiyl5bBHe5bdE3og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQw-006Wzh-00;
	Wed, 19 Apr 2023 22:37:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQo-006WXV-0W
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 22:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qOzd/WhvlpjJ956p72hZNImrff40bav5pGpgVf1jDCE=; b=QeyTykNf4sc+5fpBcoYaTa6P+R
	y6MlgO3KH/Qhb5EXhYArTT6lOV2f3e8VrIU1u81L4XTDygBMaZwOgDZeQC53GpxfUqGMZVyEkpOKX
	OEOsyD1Wq8JReNbr3HpM628s1M3GhuJhPm1qD5LxBQRgtbcZtDY/PJIZ0xdaR/ns99r78QPcN5uQQ
	3FMqpAnBXiMHo/MXuvTKFij7jDkDu+VTThHfKfUaXigGHQvJKshxjn2t9jcNoPnHwKRY1e/yur18H
	GLWLcktfmLz2gPUwl2cKCb6/nI2N6RZIGhkflXQFFy3i15UWg0cJMo/j/rpMdR/wRGLA+gDTGno49
	+gjTxAbQ==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ppG7e-00De7n-Mv
	for linux-riscv@lists.infradead.org; Wed, 19 Apr 2023 22:18:05 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1a682eee3baso4401165ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942672; x=1684534672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOzd/WhvlpjJ956p72hZNImrff40bav5pGpgVf1jDCE=;
        b=nK5/1WGSlykOrMrz6zLE7ByOwHsNX7ku+LU2VBvTADuPSy3LTEvEYN/5idyeMAH9v6
         lDrCh9vx2uQPGrR2xDDmRNujTPNDyyzCxzk4mY1KxzUuZQGhhSyvWuaw1bMwsQMloPyl
         7AP1+xv6gUZEztUQTM1GZJONZkurrJQmSw8oo0Vlacs0NCnY8W0HIEeaXUNTT9FXPkDs
         BnQUvSJIxGIi32I9gl3+IkxfURT26aMcR2YDE4SZvKgasSWBzWeQlJS8HIQa8AHGBoBy
         oAuh9qhu2Ya7h80HYOyhHTVyAo19NM+J4mD7HNvy+vl3b7n5pBV/07agfGWnPCRxQI9a
         znow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942672; x=1684534672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOzd/WhvlpjJ956p72hZNImrff40bav5pGpgVf1jDCE=;
        b=hktU/E1u9Gki/thp+uyp+s7z6ZwnHfL3TxzEOX2kZhLjqflq5KGda+Afo34NuWZsdm
         e09A6/uDFf08Dgy6UATSKsz886o/UTQnnFiVsAkVXmA4sK0MkirtQNy6VYs5sIDJUrD1
         ozkEYpZDY2BqNsoVSk5Zw+hDwPGE4EPMTChFUQJ/UOtrFPRXjFjCN9vr69AYCvG9LhSY
         mlta2bzIk2xT0LqgqGV/jnt86vRNANsBFq2A+KHqjgwNGNBdhZPqahtmYa+Vpj9TRXOO
         Bgg9yTFUdazhS4eukiywsC/FtcIpISGATq1v10/Z0Z/ozsDqYzUInjma05ufU/kkDf6v
         T/5A==
X-Gm-Message-State: AAQBX9ddJkgI3kYFP4pJH2BieKVRe6rf1/zxDez1/bFp28w3tacb7Zh0
	2ZT6AUhv/h+4Lh4bvRkSty5Bew==
X-Google-Smtp-Source: AKy350YH91pAUPM41j7LqluKiXzQ7Ynx9OMjbtDndSOQdeDLatwEyjhoPFWqpUQdaJ4OsOf4sEQSuA==
X-Received: by 2002:a17:902:9004:b0:1a5:2621:34cd with SMTP id a4-20020a170902900400b001a5262134cdmr5755075plp.39.1681942671881;
        Wed, 19 Apr 2023 15:17:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:51 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 10/48] RISC-V: KVM: Implement static memory region measurement
Date: Wed, 19 Apr 2023 15:16:38 -0700
Message-Id: <20230419221716.3603068-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231754_899004_F1B8F4B6 
X-CRM114-Status: GOOD (  18.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

To support attestation of any images loaded by the VMM, the COVH allows
measuring these memory regions. Currently, it will be used for the
kernel image, device tree and initrd images.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_cove.h |   6 ++
 arch/riscv/kvm/cove.c             | 110 ++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_cove.h b/arch/riscv/include/asm/kvm_cove.h
index 3bf1bcd..4ea1df1 100644
--- a/arch/riscv/include/asm/kvm_cove.h
+++ b/arch/riscv/include/asm/kvm_cove.h
@@ -127,6 +127,7 @@ void kvm_riscv_cove_vcpu_load(struct kvm_vcpu *vcpu);
 void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu);
 void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap);
 
+int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm, struct kvm_riscv_cove_measure_region *mr);
 int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa, unsigned long size);
 int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long hva);
 #else
@@ -147,6 +148,11 @@ static inline void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu) {}
 static inline void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap) {}
 static inline int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa,
 					       unsigned long size) {return -1; }
+static inline int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm,
+						  struct kvm_riscv_cove_measure_region *mr)
+{
+	return -1;
+}
 static inline int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu,
 					    gpa_t gpa, unsigned long hva) {return -1; }
 #endif /* CONFIG_RISCV_COVE_HOST */
diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index d001e36..5b4d9ba 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -27,6 +27,12 @@ static DEFINE_SPINLOCK(cove_fence_lock);
 
 static bool riscv_cove_enabled;
 
+static inline bool cove_is_within_region(unsigned long addr1, unsigned long size1,
+				       unsigned long addr2, unsigned long size2)
+{
+	return ((addr1 <= addr2) && ((addr1 + size1) >= (addr2 + size2)));
+}
+
 static void kvm_cove_local_fence(void *info)
 {
 	int rc;
@@ -192,6 +198,109 @@ int kvm_riscv_cove_vcpu_init(struct kvm_vcpu *vcpu)
 	return rc;
 }
 
+int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm, struct kvm_riscv_cove_measure_region *mr)
+{
+	struct kvm_cove_tvm_context *tvmc = kvm->arch.tvmc;
+	int rc = 0, idx, num_pages;
+	struct kvm_riscv_cove_mem_region *conf;
+	struct page *pinned_page, *conf_page;
+	struct kvm_riscv_cove_page *cpage;
+
+	if (!tvmc)
+		return -EFAULT;
+
+	if (tvmc->finalized_done) {
+		kvm_err("measured_mr pages can not be added after finalize\n");
+		return -EINVAL;
+	}
+
+	num_pages = bytes_to_pages(mr->size);
+	conf = &tvmc->confidential_region;
+
+	if (!IS_ALIGNED(mr->userspace_addr, PAGE_SIZE) ||
+	    !IS_ALIGNED(mr->gpa, PAGE_SIZE) || !mr->size ||
+	    !cove_is_within_region(conf->gpa, conf->npages << PAGE_SHIFT, mr->gpa, mr->size))
+		return -EINVAL;
+
+	idx = srcu_read_lock(&kvm->srcu);
+
+	/*TODO: Iterate one page at a time as pinning multiple pages fail with unmapped panic
+	 * with a virtual address range belonging to vmalloc region for some reason.
+	 */
+	while (num_pages) {
+		if (signal_pending(current)) {
+			rc = -ERESTARTSYS;
+			break;
+		}
+
+		if (need_resched())
+			cond_resched();
+
+		rc = get_user_pages_fast(mr->userspace_addr, 1, 0, &pinned_page);
+		if (rc < 0) {
+			kvm_err("Pinning the userpsace addr %lx failed\n", mr->userspace_addr);
+			break;
+		}
+
+		/* Enough pages are not available to be pinned */
+		if (rc != 1) {
+			rc = -ENOMEM;
+			break;
+		}
+		conf_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		if (!conf_page) {
+			rc = -ENOMEM;
+			break;
+		}
+
+		rc = cove_convert_pages(page_to_phys(conf_page), 1, true);
+		if (rc)
+			break;
+
+		/*TODO: Support other pages sizes */
+		rc = sbi_covh_add_measured_pages(tvmc->tvm_guest_id, page_to_phys(pinned_page),
+						 page_to_phys(conf_page), SBI_COVE_PAGE_4K,
+						 1, mr->gpa);
+		if (rc)
+			break;
+
+		/* Unpin the page now */
+		put_page(pinned_page);
+
+		cpage = kmalloc(sizeof(*cpage), GFP_KERNEL_ACCOUNT);
+		if (!cpage) {
+			rc = -ENOMEM;
+			break;
+		}
+
+		cpage->page = conf_page;
+		cpage->npages = 1;
+		cpage->gpa = mr->gpa;
+		cpage->hva = mr->userspace_addr;
+		cpage->is_mapped = true;
+		INIT_LIST_HEAD(&cpage->link);
+		list_add(&cpage->link, &tvmc->measured_pages);
+
+		mr->userspace_addr += PAGE_SIZE;
+		mr->gpa += PAGE_SIZE;
+		num_pages--;
+		conf_page = NULL;
+
+		continue;
+	}
+	srcu_read_unlock(&kvm->srcu, idx);
+
+	if (rc < 0) {
+		/* We don't to need unpin pages as it is allocated by the hypervisor itself */
+		cove_delete_page_list(kvm, &tvmc->measured_pages, false);
+		/* Free the last allocated page for which conversion/measurement failed */
+		kfree(conf_page);
+		kvm_err("Adding/Converting measured pages failed %d\n", num_pages);
+	}
+
+	return rc;
+}
+
 int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa, unsigned long size)
 {
 	int rc;
@@ -244,6 +353,7 @@ void kvm_riscv_cove_vm_destroy(struct kvm *kvm)
 	}
 
 	cove_delete_page_list(kvm, &tvmc->reclaim_pending_pages, false);
+	cove_delete_page_list(kvm, &tvmc->measured_pages, false);
 
 	/* Reclaim and Free the pages for tvm state management */
 	rc = sbi_covh_tsm_reclaim_pages(page_to_phys(tvmc->tvm_state.page), tvmc->tvm_state.npages);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
