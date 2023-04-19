Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F40FC77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DumRLR18v7k/JN9hawYmiOPFVGtUkOFYOik2n4rsgm4=; b=jIPfBm8/gLIRYZ
	gNmC8ECpMsM+JdkohuCOX2PxKcrkJCCkFe62Cxhf0/Vzbhd0+tzzoGdBw0FJYIUhXkZMepyPQ6BEm
	tOOeq/2o1kQLOIlYJm/KLSu0y9zvbm8a+U1eRhk1DcKUZw5/1ZrcvijDJbF/uDEdd67bH00QgRT98
	SnIavw7ypgL+t2j5KlcBZekn5/A4re7JISU0clouyuOSYZROHwIaQTvVvsbKuHjgRdpAzbFfpjpom
	nenPUliUIMEDW4sfK2Yl5YrlwRkm5wFqELcXkS4g722wx8G3rD483xN74AMJJB/HSSoURRRwXPJIa
	nO/v806ttxtaUhDKnNPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG80-006T6q-2C;
	Wed, 19 Apr 2023 22:18:16 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG7x-006T2c-2M
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:18:15 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1a686260adcso5384305ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942693; x=1684534693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyIj0UBv9pS76jm0gxcpwmAmAKqEq2wUQqZgUQ6cXgk=;
        b=JUqXodm7yTv0ln6sHn0eyCWrKgQ2lIYWLmeyEDRipWR1vGY9jvhA0yFwbIBRMjhRbb
         5feEP/EeoRDxGxyKun0x5G2O5oEBJdDAFRS/RHZ4Ci8b/iv26PTeN1VUZ+s3pIrJBSTf
         rZjckAXPtWtvH1Kvmtp4JHL0K8GHX72uGWQN4DiIyrkkdwTzznpc2XULSlQqV9+qqsp4
         UJ+vBagyFy5rq5HF8Oa6OHLTBhdbA55/ZL15Y605z4/ZrHmgIiKmwYrEl9ntaC9BfLrM
         ClfqHB6I3YRHPV8jZmE8uYnBE2UGqLOLZNM172UxVHBchm+jEWBkzY2ZxZ7p2UfryNvP
         OpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942693; x=1684534693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyIj0UBv9pS76jm0gxcpwmAmAKqEq2wUQqZgUQ6cXgk=;
        b=Msmy0uV9wqlDWAh9PZLs8uQnoY1Zmu+BoidP3zddmQkbfuQjS6VIfDab5v4jx/7kHE
         ydlBAto4Nv9p+6rejpvzLOiRRLzvMmZjrbPyoun8Cd7jzPacekj+alZBJem/pBMYAOrV
         b8mAzyyufj3E+pKwMNJrXOgquuwq2SIs4CX2FREYe6VXC8aVhW9lAy/xSMj/JxYRl8pz
         Npi4T1erWYrlZ4HFE8UsV6+0uIdM0JoMk004mumRY4VqiIf2aQ6Wtz9/d+DxLZHldBlr
         A8/D574TlwvE8TUDmIH2vYdn61XPsZ83BPH1rj9guOUh+jLKnl9fHi/2o3zcE25l0AkN
         JXsw==
X-Gm-Message-State: AAQBX9fhO5vh1/QCtxoR3k2sIq8/LtoxNeweH0y00EZ03wKv7WpmwEdG
	Qf0RnD7B3bHpFxcV1vE1SCW3zw==
X-Google-Smtp-Source: AKy350Y8OMGVUtVmKbRjYFU/NfkRlor4BXVO9AnvAi3r9stoJW7W2hRl3eELkUdIf0o2cuCG7q0qBA==
X-Received: by 2002:a17:903:2291:b0:19c:dbce:dce8 with SMTP id b17-20020a170903229100b0019cdbcedce8mr8768332plh.15.1681942693408;
        Wed, 19 Apr 2023 15:18:13 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:13 -0700 (PDT)
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
Subject: [RFC 20/48] RISC-V: KVM: Add gstage mapping for TVMs
Date: Wed, 19 Apr 2023 15:16:48 -0700
Message-Id: <20230419221716.3603068-21-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151813_767273_9838A5FD 
X-CRM114-Status: GOOD (  17.97  )
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

For TVM, the gstage mapping is managed by the TSM via COVH SBI
calls. The host is responsible for allocating page that must be pinned
to avoid swapping. The page is converted it to confidential before
handing over to the TSM for gstage mapping.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/cove.c      | 63 +++++++++++++++++++++++++++++++++++++-
 arch/riscv/kvm/vcpu_exit.c |  9 ++++--
 2 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index 4efcae3..44095f6 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -149,8 +149,68 @@ void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu)
 
 int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long hva)
 {
-	/* TODO */
+	struct kvm_riscv_cove_page *tpage;
+	struct mm_struct *mm = current->mm;
+	struct kvm *kvm = vcpu->kvm;
+	unsigned int flags = FOLL_LONGTERM | FOLL_WRITE | FOLL_HWPOISON;
+	struct page *page;
+	int rc;
+	struct kvm_cove_tvm_context *tvmc = kvm->arch.tvmc;
+
+	tpage = kmalloc(sizeof(*tpage), GFP_KERNEL_ACCOUNT);
+	if (!tpage)
+		return -ENOMEM;
+
+	mmap_read_lock(mm);
+	rc = pin_user_pages(hva, 1, flags, &page, NULL);
+	mmap_read_unlock(mm);
+
+	if (rc == -EHWPOISON) {
+		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
+				PAGE_SHIFT, current);
+		rc = 0;
+		goto free_tpage;
+	} else if (rc != 1) {
+		rc = -EFAULT;
+		goto free_tpage;
+	} else if (!PageSwapBacked(page)) {
+		rc = -EIO;
+		goto free_tpage;
+	}
+
+	rc = cove_convert_pages(page_to_phys(page), 1, true);
+	if (rc)
+		goto unpin_page;
+
+	rc = sbi_covh_add_zero_pages(tvmc->tvm_guest_id, page_to_phys(page),
+				     SBI_COVE_PAGE_4K, 1, gpa);
+	if (rc) {
+		pr_err("%s: Adding zero pages failed %d\n", __func__, rc);
+		goto zero_page_failed;
+	}
+	tpage->page = page;
+	tpage->npages = 1;
+	tpage->is_mapped = true;
+	tpage->gpa = gpa;
+	tpage->hva = hva;
+	INIT_LIST_HEAD(&tpage->link);
+
+	spin_lock(&kvm->mmu_lock);
+	list_add(&tpage->link, &kvm->arch.tvmc->zero_pages);
+	spin_unlock(&kvm->mmu_lock);
+
 	return 0;
+
+zero_page_failed:
+	//TODO: Do we need to reclaim the page now or VM gets destroyed ?
+
+unpin_page:
+	unpin_user_pages(&page, 1);
+
+free_tpage:
+	kfree(tpage);
+
+	return rc;
 }
 
 void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap)
@@ -390,6 +450,7 @@ void kvm_riscv_cove_vm_destroy(struct kvm *kvm)
 
 	cove_delete_page_list(kvm, &tvmc->reclaim_pending_pages, false);
 	cove_delete_page_list(kvm, &tvmc->measured_pages, false);
+	cove_delete_page_list(kvm, &tvmc->zero_pages, true);
 
 	/* Reclaim and Free the pages for tvm state management */
 	rc = sbi_covh_tsm_reclaim_pages(page_to_phys(tvmc->tvm_state.page), tvmc->tvm_state.npages);
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 0d0c895..d00b9ee5 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -41,8 +41,13 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		};
 	}
 
-	ret = kvm_riscv_gstage_map(vcpu, memslot, fault_addr, hva,
-		(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false);
+	if (is_cove_vcpu(vcpu)) {
+		/* CoVE doesn't care about PTE prots now. No need to compute the prots */
+		ret = kvm_riscv_cove_gstage_map(vcpu, fault_addr, hva);
+	} else {
+		ret = kvm_riscv_gstage_map(vcpu, memslot, fault_addr, hva,
+			(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false);
+	}
 	if (ret < 0)
 		return ret;
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
