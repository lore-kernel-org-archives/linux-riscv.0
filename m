Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613D5CCD1BE
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 23:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QvtxightdoH4nlDF8ffGe5AWAG2kfD0XCcF2iJcA6Q=; b=Ce24W++VnDwVPI
	fcSAX8m3cX3cbG7hJLSXRRAmOEI5PakACUXCMqMn6Wpi7SoWUVBw8uNIMNxk0DK0l7ReZxAaaigXL
	NY9fXe3/HjDbqE6GGcS2IJZ1uzmr5QBC/KXDS2+0QWvjdNUd1jbwfIzy5N1FGfKkhX68n8ZTCnHW9
	TK6dX+zqx2Pmr53j3DIQ8PCTUJpNpM9F1V1ktcdA0ai8PNm5V8Rdjo4aJWM8TUv3x3N9x3o1rb5Ig
	kHHXDRCw7S504/gQ/JAZq0X9jpWOzdrFUKCe1ERHnmRfySl3SSWbSD0oEMQy3Vae3spXXPPRsHqN1
	HRahN9z+UCBQSlBM7KuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBiHH-00000004YPL-24Xa;
	Wed, 22 Oct 2025 23:29:59 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBiHD-00000004YJy-3nqI
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 23:29:58 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7833765433cso272540b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Oct 2025 16:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761175795; x=1761780595; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aU5JHaPOPUGgukhD3bad891ElerIE5ocm+VeTPJz1C8=;
        b=T5a9+6n89t3zA4mpefWL8v4GrDQnVZhkc9jyQiH2TsPliTys6OfKBnfgAiKXrXId+k
         wJHOMBXNpifGgoHNaZEIcQ7dVwuq98lFsJx8v5U9meebDB0v6f2AMlEYLKcIYjDyhhDx
         VE0zncyrInNOx1piQvRvKnLiXgASDasO7V4SdNHUzHSdEjH5z+d+Mntzg1eKhl7eTeEI
         kA96bSiZzHnPLkdgq94BvatmWZ5ErCHX1stZc+wqTiDztENb2+bYIUoVXzTK4fyzd/aY
         lWVtFPnMb/snSbKwrwlPyMvFLdrbeoIfPP3gazAABR0I8v0DRqZmpu1es3H2/kMibV81
         1v5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175795; x=1761780595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aU5JHaPOPUGgukhD3bad891ElerIE5ocm+VeTPJz1C8=;
        b=CaTp7WMFXd+o5H9REtESxHy09rk5ZUqGg96Wkd5DnL0z8DVDWxq4Myhz6bJrIxyoL8
         QjDCKSsFfv64mDIpS4oxSZHdIOA9sIw+N/ZBHLw/bPnvcINFfKAHqAidpK7KsuyoN9ZP
         HajFn3rhwyHxricLttgo9UJB2LmIjMGXpwXQJ0fB3ECL5V3khbB5bJ2/cHAhlQZhh7Br
         LFgDqumEZEjOIdAcFvv0ufg46XsD4tNmK902yks3zCeU6W+Bs879DWR2SCHFPPYPa/2s
         bAhGIn4h7zUkclTOmrG8bi2PSd5HIh7iMpUiP8WZhjNtIL5/vZjThWx1bL2yTW5JG+fL
         Or5g==
X-Forwarded-Encrypted: i=1; AJvYcCUuJWfmtko3Rzxhl5fFzykmcW+oOXe0sjLFfMkz/hlhmEf8dEI0VOlZZHt/ylRjq92ZjkgCT8qNxeAlPw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/EBrVIcWnnESOqCK83jVoOvGmzyfIY14pwmi2YX8G2nRbHs8c
	75QXpogUgzeeHlLkQdke+MSHKvP/N60Fc9VZ3YNwjQiolbRTr56HEKGUqcmraUN1gp0=
X-Gm-Gg: ASbGncvYlmchVQQOQ/r2h9IA/x/b5SVKclGQ01nwI13i2oueTbIqJaB2McBZpg4FYct
	r+gv5hTWxMmxmOKnRUoVPQGx8Ucb9GLVb2Y7c2+k1BqIwbzfK60AHbPmcyX60IwLdHMn43USYeL
	2bektNam9w3kddHGBAGmqQxc66cQwlty/pCFY3flwIhFgSloPYpijwxRc9/6yEut+vYTHHEyN+8
	JvbJqcF+gV8Xps8yMVBO3J+DuuqOB4UaC+HFXqNAuoCp+TJrXSiyZbTEUFc9yG9aEQPoI04rUAL
	EvZmuflw1BJAtAFksyByN9etlh9NO4s/bSDUZSCprQGxLkHuwbnMKOfqj0T+sCnwXrMDEsFtCVE
	XJzW+4sH47tpNgJEDP6S9oifB3iO+WZd33n9OhweYmhaTZqTBzSIX46Fxt5V+HJXRGdcn8ectbL
	U1WFy1BMccVA==
X-Google-Smtp-Source: AGHT+IFYp0ny70CA4NAOgoFbnGMlXPyOpppEdL0vT/v/zgXSwVQA4g/6+fINYUYu1VCsjkOYj2gtog==
X-Received: by 2002:a05:6a21:8881:b0:33a:86cd:1553 with SMTP id adf61e73a8af0-33a86dc7f16mr6439638637.12.1761175795311;
        Wed, 22 Oct 2025 16:29:55 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274dc12b2sm392646b3a.67.2025.10.22.16.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:29:54 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 22 Oct 2025 16:29:34 -0700
Subject: [PATCH v22 08/28] riscv/mm: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20251022-v5_user_cfi_series-v22-8-fdaa7e4022aa@rivosinc.com>
References: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
In-Reply-To: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251022_162955_976914_9A57D46A 
X-CRM114-Status: GOOD (  11.39  )
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
