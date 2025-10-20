Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA3ECCD1AB
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 20:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oya45wsnnpb6Ls6K1Xy1rv7n1WfN2K590xmQGtvgcZI=; b=mcdhMM7mpHxj30
	FvOK1Ro+SpajX0/3HbLbTk8CifBt2Op67ratwoqix3Sc3NmqWwvm4JrzAQAAeNo2SPOPXVfDfLPzE
	ltdgfg4e3qKPfzMooziA8nKNHJz27vaLlGl3rG7Mr8UzsMNeoHPxBb5FHqlYMFvbsFue/ASZXFqCb
	FFbDIrervlvYFudOtTFrEKViUAYsCneQW8u7xJBTgfGlARDZW+Fze8I9sIsgvY4XigfATXsSl/UkL
	nrqVjd6VCMinzTSEWRtMvsIp2ZXM/XqLT5srzlrzlOqIDfutWygplBdj7rpPp02D+EA52aFD0dMUR
	dfBu67JS07x/yJt1LxMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwPC-0000000Esrh-0CSw;
	Mon, 20 Oct 2025 20:22:58 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwPA-0000000Esom-1Ceo
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 20:22:57 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7835321bc98so4194640b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760991775; x=1761596575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ouwtbe8R0Oh+n2FlVTKPPjmDEW3Po0ayDuW4LCokLZU=;
        b=Jjc4tGmhV0mI6pG6eKsvS87qUBQw04TxbvpnWLJONEgKIXXGlUrLlpXqD2jlMNCBON
         vTkFrLsLYcCDY7pKd9ljDOYg6ngE4SdNO8n8X//svsxzzAzM9VpCRIv7fJcwyHAIzkSM
         ++BgtZ0o61eSdc1Qu1e4y8+zltfm5gxLN5YfW0myMoSVKSpN0ufTjFr3aUYDtMuKm0bP
         RXFT0nT+VHoEWolclcGVXhrcglEGjD8+WargpBEtPRKYFCqqYPiGqzzcZmy6dBW6rJFE
         S0Wrkz6k8ye4FhTReRL+6odEBUOm6nerAZpTPr8FkmhY2T9gqUxiiLxHo7p+6lUGFJ9U
         MQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991775; x=1761596575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ouwtbe8R0Oh+n2FlVTKPPjmDEW3Po0ayDuW4LCokLZU=;
        b=DQ1/g7KFnaA1WZ0FbijBvPr/tZN8yaT8Guc01n5aVRjY4Rsi5KdZDkz5U1l7P5lZxK
         bM6DvVZDQE1urFbxN1y2n3Fk1svQfG38Xji8b6uk9TavOJTvbTy+LmvIDuF5tAZJigoj
         xiFHPXBN07x++foD+ZUXmiKHGLhJAoj/Otd3Qo6Agh1aEl8UDcqvR60H0X66nonF28vV
         1mQlbqGV0Gqi6Y2LHLdh5jaUMjvCXiXiRrvE0FvoDpi3LlGSEXwPdewiSf1U2RE0fbul
         6clzrXN9NQRiXYqIyqhHrUeBgjdM/N6qEST1TSrhJtFbetEymifDiVOwfK3ycKUzCv4X
         O6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ3EsBiZB3cEaaStXJhvFsgJ97gz7nDRvKGBOOGb0xaRQKY1emLu19pqW+XGZ5sV16D6IvjR4b25P1xQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YweNLmA3m2t8EZhAVer2mjWwZLh/adaRTnPpvgbR5Q2eb2UWQUO
	UUMrhK+GDpxb3jYKteHo1+3yTNalS1jx/fIiPvoMtHN7lQyoXg+Rsuv7DzQqm2DWIzY=
X-Gm-Gg: ASbGnct77wzP5HGzjluKqNUrxe+OHen0il4LlGk1VPDwpSDNQD8Ah5xxQqLgDrRkqbr
	YS1/Q6XNzVS2g8Ay+UOYXsw5ZeonbiNZq6gA8bF2/S9MIL6lhZ+w81zDhbdb/q+40Qq2xJiHX1x
	c2Fk7LesXmfYSDE/CIdFPCWyFZD/ZMCcBsjLvy/EKnqs0slDpe9lWpGBv8aDm3Ghrh07ilE6ltR
	whD1SIPi1zNkIeuobeVJmX7U2YRwIFgu3Gf5dVMMNOVceZJ2cKRPFRHFLVBVyLY9TwktkEvYfpl
	7nRDtcCUgxANmOFXCwj3lH9XYyV+EUbX5fNwa/qbWdvQpLkvWRqwRhSACEjvdD6rgfnWdP5RRGn
	KiCTvZ8m+X49RjdTASaI7fBoWn9/Rxv62Dxz/nfeHgoyvZu7m/ZQ2Lfc1YywVhc4Ay7PB7hXFs4
	8EO8nb3b/i2faY2PxiFgr4
X-Google-Smtp-Source: AGHT+IGVYGp6RpoHZtMEnuKRtaA6P+e7vcil/yBZ6a/LspeozTywnKWSGgV4o1nOqkaRYdNcLLQYGw==
X-Received: by 2002:a17:90b:2686:b0:32e:e18a:3691 with SMTP id 98e67ed59e1d1-33bcf919f1fmr21052145a91.35.1760991775439;
        Mon, 20 Oct 2025 13:22:55 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a766745dasm8443240a12.14.2025.10.20.13.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:22:55 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:22:37 -0700
Subject: [PATCH v22 08/28] riscv/mm: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-8-66732256ad8f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251020_132256_339249_2D4FBE84 
X-CRM114-Status: GOOD (  11.08  )
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
 arch/riscv/mm/pgtable.c          | 16 ++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e4eb4657e1b6..b03e8f85221f 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -420,6 +420,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -765,6 +769,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
 }
 
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+#define pmd_mkwrite pmd_mkwrite
+
 static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 {
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 8b6c0a112a8d..17a4bd05a02f 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -165,3 +165,19 @@ pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
 	return old;
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

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
