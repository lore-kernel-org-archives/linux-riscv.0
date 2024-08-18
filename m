Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721B7C5320E
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Aug 2024 06:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIYKzYAy9htyicTO37z/htPyr9TDIPQNPJqxANxy+yY=; b=ejVqSY5PmCzagC
	XugV8QpL6/59r/ySKwRaTOzE8EEH4wDJd8Z9J2BIBD3SCe5BlhDyOW/uI7H4rQo4zsiLCOik4IYxt
	asiN1PI9uRed0ckUoLoA9gT3I1hfB7Q9M9nzTZCQYNqMZvpCKc7Id7Efigj3rzdunKAr5XC5NxVvf
	LrSAz5uwQJDW0LdVdclBEZH1oSlDPtSPF+vvzebgJqhNSBQpohX43TYxB0rO0h95s1a7kxL0mXgNz
	JM/OydEHuW7/T986LdAKtX+pUJx5f4xFiDYU9Ro7/MOY5fjKzfphokR28yv1wmT9Pjg1n9j5FyjxI
	GDHxZ4Wpbu4Tvo5wQg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZdu-0000000GELi-19pR;
	Sun, 18 Aug 2024 06:43:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZdr-0000000GEKw-1pCh
	for linux-riscv@lists.infradead.org;
	Sun, 18 Aug 2024 06:43:56 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-428178fc07eso23532085e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 17 Aug 2024 23:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723963434; x=1724568234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3v3ACeRnW6fQEuje9seVAm+KH7JNORlBJR9qvXfha0=;
        b=DEQu9nBSeZE29ZXsCGkC7i9maXOHlkVb4YmzV4BgNGHbl5AjcsZEHD/PvQhxi2RR90
         oIGEH7o4YWd2WDRqNSvfsXhfOnFUa2T4qLfhZbV2/W09tNryakQ4ebDBAupwqpiw0WyN
         ZrIXyvmiIZH4gWFZ2JrVdepiPR2jqqtLdH8Otcy8QjCT7jlHo/3t1/NngloNsxWvOCuU
         qLOV5i3pfqP4IXckBnY9wLWCqLCQTXy/EAyYxXk1m5qEc4bWYX3l6Pt7hu1OFdpBXr9E
         qAS1thQiwGQz8rEzPr2mxHdd9gqVGyb5vkI4OBt09C7YvTuteLw7chmoLf8DEeuQ/PwJ
         7Myg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723963434; x=1724568234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3v3ACeRnW6fQEuje9seVAm+KH7JNORlBJR9qvXfha0=;
        b=uUVrsOLgxn9TTvgvBpaDXua0AgcHLZeSfMvioE6D1CukmDZ2cNgrUbdvBdcI6WBCRV
         KvZv8KJ8BLGRdTMaR4DpLuKDbrz/0MtO1aN0WjvfgKdjhjVWMaL8Id0tQVEO1xVceIb7
         dKkPl0EH+I8ZK14wm0T2mPpoVAHL0zLiLyUNA/VkF6UdoGcTBLtJM6j7IxgdkluGQBp4
         yOle2Cg9PVS2WT+ejL/tvH2WIkWVsQeD8z7ASIrE6Vc+/l7+NzVRUB0lkKCX5cUzfSnW
         Ws+up9QSf6P3g92quNcW6d0VXW2weIR03JV4F0hZJNZ7xWitv1PvM9eTOymIij3eZlst
         Z2vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfJeZFSmOsdKL1XeTInBPrMd4uQb+VJ6q6xTMdtDFQXqnpnR8De9jA1areq5upDULJCMfUcEWXRl4h6lnHzPV81C3p5zXQusDjxITD7nGk
X-Gm-Message-State: AOJu0Ywu5HGRy2GVT1YStyk72g7DSOeLwrPZiQaSV4gLCtcn7lrqGQCT
	JC6JUmqN9i0vzxwCMQ1LDjV92i7o5wtdDdwhn7Ql1mIKvpq3/KPNMWL774+MVcA=
X-Google-Smtp-Source: AGHT+IGdpiZerNesAs6xzBEap+g5NepzOjC8cdpysjNsTdJ9hLtJ74EBvU/xnjt3uajkBUnG6SvmcQ==
X-Received: by 2002:a05:600c:3509:b0:426:64a2:5362 with SMTP id 5b1f17b1804b1-429ed7a6100mr51627275e9.8.1723963433892;
        Sat, 17 Aug 2024 23:43:53 -0700 (PDT)
Received: from alex-rivos.guest.squarehotel.net ([130.93.157.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed4a857bsm66904395e9.0.2024.08.17.23.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 23:43:53 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 08/13] riscv: Implement xchg8/16() using Zabha
Date: Sun, 18 Aug 2024 08:35:33 +0200
Message-Id: <20240818063538.6651-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240818063538.6651-1-alexghiti@rivosinc.com>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_234355_497576_97D42BFC 
X-CRM114-Status: GOOD (  10.02  )
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

This adds runtime support for Zabha in xchg8/16() operations.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/cmpxchg.h | 65 ++++++++++++++++++++------------
 1 file changed, 41 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 05ba8a8e2ef5..19779d4d134a 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -14,29 +14,41 @@
 #include <asm/insn-def.h>
 #include <asm/cpufeature-macros.h>
 
-#define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)		\
-({									\
-	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
-	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
-	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
-			<< __s;						\
-	ulong __newx = (ulong)(n) << __s;				\
-	ulong __retx;							\
-	ulong __rc;							\
-									\
-	__asm__ __volatile__ (						\
-	       prepend							\
-	       "0:	lr.w %0, %2\n"					\
-	       "	and  %1, %0, %z4\n"				\
-	       "	or   %1, %1, %z3\n"				\
-	       "	sc.w" sc_sfx " %1, %1, %2\n"			\
-	       "	bnez %1, 0b\n"					\
-	       append							\
-	       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
-	       : "rJ" (__newx), "rJ" (~__mask)				\
-	       : "memory");						\
-									\
-	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+#define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,		\
+			   swap_append, r, p, n)				\
+({										\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {		\
+		__asm__ __volatile__ (						\
+			prepend							\
+			"	amoswap" swap_sfx " %0, %z2, %1\n"		\
+			swap_append						\
+			: "=&r" (r), "+A" (*(p))				\
+			: "rJ" (n)						\
+			: "memory");						\
+	} else {								\
+		u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
+		ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
+		ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
+				<< __s;						\
+		ulong __newx = (ulong)(n) << __s;				\
+		ulong __retx;							\
+		ulong __rc;							\
+										\
+		__asm__ __volatile__ (						\
+		       prepend							\
+		       "0:	lr.w %0, %2\n"					\
+		       "	and  %1, %0, %z4\n"				\
+		       "	or   %1, %1, %z3\n"				\
+		       "	sc.w" sc_sfx " %1, %1, %2\n"			\
+		       "	bnez %1, 0b\n"					\
+		       sc_append						\
+		       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
+		       : "rJ" (__newx), "rJ" (~__mask)				\
+		       : "memory");						\
+										\
+		r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+	}									\
 })
 
 #define __arch_xchg(sfx, prepend, append, r, p, n)			\
@@ -59,8 +71,13 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
+		__arch_xchg_masked(sc_sfx, ".b" swap_sfx,		\
+				   prepend, sc_append, swap_append,	\
+				   __ret, __ptr, __new);		\
+		break;							\
 	case 2:								\
-		__arch_xchg_masked(sc_sfx, prepend, sc_append,		\
+		__arch_xchg_masked(sc_sfx, ".h" swap_sfx,		\
+				   prepend, sc_append, swap_append,	\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 4:								\
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
