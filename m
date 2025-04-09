Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69005C369A1
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 07:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGIsw9Ij9YMRjCKvkmAlkOk2T9/+TmX6P+SVLJjxeNE=; b=WS6/469G+UMb50
	GRYHYknbWphhQQUEIGfZUSIYyF0Ctc6hnviVq0GvI2QjEDJYlgr3w835OTABtQPYwBZmoffi7PWBq
	NSpzBbckcb3JxoRYivjLKtsd30s6iyi7qwu7cTKnYHrbWVPqTlZBNTDYOd7zwqaeTf3ZlD4jLaFoD
	dcxGuwU6ww2i6MHxoVAcEYkNfFTWy5nTFUjo8obsRETN6KBkjpV479q3gTXmdoZRZ03AKYUT0EZmC
	7qCNh5r11v3GDjkTi1e/0dizEdX0tvnTWaJXtav2DOj67rPH7p7cMIqp4uAc1ZRj53KqeLxDQaGlZ
	lamdESSAMxSoidUCOwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PS8-00000006MFT-2Eha;
	Wed, 09 Apr 2025 07:02:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PPI-00000006LZs-1Aos;
	Wed, 09 Apr 2025 06:59:33 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22548a28d0cso91143255ad.3;
        Tue, 08 Apr 2025 23:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744181971; x=1744786771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=XbCO5epsgAItKpvencnoothOzRJrudnD3IryP2lFiE5db6FGU3pkkTJhOIBLYDR6rJ
         Poygzj31lEX2mrAtms3TR4qZ49zMjXd62Zrf94QalQX+CyKhwqM5QHkcDMwyQQ4OSiUm
         oEhH6jRYgEVCKygWciUYBStRRviNd6mQCvlwWf5gq3R9n7g/nNslDXfFY8g1eMM2O4LR
         Ev8tkw7X24kR4leCbR2gC3K7iB7SqhXafQAgD9PaboXHUGkwSTU5iBDkkvtIt7bUuuqk
         C0ka9gwgZHqs8U7l4G2lVJcuXKavZlaUUPbHs+bbpKT0mazjKV29iUoA5swExjS2AkR0
         wtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181971; x=1744786771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=fuU2ruYXke7GWDbTvM+kr5mUA0FS0gtNjSuLxUyjVZmphKrOyBON/lyquQoUQawA8C
         ku855lAWmawbVtyI7lq4pDPuB4MStgacv8I7xYRDESvxGvQlFiCqcLnJ1zsnz91cszKH
         Bosh3q9ewzVpK1B8wF9UdgHg1CdIlpzCeaNoY1SvCGlnniVAOSnEQ65WwGMa9CVDp57F
         /PDvEIAolsbq4kauZhQjn8fMzDD6JaOuGDGKHtLoyNRZsbrzGZY7eRrz6ViDlBjKgJgD
         pShrDa4i+3dZTApnV74QrC45P5TidxMtTSUeKc3yRkUecO8AhB4bJ91lVE7DHqlDC8Ge
         esWA==
X-Forwarded-Encrypted: i=1; AJvYcCXSZ2TBujDep0QtXiJA4wQPanGzTmLprvh7zHX/l+dYbhspaDXRsTkI9h6tHuwsjRxAlTQanDCc3Y9LO4I=@lists.infradead.org, AJvYcCXeuNCYTlcfur60fw8Mf27LBj3xGPrqSgLdOphxX97pTWmACmvWGz1/bzAMnWNAHfB5ry8xhs8dbnn8v9iaMI/S@lists.infradead.org
X-Gm-Message-State: AOJu0YzQPfz7WQpIZ7hUGZZ3t12RYUK7t0bz9MhRfNazoII/mZR2kZ8u
	+QKqtC0Q45Hwjig6VSjJfHAtjVnv6H5DM/OGZ/pgkhT6XeH1rLTP
X-Gm-Gg: ASbGncsMypP5I8xCUfRYY3LKUyhRAJtVAXMO6CN+gLTyJmXPYMzg+H4AqROdY9AxvYp
	q4nT7izMvpAv5xtmFEpAujESy0cS13w7ZI9UI+BSAyx3jq7Y9keSJcHbNDha91WM3g7MLrxMvtJ
	SxmT/NU0mGrxg/vYaolDPPg2YXV0IkjON1qFdaVsaJ2iixbcUFLpQtf/KXP7OHCMnDXvlMg/KJU
	c9qiKACUYedjvQb8GA7YlrcjxMk2JEB90461ZFpv+NYwjeyZbqSEZZIkiWYDGayOJt8pSydXCuz
	yrEcpR31zKTc6JakXxpCutQiy9Jj3guoU1cDafuBbqW/fo/Zn/b4wTuiCbnLq1JVhclpPCFZAb9
	XS+mI46Aww1Bmndw2cg==
X-Google-Smtp-Source: AGHT+IEZwYUbsTySsEIFtv1t72KELbYqxAXDutiQgzwO8B7QSQ1bxP4LPNczP+kdX8pWrESjGbTSiA==
X-Received: by 2002:a17:903:2b0c:b0:223:52fc:a15a with SMTP id d9443c01a7336-22ac2a1a9c8mr28742785ad.33.1744181971392;
        Tue, 08 Apr 2025 23:59:31 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm4407815ad.220.2025.04.08.23.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:59:31 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v5 2/4] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed,  9 Apr 2025 15:57:59 +0900
Message-ID: <20250409065802.136971-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409065802.136971-1-fujita.tomonori@gmail.com>
References: <20250409065802.136971-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_235932_315063_A25F5D6A 
X-CRM114-Status: UNSURE (   9.48  )
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

Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
Rust to avoid the duplication.

No functional changes.

Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/riscv/include/asm/bug.h | 37 +++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..6ab13b56feb0 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -31,40 +31,45 @@ typedef u32 bug_insn_t;
 
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 #define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
-#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
+#define __BUG_ENTRY_FILE(file)	RISCV_INT " " file " - ."
 #else
 #define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
-#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
+#define __BUG_ENTRY_FILE(file)	RISCV_PTR " " file
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define __BUG_ENTRY			\
+#define __BUG_ENTRY(file, line, flags)	\
 	__BUG_ENTRY_ADDR "\n\t"		\
-	__BUG_ENTRY_FILE "\n\t"		\
-	RISCV_SHORT " %1\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_ENTRY_FILE(file) "\n\t"	\
+	RISCV_SHORT " " line "\n\t"	\
+	RISCV_SHORT " " flags
 #else
-#define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	RISCV_SHORT " %2"
+#define __BUG_ENTRY(file, line, flags)		\
+	__BUG_ENTRY_ADDR "\n\t"			\
+	RISCV_SHORT " " flags
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-#define __BUG_FLAGS(flags)					\
-do {								\
-	__asm__ __volatile__ (					\
+
+#define ARCH_WARN_ASM(file, line, flags, size)			\
 		"1:\n\t"					\
 			"ebreak\n"				\
 			".pushsection __bug_table,\"aw\"\n\t"	\
 		"2:\n\t"					\
-			__BUG_ENTRY "\n\t"			\
-			".org 2b + %3\n\t"                      \
-			".popsection"				\
+		__BUG_ENTRY(file, line, flags) "\n\t"		\
+			".org 2b + " size "\n\t"                \
+			".popsection\n"				\
+
+#define __BUG_FLAGS(flags)					\
+do {								\
+	__asm__ __volatile__ (					\
+		ARCH_WARN_ASM("%0", "%1", "%2", "%3")		\
 		:						\
 		: "i" (__FILE__), "i" (__LINE__),		\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
+
 #else /* CONFIG_GENERIC_BUG */
 #define __BUG_FLAGS(flags) do {					\
 	__asm__ __volatile__ ("ebreak\n");			\
@@ -78,6 +83,8 @@ do {								\
 
 #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
 
+#define ARCH_WARN_REACHABLE
+
 #define HAVE_ARCH_BUG
 
 #include <asm-generic/bug.h>
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
