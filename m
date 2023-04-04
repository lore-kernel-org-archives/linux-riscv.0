Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13741C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 16:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UdBtOfEi0Yb13gMQ6xPuG+2akZkQBXNmlCO6z2Kp8hU=; b=WIluaT8MsboXWe
	EyfHTNWtJr3Y0e190n3oiaq+W1LNxZzcv6cRd4MUAgWZZ1t5f+oINApJpA2IvC3xvZy4gTXTnCIMI
	XyfrCZYDb7v/KhkgcqKL+d34DfLlFPN0pPfrMfBZNtaBDLW71W4T5kcgG3ooh36jtD48b9uOl9tNA
	jmJ13wIS3YKvy3Ly5QwVvJ+vsRCvZYqNDML0b5mrhk/n2KvSYQd37mObHceS7AwP95T/zR9h95qMu
	gl+vo5MUd2fT4900caTZ1CgZgK3N8kA/FSf9/vge/zvfAmtkLCpz6eO6bkE0TklKnysfb0reoXDUq
	1t8HgxU+M6JykphM+W2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjfV-002Ems-2M;
	Tue, 04 Apr 2023 16:38:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjfS-002ElQ-05
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 16:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680626277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5L3HWpAkpN3snqo22epQ9Rf+TQRWSZtMYOZoBBQpjwA=;
	b=gqruWcErEOWlx7KXWCg/Sa9g0l4LP5onV4VMHctiR9HQSFpRHNrFDNyMXCf4tbSbkhv1hJ
	n90qI8fGuTXokkrrL6nm0J+A8MNG/1uio/LtbOGat0LRcOTpM30kv5OMZlupabCtSDIKSc
	Wj1RUH/uiVJP6mP4XmFVI+rjaPV7OTg=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-PhGZu9JMPty8_u_bmzmeGw-1; Tue, 04 Apr 2023 12:37:55 -0400
X-MC-Unique: PhGZu9JMPty8_u_bmzmeGw-1
Received: by mail-oo1-f71.google.com with SMTP id 62-20020a4a0341000000b0053e2e3db15dso7379792ooi.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 09:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680626275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5L3HWpAkpN3snqo22epQ9Rf+TQRWSZtMYOZoBBQpjwA=;
        b=k6HFy8uJdCwPmaWawxtNu1RVHDl3J9gbokbaitbTkI96w/anouD+7O1lEZW8vX3AlP
         A9ArzpNM9UaDqxf2Q/ah8UnbA7zgrbmdK2ZJdMv3fzwv/fCfbTGdTIHSi2N4rO80j54l
         ReIWH2tygfuPTQxt9HHY5aYk5AanqcYZpFRtIbrj/BcsVuKCsepbYKu4716/3ukKhkUl
         FMGtHnjEW60Qryfw+wpgJaAjd/cR6JlErASeVOO1RhgUqOhNk5Uze9lr15FIQvHnnkv5
         iCYH48OrkzeLwjKN1uh3PhDinJ5go9pCxcQWwuGo/8zILpIdl8I+rP7vdaMWEcgHscVT
         XVJA==
X-Gm-Message-State: AAQBX9ch5lgH5in8oJPjKmmn7fgPr/bmJPj5SUFJBGUsWQLS6O3ZODfL
	rH2Vxsrrqf1CWVes3QTsp4IMGRS2tsrxq04lDHPBONcAFDV3p4Gpqe490RY4r+/CTi6eG1nXIt0
	zwOwWkOfD3bIZEmAw2jJgZRslnNZ+
X-Received: by 2002:a05:6808:2a8d:b0:38b:5e4:9d3b with SMTP id fc13-20020a0568082a8d00b0038b05e49d3bmr1486715oib.4.1680626275008;
        Tue, 04 Apr 2023 09:37:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350aJ2KGdlh0EzLpckgpOVoJxkOrXA0su/AVKejuIMw/SU54LRZ1/NiSU07C24R5ULdhhMlwE/g==
X-Received: by 2002:a05:6808:2a8d:b0:38b:5e4:9d3b with SMTP id fc13-20020a0568082a8d00b0038b05e49d3bmr1486669oib.4.1680626273296;
        Tue, 04 Apr 2023 09:37:53 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a802:2599:c6a8:e6db:a08:61b6])
        by smtp.gmail.com with ESMTPSA id bd1-20020a056808220100b0038755008179sm5264623oib.26.2023.04.04.09.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:37:52 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 2/6] riscv/cmpxchg: Deduplicate cmpxchg() macros
Date: Tue,  4 Apr 2023 13:37:37 -0300
Message-Id: <20230404163741.2762165-3-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404163741.2762165-1-leobras@redhat.com>
References: <20230404163741.2762165-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_093758_143610_AA83F9B5 
X-CRM114-Status: GOOD (  10.87  )
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

Every cmpxchg define (_relaxed, _acquire, _release, vanilla) contain it's
own define for creating tmp variables and selecting the correct asm code
for give variable size.

All those defines are mostly the same code (other than specific barriers),
so there is no need to keep the 4 copies.

Unify those under a more general define, that can reproduce the previous 4
versions.

(This did not cause any change in generated asm)

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/cmpxchg.h | 82 ++++++--------------------------
 1 file changed, 14 insertions(+), 68 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 22f2ad13cad71..f76a82274a4fd 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -164,8 +164,8 @@
  * indicated by comparing RETURN with OLD.
  */
 
-#define ___cmpxchg(lr_sfx, sc_sfx, prepend, append, r, rc, p, co, o, n)	\
-{									\
+#define ____cmpxchg(lr_sfx, sc_sfx, prepend, append, r, rc, p, co, o, n)\
+({									\
 	__asm__ __volatile__ (						\
 		prepend							\
 		"0:	lr" lr_sfx " %0, %2\n"				\
@@ -177,9 +177,9 @@
 		: "=&r" (r), "=&r" (rc), "+A" (*(p))			\
 		: "rJ" (co o), "rJ" (n)					\
 		: "memory");						\
-}
+})
 
-#define __cmpxchg_relaxed(ptr, old, new, size)				\
+#define ___cmpxchg(ptr, old, new, size, sc_sfx, prepend, append)	\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(ptr)) __old = (old);				\
@@ -188,12 +188,12 @@
 	register unsigned int __rc;					\
 	switch (size) {							\
 	case 4:								\
-		___cmpxchg(".w", ".w", "", "",				\
-			   __ret, __rc, __ptr, (long), __old, __new);	\
+		____cmpxchg(".w", ".w" sc_sfx, prepend, append,		\
+			    __ret, __rc, __ptr, (long), __old, __new);	\
 		break;							\
 	case 8:								\
-		___cmpxchg(".d", ".d", "", "",				\
-			   __ret, __rc, __ptr, /**/, __old, __new);	\
+		____cmpxchg(".d", ".d" sc_sfx, prepend, append,		\
+			    __ret, __rc, __ptr, /**/, __old, __new);	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -201,6 +201,9 @@
 	__ret;								\
 })
 
+#define __cmpxchg_relaxed(ptr, old, new, size)				\
+	___cmpxchg(ptr, old, new, size, "", "", "")
+
 #define arch_cmpxchg_relaxed(ptr, o, n)					\
 ({									\
 	__typeof__(*(ptr)) _o_ = (o);					\
@@ -210,26 +213,7 @@
 })
 
 #define __cmpxchg_acquire(ptr, old, new, size)				\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(*(ptr)) __old = (old);				\
-	__typeof__(*(ptr)) __new = (new);				\
-	__typeof__(*(ptr)) __ret;					\
-	register unsigned int __rc;					\
-	switch (size) {							\
-	case 4:								\
-		___cmpxchg(".w", ".w", "", RISCV_ACQUIRE_BARRIER,	\
-			   __ret, __rc, __ptr, (long), __old, __new);	\
-		break;							\
-	case 8:								\
-		___cmpxchg(".d", ".d", "", RISCV_ACQUIRE_BARRIER,	\
-			   __ret, __rc, __ptr, /**/, __old, __new);	\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
+	___cmpxchg(ptr, old, new, size, "", "", RISCV_ACQUIRE_BARRIER)
 
 #define arch_cmpxchg_acquire(ptr, o, n)					\
 ({									\
@@ -240,26 +224,7 @@
 })
 
 #define __cmpxchg_release(ptr, old, new, size)				\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(*(ptr)) __old = (old);				\
-	__typeof__(*(ptr)) __new = (new);				\
-	__typeof__(*(ptr)) __ret;					\
-	register unsigned int __rc;					\
-	switch (size) {							\
-	case 4:								\
-		___cmpxchg(".w", ".w", RISCV_RELEASE_BARRIER, "",	\
-			   __ret, __rc, __ptr, (long), __old, __new);	\
-		break;							\
-	case 8:								\
-		___cmpxchg(".d", ".d", RISCV_RELEASE_BARRIER, "",	\
-			   __ret, __rc, __ptr, /**/, __old, __new);	\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
+	___cmpxchg(ptr, old, new, size, "", RISCV_RELEASE_BARRIER, "")
 
 #define arch_cmpxchg_release(ptr, o, n)					\
 ({									\
@@ -270,26 +235,7 @@
 })
 
 #define __cmpxchg(ptr, old, new, size)					\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(*(ptr)) __old = (old);				\
-	__typeof__(*(ptr)) __new = (new);				\
-	__typeof__(*(ptr)) __ret;					\
-	register unsigned int __rc;					\
-	switch (size) {							\
-	case 4:								\
-		___cmpxchg(".w", ".w.rl", "", "	fence rw, rw\n",	\
-			   __ret, __rc, __ptr, (long), __old, __new);	\
-		break;							\
-	case 8:								\
-		___cmpxchg(".d", ".d.rl", "", "	fence rw, rw\n",	\
-			   __ret, __rc, __ptr, /**/, __old, __new);	\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
+	___cmpxchg(ptr, old, new, size, ".rl", "", "	fence rw, rw\n")
 
 #define arch_cmpxchg(ptr, o, n)						\
 ({									\
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
