Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE7BC5B555
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWWG94+wOWe/CBWTyxUl1cWNBJXktrreSzmZg8ExIDE=; b=zw1O6effcne6+h
	MXAsFprYpFIK5HRS9jsZi+T6Ks9a7SWP+TIzKAtxHQA/FhcDgmJf5Jwb5ESjrXQxAZkU3qosVHZjS
	7ZopaPLZBDWbhnUpcJqBk9096VSWSDyiNlHpdTkP926u+LRF7CqqGXvEuNZbgfipnAMdIOMCKsz7N
	kjcEl8lPJBcNvPhWNBG6GwrUbV5sejDyeoJgkHVqdvQiwoQIoLbNW3qg1+5/Rdwz/mMdFrYcGLQBb
	FUsNnY6G7AT42N++DMca+EHdE5HHxnuOcc1c02qyVcBJHZMdSDbYQDdLmLiej7DHN0084+trkOHY1
	oePVHJESah3LniSYfdnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXQY-00000000Mvo-1RJV;
	Fri, 06 Jun 2025 13:48:10 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXQV-00000000Muk-3HdO
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 13:48:08 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-742c3d06de3so2458935b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jun 2025 06:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749217687; x=1749822487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbLXfMia3LGx0x5vatzlSPOE+phQVH8WezZPhdpMpIw=;
        b=HU8N3faL3jXs71Os5GpASUaiia+OhcL779P4HWND0mxxV+yCVFpvVqNvDmtGjmFw+d
         JRXWOeMEem65qLK8A8lqex7lBN2cuvRaVzrnTrhtZxG0LjQLdnkJjPyHS/QS9TSkvUPl
         TK1ogNTy5/WpHHvgLsoD/hPMHTSWTgsMCbeaYC9URL5t7JvkCSrdefscU6AdhW/cAFxY
         PO4jqgGXPGGyFsPH6wG/DbUAzONrQvIOdpypG5c5mYUdlMq1/E6MuEz3/FvHrPYJ+4De
         i2DUkPi2X8IludskhmzMcHDCaBEDrzVGaZGDiTNC65pYRu21TIiZA7hkjDEMreaI5XTy
         xkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749217687; x=1749822487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbLXfMia3LGx0x5vatzlSPOE+phQVH8WezZPhdpMpIw=;
        b=WMSg0ZLdGCiFO/0e7gJljCTScdLTqP4RTzoANzrpeYZbE2ZSgzAkJKT5axDp2riSZz
         tS5d/Z6TZesBP2d49ZU16s0towcH8K7QeldUkR9XymCOorR4KmecHRDgUvmdzu2+zWmL
         ow7q+J4micEWKQOv52+gCO5wlrP4c21utDsGdpBdmjZtT+3NnQWgab6xHDplrrKUR4A6
         QTqm/BW64SMFq5IsJjKSNhBtr4JNPM+pymhhkIUN2cb340rbYjsaJw53Q48HQEzMimF1
         uatfxmtU3T4J3Qkr2uFieuLVWslzqp09FYT80fG/gtObA7wppGJ/TsRuZ+dw/rebjQzC
         ohrg==
X-Gm-Message-State: AOJu0Yx/xudE4EwFklz0vTaJlYzsQlA/jMDjYNSDYU+ik5B9EtegPJsm
	XCIBONIIKECS5QtAsfvtMooIet4FVwQBJYdnos23mBK5505moqIdl9LK
X-Gm-Gg: ASbGncvGFoquwZedZq4NEKN6mIjxewRYlUdvCuWg0SnIhwY/RoLL2izdMZUZH0i6NLt
	1bT9SGivzAkz2FVJ/3FC43kfO0sPo5bDQue+KPBdDgc4BnmfpUcI0d4ZVIxJU40Qh0xi91AJmy0
	i5kOEIDktbJBqlsJ1uHZ/XHaZVJZ8R9loYQVR72lsIENkvm9eeqTmpwZKHQCEkRID1N/orsuUQT
	3RAtjKS5QuF70bSN60nSFJcJmgQCrOzUGf3U+cmNSLIaSwrSCh6nzrXSb64Ng8a91wmPLzx8kTw
	xnR5WMYhO1eW68SSuY2HwQfRkZ0+tgv9vJ8+E8bqim40meYnCyhWfF2E9aeokUe7SrIMrSBiO4T
	Dp3tKCLA547/nCslt
X-Google-Smtp-Source: AGHT+IEWQEWWMghu/cP6dwFr5jCrVGt0sZKMZoG/iTAmXCUcpXkPFPhjT4lzx4jV92YNz8SClJVpsg==
X-Received: by 2002:a05:6a00:4884:b0:748:3385:a4a with SMTP id d2e1a72fcca58-74833850decmr553711b3a.23.1749217686884;
        Fri, 06 Jun 2025 06:48:06 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c1168sm1296798b3a.136.2025.06.06.06.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:48:06 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v3 1/3] lib/math/gcd: Use static key to select implementation at runtime
Date: Fri,  6 Jun 2025 21:47:56 +0800
Message-Id: <20250606134758.1308400-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606134758.1308400-1-visitorckw@gmail.com>
References: <20250606134758.1308400-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_064807_820955_EF63D0F2 
X-CRM114-Status: GOOD (  15.01  )
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

On platforms like RISC-V, the compiler may generate hardware FFS
instructions even if the underlying CPU does not actually support them.
Currently, the GCD implementation is chosen at compile time based on
CONFIG_CPU_NO_EFFICIENT_FFS, which can result in suboptimal behavior on
such systems.

Introduce a static key, efficient_ffs_key, to enable runtime selection
between the binary GCD (using ffs) and the odd-even GCD implementation.
This allows the kernel to default to the faster binary GCD when FFS is
efficient, while retaining the ability to fall back when needed.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/gcd.h |  3 +++
 lib/math/gcd.c      | 27 +++++++++++++++------------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/include/linux/gcd.h b/include/linux/gcd.h
index cb572677fd7f..616e81a7f7e3 100644
--- a/include/linux/gcd.h
+++ b/include/linux/gcd.h
@@ -3,6 +3,9 @@
 #define _GCD_H
 
 #include <linux/compiler.h>
+#include <linux/jump_label.h>
+
+DECLARE_STATIC_KEY_TRUE(efficient_ffs_key);
 
 unsigned long gcd(unsigned long a, unsigned long b) __attribute_const__;
 
diff --git a/lib/math/gcd.c b/lib/math/gcd.c
index e3b042214d1b..62efca6787ae 100644
--- a/lib/math/gcd.c
+++ b/lib/math/gcd.c
@@ -11,22 +11,16 @@
  * has decent hardware division.
  */
 
+DEFINE_STATIC_KEY_TRUE(efficient_ffs_key);
+
 #if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
 
 /* If __ffs is available, the even/odd algorithm benchmarks slower. */
 
-/**
- * gcd - calculate and return the greatest common divisor of 2 unsigned longs
- * @a: first value
- * @b: second value
- */
-unsigned long gcd(unsigned long a, unsigned long b)
+static unsigned long binary_gcd(unsigned long a, unsigned long b)
 {
 	unsigned long r = a | b;
 
-	if (!a || !b)
-		return r;
-
 	b >>= __ffs(b);
 	if (b == 1)
 		return r & -r;
@@ -44,9 +38,15 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	}
 }
 
-#else
+#endif
 
 /* If normalization is done by loops, the even/odd algorithm is a win. */
+
+/**
+ * gcd - calculate and return the greatest common divisor of 2 unsigned longs
+ * @a: first value
+ * @b: second value
+ */
 unsigned long gcd(unsigned long a, unsigned long b)
 {
 	unsigned long r = a | b;
@@ -54,6 +54,11 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	if (!a || !b)
 		return r;
 
+#if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
+	if (static_branch_likely(&efficient_ffs_key))
+		return binary_gcd(a, b);
+#endif
+
 	/* Isolate lsbit of r */
 	r &= -r;
 
@@ -80,6 +85,4 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	}
 }
 
-#endif
-
 EXPORT_SYMBOL_GPL(gcd);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
