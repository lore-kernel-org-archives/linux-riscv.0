Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E843DC6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 15:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJZsOKDf47EPAM2Qad2Dzzt/wjAECn6P/2BlTqUwf/k=; b=qj9KI1gUUbYhxo
	a3OfQUrNg0jf1VL47hQMhmJ0/ffHEYsICNs9NIPooq2j9dgrYzhk3MRzrudbkmqSOaPqv1EewXuO5
	96r+NUlVBvjNUSqR8XGk6pScdN9pBOZx8rz1hMB+kJonM4Omo1PZDRPIDU9Bx8KT6wI7pQNdmUTHS
	y+xtW8/k48pBOPT7pLgyFKpTXdTVZxI1b8CQdKNL2nDt3Xnm8Mnk+gxt2RX48NCG+7un5/C+Qp0xL
	lj/xRSE7+f7ns8Im2WQvtX1NLirUJQC1fYyjqYrhlQzjcFm5nHak+ipZoe0u+TKi9El7rvR0w4UFi
	CWX/zjnaIj+/RZEFWrgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjihK-0021Qe-2M;
	Tue, 04 Apr 2023 15:35:50 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjihH-0021OZ-12
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 15:35:48 +0000
Received: by mail-oi1-x22b.google.com with SMTP id bj20so24502737oib.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 08:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680622546; x=1683214546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCp8YfxX6xFyqpUfUr+twYqQEVlMgTCLtcjgXZ4bJb0=;
        b=A7pfDSiLBKaXG6RPnmlfuhfDIp//TDAwQ/jfEQFYUaa36isCfr/MX73to+LqnLz02Z
         z/qf87ywLC4nWIq/qtWPrUF9DiJ/0kCOpYt6lLtQo1zHg6Yd9q2AH5LRjrkmJxWLusQa
         LN7nuZio9JqwV3soHLx5EOupQ7X8FKOXmgizJXm4dUw16GuIy2PyDYKooguetr+oVeh+
         xx6BH/TZ2zsi15N/+rAfn/r/6wDhuFvKuGbBL4miqtMIGSXQz1hgMBzRUnYZ5SqmtUeF
         /8gUGlmBs4EmzoM1TahQ/4XYHXIvrPYtRGwkED2XQolaZRCB+au/Ujny/18DbBVzO77X
         aoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680622546; x=1683214546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCp8YfxX6xFyqpUfUr+twYqQEVlMgTCLtcjgXZ4bJb0=;
        b=P6pNhGTNwBW7ATkAbUP3zsBiHPrfBCBWSffSBOEdSh8NGiyxJSU15NdG7xRvRRblYH
         CL00AKha/G+1AJyjM6cPb6BdwzE+QMjzPTQFR/ukehHlWFWnSWgPzV8CJaEHeKVf9RDu
         o18V4BZCi1eBf0xUJxfoLakf9BlCYqffLLY5BAAwqqiOGYi0aDD9n77Tjb7jxdhzpMHo
         gRw6bvKAaIzbA2UvQC7rkX3bpOOuGf0D6OuVNP6CbZKgELTjm3lHYavfGzvntpNOgj35
         jt3HfaLf+grBNSlxjfg6mRQ+T7G/vByKAoBdCfT8Ftw2ICkFzqMezc20EQLFXepZmOUm
         PG3w==
X-Gm-Message-State: AAQBX9cD7ivOOJP8BQ8qx5+SrfYcgJzWQv//6dP16CuLyMSAUPihUTmd
	X4GE8XgSg2NnZi+h+oR07blIRA==
X-Google-Smtp-Source: AKy350Z+iv2NUBGXv1ZNGJaaZur3SFogg2vqjzTqiEksQXuu7dAflL/OJXbaVA4tMuyn7BpClSGefw==
X-Received: by 2002:a05:6808:2d8:b0:387:64ee:eaca with SMTP id a24-20020a05680802d800b0038764eeeacamr1396397oid.30.1680622546406;
        Tue, 04 Apr 2023 08:35:46 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w124-20020acadf82000000b00387384dc768sm5325803oig.9.2023.04.04.08.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 08:35:46 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 6/9] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
Date: Tue,  4 Apr 2023 21:04:49 +0530
Message-Id: <20230404153452.2405681-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404153452.2405681-1-apatel@ventanamicro.com>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_083547_360335_5881306E 
X-CRM114-Status: GOOD (  10.36  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
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
index 3394859c5f85..57bdbfc17d48 100644
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
