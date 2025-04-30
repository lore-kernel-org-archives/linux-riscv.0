Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D0EC3ABA9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 00:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhZnULThlRVsbqfMQp2+ccN2pXovwDEsD/Xr4vQdyNA=; b=qMMNXyvD+ljKe3
	Bxt0A5D2YE8VpwyGu/yApEbHdFAyyDDCGGE7QZQP8FIk68iAOGRPUyr0C+IQbHrkEKyPdjzDh1Okt
	xLbN4GuybH++0jxHKDFKFu+ysTtYDnJTwrGiS3WTi0G7BmqjaRdg2aum+FakcEQ7nOV7NRv5zKNni
	RFNFW5r8OK4qHV2f9eNL0FNZXclo6j4xAnigIp6OneRuhN7euVIS8xAiPPp153pGO8v9td2xqtgrw
	HeuuxqDiL6K4VGkWVGWiwpZ8ygT8zpyJtwfqwsZ5plhUN9+Z8hQzD2k2vL+OrGopO6mbt4y0YT8zt
	5kR3uthaLdLHSeVaLsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v86-0000000BGA4-0ykV;
	Wed, 30 Apr 2025 00:16:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v84-0000000BG7y-2dHj
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:16:49 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22c33677183so70003925ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972208; x=1746577008; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tvKQDIIBJb26wPDVIJoD2xzubcY8uay1NjKLxC4PFw=;
        b=EKwwGMsju2DYE4v5F8CdL+eNdQCPfUjVo7iNXS9tMU7xrIhYADW8Q+zeXosqRcO6Bp
         Acjw/yWlDlBQIk7wYrdTlGVi+xYtGxbhZUjzQU/seaXo23mwU3Q0uk60nBgNKqCwBaYq
         MeQ40YeOltAnwKU/uBKZ1h6w/BJ9aEPmw09YNjPqKa382Yed4N7u63CDdQo36SugiLl1
         WT4O5rW7IcziOCjLBXJnhSrzxW9ibVwmTWBEcMxzAGMxlwNp61OnKkFLUcWkdVFHVVdS
         bYtu4dxwIxV6UlbYzGomdDZSAznupKpZ3jj13zfJS4WH694DxUhMzOeKWv7+3EmFk4H6
         R5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972208; x=1746577008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tvKQDIIBJb26wPDVIJoD2xzubcY8uay1NjKLxC4PFw=;
        b=QLfBbC4T+bTSB800dh+ty8Kxop1NDE6jFm9QcYr3MuD28/LE8BP+KlyykV3m075Yt8
         MWn9bTKOUYrGwUvg0Wc3U1tiS230+FTPWOFmqo18Adpb9kbYkww6ccxOo8rJEVLW7AZV
         2dG4UEyArJ+BUtZuCFEzMIX+ktFjKnYGiw+mK3ziR115LArznp2iFOVCh2Os+PtEQkRh
         MsfhvxZNSl0yoZe0J+yRemJXaK1Jgzx1PlPhdK0MubqWcyR/dFSMKRSy9cfgNfClCjOz
         hiCw5UNI8ovdtyE0VumFmxk/Y+EDZYQYcIfUOltFiEReEqoa9t0+QccLjtObmis/Hi9b
         Xbkg==
X-Forwarded-Encrypted: i=1; AJvYcCV0u/X6jHpHwQcB9ENEv1qWcCF8aiZcsUFCv7F6Q7uY4CFAPE3XtWTqZnT6nKmG0p8dwDSwe4fJggNNPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz34ww0U4wcLKtbiDIsNPPKfhjpkbrYxkkSbPV2uaziBzS/hVUG
	rZqIHAWmLav5orufmvgnSVJM52fopD/RtlFx1RYncCsZ+C/6UuRLIKh4VLmTDMo=
X-Gm-Gg: ASbGncuursVtCYnDbDAOFrRJf17pjqzOxy8i8VTm4h6/GBQWPt2wQRIzPYo8HJwH+XP
	CiSy1PPnB/zQHAWYs93khXUgAcgr86aYIpa3I8IywKDXR/1HuezAHtJh2+yRaQfkuy8JRUFTfWO
	BcC+F6uKCoONJmmNaE9HF1MC47rGqKvcRmrJyOKVXSMsTGU2/xXj+8qfD+q3U63g4Hk7vv6l16c
	EdH5gn1n3VTSkhFhF7Ureiqgxh34IItbzLoCbCk/zEBb8hZnDW+/E7ssGvKcL0F30nCUezxVxxI
	9ftBErPZtsISZLNp7dGAIJ7/6//BhtZax3kHnOYtQQ3STQJHB2o=
X-Google-Smtp-Source: AGHT+IHF0KduTnYGQrePlJEI6tXkimvw7nrR1QkHLBA+cw8lQBj1dgbc3Ah+yAI0hO6Ky9wQoxTVRg==
X-Received: by 2002:a17:902:d4d1:b0:223:67ac:8929 with SMTP id d9443c01a7336-22df56bf231mr8352805ad.0.1745972208061;
        Tue, 29 Apr 2025 17:16:48 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:16:47 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:24 -0700
Subject: [PATCH v14 07/27] riscv mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20250429-v5_user_cfi_series-v14-7-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250429_171648_679757_EC752358 
X-CRM114-Status: GOOD (  10.66  )
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
