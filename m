Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801E9C28B2F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 21:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8C5jrW7ytHSa8cSJV01cxe24UoCCmkfBBL1E0WgPoEQ=; b=UC3YM7dasau9a4
	blI9UpD7qIXjWZjDPCXKyuZAp0/QUs/vf/3MfA1pX1kI1WoBLZyB9zUjC8kDe8keoFbjUPaB2jHXc
	mwFVgERtuyhInQgFclPbwRh3ajaQp7ycJNeRW1D0tZnGThuI3yWkCmIA+exJr4cvEZH8ThoVkmKGv
	cA628ONUlsmir86cmouUkZ6G+njzp/QTzZAKnwpg9Kqw7S4kr7Y+cveudLmlNMGv57FGeYQWlrIQS
	Xx7aR4KsFxC1f4p/HqFQ1nhzyA3DFHVri9li+EFqzZUE11bGvR4KTPqnHRUwinGyadsbjrCTHt33s
	nS7fFoGNuPCL6KthNzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCkv-0000000FKWN-27Wl;
	Fri, 14 Mar 2025 21:39:49 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCks-0000000FKQg-02S5
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:39:47 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2254e0b4b79so65807385ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988385; x=1742593185; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0cdClzbcf4jwWk6NNoAER7Uol3lcFHrvU6ecxcolCg=;
        b=VoAvEEXgD8JhYzOIiGZws2SZ428MPdVIoHByqs2zsg9gMoBgByvaY7fFWs2UB+q2pt
         8Rt8at1b6JsbfZZNifEHgAdUBa6QXDixKc6pC+285itI2zadALEHHobmpQWj6Hu2wX77
         7m/+4BQKWKiu1HKYpW7GVbAigLv3ngsgwn2MKU34G4saQDE3tkB225TDLX7gLB8jWkkR
         TbeCdP707oVGmgBhV7zNetMaN+1ZO4Sd6HQbSUs4XqjeiFS33TMbMhQewFNo3pj1+R20
         EGgnXUVOd89CQtgd7L2QVaXIdAhtkEiMSWczAgUGmD344oH86EG98BFazVhn/3Wz9Sm4
         oAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988385; x=1742593185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0cdClzbcf4jwWk6NNoAER7Uol3lcFHrvU6ecxcolCg=;
        b=wGSZmD8a4S9sR7oWSozh2xiN9dJ+f4s0il7JwnYGQLrODMu6vBPWHcEBzGWpx1HYKh
         NJTKSX0TGxZPoiuT9ZRG9iUG4sun5DPhdEMzRCtdzY8QnM2T7fny7I3aVb2dzyio4DD1
         Pm3DRmR/DZVAbdWg22CNc/wXSQ6BSxN5NCxq/4LJE4oPHib4kzpXVMsYTMvYtkzbK9gJ
         LGclacSZ12dj2IIX+LXN0BtVI+zXi660p8Q3Ni+rqYbK59NWeavxs3d1ti5vlEyh/7Am
         J75RlZ2wVC8xaIPiNb8l/pULky/TS0bVPZOHdW8PVWZ3sFBA09z+qwGGY9U4hf22tZNw
         xhdA==
X-Forwarded-Encrypted: i=1; AJvYcCVCCnLw97M6B4+7WmW+7SQ0WK9Dzg0uaJb0EGLP4pX+7Wmxqb+3IdnFAO/7vKhgnHmwTLPah8s6EjhHSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSLUy9as9ZnBPSICJfcU31s51nZV64aI47asYdFalACqEpY5B7
	96cKEXsRPBYUG4H0iB6oqlnUZgT6X9SByqOvxbbjyk9VVG2xI52izVLix2Q9Xzw=
X-Gm-Gg: ASbGnctA3u5xakXVvJomvwXGodBvSK6wzZQpGsIFUps3OWRwDSTMbUH+vCOfeA+Tgku
	+4qr+Zvgl3mQj11MQqtoVoB9zlvfM0QKHyVWfrcC0g7md0RPqdU03TDy1An3oaANw4aPYn5EvEo
	L8bVY+n7WP7WU5I1y7Kzm3Xsb5L61znceUDKBbm9tTAVr0QANmr+X2ExfeivmfWHwEpGNSLalcd
	KnIELMBDR9djQ8FXvm382O7n5OwxvM+03xVV5Cg/lErW+C3h1HvIvexCs0FacqIG/YNi6DXvbrb
	jCHoWmRwr+Kit3M38QlG6xY5Y6gsulLR1SzrPXuQIDV+ANSE8YDKoqLOIbwD7CJqJw==
X-Google-Smtp-Source: AGHT+IFZaFTcFkxKWE6fnM6U3z3NBo+SecOR6nfScdkNYaVzLCXCW0qb6at3qhL4+W3vIc9ENh5Ndg==
X-Received: by 2002:a17:902:dad1:b0:21b:b3c9:38ff with SMTP id d9443c01a7336-225e0aee9ffmr52390865ad.37.1741988385430;
        Fri, 14 Mar 2025 14:39:45 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:39:45 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:26 -0700
Subject: [PATCH v12 07/28] riscv mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-7-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
 rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_143946_060255_B1222716 
X-CRM114-Status: UNSURE (   9.96  )
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 8c528cd7347a..ede43185ffdf 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -421,6 +421,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -749,6 +754,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
