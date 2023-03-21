Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BFEC74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 07:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHlaSvdYs2O34Rvqk4uzYlnDqd6whwD1u4mAQ1Z6i8A=; b=bwe+OHUW7EzYuj
	WHAgEDdqZm+LSAGt6rPx9fWZhvztO7d3sROTFvbySSEDH58ySjWNLSY6Y2sWRh46NTF2w63QR+gFB
	YUPNUSyEltXwoedyrvhzGNW6cZ5luKSZuB9413Be0VoluQI+HYR5OSMzSs8bRRolcJl/1xt1hpWYW
	3x4sFneA9kVCm7hcwEcoCsGKrIZQYCp4QtMIgAQXkAHKVcmV1UVnMDXH0jA88BEHSio7VS0WFtqsO
	7K+jTP+2tP8yX6bnIzUej5Y8UBgr0thlDi5k/ww8pwZ6rv1GAZzc49icps8rskWXEACfVUT4j0HXu
	fX+FIVdFnAw8jMdVUNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWeH-00BZHk-2h;
	Tue, 21 Mar 2023 07:43:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peWeE-00BZFe-1c
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 07:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679384586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yn+twTZLAkRdUYrcTaC/OxuB+ZzmlZ8IAyD5qH6ScI=;
	b=NBJ+lXR+Q5GOG2hhH7wbJ5MohgEgkjSjIM73FQDLFfCC2CfyaslrxPDGkq/ICi+LXhNDdI
	I510Se+zZVVqjEiv4yrkP5NT8G+fjacO1o6Btn8KoBgynFe2zGRl0IEfUYBViYWuWGK2Gz
	57i396Qu18gc87miphb21KHtNTvEuU4=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-rwRxPin6NUiQSJS7m_qyTw-1; Tue, 21 Mar 2023 03:43:05 -0400
X-MC-Unique: rwRxPin6NUiQSJS7m_qyTw-1
Received: by mail-oi1-f199.google.com with SMTP id bf33-20020a056808192100b003872286998bso425620oib.23
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 00:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679384584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yn+twTZLAkRdUYrcTaC/OxuB+ZzmlZ8IAyD5qH6ScI=;
        b=Z+NlX8SGvgGrWWHKtExsG2yFKxMzDTxVTeqZMwI2jkrOUYtIyb8CwZdzaZIV5Nl7t4
         yV0MK3MfoboK5dw3raY2I8qX8NlCzymLNQZk1QfoWasA6Gon6DogY+9zOJ+g2RF4njQl
         L7slfhuMDrgo7j8eKy8slV6xUtIPR/QR6Pr2BoEZaSGB7dHAaFd/OhJQjucLBk4ynvGu
         Uo3jXjAnmoDzvQK33udaEgdpfpWI8HzkjuXlC0lZbcPNB5WhQ9/bfaQ41E0AdgZSnKF0
         5Qfr5L1WoLWEiUxJe410GFx+DfM9s0pzlB1HY2VAI4ONgV7ZyItudP9X/zMEBZmvOY2i
         KDMg==
X-Gm-Message-State: AO0yUKXIpKKPZb32GWhut7pHguwOM5Cr59e4xVm3k3lX8IhD7zzlpNFD
	bNZ/DTk4X+vKUJv2AmSah7eIJgCqbTn/FiO78m4CZdeozg18KZMdR0zxzILaPYln1M6RT8tc7St
	hoK7EGH7Ltld2ofksiiV91CEkW5mzWVlsJ1eTpcU=
X-Received: by 2002:a05:6870:d38f:b0:177:9a8f:2a6a with SMTP id k15-20020a056870d38f00b001779a8f2a6amr638646oag.6.1679384584385;
        Tue, 21 Mar 2023 00:43:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set+5dYLqUwBoGwWqYbNO6rmNI6RXPTyQIcUwdLTaU41SFvlJEUkqNzr5SVTeAvo9r89hTVkcJg==
X-Received: by 2002:a05:6870:d38f:b0:177:9a8f:2a6a with SMTP id k15-20020a056870d38f00b001779a8f2a6amr638640oag.6.1679384584181;
        Tue, 21 Mar 2023 00:43:04 -0700 (PDT)
Received: from localhost.localdomain ([179.111.176.145])
        by smtp.gmail.com with ESMTPSA id az15-20020a05687c230f00b0016a37572d17sm4047729oac.2.2023.03.21.00.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 00:43:03 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH v2 1/6] riscv/cmpxchg: Deduplicate cmpxchg() asm functions
Date: Tue, 21 Mar 2023 04:42:44 -0300
Message-Id: <20230321074249.2221674-2-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321074249.2221674-1-leobras@redhat.com>
References: <20230321074249.2221674-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_004310_633632_E261D5C8 
X-CRM114-Status: GOOD (  10.48  )
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
