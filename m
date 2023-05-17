Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C47AC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 11:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYh7IsgOut2f9zbmkxnoih9Bfbiuk0SoY+WPGVEJflE=; b=iuLl64jMh10bnL
	WDt9R8+JbvlMdmYe892n84T+XPpJZwmfefRqaWS9RekMLcVL5XXeZnJDIMZkNgubIj+LJ8soGpV99
	8kyz1Ejz2x7R/yqARfAGt6OBFJXl3HOdyrQjSRNg6CBfiddLfDeoLnABJHtjYqus4M2qsm4YqWlhW
	KNnj8vQcHBFOVIkyVKfVcqmGxe8DOtZPtIzq8Z05j32gZYt1gIOPHC8PujrlXcqeDHmeuwQXAWGJ2
	VltcP4kmlmdCZcUGi7baVbJtAz6BZKlNroyq2V+WZJbLguJhDDkhGzRow0zukjZ8atbWpNu0tPo80
	TibiQOBIS+61PTWCajcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFW1-009dpY-02;
	Wed, 17 May 2023 11:40:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFVz-009doq-2J
	for linux-riscv@bombadil.infradead.org;
	Wed, 17 May 2023 11:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cHvC3XUJE2v3T7O+M+Nn9D7CQdvc+SW83AHyEO9FlG4=; b=ntSytbQpOqBuDiSGa4VCpyoOZw
	Kmo84Su0750ll3efVH3YoCsZjlIGFQE5oexzzxLPEpdBQTCzHViQFehEMMSUwVF5KVCxZXx2P636q
	t0BZZVTNEcMW1KXDFzMHdB5jC0WCjtiEU8JPbwDPIHGuprTQKKyz7IaD+Bvq88kO1sKrgGk/H/Dyn
	sndN7GmbbQkzAoa5rHNCPeYgmzEqfw+fZjRVfPCUEl/8aDP8pLKWu71NSf+2GwBn/QZeRpHE0/cdv
	+U7rZUfSg0YH7/YIKDVWKXOwBgO/dsJKBgn78+N9o2K6Plkqh0/EIHm4555YoTkbTqX/DodeXUhPB
	yI70EXGw==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzElO-00DCGx-1I
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 10:52:12 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6ac8ede63ccso498412a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 May 2023 03:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684320722; x=1686912722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHvC3XUJE2v3T7O+M+Nn9D7CQdvc+SW83AHyEO9FlG4=;
        b=mT8PGLXc0NBj0MLl2MBwociLi8D+TVgcuJPdFV0aJli30czNDGI5rO0Uw1CVc8G/8G
         +tB88zucpow+02IdPK6I2aQ5pgINRhnnC4vpQMRqzsPGOf1AfER/5yi6RYZ1CIAKuOt6
         XZlX7c07t0AeJrr809nyrDV2/3s2XvNbTiIyRdoBDxhpIfsOrpM+AdyBT7hx0Xx8xfxW
         a+Hulgq/lPZiLIR+BD7mW3ywkyCU0Kg9eSnlBZn85I1jWmz6KXHn6lSq6+Kr6VH6uJaG
         ikNYrkLRCmz7UA4G14aRHaFwspuPNrJ5qVEAESMbxtqAOQvNhC4XTiy//am29wHHoqiL
         r2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684320722; x=1686912722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHvC3XUJE2v3T7O+M+Nn9D7CQdvc+SW83AHyEO9FlG4=;
        b=mDR3MXoBELGsMoez/Mcltoo666/F7WlNlO5pKNg6mP6AKJSe77B3V8TFSG7/Oms1/p
         HGGE6i4wvep2qyoWo5M7hZIqATm3U4Piy4HVXZj77KSQAl4KyfQLIxfO8bK25PCmfdDJ
         tvNbvyUwS5MMzeosANodye4r22O8aZnUwWgO5jZ5tiUNpwqHSJjfs/ujNVuy6lPHDchE
         jTzqSZlmwO5gmB0RGT1VMb118QQZL+VvUj0YG9RspNi5DJ9HKRm8CEVrj+Hk42AaDqMl
         BxOEIxHNejJqBvqF+QlG0G54l+XmgwtHZu03boV1GlJzgqgzM00JB1GKdHJ6RdetQSIj
         sXOg==
X-Gm-Message-State: AC+VfDz+MlW9dbyuYPN90ZPfUh41/KrmvvmZdiqjLknD0Rjpex6HIqwc
	bSCpLRatyPkz8oNVrlbTRkLXLA==
X-Google-Smtp-Source: ACHHUZ7BKVi8bZ+sm2ebgy/Qq29+28cr+vSclh/3yoQT4Y125ntV1qhwamJ/33isZ2ldBiFMTyZ7Yg==
X-Received: by 2002:a9d:6396:0:b0:6a6:4a28:dcb0 with SMTP id w22-20020a9d6396000000b006a64a28dcb0mr14576552otk.21.1684320722389;
        Wed, 17 May 2023 03:52:02 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w1-20020a9d77c1000000b006ade3815527sm2279896otl.22.2023.05.17.03.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 03:52:02 -0700 (PDT)
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
Subject: [PATCH 03/10] RISC-V: KVM: Add APLIC related defines
Date: Wed, 17 May 2023 16:21:28 +0530
Message-Id: <20230517105135.1871868-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517105135.1871868-1-apatel@ventanamicro.com>
References: <20230517105135.1871868-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_115210_589189_D299BB9A 
X-CRM114-Status: UNSURE (   9.81  )
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

We add APLIC related defines in a separate header so that different
parts of KVM code can share it. Once AIA drivers are merged will
have a common APLIC header shared by both KVM and IRQCHIP driver.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia_aplic.h | 58 ++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 arch/riscv/include/asm/kvm_aia_aplic.h

diff --git a/arch/riscv/include/asm/kvm_aia_aplic.h b/arch/riscv/include/asm/kvm_aia_aplic.h
new file mode 100644
index 000000000000..6dd1a4809ec1
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_aia_aplic.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (C) 2022 Ventana Micro Systems Inc.
+ */
+#ifndef __KVM_RISCV_AIA_IMSIC_H
+#define __KVM_RISCV_AIA_IMSIC_H
+
+#include <linux/bitops.h>
+
+#define APLIC_MAX_IDC			BIT(14)
+#define APLIC_MAX_SOURCE		1024
+
+#define APLIC_DOMAINCFG			0x0000
+#define APLIC_DOMAINCFG_RDONLY		0x80000000
+#define APLIC_DOMAINCFG_IE		BIT(8)
+#define APLIC_DOMAINCFG_DM		BIT(2)
+#define APLIC_DOMAINCFG_BE		BIT(0)
+
+#define APLIC_SOURCECFG_BASE		0x0004
+#define APLIC_SOURCECFG_D		BIT(10)
+#define APLIC_SOURCECFG_CHILDIDX_MASK	0x000003ff
+#define APLIC_SOURCECFG_SM_MASK	0x00000007
+#define APLIC_SOURCECFG_SM_INACTIVE	0x0
+#define APLIC_SOURCECFG_SM_DETACH	0x1
+#define APLIC_SOURCECFG_SM_EDGE_RISE	0x4
+#define APLIC_SOURCECFG_SM_EDGE_FALL	0x5
+#define APLIC_SOURCECFG_SM_LEVEL_HIGH	0x6
+#define APLIC_SOURCECFG_SM_LEVEL_LOW	0x7
+
+#define APLIC_IRQBITS_PER_REG		32
+
+#define APLIC_SETIP_BASE		0x1c00
+#define APLIC_SETIPNUM			0x1cdc
+
+#define APLIC_CLRIP_BASE		0x1d00
+#define APLIC_CLRIPNUM			0x1ddc
+
+#define APLIC_SETIE_BASE		0x1e00
+#define APLIC_SETIENUM			0x1edc
+
+#define APLIC_CLRIE_BASE		0x1f00
+#define APLIC_CLRIENUM			0x1fdc
+
+#define APLIC_SETIPNUM_LE		0x2000
+#define APLIC_SETIPNUM_BE		0x2004
+
+#define APLIC_GENMSI			0x3000
+
+#define APLIC_TARGET_BASE		0x3004
+#define APLIC_TARGET_HART_IDX_SHIFT	18
+#define APLIC_TARGET_HART_IDX_MASK	0x3fff
+#define APLIC_TARGET_GUEST_IDX_SHIFT	12
+#define APLIC_TARGET_GUEST_IDX_MASK	0x3f
+#define APLIC_TARGET_IPRIO_MASK	0xff
+#define APLIC_TARGET_EIID_MASK	0x7ff
+
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
