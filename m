Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC7BCCD1BE
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 13:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QvtxightdoH4nlDF8ffGe5AWAG2kfD0XCcF2iJcA6Q=; b=dZ5gL2U0cCexIz
	68kdC6mdbotKfxjyEp5H7WxGFt0Z/PfLr6/zN32LSXkKS7BY1LMYljUGcBdYDFqlyoGUgRSKAMM/G
	suCXroKmMHk8ftTzHl1+AHaVqHBuxZ4cgeD2ct8YQ6a4W0v1mxz1FzgDj7av1lf2cxf7O7kAuUoSU
	ePdAng68XhRn4dv5KvTT5pQyr5F3s/BcoU/mDBRlPIKR/1dR6ohTFVAXU+G2cSujCcTlOsPWcqOSi
	FCb5E3UajNopfcanQg9WCiUrvulhHRD50GyeqQ+OqEQBEoKqqj3z4fdENxEI5oeecqOiSxers1zhQ
	b8tV9n/Ir1LfCcCxbWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvKK-00000006N5P-3dxr;
	Thu, 23 Oct 2025 13:26:00 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvKF-00000006Mz5-3rP3
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 13:25:58 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-290d14e5c9aso10367785ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761225955; x=1761830755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aU5JHaPOPUGgukhD3bad891ElerIE5ocm+VeTPJz1C8=;
        b=KdgJAx9IeMusntAsvLC6lKLhXHLpDCFyuO/NeMCvfMid2yBkEd0SeM5gINyjHdh7nQ
         mY6D2dtG4ZXR6GbGndOzROYpqCaoQDBZiTjotGNuH2bGF6FtzRZZ811M7rBAWwX6OGT0
         1KOy7sbGCLhwl1q5fv+j5Jb9dWS2pSDFjc6jCawMIZdsVkEXvyjh3NprBaxjDhlyN4L1
         1yjyh+nVOFAtiHmKzJIhDLWiZcPPJDmHYiI/Tvz7qB1vxEtME1tYv2/Ml2kFQ6d5qjcb
         43TMGlBPFGC3OHW/+F2v7jLKlNnail2vxezvGoXFmDB2XPLUlRQ9lNzF5KKyvtUWuNP/
         FPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761225955; x=1761830755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aU5JHaPOPUGgukhD3bad891ElerIE5ocm+VeTPJz1C8=;
        b=qrBiIhfF8CFS6JVpsDMVk1l78O0n13MCKuKCpW53C25+dLHS2f2+sbmyx+PqI3mCnM
         Z/rTXCXZnv1hr+18mZLjKMa9hPZlLRDI+wtWH92ZddPWz/YE6L5yL4I49pK4HrPO8f40
         XAl2HteqNPf2udCk2/96A7n3dgA66QJfLqc1yFSA9eBBkJ1JIvq5Gg3mUG0arocQJyf7
         PiXfB6msYTDytKAznjtS553KMHmBG54PB7huTTM8orARLw/bH9idmtC8/Jgrc14NipY5
         bXSgx88THe+zcGeoBy1zzbDnMbJrd4cKodRdj/tH4PcHt+n+tomkNkQb6cvYlawIACGz
         bxdw==
X-Forwarded-Encrypted: i=1; AJvYcCVVqT75H8EhEmdKi4ZxPKDzHnTr8ajbf0v/+06RZai75vLoi8vv88aSdfY7iEfhVBqUYTwH9u5OSzuXTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuRD6651StwPTYqnwfByzF0l2Kw52zZXsDog+lQltI1WmTlRLp
	ZfCdiSvEkHPBChCC5fad4cPzPoEcjH7HfgGnj1PsKLboJwBDuFYP2r/c6EAi8nVuEa8=
X-Gm-Gg: ASbGncusf6ZYm0yXlEPZ7WMEYFLiFBanlalK8ZBjoq2Dye0LJazBM9oS0Sa42+wYI/g
	HkngLY2Wz7y7AtENFfet59nDp2dh46KNPvAMpfmtB23g5EOzyvqWP6ROAzxIVgpMvwjkWlIcE8k
	3lktJS3badiQsZgMBc6xZsQ1H+uZlqrS4QIbSDcbB5GzNneqpnGK6YcULOBJ3DEDJiWeXo89Awp
	GXp0XmqjsrZZfJeEF9ZtOtFhjhQK2IzSfelj3QPOQ+ioo5IysBA8EKBjEJFXQGXyWQzmXZnAL2W
	/PclgFTY++SfkcAPichvBbzLawgfKS+px589XE1g7+bAKEurX6yZPdOfoWZK/Ra0Lo1RdV4Spoy
	rYdyONcdIDsDVEz79WhxTHgxxB/Zo8I6K/VJqVbxKuRKJ6Hw1oMglxPMd4B3tcYE7jDiW5eCgVl
	WjuiIL+EnUcA==
X-Google-Smtp-Source: AGHT+IHdVVJz5j5gdwIs7i1ckupc3MWiBeucKHlxMmPwS/HD5Gcn1QAjsoFkXcbrRaTvtAeB6lGYFA==
X-Received: by 2002:a17:902:fc8e:b0:267:ed5e:c902 with SMTP id d9443c01a7336-290c9cbcc96mr331173865ad.20.1761225955000;
        Thu, 23 Oct 2025 06:25:55 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e23e4b3sm23432035ad.103.2025.10.23.06.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:25:54 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 23 Oct 2025 06:25:37 -0700
Subject: [PATCH v22 08/28] riscv/mm: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20251023-v5_user_cfi_series-v22-8-1d53ce35d8fd@rivosinc.com>
References: <20251023-v5_user_cfi_series-v22-0-1d53ce35d8fd@rivosinc.com>
In-Reply-To: <20251023-v5_user_cfi_series-v22-0-1d53ce35d8fd@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251023_062556_249911_DAF629A1 
X-CRM114-Status: GOOD (  10.91  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
