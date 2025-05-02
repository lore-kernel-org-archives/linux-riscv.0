Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33269C3ABAA
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 23:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhZnULThlRVsbqfMQp2+ccN2pXovwDEsD/Xr4vQdyNA=; b=08zcCaoEf62tiP
	i9eDI+HvW+fZ5621i9uuHBP/O8Ntdc9aDt1KYikOEjzDxNkEZ554k91CFzlAQgzbXUjLjh42BGLAc
	atmPKR6BHjalmNRTRxiF/SFzbxEjsdCzZiy6u7fDfrSYL5/jPCwJhA5V3igYP2ARK1gxrRsUqNTML
	x1THWrGhsfAyOV/z6mXsFFtru1aSS8oImVxm+AlQOJ5Kzqa+BN64cfhkDS8CcFITcunc6gPkFx/4r
	1wpt2dTvNIWkJcT/XNWqxapKDLBP/Zqwd9lWJytaRasipUemmIWLPYo8M3t2CmvEnRycVhI8ckgPb
	jmYOFrS6gTiN6EMN71lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzqV-00000003EU9-3HLl;
	Fri, 02 May 2025 23:31:07 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzqQ-00000003EOe-2T6R
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 23:31:06 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-227b828de00so28424255ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 16:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228662; x=1746833462; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tvKQDIIBJb26wPDVIJoD2xzubcY8uay1NjKLxC4PFw=;
        b=MejSLrF0knXoY7UITE89IrNkjo5QVJot9PY5duQLjMaSK9npGbQcFdv1HN2nWvITq8
         uY5ulrCtgY0DwbeVdSjMZKOpIgXgZHiFrKhNy4O3A50CR9FCGEaVcaG1FWtnAC1266im
         NSxAZijAEXyHwOVvhOQCLeUxVSQZSSNEfkA3/LI/LY+zSsngU8YMQiVtlw3zzA4Tp6gB
         SNG6lI0bCJjy+BijAfMK0ZrsT5YSRp+tabcosm1z4vPwMC+18Q217MCJX6LgnONOE/+n
         oEylIN2wru+bqFwP7x8bqp3KO4QGA0vszQjX5W68HDvW9h3yWk8j0Df4cKszo1MmMpeO
         2uCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228662; x=1746833462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tvKQDIIBJb26wPDVIJoD2xzubcY8uay1NjKLxC4PFw=;
        b=C8yXRuOqu9rL6nMUQuzXKS3ZpQNS8P/f3QkYWsZ2pinHW3XBCYeK/2DvvVJSH7sDAG
         JM+HaG3gQtOPRHSgdotppAWzxpxdZn50wo8pbmdsOYjd5UnTln590XMvbcyFUI83uumV
         3TBGh6Ldv7Oom/xcboMh3cpmuj5pweI6KCEJ9uxwiDLf2f9Bbe5ERvcQRyAOgKMWwCNZ
         jBRxR0ENfswv3VMjfq2JahuJdQwrCU30C04Cq0eBsPXiCCMNuEjdCCV2HXv3OemJiPzS
         HfM0vdgzqN1Tg+HGvdoFM20tG/UwqG8peZGWUrxY7ajCuscV6tGFXPF8SeulRp7KN/Yy
         30lw==
X-Forwarded-Encrypted: i=1; AJvYcCWRlnWlDJwLMG3EsPjFdeaSySa8mZD0Tz9Zp3cKkg29iViftSjJsLlEhq+lLpsfDVEInssujRSw5ZCf3g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzngj7RcZUIz1vfacF0ATadJFAuG9ilHduRt2aD1om8OpxbIL+S
	iwHico9DZA2OxQRgy6XxOqaO96eFoV3kkzTWFeHX2Mz9VxP/m/VC48yCU1NYmJY=
X-Gm-Gg: ASbGncsIxSFO2CL1c1Otc5F9YWrs7eLpmA4Ee1qWtNWJbYzp1sGjHJmbyWdyEgWyJ8P
	tDeZQ/IXOdidNBwtSSOPsKIObnuuXdm7KokGiHFPcyQyg0NvVk1QgDYeu47JuXLNPf9LEG5AjwS
	YnrcZhY37fI721vcrJTdnk6s81RqbN5uYA/lljy4Zuo82mj4XIp94i7flWOhzAAC8smdiTOghLc
	6hk5/GEn16yYujDaGM9JH0MvGABXiarGIIJQsGRZYtFkVBPL1fOzWO1P2n1fd9zLi8GkC5BXegE
	MZPcK5OWTWe4le6aiDRXPyOg841RwvXsX+Cx6m1JP0npypm0+EA=
X-Google-Smtp-Source: AGHT+IEqfuzCTZSx+a5brjvbGf/prFmN0Rz54YtVMXc6bjau1+RYBCzUvKjlC1VPrFR1GkYq3IBw7w==
X-Received: by 2002:a17:902:d2c3:b0:216:393b:23d4 with SMTP id d9443c01a7336-22e18b864e6mr13931375ad.11.1746228661987;
        Fri, 02 May 2025 16:31:01 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:31:01 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:38 -0700
Subject: [PATCH v15 07/27] riscv mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20250502-v5_user_cfi_series-v15-7-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_163102_642530_33A2F1BF 
X-CRM114-Status: GOOD (  10.43  )
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
index dba257cc4e2d..f21c888f59eb 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -433,6 +433,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -778,6 +783,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
