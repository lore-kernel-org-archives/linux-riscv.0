Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45266CFC600
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snHx4DOeu9juEonyMWzeYUj38qx1Nei+kioJahDL24c=; b=zKhofoke+UVPab
	kXcSKA1duqUVHbnohwqxoDbLMaYyj3u6tJiBPnz9R7fQFjsuPnlZMzKPCmguTAoarKWWopt2Akaio
	iEb1laR2YoBhNjbktiXDlyhcRKlpupYeGWfbff7F0YdNlgF/ilcueJNb5GyAkCiwMWaTsTEdTsMZh
	nLOFWds2MgkbCn5OSQOpZto481HXdgcVbY4ZYF7wQSDne2iez8SS0IqYZ5hYA+J4TKNULnAf6wqEa
	TeTj8jJt8iOv29UR0oE8+CbjvZsa2RwqwzlTf0NUgzm6w20D/BZWY1NNoy++HVKdQfSISK5fw4ch8
	CrGAZNisZRaw0bVD32fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyse-0000000E7ED-3Z5N;
	Thu, 10 Oct 2024 19:31:24 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsJ-0000000DrHK-2WxR
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:02 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7e6c40a5795so1041175a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584818; x=1729189618; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OPPvMTYiUGb6pAXW02Q14XiUF2+KvArosM2sRK6VjAA=;
        b=jHZE+5uWuKTW/XclrN7CxgU01R867qap0OT1d1SQAxMutGogOns2m7h4OczE0MMOAh
         1bOC4OAreKrsxWwPn6Lq4yUn6ww5VGN/P/6dCQu7Wz1aJXS6RA5MlDKU8blhQdAK3+oJ
         w7Hui36VpO0Ua+GpakXkDzGrrZtAOQ4i+bpjS2LZB15ep1oIi954CEVd8VSCUEpuTEmH
         uMVRVR+qn2o1f5I/7taWb50bvQjkE/GagwpScYZSMNiGtslKvTiZXEYVCdh7kpLhPoVU
         OeNf3Txm2Xav5Rvn23+I0GhmOXaelr06WRlnGWvEKKd7xtGeetms/WSDotPLATORh2a1
         urMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584818; x=1729189618;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OPPvMTYiUGb6pAXW02Q14XiUF2+KvArosM2sRK6VjAA=;
        b=RIQ+srId1xRRyDojPuLjavuP8Lut3i/+aGmVKox9LLOpNj4HuF64ZXqJFcJcEM0fxa
         Ci147OB61mlTx4eLPuezVPNz2jsxYkDcjAKm8Zuw/uVvxxqxe1t+QGOLmDDQsr4KCVit
         gqEdGfAWF6DcGaZ5Q6sPUZTi0xptS8moGQy+DdJD9L85ShH0fNxlxQVROlyZxVLbwiP5
         MfsK4jo+1v5HWM512mxBmjso/fo+MmC6S5RzdIsNMT1GPjqFUaj37yV1Ar51NRkBBUhj
         /I/+ZuWx5j7Vc04f2koBwy7LsrpogROME/i21V+VGJg9T9mUWLrR8iA+uJZ8aqH1s1Vs
         FEAw==
X-Forwarded-Encrypted: i=1; AJvYcCXM5jcBzFFtv/MLyosV/Qkd3gEGBvDLJ1CGLw432PawhHUaz1qbqYg2x908BQMk/ZU+D5Lj4siH/y9EtA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDjP1yXKW3gvgWGqyfKwR4thEYK9SnnzhvDK2QumuoEmGOqDCa
	oRK//y67gb5seLeWWtDCpzCcMD5LRcWC2zv859DM/wYuvVCnM8lW1L5jzt1bCMXYEkrF8ll6uM9
	8Uw==
X-Google-Smtp-Source: AGHT+IHVZkXcNH8eDb3GIQubykYaXKWHdrpGe/zHTLQHIjPMwQpAN0ra/QncFunLfkL/hgYZuPxk0qgLkH8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:903:2343:b0:20c:747d:ec15 with SMTP id
 d9443c01a7336-20c747df618mr290175ad.1.1728584817934; Thu, 10 Oct 2024
 11:26:57 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:01 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-60-seanjc@google.com>
Subject: [PATCH v13 59/85] KVM: RISC-V: Use kvm_faultin_pfn() when mapping
 pfns into the guest
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
X-CRM114-CacheID: sfid-20241010_112659_735731_B18F0A71 
X-CRM114-Status: UNSURE (   9.97  )
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

Convert RISC-V to __kvm_faultin_pfn()+kvm_release_faultin_page(), which
are new APIs to consolidate arch code and provide consistent behavior
across all KVM architectures.

Opportunisticaly fix a s/priort/prior typo in the related comment.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2e9aee518142..e11ad1b616f3 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -601,6 +601,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 	bool logging = (memslot->dirty_bitmap &&
 			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
 	unsigned long vma_pagesize, mmu_seq;
+	struct page *page;
 
 	/* We need minimum second+third level pages */
 	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
@@ -631,7 +632,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 
 	/*
 	 * Read mmu_invalidate_seq so that KVM can detect if the results of
-	 * vma_lookup() or gfn_to_pfn_prot() become stale priort to acquiring
+	 * vma_lookup() or __kvm_faultin_pfn() become stale prior to acquiring
 	 * kvm->mmu_lock.
 	 *
 	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
@@ -647,7 +648,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		return -EFAULT;
 	}
 
-	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writable);
+	hfn = kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
 	if (hfn == KVM_PFN_ERR_HWPOISON) {
 		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
 				vma_pageshift, current);
@@ -681,11 +682,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
-	if ((!ret || ret == -EEXIST) && writable)
-		kvm_release_pfn_dirty(hfn);
-	else
-		kvm_release_pfn_clean(hfn);
-
+	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
 	spin_unlock(&kvm->mmu_lock);
 	return ret;
 }
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
