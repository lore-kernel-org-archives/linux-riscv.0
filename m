Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF13C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 09:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FqfM0lj/c8ucwY7t4NFdbnh6RJjvU/CyhL5Ui0udYRU=; b=dltMhMghxwZDxY
	p/KgLVIdY0nEGHu6iswuRzUJ+Va/9RWTVEIf/Y4igHjlk6TpGIZG8eBJ1f2TGOBDPhqwzkQLtrW4d
	n32BmHV/YN/018TedChgtm25j8/6B4pjj7m7pvQpMNRKNLmxRs28L+c3NJ8xj+oUco3tqr2RwI1sk
	cjCczCcxbUrlFW0uONAdYr07oErADjhEDn6r8ae2V5I2JYGOPQcCeWQGO+jnjYCGIV8v4mK1Cy9i+
	OmU7/3EjO4LSyFmCJhSJk4xgU7hfG0Y9PM/CR4vkXZ9Zb0G83G2dd/LqCZC5RGdA1pbg9R5409QH2
	37l90FSChtEXNSHARXlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGZc-00EjmO-32;
	Mon, 03 Apr 2023 09:34:00 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGZa-00EjRC-2V
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 09:34:00 +0000
Received: by mail-ot1-x32a.google.com with SMTP id q23-20020a05683031b700b006a1370e214aso12405547ots.11
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 02:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680514438; x=1683106438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbIL2R4BbWdg8J7OAaKXV5aF5CAjir3TG4QymDLTrYk=;
        b=Cf+4UIIPv5TTBiyEN7r8FKIHYeEu53s+lvh9b6LpqOMAIAxQImwsj2/TwR7xTynMkp
         CK4edr++aEb5J743Bl62h+2m43WjwaUKdvAFViPNLfvw6ajNJDUNHaRuBCQFgn5CZ40s
         ON69nPkTq7d5cmP0V6MJ1N1GVuLPHsKMXqnX6n8v7l0WPBBmh1BrOdwhwgO4VF8Qjdit
         N5DT8M/4XqHbIKfAKoD97FU+8DK//cL+T7TANqzJ3T0sSaGUN9pxsNvG47iEgKEn+JA2
         1czaUce3UMbB1Ba80BmyvnZ7alOdC7oX8SaNzXzoUm6V/0d05gudHEEZXPhJYsLdtijp
         IRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680514438; x=1683106438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbIL2R4BbWdg8J7OAaKXV5aF5CAjir3TG4QymDLTrYk=;
        b=a9l2CqbImmhwIPPyMPh0pnTQmitentqmLX3Ub0VGKA+rJ5Cnt3z9xuOkwALJ1/FOhu
         05hlie22dL+EPO3TbdvLa3fxTuyaEf3Z9fGvE4Yp5RfLuGTQa+ksfm5MCzwizu7C8+Qa
         ld+HtMvPV8bJGflTZSNI48HzVlo/c29QzDDOg6VzOoQwEmFIZaOtqxhpQHWg1Ai7pSQM
         i1FayOT9CnbwXzYNJ9hnQdLomN7SqZrLbzO/KDHMDXXfiLiyi7TmX04ePbiQBGfm5bZ/
         nqedQAUqRbZdF5TqwlbBdBAXb5cRdN1QhhE0r7FCium0S0ZNBoDtwJhXqmzZnDupofOu
         33wQ==
X-Gm-Message-State: AAQBX9eSUMqFj686r/Ck8heddOA/mYAnAkeUFkc/jq+3by4rkuLj24bw
	H+INISMmrHnQ7d3b4Z4hDx4++w==
X-Google-Smtp-Source: AKy350a8CdQ+7GbARk61CNLe4SIuFNs+HJwIKyXnXsOqQt4MkrXG5bXU8fVlXObFmcBnveuNhp8rew==
X-Received: by 2002:a05:6830:e12:b0:6a3:60c7:696d with SMTP id do18-20020a0568300e1200b006a360c7696dmr1452661otb.28.1680514438385;
        Mon, 03 Apr 2023 02:33:58 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id f5-20020a9d6c05000000b006a154373578sm3953953otq.39.2023.04.03.02.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 02:33:57 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 6/8] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
Date: Mon,  3 Apr 2023 15:03:08 +0530
Message-Id: <20230403093310.2271142-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403093310.2271142-1-apatel@ventanamicro.com>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_023358_821344_48E07DC2 
X-CRM114-Status: GOOD (  10.45  )
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

We implement ONE_REG interface for AIA CSRs as a separate subtype
under the CSR ONE_REG interface.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 8 ++++++++
 arch/riscv/kvm/vcpu.c             | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 182023dc9a51..cbc3e74fa670 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -79,6 +79,10 @@ struct kvm_riscv_csr {
 	unsigned long scounteren;
 };
 
+/* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_aia_csr {
+};
+
 /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_timer {
 	__u64 frequency;
@@ -107,6 +111,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
 	KVM_RISCV_ISA_EXT_ZICBOM,
 	KVM_RISCV_ISA_EXT_ZBB,
+	KVM_RISCV_ISA_EXT_SSAIA,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
@@ -153,8 +158,11 @@ enum KVM_RISCV_SBI_EXT_ID {
 /* Control and status registers are mapped as type 3 */
 #define KVM_REG_RISCV_CSR		(0x03 << KVM_REG_RISCV_TYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_GENERAL	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_AIA		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_REG(name)	\
 		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_CSR_AIA_REG(name)	\
+	(offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
 
 /* Timer registers are mapped as type 4 */
 #define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index aca6b4fb7519..15507cd3a595 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -58,6 +58,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
 	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
 
+	KVM_ISA_EXT_ARR(SSAIA),
 	KVM_ISA_EXT_ARR(SSTC),
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVPBMT),
@@ -97,6 +98,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_C:
 	case KVM_RISCV_ISA_EXT_I:
 	case KVM_RISCV_ISA_EXT_M:
+	case KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
@@ -520,6 +522,9 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_GENERAL:
 		rc = kvm_riscv_vcpu_general_get_csr(vcpu, reg_num, &reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_AIA:
+		rc = kvm_riscv_vcpu_aia_get_csr(vcpu, reg_num, &reg_val);
+		break;
 	default:
 		rc = -EINVAL;
 		break;
@@ -556,6 +561,9 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_GENERAL:
 		rc = kvm_riscv_vcpu_general_set_csr(vcpu, reg_num, reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_AIA:
+		rc = kvm_riscv_vcpu_aia_set_csr(vcpu, reg_num, reg_val);
+		break;
 	default:
 		rc = -EINVAL;
 		break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
