Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E1DC46CD8
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 16:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KhAhVqV8K6rWhJhDhHQHWb9cYT3/yIcTlEOHrdf0stQ=; b=k9qRCBxUFN5JbS
	ZOyjuyDpYMNhQaGpuPEDbdd0jmdwnUBQCEp/pHRYefU7ZxUnNHe3LG45e+G32VhnvFWxXVHCZtW5P
	DLSl9m/knH2LGd1LrpDNQMdDiTcrJX0dtuWNi9B339polUokIpCfi5MW8Z+7kJuHCBb0bouLeJrJY
	NmghJA1hE169cafzEALPc+oOA733mfNnnKstTn0UgyThiiw2pium/7uymYvba8oEJfK38JBSCswaO
	mtvXsSWrLrikcUN3YH1JsrVNLBTthEyQ/ei9Y8NmhfnGv5vvTDmmboojQPfbGCN4xirzAmi/Ql+qb
	sfKZvbwcoer8Ed3RCNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFz0K-000MTx-1r;
	Wed, 20 Dec 2023 16:01:04 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFz03-000MBI-2n
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 16:00:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-336746a545fso589896f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 08:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703088046; x=1703692846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62TTtkxd00oH+oWvK2W/ODaQKWhDhsp3HCJ4KK5vX24=;
        b=ZY8xoQQg5leI4FIHNLvA8699CujfuWq2PZzcUkZyQw31ynreI6dxtJeoGlUMHLpGo5
         ReXTnmx86UBdHg2CGC/c7q03ebIuS3FdhNvWTm+0FVnlatsygwz25JvLdeOaqy1s80jW
         91M2GqTOHrs/zTSpRuzoqmdxAG0MYkW1iPeMmMzkFF3oQkDnHyx69Mv/HSDpCexArAFF
         h1XtkwYqjScvatG1JLmnz9NEu6Lj7IWoe4LBlRti3Qce4IoPMLYE2jFDZ9/p7/rlQ/g2
         IX9G4EVxT6bZJslgzobNV+IWYHSCPPzCzK3W9Zi71vijWnhJ5XxqsRDhhqM1v6yRSMa2
         xYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703088046; x=1703692846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62TTtkxd00oH+oWvK2W/ODaQKWhDhsp3HCJ4KK5vX24=;
        b=EbR5dFU4mnhsriMHb0RcjR8iD0bCWA+8pQ5NI3qKlOlnZmtmbKDRmPp1/Bsxbauyyi
         HR1y4bgptxghC6/geI34LHUfjVVtD4isf7MlYhHR/8lWTHdo0HT/KXSPwFrCdsHYKeBr
         4Efqpjbib8bIY3QW2Ww7WPdPBGR/mcbE4b6W59jFNiOIJcVCjMrpZyoNCUEXazHVGsaQ
         Tarx0yQvuc0ov8hC4FLaAf/JZhfXFY0TxDutv0cW/Rbvz/dGnFlITLPYSA6k/jnEAtuE
         FE6x9BqlD/PkQqz1Q+9ovcnkNuRdGtQEmj2XEA3788b5RNZucG+VR4qvd2rogU2YLnhp
         0QCg==
X-Gm-Message-State: AOJu0YyzLPWKdLbalXP/LCH4pdWKbkBGg/8hZIiaJtm8FWzu3MAJ2uiE
	q3i6O5QysEqxakY5y7cPUDfNfPSeHAktfw==
X-Google-Smtp-Source: AGHT+IEEMYELu7/A+1G49HQKJD0DCWws+PGCbWuHkMwSf1zShbkZAUEp29RUgz8Y81u0XEfxyO2+Uw==
X-Received: by 2002:adf:ec04:0:b0:336:7bd0:479e with SMTP id x4-20020adfec04000000b003367bd0479emr589222wrn.26.1703088046506;
        Wed, 20 Dec 2023 08:00:46 -0800 (PST)
Received: from localhost (cst-prg-16-115.cust.vodafone.cz. [46.135.16.115])
        by smtp.gmail.com with ESMTPSA id k17-20020adff291000000b003367bb8898dsm1789906wro.66.2023.12.20.08.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 08:00:46 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org,
	conor.dooley@microchip.com,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 11/13] RISC-V: KVM: selftests: Add guest_sbi_probe_extension
Date: Wed, 20 Dec 2023 17:00:24 +0100
Message-ID: <20231220160012.40184-26-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220160012.40184-15-ajones@ventanamicro.com>
References: <20231220160012.40184-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_080047_967138_112EC8E4 
X-CRM114-Status: UNSURE (   9.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add guest_sbi_probe_extension(), allowing guest code to probe for
SBI extensions. As guest_sbi_probe_extension() needs
SBI_ERR_NOT_SUPPORTED, take the opportunity to bring in all SBI
error codes. We don't bring in all current extension IDs or base
extension function IDs though, even though we need one of each,
because we'd prefer to bring those in as necessary.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/include/riscv/processor.h   | 21 +++++++++++++++++++
 .../selftests/kvm/lib/riscv/processor.c       | 19 +++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index e70ccda2011b..dc50ad62e150 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -108,6 +108,17 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
 #define SATP_ASID_SHIFT				44
 #define SATP_ASID_MASK				_AC(0xFFFF, UL)
 
+/* SBI return error codes */
+#define SBI_SUCCESS				0
+#define SBI_ERR_FAILURE				-1
+#define SBI_ERR_NOT_SUPPORTED			-2
+#define SBI_ERR_INVALID_PARAM			-3
+#define SBI_ERR_DENIED				-4
+#define SBI_ERR_INVALID_ADDRESS			-5
+#define SBI_ERR_ALREADY_AVAILABLE		-6
+#define SBI_ERR_ALREADY_STARTED			-7
+#define SBI_ERR_ALREADY_STOPPED			-8
+
 #define SBI_EXT_EXPERIMENTAL_START		0x08000000
 #define SBI_EXT_EXPERIMENTAL_END		0x08FFFFFF
 
@@ -115,6 +126,14 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
 #define KVM_RISCV_SELFTESTS_SBI_UCALL		0
 #define KVM_RISCV_SELFTESTS_SBI_UNEXP		1
 
+enum sbi_ext_id {
+	SBI_EXT_BASE = 0x10,
+};
+
+enum sbi_ext_base_fid {
+	SBI_EXT_BASE_PROBE_EXT = 3,
+};
+
 struct sbiret {
 	long error;
 	long value;
@@ -125,4 +144,6 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg3, unsigned long arg4,
 			unsigned long arg5);
 
+bool guest_sbi_probe_extension(int extid, long *out_val);
+
 #endif /* SELFTEST_KVM_PROCESSOR_H */
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 6905a4348380..7ca736fb4194 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -393,3 +393,22 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 
 	return ret;
 }
+
+bool guest_sbi_probe_extension(int extid, long *out_val)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, extid,
+			0, 0, 0, 0, 0);
+
+	__GUEST_ASSERT(!ret.error || ret.error == SBI_ERR_NOT_SUPPORTED,
+		       "ret.error=%ld, ret.value=%ld\n", ret.error, ret.value);
+
+	if (ret.error == SBI_ERR_NOT_SUPPORTED)
+		return false;
+
+	if (out_val)
+		*out_val = ret.value;
+
+	return true;
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
