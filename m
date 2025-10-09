Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1214ACCD188
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPiRnXKzcoW4gp346E26ZjubSp/B0TWLiysvj5ye2QI=; b=gDsy2AOSjx/fkA
	BWNVig1iFJ+hDpuAzjIT/f/XiE5M9eodxIKUelOnF0AOTleF020TOjv1PXOR4ldi0QK+OQVhdDDSw
	ShcXgbO+dXTNzHr4103pLyoCUWmVr8HLALpPl2D6mOuiHUGecyN20YO3sdQjtR7F3BHMoETsUStS0
	TlvQ9PDsOYDXB2Zhj79//jSbqaC2du+nRLLx2GgFou9Y0KSABqjPzRIePbbuiUVjePZeU5ZLSTTeh
	99r3LsqwhlpyD0dwTu4Oj8ucJwn3LqpCwlP2wRGoU3cUe+9Nd0ROGkp5FkDpMwgyT4qdYW9fq50IX
	WdIavN/QqoZs/kyY45xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvj-00000004zFE-1c3k;
	Thu, 09 Oct 2025 01:58:55 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvg-00000004zCc-3cVv
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:58:53 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-273a0aeed57so19490335ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 18:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975132; x=1760579932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQzFW213rLwxUVwSIOmReg2LsoZscZFNSwvkZCWkhKs=;
        b=m0yWI7iCOoaVBPc9xmKlSoq7IWwdS4yH1Mrp3o7jndMihAcBRpVM0QjJMhQTQ68YXW
         nhxqGGCqfCp3YBWXDfPwcUljgHyuJLnuQfWwE2NN0qF1+9QI0v39pi3jpl40E7MjZUy6
         eCTgA3rdrLvh6Ctc9nGYbwkMv2WAHZv4WgIYqHvvb/drpCbJjQIhj83BhudEK6fjq74p
         Xis9v39M9QVTC9ruRjHk4XHYUHyd4qtUC/G9/NhPgf6xfQ5xEqVNWU2m963FoxlzC8VC
         dLEVg0MJZKE25pZTAAN0H83kJI39g28lXmkwpLIW6wV2rnsc7sbUuJoeeG8siDNrCb4j
         ifZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975132; x=1760579932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQzFW213rLwxUVwSIOmReg2LsoZscZFNSwvkZCWkhKs=;
        b=UMLklbixEE4kxY0ks1UcM9Of34wwKGvr8YDkKQ1F04uR6LtRb1TYKZL+bL21N4ngAg
         gibgMUlciInxkqBFXrK2qBEWEzUoKKiY3rgOoF/XFhhq02gBTt06rD+7pIu0aOIkK9s4
         njV6y/PgZubm3MxY4kCG8kBpcxZ74fZ6dQ8tZ+3PrNabev2wuJjptFkSbhOJbH6Ul0tc
         J8dVdJdRgeIs8gxC5eCGPIw5kAluP88CdVJRdpnUwPT6FcebmZw4FoYIiclIkmwL9S6I
         jS7eKTVS4qco+L8IhzDUj7izUBNKeF4NyvqHsSlOVGQvaLAOS7ygiVljz1ZcGX6WVw/y
         vgAg==
X-Forwarded-Encrypted: i=1; AJvYcCWmF/cbXeGD2u0S0dIRD1tdTpS40oDMoEMWVf6zaxsl7ZXxzfLF+/g2uQp6iKdarJ49xFwrd7EWO8AbCA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj0PTISfeKpzxx8BR3FOjc1oCEYGx41CHqyoMw0KsOsMRK5rsp
	dBhiQwW51hwCruGOAtTkc1+F+UfvSSa+wKx52HbNBAYyOeSX1IPn2/9TKB8c8rVPEIE=
X-Gm-Gg: ASbGnctLN1ob2LsAU6vUSzJFhWHxAiHAgn9lUTnKgxWVwmn8gmkKxkoJggqZztzpUDW
	pWEs9Z26lgvGzJIJg8xkwhShWH/Z1qzo3iDI3ffivC6BNYTo6KDoFHWENoapnfvXoD02iekKFya
	onhmn84PKFcXUDfeYmeR62L92ZLyeVvcd6c9m8xIyWk8Vw6lqLYXqO0k6Vv09akvli9MVWYiO+t
	nSIxxJVVKsYMUPxSk455OrvyZe1vx4y1KJ7+Db/H0eaeNRVCQcE4fquLLdd9NYSUDQOEHPCpF86
	2Ej0qb60S1Laaob9LwWqu/ATh45GM6t43trNvVCQKdbV4lT7ztR+gAeYbwVZ+fIclJxPENURnVm
	A55j94JyfbN6jwyrXDmafi2caDHFaiFydpcujXFFo5RzkKSZI/ZdSFmN+fWaZ7cpBfiit
X-Google-Smtp-Source: AGHT+IFM9Uy17P2+rIA5+/u+UBcAfOioBDn47CFCZ3Wn+HT4qk9AYA0AUJYNGbTh1SkHtKAVK04UZA==
X-Received: by 2002:a17:902:f788:b0:274:506d:7fcc with SMTP id d9443c01a7336-28ec9c0c7e1mr134257655ad.6.1759975132141;
        Wed, 08 Oct 2025 18:58:52 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de53f9sm11033585ad.14.2025.10.08.18.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:58:51 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 09/18] riscv: mm: Deduplicate _PAGE_CHG_MASK definition
Date: Wed,  8 Oct 2025 18:57:45 -0700
Message-ID: <20251009015839.3460231-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009015839.3460231-1-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_185852_903237_310DB09F 
X-CRM114-Status: GOOD (  10.69  )
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

The two existing definitions are equivalent because _PAGE_MTMASK is
defined as 0 on riscv32.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/include/asm/pgtable-32.h | 5 -----
 arch/riscv/include/asm/pgtable-64.h | 7 -------
 arch/riscv/include/asm/pgtable.h    | 6 ++++++
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index 00f3369570a83..fa6c87015c480 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -28,11 +28,6 @@
 #define _PAGE_IO		0
 #define _PAGE_MTMASK		0
 
-/* Set of bits to preserve across pte_modify() */
-#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
-					  _PAGE_WRITE | _PAGE_EXEC |	\
-					  _PAGE_USER | _PAGE_GLOBAL))
-
 static const __maybe_unused int pgtable_l4_enabled;
 static const __maybe_unused int pgtable_l5_enabled;
 
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 7eb23c24310f9..d17382c0fbe59 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -66,7 +66,6 @@ typedef struct {
 
 #define pmd_val(x)      ((x).pmd)
 #define __pmd(x)        ((pmd_t) { (x) })
-
 #define PTRS_PER_PMD    (PAGE_SIZE / sizeof(pmd_t))
 
 /*
@@ -166,12 +165,6 @@ static inline u64 riscv_page_io(void)
 #define _PAGE_IO		riscv_page_io()
 #define _PAGE_MTMASK		riscv_page_mtmask()
 
-/* Set of bits to preserve across pte_modify() */
-#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
-					  _PAGE_WRITE | _PAGE_EXEC |	\
-					  _PAGE_USER | _PAGE_GLOBAL |	\
-					  _PAGE_MTMASK))
-
 static inline int pud_present(pud_t pud)
 {
 	return (pud_val(pud) & _PAGE_PRESENT);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 2bc89e36406da..61de71a8ba978 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -206,6 +206,12 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
 #define _PAGE_IOREMAP	((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
 #define PAGE_KERNEL_IO		__pgprot(_PAGE_IOREMAP)
 
+/* Set of bits to preserve across pte_modify() */
+#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
+					  _PAGE_WRITE | _PAGE_EXEC |	\
+					  _PAGE_USER | _PAGE_GLOBAL |	\
+					  _PAGE_MTMASK))
+
 extern pgd_t swapper_pg_dir[];
 extern pgd_t trampoline_pg_dir[];
 extern pgd_t early_pg_dir[];
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
