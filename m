Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDC4EB64DB
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 07:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdMo/zlk2A82RuW4wB/o3C5BVxDwiG8l2QpgEctVJDU=; b=MLX8ZE+3GrGjhb
	Am+Oy8fh7+2cT5/wa16fs38QqecRyhZ+FW1bhhQhtT+Ut9szd3EHkRbHgeWlXfN31GVfD2mwbjpvE
	lOp/Od5Dq/UpHBYyrFRLD+FmDgkBqfQOWkX24MYsID9u1XrtDa9eN/AmwLrqR0PLnkhgs2LLQZMpk
	VxOykVPex7vkpTNVs92tuW7Zh53q4xK/lJQMnLgIo63Xl6P5wFvkihcNhntTrXbSFE1gWB9lmAaRy
	y13amB6E8BhncQu4akPVzIGiBWUoUZ4GwubtTFhXcOxD5dURKtbzKoGYZPVYIwjtv4ESgo2sJb+/X
	WVq10YkgkML2zzhrl9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hUn-00E19v-0p;
	Thu, 15 Jun 2023 07:34:17 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hUj-00E176-04
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 07:34:14 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b3a6469623so32767015ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 00:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686814452; x=1689406452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5vQwpyR3/1vG/MlBdXYEenCvwMIo2s7ZFYf5nDLaQE=;
        b=Wzl1Ykl8eOwlw+4AW6ewSJO4VQKgM5N7dvFdKlOR/mSpdA9DgVny251fYxrcO4DFzv
         MP/TXjrazhukelqOeBJ3uKasUkan0XMgyw3oWWGVRZYofoYEs1lSpHrd/oDdvSlpxeA8
         gR/9L6uWDIbVgO7ai5ZqsjIKYPkf2Sl7MZVmYuwRXya1nKZPH76w0/i542oR8dqr8uN6
         qke9O+CV/kW5+Mw9EwbSRsqKtQPbAWRxkqgr9thgAWqyOmOR6vJaCVocIISUHTzJXtOz
         WW0CJCPdeVFlmV7TE4bDABAR5DULT95/FIy3T/RsQtvRwytg6TQ+38dJWHV6vhKdF6vo
         Fjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686814452; x=1689406452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5vQwpyR3/1vG/MlBdXYEenCvwMIo2s7ZFYf5nDLaQE=;
        b=CH7p4Y6omGEOKlEk5JxJHB6wlP1OS+M8V6t/UX6Ii7jiDAKp17ahHABZ7EXjdamVNu
         7hYQLIUE7ZDAi0a+xIyYik29XWOxzNb8pXcXuilTlyrdW6aQw88vcs4RllTgsKsqdLep
         FhLbTUIXmD8hScfn73wjZ2+2cHN3slP5KbD5toKAaX6KL+In6AGrcsB0gNsQED5FMj6j
         fbj3ECVwoJgeKi+eqzRunjli0DI/Qq2q8CEszB/rMS0GKg0CJ9H6NdiTRUYm5iHCXdko
         SvrMGRZOukh3mpOuHYU8TF+YFiXTe9qahb50crfWXkHeqSAnyMc0XFU6XHCN72wK6k8L
         wpMA==
X-Gm-Message-State: AC+VfDxybG8MLx1xajYubPXQDqwYawUxhNHRLtFkDvArsydyOHJHeu5/
	hm4kLC6Czj7BYoLMIx6BtvKgZQ==
X-Google-Smtp-Source: ACHHUZ54Z0ylk6QSHwqf8Rx/bzJHljB9afofIvFuNZQdqnZxhtOQfU7vwzkuSAjx7/MXeqngk3V20w==
X-Received: by 2002:a17:903:54:b0:1af:cf34:a645 with SMTP id l20-20020a170903005400b001afcf34a645mr10978937pla.21.1686814452521;
        Thu, 15 Jun 2023 00:34:12 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id ji1-20020a170903324100b001b016313b1dsm8049855plb.86.2023.06.15.00.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 00:34:12 -0700 (PDT)
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
Subject: [PATCH v3 03/10] RISC-V: KVM: Add APLIC related defines
Date: Thu, 15 Jun 2023 13:03:46 +0530
Message-Id: <20230615073353.85435-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615073353.85435-1-apatel@ventanamicro.com>
References: <20230615073353.85435-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_003413_076301_3EA1389A 
X-CRM114-Status: UNSURE (   9.92  )
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
