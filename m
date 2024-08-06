Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA7AC52D6F
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 22:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hiYlzzUk4NuaoNcMcGsW1XMKAw7QFJN00jSwM5DfAsk=; b=kuej1V75OFDD/+
	ZtJbtiSXWPRpSERKXGgI343OhilK4mPkONGbwsqIfDGm3hF5H51HsayfSHU9UlNIbNwkePR6E2fw1
	cOB52VcgxQsi1VEYCVi00j/fxwU+B4U/6NB3MLooO9uVeH+AbbE1vUeeuUWW73VNdhLBAtCDNhmLs
	Y/z6Ut1b1D5iMltQLvDQIrFdB85ZyPve+i/NFq5+gfPCOEF0X88QnjPdAxyY44cugazSmUjb/ah3I
	YYMTGpVnb8igyU+uecTBbLFxiqT4UySnHM3304Q/uVHLUgn1BDeyIZJVroNBIWsHZn/CQ033DIoWM
	p7dqWpOwczBX7Y0RPZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbSFM-000000034UE-0wWn;
	Tue, 06 Aug 2024 22:01:36 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbSFJ-000000034Sn-0efB
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 22:01:34 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fdd6d81812so9824515ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 15:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722981692; x=1723586492; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mDFCS+qNW1uU6SrPB2NVd/Hs7xE2LjNwlpXcQuHr5E=;
        b=aSjRb1jHxL3IiBkxsHzApvoyPHHT5XRRhq8oWtrBufrTE87+NNP3apYd2GRHCSm8P8
         YB79EEEyUml6h0RiLh2Hn5FU601zDxsgJvJEHKfhobjDCco/75JB37+LuewJG7U757XO
         XEngReizGyt//SjDvqqncrvGuDu4tkckt6A3ss7IZ95PIGvT5Q9hJ6wXBFjj/HtxSq+3
         aBfqwWHw+ceLsCpubAkv98rluD0IDUwVUCwfa2FbyUtGlO4X6Pum7u5rE6pnH/JyptVq
         wjinB5+N9ZWRPXvsi7/aOswZYH0ky0pCg03hZi+uwDXUKCmfHLPZm/rj3o7lp+z72hu7
         3i9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722981692; x=1723586492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mDFCS+qNW1uU6SrPB2NVd/Hs7xE2LjNwlpXcQuHr5E=;
        b=wzl4+g7GIoIQVXdY6niT8bAyXz1yzHSxLQMD9OTMfjI/7Bi+nCUZAkHKOnlzZeCQxR
         bQYduR24sJyzM3YFCsLKgrKRpwz2x9TF4ERO0EvXZtXn47ozAcrOQNgbwrBg1ZkkO3SP
         Dc/6B6iQ5pR2q/zEDaX9MJAoke4hM7Gkoh3Qyotp+GCsUqscKqavQwrcxQkw9VvKLfLr
         2R9dVqP/IRLOmr9xpvdVoa/lqugSosAz5uZ2RBHqyUl+2E19g7oozQGxvh5xU6iWIeWM
         vpYs7xHMviL+Hd1mTEVukF6rrtSeIatxaAZa3h53Zxl7KuKP1DM1Yh1odVE4R47p9ZGI
         QZiA==
X-Forwarded-Encrypted: i=1; AJvYcCVK/81Np/qRkSzl6c3qaHNSnjKoCMtQbQr0ZjBQ0MWqPD+nv20so57C1bnRNG5xdaU8Xbh4jzrVS2gUAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIi8L7goQEniu5whca1VgyVMUbo8N0zjEdJPAWXVvjIfg8fGyN
	w5retMEXj5RvLQyzPAUHJua9wEFnE2ib0ktMR4ZLJwzS6+R1SkRJ6O899mVqnXM=
X-Google-Smtp-Source: AGHT+IHMDVM8yOtme1xU83E6UMVWq7phAYmH7RVRK4k7pmLlbIHTJUgxcAviBQUeH1SmZurbZu5n9g==
X-Received: by 2002:a17:902:e547:b0:1fd:684f:ca72 with SMTP id d9443c01a7336-1ff57281a68mr187939795ad.25.1722981691868;
        Tue, 06 Aug 2024 15:01:31 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f27340sm92578425ad.17.2024.08.06.15.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 15:01:31 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 06 Aug 2024 15:01:23 -0700
Subject: [PATCH v2 1/2] tools: Add riscv barrier implementation
MIME-Version: 1.0
Message-Id: <20240806-optimize_ring_buffer_read_riscv-v2-1-ca7e193ae198@rivosinc.com>
References: <20240806-optimize_ring_buffer_read_riscv-v2-0-ca7e193ae198@rivosinc.com>
In-Reply-To: <20240806-optimize_ring_buffer_read_riscv-v2-0-ca7e193ae198@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrea Parri <parri.andrea@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722981688; l=2969;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=URNOWa0wGNT/osRHjiDRfU3UakHqE6IDtJDz1Q6bAqA=;
 b=Ox3MskkYW1G2EGWoBhbYzqpgqaJJhHmZFbKUWYHIa6zsjdc17EQvwOkVJEfD6unJtpK9tGoBr
 8i8Va7rmqxKDeNNd9lt+EZTE/qABfyeWCK4qH7r14Mit3lFzk8B3VWB
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_150133_313158_CBC811BB 
X-CRM114-Status: GOOD (  12.47  )
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

Many of the other architectures use their custom barrier implementations.
Use the barrier code from the kernel sources to optimize barriers in
tools.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Andrea Parri <parri.andrea@gmail.com>
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
