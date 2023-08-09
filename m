Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E261DC001DB
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 02:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gkKN9RT97s9MJhVSaEeAysz5zHUn4zcf9tWT4osiPF4=; b=Cxib59HGrZpYzY
	TdWDW8N0QhIA6jOyIb1AE8YkV0YXS+daenXxXh5j8NpNf4gcowowQCpsyLsE25NvG3clqAoaVV5en
	McTryfrrBGPWUuNjcTg5NGVR8UaDrKepiYKOiYyMXB/cp/76msI3ccURO7TCb89wd2WBMT3ObbA09
	wV/F/E1oYQztO+/yQNI3nSFNvHNrdZ88jVbSCG8guZ0npu3bJ854WRH14Evie8lDV54ju0tf4WGaH
	9AVE15Pon+9anyKdWa7OwIvRSa5N8hWNyi/uZxNeUfaDVSlg3l5a4heCn0moQn4enoaafBd0cfV5x
	fiG5bstPLymLT8D10ZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYiL-003saZ-02;
	Wed, 09 Aug 2023 02:14:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYiH-003sZ1-2C
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 02:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691547256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yR44ogH6UDfncEstCVw9mSlc1d7ANRRQAVF648wbdjc=;
	b=R9/8+LqhTELqJ9Bk6dbLJnn7xJpTL8T9LdL6Tqv90N4eU5zs6bxOBoxWLTGHVLu36gbX2k
	l9WkV/BIDDiwO+oGQyKJpC09fWhM5nbsc51Heqcp/04hBgzIefvEgoZ1ePilbfJW6rWYGs
	sx/qEXPTPjOi+HXoUANBWp3ENLroAiA=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-4ZKGajLtMdeOjwtgdLZXBA-1; Tue, 08 Aug 2023 22:14:15 -0400
X-MC-Unique: 4ZKGajLtMdeOjwtgdLZXBA-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1bf8e8f19b1so8850673fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 19:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691547254; x=1692152054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yR44ogH6UDfncEstCVw9mSlc1d7ANRRQAVF648wbdjc=;
        b=htqF/oSWcZHjSGED+g8F8+ZKSdp16+XW3DI2HN3hWIkB/y8XWAp662XqnM8AuayhW4
         Wwiqs6ZkQixbyIonZJ4oPnaqJ0Lo6e0tq2eCdtyHL09VI7H6AsPTnKqNTUAQMrTRgxm0
         +ZD3mZhb2jUjWKie7qtG8KXg6TLrVRIylZLCQyt/4j344CISKgxKoUYj4NMHcIl/Ahae
         oaehGCbJP52pKDSv1P0RFuwh7KrXpN0RStFjBu5ahXBkW9c5FH+Sod2/x/rxd9jzMMtn
         p3JgctFFXL0KL5JbRE9Qs8/3vO2Zx5N4IazGK6NH/F4rTpuaSjneHxsYRE1AI6Ih6Myl
         uEzw==
X-Gm-Message-State: AOJu0YxNgjySU4Aop4SbOuNi2EmW00r1YARTYwdN1c89y8EibUmGcPF4
	5UrQ3BbSFHntA8OqOz/nn24dJnc4CTm7X2IhUHohFxBrM/7WbWQ1wtEiMjqV/W7TIlwW2NEyINc
	OKU4BK4hETU+txCkD/LIYmYuNaF97gyWP6d79
X-Received: by 2002:a05:6870:40d1:b0:1be:d3a1:fd9 with SMTP id l17-20020a05687040d100b001bed3a10fd9mr1815544oal.9.1691547254606;
        Tue, 08 Aug 2023 19:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHviWJ7FwqHHQS/IFWOJZUUEtSZUVOo6M1kD/UsKsoQJL4BRummKJuVjUiXc3Pder8uF/0zRw==
X-Received: by 2002:a05:6870:40d1:b0:1be:d3a1:fd9 with SMTP id l17-20020a05687040d100b001bed3a10fd9mr1815505oal.9.1691547254170;
        Tue, 08 Aug 2023 19:14:14 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7ec:e667:6b7d:ed55:c363:a088])
        by smtp.gmail.com with ESMTPSA id v10-20020a4a8c4a000000b0054fba751207sm6475518ooj.47.2023.08.08.19.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 19:14:13 -0700 (PDT)
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
	Ingo Molnar <mingo@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v4 4/5] riscv/cmpxchg: Implement cmpxchg for variables of size 1 and 2
Date: Tue,  8 Aug 2023 23:13:09 -0300
Message-ID: <20230809021311.1390578-6-leobras@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809021311.1390578-2-leobras@redhat.com>
References: <20230809021311.1390578-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_191417_787516_C74F8F4C 
X-CRM114-Status: GOOD (  12.93  )
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
 arch/riscv/include/asm/cmpxchg.h | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 5a07646fae65..cfada8a7cfd2 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -72,6 +72,35 @@
  * indicated by comparing RETURN with OLD.
  */
 
+#define __arch_cmpxchg_masked(sc_sfx, prepend, append, r, p, o, n)	\
+({									\
+	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
+	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
+	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
+			<< __s;						\
+	ulong __newx = (ulong)(n) << __s;				\
+	ulong __oldx = (ulong)(o) << __s;				\
+	ulong __retx;							\
+	ulong __rc;							\
+									\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"0:	lr.w %0, %2\n"					\
+		"	and  %1, %0, %z5\n"				\
+		"	bne  %1, %z3, 1f\n"				\
+		"	and  %1, %0, %z6\n"				\
+		"	or   %1, %1, %z4\n"				\
+		"	sc.w" sc_sfx " %1, %1, %2\n"			\
+		"	bnez %1, 0b\n"					\
+		append							\
+		"1:\n"							\
+		: "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
+		: "rJ" ((long)__oldx), "rJ" (__newx),			\
+		  "rJ" (__mask), "rJ" (~__mask)				\
+		: "memory");						\
+									\
+	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+})
 
 #define __arch_cmpxchg(lr_sfx, sc_sfx, prepend, append, r, p, co, o, n)	\
 ({									\
@@ -98,6 +127,11 @@
 	__typeof__(*(ptr)) __ret;					\
 									\
 	switch (sizeof(*__ptr)) {					\
+	case 1:								\
+	case 2:								\
+		__arch_cmpxchg_masked(sc_sfx, prepend, append,		\
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
