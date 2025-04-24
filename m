Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4231C369D7
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 07:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4W4fd2XRH3hgbMLoANjyYLOFQcS+TQiX5qZ4bjbMiw=; b=AYuT84rug6qaYM
	MMYIRFbKjwLKukZ27sJKAplzg0vwjOS+3hvQCiD1mRjNGMNge3+zT19IKuboJQlNEX+QmXWBB0JWG
	H8KoHnk6S+wN0rPQEjgmGMI6OhrbT8/oi7I7Rue04MHkAbXw1q4xc1dPQ3MfbiuHqP0VUnM9bvC9p
	amOQ92C9FaW1zocIH4RiMb3MHWWre1NVa1GwOC4MQRW9t4XS9ZOPQngJ/QC3xTHuX8jlnx0wiyCLc
	FOIO2EbkgfgnRL3L0TRpkIsymetn+SC3lJdJX7343fm3Wj7Q9ob63BZpreBXHRYsrjbdVEc++E3x6
	8vqBv8LkRkhTfYFaCbXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qvD-0000000D92j-1ivH;
	Thu, 24 Apr 2025 07:22:59 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qt3-0000000D7m6-0gcP
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:20:46 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b07d607dc83so486359a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 00:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479244; x=1746084044; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwh9x6lD2MO9lJ//kvPDhOJNTq6ZrmIfW44uUh8vro0=;
        b=kjncONQbcysfH9kmJhLB4bOS9YLL/zD/fM/Q6tqlqzohTAyjimvagAz9zH7qVGdDs8
         UgxQbCYcqXnQaG+bPrawKIt5fFb+YlLf4X6t56CnWKwGMk4E13SExT+tTSPLzOjDCjFp
         S5ghg6f9wlR5bTrX+OLmb7DcEYNcCUDW7rOEi+c9+YvCnlmMXjqYPUYjCRoJVvSSDRPr
         /tFTeZ7llGnMYIcPvPzY+mn3VvYm3jKt/S/2mgPqhRcgYKuyB2QM2AX507Mc2Obkepak
         mND9C0sCL5KFgLUdya13NF2PLNBgiwcfzcqMcweEXTGIZFwk11bJzudubn3nvZ2iwykW
         WUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479244; x=1746084044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwh9x6lD2MO9lJ//kvPDhOJNTq6ZrmIfW44uUh8vro0=;
        b=qv60uHETDy1w6pI3/7RIzwFpfyuwhQdr6fn69jz17zOaJBG7tKwzi9GLvaddsn+cVd
         l3pxbVCy7FSWImu1DX1ij6I8gkk8DrNqGmpzTZnS7Wi4DMtsbA8cRTAc283QRDQcRQay
         Olgg2v1NAbBqsR1XMjb4KYSdHmNDAdq4qQ8CEjxJfsSl4vb0HceFzGRRpVuglt3yYUyV
         7NKS+XFyYn8/FDLjQjTJsdVQYefU7/OjBTjrvmSpW0UvwYALBsKxh4eXBfiOi3xahfVc
         PIMviws0ldYbypU91602EplvV6fSgrAmnT94sA1BmbTyJ9trONAxpWN1mVuvjTRAGOR9
         C04g==
X-Forwarded-Encrypted: i=1; AJvYcCW+8QF441FwKZQQYMx+f/yy+oVGUcab/0Cb03soHz/Iw4bT3AIw85fhMjI9/gAAEhCbtHKNlI20wTFIWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ5uoJfc75w/BimBZURKqaPlvdOWgupcDCoa3m5KDW7c91BmLK
	RUqAwHYAEWcF5NwZAx4gHISVJK/0zPnLfTqIiWtOYv74N78wXsQzsf3AMt/FY84=
X-Gm-Gg: ASbGncs4UdtvmtUTvZFm/6cgii8PjK0JJYwh/RFw4rPVVYHBKhSiS8k/Kq/oNbFyKkn
	0gocWk6zE18KJGEBs4IjNkG/sey6uQRvcUgdC6g956zBpg3AiQshEXeadzXayA4DI1ukYQ8f4El
	p72XFCiAefAoXwoC0KZ36UjETrTbVVad4zJ9lbOEdAOBfjL55+ohMALGY+FV0/2eC7S76iIsgXq
	BS/ZzIeJphL2lU0hWbtkpF6xGM8KHOM5ID6yBZGE3KB7J17guKj82onFysqOWTse7yQ7dDg2wSj
	lqcxzouOs80gEHt2LF1xIXdGYsuN0AuKQ2g8mRTjxrb3hkGg05E=
X-Google-Smtp-Source: AGHT+IEC5A9t3KljY5+oPEDMiuLjjOrgYWWUXALnuXXsSvtsWmrcbar9Dh97NMWpjDuX0nmNsvCGcA==
X-Received: by 2002:a17:90b:6c3:b0:2f9:c144:9d13 with SMTP id 98e67ed59e1d1-309ed31aeeemr2671578a91.24.1745479244474;
        Thu, 24 Apr 2025 00:20:44 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:44 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:22 -0700
Subject: [PATCH v13 07/28] riscv mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20250424-v5_user_cfi_series-v13-7-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250424_002045_217162_52229641 
X-CRM114-Status: UNSURE (   9.99  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
