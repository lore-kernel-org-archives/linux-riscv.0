Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A32C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 04:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8LXlnLMJ+i11qJbvDt8Lqbc4WCq9mmT0tJXinXTdE4=; b=znjIJYD4QsdOnj
	2Db21o51XXIT3rGlkMbLCMWCXTX1Z6VBZS3EcF3cXmH25U62+ul/idZgkbvjj82FZouNlg/gTd3np
	LKkI/kQxZFdp1QxWBLha0BckpcrzelwNchdRqeNZX00c5RuCZ8VE1MDYhVcszoK+Dw1KthHXSimvO
	JpFe1y9LbE30FIIyGyT6az3ryXUevHhfkmy5bDkwIQKeh3ev/Gk54Zw8Kw/cmcWkxy/tD0jnlm1C+
	jCHGPaIRHnmY9RqarjUl3pbG2qPTWNlVRWtkS7mBWOEB1H/Zt8UgeZYCPfOhXQvTA5jugDgde3uza
	dw5O5+7fj5SlkgShOW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTwuY-006Skc-1J;
	Thu, 10 Aug 2023 04:04:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTwuV-006Siv-0f
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 04:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691640270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VLwtkHrR4Hnv0SG2htyTx6O/VUdZ3YGDzB9YQqYciKw=;
	b=ZJh+gD58YFKorM+mjD1OZHbfXfE2+sxf5mdm30T6EVunMdzZYqnI7ks7hp8dm0xRK55iPj
	O6cocUNU5aOQWSHC0FXZYDtd32oX7HOhxv4Qap+8gRFalvL1z/VTq4YOIQQOKucgE4ex+/
	d0DKpIxgIrZvClrgQzWEHrmAF+/BMlA=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-e8LgNQtnOuqESZVNJTAffA-1; Thu, 10 Aug 2023 00:04:29 -0400
X-MC-Unique: e8LgNQtnOuqESZVNJTAffA-1
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3a7697e580fso597221b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 21:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691640268; x=1692245068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLwtkHrR4Hnv0SG2htyTx6O/VUdZ3YGDzB9YQqYciKw=;
        b=G7ertk+Rp/PtALQTALXaipxi/Uqg54TsetDjIxIc2SZwf47LEqm7GJVg2Z4TG4aDXN
         +41iSRZ6BiZbB52KxZlpoFS5JbrlKOtls4vnnfheRYL+630RVnP2/zWb9t8NQVvYDeUg
         b1HyJJd6p/EcpdwvyrjQepM1ueHmLsBHRw0iKs6V21n3zSyPkadG778dl87iV0NBHYpE
         mQsZfFwkNk1tFVtbgYw+i2+iw+zxGD+tzyytQEqzf6xXBRBcAu51QOAe0imDajAFdVp+
         zI+tCuADMiYKOP30k31QauhY+z26sZduA0cejaZsFHmDjZ9oYuIWvUdtMfm7V2fJuWXe
         3BcA==
X-Gm-Message-State: AOJu0YzmgXRISYQruo7MdYgiqVVBVWyXsIXNib6Q4c4G4gklALnTzPN6
	hXhgBHgC4XfvEJoATzP2V3uYtbxokWXy4wADpi9B4W5vQ6ut5sTZ+WvYZtD4qyxI9knChapn02w
	BEOEmf6ilnv8jUuypPwotvGaNgkv5
X-Received: by 2002:a05:6808:10cc:b0:3a3:d7de:5cfa with SMTP id s12-20020a05680810cc00b003a3d7de5cfamr1819120ois.11.1691640268299;
        Wed, 09 Aug 2023 21:04:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAdIAbs7Buum1URpEJTh5T57eb0r1XDUCa+aKbZcc1fbEPGJr7vKxHbONmynKMK+8Fsxl9cg==
X-Received: by 2002:a05:6808:10cc:b0:3a3:d7de:5cfa with SMTP id s12-20020a05680810cc00b003a3d7de5cfamr1819092ois.11.1691640268064;
        Wed, 09 Aug 2023 21:04:28 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7ec:e667:6b7d:ed55:c363:a088])
        by smtp.gmail.com with ESMTPSA id b12-20020aca674c000000b003a7b5193909sm310087oiy.19.2023.08.09.21.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 21:04:27 -0700 (PDT)
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
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v5 4/5] riscv/cmpxchg: Implement cmpxchg for variables of size 1 and 2
Date: Thu, 10 Aug 2023 01:03:46 -0300
Message-ID: <20230810040349.92279-6-leobras@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810040349.92279-2-leobras@redhat.com>
References: <20230810040349.92279-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_210431_314659_A0F9A14C 
X-CRM114-Status: GOOD (  12.63  )
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
index e3e0ac7ba061..ac9d0eeb74e6 100644
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
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
