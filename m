Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAC9CEACE5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 16:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hCe7OQH7sT0H5/5DChnsUV7btCaYTuAeRj2i7sp75A=; b=bYTzq/Ir1HsWgu
	16gkbfkUDC4ekzJe/a20Deg59btgRFk5nhS4PP6WQDw/Hx9HRJ7NUhtrjZX1eVXyyxPB+ZN+hgsD7
	5D5Qr0uH4gure2LOtCgDy9hndfRl5iYjgRtEbdm28/RJtLOGLTlcvBeXQbSAVnMxwe2RKtZ9AMnkV
	EJEaojHuMzaBm+BlkaJqTkCg4igMFoRhylwMlIMPyVElXc3plZMaZKf79HH+dO2fhABXAsxErZpFP
	oBB+OUCTu9ch4y6W4C5booK496HsMEnkDMiuOjqlwPNyKBiJgNgS/xkwx6R+rtDo5l5Fyo6WsLsSr
	ucTvbaeiWYEsZYpNp6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svfbt-00000003Vgn-3kEg;
	Tue, 01 Oct 2024 16:20:25 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfPR-00000003R7V-3cCi
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:07:35 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7e6bb2aa758so2294738a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798853; x=1728403653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvFaRabdOYgj/FaUxHA5lpjBxuSoaWHPSkkVGjDU8NY=;
        b=SyVh60H0iydfNHXO+N2aKvVG8AgM1E454JKT+ntuiZAjQLglGFNaCs7AKY6FwZmfDk
         bLIbKizLt0R9lSjwWPm6Pxxw52WltKbicG4R0wWqZRbkjlVgZwQSQbYZXXJVnOeuHCYA
         ncz/rV+O6lGc6eQ72762hFcXpB/ArJvwWF3q0/XoKaOPc8Hv8+zOXP3w6eqjjg1HdKaY
         YMTX21xgpc56bhlK0/Uz1SWez1XCDyrzC8n+Ge4x2PGNhlarchqFQvKSYibSOErUlZrv
         3KXc/tGgyZ2qPwKRMlfFGi3vTWA6I+fOzdY2DorRZs/PG1WsMucx0/Um3/hUW5IltUpp
         JcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798853; x=1728403653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvFaRabdOYgj/FaUxHA5lpjBxuSoaWHPSkkVGjDU8NY=;
        b=KiChrqIUzNWvCbAiYN+lRMYbqvMQxzouBji8y82aRbmIzOqgrmt0r13YZ+hB8aAXMK
         CeZpJ8/R/WAy04X1Ib2XO8ix8onVcDDjyM9xrQ/qjO3amYr0yWJh0wIODEq2dEx2QPIM
         hbKWuGlnQaHiEiHRFRPdVU1sFlJOS8sbO3zoAiRQfnEpD4vydaBXkXX2SPvMy0SC5YHN
         5mObAYKLil2KbtXjr9idHnRcZJ10vw6jgRSL89rPLygjwPBHhyXo2+0cpvxj89mHfUnE
         Enf6uhkjR55nUtlHG8PvuV/sUoEcSY/pIM7K1Ywl30ttNnoEsX2GB9InfHLeiuu4d2jX
         GlIA==
X-Forwarded-Encrypted: i=1; AJvYcCWsOLf4Kp/9z6AGaQAGNuHO1rLRD8XWtuGabGeyd6wlXOkkcpB/oNmSW7ekZtRbGmDj8Z5a6kGBdtvMbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoirJMVwds0H3R0BVUiUeKdxEM7zf1x2UYPD8hWCnaQ7tUBJ7p
	Rk2iAHrHZdQwmhYkFHvdL5cL9hfyGTh2RVKw9JG4Od0kVtA9gsxloX6NKF+Tfj8=
X-Google-Smtp-Source: AGHT+IG9catzJvE6iZhMcet9lnrBEGB4mWrgVfEl6Aw7Bwjo8k2vC5A57va5s4Xp67KUnf9ZyIG6qQ==
X-Received: by 2002:a17:90a:ba88:b0:2e0:f81c:731f with SMTP id 98e67ed59e1d1-2e18481a282mr222726a91.24.1727798852879;
        Tue, 01 Oct 2024 09:07:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:07:32 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:17 -0700
Subject: [PATCH 12/33] riscv mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-12-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
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
X-CRM114-CacheID: sfid-20241001_090733_945593_9C0F3204 
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4948a1f18ae8..2c6edc8d04a3 100644
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
@@ -738,6 +743,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
