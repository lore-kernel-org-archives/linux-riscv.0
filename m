Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5DBC43382
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 08:34:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EE7F2083A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 08:34:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UGwwHXD9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cG9lbJlq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EE7F2083A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lkmP6Vwp4N4vdjUkbrY/2URUQihVuz5WEvaH8YqBH/0=; b=UGwwHXD9cyH746P7te7cLNRSk5
	fOJnpGJfsKZ0zsc7ExwH863UUQqgIYrsHnlxYtBmd0sGGR6PisjP0ITNBOptdYhT3stOg9IFG1MDg
	gaI2Lf07cGzlLcY87n896V7MB+OwXkPEil0nW02hL/+uouQIo2og7XXIMtNxJ17+v0D1zG2zkWktb
	ibcTljDrde0mB7/R5Lbq9Xljz89pVZ0fIQLLorEmWUa7fIRc/WGT2nbqqLwc48LcPgJSDMF8VQ/gr
	C4FKN0B86k40owruhizIizw2GaybkBRgmRYCOwie8sR54az8Pah3ha9HogCp1kX0TpNIbXhj+7dBa
	oZNY3GJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g55Gt-0004Vt-U3; Wed, 26 Sep 2018 08:34:11 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g55GC-0004Of-5Q
 for linux-riscv@lists.infradead.org; Wed, 26 Sep 2018 08:33:30 +0000
Received: by mail-pl1-x644.google.com with SMTP id c8-v6so1795747plo.9
 for <linux-riscv@lists.infradead.org>; Wed, 26 Sep 2018 01:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ki1eRqJFQzl2hXEoAfjNvJt7p0QtHAb9T8LBqlbaiDA=;
 b=cG9lbJlq6LEKZpsN8oj8DCDROGxS99Ao4ZTFkCkt/kBNmGiSb+K6SPLZcn/MwLYVfL
 kVeNfczz756XZ+cEpWbMzrPfJX2TxM6g/PXoXtPPHC++2EU6wQYkIuZDK7dR01a2GxC/
 0C/ixfGA6KA0UeLxACLWny2mCLN9e8sxRExL+RlFT56JeXO/xrjIO7GL5Fm41SOVRZ/K
 w7ufRIy8erPrdYaCjr//TFy7BAqoIeYSZsT2Lnfk0AgKOnwhKvFx7QGKfPeO/2/OoL03
 Yt9rBQDdRBt5eiXOmaL3ifDeg+pfk7kco7Daf/dLNhyOAiAl8EPbfXVnjk31vXMCPHvZ
 kZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ki1eRqJFQzl2hXEoAfjNvJt7p0QtHAb9T8LBqlbaiDA=;
 b=Bjjrnn3W1Nf8UGKgMr7j0C768E/ppcmukMgGnb5DIqLEZR4+6hxXAeBu9HoTjgY5Ro
 XKG6O4D+SDOGAM8h4UCgd/b6qa+bbvWW4Un+KALGuA9WLtO39B0W2ab+J7cmcm8ZlPeL
 C9/OcbNbCQPdX5BMID75wfVX0tyAMB6BaRiuK1Uj/o3wgz9/Dv7pDoyLiNSS2tXmk0Wn
 9pvYEBkJjDOoZyuUZZrBl7xoS2Rdj5iRSIDgcpYhbCeuyDc7AEMVKLZJTOo6DsWHLWqT
 xif2969NI0XuagBsVzHA09CxXr1OQBsK+1OCzoSPnfikTTWCfpsMS0eXdb3v0PwJ0BDR
 Agfg==
X-Gm-Message-State: ABuFfoghy5om9jjM5eXu1wlrW6//0iure8HTl6DRlgqNxcDM/Oev0mEw
 Vai8H6HZ+AXjB9tSIUtBOB2dK2HxGY8=
X-Google-Smtp-Source: ACcGV61BU6kWl5Hpa2iaXxjqi9tNZ0hXiFmP3AqwencevFWWRIwNNvIYE547CovHqXaoiIUJe+tF9Q==
X-Received: by 2002:a17:902:d216:: with SMTP id
 t22-v6mr4991728ply.338.1537950783246; 
 Wed, 26 Sep 2018 01:33:03 -0700 (PDT)
Received: from app09.andestech.com ([118.163.51.199])
 by smtp.gmail.com with ESMTPSA id f15-v6sm5530764pgv.66.2018.09.26.01.33.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Sep 2018 01:33:02 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v2 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library routines
Date: Wed, 26 Sep 2018 16:31:12 +0800
Message-Id:
 <7a24493868f29559a1628eed44af15dc10a9940a.1537949825.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1537949825.git.zongbox@gmail.com>
References: <cover.1537949825.git.zongbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180926_013328_260289_B2BB23E0 
X-CRM114-Status: GOOD (  25.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: zong@andestech.com, linux-kernel@vger.kernel.org,
 Zong Li <zongbox@gmail.com>, hch@infradead.org, vincentc@andestech.com,
 linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180926083112.Tq_IFIy7vFOnMhNYBjiNSmMEK4y_GUp9dZf8JDzizrQ@z>

Add umoddi3 and udivmoddi4 support for 32-bit.

The RV32 need the umoddi3 to do modulo when the operands are long long
type, like other libraries implementation such as ucmpdi2, lshrdi3 and
so on.

I encounter the undefined reference 'umoddi3' when I use the in
house dma driver, although it is in house driver, but I think that
umoddi3 is a common function for RV32.

The udivmoddi4 and umoddi3 are copies from libgcc in gcc. There are other
functions use the udivmoddi4 in libgcc, so I separate the umoddi3 and
udivmoddi4 for flexible extension in the future.

Signed-off-by: Zong Li <zong@andestech.com>
---
 lib/Kconfig      |   3 +
 lib/Makefile     |   1 +
 lib/udivmoddi4.c | 309 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/umoddi3.c    |  34 ++++++
 4 files changed, 347 insertions(+)
 create mode 100644 lib/udivmoddi4.c
 create mode 100644 lib/umoddi3.c

diff --git a/lib/Kconfig b/lib/Kconfig
index a3928d4..d82f206 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -621,3 +621,6 @@ config GENERIC_LIB_CMPDI2
 
 config GENERIC_LIB_UCMPDI2
 	bool
+
+config GENERIC_LIB_UMODDI3
+	bool
diff --git a/lib/Makefile b/lib/Makefile
index ca3f7eb..51bf24d 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -271,3 +271,4 @@ obj-$(CONFIG_GENERIC_LIB_LSHRDI3) += lshrdi3.o
 obj-$(CONFIG_GENERIC_LIB_MULDI3) += muldi3.o
 obj-$(CONFIG_GENERIC_LIB_CMPDI2) += cmpdi2.o
 obj-$(CONFIG_GENERIC_LIB_UCMPDI2) += ucmpdi2.o
+obj-$(CONFIG_GENERIC_LIB_UMODDI3) += umoddi3.o udivmoddi4.o
diff --git a/lib/udivmoddi4.c b/lib/udivmoddi4.c
new file mode 100644
index 0000000..6518b3a
--- /dev/null
+++ b/lib/udivmoddi4.c
@@ -0,0 +1,309 @@
+/*
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License as published by the Free
+ * Software Foundation; either version 3, or (at your option) any later
+ * version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+ * for more details.
+ *
+ * Under Section 7 of GPL version 3, you are granted additional
+ * permissions described in the GCC Runtime Library Exception, version
+ * 3.1, as published by the Free Software Foundation.
+ *
+ * You should have received a copy of the GNU General Public License and
+ * a copy of the GCC Runtime Library Exception along with this program;
+ * see the files COPYING3 and COPYING.RUNTIME respectively.
+ */
+
+#include <linux/libgcc.h>
+
+#define count_leading_zeros(COUNT, X)   ((COUNT) = __builtin_clz(X))
+
+#define W_TYPE_SIZE 32
+
+#define __ll_B ((unsigned long) 1 << (W_TYPE_SIZE / 2))
+#define __ll_lowpart(t) ((unsigned long) (t) & (__ll_B - 1))
+#define __ll_highpart(t) ((unsigned long) (t) >> (W_TYPE_SIZE / 2))
+
+/* If we still don't have umul_ppmm, define it using plain C. */
+#if !defined(umul_ppmm)
+#define umul_ppmm(w1, w0, u, v)						\
+	do {								\
+		unsigned long __x0, __x1, __x2, __x3;			\
+		unsigned short __ul, __vl, __uh, __vh;			\
+									\
+		__ul = __ll_lowpart(u);					\
+		__uh = __ll_highpart(u);				\
+		__vl = __ll_lowpart(v);					\
+		__vh = __ll_highpart(v);				\
+									\
+		__x0 = (unsigned long) __ul * __vl;			\
+		__x1 = (unsigned long) __ul * __vh;			\
+		__x2 = (unsigned long) __uh * __vl;			\
+		__x3 = (unsigned long) __uh * __vh;			\
+									\
+		__x1 += __ll_highpart(__x0);				\
+		__x1 += __x2;						\
+		if (__x1 < __x2)					\
+			__x3 += __ll_B;					\
+									\
+		(w1) = __x3 + __ll_highpart(__x1);			\
+		(w0) = __ll_lowpart(__x1) * __ll_B + __ll_lowpart(__x0);\
+	} while (0)
+#endif
+
+#if !defined(sub_ddmmss)
+#define sub_ddmmss(sh, sl, ah, al, bh, bl)				\
+	do {								\
+		unsigned long __x;					\
+		__x = (al) - (bl);					\
+		(sh) = (ah) - (bh) - (__x > (al));			\
+		(sl) = __x;						\
+	} while (0)
+#endif
+
+/* Define this unconditionally, so it can be used for debugging. */
+#define __udiv_qrnnd_c(q, r, n1, n0, d)					\
+	do {								\
+		unsigned long __d1, __d0, __q1, __q0;			\
+		unsigned long __r1, __r0, __m;				\
+		__d1 = __ll_highpart(d);				\
+		__d0 = __ll_lowpart(d);				\
+									\
+		__r1 = (n1) % __d1;					\
+		__q1 = (n1) / __d1;					\
+		__m = (unsigned long) __q1 * __d0;			\
+		__r1 = __r1 * __ll_B | __ll_highpart(n0);		\
+		if (__r1 < __m) {					\
+			__q1--, __r1 += (d);				\
+			if (__r1 >= (d))				\
+				if (__r1 < __m)				\
+					__q1--, __r1 += (d);		\
+		}							\
+		__r1 -= __m;						\
+									\
+		__r0 = __r1 % __d1;					\
+		__q0 = __r1 / __d1;					\
+		__m = (unsigned long) __q0 * __d0;			\
+		__r0 = __r0 * __ll_B | __ll_lowpart(n0);		\
+		if (__r0 < __m) {					\
+			__q0--, __r0 += (d);				\
+			if (__r0 >= (d))				\
+				if (__r0 < __m)				\
+					__q0--, __r0 += (d);		\
+		}							\
+		__r0 -= __m;						\
+									\
+		(q) = (unsigned long) __q1 * __ll_B | __q0;		\
+		(r) = __r0;						\
+	} while (0)
+
+/* If udiv_qrnnd was not defined for this processor, use __udiv_qrnnd_c. */
+#if !defined(udiv_qrnnd)
+#define UDIV_NEEDS_NORMALIZATION 1
+#define udiv_qrnnd __udiv_qrnnd_c
+#endif
+
+unsigned long long __udivmoddi4(unsigned long long u, unsigned long long v,
+				unsigned long long *rp)
+{
+	const DWunion nn = {.ll = u };
+	const DWunion dd = {.ll = v };
+	DWunion rr, ww;
+	unsigned long d0, d1, n0, n1, n2;
+	unsigned long q0 = 0, q1 = 0;
+	unsigned long b, bm;
+
+	d0 = dd.s.low;
+	d1 = dd.s.high;
+	n0 = nn.s.low;
+	n1 = nn.s.high;
+
+#if !UDIV_NEEDS_NORMALIZATION
+
+	if (d1 == 0) {
+		if (d0 > n1) {
+			/* 0q = nn / 0D */
+
+			udiv_qrnnd(q0, n0, n1, n0, d0);
+			q1 = 0;
+
+			/* Remainder in n0. */
+		} else {
+			/* qq = NN / 0d */
+
+			if (d0 == 0)
+				/* Divide intentionally by zero. */
+				d0 = 1 / d0;
+
+			udiv_qrnnd(q1, n1, 0, n1, d0);
+			udiv_qrnnd(q0, n0, n1, n0, d0);
+
+			/* Remainder in n0. */
+		}
+
+		if (rp != 0) {
+			rr.s.low = n0;
+			rr.s.high = 0;
+			*rp = rr.ll;
+		}
+#else /* UDIV_NEEDS_NORMALIZATION */
+
+	if (d1 == 0) {
+		if (d0 > n1) {
+			/* 0q = nn / 0D */
+
+			count_leading_zeros(bm, d0);
+
+			if (bm != 0) {
+				/*
+				 * Normalize, i.e. make the most significant bit
+				 * of the denominator set.
+				 */
+
+				d0 = d0 << bm;
+				n1 = (n1 << bm) | (n0 >> (W_TYPE_SIZE - bm));
+				n0 = n0 << bm;
+			}
+
+			udiv_qrnnd(q0, n0, n1, n0, d0);
+			q1 = 0;
+
+			/* Remainder in n0 >> bm. */
+		} else {
+			/* qq = NN / 0d */
+
+			if (d0 == 0)
+				/* Divide intentionally by zero. */
+				d0 = 1 / d0;
+
+			count_leading_zeros(bm, d0);
+
+			if (bm == 0) {
+				/*
+				 * From (n1 >= d0) /\ (the most significant bit
+				 * of d0 is set), conclude (the most significant
+				 * bit of n1 is set) /\ (theleading quotient
+				 * digit q1 = 1).
+				 *
+				 * This special case is necessary, not an
+				 * optimization. (Shifts counts of W_TYPE_SIZE
+				 * are undefined.)
+				 */
+
+				n1 -= d0;
+				q1 = 1;
+			} else {
+				/* Normalize. */
+
+				b = W_TYPE_SIZE - bm;
+
+				d0 = d0 << bm;
+				n2 = n1 >> b;
+				n1 = (n1 << bm) | (n0 >> b);
+				n0 = n0 << bm;
+
+				udiv_qrnnd(q1, n1, n2, n1, d0);
+			}
+
+			/* n1 != d0... */
+
+			udiv_qrnnd(q0, n0, n1, n0, d0);
+
+			/* Remainder in n0 >> bm. */
+		}
+
+		if (rp != 0) {
+			rr.s.low = n0 >> bm;
+			rr.s.high = 0;
+			*rp = rr.ll;
+		}
+#endif /* UDIV_NEEDS_NORMALIZATION */
+
+	} else {
+		if (d1 > n1) {
+			/* 00 = nn / DD */
+
+			q0 = 0;
+			q1 = 0;
+
+			/* Remainder in n1n0. */
+			if (rp != 0) {
+				rr.s.low = n0;
+				rr.s.high = n1;
+				*rp = rr.ll;
+			}
+		} else {
+			/* 0q = NN / dd */
+
+			count_leading_zeros(bm, d1);
+			if (bm == 0) {
+				/*
+				 * From (n1 >= d1) /\ (the most significant bit
+				 * of d1 is set), conclude (the most significant
+				 * bit of n1 is set) /\ (the quotient digit q0 =
+				 * 0 or 1).
+				 *
+				 * This special case is necessary, not an
+				 * optimization.
+				 */
+
+				/*
+				 * The condition on the next line takes
+				 * advantage of that n1 >= d1 (true due to
+				 * program flow).
+				 */
+				if (n1 > d1 || n0 >= d0) {
+					q0 = 1;
+					sub_ddmmss(n1, n0, n1, n0, d1, d0);
+				} else {
+					q0 = 0;
+				}
+
+				q1 = 0;
+
+				if (rp != 0) {
+					rr.s.low = n0;
+					rr.s.high = n1;
+					*rp = rr.ll;
+				}
+			} else {
+				unsigned long m1, m0;
+				/* Normalize. */
+
+				b = W_TYPE_SIZE - bm;
+
+				d1 = (d1 << bm) | (d0 >> b);
+				d0 = d0 << bm;
+				n2 = n1 >> b;
+				n1 = (n1 << bm) | (n0 >> b);
+				n0 = n0 << bm;
+
+				udiv_qrnnd(q0, n1, n2, n1, d1);
+				umul_ppmm(m1, m0, q0, d0);
+
+				if (m1 > n1 || (m1 == n1 && m0 > n0)) {
+					q0--;
+					sub_ddmmss(m1, m0, m1, m0, d1, d0);
+				}
+
+				q1 = 0;
+
+				/* Remainder in (n1n0 - m1m0) >> bm. */
+				if (rp != 0) {
+					sub_ddmmss(n1, n0, n1, n0, m1, m0);
+					rr.s.low = (n1 << b) | (n0 >> bm);
+					rr.s.high = n1 >> bm;
+					*rp = rr.ll;
+				}
+			}
+		}
+	}
+
+	ww.s.low = q0;
+	ww.s.high = q1;
+	return ww.ll;
+}
diff --git a/lib/umoddi3.c b/lib/umoddi3.c
new file mode 100644
index 0000000..0134696
--- /dev/null
+++ b/lib/umoddi3.c
@@ -0,0 +1,34 @@
+/*
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License as published by the Free
+ * Software Foundation; either version 3, or (at your option) any later
+ * version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+ * for more details.
+ *
+ * Under Section 7 of GPL version 3, you are granted additional
+ * permissions described in the GCC Runtime Library Exception, version
+ * 3.1, as published by the Free Software Foundation.
+ *
+ * You should have received a copy of the GNU General Public License and
+ * a copy of the GCC Runtime Library Exception along with this program;
+ * see the files COPYING3 and COPYING.RUNTIME respectively.
+ */
+
+#include <linux/module.h>
+#include <linux/libgcc.h>
+
+extern unsigned long long __udivmoddi4(unsigned long long u,
+				       unsigned long long v,
+				       unsigned long long *rp);
+
+unsigned long long __umoddi3(unsigned long long u, unsigned long long v)
+{
+	unsigned long long w;
+	(void)__udivmoddi4(u, v, &w);
+	return w;
+}
+EXPORT_SYMBOL(__umoddi3);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
