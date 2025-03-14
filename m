Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2DAC35FF6
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 21:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qF8Ez9J+N2t5x9xaUU8QM/in0L541Dn4ajy99vIxdkM=; b=W03QSH4SKnvKxc
	HuAwhgaDvHvXIpe8Z2rLAY+LQvNDAo8xizHajgJkWZlCp7SP4Q9+m09e0WaCS1t2ep9v7fGfbo6pz
	b/KMbdZOW8g0+49aW2OyGWCtxKE3+hKbHiiJoMVhZ/4jrJq9acCIDw1mN9xfSRWfVlUH/BgDT3wK+
	wJCc5buap0KfdLjeNni/xuMCJdsvrnZWA+yHLCiGfek4EkVGl7mNUc2mj36LitK6tMNAvp/1qcEbV
	WUoYIPJjBNjA78wsrRWm/ztgqVL341fmUBHuJKj+7otSZtPtC/8aDxLSF/CoQKKpZgtruz+KIsq14
	M5FecFmE0Y6D01W5208Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCkx-0000000FKZp-2l2A;
	Fri, 14 Mar 2025 21:39:51 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCku-0000000FKUh-2ZOa
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:39:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22423adf751so41790895ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988388; x=1742593188; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAIAgpv3AXe4grYgMLwnUee/eXYDz+xNUbGxtfEmLwk=;
        b=I0K3VStabjr8M5CTYm8bXx73Rs74fUoLx4npt9i0XXNu9C4sFjr15f+0Hdw0DiUeer
         XkhfWb8f2yZxJ00Kj66I7mkVp4zjhYFcJDjbKoB06W30nYl69cwn7u2loIsrGPuynCZS
         WcTDdLAG0DNKk8KZSEuMbmWLYI2jA4RVGSpx/yWSexediBhSU2Sv/shqmd0Q4Wo75KjS
         kx6160PIstAhSb12JWDIU+zNjkBjaTcDe0GCWT7pz3DquuvZRlt3gPo8A+MQaUvHVl6Z
         w+L+2T3oIVhI0Edl8TpxOhz0+CdPu/rsp2XWTueq18rQiVoUfYWzilgmQ+pPChJIOtLo
         RZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988388; x=1742593188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAIAgpv3AXe4grYgMLwnUee/eXYDz+xNUbGxtfEmLwk=;
        b=d83xe/ju5oDczYd2+I9Jr8sDp/Bxozf5s2uVD3roW2y/K8TNJ7qbDi2I/pjXr6qSbc
         JFcmMczaqub2nmfg8NGQhV5tDba+2g/vS+uf3RiHsK5gU3E8vsX+6GQgsEKGgDDj1ZPk
         Q47hL23C8jxRer1q/3qybInW4QRTkSQ+oiBdMauLe2qFNjB+ZwX5KCXP6qWQ5/J4fqYG
         TWuW78bNBIzBuT5XISDH+JZqC5jTb+iHht41mXcYMuBGXVFWX2huv4VjFZbYS5hmpIjO
         XDelvUVMIqgmVcY4Zy9bLb3nqmGEvyhDT2sPpn+Si7r/O5v6VAMHrgzWNdzxKbPcLwII
         Dcyw==
X-Forwarded-Encrypted: i=1; AJvYcCV8aHWyqbZJgtpfxFMvW4sGM/FrEiNRICyula2Bn4q2GJebovioYVERtTQ9ayfr0HDCyrVpMXzEWzW4fw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsgx4EMkXQNUq8wk1UzdXwqI5dHhIY0bITh2+1iydHX/4qp1km
	qh8gsqo9hVf8fcg93YY5yXduLwPwLfYofrabk/vJy2UJhhDzSADSLoL0mk6dugE=
X-Gm-Gg: ASbGncvoO7rCwRDK4A8QOE9PXyRDOnqJQr/snrnk7yYnc/Ej+t9adOuc+vxVd8xQepq
	DKCpKKm2kE0fCJf54GQL4b9i8fKCtVTY7WkmS5mBzUIe1sng3v9WyPIp9405LRpITSjY2yK1rs2
	fozpN/mrAD2vqIAcGoBuIP0lMsWbFVpKySfTsVItJwN5agfQE9bXRc/FhTRctNhAvM81GrB1T+C
	WUl7yeB1pjyokDAYtEO3mbyhcbVqgRM4HXFu7eO+4+mTxhG7zrz5sf9gk9ioejgSyjZ9MnoONqv
	YdPVKBB/Hkl6/26vKN8/UXZN4zUhMiExwZG+ZtPOYZh/+8ioapaoTpo=
X-Google-Smtp-Source: AGHT+IHx7WQpWru2fKimtMpSmVFwsTrooQDFYBOULcY3q47kcw+TEVwpgQle1i3yqVDeVf/+DpJMig==
X-Received: by 2002:a17:902:d2ca:b0:224:fa0:36d2 with SMTP id d9443c01a7336-225e0a82dcamr59199255ad.26.1741988388068;
        Fri, 14 Mar 2025 14:39:48 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:39:47 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:27 -0700
Subject: [PATCH v12 08/28] riscv mmu: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-8-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_143948_665205_1C295F10 
X-CRM114-Status: GOOD (  10.87  )
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
index ede43185ffdf..ccd2fa34afb8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -416,6 +416,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -749,6 +753,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
