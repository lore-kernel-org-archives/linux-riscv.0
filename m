Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8562ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 13:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSZNvIglDhD5rWpWsK1Zr6K9vLJpoyFF/kwsA8BD+bQ=; b=UHS3a0E1aXNeUp
	U1w2DayGs5qsd1pi413ns8EgpvW5j1WVOe4OnAZah1PtbqMpJXImuVLSYKPGJxFUR33BC0TjD9g64
	XAuzcGlALNcpkxuBix/+FhLufqlmHqCoAbWm+X+LjHck5/+HErFTpqCvmmiYWFxWpsbMTJLKzqS4l
	Me5djXJZpfijN/7Ztuve1rpvKU4qerjFyJTC6rE7vZba8Hsr1NT3u7v4crP9El7199tN3h+lZFNOE
	2VzwQ2rCmVE/Gvj36KZVLbGL7YH5kTbqfazInzSxB+7Kw1CWbR8d+QQ/LE3ySKXqSRVBzU8Fq4gv4
	Xe/8e4hbfml2NBJvap9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2YZ-00DJep-GR; Thu, 27 Oct 2022 13:04:23 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2XF-00DJ39-FS
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 13:03:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id h9so2097383wrt.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 06:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KS8Y5qGcq+TUeCm2VzHt6k1tiEHh3xZNsxJCuYP0OtE=;
        b=K29mJiHCubCTveiarEOUq2CVRHNeJSKN8+4a5Lc+cwX228AupQjsPwdjlP8mnDv00m
         iI/R842lfKG9eQY9fuoTZ6v6m546OWW4CNbfpuUfb0RoxYcap7vfmbBPZCheOiLLUfJ/
         qDePRCNA8JIcXaNOIZ0UUbfjQpsHt9SX0z/5rUqc4KSDFzmoJ1217vl1/NbG5Se4Pv2Z
         qOj9JTvNyK0f24BJ2SZ2iyeKKD9/tSkKhjhcIP2oFA2syix8ksb+N87C+sUwbKhdj0+U
         lo44ADmgyXQ7lh/Stu1rdxwXzljYxQ0TqLXRnztR44UcHRzduxOGbhfHRSz6i8/UxFXA
         5KUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KS8Y5qGcq+TUeCm2VzHt6k1tiEHh3xZNsxJCuYP0OtE=;
        b=NOR4JZqBSagwZMO8sUswsv6wIlL8WLaljRFANQWyBxrApDgGtUSs3HEdubfE4/Cyxx
         VFDEf+hqPhYB18XWLzGKXVN9Q5i/AuW8LI3JqA2IRoAQw9+WstpOWYtCQWYwrIDagXBX
         4nCtZ8cC2xZIEXQABJYzQ9FwsdTZSfEdpeP8qutMIvyn4HZukdXdqRrKC6z4R6UHenGG
         +C8Zc1sapZHOg12mZHrNpgGaWH1zc1E+zlVaoIu94KrAZzHKnWPHLZIx9sAo6EUIZ0dH
         /dFuOJFfWsxAkzPQrXFkr9VEjQIh06tE/MUgQyDWsIVrmVTA79auKUGaS+0ZBihPDn3X
         i1LA==
X-Gm-Message-State: ACrzQf3Pt3dnyvOrZkT1P3sEGpORGCj/vZ6P0BPAYaYd9Xw5gRaL5SXS
	7HLH2iaBF4Sp9CpC3HcATphhhoX/M4cIow==
X-Google-Smtp-Source: AMsMyM5qog3y7CoIBUY7/1O/pd/VFJ50AlErLBDW0eu0vaYNGmqAJfpZ8624Jz3nN/V5/sjMEcvqyg==
X-Received: by 2002:adf:e911:0:b0:236:73b7:e668 with SMTP id f17-20020adfe911000000b0023673b7e668mr12854735wrm.96.1666875777062;
        Thu, 27 Oct 2022 06:02:57 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c029a00b003c4ecff4e25sm1551492wmk.9.2022.10.27.06.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 06:02:56 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH 4/9] RISC-V: Use Zicboz in clear_page when available
Date: Thu, 27 Oct 2022 15:02:42 +0200
Message-Id: <20221027130247.31634-5-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027130247.31634-1-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_060301_545192_7AD8C2F5 
X-CRM114-Status: GOOD (  13.81  )
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

Using memset() to zero a 4K page takes 563 total instructions
where 20 are branches. clear_page() with Zicboz takes 198 total
instructions where 64 are branches. We could reduce the number
branches by unrolling, but since the cboz block size isn't fixed,
cbo.zero doesn't take an offset, and even PAGE_SIZE doesn't have
to be 4K forever, we'd end up implementing a Duff device where
each unrolled block would not only contain a cbo.zero instruction,
but also an add to update the base address. So, for now, it seems
the simple tight loop approach is better. At least we don't have
to worry as much about potential icache misses as unrolled loops
do. Of course as hardware becomes available we can experiment
with unrolling too.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/page.h |  6 +++++-
 arch/riscv/lib/Makefile       |  1 +
 arch/riscv/lib/clear_page.S   | 28 ++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/clear_page.S

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index ac70b0fd9a9a..a86d6d8a9ca0 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -49,10 +49,14 @@
 
 #ifndef __ASSEMBLY__
 
+#ifdef CONFIG_RISCV_ISA_ZICBOZ
+void clear_page(void *page);
+#else
 #define clear_page(pgaddr)			memset((pgaddr), 0, PAGE_SIZE)
+#endif
 #define copy_page(to, from)			memcpy((to), (from), PAGE_SIZE)
 
-#define clear_user_page(pgaddr, vaddr, page)	memset((pgaddr), 0, PAGE_SIZE)
+#define clear_user_page(pgaddr, vaddr, page)	clear_page(pgaddr)
 #define copy_user_page(vto, vfrom, vaddr, topg) \
 			memcpy((vto), (vfrom), PAGE_SIZE)
 
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 25d5c9664e57..9ee5e2ab5143 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -5,5 +5,6 @@ lib-y			+= memset.o
 lib-y			+= memmove.o
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
+lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
new file mode 100644
index 000000000000..cafa24a918d6
--- /dev/null
+++ b/arch/riscv/lib/clear_page.S
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
+#include <asm/insn-def.h>
+#include <asm/page.h>
+
+/* void clear_page(void *page) */
+ENTRY(__clear_page)
+WEAK(clear_page)
+	li	a2, PAGE_SIZE
+	ALTERNATIVE("j .Lno_zicboz", "nop",
+		    0, RISCV_ISA_EXT_ZICBOZ, CONFIG_RISCV_ISA_ZICBOZ)
+	la	a3, riscv_cboz_block_size
+	lw	a1, 0(a3)
+	add	a2, a0, a2
+.Lzero_loop:
+	CBO_ZERO(a0)
+	add	a0, a0, a1
+	bltu	a0, a2, .Lzero_loop
+	ret
+.Lno_zicboz:
+	li	a1, 0
+	la	a3, __memset
+	jr	a3
+END(__clear_page)
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
