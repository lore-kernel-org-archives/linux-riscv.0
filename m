Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767B3CCD19F
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QvtxightdoH4nlDF8ffGe5AWAG2kfD0XCcF2iJcA6Q=; b=DlBhhtAPODM2r/
	Yu1XiYw9LFVSvx/oWVn1cFlpdC7AVgEYIm+9r+bckC/3RHp89Qe0F13xTWwQmNWTLLUusO2VGMpCW
	NMpPJSbO7BMPFrn0/a2m2gM8Ks3TlxXexih6H685hi5BSDDVMxnX1iNatJqpZRi8u8keOnbkO1hVg
	4KLC4cO/lhvx6FynMqlhs+2v2EMbdoOrM05XCEMxQ117M+e3vQpANI04qPmSEDWy0mDYTlqCG9SJi
	wYwyhsz74o4wV8dpMMb84cCVn1oy/UyDrUlZ787LVpVQNXfuJh1QqhhIapVPEdgz64xZJsygbCslL
	cscxsN/1ULImkYKn/SQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960s-00000002XGb-3vV5;
	Wed, 15 Oct 2025 18:14:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960r-00000002XE4-3cLI
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Oct 2025 18:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aU5JHaPOPUGgukhD3bad891ElerIE5ocm+VeTPJz1C8=; b=iQJq7bR7kgebFgFgyKME2Ma0UN
	XuRgUetS7mar0oh5a3Hezeeq5Ogy1cd6vaxwJFbhK9E/4GdztVtzXKkDFQOlA6ipXeoq6s5KXqJeK
	ogqmrt52s8C/mFX3gJAR5PcAPL1KEDrZOU99FThODqUApnXj5m4wY0JSlZAbFyIiD/2zb+vtStgvT
	CaP8vm+HbQdj52Ns07yMBaB9GCZikGcdhKLnnc+87/FmQ5AEGcybvnYabCAh8jK6HRswZ/NamNYW6
	dPespJ3ThVWCnDNTAAmpfGfcsW3F1pv8vVjStxeoYKl1vGJGhhjuGLTSj0aj9repFqoKJCDDawxFK
	jo3iu/Xw==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960j-0000000668h-3n0G
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:14:10 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-28832ad6f64so77369005ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552041; x=1761156841; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aU5JHaPOPUGgukhD3bad891ElerIE5ocm+VeTPJz1C8=;
        b=gDNFFhUmH2Z5aly2TPjyUzG+4nssqhKtOFFhlQqIDU3FWeAcqsuQons3fyJXIoBZqd
         j5mSeN18Fh8WzOJrj2e3u7H5u9b6F6gF5uiic7gOjvjqGCkXUQGn8eQdr2ncKo4mgCkQ
         Sj/VqhNETXjEqdXpOztGh1FhsxH2TnMKwzdocYo4zGaDhFEtgU/rFKuFMWJTUgNJxogP
         ChXTUljydiaB9oBeYmFC3+9L1G68fUTXyTjZ0H7kNaiBvGBB0MmfvTy7Y1trVnEsdqbB
         ul0XU0yQYYNeiMd1o3Ewoa/+PoSjpo8Pf188rmoIv59TUvLjDMTGskEgd6EkDTcD8w3L
         2m5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552041; x=1761156841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aU5JHaPOPUGgukhD3bad891ElerIE5ocm+VeTPJz1C8=;
        b=HdmGC1itX1KCMdi18MQddfOGh7dJMTt3fsezW55w+L5wEwCaJGPZqQNdtdiOw+yESU
         IlWNRQN7ijnM0OJvUsLHpuch4Kn0hL2SWX5cfU6hcL5ibAaIxopbshOnmtxNEx3zI6/l
         AM5tauJQJPTCcniivA5sduBxWaZJIeWFQKRhiII7JaBmupadafRc0L1CcTwr/cl/YHSF
         D/vfUgYjWNQW54CqpN1mOQz0muDnb/CgDMbxL5kNTs1CAnbSIBA6Vqk/9wEXXkG2vSdb
         u5958XwuNpXERmqOo5+wk0d547GxM3SUkx2Ugmajb2t7YEXbcC9sBKkVSVzpymg7OyxX
         h6Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8Q5rU37mVfOuJ5vB+V+t0clbihlyWeJG0CT2QLBlLwZINQ3D8X2xDgdA5unK5Faw/30oDmHo9nny7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhOpWmxr+XXbSJLlOIlEZ76/Ku+C+dRs0rjMG68PrM5C26f0K3
	pAdBf/CKPG2gldH0R6Ld/EiqOYEhVRH33U1mFG9gJh5gATATQETU6jI96QrXK6bVR0U=
X-Gm-Gg: ASbGncsKwrmWC7ykTkkvTACylsrJ1dK4+7Vz6mYT/xRPfNxm/ZudbanSgztxKGY0wS6
	crZD61dfpvDP+Ekf16exH0xcGx6AWv0hALXo0yKbyJvmRmdvgcy2IJf/PXsXoQ2gR+dFdI248CQ
	gpSuD2Eu4N2YqcYaIRe7YfJmqMTgxNB4IxK+ftYDrT9UFxZerAQDPSESukj0qzT8lSqBeBkY2Sr
	1H8frIBdOgeCvDji0zV3wcmcmyAc2a2v9OazzXH0ZXOCGyFeT9ogYWinZy+7QyPJM6FEPmHMOvO
	/vd4gonU3wumtGxH/Uy+pcQqiLffIxHpFVn9iwlBXbo9XNAA7bFpw3covfvHkRs88hJFZvOQDTV
	jMRSQjH631tQ1cemrK7GLM5TXIX0yKU1GrVLHOeWY/FsoSk5OeU55NyEgm3gg6w==
X-Google-Smtp-Source: AGHT+IFrOG3ULzvwQS6yNdWhBAVzXbLv96KEjuoxMPCKu397hcHmuMnjPrfbwr8q4JTAGI3XJs0nvA==
X-Received: by 2002:a17:902:e784:b0:269:ae5a:e32b with SMTP id d9443c01a7336-2902723eef0mr366261105ad.13.1760552041166;
        Wed, 15 Oct 2025 11:14:01 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:14:00 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:40 -0700
Subject: [PATCH v21 08/28] riscv/mm: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20251015-v5_user_cfi_series-v21-8-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251015_191407_695114_7DC6FEB4 
X-CRM114-Status: GOOD (  11.09  )
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
