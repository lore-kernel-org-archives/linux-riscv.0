Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFC2D339B4
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 18:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PwOhokeXYxgprO77adnCUKHwDl/Y+AfTQA75XzlXdfc=; b=fHzoGVGx2XufCp
	om6CuZDbmBtkjkkV3u2Qadv0EouZ+V/VRm0ZZ0tv8JuFviic//MKdymqWU6YlbKI5xhQycPCsJm1d
	diisdoqvNGE1sgzdlt/t+zwx1Ru1bi/mzKfExLUmLz+J2iV4gEhPl8s4Vju1Tjg/YHLUqoPk/EA4m
	8kul/x+QmB/2HIFLXXmIxBJ43aCNe4Lhka0ApyvaZ0ctJBn2JyWLEhJN1z5X5I6WoAyiWv1aYQTCk
	NTZjOuRSmbULxtmiHoel3Up8QYS7qU4zy63q+6fK8KI5pQVvLkOTlojrq4NK/9wKePRO4HG3HXx8P
	Y6I6YTvLwMeUPyITRZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRag3-00000009pFa-3pnY;
	Fri, 05 Dec 2025 18:37:11 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRag1-00000009pCX-12Ai
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 18:37:10 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so1453978a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 10:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959828; x=1765564628; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BhzOXQIeKPGphLxrrOEUt0Oa58R/DXqd+aRrNPmfj+E=;
        b=Qc9kSePwQOxukm/fwPh+FdzYx/cCVdp5EkhyItWU0zjfglDP2RkioZ6+vsQZdS2G6b
         iYbPzgGoBB51jFXJq2Vq0aQ+X9EgGkA0pJqDzbz8Bwr/oj3bXfHKwVoFtN2Bq+mPaV8W
         jANyKIL8cWFUr3NYYcyxplL0J7lNG93QQJwuD9PNBTnhteVbGoxM7tKiCvuE6O5v8lPJ
         TRPZbit0oUQAlnIs9o6hlb9a9u+OY+o69jdLip7NKZz6EeQ7G9lrycG9x13XdT6Ray8j
         cP1h+a3i4EDv3JfNcuuRFu03kQftT7mbumVAESpWoDOdqJeLKAJU7zVMet3YEvlPbH6H
         MOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959828; x=1765564628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BhzOXQIeKPGphLxrrOEUt0Oa58R/DXqd+aRrNPmfj+E=;
        b=S/SmlhUr0Bv6Bb6m0/1XTa6oFJNCjA1fvmrQvCEMWTSS+YoYvq4gMFuUiQzvoFqkr3
         9idDkoWbYgx27hIiKDVlqeyUcJA0Ar0uSCCpZyxTZC1yYBAapw5gYhpT71OLZZwq9Xh7
         jXSo2KiABbJyE+VRGRLhzQWhStWNo3KmZy6SKdsXkj1GOlZzrb2ewsATQknmvRP1Qj6n
         2Srsk/PYtq5cbqgwXGQlPBR1kr5gFXLswMC7c/mp4YV4deaF/nd0ciPzeUuF6nwPGjfx
         2cnKUl5vnowtfaHrH82A+kS5J3t74L2KfbrcApLco4+F9NxtGCPvHjLQ4oI5YmooH6XY
         XnMw==
X-Forwarded-Encrypted: i=1; AJvYcCUEE4sBUE5IN7DUVXZQ6LBR+aUUWoKyvJJECTVUXciBsQZAdAHrRQ8DM6RfEZoCUuJPe8L9KpOjmjJtEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ/WO8yw7zLIVYy8er/8qa6VnPBjCYWTGp759zdne2ueE5OE9H
	K8WteOpgUA0fp85R9s4bF1aIGgbTj1CwF+sDUzF0ueCj+pmaA+soIOHz2aOZzydZqQA=
X-Gm-Gg: ASbGncs3PHmt1ctrE0JEDjfE6UsQJtAPBUonw/ss8Zx+K0NjvlJB39iqxY2ZN6ltKgf
	t7gByIokkr9Vo0gdPqAsiGX67GdVecOUTnJmCSNavk1b3VTzkHQxovGWaiG46ygikJ+3tPgEBTN
	nzwle76v2tp5OQGVwLQiPJAe1zR0CNknhG/rhDdjqDxfm0pB2axJ/BdWXwsholu8uUaw+COd0k+
	H48gR+G9KOnf9bTUZa5nC3XZBjZJqrUZd59bO4v2w/RkEe+BUT9pFVp4Tj516mdGVQwOdvGEWTH
	Asu4rlXjl9kAaDy+YtX0tnZgWPM1Pmm+50Kw5HLJYMhe/B4sXrKUsJ8NgY7egj4E1ZkvwVaD+iO
	U1Ov95szh2fqf84pOiKRObNyr8U0nx0dwzYnDfqfyURNR3+jgQC0tImKoI/SqazK3QrNz15s6fa
	5636jUj83MOBy7umoUluno
X-Google-Smtp-Source: AGHT+IFTiX7E4nhtg2oLIOiIJsymgB//WfrL2lfzuDUbhfqZQt/M5VDYOlkYmCvfxcqp8BpnyoWHBA==
X-Received: by 2002:a05:7301:1c83:b0:2a9:9688:6ee8 with SMTP id 5a478bee46e88-2abc7201595mr81379eec.22.1764959828290;
        Fri, 05 Dec 2025 10:37:08 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm23933342eec.1.2025.12.05.10.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:37:07 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 05 Dec 2025 10:36:55 -0800
Subject: [PATCH v25 09/28] riscv/mm: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20251205-v5_user_cfi_series-v25-9-8a3570c3e145@rivosinc.com>
References: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
In-Reply-To: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, 
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764959808; l=2600;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=DJZ2aJIoeyTvFOiDWAJGj4EuG7hZunP7odYpwBb+3MA=;
 b=C8TEEy1gs5sN7rJ+eYCVF1t4T+o2d8VuOmzt9c52Aq81heygn0UsWcug/A1KC3oo9oTAcQtSt
 XNDDFyGKg7jBvPECrfnFz1PZnqJVtsC1fQcCVVCaZ/Cl0mGP2aeU++w
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_103709_283849_BD2EE973 
X-CRM114-Status: GOOD (  14.63  )
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

`fork` implements copy on write (COW) by making pages readonly in child
and parent both.

ptep_set_wrprotect and pte_wrprotect clears _PAGE_WRITE in PTE.
Assumption is that page is readable and on fault copy on write happens.

To implement COW on shadow stack pages, clearing up W bit makes them XWR =
000. This will result in wrong PTE setting which says no perms but V=1 and
PFN field pointing to final page. Instead desired behavior is to turn it
into a readable page, take an access (load/store) fault on sspush/sspop
(shadow stack) and then perform COW on such pages. This way regular reads
would still be allowed and not lead to COW maintaining current behavior
of COW on non-shadow stack but writeable memory.

On the other hand it doesn't interfere with existing COW for read-write
memory. Assumption is always that _PAGE_READ must have been set and thus
setting _PAGE_READ is harmless.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b03e8f85221f..df4a04b64944 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -415,7 +415,7 @@ static inline int pte_special(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -611,7 +611,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
+	pte_t read_pte = READ_ONCE(*ptep);
+	/*
+	 * ptep_set_wrprotect can be called for shadow stack ranges too.
+	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
+	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
+	 * but we dont want this wrong configuration to be set in page tables.
+	 */
+	atomic_long_set((atomic_long_t *)ptep,
+			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
