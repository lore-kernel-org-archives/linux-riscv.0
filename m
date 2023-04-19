Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52143C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6dlfil32VVoYTnbRXip6TNGVQ7DV3Ou9DRWySFkuqI=; b=eQY25eu9pT8++5
	rvdC63OkNFvypi5Bo5zXuytDp8Uv1p1DBwC1vXbGtDd0GgxBYiF0ryKkfayDwAMYLYhWkAEkXsIp2
	ZFstEjPFecxh30CjKIswSb3Bq4t6WowIqRzutL/0TEg0in4NjKjAaystK0m10dAQdYoq3m6kmvxXQ
	iObx39Ti/yz387L14KgF5bErKSNu79UsXBTHWyNzDQU17J0PR8xD3f1ucqTzYFi08X+WsLvElbDGk
	TtzhH3Xj6h1t1NlUGk1mcwQhs/BHepD9EJgxVwOjibaFXjscPcGUUGvnkqYDVwAqhG3dyi1HioR0x
	ZPzBVio3pWcdItaiCeDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG8D-006TFj-23;
	Wed, 19 Apr 2023 22:18:29 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG87-006TAN-16
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:18:28 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-63b5c48ea09so373981b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942703; x=1684534703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFCr/CCby/ixIZR1vcNNYtJI+Hn/JpPKkTFrcmf/240=;
        b=o8cl3vLFW0T/UgdJpNmsgqy/trLWjUKDtYhD18vtn6zFmKJnhCVb3UEfS7g11Yxo6v
         70pgYAJ/oiEoiEaIzaXTTARUDuEe0wemxcSCjeDS0me1n4QkzpJpeXfeqrgbXd5cjW+8
         mPLL2Zixb1wKKpwdABmEKJb6AdfFo9aF/CARiWba1a9ZO3iyrr6WtwnggyEbtMKiFH3H
         d5ALpqRY6NcLK/kvZ5gIdFQLtEIiUaW/W6h18t9SJVK+nkmzEtEqwMweSnvDyUAtFakX
         ItHgUeBEX6SFRd5as2TzksX5YG1nm8yDIWTd3Rsk2EmExawcoSXVI008NBflAu//NIVj
         OPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942703; x=1684534703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFCr/CCby/ixIZR1vcNNYtJI+Hn/JpPKkTFrcmf/240=;
        b=PLitYa/Y5kyJWEgUcIDj4TfKEsoOz/NaXvEEbBsAYZ0caTXPYtgMgqoKM0V34yaIWn
         Q/sF08/sdg4b6NszKc3xaCDSQNJ8e+dtFvn26EnFPgHkQCViGRutlH7s6u45nM7tG/Jt
         FKiEiE13rj5YM2kQ+qM1HzRMUavU9eZm6/4HQBQC8bUMNGlGtusUdUHFzOspArQzJx4+
         QzOdMo2OvL1o7f3RJZgA+mpxlhG6CdxfuTNhct1ht5GPpQZrqv4GZSzEwuP5SsyxMfBT
         eaNi+iuWYxCMBs/udMFtLyWqZubcQY3o0y3JatYyq9OIvj1CWVDv95apUrvuV6RoKHHd
         O+fw==
X-Gm-Message-State: AAQBX9f4Nn5pMEbuzNiZ18vQKJuCq1LMgBJdHnQ7T77YhpcQBNku9Pkl
	4jlJm2AaFx7AH+WwZgQpndBwEA==
X-Google-Smtp-Source: AKy350YqF/4+akV7tQXSVqBJeeYYqMrxklqGFMYEM4KYqKrP5PB2sjQSY1CZVqN7qH3odtWcRYYeog==
X-Received: by 2002:a17:903:290:b0:19d:b02:cca5 with SMTP id j16-20020a170903029000b0019d0b02cca5mr6589575plr.12.1681942702695;
        Wed, 19 Apr 2023 15:18:22 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:22 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
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
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 24/48] RISC-V: KVM: Update timer functionality for TVMs.
Date: Wed, 19 Apr 2023 15:16:52 -0700
Message-Id: <20230419221716.3603068-25-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151823_393149_7675ABD2 
X-CRM114-Status: GOOD (  21.75  )
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

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

TSM manages the htimedelta/vstimecmp for the TVM and shares it
with the host to properly schedule hrtimer to keep timer interrupt ticking.
TSM only sets htimedetla when first VCPU is run to make sure host
is not able to control the start time of the VM. TSM updates vstimemcp
at every vmexit and ignores any write to vstimecmp from the host.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/cove.c       |  8 ++++++++
 arch/riscv/kvm/vcpu_timer.c | 26 +++++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index c11db7a..4a8a8db 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -282,6 +282,7 @@ void noinstr kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_
 	struct kvm_cove_tvm_context *tvmc;
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 	void *nshmem;
+	struct kvm_guest_timer *gt = &kvm->arch.timer;
 
 	if (!kvm->arch.tvmc)
 		return;
@@ -305,6 +306,13 @@ void noinstr kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_
 		trap->scause = EXC_CUSTOM_KVM_COVE_RUN_FAIL;
 		return;
 	}
+
+	/* Read htimedelta from shmem. Given it's written by TSM only when we
+	 * run first VCPU, we need to update this here rather than in timer
+	 * init.
+	 */
+	if (unlikely(!gt->time_delta))
+		gt->time_delta = nacl_shmem_csr_read(nshmem, CSR_HTIMEDELTA);
 }
 
 void kvm_riscv_cove_vcpu_destroy(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 71a4560..f059e14 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -14,6 +14,7 @@
 #include <asm/delay.h>
 #include <asm/kvm_nacl.h>
 #include <asm/kvm_vcpu_timer.h>
+#include <asm/kvm_cove.h>
 
 static u64 kvm_riscv_current_cycles(struct kvm_guest_timer *gt)
 {
@@ -71,6 +72,10 @@ static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
 
 static int kvm_riscv_vcpu_update_vstimecmp(struct kvm_vcpu *vcpu, u64 ncycles)
 {
+	/* Host is not allowed to update the vstimecmp for the TVM */
+	if (is_cove_vcpu(vcpu))
+		return 0;
+
 #if defined(CONFIG_32BIT)
 	nacl_csr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
 	nacl_csr_write(CSR_VSTIMECMPH, ncycles >> 32);
@@ -221,6 +226,11 @@ int kvm_riscv_vcpu_set_reg_timer(struct kvm_vcpu *vcpu,
 		ret = -EOPNOTSUPP;
 		break;
 	case KVM_REG_RISCV_TIMER_REG(time):
+		/* For trusted VMs we can not update htimedelta. We can just
+		 * read it from shared memory.
+		 */
+		if (is_cove_vcpu(vcpu))
+			return -EOPNOTSUPP;
 		gt->time_delta = reg_val - get_cycles64();
 		break;
 	case KVM_REG_RISCV_TIMER_REG(compare):
@@ -287,6 +297,7 @@ static void kvm_riscv_vcpu_update_timedelta(struct kvm_vcpu *vcpu)
 {
 	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
 
+
 #if defined(CONFIG_32BIT)
 	nacl_csr_write(CSR_HTIMEDELTA, (u32)(gt->time_delta));
 	nacl_csr_write(CSR_HTIMEDELTAH, (u32)(gt->time_delta >> 32));
@@ -299,6 +310,10 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
 
+	/* While in CoVE, HOST must not manage HTIMEDELTA or VSTIMECMP for TVM */
+	if (is_cove_vcpu(vcpu))
+		goto skip_hcsr_update;
+
 	kvm_riscv_vcpu_update_timedelta(vcpu);
 
 	if (!t->sstc_enabled)
@@ -311,6 +326,7 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 	nacl_csr_write(CSR_VSTIMECMP, t->next_cycles);
 #endif
 
+skip_hcsr_update:
 	/* timer should be enabled for the remaining operations */
 	if (unlikely(!t->init_done))
 		return;
@@ -358,5 +374,13 @@ void kvm_riscv_guest_timer_init(struct kvm *kvm)
 	struct kvm_guest_timer *gt = &kvm->arch.timer;
 
 	riscv_cs_get_mult_shift(&gt->nsec_mult, &gt->nsec_shift);
-	gt->time_delta = -get_cycles64();
+	if (is_cove_vm(kvm)) {
+		/* For TVMs htimedelta is managed by TSM and it's communicated using
+		 * NACL shmem interface when first time VCPU is run. so we read it in
+		 * kvm_riscv_cove_vcpu_switchto() where we enter VCPUs.
+		 */
+		gt->time_delta = 0;
+	} else {
+		gt->time_delta = -get_cycles64();
+	}
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
