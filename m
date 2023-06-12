Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA0EC7EE45
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 05:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=biBKmM2ZZI6tJiRxAdfIZ9hEwOoevRNhXWq2s7olPpo=; b=MqpeL69X77QK8k
	TOTaprDGZWufuRL9SyyJLRUBsEzWvj+RHdWRN/qP3UOYcEG8pxz/BXrrArfEKhqrGTOpisSmi5nnj
	GUTe8/xhjx7aPECGtEjMnv+n7fS2EJwyRP04nu8NEK4/UqpLbZ4E9DXxW/JGjle7Bld/k0snuISt4
	ZZ2aMlSr6KyQ0MLg0Xe2jpWiAeL64UtkVf7aNJSEF2R8UCbiskL88oqh6BBmkd1HaKEJ5PbI1TWCF
	YbyMm7Pl51C7BjlzweUpUI/v2KETdBxcTslTPVESb+rP6Bofskg0h7u9lPD2K4IpcvS3chZZu9pra
	vbHbN9QHWs5wbUrkfnAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8aHU-002fg7-36;
	Mon, 12 Jun 2023 05:39:56 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8aHR-002feF-2o
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 05:39:55 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1a1b95cc10eso2450423fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 Jun 2023 22:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686548393; x=1689140393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5HbPVR3QtNXxU1oKHkD/V666BtdibNb7IDtcLf2Zqk=;
        b=QajJYa9QoTEHD/yYxnDPcawzXqqnQnmuLT8Kw8H/4KK2ECidGvM36nKjdds7OJR+sn
         yC3LsW02F/8LIl44ONYuLP/3OOk+vtePSdreKkGHTpGBMhn4osn68ugx/We//EpvXTsy
         DDa8PThHxL42OrPjon69ohpU9grQHjHifSKpePc/uLGxZz9DrEEknKxGPkQUMeaISzaU
         jIJH+xXUFXJflGXD1mLLWBQKvGzZG6wmPOd0U1SpFqGRp5e7A1c9cGXQkoXCs1IfC0x8
         PWkKpU4O3gkB5Gu56BrmqIcnb0cltpjtKcH6szWt8AWbKcgIHNVB8N29V0saGTN53/Zw
         4AfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686548393; x=1689140393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5HbPVR3QtNXxU1oKHkD/V666BtdibNb7IDtcLf2Zqk=;
        b=GjVtmBZQKqp6irLscGfUJc0dRU2YWtMxiOoai9MaYHBRTsZPi8WNwDyaCS34/OzdY6
         zXFtKlHODoiF2sL6uuNWq+hGvBduSYBDUZdGdWIrB7yCCTn/d7y0Ikk2S6x4ctcdzdVI
         MErdOK+O4VcHNNPdj73hLUdzCvtKz7d5auWFasFnBhRFOMJZ8s3DWVtgybQcL3ot0njY
         qOPbjtucfMktmxdNWoltrAShcGkUwkPTxGBSY1zT/+twhAHTefw8nJ2kv1+EdjdcvEWC
         sSWy6Sj/7g+R2hIf1YGfxOk2d6Q+H4BWCLNyuF7QxRVOwYJdhvoVK4zXx2fjHOTaVEgM
         gzVQ==
X-Gm-Message-State: AC+VfDxtybUDn7vBkygzwZfVrbEvCxRPZv6vZGtOZIjm+m3x7iB+v6FU
	eH83a5PwOQXc1SpLpL6OrHPOtw==
X-Google-Smtp-Source: ACHHUZ405rOJxSDSxLbeGiqOzwinOWwn+/amhGI3Cdn79CxDkbbvcTTQFANnLEtHuYBSlFaqJ0cJPg==
X-Received: by 2002:a05:6870:4c3:b0:177:dfdb:63 with SMTP id u3-20020a05687004c300b00177dfdb0063mr5371977oam.44.1686548392701;
        Sun, 11 Jun 2023 22:39:52 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id lv19-20020a056871439300b001a30d846520sm5534869oab.7.2023.06.11.22.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 22:39:52 -0700 (PDT)
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
Subject: [PATCH v2 02/10] RISC-V: KVM: Add IMSIC related defines
Date: Mon, 12 Jun 2023 11:09:24 +0530
Message-Id: <20230612053932.58604-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612053932.58604-1-apatel@ventanamicro.com>
References: <20230612053932.58604-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_223953_911690_172BE0F9 
X-CRM114-Status: GOOD (  13.31  )
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
