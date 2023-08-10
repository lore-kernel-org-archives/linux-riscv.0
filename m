Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53320C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 04:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izOomclOKv3b1AtOCt/0ghbMIzYcsmGSl6h9IX34lCI=; b=EmbNYxHkf2UJG6
	n7BbyiPn+HQGxxOwW9XNIH/RhG+OvBQEaFFs8XjC5EJttGqz3Vom2z1+U/rdWf7lxe0nrMa5ah0Uh
	Zv/NxNTaZc6qCjCxBhPUGvgakVh24sa8Ps6eUSD+hqajup9Q9Aec1+LVsAa+wEZVxa/EgLOAXyFPf
	EaWBq2XyiydjC+bUGLJnTi79BE2oDWQCQK8O8TS1J4eG6JlhfN4F8m8myph8CjFu6fcPsSsGUrv39
	ilMQKUh+UH6nn64pFBxhOIv9b72Z1qYMuI0tNaszdAIuTGfGIxXyGHWnrXWYFFUmXg44ncnzCcIKA
	QxkqMyDOGseiHq5XFJxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTwuf-006SnH-0I;
	Thu, 10 Aug 2023 04:04:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTwuc-006SmF-1F
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 04:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691640277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S9RDXJ5aWrysjU+rhwlqeMwMOsK56lpvgf+6LxPUCTg=;
	b=Nsy90srPitxzmQowEvTx4za6vEVJ3udyGRjbKCRQTraRRsyART3JMTHtZh2xxf2kJFVOvf
	adiT76RH2uudJhoZ3oTMasKB47bxDRLoPVS8Zgmp+M2O9UaT9ji0nlRsGuV+Ru1sR2S6nH
	Vgt7L3RDE9P/MvUts60C1LhYKQwCBnU=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-R_pjAyJZNYmlTVgBtr4S6g-1; Thu, 10 Aug 2023 00:04:34 -0400
X-MC-Unique: R_pjAyJZNYmlTVgBtr4S6g-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3a7292a2ad5so606782b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 21:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691640273; x=1692245073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9RDXJ5aWrysjU+rhwlqeMwMOsK56lpvgf+6LxPUCTg=;
        b=iVQhxNB52dYNv7FnvJIgc9RRgBk8VKIdg27JXw+S384HHVgt3wb1b02S0SZlj88jJh
         DYs4N11DZLKX/lQRZITmb4yhNoe6aCCg/aOzrQEUtHTlPEgwNcZ2Kdv5tcEhekFblj8I
         Lob80nmKZnmoOQ//gqF9xCWNQ2UvBOrHgYewyqZpSe4mOceiWNufbxYRmJb1nqg9sHlG
         Opq5I/pVJnJrlQHJaFkNEAG/FrS/T/jnyBt5Vyi6wSUFLFjDpAx6q2opFkytN9If3LMH
         kf957PVvu/i9t0HBVJusYbUztnMmUZT6r1ivbGZAmo04d+tAnZ3n+VGzs4MCxRMqUPOU
         MyRg==
X-Gm-Message-State: AOJu0YzdzBKwoRvs3YHtYEUVdG6QDKN10yOkwRmWmmaRy4A7uk9b55kF
	UA7D5CFBfQwzFO6M+avcWeOnBH1jSHlMZOLQ+Fb7aoTFYE9WaOfREh0l7lU8TXHBvPQGi9PJFYK
	BP5Lck+gjMD0RWSxdRwXhicdoayct
X-Received: by 2002:a05:6808:2124:b0:3a7:82e8:8fd1 with SMTP id r36-20020a056808212400b003a782e88fd1mr1804200oiw.20.1691640273708;
        Wed, 09 Aug 2023 21:04:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJGYyTweAhht6teeaheQlpzQ7zjq+oFXSk4DIrLLMDF2ExtlYA68o0L4A2hjKnDp8s+BMmiQ==
X-Received: by 2002:a05:6808:2124:b0:3a7:82e8:8fd1 with SMTP id r36-20020a056808212400b003a782e88fd1mr1804180oiw.20.1691640273540;
        Wed, 09 Aug 2023 21:04:33 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7ec:e667:6b7d:ed55:c363:a088])
        by smtp.gmail.com with ESMTPSA id b12-20020aca674c000000b003a7b5193909sm310087oiy.19.2023.08.09.21.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 21:04:33 -0700 (PDT)
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
Subject: [RFC PATCH v5 5/5] riscv/cmpxchg: Implement xchg for variables of size 1 and 2
Date: Thu, 10 Aug 2023 01:03:47 -0300
Message-ID: <20230810040349.92279-7-leobras@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810040349.92279-2-leobras@redhat.com>
References: <20230810040349.92279-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_210438_499118_C3E059CB 
X-CRM114-Status: GOOD (  12.27  )
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
index ac9d0eeb74e6..26cea2395aae 100644
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
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
