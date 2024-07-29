Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A30C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 20:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVdIcRdjCyXnJ40fuiniZUWyWC9T4B2CMiCr+IgV+Ho=; b=y8FTqWqTiIvm/N
	ElRcyQe4BjtSacDZMWdj5GpoMP+1YG7rU/BQ4Q4bnZVNHomfoitlENF6bn9OND8BdX3GY9I+knFkk
	KGhAdvNjkTs2Be4j0rX8u8bK9RJq57FUYcKiTHTHK+PehUArcDiYKmEMoZ4gYB/8208edzVHEbYe+
	8lb1vaO2GxblL1sYMmxLE23sDur72iZuht5cAY1yaByubdc1N4L/CuOSV1zajOELyyj45r/IOR1KW
	qs/+0YDATZjpBTNwKe3djf+ioRZqYJ9wlwYtK2ULl3ztnJOgm4xgzuYrdkf/IsgtV+8CF1gUT1f8O
	VK7eZJlO1E5ft01zaCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYXKT-0000000ChRU-2ON5;
	Mon, 29 Jul 2024 20:50:49 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYXKP-0000000ChQM-1NQS
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 20:50:46 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-70d2d7e692eso2915378b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 13:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722286243; x=1722891043; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjuJiVps1krVsumKp/stss3kNN6dUsP3Lcn41G8nO8w=;
        b=XrEs8Sg2o/Sx7KCsYAK2rHH/TCah9wliIHL3l1sJm5/agXT9nk6jM5prH/jD+Pvnpj
         8oyWZJMOOp/fSl8vVPFCu1zzqhGFIi4Dr0KpJU1bZ9QC/+VNAFIKEi2GROgAKDluLMXv
         M1zQxaep+ew3t5NMeeR/UseHE7ljYhXnFNP4gTocWVNjZO/Zy4vyS+AhRToNo6qjdEa1
         USgcWOWEAs2LsOcQvcmieUcXtqveJa9mls6O4qbl7mHI+nc72VVSPSoxwe9sXSwcrh/o
         YcvR7az5BbzM+XKmEuSZbM4dU1mmBQgnlkYnvx2yDTFKQiN47G0LoNOPq4w1ILX1lZLC
         bE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722286243; x=1722891043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjuJiVps1krVsumKp/stss3kNN6dUsP3Lcn41G8nO8w=;
        b=FXnOP58MI7+S4Zx9dFRLuG+gZ/68PBvdm6F8oYENswxZYniunW63wNSggeRiVXC874
         KpJRavoZH5A/S+ipsWy+8DBJ+BH9JNDk84YHdCqTK0CoVj7eLsVtJyQ3w28y5U4awRG4
         7N2EppTSr5rIzi8t+1EH4NHwez5ulB6AEfkO/SoQy3TyH4NS71dSLFFJxpTpC/iUSZ9L
         vN8QoH23z8wslqg9VcIWt1Cquu+C6rkcLPHyh5HjmZdBfO6FejAjKk1oCiGPKsM3/qRx
         04vj2qwl9fgdPGHKQVT1Lx7KPeh6A3Mzh+P1Aza1hALGTAvMBDoxBp728GuL/hIIQIRp
         UeHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR1W5G86OYd9PZ/HuhplSP+ibW48heQDiAWEwSHEwu0nivylADu6fPhGWrCGCpiyg9iahOxqHtGew4zWPDCovQWY1t8z1kRd+VLM6w2rC1
X-Gm-Message-State: AOJu0YyCooMltXfcVpQdfaWyu1sq1DaXo/QCgCADaKDsdTMdxCFOxty7
	CBi7Az65xTAgk6LSZXPjpqxLmq8UpspcczIzs7uX6okgR+PFZuP0ZiwrR6Wb8OsGMAkRRkW3qVO
	d
X-Google-Smtp-Source: AGHT+IEpqSsl++rfk1+CEHWhr8c9oyUyyL6jaX25l669XC3xLwKl86BtTsjs3IN8jI5Bla88QbQ4DA==
X-Received: by 2002:a05:6a00:1826:b0:70e:8f30:23e5 with SMTP id d2e1a72fcca58-70ece9fadd2mr7742896b3a.1.1722286243357;
        Mon, 29 Jul 2024 13:50:43 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead72ba2csm7454541b3a.93.2024.07.29.13.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 13:50:42 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 29 Jul 2024 13:50:35 -0700
Subject: [PATCH 1/2] tools: Add riscv barrier implementation
MIME-Version: 1.0
Message-Id: <20240729-optimize_ring_buffer_read_riscv-v1-1-6bbc0f2434ee@rivosinc.com>
References: <20240729-optimize_ring_buffer_read_riscv-v1-0-6bbc0f2434ee@rivosinc.com>
In-Reply-To: <20240729-optimize_ring_buffer_read_riscv-v1-0-6bbc0f2434ee@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrea Parri <parri.andrea@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722286240; l=2916;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=QKbLeMMF7mDpLciQBgmaXsS7vFL+LO6R6LtddSUAdz0=;
 b=DmS39ks98S5E4C7fyFQXUee4PXBbUbkym1O5X/y/kETBBNioDUh0xCScGEAxSYNTxY88MmkcI
 65hWlx6D9yrBKizG7yXcAyOKvEOsqOzs6Z0GU7bH+EeCeyfTRmJAsHQ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_135045_404345_BBB447F3 
X-CRM114-Status: GOOD (  12.45  )
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

Many of the other architectures use their custom barrier implmentations.
Use the barrier code from the kernel sources to optimize barriers in
tools.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/arch/riscv/include/asm/barrier.h | 39 ++++++++++++++++++++++++++++++++++
 tools/arch/riscv/include/asm/fence.h   | 13 ++++++++++++
 tools/include/asm/barrier.h            |  2 ++
 3 files changed, 54 insertions(+)

diff --git a/tools/arch/riscv/include/asm/barrier.h b/tools/arch/riscv/include/asm/barrier.h
new file mode 100644
index 000000000000..6997f197086d
--- /dev/null
+++ b/tools/arch/riscv/include/asm/barrier.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copied from the kernel sources to tools/arch/riscv:
+ *
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2013 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ */
+
+#ifndef _TOOLS_LINUX_ASM_RISCV_BARRIER_H
+#define _TOOLS_LINUX_ASM_RISCV_BARRIER_H
+
+#include <asm/fence.h>
+#include <linux/compiler.h>
+
+/* These barriers need to enforce ordering on both devices and memory. */
+#define mb()		RISCV_FENCE(iorw, iorw)
+#define rmb()		RISCV_FENCE(ir, ir)
+#define wmb()		RISCV_FENCE(ow, ow)
+
+/* These barriers do not need to enforce ordering on devices, just memory. */
+#define smp_mb()	RISCV_FENCE(rw, rw)
+#define smp_rmb()	RISCV_FENCE(r, r)
+#define smp_wmb()	RISCV_FENCE(w, w)
+
+#define smp_store_release(p, v)						\
+do {									\
+	RISCV_FENCE(rw, w);						\
+	WRITE_ONCE(*p, v);						\
+} while (0)
+
+#define smp_load_acquire(p)						\
+({									\
+	typeof(*p) ___p1 = READ_ONCE(*p);				\
+	RISCV_FENCE(r, rw);						\
+	___p1;								\
+})
+
+#endif /* _TOOLS_LINUX_ASM_RISCV_BARRIER_H */
diff --git a/tools/arch/riscv/include/asm/fence.h b/tools/arch/riscv/include/asm/fence.h
new file mode 100644
index 000000000000..37860e86771d
--- /dev/null
+++ b/tools/arch/riscv/include/asm/fence.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copied from the kernel sources to tools/arch/riscv:
+ */
+
+#ifndef _ASM_RISCV_FENCE_H
+#define _ASM_RISCV_FENCE_H
+
+#define RISCV_FENCE_ASM(p, s)		"\tfence " #p "," #s "\n"
+#define RISCV_FENCE(p, s) \
+	({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })
+
+#endif	/* _ASM_RISCV_FENCE_H */
diff --git a/tools/include/asm/barrier.h b/tools/include/asm/barrier.h
index 8d378c57cb01..0c21678ac5e6 100644
--- a/tools/include/asm/barrier.h
+++ b/tools/include/asm/barrier.h
@@ -8,6 +8,8 @@
 #include "../../arch/arm64/include/asm/barrier.h"
 #elif defined(__powerpc__)
 #include "../../arch/powerpc/include/asm/barrier.h"
+#elif defined(__riscv)
+#include "../../arch/riscv/include/asm/barrier.h"
 #elif defined(__s390__)
 #include "../../arch/s390/include/asm/barrier.h"
 #elif defined(__sh__)

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
