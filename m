Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEECFC5321D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 16:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ru47gB3qnQDAgOLrZNIoxtJHvBGnZ2Dr5sNLktbkqb0=; b=w2QBR1nj/zRBI7
	piuTu/ogGeA1rAd3ws0bwmJLmlk27Kes5xoq+u//EICB28OKXbdpM7AHeN+IDY5l2uTBcblvV7Do5
	jMkLg+zQDhGtpeupTuXsW+vOC8HiVXjEBgaCuRteAl0i49oEUBq3u29U87eUCNntqYpHCKnG21Pw0
	icnagwjiGeNbCITHqJA57r6U2mQuQ8lYCpqMcXjb5k1wwtTYWBAPIPSkdcyTbLW50TOusUPpNGcmw
	5q38Zirsbho+eON5zNnvqX+pkWZg5JyeH9187FNi7MfG7fI4aTsmfrOtp4dy/7ZloOLlEhpu5NiY7
	S/5sN9Q6Tx3dg9v2DKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sicip-000000082CB-0AkC;
	Mon, 26 Aug 2024 16:37:39 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siciC-000000081yq-14IN
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 16:37:01 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7148912a1ebso850401b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 09:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724690219; x=1725295019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t9IZbphD4s+T0TTG0K3sRw/t0vq8ENy625o4Izgt1nw=;
        b=OIv+7Yc04oLRu+iY4hPFwMQLdTCVE9TyAxQFJeLjGtBWhYcWGSDxCO/Z7WEVXV58cE
         7+8Iz5YrskHIVdcF10b+S6j44N7IjXwrzXY/f6R+gvDG3vJwT4mdv2pfL8YI73ZLemQ6
         bZc2d+tbGsmIwzpqpBOgRSaguIIIdDfL0xvJ4VXKd5t8vL6Yxyhniu9D6WR3hyj3ppQC
         XlNkozQWXV4zOnbkUpgSgp5MvYaNxJ60GhO1t2bITUBHblq++e3jJ/a8lOPIC1XS36lA
         ePLAy/5VMn/iYkm35AtL/LF8zkVE83kXZWjyhXWghlmo3AS0FG+cPKDrdzpcK2wqTYAD
         DKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724690219; x=1725295019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9IZbphD4s+T0TTG0K3sRw/t0vq8ENy625o4Izgt1nw=;
        b=QQjWsxZx1f+LbGSwtnLILRfSRsWVCvMy4ydRJ6Y6XMTLLI2x2ZcyUOCnHz05zhsEsc
         wed9YBzylDHj+cG/Gh2xcwm97rzI4lP/6YxS1nfSMupwU3Q9kKaSBvj0av3GwxtrxiUg
         enSBzbhoMpx9kWmzPTvAngbVvz5k7tpMG5HFMH6FB98rdUk+5vANWgDLmWNBPIqYBY/k
         1b0Ln8PdJvGzgdt3oJ/cnaYusziUWwrgCa0+/ceYNGwfPalqaXVwhzGVAJLni0aWYob4
         qDzJ5G47A2KXtp8o3BNy6Ha71iOFR6j6I1wHl0Fm2Uu80xiiw37pRyTDGuhf2DWotFB+
         RSSg==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZtqoMKpvn0FA6UnahL+e3MIdURrPm7Rupm1VVn6mHMkTUr+ZpMiyID3ddYYQFDybTCDYA72GiqAy6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAAzSnmt6jLhIG7elr+mjH1rHPZKmsFS0svn8lG6R7QOyxNaZJ
	N3ngC64VAU8wRWk7chYwslWo0+ueeAY7of9RxAB3t128Fm3BB/goBqHD3lcMSCQ=
X-Google-Smtp-Source: AGHT+IG9S6oOIHruoTcjy62dAwScwy++NKf5ocrr2BTJ3qmhr+nv5kpfhPnFgduK13TqKhl9HxaO5Q==
X-Received: by 2002:a05:6a00:928f:b0:70d:2a4d:2edc with SMTP id d2e1a72fcca58-715c0093c51mr270187b3a.20.1724690218578;
        Mon, 26 Aug 2024 09:36:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143434052dsm7174708b3a.217.2024.08.26.09.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 09:36:57 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 26 Aug 2024 09:36:47 -0700
Subject: [PATCH 3/3] riscv: mm: Do not restrict mmap address based on hint
MIME-Version: 1.0
Message-Id: <20240826-riscv_mmap-v1-3-cd8962afe47f@rivosinc.com>
References: <20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com>
In-Reply-To: <20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Yangyu Chen <cyy@cyyself.name>, 
 Levi Zim <rsworktech@outlook.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=/8JFLNWM/SAveIiHQ+Qz3OxCPpwk7H3LTUQkZXSioLI=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qZ9coObJpTnjRVFj/xm7Xmcv6zBqnVkoL5zVbvk2tmR
 B4+/FSjo5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIlsP8jw3+fF7qYfrbr93FJN
 Uz64q878fDCj/xlbXeq3iT8LLv4PrmL4Z2WSvmDLzd6Q4hUNgkc+LszzemO1XEnr3Mr4eRsDYrT
 6uQE=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_093700_326956_A5292874 
X-CRM114-Status: GOOD (  11.32  )
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

The hint address should not forcefully restrict the addresses returned
by mmap as this causes mmap to report ENOMEM when there is memory still
available.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: b5b4287accd7 ("riscv: mm: Use hint address in mmap if available")
Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
Closes: https://lore.kernel.org/linux-kernel/ZbxTNjQPFKBatMq+@ghost/T/#mccb1890466bf5a488c9ce7441e57e42271895765
---
 arch/riscv/include/asm/processor.h | 26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 8702b8721a27..efa1b3519b23 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -14,36 +14,14 @@
 
 #include <asm/ptrace.h>
 
-/*
- * addr is a hint to the maximum userspace address that mmap should provide, so
- * this macro needs to return the largest address space available so that
- * mmap_end < addr, being mmap_end the top of that address space.
- * See Documentation/arch/riscv/vm-layout.rst for more details.
- */
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
-	unsigned long mmap_end;					\
-	typeof(addr) _addr = (addr);				\
-	if ((_addr) == 0 || is_compat_task() ||			\
-	    ((_addr + len) > BIT(VA_BITS - 1)))			\
-		mmap_end = STACK_TOP_MAX;			\
-	else							\
-		mmap_end = (_addr + len);			\
-	mmap_end;						\
+	STACK_TOP_MAX;						\
 })
 
 #define arch_get_mmap_base(addr, base)				\
 ({								\
-	unsigned long mmap_base;				\
-	typeof(addr) _addr = (addr);				\
-	typeof(base) _base = (base);				\
-	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
-	if ((_addr) == 0 || is_compat_task() || 		\
-	    ((_addr + len) > BIT(VA_BITS - 1)))			\
-		mmap_base = (_base);				\
-	else							\
-		mmap_base = (_addr + len) - rnd_gap;		\
-	mmap_base;						\
+	base;							\
 })
 
 #ifdef CONFIG_64BIT

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
