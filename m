Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512B8E77188
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 00:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U02WYZ7EqrIK77DJpzBs8RbFoOdJsbtyLguh/jRgf/Q=; b=UTbJb1XOnFdKDB
	qt0JbfDpmo56P6N25cHh6eCnBny7WN0EWDfNONnYnjw1/cXOtgIHu1u+L4BStpLg+MZvS1R3uUHX1
	jKdHRe43PEnWQUnJPYH9kwMHypbUx5smHMx8XhddQAFjOkiWQHg+gTu8UqGNPih1ux25TDBF0vXfQ
	TMKO0M6luAmDgOR53hBKMRzDlnXbYDGitk7teQgy984pi5vTnob3H4jSR6LG4dfTvf6ucJ61OKFyd
	+r0gusbJI0maszeb0mpmbcgJ3otAMSdCIUXcbBzXtcb3L0Hy2uxdHCOjFPXPKM7+S6ichr7vE5i/F
	MLRb8l+QHFsDHF/5Uylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPef-0000000HPtm-3tcN;
	Sat, 11 Jan 2025 00:47:10 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPed-0000000HPsE-0z60
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 00:47:08 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2efe25558ddso3435287a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 16:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736556427; x=1737161227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhKWMGnM57WsMY43qomywj90difyS8W0XzJpu0qHE5Y=;
        b=RqkqA6Yykt6/2mIcyAuPXLyY7OOYdxsofFofeXt1y60bAFNtPKJ47nUO/9iG1o/egw
         lNi9ARV6FKFWJH8P76TI3MFK3xzzzrKytdHDO+RAvRkuC0KQKpNDbRDcYyf5Xlri4x75
         AsIgC1COujDh+Y56e7OQlIbsSCiI5qSMh+ujP5nrFch4DbvbHwedwBmMx0TkVmojevng
         +nbMADPvND8rtGQ0YaAjo7t8f00GVPDO3XwZH5a+LEp3oEmkI0KhCGTWTmB1QYJ6Ix8k
         dFzFtVMjhIDlxOO20BlCiQ4RbfTpjlcengRrYOTJMquYWVHc19RXVdyrl4RSivAweQsB
         l5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556427; x=1737161227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhKWMGnM57WsMY43qomywj90difyS8W0XzJpu0qHE5Y=;
        b=dOT7nxIQvfcEHzXyXBGmuZwf7cdgWoHwJXJDhnTmRu2gynJYI0YUG8lPKWgKPwuhpG
         Frtzy2RlEhIkbevD2fajlmGlrTV9BkNsjDoHgJOKVhXOBML4/8V9l1X6qsz67/k7/kvt
         WRn8oJHnCt1CYiDIEEFUEjxTqY17crrNNPqghJinqfjXlS3tVu/MYMVKf7RtxYgSWA14
         cJCGxXpLJ3mAIei9ZMBPv+AVu6UzEK8NBaHtoP19Ue0Tu9DlturUtZomnTAxVdLJUu1R
         Z+BZm7tFWyLzP8zScUzDcVLIZLz3rN+rIqwVt62tJ/GQE8FuNl4hk2yqmFExwSmXBJjP
         Hvxg==
X-Forwarded-Encrypted: i=1; AJvYcCXLGKqHRenn95+DKfMT93tEzLGCRxr/kbDIDdxjeey8OMpKUjhckVcAbu/7x+uyPu4kKfv1XctJ4yxK6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcfqFoQvpeslSQy6B/oWRSGLSet8fnVnzG0YI35Ps8MwDBAevF
	hYI2kmY4+skcS19DUQmJ5IUbaEVRYYDi5bhwudKm6y9TCDqpUpW4rnclPEqeWFY=
X-Gm-Gg: ASbGncuVCindDKM2cAACS617lqNALBIM4dIaU5kYXNzC2tE0MkfFHmtwPfm+IuwfcRg
	0/3HfI1KCRXjvszmDNPrz8nR1K+w5RaMl/bKwjUgLzmzuHDsPu/rp+DE1oquGgfILI0n2FalweB
	jdG55JyYI6Yut1l70USNFtW1KT/MBE/2EdAJDMH2pcBxD6Sv96rx+DEUQ7RTM0gzbbR+gFfPgDW
	pcj8FEl13hY3j+6vXPTDrFkKXFSfWOhBLPMi3WuAWfq1wNf+JtpDsCL6ZHqjtfLn2gJqAtNhZgp
	NPs=
X-Google-Smtp-Source: AGHT+IEzAQsFVVUnarlp48IX+/exhmsTTctl6ss+iMEnk5dre6TgWISy267dYaDXt8LAjE4L45Tvqw==
X-Received: by 2002:a17:90b:3bcf:b0:2ee:b6c5:1de7 with SMTP id 98e67ed59e1d1-2f548e9872emr19653709a91.2.1736556426732;
        Fri, 10 Jan 2025 16:47:06 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a28723esm6064295a91.19.2025.01.10.16.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 16:47:06 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] RISC-V: KVM: Add support for SBI_FWFT_POINTER_MASKING_PMLEN
Date: Fri, 10 Jan 2025 16:46:59 -0800
Message-ID: <20250111004702.2813013-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250111004702.2813013-1-samuel.holland@sifive.com>
References: <20250111004702.2813013-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_164707_272704_8F826141 
X-CRM114-Status: GOOD (  18.30  )
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

Pointer masking is controlled through a WARL field in henvcfg. Expose
the feature only if at least one PMLEN value is supported for VS-mode.
Allow the VMM to block access to the feature by disabling the Smnpm ISA
extension in the guest.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  2 +
 arch/riscv/kvm/vcpu_onereg.c               |  1 -
 arch/riscv/kvm/vcpu_sbi_fwft.c             | 70 +++++++++++++++++++++-
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
index 5782517f6e08..5176344d9162 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
@@ -30,6 +30,8 @@ struct kvm_sbi_fwft_config {
 /* FWFT data structure per vcpu */
 struct kvm_sbi_fwft {
 	struct kvm_sbi_fwft_config *configs;
+	bool have_vs_pmlen_7;
+	bool have_vs_pmlen_16;
 };
 
 #define vcpu_to_fwft(vcpu) (&(vcpu)->arch.fwft_context)
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 93115abca3b8..1d2033b33e6d 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -168,7 +168,6 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_C:
 	case KVM_RISCV_ISA_EXT_I:
 	case KVM_RISCV_ISA_EXT_M:
-	case KVM_RISCV_ISA_EXT_SMNPM:
 	/* There is not architectural config bit to disable sscofpmf completely */
 	case KVM_RISCV_ISA_EXT_SSCOFPMF:
 	case KVM_RISCV_ISA_EXT_SSNPM:
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 1e85ff6666af..6e8f818fd6f5 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -68,13 +68,81 @@ static int kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
 	return SBI_SUCCESS;
 }
 
+static bool try_to_set_pmm(unsigned long value)
+{
+	csr_set(CSR_HENVCFG, value);
+	return (csr_read_clear(CSR_HENVCFG, ENVCFG_PMM) & ENVCFG_PMM) == value;
+}
+
+static bool kvm_sbi_fwft_pointer_masking_pmlen_supported(struct kvm_vcpu *vcpu)
+{
+	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+
+	if (!riscv_isa_extension_available(vcpu->arch.isa, SMNPM))
+		return false;
+
+	fwft->have_vs_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
+	fwft->have_vs_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
+
+	return fwft->have_vs_pmlen_7 || fwft->have_vs_pmlen_16;
+}
+
+static int kvm_sbi_fwft_set_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
+						  struct kvm_sbi_fwft_config *conf,
+						  unsigned long value)
+{
+	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+	unsigned long pmm;
+
+	if (value == 0)
+		pmm = ENVCFG_PMM_PMLEN_0;
+	else if (value <= 7 && fwft->have_vs_pmlen_7)
+		pmm = ENVCFG_PMM_PMLEN_7;
+	else if (value <= 16 && fwft->have_vs_pmlen_16)
+		pmm = ENVCFG_PMM_PMLEN_16;
+	else
+		return SBI_ERR_INVALID_PARAM;
+
+	vcpu->arch.cfg.henvcfg &= ~ENVCFG_PMM;
+	vcpu->arch.cfg.henvcfg |= pmm;
+
+	return SBI_SUCCESS;
+}
+
+static int kvm_sbi_fwft_get_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
+						  struct kvm_sbi_fwft_config *conf,
+						  unsigned long *value)
+{
+	switch (vcpu->arch.cfg.henvcfg & ENVCFG_PMM) {
+	case ENVCFG_PMM_PMLEN_0:
+		*value = 0;
+		break;
+	case ENVCFG_PMM_PMLEN_7:
+		*value = 7;
+		break;
+	case ENVCFG_PMM_PMLEN_16:
+		*value = 16;
+		break;
+	default:
+		return SBI_ERR_FAILURE;
+	}
+
+	return SBI_SUCCESS;
+}
+
 static const struct kvm_sbi_fwft_feature features[] = {
 	{
 		.id = SBI_FWFT_MISALIGNED_EXC_DELEG,
 		.supported = kvm_sbi_fwft_misaligned_delegation_supported,
 		.set = kvm_sbi_fwft_set_misaligned_delegation,
 		.get = kvm_sbi_fwft_get_misaligned_delegation,
-	}
+	},
+	{
+		.id = SBI_FWFT_POINTER_MASKING_PMLEN,
+		.supported = kvm_sbi_fwft_pointer_masking_pmlen_supported,
+		.set = kvm_sbi_fwft_set_pointer_masking_pmlen,
+		.get = kvm_sbi_fwft_get_pointer_masking_pmlen,
+	},
 };
 
 static struct kvm_sbi_fwft_config *
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
