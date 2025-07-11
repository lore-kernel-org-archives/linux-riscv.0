Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AACC83F22
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 20:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeMefPGbQ1Dzs/Wbkpac67x5aB2DMoYbUus6mt7q3og=; b=Wvcqt/Albo9Lka
	UQ3XcS9hksMVAdBFTzjU8YfqNgvH6NjPW+0l13J6HSwNDFL83X+hlRnn4K65GUUk1/edXSfMvZTp9
	QdpcHtmpt79GZF4kYPVJIkMhBi5MIxOmmdv5rgsmoecNwyDpf/vePXQukTDVpHRcEP8fntgklLlE2
	Basn1zTZfU7LPzobrZ3VxyCbzSOq7+8NEPBZkZqKf8cxuWcruxfvqsxf9j86+QLi8sE+biXYj70lq
	jct2r02lYamuAR/QyjML1GkrxDPpD2mIFFkCNO61aabBom0jn3i6/fCcaecsQ8Tz8CfY3XSS7vHHW
	VHSDrkOiaw+U09Esgfcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKeP-0000000FoQU-3hFP;
	Fri, 11 Jul 2025 20:47:21 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJhc-0000000FgDT-17qe
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 19:46:38 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-74b27c1481bso1621895b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 12:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263195; x=1752867995; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ez7fajQ4lWgiIPATC51FeBxCIECW6n3uAlkHVBFvak8=;
        b=NSIBCqURXCjhfQ2tTVZ8vRR6QcZTP2RwOrk2K5hINXDf0/HzA2DY2ErWHlODaxSJTY
         GbOG8XmhRh5sYFs1O8tJ4XTrK0ssMSXlgveCTVyitWnAnZQV5rM7Drh0yPd1Woj9M8aH
         ob91Dl9GxZEkaO+c6/+YI0raigKNDS8SM7LHOyV8f0armgHn3ESMTINswYwVtxfjjGHj
         8k6mIN9fpdn23HWtAdjhvRlK5mclW/TO1cyu36qig0zdTAqdlyQl0xFVF6Dd3mVIsLpP
         0m3B7MwjJZvI6FdH6YYkRrwuDqGSlvhgrp9BG4SF/9ROG+ygK9fbMf3cfaNlA0rHADtS
         ILAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263195; x=1752867995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ez7fajQ4lWgiIPATC51FeBxCIECW6n3uAlkHVBFvak8=;
        b=C3ZUFg9JhDy+wccGDlNkuA1JNqpWGmoX2W70bAXY3XA/hJo6eVRUhZUv2KAnAueGjZ
         BDqPzY8FTK5xTYy9mrZrhJumueShFL/aDNXEyL+8cAtpRo2ZGEP+pnGnlCENF7H6aD4N
         8wE8WWqA63dw1PBTcK2WkkTJ4mVrodC5ctbB6nm9bGSaqbF8wORVcROnKzN5ZFrl1oin
         JnQW5ylMpCREH8FnAOoJBKUzz+1dpMSlxWF5VmhMgdsAnjUe+LGKrOpsn6AG7HhAYWMe
         u+1PvKrrM2IqhfuVXj7ixvHUgX0JNZrhKC4pvyO9DuECxyNCvIZQFXzyVdb6qoscoVqm
         RsCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo+8sFRxQfaMcJXi05gb4nAUwx4hdTBRYnBt3TWc+6cFSuTkY3BZXZOY9Zf3P9rOuIU784RYWyOy5hZw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlt3RJUPjFzOwzm8OgCzZlc2SSuSJIxnBZxlEEG4BSCmM8wjSf
	Tf7c/TJIm7c8ZnQQAWwT6nwT0t1/4WP7T6q3qKq9zeMUHk3O+d+aQTVZH80lrd7hLxU=
X-Gm-Gg: ASbGncsqRycpqGOr76k7C0ME3++tr7o1D8LcJKqJaiwt/bMVPZYfhmaOJIcmx6/FINu
	0XZKoJC6NhMdn8JDbJMMxUOInsDSRXUkUBXONpHItNWok++twfI28HkPtNVETucET0hYUyYXCdS
	lne1CxOi0b2OS+5iFoNRBKugU03uxNC37FQty2qxqn6OP0WUObMdQ8BCWdB5+ARGagES26vCp08
	rNg1d5qD82S81hlNIBYUL1S+JWBHOQBYYFCQn/0FQauNyT7BuKa/cIavQOZeU4QY8Ks3BxWT5Lb
	57oW/ApI5NmrLApgLR2nYPzS8zAfb/W0Taak0bD8ioGWQD3gxAqJ1m9D6JUlxBnmetoXuMWE+Ab
	TgaZ7UrQBzlLqwGihyw3RKKJqToheVa4K
X-Google-Smtp-Source: AGHT+IFf6GpiYkRjqjXqvbw1T026yoy+3X+Jfl0FY1n8dZaAAOqTxp1j8L8i96QaW/8od2oz8aWuiA==
X-Received: by 2002:a05:6a00:c95:b0:748:f6a0:7731 with SMTP id d2e1a72fcca58-74f1efc0e27mr4847413b3a.23.1752263195403;
        Fri, 11 Jul 2025 12:46:35 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:46:35 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:12 -0700
Subject: [PATCH v18 07/27] riscv/mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20250711-v5_user_cfi_series-v18-7-a8ee62f9f38e@rivosinc.com>
References: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
In-Reply-To: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
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
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
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
X-CRM114-CacheID: sfid-20250711_124636_303933_AB671D7C 
X-CRM114-Status: GOOD (  10.37  )
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
index c0d7e67c67ff..792cb9792e8f 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -431,6 +431,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -776,6 +781,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
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
