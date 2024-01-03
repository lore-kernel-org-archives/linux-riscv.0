Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22488C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 16:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xu3HhtWXyvYM5XT19iajBWX4H11bqUU1YrUGQH7pKqM=; b=qK/nVGCW9pn1Ft
	v0mHQ5upDsaNwDCvNpv5D8F7ctui7SS8N3hB6KG1lYYJ5is94xhICcapOXzKBP8bR0UzDk6qFvDjc
	Rf5kj1SU+TOocboAWnZRO2Kkd8Ir+V1rF+eDq59rCF/YyDBRZ3YOj62sL/qUbta7OnOsq4w7T3IYe
	5iuea1ITss3Z438278ZMWvFUfFJdHYGf2ux8N47Cj1gVsLf0+mfMeKBsF45kaqX9uNYPOYkufi5OS
	Jzl6L6IsQ1IEgT1dEGBU9nWmDFJ6+axrfcNVfubXAYkduWYD1rffXEywaZAC9k8MpuRYmt4fryKUl
	8ho45xNDgLRZrzuOP96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4B0-00BP9P-1v;
	Wed, 03 Jan 2024 16:33:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4Ax-00BP6w-25
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 16:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704299582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Re2lmE+u9xJehZpa61KU1PY4uKcHNA9CavGcQorFlps=;
	b=PQKjEzCROz8Bxv1R1xGPl80/psMrbcKblczZe7yADc5xww7KftdGu67ZRS9ORO99mKEElS
	VclewbApl3QUppUTaLsdlUsRSEqxcIRdfKGSyvUbZWy7RmbaV+KasKFHoa5NzeS2RBltsT
	Oi5KM78iCb4CeYHlUi+HwxBZ4fnAhLE=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-Toqjmkm6NlqEJb9yR3TvtQ-1; Wed, 03 Jan 2024 11:33:00 -0500
X-MC-Unique: Toqjmkm6NlqEJb9yR3TvtQ-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1d455b34723so79204255ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 08:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704299579; x=1704904379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Re2lmE+u9xJehZpa61KU1PY4uKcHNA9CavGcQorFlps=;
        b=he1CZdDwEDLqQgkb0hco6X/d983ytV1byZFy1N9LG7CmwsljPkBx2p9X7/Xuae0sDV
         0GPNSSMbF0lmjHiVuwgxY8hvkH+Dc2D3P+29YbH8mG+tNEuXW15WjPLLu/7t0Sewn0vC
         t5NBBAnOHfBkGbm+W4EFst0CRrnBtkjYJADAuOvJ5jV/FGdyc0K/JpB340uiVmpIUZ23
         W917rjQOq2CjYpGYEtWT5PZZVDtkshndJ7mb5AOnvGXf/JZUQYsdH0AYeNsXJNRnizfI
         bPjNNJGYQKlkUqlIj98tweLcbwSwuVZKdhXRsf0Jua1yGBGCoJyLAv/tixpwyCwBLxoC
         ZlFw==
X-Gm-Message-State: AOJu0YxSoxKXlD3PpePPj9OC3LL4x0hxxsxX+wQlIwd3c2Fw8OXngFtj
	Qt2KN4WL707KfESlaONpofo7AtloSawm2DkbTVpagoVkd98yqpjtIQgs1sVybYOr0byVLRw5YSm
	AbajjaFTCl8IfjgDOVhRrwX7+Wl5CntUiaKjv
X-Received: by 2002:a17:902:b94c:b0:1d0:6ffe:a11 with SMTP id h12-20020a170902b94c00b001d06ffe0a11mr22000202pls.111.1704299579620;
        Wed, 03 Jan 2024 08:32:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFssUiBpWP8x7axGoljRgCI2CzrmRE+huZgi6wtwmSBGSU76WiGWvRbbX36kTz3/VUagQIV+g==
X-Received: by 2002:a17:902:b94c:b0:1d0:6ffe:a11 with SMTP id h12-20020a170902b94c00b001d06ffe0a11mr22000194pls.111.1704299579375;
        Wed, 03 Jan 2024 08:32:59 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902b78c00b001cfca7b8ee7sm23930425pls.99.2024.01.03.08.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 08:32:58 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 5/5] riscv/cmpxchg: Implement xchg for variables of size 1 and 2
Date: Wed,  3 Jan 2024 13:32:03 -0300
Message-ID: <20240103163203.72768-7-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103163203.72768-2-leobras@redhat.com>
References: <20240103163203.72768-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_083303_831096_B736BB82 
X-CRM114-Status: GOOD (  12.53  )
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

xchg for variables of size 1-byte and 2-bytes is not yet available for
riscv, even though its present in other architectures such as arm64 and
x86. This could lead to not being able to implement some locking mechanisms
or requiring some rework to make it work properly.

Implement 1-byte and 2-bytes xchg in order to achieve parity with other
architectures.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Tested-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/cmpxchg.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index ac9d0eeb74e67..26cea2395aae8 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,6 +11,31 @@
 #include <asm/barrier.h>
 #include <asm/fence.h>
 
+#define __arch_xchg_masked(prepend, append, r, p, n)			\
+({									\
+	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
+	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
+	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
+			<< __s;						\
+	ulong __newx = (ulong)(n) << __s;				\
+	ulong __retx;							\
+	ulong __rc;							\
+									\
+	__asm__ __volatile__ (						\
+	       prepend							\
+	       "0:	lr.w %0, %2\n"					\
+	       "	and  %1, %0, %z4\n"				\
+	       "	or   %1, %1, %z3\n"				\
+	       "	sc.w %1, %1, %2\n"				\
+	       "	bnez %1, 0b\n"					\
+	       append							\
+	       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
+	       : "rJ" (__newx), "rJ" (~__mask)				\
+	       : "memory");						\
+									\
+	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+})
+
 #define __arch_xchg(sfx, prepend, append, r, p, n)			\
 ({									\
 	__asm__ __volatile__ (						\
@@ -27,7 +52,13 @@
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __new = (new);				\
 	__typeof__(*(__ptr)) __ret;					\
+									\
 	switch (sizeof(*__ptr)) {					\
+	case 1:								\
+	case 2:								\
+		__arch_xchg_masked(prepend, append,			\
+				   __ret, __ptr, __new);		\
+		break;							\
 	case 4:								\
 		__arch_xchg(".w" sfx, prepend, append,			\
 			      __ret, __ptr, __new);			\
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
