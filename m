Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699F6C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 10:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Drh1jXSNSgR0iW81BbGi7hEsYkHoftFjR4uXZxb1xvE=; b=LwB3ABfYKKwqLz
	S1N3cjhFmLMd0HEB6U2/UGT4OIRf2ZNVfdmuP15mb+FMTieq9B8WIF3gyrqnqMnJ0YhJEtJQO+psk
	g3GTxubtyFkcr3Pj5y5YpmRTrQfc0betiAqx6gmiQwLbeqJ6XPofTEqm03DhtajMLXn5tPfgDJFeZ
	oCIkfwMJqjbh1+wtjITWBOOkuXP8XxAzj8xeXPgjmDBgumtIe87KGOA1gAMrwk4ZioX6lSZqmZLaZ
	ZqaXRUs0wtedJTfr3tIcFWqtvQxJUi5wwj85JeHrxHrdTZ67+b69mPQiS7PTH53oIBtbfQK6uVlj3
	cnrKRKt/oHmICgcJoq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzElF-009UIo-0H;
	Wed, 17 May 2023 10:52:01 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzElC-009UFH-2w
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 10:52:00 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1929818d7faso10239117fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 May 2023 03:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684320717; x=1686912717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWDvDGT5NL3iW1eef6ejIvc5+67Gu1+G2Yy7gp150jQ=;
        b=IS/C/kvEwn8nYqZffOgr/UmUvVnAnK38KjYZRCOuwXqefKKTx2MUhrNuZuT7GAONs0
         kJoRSpdIlqn8qx9s7x30PhqBrSJ0rWHsyV4YkjRN9ZhFEWgNRJzP9gayTje+LuGOJUBP
         AfiB9ZrYgBWqDkkHss2HcRlbM2kakkCL4wLU1VMM4qOL4fSjWvO/KvSPFxWoqkcMMsEA
         YCXwCptXzH3PImewq10sTEUsqWvZyfS86WBuGidvVh3RS9v/LjuEfODUjcMMfpl9rYCo
         g73uI/HNIc/nrxNBF582fFXIGOloLUI47p9Z75hsFMoMK5K4ISAuYjXgHADbUUN+mP3u
         ugjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684320717; x=1686912717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWDvDGT5NL3iW1eef6ejIvc5+67Gu1+G2Yy7gp150jQ=;
        b=FWOz9nSGyfd3G9I40OfXPMNFrN+aTz+k1tbW4w42P6wx9eJdL6n7hkNGlWc/OIQDZz
         6nOg6PwFXFyfZMFkjyuItr9FwOJ1Dvfkt8DaVLvXwyAWv4sgdSGwNuB8+VK46D3f5ojm
         Rqe1FU2ounzt3+sYPDcNUKIRphAAN0Divmz6kpppQc77uhzpZqyFSAxWMwK9WyDssExl
         ikTrsmIcEbbz/ZhLCKY/r5HEBMI64k7wdMypQI7iBT+eQRbWj0gNwSKzaCqpVAIUBn4V
         gNFWd0r/m/WCkmchIvC7M8JwX/FCx4/bTAK+9tH+g9KZq6DjGA+JqLaChbTQfL7AcSVC
         kUag==
X-Gm-Message-State: AC+VfDzRcRlxHnbaBTsTjkDcvEGL9zXkJp2GHMTBE9j1w+S4Sf6oOlud
	3qM0+qRNprfxoPqc40O6BZ6Hbg==
X-Google-Smtp-Source: ACHHUZ6ZsuXeHA2QKOJ6UIrVrK/VpLJT9CeWAGiHYwlEQtTyFlMxnWQIfB5QkPlSQUOEV7cCsrdDzg==
X-Received: by 2002:a05:6830:22c8:b0:6ab:641:8e19 with SMTP id q8-20020a05683022c800b006ab06418e19mr986463otc.1.1684320717587;
        Wed, 17 May 2023 03:51:57 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w1-20020a9d77c1000000b006ade3815527sm2279896otl.22.2023.05.17.03.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 03:51:57 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 02/10] RISC-V: KVM: Add IMSIC related defines
Date: Wed, 17 May 2023 16:21:27 +0530
Message-Id: <20230517105135.1871868-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517105135.1871868-1-apatel@ventanamicro.com>
References: <20230517105135.1871868-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_035158_950882_CAACC76F 
X-CRM114-Status: GOOD (  13.57  )
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
