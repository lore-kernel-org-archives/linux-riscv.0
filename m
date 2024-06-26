Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC173C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xs4G8KbKzKlJbj7y9NGgCjChOv787yNFIEviursqOh8=; b=uwFpyFDt+82TKv
	dHXGuc0mL7WSQGQamlG/w1XkF7GfjHxgkcylGi6/oODvAS3zAIBaoJ8GXBpVwwCJI6rCzmQTPIpJ+
	YxALQ9PqQRlUXwC/grpvg1ln7X0UV0onnq9Ak3nxAHwzWcFYBng+NAa25CLzoOPfIetlLWggAUv+P
	7NRuUW7P+Oii+eXUgW7QCc5otCX3K6Dbn/zt7rfc4YHMXf7wlUeVM6gAbdbYfxZR9ycdQ/3uBFA1/
	DMpiqRWbmDiUmkqKEE66SsUxDUDwkCNnNsxvJ3IKLKax6WRmwEnoEno9cAo+4wiqN8/tiylC85eRC
	4EjmTsvE/pYrA/0yQs3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSQa-00000006tYN-0BB0;
	Wed, 26 Jun 2024 13:11:12 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSQQ-00000006tUW-0WBw
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:11:03 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-52caebc6137so6355531e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 06:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719407460; x=1720012260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6cx0+kPy/mr4m8koR629ifIafAeU6/dHlLYYLSwNIk=;
        b=yjhZ6SLQuff+D61fZNaJ5telqSrK2vjZ9W9frNZ0k2J6HPfdDvlAWlRUH/g2SOXdwN
         kb0Q9iT+wGYlWnCEYXmsTsUcorxI84jSWjvbo3BhUQZjEovFdmvnOdiyiTxsnPiHyZ6s
         yPJCqyBSZ5eopnc3syIg+V8b5zYt4Le2IkrhzjMpxupLj9jyu6ii9dukkgJlT5hUJr7b
         rGc8hgMSlzl4YmDsBNzAXcvlmmcNCXGN4z5Ocx/4+eP0XkTOYQb/btIE9lY6Z3fnsU+9
         JQKJwTTz2YM1gPxBuFI0T7nohyfx/q6UM0KQemcLRFgbrOqtJSoFzgmaTAhEsChGiRz3
         RPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407460; x=1720012260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6cx0+kPy/mr4m8koR629ifIafAeU6/dHlLYYLSwNIk=;
        b=hQv6VKw9LYoTnQCD4nrTxix3AcGxJ5NogHC4dle9xpx1pbJMpwqiozwT2AwKzMNWmw
         GQASsUiS+OtWmdC4tC7VB4KZp4NKEWXV+ul7ncgZvbG6CUJAZrN2X52ICQPVP0q2xUFi
         zIt/Crc3mdDJWq5N6LhXYLkyRnEqn0iFv6YOHpOLCLDqM0qMA7Uxxm36wuNFYndW2B2V
         Q06kgKp4wk/NO6KymvuNIC9CDhsQKUC9CxcM1L/gnt8k1B818kgj1UCM3YHDAbzapbAs
         XyW9Tv6f1VqbAVYgJMzaHkpQCCX5jPlO68zXNFyA91831SNmNieDq4LJA+ETODeuorPH
         oBlg==
X-Forwarded-Encrypted: i=1; AJvYcCXny7BofA9UaCUUfEvf1SXczTA+3T9mfRc4jtbqwdu9nsE6OxY54jc4YaM82wANR5iNQWQ/z8jx2NZKLdWpAQB60dRQLsi906IUigxvtob1
X-Gm-Message-State: AOJu0YzAgzxcJdqfwmj6NkjuXtEWO0bL8XLFSTcSSJQWRqJW/MWzS3By
	2+oAuQj1RsjBBDLKD7Wl1YdQ8jTMaStAeBXNmG+5VV+8BpYus/cBZfTTiX4tf1Y=
X-Google-Smtp-Source: AGHT+IEtNRZjWCdEzOhHydNYZbdtsSBOyhgctkoqWdBmAHXNA7jMkTIIYGJ6ebJAtMiVgYJ66wbTgg==
X-Received: by 2002:a05:6512:1cd:b0:52c:dc57:868b with SMTP id 2adb3069b0e04-52ce18324ebmr7017333e87.13.1719407460052;
        Wed, 26 Jun 2024 06:11:00 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c824eef1sm24890125e9.14.2024.06.26.06.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:10:59 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrea Parri <andrea@rivosinc.com>
Subject: [PATCH v2 07/10] riscv: Improve amoswap.X use in xchg()
Date: Wed, 26 Jun 2024 15:03:44 +0200
Message-Id: <20240626130347.520750-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626130347.520750-1-alexghiti@rivosinc.com>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_061102_433809_156106B3 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

xchg() uses amoswap.X instructions from Zabha but still uses
the LR/SC acquire/release semantics which require barriers.

Let's improve that by using proper amoswap acquire/release semantics in
order to avoid any of those barriers.

Suggested-by: Andrea Parri <andrea@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cmpxchg.h | 35 +++++++++++++-------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index eb35e2d30a97..0e57d5fbf227 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,8 +11,8 @@
 #include <asm/fence.h>
 #include <asm/alternative.h>
 
-#define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,	\
-			   swap_append, r, p, n)			\
+#define __arch_xchg_masked(sc_sfx, swap_sfx, sc_prepend, sc_append,	\
+			   r, p, n)					\
 ({									\
 	__label__ zabha, end;						\
 									\
@@ -31,7 +31,7 @@
 	ulong __rc;							\
 									\
 	__asm__ __volatile__ (						\
-	       prepend							\
+	       sc_prepend							\
 	       "0:	lr.w %0, %2\n"					\
 	       "	and  %1, %0, %z4\n"				\
 	       "	or   %1, %1, %z3\n"				\
@@ -48,9 +48,7 @@
 zabha:									\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
 		__asm__ __volatile__ (					\
-			prepend						\
 			"	amoswap" swap_sfx " %0, %z2, %1\n"	\
-			swap_append						\
 			: "=&r" (r), "+A" (*(p))			\
 			: "rJ" (n)					\
 			: "memory");					\
@@ -58,19 +56,17 @@ zabha:									\
 end:;									\
 })
 
-#define __arch_xchg(sfx, prepend, append, r, p, n)			\
+#define __arch_xchg(sfx, r, p, n)					\
 ({									\
 	__asm__ __volatile__ (						\
-		prepend							\
 		"	amoswap" sfx " %0, %2, %1\n"			\
-		append							\
 		: "=r" (r), "+A" (*(p))					\
 		: "r" (n)						\
 		: "memory");						\
 })
 
-#define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,			\
-		   sc_append, swap_append)				\
+#define _arch_xchg(ptr, new, sc_sfx, swap_sfx,				\
+		   sc_prepend, sc_append)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __new = (new);				\
@@ -79,21 +75,19 @@ end:;									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
 		__arch_xchg_masked(sc_sfx, ".b" swap_sfx,		\
-				   prepend, sc_append, swap_append,	\
+				   sc_prepend, sc_append,		\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 2:								\
 		__arch_xchg_masked(sc_sfx, ".h" swap_sfx,		\
-				   prepend, sc_append, swap_append,	\
+				   sc_prepend, sc_append,		\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 4:								\
-		__arch_xchg(".w" swap_sfx, prepend, swap_append,	\
-			      __ret, __ptr, __new);			\
+		__arch_xchg(".w" swap_sfx,  __ret, __ptr, __new);	\
 		break;							\
 	case 8:								\
-		__arch_xchg(".d" swap_sfx, prepend, swap_append,	\
-			      __ret, __ptr, __new);			\
+		__arch_xchg(".d" swap_sfx,  __ret, __ptr, __new);	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -102,17 +96,16 @@ end:;									\
 })
 
 #define arch_xchg_relaxed(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", "", "", "")
+	_arch_xchg(ptr, x, "", "", "", "")
 
 #define arch_xchg_acquire(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", "",					\
-		   RISCV_ACQUIRE_BARRIER, RISCV_ACQUIRE_BARRIER)
+	_arch_xchg(ptr, x, "", ".aq", "", RISCV_ACQUIRE_BARRIER)
 
 #define arch_xchg_release(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", RISCV_RELEASE_BARRIER, "", "")
+	_arch_xchg(ptr, x, "", ".rl", RISCV_RELEASE_BARRIER, "")
 
 #define arch_xchg(ptr, x)						\
-	_arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER, "")
+	_arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER)
 
 #define xchg32(ptr, x)							\
 ({									\
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
