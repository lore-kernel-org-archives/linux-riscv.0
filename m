Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F52CC001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 08:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9XMeLI2ykkzrhRIvvi5SJ6/VvA3L/+7v/PL3O0YTi4=; b=U/h/AFjTFoc1vQ
	V5dOVba89UMk6phiZ80LOUcvyYHo83z3dkT6eZES5MaLQ1Soi6WnlERU5R+qhnjaRPFkLeaD+8ojo
	QVHLCdbPbsfFw0OJ6NCqluhSG9PMiRzTtLZvI5FlCYvSLwqdqEkS9hEpw6YhQZU2d7HFcckEcNbN3
	DonqGUJk2pq6EIuhxT5z6MvuLoPTcN9BAhi4aEXCJn8XNEiDHl4Dsr7e3RH/0CL2U57+Xfp81kc6b
	2gcMWsTe/3m1KND+KEmNldYiqoXHYCnOc3fFaDRATxnlCW/ohkW9D9YaMrtIOG+dAjdFqNnBwyXUc
	h1/+hsrF3QF+HjsBRLMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqVG-00BvkX-2J;
	Fri, 04 Aug 2023 08:49:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqVE-00Bvit-1d
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 08:49:45 +0000
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-FA4I6SfHPDmg4IvlqGQW0A-1; Fri, 04 Aug 2023 04:49:42 -0400
X-MC-Unique: FA4I6SfHPDmg4IvlqGQW0A-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-56c85f719efso2605003eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 01:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691138981; x=1691743781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3amwd/lpP8rvZ9IhpcoisHZeefZgWLzf3BsTgVcPLgw=;
        b=hji2QMJkOV7laHoh44Q8desPlTbcm5G9vUjO8GnH0YtleHuDEW52fhT48lUUeEuhT/
         aDV5mVeSJi6VnF80kzg3ByDxtGzAnZYearK+jWCX8e+3goEEX4Wh17ACFINPsL2mPtbG
         VXd1IoIRVScdG3cy4GJEZRifHg+koNqSjrs4+nqw3ZPEmXYtp3alDuXiTpu4XxQ6AZtF
         CFRTq3xyE90A8erefX+oQJ0MURc5UuyVvWQDdBocH1uonsFt2hcvRhnzGXZlzkvzaCIL
         6DQNBfi4XKlz0a3FUvD8s+YVgL/KODrplstAoMD3UU7OiBc0DBXP7VVPDR41QdXo2x7h
         dIdQ==
X-Gm-Message-State: AOJu0YwyYBEjdhtrBXg3rN4DV/3O/IRQBX5yx367uSnKt11fuXof1czd
	SJ109QVfC5cumkCAhllCsZW7rO+9q4qY6O3Hj3Hxtcxy0ZFYowfgsff353B0AqA3DrIX2Phn3PF
	1hIePo2V/nhpS6OFP+KlrTbd8Poza
X-Received: by 2002:a4a:6519:0:b0:56c:e856:8b2c with SMTP id y25-20020a4a6519000000b0056ce8568b2cmr1003961ooc.9.1691138981681;
        Fri, 04 Aug 2023 01:49:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvsWBOYEPFQASeYA1dLIyHiNIkhde3nNiq2XUol3devppgxjgdj9GmPoeRlh/oNYHjlwpP4w==
X-Received: by 2002:a4a:6519:0:b0:56c:e856:8b2c with SMTP id y25-20020a4a6519000000b0056ce8568b2cmr1003954ooc.9.1691138981435;
        Fri, 04 Aug 2023 01:49:41 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:d380:694f:4f52:764c:4b7f])
        by smtp.gmail.com with ESMTPSA id f8-20020a4ab008000000b0055516447257sm685679oon.29.2023.08.04.01.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 01:49:41 -0700 (PDT)
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
Subject: [RFC PATCH v3 5/5] riscv/cmpxchg: Implement xchg for variables of size 1 and 2
Date: Fri,  4 Aug 2023 05:48:58 -0300
Message-ID: <20230804084900.1135660-7-leobras@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804084900.1135660-2-leobras@redhat.com>
References: <20230804084900.1135660-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_014944_701101_ACED8425 
X-CRM114-Status: GOOD (  12.11  )
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
---
 arch/riscv/include/asm/cmpxchg.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index dfb433ac544f..943f094375c7 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,6 +11,31 @@
 #include <asm/barrier.h>
 #include <asm/fence.h>
 
+#define __arch_xchg_mask(prepend, append, r, p, n)			\
+({									\
+	/* Depends on 2-byte variables being 2-byte aligned */		\
+	ulong __s = ((ulong)(p) & 0x3) * BITS_PER_BYTE;			\
+	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
+			<< __s;						\
+	ulong __newx = (ulong)(n) << __s;				\
+	ulong __retx;							\
+	register unsigned int __rc;					\
+									\
+	__asm__ __volatile__ (						\
+	       prepend							\
+	       "0:	lr.w %0, %2\n"					\
+	       "	and  %1, %0, %z4\n"				\
+	       "	or   %1, %1, %z3\n"				\
+	       "	sc.w %1, %1, %2\n"				\
+	       "	bnez %1, 0b\n"					\
+	       append							\
+	       : "=&r" (__retx), "=&r" (__rc), "+A" (*(p))		\
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
 	__typeof__(*(ptr)) __new = (new);				\
 	__typeof__(*(ptr)) __ret;					\
 	__typeof__(ptr) __ptr = (ptr);					\
+									\
 	switch (sizeof(*__ptr)) {					\
+	case 1:								\
+	case 2:								\
+		__arch_xchg_mask(prepend, append,			\
+				 __ret, __ptr, __new);			\
+		break;							\
 	case 4:								\
 		__arch_xchg(".w" sfx, prepend, append,			\
 			      __ret, __ptr, __new);			\
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
