Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719A8C0219C
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 02:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1u0VIQ4NIUXAEjzatnUQcz/1UrmCmOCCedYEOwwYYk=; b=t7pyA4MPIckWbS
	Vu47G3KW0mW7iTIDn+mc10zFy8x/ETMMrlSfNr/3n8jlPvqW11hIdqHldYD438p/u6tsIrZYei4qT
	VpfhD+lDAaVc4nYhUdohw7T4Vw79ZQJId1nS3jJZ7dd3wi0ku3ZZm4IjqK/ctw4VZLpqcWmK2A20R
	ynI68TJwm9KTQdYSwjYLjaI8YoYLAkN/93nEKMeTSXnG7bsfsTSdsdYNnOLp8RPgCJPoO6Hvd/CD8
	qah9cRdFyUrZbgV7lMzlHlWKX82DyIrfd9os/XT5VKnlVUEcehguJIT10ZZTE9GCU4qWRY4gA3DJs
	vxs6/a4IlMKIURGWp81Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVC1-000000028XZ-2XUK;
	Wed, 05 Feb 2025 02:31:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7f-000000021gI-3R8H
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 01:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=BEoq6zqSeLFMaXOoiuM7yp6ZSaKHVlNR4X3PvApIHRU=; b=mIY7KrcuCMfmd0AGFbK/Fh4QDS
	Py7wp2H5RIxPOI9BXJxFc1ELU59L6kOHl9bMCeGwxF8e4UAeLbQwKCAb45kWxzDmk2o2AHGYvkb70
	o52acWAI8gqoRy8kL7APYXkwEWFu4UhsMTXTrFpnDELRBRcnsmPvCX6jkpGPtej26TzBNDf8TKRZR
	14iu54os+D7Xzu+uksmp3GpCaceHMCXXcZFuB0K1SX1GtN2Wqj01+kBxuXgg9Tg7oN9LYB/C/BuZz
	cjx3C4E/RUTAJGxv+Kq8PVkhTkvUa2hyf56FmI1L/Ah7+dnL+aPMac/LmE2jpQ3gvG19tc6hwC5ru
	zHKpentw==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7c-00000003cCn-2Zea
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:34 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so581981a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718550; x=1739323350; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEoq6zqSeLFMaXOoiuM7yp6ZSaKHVlNR4X3PvApIHRU=;
        b=nHDvzmgRNIerlqlg58OMrAfWxmjaT3APBPqQNt9PYqW+FacsVJEbgNSfA4AQ75dwzT
         GLYLJw8+3ZsO4I/MD2BDudUrYwRtp2PkNxtBniCOYqctU3mA7STfNGBuGUTOdd1SZrVS
         QjY0zSEN7oqa1PJZXIZ1bTiKCNRfM0UqtDhe5sUK2VJOS4OxEV9yTICAPbzK03+GDZ+R
         9qTbUDAsCJdDxP80RG60Lhz6LGidVHWrgh+qn1IUtLAsfqSm/V+Dbj8wnsWiLV/zl8Ep
         eS+mfUohzNzbGA3NAfOK1196e6Pvyhlq0Iiu92WQdp4CiwE8liuMjSaHWw7djKd0ey8H
         vUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718550; x=1739323350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEoq6zqSeLFMaXOoiuM7yp6ZSaKHVlNR4X3PvApIHRU=;
        b=TKkazwwq7EVCvBg1SCKk7aeD/c31oAG9/zsZZuRtTXzmMr4MoXFj9ESZl6SwwCZwhV
         QrZTxTcJmTAOBl5YsKl0GQDAR05uUCGkzptLCP1FUPZNvjpZtYVxKjS4gNM7UOBxbJnt
         YIfj+IZzx0shAkgSM7iCLAgQYgK6pRJszVxVBXjEuoawwNR/TmnouUBVj+q6kFDDZ8Oo
         H/ns2r07JNcPInbkLPY1vrD78UubV3+3zBXbXzgK0FTl6i0OA/BrX+XFwFBMIjmxkimf
         RAqCoj8003yhcCv0rumntmgkFh4AHzK6VSBKJ1ikXYISvGaABRLt84fEJQ7rmlqYnNaP
         9amQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3xzefKARZVWExgjMvVscyOVhDVbaxcKFaMMJfAHt3e+tvkq4aC+v44O4hCse3HK+R21wqIs99+FQadQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaSdaSc+mPMVWOws1LM2iEKoFRi1FGhJbPKgQ/qdHAQ4QRq9cP
	zjBANspzQAMpN6b/dgn5I8KEJq1Sf/oKFOXVMdAxd9F8/7XBS0ileYcj99SlAUaGX5eBGWA9Nbp
	p
X-Gm-Gg: ASbGnctM+WZuf0IKY0vY/NkP4pDETBM1LhTYkSL4Iot9C6NchfTbVzTV9LZcj+A0m1M
	oE6W+8ZOdcE+RaZ/pjNNcOnInfmTkXe1Y+K3fiXB1wp/JLHY1UC/6YiE+Kbb8374Z1dgcbNzbXE
	IoJ310dNw5+N0CqyLxKaI+GKJ37tx3XqFG7pUnew1hvB3yVyRLaVWzQDRf5fwOote0xLHW3NGBt
	UpiKeAxYBUMLaLbb5q9yDV135hyZBMyuxooHi3yq/6zhmHmbcxuBGZcp5ASp6FO3xCgkgxAiFu3
	g7+cKnJqtyzASAIo4vytngkzjg==
X-Google-Smtp-Source: AGHT+IFRFqE0ahq5ulRUML95GVOJ0DexxJ072ed1PioG6NF+P3Y5e0hdICNgMJ1J/XjbYt4HuYIKmA==
X-Received: by 2002:a05:6a00:3a19:b0:729:1c0f:b94e with SMTP id d2e1a72fcca58-73035131885mr1809338b3a.6.1738718550207;
        Tue, 04 Feb 2025 17:22:30 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:29 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:22:06 -0800
Subject: [PATCH v9 19/26] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-19-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_012232_770417_A5376D5E 
X-CRM114-Status: GOOD (  11.11  )
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

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index c3c1cc951cb9..c1b537b50158 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -73,6 +73,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
 #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 50)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 51)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index bcd3b816306c..d802ff707913 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -108,6 +108,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZIHINTPAUSE);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
