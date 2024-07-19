Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A7BC3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHmDIn1QuRz/b31X0TyiILxonYlf0UJJRhLK0L8ju14=; b=XogD5wkYlpw6GH
	xa17Z+Jgfa+otd17O4LZp7dlu7IPQ0VLn62J5dgllDa+CorkGmwm02YDt4ZNv8ExdhfXxIeDOICRX
	pwbNUSU92IcWsVtmvoSA4Mfbsz/CkIHsPL3N9mgA77+1hO1IBOOTmvPSHz+auWOxvJqxavwi/oiwS
	8tTvhUmedchA+7XC0lSSRh3cRY0w6brmq7fqDjKcVaXYfawlBS0cP0QwWhy089TSOmUbzTq5xoEWY
	WY9YX33Rpdsx36aNOQ7OtXKtRfe9xi41ww97ABC0GrBmMGqA7JKh3Bt1nrD9fZztF+Jtf79PEQDx4
	wGLcEYP74/Qu2n9FlCnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqBX-00000003BnT-109L;
	Fri, 19 Jul 2024 16:10:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqBN-00000003Bds-1utp
	for linux-riscv@bombadil.infradead.org;
	Fri, 19 Jul 2024 16:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zbBUe2dWVBXnAYtzUPKnZBxBsVbv9ClXZgKI121YyMI=; b=KKNV72ggX/IvuLabgt++CIyaql
	aWWAupe7HTYPLtPaLhf+H0qrFt1O0ULNFsVtYNcFMLvHOVE+9+hIaxKx3YVA47Fax2wiyd4v/16WZ
	96kMDarcJYDlNRyfQCs/lvTS64X2vPMWcxvDKa5343/A1Qtyzdnt4fZUUvR8F+XRii4jb1g9quFov
	knvY+0AGl2TlEiBws/5jmEUqQTJgXYlf2NESgD/aeAvV/RD8CxjbsF/p45d0EMv3RTlglhkzbab+Y
	2GPsu2UDAeJkc5IDjtFowv5jrQGjWoLV4vaH/Et3QUpQjl2ZfAyXPt+zrOorVLbvKb1p8CmbhfQib
	P4tWHWjQ==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqBK-00000002qGT-1IzG
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:10:08 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fd640a6454so8713685ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721405403; x=1722010203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbBUe2dWVBXnAYtzUPKnZBxBsVbv9ClXZgKI121YyMI=;
        b=l74BIU7qzllp9Yl/m88DVtV5/8uOQw0YP3moCDH8WG2mGcoZOPtzKvF2Hq0ZS8Br4y
         6JfXWvoh0VG2RTIVu33Z0TEtissJjzHSYO22sSIRPcXhrTwG4NMNIInzNf3tPpjZP/OB
         WYzLtqXt5kmk50509N5sgZpB1ddXBqEdPRyZswzl5vedwZGcp5rMCkQUryBVSPutbG5C
         FwP84TKjhwoq13stGrfk2IrZDmdSxJ8+sfoPlEmRuWsTzVk1RSYL3HCT8K2W//0GiaJK
         +U+gRmBenXzn0oVnc1unf6h2nlcdgWkkuEOnIuNNLAnjzoXH4L9HQXCP6a+C0lQphj17
         XGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405403; x=1722010203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbBUe2dWVBXnAYtzUPKnZBxBsVbv9ClXZgKI121YyMI=;
        b=kQkacVrdqdFoZ1qef39NSqmT4vr0TxkzFdXh+3sRDU5klspgESCsFRSe+6rSouexRY
         a9mm1lgILLvaZvqgXMoBsv68AzfI6VAedEcDsSZ1ipF5wkM0r4inGMC9CFax5AYJvGrt
         aPR9SG0IMFqfVRdXU5ImfKIcJ4Zsrh0h7uKNg9rbzX/be1dJ8o0wJNRTIsVef7nWRC+E
         IG2pplQOhesgHtmaPhZB3/7g5KQaN727pRBVH2cQqziZER30Ya9KY+VcmveSMiEVUtVn
         lcG02pdzJ5UYx3j6+okWqRAyJroQGmnaC6PbVbSQ5nLEa5OJHmy6JMHDT7DqOu0UviiZ
         5S/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+OHkBLjEx7OsW9t6JpFXjXQjSU8m+BDZysRr7b9dq51QSl73PMb5+XC8xMi59mYzOB1hRf0iprZXzKZMGUCBOarZhydMXBENaOinz030N
X-Gm-Message-State: AOJu0YwrLZuOlw2wYLDnjEx9XRp8pclQI0kpgSMCerIIWH3ZcVOviA5a
	2wsNuyB8vesjoR/6n7rBXKsrb4wRasIAF6gNCTtgQgrNeqm5YH7yOFQIkrIk/JQ=
X-Google-Smtp-Source: AGHT+IHnsrDgJZ0Xs5ITUii+G2fuHbMcUuyE62ZDbeRXtLEqFfI/Ns6FYVTGusklNoZKrSdaOfNp8w==
X-Received: by 2002:a17:902:f947:b0:1fb:81ec:26da with SMTP id d9443c01a7336-1fd7462c073mr2523815ad.58.1721405403214;
        Fri, 19 Jul 2024 09:10:03 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([223.185.135.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f518sm6632615ad.69.2024.07.19.09.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:10:02 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 11/13] RISC-V: KVM: Use SBI sync SRET call when available
Date: Fri, 19 Jul 2024 21:39:11 +0530
Message-Id: <20240719160913.342027-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719160913.342027-1-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_171006_549530_5B107A2E 
X-CRM114-Status: GOOD (  14.21  )
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

Implement an optimized KVM world-switch using SBI sync SRET call
when SBI nested acceleration extension is available. This improves
KVM world-switch when KVM RISC-V is running as a Guest under some
other hypervisor.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_nacl.h | 32 +++++++++++++++++++++
 arch/riscv/kvm/vcpu.c             | 48 ++++++++++++++++++++++++++++---
 arch/riscv/kvm/vcpu_switch.S      | 29 +++++++++++++++++++
 3 files changed, 105 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_nacl.h b/arch/riscv/include/asm/kvm_nacl.h
index a704e8000a58..5e74238ea525 100644
--- a/arch/riscv/include/asm/kvm_nacl.h
+++ b/arch/riscv/include/asm/kvm_nacl.h
@@ -12,6 +12,8 @@
 #include <asm/csr.h>
 #include <asm/sbi.h>
 
+struct kvm_vcpu_arch;
+
 DECLARE_STATIC_KEY_FALSE(kvm_riscv_nacl_available);
 #define kvm_riscv_nacl_available() \
 	static_branch_unlikely(&kvm_riscv_nacl_available)
@@ -43,6 +45,10 @@ void __kvm_riscv_nacl_hfence(void *shmem,
 			     unsigned long page_num,
 			     unsigned long page_count);
 
+void __kvm_riscv_nacl_switch_to(struct kvm_vcpu_arch *vcpu_arch,
+				unsigned long sbi_ext_id,
+				unsigned long sbi_func_id);
+
 int kvm_riscv_nacl_enable(void);
 
 void kvm_riscv_nacl_disable(void);
@@ -64,6 +70,32 @@ int kvm_riscv_nacl_init(void);
 #define nacl_shmem_fast()						\
 	(kvm_riscv_nacl_available() ? nacl_shmem() : NULL)
 
+#define nacl_scratch_read_long(__shmem, __offset)			\
+({									\
+	unsigned long *__p = (__shmem) +				\
+			     SBI_NACL_SHMEM_SCRATCH_OFFSET +		\
+			     (__offset);				\
+	lelong_to_cpu(*__p);						\
+})
+
+#define nacl_scratch_write_long(__shmem, __offset, __val)		\
+do {									\
+	unsigned long *__p = (__shmem) +				\
+			     SBI_NACL_SHMEM_SCRATCH_OFFSET +		\
+			     (__offset);				\
+	*__p = cpu_to_lelong(__val);					\
+} while (0)
+
+#define nacl_scratch_write_longs(__shmem, __offset, __array, __count)	\
+do {									\
+	unsigned int __i;						\
+	unsigned long *__p = (__shmem) +				\
+			     SBI_NACL_SHMEM_SCRATCH_OFFSET +		\
+			     (__offset);				\
+	for (__i = 0; __i < (__count); __i++)				\
+		__p[__i] = cpu_to_lelong((__array)[__i]);		\
+} while (0)
+
 #define nacl_sync_hfence(__e)						\
 	sbi_ecall(SBI_EXT_NACL, SBI_EXT_NACL_SYNC_HFENCE,		\
 		  (__e), 0, 0, 0, 0, 0)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 00baaf1b0136..fe849fb1aaab 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -759,19 +759,59 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
  */
 static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 {
+	void *nsh;
 	struct kvm_cpu_context *gcntx = &vcpu->arch.guest_context;
 	struct kvm_cpu_context *hcntx = &vcpu->arch.host_context;
 
 	kvm_riscv_vcpu_swap_in_guest_state(vcpu);
 	guest_state_enter_irqoff();
 
-	hcntx->hstatus = ncsr_swap(CSR_HSTATUS, gcntx->hstatus);
+	if (kvm_riscv_nacl_sync_sret_available()) {
+		nsh = nacl_shmem();
 
-	nsync_csr(-1UL);
+		if (kvm_riscv_nacl_autoswap_csr_available()) {
+			hcntx->hstatus =
+				nacl_csr_read(nsh, CSR_HSTATUS);
+			nacl_scratch_write_long(nsh,
+						SBI_NACL_SHMEM_AUTOSWAP_OFFSET +
+						SBI_NACL_SHMEM_AUTOSWAP_HSTATUS,
+						gcntx->hstatus);
+			nacl_scratch_write_long(nsh,
+						SBI_NACL_SHMEM_AUTOSWAP_OFFSET,
+						SBI_NACL_SHMEM_AUTOSWAP_FLAG_HSTATUS);
+		} else if (kvm_riscv_nacl_sync_csr_available()) {
+			hcntx->hstatus = nacl_csr_swap(nsh,
+						       CSR_HSTATUS, gcntx->hstatus);
+		} else {
+			hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
+		}
 
-	__kvm_riscv_switch_to(&vcpu->arch);
+		nacl_scratch_write_longs(nsh,
+					 SBI_NACL_SHMEM_SRET_OFFSET +
+					 SBI_NACL_SHMEM_SRET_X(1),
+					 &gcntx->ra,
+					 SBI_NACL_SHMEM_SRET_X_LAST);
+
+		__kvm_riscv_nacl_switch_to(&vcpu->arch, SBI_EXT_NACL,
+					   SBI_EXT_NACL_SYNC_SRET);
+
+		if (kvm_riscv_nacl_autoswap_csr_available()) {
+			nacl_scratch_write_long(nsh,
+						SBI_NACL_SHMEM_AUTOSWAP_OFFSET,
+						0);
+			gcntx->hstatus = nacl_scratch_read_long(nsh,
+								SBI_NACL_SHMEM_AUTOSWAP_OFFSET +
+								SBI_NACL_SHMEM_AUTOSWAP_HSTATUS);
+		} else {
+			gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
+		}
+	} else {
+		hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
 
-	gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
+		__kvm_riscv_switch_to(&vcpu->arch);
+
+		gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
+	}
 
 	vcpu->arch.last_exit_cpu = vcpu->cpu;
 	guest_state_exit_irqoff();
diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
index 9f13e5ce6a18..47686bcb21e0 100644
--- a/arch/riscv/kvm/vcpu_switch.S
+++ b/arch/riscv/kvm/vcpu_switch.S
@@ -218,6 +218,35 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 	ret
 SYM_FUNC_END(__kvm_riscv_switch_to)
 
+	/*
+	 * Parameters:
+	 * A0 <= Pointer to struct kvm_vcpu_arch
+	 * A1 <= SBI extension ID
+	 * A2 <= SBI function ID
+	 */
+SYM_FUNC_START(__kvm_riscv_nacl_switch_to)
+	SAVE_HOST_GPRS
+
+	SAVE_HOST_AND_RESTORE_GUEST_CSRS .Lkvm_nacl_switch_return
+
+	/* Resume Guest using SBI nested acceleration */
+	add	a6, a2, zero
+	add	a7, a1, zero
+	ecall
+
+	/* Back to Host */
+	.align 2
+.Lkvm_nacl_switch_return:
+	SAVE_GUEST_GPRS
+
+	SAVE_GUEST_AND_RESTORE_HOST_CSRS
+
+	RESTORE_HOST_GPRS
+
+	/* Return to C code */
+	ret
+SYM_FUNC_END(__kvm_riscv_nacl_switch_to)
+
 SYM_CODE_START(__kvm_riscv_unpriv_trap)
 	/*
 	 * We assume that faulting unpriv load/store instruction is
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
