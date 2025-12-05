Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F67DD339B4
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 18:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1c2ON3XH/Y46QA+Is3OxOByJElXEb/mLSDXImiCq9g=; b=fyjeoNuVP8Z6cz
	dwYLDpl2svLaZQcjYdQGJ56+M8UEyxRO0RWaGzQzMhhBRMOWudAY5Zp0HrZNSM8J0Jk/bUp9tz6k8
	JhJOtPAE0PssSlJTjejTfzzzi1oSlQ/5SeCX3G1+AxOlo8Tmh2qc/a2VpLPgh+LHAqyKCVe3gn1JL
	d6m+DWU8ZmjgYtOlfPbfLt/3ok/uaooTftMQTyzyTpcdo/hhFVsDKZOXtQgiFvp5C6W2rhMamcn9Q
	mq+hl6nrgxWaK3Tro/VPfU9M5RRfOP8BOpmzCLUIoxw6tRCVBrqviSUdp4JlA0taqH6dCymlPURSc
	1KMXM/kaQz3ck2ysgDrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRag1-00000009pDA-2OOQ;
	Fri, 05 Dec 2025 18:37:09 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRafz-00000009p9z-1cxS
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 18:37:08 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-bdde8f1814fso1872945a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 10:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959826; x=1765564626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qazkzNjoTGNZQrm2wNpnFtC3xWbAXmOxYceHXxLC8bk=;
        b=R9H3QwLoUyZR15QpcYyx+Fi2q10y3AkUWBd0/nk8Obrs2WENHImRt9SM/96cBIwIRX
         K2q146qBE+7EY4J3HdWxOEYHMumorJdE9ztEF6v2G+G2PaQza9PO6ocU/2+axTvsqCt+
         Jx7vPc9LVaixyV5Q9gDoLmWqxSGvqvP4PZuEkGjR8t58QbjtgyxXlPe1dEHkZMZGlPSE
         +9W5C+Dd9XiIipDmFFvsxF9xawEs0YTtDuGqr0fkaqr7ku0QYSwuUwH/C3SJhwEMsS4s
         GT0GdLJGszzR9mHr+7Avd06IuKFH0Qd2yvirG91cTXFeRa2bG2WpPlrV/vxAebF43BzN
         XFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959826; x=1765564626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qazkzNjoTGNZQrm2wNpnFtC3xWbAXmOxYceHXxLC8bk=;
        b=JjuODBc+q5go4f3Gtv20t07tUg3sO3wOqK27PqFLW2cT52mgmL2EPVrGeFkDe3/2ij
         rWvAnhMjcmbi0aBQexE+BlZSWsW3nLvsftF1XUKIIPbbx6WmW9zbLlMpKY3dGsXMJlcU
         FuNTGasnE2VdbTVx5SnM7GnrILuikpRPZ354LmuA36llpIYHkWnUOhq9n4HXMbN4L5Ko
         Y2MWo1vRrEcWC3xXKrYr5pjKHDXnQ30c9uucoCPmzIMjY8Vkxc5e+GMswUTQLYSFA3Z9
         74ZyxKnZtk2Zd6M0TijEwk6jxROHYRa6wJ1u0x8oFNelxYZyKYBM7nE8TwCI+NoM5KI0
         3boA==
X-Forwarded-Encrypted: i=1; AJvYcCXsWJI/52fwTCuH4YjUVuy4FIYo7++YNML1DgMpnCGkK0PBX8ytGigUzdrWz4Wue5N3gvlqCM09wocQ+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLLHSlZ6QwsFpZINslKIK0AZ6KNu48JBM6fmREDtL3FPP3TitF
	RG1SAPb8rpn6DZKoY1ECRL6V7/8Cgak6FBQrAHQ0T+T380wzTg+aCOG5orm3XEHee+w=
X-Gm-Gg: ASbGncuf0HxXYsjfFmDyd7xHOffbHNJs3NOa3tWqVdq/6kJCalpTc93wo5q1RsnbN5L
	2mameum2lLSfHuRqkrDWYTirmc5UO4aiiJTC9ZCW+KP3U8mwM739eoD91ZgxQ0lMzljrQkEI2qx
	QNQLK3/SSH8ADSDq7NQy7bxQOa9mfZF3jr006SW2qqvsMVg7Iz0dI0+v3ChdU1q7loVdj6+IO1y
	QqAfj6BrQI3PgqPMjBckZV0Zh9XauVs+27339BnptX+CWuV3nskEAAeDJIQrYzebHrcDUKICuba
	yr7vs23zogRx1k14oN6xIEqsOogD3hksx35AOcKvjQQnardFm8tNqcO550K58KWzTnzclQzPxcm
	e1q6a3NYqYjrxE8q8OAjA+bxXr9W4YUHtcV1DgB7YlAjkTjr9UD4yzTd8BmtNvus+Msy74eyyy8
	H9+GBQUiqsGl/19c0+sNAI
X-Google-Smtp-Source: AGHT+IGWPgA52pVKY392RWVs73+ODbHTzrwBl35/Ip/bb+MqX23pPUpCLekpfaEmLltfbDW+jGlEKw==
X-Received: by 2002:a05:7301:4b0d:b0:2a4:3593:645b with SMTP id 5a478bee46e88-2abc713f251mr100407eec.11.1764959826450;
        Fri, 05 Dec 2025 10:37:06 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm23933342eec.1.2025.12.05.10.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:37:05 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 05 Dec 2025 10:36:54 -0800
Subject: [PATCH v25 08/28] riscv/mm: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20251205-v5_user_cfi_series-v25-8-8a3570c3e145@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764959808; l=2371;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=c+59GLf/oXo60d4AM3tT5Dly1CdoHCtus6ztRRar0mY=;
 b=KhD+UIU/8v7BJ40QxMa3DFJbPyhICkmZOWVU8sWEQ0K0JX2XjnwtAs3NAXwpAsMgnytUbLEY0
 tCh0LHo2nu5BZL8LeCtCwXo00kOQ5pMdYs9gGJ55ybs4tzUu22/zeTK
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_103707_476686_82858078 
X-CRM114-Status: GOOD (  10.61  )
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
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
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
