Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE72C87FF1
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 05:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdMo/zlk2A82RuW4wB/o3C5BVxDwiG8l2QpgEctVJDU=; b=y2IBiY2iIyMSS6
	+jokINoO0spMApARWs5GPoG7EWs2bh3G01x6zZ87KvBu6Blg7tmV5d0o/A00coD+Z1XfrcZhPjXW1
	BUHhbC1niOeWt6OntxMI1X9OLlRi9F7Um8cGeUryhrHNy4fKCEen+IitmgGcQTypKPqDdYCQ1d8HV
	NsfVKw/ndffLwg+FmHAYgHJI7vx+W3fr3yxwwfov+XFHAy0jnC7ZoU4THEJqwQ3UDv6cSzqUqO0r4
	2qn5wu6lDfvWiWp5uIsG0s3VScOBjAlFgRwpHgNPpT+oGZrMm7zVuo8+l0iCoTHrpjYG2GLjVLJLV
	6nCtXOvkjjGn1fIi918w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8aHZ-002fhp-02;
	Mon, 12 Jun 2023 05:40:01 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8aHW-002fgg-1O
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 05:39:59 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1a2c85ef3c2so2490735fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 Jun 2023 22:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686548398; x=1689140398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5vQwpyR3/1vG/MlBdXYEenCvwMIo2s7ZFYf5nDLaQE=;
        b=ZyfxYqMM0W3OMxKPrxCUyAqJqZUedm09S/hgWYlTNUjmk1lt/PAZaWYOl3RBSjc3P9
         fLE+te6gevh1tGcgCGwh9pomh5vVqWVYR3SNK2c9a0Jdrmjqu7U/DicwzwaIHUDPa28R
         fT6PmcP7ePMJzzNJ7aMJOTayJNr/QVRovWdVgI7Auw9we1utiIUWQ85Dj7azGba8Hfu9
         eaqOZAJsYaDPjr6V/5iIcAeZ/sbTUvbB3XzUTicbdtSix0e+hbEZ9eF4vwXrac+eURtM
         GGjvFB6wf12a9Ioal/9mRjwRH/ONVGnlZssqpD5jsRfnhuLoTuXZ9efsPSJMqJoYudBE
         MBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686548398; x=1689140398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5vQwpyR3/1vG/MlBdXYEenCvwMIo2s7ZFYf5nDLaQE=;
        b=Yfxvk1/oiWY0d2dLOS97zxLyHrnr09HwEUP0/Gn4ZFJKxFGHXHOMlfWmQO67tDyMGF
         BfeeVDPHtSMChVI3W9G3lyk+heqBqP52sgUyACUB2uOE/kEnrmxHK4D2DCHk4/h5KF0s
         DLAiXRjY32zThBrCcrnsaWHj/Wy0gHgqsQ8xKgo7BQqY4x3oaPnFWuf6yN7RXlnuQyAk
         RFWiFOP2GydzwOmFXQxyCMyEr5rOYCI5kswvxsT+slCQHbSP2H8lWaCRp7V48A3kNcRC
         gQW835PG0JR8M8wakm3lBA9wQ8LUN5M56cCHk2y61omBky3BRHykWk1TjiVfgja2rKHY
         hyIw==
X-Gm-Message-State: AC+VfDx4YoB/i044YUyRiq01KMjO7BFfMk5Vtixtj1Oem/C/kayCAKEK
	rI73PidBl33e7twfqRlWDZggtw==
X-Google-Smtp-Source: ACHHUZ6hNnfLTutLBApy3ZYFF4oPh2xc1Whmz0Ha4z6+g9y2w3zVx0DmRzQWRqL7d3LLjPWIpK+MxQ==
X-Received: by 2002:a05:6870:8544:b0:19f:7917:fe5a with SMTP id w4-20020a056870854400b0019f7917fe5amr4409038oaj.46.1686548397700;
        Sun, 11 Jun 2023 22:39:57 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id lv19-20020a056871439300b001a30d846520sm5534869oab.7.2023.06.11.22.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 22:39:57 -0700 (PDT)
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
Subject: [PATCH v2 03/10] RISC-V: KVM: Add APLIC related defines
Date: Mon, 12 Jun 2023 11:09:25 +0530
Message-Id: <20230612053932.58604-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612053932.58604-1-apatel@ventanamicro.com>
References: <20230612053932.58604-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_223958_473909_0A4E012F 
X-CRM114-Status: UNSURE (   9.70  )
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
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
