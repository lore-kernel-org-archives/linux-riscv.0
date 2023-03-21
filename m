Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B939C74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 07:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHlaSvdYs2O34Rvqk4uzYlnDqd6whwD1u4mAQ1Z6i8A=; b=VEgI1RyX40hIRY
	krGX62Z072ZsVom3kASkgGZ4meoBRtAtzuLvQZVwNRShnIfqy4wa3ZCuZXrnpODl8g75L7JfdBVR6
	TjZ5HBDHvEVhUddcVwAST2owk8yTfK986vLmVXNjjSsVFZknXDX5wzbxwUFNvG9+zMcz2pGlYAhi2
	ZRsJXEIEZtxvRsR8U4E0b/XJal7+sFITOtJNFXMRshSQe29nsgSRfS4mR61t6Zaw+OgP3C77S5YyD
	mOJS52zYUKLJgc8F8oYQ7n4UNdMye1hRzCscuVyOGkewfrXRU1esqLt1teHFudYEV0O47QkfaaxTv
	D4XLw2i1a23PMOcHri6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWgR-00Ba2E-1R;
	Tue, 21 Mar 2023 07:45:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peVcD-00BOg4-3A
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 06:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679380621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yn+twTZLAkRdUYrcTaC/OxuB+ZzmlZ8IAyD5qH6ScI=;
	b=VRxdyK4obRbBr4wiMQKzlUc4Pf3cvT8+IMOhMuWdI8TEUTZJGFxY7jyxqgYQ+jv4Wk7UDX
	5DZeXoxLvKUOJ5HIunZ0suTfxTKgVFMKvj04JUBuEi21uPJgBoBo81EemQ5oDfpGoEf1LU
	Zd2FYcoEpGU6itXXz4Y2TWStX2HCRUw=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-RhybAhDQMtKNj26hB-zmLw-1; Tue, 21 Mar 2023 02:35:07 -0400
X-MC-Unique: RhybAhDQMtKNj26hB-zmLw-1
Received: by mail-ot1-f70.google.com with SMTP id f5-20020a9d7b45000000b0069de62bd459so5931008oto.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Mar 2023 23:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679380506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yn+twTZLAkRdUYrcTaC/OxuB+ZzmlZ8IAyD5qH6ScI=;
        b=Jk2nz9Vu0hKSPO7IbMBx5cYXNPmGucSzW05px8r9MqCguhZ/JzUBQLvUfQfKBKL4XY
         J89UTQxdroMkm/9wBWIes601S29Knv96ZnHJrNPOrU2KMLVv8dlXQnwTes/LVsWgHV01
         Xffo3IsZ8yFUou9SACdCRGG7zzoJR6TA5rUqPSNd8rMGGfjhtrN7D8+6QYa981ozglXz
         8ei5GfpTINwQyucHeLwWfSWjfJ50XgZkvnKN1+3BBdh6ytg9dLXwx+z3tVKxRrRZ4kEu
         8QC2B4BhDtPFJra9rdfiL2zWZ1mFynEu7loXdegfaX15ZXqeavE44oNOaS2D7LggvNB4
         i7bA==
X-Gm-Message-State: AO0yUKWPdLm7KqaqU6z9ZyqpC5HkEzlaqwCsAFfQh6VT14qyHx6OCzo7
	BeeO2zfllJE09pGMw5kXguK7mr8dYX2HGmPzIYeiOTfXD9XFWUeV6mCyGKkgezmJvIVb/7dE75H
	RlFCGmMhP0wcDhK3HLxyAKcw68xjT
X-Received: by 2002:a54:4701:0:b0:378:a0a7:28f7 with SMTP id k1-20020a544701000000b00378a0a728f7mr528776oik.12.1679380506590;
        Mon, 20 Mar 2023 23:35:06 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Ix8nFzCmSs1nVoqG+lWvsTt2azP1iAEn9WCvxRCXt1aI3nbpR0Jc6QahudBAHlsmKgkMNzA==
X-Received: by 2002:a54:4701:0:b0:378:a0a7:28f7 with SMTP id k1-20020a544701000000b00378a0a728f7mr528768oik.12.1679380506290;
        Mon, 20 Mar 2023 23:35:06 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:b074:274d:d04e:badc:c89f])
        by smtp.gmail.com with ESMTPSA id y75-20020a4a454e000000b005293e9a12f5sm4545147ooa.45.2023.03.20.23.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 23:35:05 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/6] riscv/cmpxchg: Deduplicate cmpxchg() asm functions
Date: Tue, 21 Mar 2023 03:34:27 -0300
Message-Id: <20230321063430.2218795-2-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321063430.2218795-1-leobras@redhat.com>
References: <20230321063430.2218795-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_233702_094053_A90D267D 
X-CRM114-Status: GOOD (  10.72  )
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

In this header every cmpxchg define (_relaxed, _acquire, _release,
vanilla) contain it's own asm file, both for 4-byte variables an 8-byte
variables, on a total of 8 versions of mostly the same asm.

This is usually bad, as it means any change may be done in up to 8
different places.

Unify those versions by creating a new define with enough parameters to
generate any version of the previous 8.

(This did not cause any change in generated asm)

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/cmpxchg.h | 102 ++++++++-----------------------
 1 file changed, 24 insertions(+), 78 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 12debce235e52..21984d24cbfe7 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -163,6 +163,22 @@
  * store NEW in MEM.  Return the initial value in MEM.  Success is
  * indicated by comparing RETURN with OLD.
  */
+
+#define ___cmpxchg(lr_sfx, sc_sfx, prepend, append)			\
+{									\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"0:	lr" lr_sfx " %0, %2\n"				\
+		"	bne  %0, %z3, 1f\n"				\
+		"	sc" sc_sfx " %1, %z4, %2\n"			\
+		"	bnez %1, 0b\n"					\
+		append							\
+		"1:\n"							\
+		: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)		\
+		: "rJ" ((long)__old), "rJ" (__new)			\
+		: "memory");						\
+}
+
 #define __cmpxchg_relaxed(ptr, old, new, size)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
@@ -172,26 +188,10 @@
 	register unsigned int __rc;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			"0:	lr.w %0, %2\n"				\
-			"	bne  %0, %z3, 1f\n"			\
-			"	sc.w %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" ((long)__old), "rJ" (__new)		\
-			: "memory");					\
+		___cmpxchg(".w", ".w", "", "");				\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			"0:	lr.d %0, %2\n"				\
-			"	bne %0, %z3, 1f\n"			\
-			"	sc.d %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
-			: "memory");					\
+		___cmpxchg(".d", ".d", "", "");				\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -216,28 +216,10 @@
 	register unsigned int __rc;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			"0:	lr.w %0, %2\n"				\
-			"	bne  %0, %z3, 1f\n"			\
-			"	sc.w %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			RISCV_ACQUIRE_BARRIER				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" ((long)__old), "rJ" (__new)		\
-			: "memory");					\
+		___cmpxchg(".w", ".w", "", RISCV_ACQUIRE_BARRIER);	\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			"0:	lr.d %0, %2\n"				\
-			"	bne %0, %z3, 1f\n"			\
-			"	sc.d %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			RISCV_ACQUIRE_BARRIER				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
-			: "memory");					\
+		___cmpxchg(".d", ".d", "", RISCV_ACQUIRE_BARRIER);	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -262,28 +244,10 @@
 	register unsigned int __rc;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"0:	lr.w %0, %2\n"				\
-			"	bne  %0, %z3, 1f\n"			\
-			"	sc.w %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" ((long)__old), "rJ" (__new)		\
-			: "memory");					\
+		___cmpxchg(".w", ".w", RISCV_RELEASE_BARRIER, "");	\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"0:	lr.d %0, %2\n"				\
-			"	bne %0, %z3, 1f\n"			\
-			"	sc.d %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
-			: "memory");					\
+		___cmpxchg(".d", ".d", RISCV_RELEASE_BARRIER, "");	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -308,28 +272,10 @@
 	register unsigned int __rc;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			"0:	lr.w %0, %2\n"				\
-			"	bne  %0, %z3, 1f\n"			\
-			"	sc.w.rl %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			"	fence rw, rw\n"				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" ((long)__old), "rJ" (__new)		\
-			: "memory");					\
+		___cmpxchg(".w", ".w.rl", "", "	fence rw, rw\n");	\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			"0:	lr.d %0, %2\n"				\
-			"	bne %0, %z3, 1f\n"			\
-			"	sc.d.rl %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			"	fence rw, rw\n"				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
-			: "memory");					\
+		___cmpxchg(".d", ".d.rl", "", "	fence rw, rw\n");	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
