Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3DBC7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 10:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqKysOAPGPvsl1jNkxSPTw98cBZe8MAjj02if7vISwI=; b=hqX4oxa8oFYZWL
	mexlQ7tIuGlXIdbARxiJ/QvNFTxKNvwcVZXI3Hg3kdF7qvKCI6OF/cmgBf73/57x2sGtY/g1YJIPT
	vhMC2q/i9OrGFsacZ17cG7JYgerzJS7MzvDBHu3NvoSkdAJH0LnDcwL0/bhFQn+1IoprW/JpfshiT
	LKYgQUHzRrIdFxmcmY/Q2QsJKLvt2Q93bJbUFJABmwCUey8qE6EX2DIxtZCYlSOqiKB1ESAuTvRfh
	DydALVzxbsdmnAcxIoEy14yjYE+mEz4kddgp6So20d3+Z8g5+SM4XTvh7C1GEzGQOZdzQBXboskrc
	2yGn4SJtX/rLXH9dMvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKcx-002sk8-2g;
	Tue, 09 May 2023 10:31:27 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKcu-002sga-2e
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:31:26 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-64115e652eeso41439800b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628281; x=1686220281;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4wVUwbllopTYZd/z7ThVFHG6Y+HYlXfckIEwVQA59q4=;
        b=YFflHspUoG4IQZzhTqmkxe4jAME+zJXqS9gGObv2f/9PFDQX/NYcr92ec8WgV28bHQ
         rNQKUwbFypLF6UkQqN4f8NGQpgHEH/SqQPbY9euSlQ1ybdvw6irMxYNLMdJ7plsU2Frl
         rPEVpbi8yylEEMZUH6szSeGPYyK+I3qkfSuxMsKUgefWBbpr+JUjIKfTcO5lR7N9PLNs
         4dLYdUWpP9L2Mx8TWXUr72S5iOO6PHnhF/H0xhtKBA0vH3sFANyFMXFUsJ2pzZFRIsKn
         qspvyIv33X+EvVcwVkj2EBZ39Hcu0geeAsgMOjSuXF8Dug/7ECYIg4dACSCFCAQnnSL5
         khEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628281; x=1686220281;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4wVUwbllopTYZd/z7ThVFHG6Y+HYlXfckIEwVQA59q4=;
        b=T6AclFLU7M6fgDUEQ+MaE3wDAMfHBgaOi8+bcW4fboEpnY0APvewcp7dWhoG3T/yMR
         YgjH95q4rMTVHepaGM+2gGxOV4Wd3a8iwZWhAUzZwtAJ3Z+PjJQchneRwiGaPgtVZqNI
         f9s9Dpz9b+36kLIVC36nhEim3Zs1sOBtLo5eLjylm/2FrflCD1N6XTZ06DLyrw4HV4+f
         SQLDp18jcxPd6oB9nyea6GO0KeZwQxRszPNYz9p8bkIRC3axUnPOQVp/EWfb6fG35ngz
         OB/VD9//0DvYiMz4Tjp2m6KaVtIAB3wrUpaSbMqQcsMkv8nZPilBSi2/mzbojPMIATaM
         O5Zg==
X-Gm-Message-State: AC+VfDxUAnn9hJ6cwPxU3J0xyIWxzpbS++kO0hKpnlWEz5utaXcwZmyG
	8IDPpWmg0p+2b/b/0+xvMQdK7qvBF5WF8nJdcHsfiJIQ0LPqm6QDY84VyIu3Z/a5HzzzpHjJBqZ
	4pjBUbWHXSzQulReEqlEJasaLNncncjIJzfT6duy4ngua6O7mnBX5UlQIkFkhp80BImosonaDam
	CeDOH/orO2nDBB
X-Google-Smtp-Source: ACHHUZ4JxML66lwMZryjBkK8ksZcrYdSxtkYiYRybmZPkELVtHptGkcR2ARRq1p9JuDBnBhlRU+O/A==
X-Received: by 2002:a17:903:338e:b0:1a1:cb18:7f99 with SMTP id kb14-20020a170903338e00b001a1cb187f99mr11478595plb.30.1683628281230;
        Tue, 09 May 2023 03:31:21 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:31:20 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Guo Ren <ren_guo@c-sky.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH -next v19 02/24] riscv: Extending cpufeature.c to detect V-extension
Date: Tue,  9 May 2023 10:30:11 +0000
Message-Id: <20230509103033.11285-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_033124_861433_29241F62 
X-CRM114-Status: GOOD (  16.36  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <ren_guo@c-sky.com>

Add V-extension into riscv_isa_ext_keys array and detect it with isa
string parsing.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/hwcap.h      |  1 +
 arch/riscv/include/asm/vector.h     | 26 ++++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpufeature.c      | 11 +++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 arch/riscv/include/asm/vector.h

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e0c40a4c63d5..574385930ba7 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -22,6 +22,7 @@
 #define RISCV_ISA_EXT_m		('m' - 'a')
 #define RISCV_ISA_EXT_s		('s' - 'a')
 #define RISCV_ISA_EXT_u		('u' - 'a')
+#define RISCV_ISA_EXT_v		('v' - 'a')
 
 /*
  * These macros represent the logical IDs of each multi-letter RISC-V ISA
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
new file mode 100644
index 000000000000..427a3b51df72
--- /dev/null
+++ b/arch/riscv/include/asm/vector.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2020 SiFive
+ */
+
+#ifndef __ASM_RISCV_VECTOR_H
+#define __ASM_RISCV_VECTOR_H
+
+#include <linux/types.h>
+
+#ifdef CONFIG_RISCV_ISA_V
+
+#include <asm/hwcap.h>
+
+static __always_inline bool has_vector(void)
+{
+	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
+}
+
+#else /* ! CONFIG_RISCV_ISA_V  */
+
+static __always_inline bool has_vector(void) { return false; }
+
+#endif /* CONFIG_RISCV_ISA_V */
+
+#endif /* ! __ASM_RISCV_VECTOR_H */
diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index 46dc3f5ee99f..c52bb7bbbabe 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,5 +21,6 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b1d6b7e4b829..7aaf92fff64e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -107,6 +107,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
 
 	elf_hwcap = 0;
 
@@ -267,6 +268,16 @@ void __init riscv_fill_hwcap(void)
 		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
 	}
 
+	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		/*
+		 * ISA string in device tree might have 'v' flag, but
+		 * CONFIG_RISCV_ISA_V is disabled in kernel.
+		 * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
+		 */
+		if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
+			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
+	}
+
 	memset(print_str, 0, sizeof(print_str));
 	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
 		if (riscv_isa[0] & BIT_MASK(i))
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
