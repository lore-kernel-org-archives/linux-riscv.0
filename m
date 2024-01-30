Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047C5C48286
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 19:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lD06+Y7U/YqOFZG/56FTTVoJ8vOCipTz6AVvfKCuiMo=; b=WD3RQOrJzE8BHv
	Ad+O20zKGUjUoqYAOVeSlBi05Bp25M8xZ9LCIxOXI8CKTlI54d95H2aAyZ1rLdLDcvZFXBhxZYmUo
	9+sKtbUSN7Y/1dntrXfjjYPxeF/1eZvKa7mtoXotC1LqtXdcYy2oldFyTuerWrn4jhMgaP/HoOD8o
	c2Pw8EXQgAec2WcmAkQjk5SfeMhFRaY/oXsW/8ZjjbcIwFA5PdisGw/HuIExu9bQRbI4vZoH1xJ98
	g1bwT0HYjeu2lUbUuTVrrw5BNmjKZ3JbdQhyFLNFYMA5ngZEsFAkjdXWXSmEsgoezoYJkBRuREE12
	lvuF5bjhYI1IoyMV00FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUtPY-00000000GZq-3Pt5;
	Tue, 30 Jan 2024 19:04:44 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUtPP-00000000GS7-2W2p
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 19:04:37 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-290a55f3feaso3119272a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 11:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706641474; x=1707246274; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yR39BQnx5CuM7HVAKBGyTLeOeO2w4fzgWq8LHVFIrGc=;
        b=XiczijOSWhPfZDlIAUb9JH0WLn5E5NaNaoWlo7P5UQMziBpdR1mB7BnLiDp6eJnQCL
         Fz6X6AljIdIQ3Ut3M/zpf2TxcO6yhVoE5K19pA4sK09D8ka8eDPvveQSM6NSZhQDKf1t
         TJpKXNflMLOIBbtS08cN9ay1s/me7pJwgGLiOtPr5qf/SvNDFOS6jDakB3RWM7bZwTD2
         gQUh+Cwyhh75BjChhp0sd+erJtKFVF+zZhXb6+ZYeKb+SQfhFu4DOa1ps188SOXCDe8p
         DI8tXciZumQCdq2mqrszMcMjqHp4cJNYhgldYoeZdyhoRuPropCWtqos537qYdfYnJaW
         yd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706641474; x=1707246274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yR39BQnx5CuM7HVAKBGyTLeOeO2w4fzgWq8LHVFIrGc=;
        b=dXB0ur/W64VSjIlCHUXIP5gZvdQdcF/rk78W4Wavuw94DKWC/z5iELaYF2jPee8gq1
         SUJl2w474jhH9RNNE7gstD46F0XdvwMuzvpAe+KKhlTQOFDgw9t7/p8j1ZqisRdnAYlb
         HxSRsiWZrVSljNBobCI6weRjdMPN3tXcrdR/Ay26Oy6YVgc7Dz3XSMvMAxATEBqMcGO7
         raPeFczj8Cv8A5CSWxzqEFYEAaXlcHT1KRvn10fbUpPurKjXK1GigPD0FjHV6XT9rGo7
         ua9V4xnp0j79rUHiP4Jg5A/u8f1JW7ywJG2xIXmi5LR6bidcbv/LpRHtjqZfp4DUJjGu
         0PZQ==
X-Gm-Message-State: AOJu0Yw3JyJnaM7UjDzqmwy7v/EGXuiEOD5XQZevMLmwacola3XdjGQ0
	WhBZXJWEBM9YT/fHnuW2oNcAcrq9ibivBx5egBIQm5Rmx3Xkpc1zl2qGXr5fjO4=
X-Google-Smtp-Source: AGHT+IGj3hm3lZxg8Tv1mA9a7NdziJNVi1CzW076g8O+NcVAU25Ai6hKEgTL594gTw3Fe+w4FPditw==
X-Received: by 2002:a17:90b:1d82:b0:293:e466:e82b with SMTP id pf2-20020a17090b1d8200b00293e466e82bmr6560721pjb.38.1706641473865;
        Tue, 30 Jan 2024 11:04:33 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f6-20020a17090aec8600b00295c3bb9318sm1196541pjy.54.2024.01.30.11.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:04:33 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 30 Jan 2024 11:04:30 -0800
Subject: [PATCH v2 1/3] riscv: mm: Use hint address in mmap if available
MIME-Version: 1.0
Message-Id: <20240130-use_mmap_hint_address-v2-1-f34ebfd33053@rivosinc.com>
References: <20240130-use_mmap_hint_address-v2-0-f34ebfd33053@rivosinc.com>
In-Reply-To: <20240130-use_mmap_hint_address-v2-0-f34ebfd33053@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706641471; l=2717;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=nYPj/fyg4PYV9oZH+Numr3TDNqlT2v60F+fZG4ppm6A=;
 b=8TpBPUYlMpe99Wy4MtFO+G5FMsAU594qBMLjaPbbTQaF/l0GF2Rgz5PEarXQGUC7U59m+QmVJ
 rouYGXoseN8DFOk/KglyX6LbcysJhd8mJLV8BDu96je7w6S40qMm4Tt
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_110435_677253_2586C3FD 
X-CRM114-Status: GOOD (  15.62  )
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

On riscv it is guaranteed that the address returned by mmap is less than
the hint address. Allow mmap to return an address all the way up to
addr, if provided, rather than just up to the lower address space.

This provides a performance benefit as well, allowing mmap to exit after
checking that the address is in range rather than searching for a valid
address.

It is possible to provide an address that uses at most the same number
of bits, however it is significantly more computationally expensive to
provide that number rather than setting the max to be the hint address.
There is the instruction clz/clzw in Zbb that returns the highest set bit
which could be used to performantly implement this, but it would still
be slower than the current implementation. At worst case, half of the
address would not be able to be allocated when a hint address is
provided.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/processor.h | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f19f861cda54..5d966ae81a58 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -22,14 +22,12 @@
 ({								\
 	unsigned long mmap_end;					\
 	typeof(addr) _addr = (addr);				\
-	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
-		mmap_end = STACK_TOP_MAX;			\
-	else if ((_addr) >= VA_USER_SV57)			\
-		mmap_end = STACK_TOP_MAX;			\
-	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
-		mmap_end = VA_USER_SV48;			\
+	if ((_addr) == 0 ||					\
+	    (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
+	    ((_addr + len) > BIT(VA_BITS - 1)))			\
+		mmap_end = STACK_TOP_MAX			\
 	else							\
-		mmap_end = VA_USER_SV39;			\
+		mmap_end = (_addr + len);			\
 	mmap_end;						\
 })
 
@@ -39,14 +37,12 @@
 	typeof(addr) _addr = (addr);				\
 	typeof(base) _base = (base);				\
 	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
-	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
+	if ((_addr) == 0 ||					\
+	    (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
+	    ((_addr + len) > BIT(VA_BITS - 1)))			\
 		mmap_base = (_base);				\
-	else if (((_addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57)) \
-		mmap_base = VA_USER_SV57 - rnd_gap;		\
-	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
-		mmap_base = VA_USER_SV48 - rnd_gap;		\
 	else							\
-		mmap_base = VA_USER_SV39 - rnd_gap;		\
+		mmap_base = (_addr + len) - rnd_gap;		\
 	mmap_base;						\
 })
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
