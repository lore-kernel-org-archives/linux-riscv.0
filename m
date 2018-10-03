Return-Path: <SRS0=xmLI=MP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DB6C64EBD
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 03:13:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DDF720878
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 03:13:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lBvUpIEs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="swquZCyB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DDF720878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RxYiptjXE42rEPkse66xH8mmu6t2nAJfXrxJeqPU+AY=; b=lBvUpIEsJFP6GUNedulHRF0+rO
	V3PSyEX3+7/QhAaFS77dmpfO6SqDGkZzDLgL7Nko4X1jkZZM6BFGNOZyvogdoCUaBZHYHrXqRGsdZ
	u8VOCWvXGwGnKbnc4RVzz7hCbj/hCPjBdGV9eaRSJbBhK4xG1JKzUXOTiTuO9zDHUtpP4HB85mzR8
	GU0TQh/U2IDEtPdw3mclf9rla7fB6VnlA2z+ofwcezfoyZmvaaJmVbqr2yoKn/zyW7GOYjzn1rtse
	4cfBjeHxIZVEhjRwidBN8pYVl75J4QnOaznIQ7wjuK/vFm0XKDz4vtsEu9qqJLhlz8ngNXCVIzXyZ
	AaTQXKBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Xat-0005Bp-3s; Wed, 03 Oct 2018 03:12:59 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Xam-00057h-9h
 for linux-riscv@lists.infradead.org; Wed, 03 Oct 2018 03:12:54 +0000
Received: by mail-pl1-x643.google.com with SMTP id v5-v6so2702527plz.13
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 20:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KVriMd+NJqUjin+7AL5q2vB4qBdyQ6TJdFXFHCuDqVc=;
 b=swquZCyBOpp1FaTr+TmfLoF1tnpo/ZfZfwEyHLz9pGiV4tV/Oig2Ar1lEjuFwqafpw
 6xPy/gHSr4lb/RwLSB6vGjF5T+Yj9HB23ILbXGASz1GyFViq6/r1EY/aqMQCFgXRVfI5
 sn6fdy2gvptJa3QW2YyxLYgnuXxUAcGtq890VgZzLpi4USEkDXhzHXkHKdz7aU2p8Ka+
 jNEA2pjyr4/HUMOr48vwdU9TId76qOReVl2V71OluBe8DAoJ3fqaJhGPnh3p42UF608z
 habS4xLvbGf19f67c2Tmv54vk5yVaIBCBit2LINAelbJJY/DWesSMg+0OHWx2Tv8HYoj
 IxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KVriMd+NJqUjin+7AL5q2vB4qBdyQ6TJdFXFHCuDqVc=;
 b=B1b14jo+jrkbwG2/hEJ2WJOCLpliqim1+ERjmt252pHRsU5xbvZBLWQfdD1VBMZFmN
 iLAem6HptszQZn8J+y9Hmmg4X+O4Yz/FV1yvTXOAdpBsg+mvlS3gJPMfbdj62u5Olbx3
 dqmOhoJRJLJHXJs5/GSMK0//oAFXcZiqUIU9sGZU7e8Y5zkCiKkiuQC8/vj8+Ju/TWG5
 94Pb4YTTkCWSHSxSIC92t+xnE1cdMjMznMclcZq4QUOKBc+Kn4ZP56HVe1LKzWJgjkFS
 YtSjciAjZ/xou7G5SUd1fS7Ejb7h2QZp3xgY9Y3FY6JGRLyDfm75m4Wfy35pWOz/pcKf
 HNUg==
X-Gm-Message-State: ABuFfojqx6wyR2rXSZ4NcCQgd4WsrDU7IXnx1wZMUcr9VHo6MBO73DSo
 usx4oykwKiFbxaFdoghpO4s=
X-Google-Smtp-Source: ACcGV62oXR4mRqaoVIg5zHK21rh8cRrMHrYY63hPQGKLTS58iNRstLeVmLWaF0BwYaar+9glZCm3IQ==
X-Received: by 2002:a17:902:7887:: with SMTP id
 q7-v6mr19513029pll.111.1538536365129; 
 Tue, 02 Oct 2018 20:12:45 -0700 (PDT)
Received: from app09.andestech.com (59-120-53-16.HINET-IP.hinet.net.
 [59.120.53.16])
 by smtp.gmail.com with ESMTPSA id v23-v6sm21777747pfm.80.2018.10.02.20.12.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 20:12:44 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v4 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library routines
Date: Wed,  3 Oct 2018 11:10:00 +0800
Message-Id:
 <779b0b25cc96101a525402f38053db5e2f360d6f.1538535528.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538535527.git.zongbox@gmail.com>
References: <cover.1538535527.git.zongbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_201252_373003_0D56F448 
X-CRM114-Status: GOOD (  27.41  )
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
Cc: hch@infradead.org, zong@andestech.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181003031000.C6wezoXikIT6Smp05pfznMMhueTclsrRRI7nDCPI_wE@z>

Add umoddi3 and udivmoddi4 support for 32-bit.

The RV32 need the umoddi3 to do modulo when the operands are long long
type, like other libraries implementation such as ucmpdi2, lshrdi3 and
so on.

I encounter the undefined reference 'umoddi3' when I use the in
house dma driver, although it is in house driver, but I think that
umoddi3 is a common function for RV32.

The udivmoddi4 and umoddi3 are copies from libgcc in gcc 4.2.1.
There are other functions use the udivmoddi4 in libgcc, so I separate
the umoddi3 and udivmoddi4 for flexible extension in the future.

Signed-off-by: Zong Li <zong@andestech.com>
---
 lib/Kconfig      |   3 +
 lib/Makefile     |   1 +
 lib/udivmoddi4.c | 326 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/umoddi3.c    |  48 ++++++++
 4 files changed, 378 insertions(+)
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
index 0000000..ddbe4fa
--- /dev/null
+++ b/lib/udivmoddi4.c
@@ -0,0 +1,326 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* More subroutines needed by GCC output code on some machines.  */
+/* Compile this one with gcc.  */
+/* Copyright (C) 1989, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,
+ * 2000, 2001, 2002, 2003, 2004, 2005  Free Software Foundation, Inc.
+ *
+ * This file is part of GCC.
+ *
+ * GCC is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License as published by the Free
+ * Software Foundation; either version 2, or (at your option) any later
+ * version.
+ *
+ * In addition to the permissions in the GNU General Public License, the
+ * Free Software Foundation gives you unlimited permission to link the
+ * compiled version of this file into combinations with other programs,
+ * and to distribute those combinations without any restriction coming
+ * from the use of this file.  (The General Public License restrictions
+ * do apply in other respects; for example, they cover modification of
+ * the file, and distribution when not linked into a combine
+ * executable.)
+ *
+ * GCC is distributed in the hope that it will be useful, but WITHOUT ANY
+ * WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+ * for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with GCC; see the file COPYING.  If not, write to the Free
+ * Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
+ * 02110-1301, USA.
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
+
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
+
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
+
+	return ww.ll;
+}
diff --git a/lib/umoddi3.c b/lib/umoddi3.c
new file mode 100644
index 0000000..153961f
--- /dev/null
+++ b/lib/umoddi3.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* More subroutines needed by GCC output code on some machines.  */
+/* Compile this one with gcc.  */
+/* Copyright (C) 1989, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,
+ * 2000, 2001, 2002, 2003, 2004, 2005  Free Software Foundation, Inc.
+ *
+ * This file is part of GCC.
+ *
+ * GCC is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License as published by the Free
+ * Software Foundation; either version 2, or (at your option) any later
+ * version.
+ *
+ * In addition to the permissions in the GNU General Public License, the
+ * Free Software Foundation gives you unlimited permission to link the
+ * compiled version of this file into combinations with other programs,
+ * and to distribute those combinations without any restriction coming
+ * from the use of this file.  (The General Public License restrictions
+ * do apply in other respects; for example, they cover modification of
+ * the file, and distribution when not linked into a combine
+ * executable.)
+ *
+ * GCC is distributed in the hope that it will be useful, but WITHOUT ANY
+ * WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+ * for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with GCC; see the file COPYING.  If not, write to the Free
+ * Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
+ * 02110-1301, USA.
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
