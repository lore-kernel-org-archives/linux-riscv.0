Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC67C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJgtHAulwFn7C0M3Pmpxc1aGCmYOmYezhYWmS0A5lYo=; b=XAUoNDNxjOuEjV
	YeKDHERUdOeDyZ1dYWhU3CheB8bdKvw+BtCuuNOc2yzL2OvEQRBhQ2rrA51IrIVRHzvgEacA0BSm+
	dDgbJbOA5aExeJLsUIeDIo/6qDM0djnqWrgKE2OyMiipl+PslZADwfaoIauo5cN83msvSD7PTMON4
	NE+CVU1a8kHix5HPaUNNqcdx9dQRu7pMfVojMViM51a4WM6kIrfzg+PVTERxzASb1nA0clMIzb/PK
	35E3+W7/z3LZT1nJgfIqhga6Rt9fSiStqBocE4fBtQRdR6okU4Ob9YpHH2l2QAOp9bj19DCC0zh7b
	f37Jw6K9jr+n0cgmqigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDE-006UUj-02;
	Wed, 19 Apr 2023 22:23:40 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDC-006UT7-0V
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:23:39 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-32942f4b670so2114025ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943015; x=1684535015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nt9qr+Ng8JBl/RErKCxn2q3deom0MBnPuCU/gT00P20=;
        b=ot9ZGgjcXMaxAV0r1VOO+BvehMSySZNIsVcDPBEFwlJAhM2M5m+gwfrB780olzD6hR
         Hdrq9yXgl+sn4/wrpA4PaTrrtnnFy9Say+EnWPhRztcDse00ZGPmHquLuK3Ybnm7wJWA
         ynzhzpWOzs18V7RsuuGPFfvie8ep260dMB4F3F4+em6ryITqN7ugXLqLmHk+GAoN7Fmf
         OQtf58b1FXhM9LfuvN4kb6ax1lLXAD0ES3eChU4pExsoMv+YvW59AxrBX1OEBU8pI/52
         BPBRljloH/NRMWTqp6Eb9GcWkOIf5Jl1lSkwFq1AdstC6QGzsUCBs48503R1c8/SLqih
         fkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943015; x=1684535015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nt9qr+Ng8JBl/RErKCxn2q3deom0MBnPuCU/gT00P20=;
        b=U2E9vA8a+J14v3eStdCXgh1wzpGwYQzMv7BSteKA4aEQRgK7fb0Cm9e2nllu1IJlLd
         3lXzc92VWgy4oepkGAoE9lz7ysh+5EKrJDjd7DSQKm+wiX8r0CJaJY2HWnUCAyycK9k4
         9HYMEdEf4CNsg7R7eNHwedIsXgPAw2W5q4wBqRUp+9d96sr2HbOqSB4Ten/hZcOCwPhK
         gRmorz6/+8zpOtonQy4N0LTWW6k+rivFllTbXThwulmh0xrQfwTDziOmEDTEKjy6LnO5
         MmdxevyT/+H74b/YHzQxKm+wCcDiju0zxF/RF7mprmZHIPUTAYvMflFeyFVBBihbPOFf
         WIBQ==
X-Gm-Message-State: AAQBX9flhJqSWXrs88HuBjN4ZJ3m/v20tGzkd4RCReD8/V34UX0D+PBh
	skupx8vJ6pjU/efh43rbTirVIBnGhh3OQdbKgRY=
X-Google-Smtp-Source: AKy350bclXeDaJm5NGd+baLQjNm1etLX+lLDzeTXzfOcBiZB99+UVCqjhPXny+Rg6qaFMwVObWbhvw==
X-Received: by 2002:a17:903:110e:b0:1a6:6fe3:df91 with SMTP id n14-20020a170903110e00b001a66fe3df91mr7814057plh.50.1681942700098;
        Wed, 19 Apr 2023 15:18:20 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:19 -0700 (PDT)
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
Subject: [RFC 23/48] RISC-V: KVM: Wireup TVM world switch
Date: Wed, 19 Apr 2023 15:16:51 -0700
Message-Id: <20230419221716.3603068-24-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_152338_198348_935D45A6 
X-CRM114-Status: GOOD (  18.82  )
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

TVM worlds switch takes a different path from regular VM world switch as
it needs to make an ecall to TSM and TSM actually does the world switch.
The host doesn't need to save/restore any context as TSM is expected
to do that on behalf of the host. The TSM updatess the trap
information in the shared memory which host uses to figure out the
cause of the guest exit.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/cove.c      | 31 +++++++++++++++++++++++++++++--
 arch/riscv/kvm/vcpu.c      | 11 +++++++++++
 arch/riscv/kvm/vcpu_exit.c | 10 ++++++++++
 3 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index c93de9b..c11db7a 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -275,9 +275,36 @@ int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long hv
 	return rc;
 }
 
-void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap)
+void noinstr kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap)
 {
-	/* TODO */
+	int rc;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_cove_tvm_context *tvmc;
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	void *nshmem;
+
+	if (!kvm->arch.tvmc)
+		return;
+
+	tvmc = kvm->arch.tvmc;
+
+	nshmem = nacl_shmem();
+	/* Invoke finalize to mark TVM is ready run for the first time */
+	if (unlikely(!tvmc->finalized_done)) {
+
+		rc = sbi_covh_tsm_finalize_tvm(tvmc->tvm_guest_id, cntx->sepc, cntx->a1);
+		if (rc) {
+			kvm_err("TVM Finalized failed with %d\n", rc);
+			return;
+		}
+		tvmc->finalized_done = true;
+	}
+
+	rc = sbi_covh_run_tvm_vcpu(tvmc->tvm_guest_id, vcpu->vcpu_idx);
+	if (rc) {
+		trap->scause = EXC_CUSTOM_KVM_COVE_RUN_FAIL;
+		return;
+	}
 }
 
 void kvm_riscv_cove_vcpu_destroy(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 3e04b78..43a0b8c 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -1042,6 +1042,11 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_timer_save(vcpu);
 
 	if (kvm_riscv_nacl_available()) {
+		/**
+		 * For TVMs, we don't need a separate case as TSM only updates
+		 * the required CSRs during the world switch. All other CSR
+		 * value should be zeroed out by TSM anyways.
+		 */
 		nshmem = nacl_shmem();
 		csr->vsstatus = nacl_shmem_csr_read(nshmem, CSR_VSSTATUS);
 		csr->vsie = nacl_shmem_csr_read(nshmem, CSR_VSIE);
@@ -1191,6 +1196,12 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 			gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
 		}
 
+		trap->htval = nacl_shmem_csr_read(nshmem, CSR_HTVAL);
+		trap->htinst = nacl_shmem_csr_read(nshmem, CSR_HTINST);
+	} else if (is_cove_vcpu(vcpu)) {
+		nshmem = nacl_shmem();
+		kvm_riscv_cove_vcpu_switchto(vcpu, trap);
+
 		trap->htval = nacl_shmem_csr_read(nshmem, CSR_HTVAL);
 		trap->htinst = nacl_shmem_csr_read(nshmem, CSR_HTINST);
 	} else {
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 8944e29..c46e7f2 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -218,6 +218,15 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		else if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
 			ret = kvm_riscv_vcpu_sbi_ecall(vcpu, run);
 		break;
+	case EXC_CUSTOM_KVM_COVE_RUN_FAIL:
+		if (likely(is_cove_vcpu(vcpu))) {
+			ret = -EACCES;
+			run->fail_entry.hardware_entry_failure_reason =
+				KVM_EXIT_FAIL_ENTRY_COVE_RUN_VCPU;
+			run->fail_entry.cpu = vcpu->cpu;
+			run->exit_reason = KVM_EXIT_FAIL_ENTRY;
+		}
+		break;
 	default:
 		break;
 	}
@@ -225,6 +234,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	/* Print details in-case of error */
 	if (ret < 0) {
 		kvm_err("VCPU exit error %d\n", ret);
+		//TODO: These values are bogus/stale for a TVM. Improve it
 		kvm_err("SEPC=0x%lx SSTATUS=0x%lx HSTATUS=0x%lx\n",
 			vcpu->arch.guest_context.sepc,
 			vcpu->arch.guest_context.sstatus,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
