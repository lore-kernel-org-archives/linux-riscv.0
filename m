Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94133C3ABA5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 00:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTtinbinfkLc3QkbNd8y7FMetFInKUodODZNKxoa7jA=; b=N1m8hKbns0J4dY
	mCkk53L9HlWCxW++1HnRnQkepke5iypROTJYDOPCySozmQ2RXos0DgGxIK1Y+VrT+KDvTMHkAUEkb
	12BZqbjzjmSkkHyE/PCncSw14khu7QDZttn0FSZTIaqJsp7N/33+UVec1JqbMOozjc8LN2bPEtdS0
	26AdLkb7JzB4tJgjp958jkCcrMMe4nWQaQpc6ugvmOhazyxTzjFMz+umClATlQgXbgvVGAET/V2In
	jcaqaMSif6WUcNtokkURFBBl4Lhw4lUKdvbOd4di5qowQH94hd6TwdJni1UaLWSTH7QRnwJ7BtdB1
	zhpnCyFRPoTfFtb9O9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v8A-0000000BGEf-45zL;
	Wed, 30 Apr 2025 00:16:54 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v88-0000000BGBe-01Dx
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:16:53 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22c33677183so70004225ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972211; x=1746577011; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIAdpVF04Dq2IgOKnxPyubvKXBbe4mWx866NZtbwafw=;
        b=qNbRwEt0EZ/F5gH9IYhWgurBzX7VDKpuOoMPRzajYZ9yPJFqvP5FHV238sMjQzUS40
         u7l6RGTFifOgrxeEtkadIU9oWFkMAlqTVfkjBBdoBF9Z6HurM4P8+DZran80YWtm167a
         U63+aVkGBcMcWMscZ6R07n+ztWi/hQEMZ12FnhjbS5cCdgaxht3RvbmnAkESEuS/7V/f
         RQTMtN7JHkUjPi2KxmycJb0TVOibYuEO5VTdZ5kvN0zVw60ce9UPouxXiOrH0BFyl8FP
         dQWJ/1x44rgXRezHljpo40PrHs60+mDEghrtWpF+9s9Xl44fYlZkGRMUPvzyJ44vqLWX
         /Pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972211; x=1746577011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIAdpVF04Dq2IgOKnxPyubvKXBbe4mWx866NZtbwafw=;
        b=bd/I3xk7uemb1mVmcf3pa4o06Ucax0KNl1DEpgWnwPyaGRU0BIH8faL4K9O/le2grj
         /RnUV5j4/akbXtlC+i9h3ynFk1/rBilH64+zh8WV0bmHvRRq/a2QXmPOlM5tKkp9nXc/
         IyOc1iWLmy26tYUPrnGyVZhemWdcP2ly7KzHyk0BRsFqFKFjT1fDoaKOpXFSWQlFAD9A
         6bLsv8GKNyZViiupkyui/ATZ2kzLYxygfGJcOBJFg5KW5Yb8aFNUG9cI/m5hJZAiy2pp
         EYYXKp3WmeP6e7HSKI2xOn9PfjQx9Lp5Ch09mzwfA+5FrxGMzfANrnlp3nYQdKjopSr7
         pHQg==
X-Forwarded-Encrypted: i=1; AJvYcCVTlGA0A4u9lUY13LD3NvE00Q1c9F6RI1YQNqwx5kQssSMBrsyFeqfpMn3F9lbsXlqRuRx4dBFeAQGwWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk42feJBgvHT0aVHV/SYKszqE9J7acErPOmW/u+nJtHpoyi2+A
	ce3iCtmZMVMsHDdo+C0p7j3ylLM0bUkj62j6/xlLZE6jVgpnHV35/4aGoiyZNsw=
X-Gm-Gg: ASbGncsFIfbMpAChGtw2hqpDRCcVjYLV2EpSWaiB0Ou++82S9XljRKeWzHdZVe55phD
	Ze3qcHjWWVXCZUOSv1xBae6CNT9Wrml+uuQOCOJAzXRedK1VDAQM6tYRlGMiabvHrI4dktGsTK0
	QeXFQhOzspRWaIArHrCX4w8QJI4kgif4fgUaAwsQK53GmTmhzwxAb7E1unyQf09f5MlfIJeZzm6
	T7Zwfj4S4lhjLwi6/1Uy/eqdwDSVdUb2ZELI/ZUVdK/N+4L+lWVSKyKYGKWgi/Gx9vLV/PiXDqN
	eAjNoZ/eGefikFGosiAxZmo7a9vyhDyqGADk+SGjiVac5X8JAS8=
X-Google-Smtp-Source: AGHT+IFy7GE6JtLObwZnxUszukpaDqp+5LC/aQlBmZqdBbVLTaJAIv9ljsO1vQI41frLcmnjPyCwjg==
X-Received: by 2002:a17:902:ce82:b0:223:5a6e:b2c with SMTP id d9443c01a7336-22df57a6ee4mr7211325ad.17.1745972211261;
        Tue, 29 Apr 2025 17:16:51 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:16:50 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:25 -0700
Subject: [PATCH v14 08/27] riscv mmu: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20250429-v5_user_cfi_series-v14-8-5239410d012a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250429_171652_042390_FBD704E1 
X-CRM114-Status: GOOD (  11.57  )
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

pte_mkwrite creates PTEs with WRITE encodings for underlying arch.
Underlying arch can have two types of writeable mappings. One that can be
written using regular store instructions. Another one that can only be
written using specialized store instructions (like shadow stack stores).
pte_mkwrite can select write PTE encoding based on VMA range (i.e.
VM_SHADOW_STACK)

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h |  7 +++++++
 arch/riscv/mm/pgtable.c          | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index f21c888f59eb..60d4821627d2 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -428,6 +428,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -778,6 +782,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
 }
 
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+#define pmd_mkwrite pmd_mkwrite
+
 static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 {
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 4ae67324f992..be5d38546bb3 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -155,3 +155,20 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 	return pmd;
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
+{
+	if (vma->vm_flags & VM_SHADOW_STACK)
+		return pte_mkwrite_shstk(pte);
+
+	return pte_mkwrite_novma(pte);
+}
+
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
+{
+	if (vma->vm_flags & VM_SHADOW_STACK)
+		return pmd_mkwrite_shstk(pmd);
+
+	return pmd_mkwrite_novma(pmd);
+}
+

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
