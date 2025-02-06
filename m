Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA3FC0219C
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 13:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CpayLh6Bylagktyphl7eGvKaGazJgi4upaK0MHXt7o=; b=C85Y/BUZekGkji
	+S5pdA7+aQmMFF1gIoJRFf9jfCMWSY76Q8aus4DNtXn+cI9lf12CTH0cb6cUyFoN2ryXsmuTmkeQp
	IftOoqsGko6PldyCpCleF8z3pEZIuK1pcWq79x9y+uEsNXzdKgRGYE+7B0XSmSYvEKht2Lrc/F1Q/
	hv6vWMGn54LZiL/ziY08M79DAU7naRd5x8ET8P2YgyAWeLSZG9bUOc7zy6Vkbyz+T/GWIebMY+9hh
	PCpu6x5wZ7LXqrU8KlhFHHV+Y3fDdTLqU3BbQlnvXI/TNqxb/y3kCPMsrHb0OD92NHVnRTjd2T5Xv
	pZe99Yu/zLztrWj4txpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1rd-00000006Pgl-1N3m;
	Thu, 06 Feb 2025 13:24:17 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1no-00000006Obj-4BHc
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 13:20:22 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21f464b9a27so3346705ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Feb 2025 05:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738848020; x=1739452820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrDRN4Xst5SkS3JM77fVw4KRP+DFTnf94c/mEjZvbjk=;
        b=OQ4WCtThuG30x0NNwZ+mGtrPJQY4ASXg6YBsLzofHR1q2xkZMmgr9W9RdL0Wfq+gKO
         AsvJDVw9wcz2oFe2wtvfVxoCd4HgxVBvxZGOta7hDMqMlAIpTHIRJQ8urieGp6opSgaJ
         Yr9JJtvHWnXoRRceIIm7MDe8X8d3D5poXW4msTzZZRi/OZtav3DopfAzf4mO9+9Uyn6N
         yOg5ncj5uIvYtIvOWQnRIgoVvvDX8CsIR8HaDBWrwAyi7IEev2o9C7jcI6zFEawDxLMU
         9v633yHEZOaD9R3xYsbnQ7MpY0XU0TSLuYTyqmCptgjgQ5DhO6bz17eBqH/ilijTYFov
         Kp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738848020; x=1739452820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrDRN4Xst5SkS3JM77fVw4KRP+DFTnf94c/mEjZvbjk=;
        b=k+FXFfUYg8jlwxSv6lcQN00Guyr+YqRaab9SMGTZrpBO4E9TYT5/HAHZR8oNagbg6S
         yk6WaeztHjfQHHCfFhv5MnGO1O2IyByiyLB+lisfliTcDu9hLQjojkkpgID60YbpVUa9
         LzRreFczwBQ4ISs9MHk/OAuwIhdHWEdxlGWiTPksZ+w4foR2vh3pEMZpg0Da6PmRK5u9
         Sm//1fDBj3PFhuQs2lAexdJuRsDeA12Goazf2L7IiVlyjreUHMlgaHji6dxJ+0UY9RJB
         08B+lCUwReC6TyWbSw8Kpz3gBVgDoGqNPsnbNbprSYvn/wuIQzXKfP5nUMuNHaWx/Iuc
         2d4w==
X-Gm-Message-State: AOJu0Yx3llcYNwGvnzhY8nV+qbidzNkB0YbioPv1FvvnPyDV+435F8Wo
	eIIvR2dbYNV4hJSUQmLDwegSnCaUPmO+OiZLfh+5lJuphW435RZZFJAK6NFK7C4=
X-Gm-Gg: ASbGncttjYFbBLxDdS8UI0fLroR6NyAIRKJRr1yv1zmvgBE1Bn+KqW1bL6XEyezmI5O
	9cveCo1HhCU3A95t1LpJr61ika2xYV5trmmp+AkAtl3QQ+DUcDVpI2WzwxESzCdML1uV9zJyZmY
	4ZB77jEd/MswvnNPasuSAR+ey7uLxibQx9LqmOPMRiZjhk1AqzzX2UiKQsVN3bQ9Fzl6CH00pks
	9cI9OxKlk8K0aLvbaQZeKToQ820EVkqi/9XJ39CMtYd10AwEBLzwn5tCmQYBXvoNZax6EqPGN0H
	Ow3sJmXsIUiIobZQQQ==
X-Google-Smtp-Source: AGHT+IFoKcEdPqNHWZEzdZAOUsizoappgIzPDtN89x/XcnGf3N+z1xzF2ftk+OYeq3D0U9lyU9Xq3Q==
X-Received: by 2002:a17:903:2406:b0:215:8dd3:536a with SMTP id d9443c01a7336-21f17e2a49fmr111715285ad.4.1738848019982;
        Thu, 06 Feb 2025 05:20:19 -0800 (PST)
Received: from L4CR4519N7.bytedance.net ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d987sm12170775ad.120.2025.02.06.05.20.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Feb 2025 05:20:19 -0800 (PST)
From: Rui Qi <qirui.001@bytedance.com>
X-Google-Original-From: Rui Qi
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	haibo1.xu@intel.com,
	guohanjun@huawei.com,
	sunilvl@ventanamicro.com,
	samuel.holland@sifive.com,
	parri.andrea@gmail.com,
	ericchancf@google.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Rui Qi <qirui.001@bytedance.com>
Subject: [RFC 4/5] RISC-V: ACPI: define arch_apei_get_mem_attribute
Date: Thu,  6 Feb 2025 21:19:25 +0800
Message-Id: <20250206131926.91289-5-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250206131926.91289-1-qirui.001@bytedance.com>
References: <20250206131926.91289-1-qirui.001@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_052021_033775_FB67290E 
X-CRM114-Status: UNSURE (   8.50  )
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

From: Rui Qi <qirui.001@bytedance.com>

we need arch_apei_get_mem_attribute to get protection bits
for a given physical address. These protection
bits are then used to map the physical address.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/include/asm/acpi.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 6e13695120bc..c35dd4e5a84d 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -90,6 +90,24 @@ static inline void acpi_get_cbo_block_size(struct acpi_table_header *table,
 
 #endif /* CONFIG_ACPI */
 
+#ifdef CONFIG_ACPI_APEI
+/*
+ * acpi_disable_cmcff is used in drivers/acpi/apei/hest.c for disabling
+ * IA-32 Architecture Corrected Machine Check (CMC) Firmware-First mode
+ * with a kernel command line parameter "acpi=nocmcoff". But we don't
+ * have this IA-32 specific feature on RISC-V, this definition is only
+ * for compatibility.
+ */
+#define acpi_disable_cmcff 1
+static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
+{
+	return PAGE_KERNEL_IO;
+}
+
+#else
+#define acpi_disable_cmcff 0
+#endif
+
 #ifdef CONFIG_ACPI_NUMA
 void acpi_map_cpus_to_nodes(void);
 #else
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
