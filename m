Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D12C001DF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 08:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5f0NRcIvO9cFDtYq2+tpB5S3DTN+BSbNErJRm8GV/bQ=; b=U0gOfQfV56x68k
	frIdbqJNhpdwlCf9rMQo6SflQcNHJUYT64CqU22fKUZ6jm0lFHfzvBjkFQMTvkjGmFDVhBBGmsqt9
	4LwEDvgsARDRhWZpzUPDxPSnvSDp76wlEGZBfS5++AysGX7i/zRJvrHImq8sAVPAMKbjohl2KCYRl
	7+ChUcz4HFnEYFumz9srKsep068rkNptotBPPZMPjN5lvvCLoSiKRMXhpn+OODXF+pYizSctUeBbK
	BRAqN5hFbRbBbSze90mdov5/GRxv6UyMrBNGGwtdMK0wgc4G0R6KRlArec2RckfbfnLrBaRRZnBEw
	iQrzrvludnVC4MefwbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqVE-00Bviz-0M;
	Fri, 04 Aug 2023 08:49:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqVA-00Bvh0-1u
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 08:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691138979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7qr15U85Ji6JaTSGdRUgCJIrXJMY4cTkIs1Ye7aZqqk=;
	b=EwvGQcVx1c2et5+L+Nok74GpYdM+zTLoPdwO8zL9Dmd20SLnP/Snd91HgMBizIrPorSm0i
	bsX8NiSJ5/LYU4nLzjej+EKGHhADiGajXIw7H5f1JCyvZcGvBMD9E8ws9l1E4wsNmV6w5e
	11fRP4TAuHSJR1uIJ9j1GDnO+SfroCk=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-fn7ZCuLLO_-BdRYt2790OQ-1; Fri, 04 Aug 2023 04:49:38 -0400
X-MC-Unique: fn7ZCuLLO_-BdRYt2790OQ-1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-56d2636c132so2523331eaf.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 01:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691138977; x=1691743777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qr15U85Ji6JaTSGdRUgCJIrXJMY4cTkIs1Ye7aZqqk=;
        b=CoKpvCEYKH7yMHgjyd4Y6AJr+jQH1c+YpGRUgOxC1D9CebHd5nD1tiO9ET8ixKCGzU
         NjmY2hwxzpwJGMU/WsCmSZFWZbxtm340ri+gqNgaYjTw/qJD33Yhiy4/bVQtyWtxWObm
         AM2nvbq66KCPJ/bvswSs5cGN2+mIklB/Ezyz2Uh9q6rKh0y0VG055sW9dlG/YpMtoFLD
         JodX4WczpFOH0k5wIkH4qTe69lZwibf4vXuXiAzrVIlFc85LBy9A9DFrc69SpPsK4irx
         7WJVnEGbA9ohnOEoca23SemonSXWRw8F3+25MgzEEYW6Hso3b9pZLV3YZ5Cj2OYpCM/q
         8S7w==
X-Gm-Message-State: AOJu0YzkQhVa4ZV0LJyeI0rcIUyptdX5XhrM+UUrHuLATZMgwCIj9rNa
	YBhD9qiZFaL1hdrjZroWZQaytvn70Mh32793yQ1JhF7xwyBIsb1sSBtQ9+m5RJSGyMhuF7q0EzS
	FI0KoeO6N/ijODQkxSNyR/kKS1y1D
X-Received: by 2002:a4a:d2dc:0:b0:56c:43cd:7267 with SMTP id j28-20020a4ad2dc000000b0056c43cd7267mr1155026oos.8.1691138977547;
        Fri, 04 Aug 2023 01:49:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGpSmCpCsEW2JBmJiIqK4JHv1sEJQk4u7ARhdPhe1GUzhItUEcAzOrA7h+bfUyOp/7X0uLgw==
X-Received: by 2002:a4a:d2dc:0:b0:56c:43cd:7267 with SMTP id j28-20020a4ad2dc000000b0056c43cd7267mr1155011oos.8.1691138977273;
        Fri, 04 Aug 2023 01:49:37 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:d380:694f:4f52:764c:4b7f])
        by smtp.gmail.com with ESMTPSA id f8-20020a4ab008000000b0055516447257sm685679oon.29.2023.08.04.01.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 01:49:36 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 4/5] riscv/cmpxchg: Implement cmpxchg for variables of size 1 and 2
Date: Fri,  4 Aug 2023 05:48:57 -0300
Message-ID: <20230804084900.1135660-6-leobras@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804084900.1135660-2-leobras@redhat.com>
References: <20230804084900.1135660-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_014940_701396_CAB7E9BF 
X-CRM114-Status: GOOD (  12.67  )
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

cmpxchg for variables of size 1-byte and 2-bytes is not yet available for
riscv, even though its present in other architectures such as arm64 and
x86. This could lead to not being able to implement some locking mechanisms
or requiring some rework to make it work properly.

Implement 1-byte and 2-bytes cmpxchg in order to achieve parity with other
architectures.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/cmpxchg.h | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 5a07646fae65..dfb433ac544f 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -72,6 +72,36 @@
  * indicated by comparing RETURN with OLD.
  */
 
+#define __arch_cmpxchg_mask(sc_sfx, prepend, append, r, p, o, n)	\
+({									\
+	/* Depends on 2-byte variables being 2-byte aligned */		\
+	ulong __s = ((ulong)(p) & 0x3) * BITS_PER_BYTE;			\
+	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
+			<< __s;						\
+	ulong __newx = (ulong)(n) << __s;				\
+	ulong __oldx = (ulong)(o) << __s;				\
+	ulong __retx;							\
+	register unsigned int __rc;					\
+									\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"0:	lr.w %0, %2\n"					\
+		"	and  %0, %0, %z5\n"				\
+		"	bne  %0, %z3, 1f\n"				\
+		"	and  %1, %0, %z6\n"				\
+		"	or   %1, %1, %z4\n"				\
+		"	sc.w" sc_sfx " %1, %1, %2\n"			\
+		"	bnez %1, 0b\n"					\
+		append							\
+		"1:\n"							\
+		: "=&r" (__retx), "=&r" (__rc), "+A" (*(p))		\
+		: "rJ" ((long)__oldx), "rJ" (__newx),			\
+		  "rJ" (__mask), "rJ" (~__mask)				\
+		: "memory");						\
+									\
+	r = (__typeof__(*(p)))(__retx >> __s);				\
+})
+
 
 #define __arch_cmpxchg(lr_sfx, sc_sfx, prepend, append, r, p, co, o, n)	\
 ({									\
@@ -98,6 +128,11 @@
 	__typeof__(*(ptr)) __ret;					\
 									\
 	switch (sizeof(*__ptr)) {					\
+	case 1:								\
+	case 2:								\
+		__arch_cmpxchg_mask(sc_sfx, prepend, append,		\
+					__ret, __ptr, __old, __new);	\
+		break;							\
 	case 4:								\
 		__arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,	\
 				__ret, __ptr, (long), __old, __new);	\
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
