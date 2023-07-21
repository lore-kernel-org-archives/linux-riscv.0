Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5517BC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 07:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aN5FdEvnD9Dn5INZiOZdvWvETXwSLEmZWGYZeSODJGM=; b=JgkEzcF5APQEuh
	I97BrkbtnjVbNE3YQATDeuGFoWIW6QtJ0EmPW+Yuetgtrl0xdzWd/ddBmtNz8M8SVlrl/1TTlondJ
	ZqZWuEEJ8IB1FZohcD/9aR+xtgfJtQq+RzIka/dsE+xQ/kGmOeUfAqCPbQUd9bq5t96ugm8HfdjKK
	MbQ34SHGqsRxlFk0IUI1gmAdfwrjAOICqoe/sZLqTzwfyXr5oFNjT757TQYe0ezIJXkcpIw9oLaCA
	2OQvH9SZaBRFw9sN+GSvVDlN58eJGLpfZqZgIwN/po3IsCOo5t8m1zY6WN4YVATv4XnfS2ieCkvZe
	k5oXDd8N30Ake4ho1eGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkym-00DGKb-2r;
	Fri, 21 Jul 2023 07:55:12 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkyi-00DGF3-1w
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 07:55:10 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2633b669f5fso892684a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 00:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689926108; x=1690530908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6Ksr06UW7Dx/X9GfjFaRawS2ArEeJDwaLwbdE4Z+oI=;
        b=Ja/9rqUcR8mguD9SerxDWAbqKtWAu6RjjRsr2AeiDMvODUQZujXzQYXuUn/b4fj/uv
         oJew2Ebd4XM+fwYGJEP1Y3WcH6PwukQkxgYGhZSE6Mku82auaTl4UgitpvZRS2fs6B4A
         ADL12DH2PszuH/dWJy5BLCnCckXJIFunkhQLQ8hgRFdr9Vo2VRKNb7a1Mae7grfaO2XC
         o4jmP0Gg/RouywZtpGDT4kn6EphzOpVArtgO/OkYivuMqj6GkF1kt+cW7ljacwjzIv3t
         aR50eaCv59fZ6oNMS+cnnVfASbro9hWYc3/XoPrAzO1PJ/lz2Y7UfhiTNhixevZYbI1o
         B03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689926108; x=1690530908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6Ksr06UW7Dx/X9GfjFaRawS2ArEeJDwaLwbdE4Z+oI=;
        b=i80TWw1Djb+jRLwufnVBOKzksXvMrg81CAVRStSZxPFAwBXumgTHYx5bwLND+27AhM
         Nj8Sx6Q7JUqWoc+WfwcyWKsufB2pEEzGHtveoGSQxR4JVek1Z3g7SEddUYd42IC3a7RA
         sZAm5GqjWY9YEQ/6uZY4dCsh1evokLeATKOGLPehLxZqw1zUT3jjgRHK7sZ233y6/36Z
         +1bWyJc/o6fD337k9yWcAzZv/hUqAl10zAI7Go1prv8mNcHFaymSsuSKaDnJFeYSqqsd
         M/MRmj99GWYAVL7GjQZbm77gFJ2EADJrjpF40yXCurUBA2T5vnAacItUdsqMoAuCM59U
         ZwkA==
X-Gm-Message-State: ABy/qLYBLVlNCk7HgE/wMwyZGLGWqnYRtZ/X2do2/Z1+YSrjWedVd6fQ
	YOXCFYYHVeK+lu1vcafNp0olMg==
X-Google-Smtp-Source: APBJJlGE29fF9otfzxTa+Yc4pCr9JKSbe3hHM4bYDxgEMtQhDF2xwHv5P89OKxXsFtp5FJcLnbfCOw==
X-Received: by 2002:a17:90a:7642:b0:263:41ae:8163 with SMTP id s2-20020a17090a764200b0026341ae8163mr759011pjl.12.1689926108062;
        Fri, 21 Jul 2023 00:55:08 -0700 (PDT)
Received: from mchitale-vm.. ([117.99.250.48])
        by smtp.googlemail.com with ESMTPSA id gw15-20020a17090b0a4f00b00267bb769652sm2026354pjb.6.2023.07.21.00.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 00:55:07 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 6/6] RISCV: KVM: Add sstateen0 to ONE_REG
Date: Fri, 21 Jul 2023 13:24:39 +0530
Message-Id: <20230721075439.454473-7-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721075439.454473-1-mchitale@ventanamicro.com>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_005508_654795_09CE2AD9 
X-CRM114-Status: GOOD (  11.99  )
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

Add support for sstateen0 CSR to the ONE_REG interface to allow its
access from user space.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  9 +++++++
 arch/riscv/kvm/vcpu.c             | 40 +++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 74c7f42de29d..bdddfb20299a 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -93,6 +93,11 @@ struct kvm_riscv_aia_csr {
 	unsigned long iprio2h;
 };
 
+/* Smstateen CSR for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_smstateen_csr {
+	unsigned long sstateen0;
+};
+
 /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_timer {
 	__u64 frequency;
@@ -173,10 +178,14 @@ enum KVM_RISCV_SBI_EXT_ID {
 #define KVM_REG_RISCV_CSR		(0x03 << KVM_REG_RISCV_TYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_GENERAL	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_AIA		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_SMSTATEEN	(0x2 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+
 #define KVM_REG_RISCV_CSR_REG(name)	\
 		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_AIA_REG(name)	\
 	(offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_CSR_SMSTATEEN_REG(name)	\
+	(offsetof(struct kvm_riscv_smstateen_csr, name) / sizeof(unsigned long))
 
 /* Timer registers are mapped as type 4 */
 #define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index ae750decbefe..af7549374c4b 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -507,6 +507,34 @@ static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static inline int kvm_riscv_vcpu_smstateen_set_csr(struct kvm_vcpu *vcpu,
+						   unsigned long reg_num,
+						   unsigned long reg_val)
+{
+	struct kvm_vcpu_smstateen_csr *csr = &vcpu->arch.smstateen_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_smstateen_csr) /
+	    sizeof(unsigned long))
+		return -EINVAL;
+
+	((unsigned long *)csr)[reg_num] = reg_val;
+	return 0;
+}
+
+static int kvm_riscv_vcpu_smstateen_get_csr(struct kvm_vcpu *vcpu,
+					    unsigned long reg_num,
+					    unsigned long *out_val)
+{
+	struct kvm_vcpu_smstateen_csr *csr = &vcpu->arch.smstateen_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_smstateen_csr) /
+	    sizeof(unsigned long))
+		return -EINVAL;
+
+	*out_val = ((unsigned long *)csr)[reg_num];
+	return 0;
+}
+
 static inline int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
 						 unsigned long reg_num,
 						 unsigned long reg_val)
@@ -552,6 +580,12 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_AIA:
 		rc = kvm_riscv_vcpu_aia_get_csr(vcpu, reg_num, &reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_SMSTATEEN:
+		rc = -EINVAL;
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+			rc = kvm_riscv_vcpu_smstateen_get_csr(vcpu, reg_num,
+							      &reg_val);
+		break;
 	default:
 		rc = -EINVAL;
 		break;
@@ -591,6 +625,12 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_AIA:
 		rc = kvm_riscv_vcpu_aia_set_csr(vcpu, reg_num, reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_SMSTATEEN:
+		rc = -EINVAL;
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+			rc = kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg_num,
+							      reg_val);
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
