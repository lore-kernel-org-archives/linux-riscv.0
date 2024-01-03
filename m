Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD03CC47077
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sGYGqyPxu7fbmQUHYmySBfiUawr01wrikgw6rwZ0mdw=; b=lKSJohW4Ycmprr
	E3qjkhB6emPJhTopL51NzWqvE/ZpNh1LwXxBcPFKnEbpK8eX1Qg8kNQ0wjw8ZnmhS/mRJfbrvnOXK
	T33Zy4ezSEVxJiz7OwhwV/x9H7znG4oQ6KklNFVd563p8042nXV5kLLQpSPdfuAflmxGQtnDe8yOb
	APcVUVXChlBjxEgkXD6FT2Z9TKUbLpWCMQISdCJ7YG6CwnSeKiDcpikxe4n8LKnQ6eh6Sd9DTAfXG
	ZNiYwPAP3yWnE7YKXJVg87WaDWEsR9GgE0bBjT/Gfmud69H2qYjtpY0119ouo/ywdJtyYL19wdSYn
	oLEahiR+vpYxXYuy8xMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4At-00BP4h-26;
	Wed, 03 Jan 2024 16:32:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4Ar-00BP3O-0c
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 16:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704299576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zrl9wQMm72/9gkP6lQrsUXatEy2G8nXg2opkxwrV5kI=;
	b=KbQGIeIGD4JKjW6veg1igxK5wtP7Ypfo0QBKnFDqzvXaJ70sWci/mLdIpEKTiKlSr4nolP
	IVU2rk8o3Dp6PRvSSP9mFw9BjvwypMnyDg2g392IWZS1Hccn3sDxMKwypYwDBGZDnYm56v
	3NcOa78PMTohtfA/Mb5hXnSn7vV6o5c=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-IVe_o-aNPZuw0Ptl36qlBw-1; Wed, 03 Jan 2024 11:32:54 -0500
X-MC-Unique: IVe_o-aNPZuw0Ptl36qlBw-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1d4931d651aso50666485ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 08:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704299574; x=1704904374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zrl9wQMm72/9gkP6lQrsUXatEy2G8nXg2opkxwrV5kI=;
        b=eQaDj/njY+/8fpETS7rG2N/JWjulYS56edCrt3P9+v3OhX0WcVaGRUMgaqs2M//4NG
         aRIvSq50YjC3n7Hds9XiYZVI/6ge73QUQDr7PR9CInclNOol7f93MN92g/hPLOOijDw1
         qhYF0NRUjGy8cS/ceOzXake7kO6UeFwFUdBXoU/uHm9c13NJdsGaouMDHSZ4WK8hMcvl
         pxPyhFkEXXWPhNIL6hQOJslHtzbyeLs370gVKdNuWT3a0FU7+R26/baL/WbJG2Is2h+j
         plSbgNCiaSE4tpMjs4IpBfebJuKdwpVcUW2X83uXFDiSe1sXfwxeeHttQqPUv7lZiImE
         YfPg==
X-Gm-Message-State: AOJu0YxZmwCMdC0G15XE+Ja9VtWNi8jcCZ1cTJlPDBpl3oXMyDTcUcSn
	OSde16HIKcrW8UHfVfaCJnd8qLnppBfEuWU1V5hrDuSUeOoMz0l0o9/WhSYaXR7w2+PfCgrjsF8
	DITQXDUDGZSeVyoDGe7zjyNpN9Tn0tWSEvUS9
X-Received: by 2002:a17:902:b213:b0:1d4:3dfd:7e31 with SMTP id t19-20020a170902b21300b001d43dfd7e31mr20225794plr.139.1704299573992;
        Wed, 03 Jan 2024 08:32:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuxxr3jzBnWJLb5k5Ijiau2Uo52Uln5XHUYl8Xl2mWgyNYjwzpHX8ACzhU950ngT5irx/v3w==
X-Received: by 2002:a17:902:b213:b0:1d4:3dfd:7e31 with SMTP id t19-20020a170902b21300b001d43dfd7e31mr20225778plr.139.1704299573733;
        Wed, 03 Jan 2024 08:32:53 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902b78c00b001cfca7b8ee7sm23930425pls.99.2024.01.03.08.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 08:32:53 -0800 (PST)
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
Subject: [PATCH v1 4/5] riscv/cmpxchg: Implement cmpxchg for variables of size 1 and 2
Date: Wed,  3 Jan 2024 13:32:02 -0300
Message-ID: <20240103163203.72768-6-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103163203.72768-2-leobras@redhat.com>
References: <20240103163203.72768-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_083257_299498_BAABD170 
X-CRM114-Status: GOOD (  12.59  )
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
Tested-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/cmpxchg.h | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index e3e0ac7ba061b..ac9d0eeb74e67 100644
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
 	__typeof__(*(__ptr)) __ret;					\
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
