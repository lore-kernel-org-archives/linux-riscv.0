Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A38EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 07:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=biBKmM2ZZI6tJiRxAdfIZ9hEwOoevRNhXWq2s7olPpo=; b=hlf05B775t+//I
	0ZP+phLh1U1vXJF35s3DcrgN2KjCrrxNkrML3DeyUbPwRnMPfFUZ0IDklYqZ8lnb9VHpAXA0Gqmew
	GAenSSzvaDcwLLc5iEpq0mqJlr9E4ivKu+tAFQE5xQOenPuCPIHK/Na5U/AN/3dgSx51AKCVplFz/
	0DyXFTZJNN6NniA57p8i0YTFl87EAJS7zlpjbJLaG4XMPev4u1VldQIFRKfEcwbkubkpxmakAeTSr
	w2dcwqXjPJj17YMGT4ZN0Hn4Rgi5eBu4sHDNVibVjpGB9JP/R8orj30YgU3E/aHUy/FZiEkl06kJl
	ziOOCewzVFnr3jhTfJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hUm-00E19T-29;
	Thu, 15 Jun 2023 07:34:16 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hUg-00E15Y-1i
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 07:34:13 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b517ee9157so2340095ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 00:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686814449; x=1689406449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5HbPVR3QtNXxU1oKHkD/V666BtdibNb7IDtcLf2Zqk=;
        b=KIN1D7FID2JoNlDH8zGF4bkh2OCtJTdH1POzUKXCdInIE6fpu38dhi8pwZLanO/eFa
         VzXCrDUEf5hhdTHu0TZr3iVwRi9OQtSumjS9PKZSj6A5UdojcJHtY/wWY+mPfWQQ7jrW
         sopEXgToYFzpCh9PQzUgj+/aDA85niWpcabbBpemUrsdbIqb7ViqrdFweXQAyoad1W+c
         /1jGNK4aqPvp5yjD1NOAsrMDtFr7lEO5JnraRTPPIwynEFPZLUa3b32r/mAiL4YeIjcG
         yJjNaG4gmSXWsO+tvWLUiE1jFsDIZ2UigSbTJnmRztc653D4YDyIVLdxTeqiN8JiXFH3
         sQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686814449; x=1689406449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5HbPVR3QtNXxU1oKHkD/V666BtdibNb7IDtcLf2Zqk=;
        b=PBz8yg5mlislAdh5NO7tP/rLw4U7y84byxgmMe4qyPO0OO6Lsx5iwFdjJKZofVGGex
         R9y1JeLXvXsY9o2IWkkxOrpUmKk0EAB9mxdfEke04RrHEAVSIwH8ynyspnlEw+/VgHIW
         IR/BUSxp2pOvrNWMGqITVaZHArG3giI0Y5avm5+9VHVSCUxjXFatXL0eDJFRClT9XihP
         4SWbtHTW9ybOYkCMSRBjTOpnKU/HY274NLkewFzK/Y1yn8btYjmOhjfwUOMOw+TyNOmk
         gjQujM7pfue+muhc2dSvTwdv7HwqpgLkkD9T+LUYLgwBLCA54aX0S/GGo1cPM0OvGFJ0
         05Qg==
X-Gm-Message-State: AC+VfDyvobZ6S7jM8pvrZLj9z/qPjmdpTtYA7GtkeHNflE4JRf+gl4VZ
	1biUveWTxYcAyO6OZuCMdKSi4Q==
X-Google-Smtp-Source: ACHHUZ4WHHdbev9KkvtpUlC2u1yPsievjxeS0pSrfXL0jG8l30ecmSB7b61z1U+MRLZr4dJIybMHtg==
X-Received: by 2002:a17:902:7597:b0:1b3:bbe3:25a8 with SMTP id j23-20020a170902759700b001b3bbe325a8mr10233865pll.55.1686814449238;
        Thu, 15 Jun 2023 00:34:09 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id ji1-20020a170903324100b001b016313b1dsm8049855plb.86.2023.06.15.00.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 00:34:08 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 02/10] RISC-V: KVM: Add IMSIC related defines
Date: Thu, 15 Jun 2023 13:03:45 +0530
Message-Id: <20230615073353.85435-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615073353.85435-1-apatel@ventanamicro.com>
References: <20230615073353.85435-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_003410_570846_0F7C3D54 
X-CRM114-Status: GOOD (  13.63  )
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

We add IMSIC related defines in a separate header so that different
parts of KVM code can share it. Once AIA drivers are merged will
have a common IMSIC header shared by both KVM and IRQCHIP driver.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_aia_imsic.h | 38 ++++++++++++++++++++++++++
 arch/riscv/kvm/aia.c                   |  3 +-
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_aia_imsic.h

diff --git a/arch/riscv/include/asm/kvm_aia_imsic.h b/arch/riscv/include/asm/kvm_aia_imsic.h
new file mode 100644
index 000000000000..da5881d2bde0
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_aia_imsic.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (C) 2022 Ventana Micro Systems Inc.
+ */
+#ifndef __KVM_RISCV_AIA_IMSIC_H
+#define __KVM_RISCV_AIA_IMSIC_H
+
+#include <linux/types.h>
+#include <asm/csr.h>
+
+#define IMSIC_MMIO_PAGE_SHIFT		12
+#define IMSIC_MMIO_PAGE_SZ		(1UL << IMSIC_MMIO_PAGE_SHIFT)
+#define IMSIC_MMIO_PAGE_LE		0x00
+#define IMSIC_MMIO_PAGE_BE		0x04
+
+#define IMSIC_MIN_ID			63
+#define IMSIC_MAX_ID			2048
+
+#define IMSIC_EIDELIVERY		0x70
+
+#define IMSIC_EITHRESHOLD		0x72
+
+#define IMSIC_EIP0			0x80
+#define IMSIC_EIP63			0xbf
+#define IMSIC_EIPx_BITS			32
+
+#define IMSIC_EIE0			0xc0
+#define IMSIC_EIE63			0xff
+#define IMSIC_EIEx_BITS			32
+
+#define IMSIC_FIRST			IMSIC_EIDELIVERY
+#define IMSIC_LAST			IMSIC_EIE63
+
+#define IMSIC_MMIO_SETIPNUM_LE		0x00
+#define IMSIC_MMIO_SETIPNUM_BE		0x04
+
+#endif
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 1cee75a8c883..c78c06d99e39 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -15,6 +15,7 @@
 #include <linux/percpu.h>
 #include <linux/spinlock.h>
 #include <asm/hwcap.h>
+#include <asm/kvm_aia_imsic.h>
 
 struct aia_hgei_control {
 	raw_spinlock_t lock;
@@ -364,8 +365,6 @@ static int aia_rmw_iprio(struct kvm_vcpu *vcpu, unsigned int isel,
 	return KVM_INSN_CONTINUE_NEXT_SEPC;
 }
 
-#define IMSIC_FIRST	0x70
-#define IMSIC_LAST	0xff
 int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 				unsigned long *val, unsigned long new_val,
 				unsigned long wr_mask)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
