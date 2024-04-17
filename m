Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D49C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 07:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IM5UG52lcuXpseE5lSQrIz0dhczizuWIvwrVmOIAdSs=; b=uzSSPMF4ZfafFg
	5h9oCZHuBmmwxKKv5EsZ8Vq2IND2sVxMdmRHGLvQzESDmPlbVnIy9K062lQqvl/Z4mFbAG0EFM9uG
	khvIRYRLiZSoFMvV8QLRhEc69LFPt3trqUKv2bs+HJRSBWhsExzk3txx7I969NRZeP8abU61M1Rp0
	MwZCUNqGAO5/9vjPT0g53tRDrSD7Ef4i9/kAzwCu2LewW3m9Sm5dAjzSeERGOxcYM9hcX3k9o/vbZ
	Jfqkr507GaVMbrY/zAfi8Xd4u9YTji4vfd18/RCYUgRfqRnbl5+biUDE7uY/rszBLFf03BJkBP/5t
	Ha5C7vBpEWaWTiDuRAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzzH-0000000F5IB-1f6C;
	Wed, 17 Apr 2024 07:45:47 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzzE-0000000F5GP-29tf
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 07:45:46 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e83a2a4f2cso638135ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2024 00:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1713339943; x=1713944743; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VAeQZBydta2YFx0doefh2m6FBjLjSICAoI5LdWB4tXo=;
        b=YIKnvUyYtaOpBBToK3/mdju8PDhyrMDaV4eMvYHgYtRaFsRTHLdooxvVPFd1vn1W2A
         hj1VztFIWtdIFwvzlUCqo51vCJ+v0Va/zHyBjeWC/zVdLM6qxeGF1AVj7Nv4InxnQMDE
         o59ZnqYmf848m1rFIn0pyLK8sAGs8RuQKxeNCIkySRIRUGmHQmtIo5Y8TRsT3KwjSxND
         vZiXZCtaeVa22u81zW1TUNsZMcCKia4pxS0TTvWOmdbEDw16xVTJddrE+mOpsk7czcUi
         pkiM+Dl+IxCJZLKXEMykBkC+47umx1BMOuIfi278gKoS4B4Y8yswEoUSEMyRKS+luZVK
         irEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713339943; x=1713944743;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VAeQZBydta2YFx0doefh2m6FBjLjSICAoI5LdWB4tXo=;
        b=pwsyrPsIs85j+JdVhzRgBegD7AD/rYS9dtYWC81XRYyHYyW0nehkGUAovVOleJ0TQT
         oW9dKQ786XYKbp+bRBzJYPHZmciMMMDigLBw0e1QoDOBvGVhTIQkexZ3AuWbqMYT5hOf
         SZm2mKkgn8wS7egI0y5nc3/l6GXsmiwpQpshyUbZt6AqRyKJ8Al/g6yzlhx+3j7PPsF6
         RYni58+ooIVYFrzu4cxp8rYSzbhKqLIExSHgRTJTHbcS/N/LjHesmewqq0/AYUBcTgNL
         6yD4Npr1GAmtzM1rEV9AfdSdGvHq0ZQ8KGIT4OFMyK+2Qg7fbDTF665W0oeuUjHKe2As
         AJ/A==
X-Gm-Message-State: AOJu0Yz+NWoefEhfmWqG7RXJCDh+SBkrxG3FXM5J3+r5rHFzm02q0gRU
	uAvffzD/bcVtMA5d36z/cex4pODqxyOSjI4fcE+ZdlyF0ew7jhEdnU7aEexf4MG5fksUArsCqJm
	V6LUaHqhFy36/RU6fHTw4CHSIs40A5nTWT9CnMDh7NqFYiNea4UrUojg55R3yjoDPvwOkR7Nty1
	1xmCEpMNnZFKvuo6wlMxK7psBtYZQ6nXB+1GKxnPWs0JM0SmquMQNVyrKdgw==
X-Google-Smtp-Source: AGHT+IHpmzOz+XE19YaszuPGpeIKZss/3nG6ZbZ124xvH4CupAZWA+/yLBOehGNjqDTH689T/W6l9A==
X-Received: by 2002:a17:903:2352:b0:1e8:2c8d:b74a with SMTP id c18-20020a170903235200b001e82c8db74amr840861plh.10.1713339942755;
        Wed, 17 Apr 2024 00:45:42 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id g21-20020a170902c39500b001e7b7a79340sm3166065plg.267.2024.04.17.00.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 00:45:42 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] RISCV: KVM: Introduce vcpu->reset_cntx_lock
Date: Wed, 17 Apr 2024 15:45:26 +0800
Message-Id: <20240417074528.16506-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240417074528.16506-1-yongxuan.wang@sifive.com>
References: <20240417074528.16506-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_004544_676747_275A4056 
X-CRM114-Status: GOOD (  12.01  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Originally, the use of kvm->lock in SBI_EXT_HSM_HART_START also avoids
the simultaneous updates to the reset context of target VCPU. Since this
lock has been replace with vcpu->mp_state_lock, and this new lock also
protects the vcpu->mp_state. We have to add a separate lock for
vcpu->reset_cntx.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 arch/riscv/kvm/vcpu.c             | 6 ++++++
 arch/riscv/kvm/vcpu_sbi_hsm.c     | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 64d35a8c908c..664d1bb00368 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -211,6 +211,7 @@ struct kvm_vcpu_arch {
 
 	/* CPU context upon Guest VCPU reset */
 	struct kvm_cpu_context guest_reset_context;
+	spinlock_t reset_cntx_lock;
 
 	/* CPU CSR context upon Guest VCPU reset */
 	struct kvm_vcpu_csr guest_reset_csr;
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 70937f71c3c4..1a2236e4c7f3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -64,7 +64,9 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	memcpy(csr, reset_csr, sizeof(*csr));
 
+	spin_lock(&vcpu->arch.reset_cntx_lock);
 	memcpy(cntx, reset_cntx, sizeof(*cntx));
+	spin_unlock(&vcpu->arch.reset_cntx_lock);
 
 	kvm_riscv_vcpu_fp_reset(vcpu);
 
@@ -121,12 +123,16 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	spin_lock_init(&vcpu->arch.hfence_lock);
 
 	/* Setup reset state of shadow SSTATUS and HSTATUS CSRs */
+	spin_lock_init(&vcpu->arch.reset_cntx_lock);
+
+	spin_lock(&vcpu->arch.reset_cntx_lock);
 	cntx = &vcpu->arch.guest_reset_context;
 	cntx->sstatus = SR_SPP | SR_SPIE;
 	cntx->hstatus = 0;
 	cntx->hstatus |= HSTATUS_VTW;
 	cntx->hstatus |= HSTATUS_SPVP;
 	cntx->hstatus |= HSTATUS_SPV;
+	spin_unlock(&vcpu->arch.reset_cntx_lock);
 
 	if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
 		return -ENOMEM;
diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index 115a6c6525fd..cc5038b90e02 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -31,6 +31,7 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
 		goto out;
 	}
 
+	spin_lock(&target_vcpu->arch.reset_cntx_lock);
 	reset_cntx = &target_vcpu->arch.guest_reset_context;
 	/* start address */
 	reset_cntx->sepc = cp->a1;
@@ -38,6 +39,8 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
 	reset_cntx->a0 = target_vcpuid;
 	/* private data passed from kernel */
 	reset_cntx->a1 = cp->a2;
+	spin_unlock(&target_vcpu->arch.reset_cntx_lock);
+
 	kvm_make_request(KVM_REQ_VCPU_RESET, target_vcpu);
 
 	__kvm_riscv_vcpu_power_on(target_vcpu);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
