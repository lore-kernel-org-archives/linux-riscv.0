Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E99D2A520
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 20:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1c2ON3XH/Y46QA+Is3OxOByJElXEb/mLSDXImiCq9g=; b=a8oApzHCyhCnmM
	y5QgTMdStMUp8aIGt/WOATi9be0GgcWFJTpwZxS01rnXxzMOoAZNgAezDiVOdos7UPw32ICbCnxr3
	W2gw2SXPKcUSB0hTQj7d/ffCc/4gBCPyHmbCOO6spOs4oac76fE6b3xfEJmGi79toj8/YKWufsIi6
	XelaaTAJpx49qr3PC4HdUU+Ny3A0s3JxxPpaXQ6IdUPiiab89DQZ+icf4rOSwroYNXdHzxH6QOEXO
	vFfe57WnoJGjdRq87Uv28AQgqmBJoAyJz6RwOPacy8ox4/tm6eXeuyTWZ3oaAG8Bhee5VvdOtEWie
	vfjN4Ej8Gme9TsUddtrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFYn-00000008YKr-2PEL;
	Thu, 04 Dec 2025 20:04:17 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFYl-00000008YHW-3FUr
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 20:04:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-29568d93e87so14085495ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 12:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878655; x=1765483455; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qazkzNjoTGNZQrm2wNpnFtC3xWbAXmOxYceHXxLC8bk=;
        b=OPaNxr0S4sqo7bYbhf3ps/ANf8gXhdqY8SHy6PuZT+s0j1mwlV40k/7UCr7/mypZH+
         fWfjlSFo6aPx5XfqIpQU+OIkAELWzn3TLrFExtc70UfHx8muNbYhHE2cig0kXeTr1Mni
         +3byeQRN+RMGPGCBXCVz2brZeX/PY6YPvaQvag0U56JMmBPJwyDhG5vfbGeM6x8UgNVW
         u/N2Sz2BOsEkcShihiWIRFBgDu2cHxkqHEk4hKHTyb9hlfPS5pBhlEf83453c2M3OAFa
         9bR2rfNRHUXhwxQMgagv1H08gLVnicJvOc3l76IzHI/ep4hx+7UEbmUCXAgrNM/Px2t4
         le9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878655; x=1765483455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qazkzNjoTGNZQrm2wNpnFtC3xWbAXmOxYceHXxLC8bk=;
        b=WSEhzX+QKtAaCW7EYlX9Tbc8D4Jg5aNuLzJU4NIIzJ0FNCIl9jlLzMZ7fZ0/nSLQI6
         S0KwoFc636Zu/e92DoKz38be4aI4sxWXrSsmAY+4+Lh5Rs24JkQlnJIlqSv+tkMHGd/n
         2LvsH4JJek5FK1zko4odcERLNNxFAJ/MS62e/ZKg3A/lYikn3/X6q02B3Vf5VlT0hGMM
         C4/BBSAllwvKk208qVH9ATdHjozPxXTeeYuejmMOzupORtE6U0zrlxMIrcaN9MPbmqfG
         8F8Kmge1NY64mCMKcFdnrOuIlY0+kOZxlGzclzMVkSnkiFdUZ3o+zITQ0FgLqe/KQchW
         C5pw==
X-Forwarded-Encrypted: i=1; AJvYcCX6NthWSGDbJAcIJ0ts04LKLEFobEx43whsw5bekwKS3cCXyWEqrVfSjVfpFyt8WUD2yYgjySp0SwTC8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmbxP1p7CMoHCrmJfquFmhdgqS3Bi4mI9u459KZu+Yypv1U4Hn
	9122bNKVNUpJvxrh8Ow5LjYBCcei3WTARVW4bYSbCyt5n4wPI+FdYqXltXgbYhjOR7g=
X-Gm-Gg: ASbGnctBk9mGnUy9OH4jgM33z6sjF4VHb5+F5ATpsLiHHHte/cTqHD2ytuuzUsySOWX
	C2LBTBtpJaDx+xn0G29pcARY5azgKOSWWUvqQv9k5hRqTre7W5oSZM4VKyZ9QWLeEPyWh8j/nrL
	RYHNFyvIkxz3qKENY/MhTc1t4kjdZeRTYeR8u8C0umPPsPatSeCRh7hhgTNzV5TKmJU5V8AnGdW
	ISy4VXV0vQAhoGSoDaszFf2GcCkx8Yho/SrPMquVXBOLfhd68zGSKJ+Kh1BDWiGtj+IK9yCR7RP
	st4xf9NKVDI1zcGaaaSAVQZM6q4voQKrl/g/CgAr7lsNaZvY28WyKSDu0kRWOAorygNkhXokI26
	D9GxVPGwUdi2hxB9FMezNmqEmBfOW+FKRb9ca85o4auohmZP5ilZM5qI84gaWKk/922JdKtQyOd
	mBwOgpmt1YAaKFho1QRckK
X-Google-Smtp-Source: AGHT+IFp98bHY82tmn1SWytYtV7IsOH4MNT5CrcOIzKcMZAK7rnYCRSLOXMz8X4skJhf2qDKjmrSCw==
X-Received: by 2002:a05:7022:249e:b0:119:e55a:9be6 with SMTP id a92af1059eb24-11df643c373mr2741142c88.2.1764878654709;
        Thu, 04 Dec 2025 12:04:14 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:14 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:03:57 -0800
Subject: [PATCH v24 08/28] riscv/mm: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20251204-v5_user_cfi_series-v24-8-ada7a3ba14dc@rivosinc.com>
References: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
In-Reply-To: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878635; l=2371;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=c+59GLf/oXo60d4AM3tT5Dly1CdoHCtus6ztRRar0mY=;
 b=DBHza92aj+k0BS2czHCo1xp8g9Cp+zSzm46DfBTV4xMmhPpMOTYeBlej3lCSUVel0u+uvkiuX
 hMVROXA+6ouD+BJWbNswx6PxOLIYpQkgCDWYd1oT2RkSzTAuLozzwnl
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_120415_821530_9E315015 
X-CRM114-Status: GOOD (  11.06  )
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
