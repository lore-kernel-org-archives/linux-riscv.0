Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699A9C021A1
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ar4SyAPKPfkSHaklPGCLUcvtZ4U6CoVqdHZBbcC+pn0=; b=ADp8fF3bQV3q1C
	50Wt9B+Cn9iXo/Ty8OrPsyletRHds5b7C2jStUECAG0WM36+tiOw9lz9Kjvwz7GAmtiBWwJ3jF6iI
	4J7nSNTGjN22r6uJcw4r+dIeMyEgLtygFaO/EEj8jbxwC9rO6T7M+QIvnj/luYbDbvJ62NfuImMUS
	RfRi/BfsJbKAJl/ZisCDcD+IRU8b0WLzaIbk4dW2ZK1vPg/WGc9BEiyMheXTkb7d1bR/ppEDWg/3M
	MDDt0AkNmcOXYTo99/uc8GQNwY02cYhFuPdaQwon7bqkuWnrhV+4Pkin5hraItzRP6/9O0+FMxVdn
	tyAgaGShRggV+BkssXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaMz-00000001JwG-1I37;
	Mon, 10 Feb 2025 20:27:05 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaMw-00000001JrF-3gwy
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:27:04 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21f44e7eae4so77810725ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219222; x=1739824022; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPde6NcIQ47rHbegQG8dPMP+orPth983zEAPX8ktkAY=;
        b=XjtboUVWadLR9OgpO4ZDBEduzhqc2i2vU6+m7F0O9jtZQgugInHxqBXm2Zv9F5Q5tE
         b5z9hHdD3Yh6spFG6d9TiGm6HmAa9pnhqmRDJWhdUAANzHzcCgzIk+cFe+89MbZ4mYqg
         w+CjUbLuChfk7SXarC57Oxws2ZtUicKbXZjGjQmOyKwcD3JAUud58Yuzac3veDOsjYcA
         gpxOKJVGW4x5YZmgvKfYDcM18mcB1UFA8Jrn4yKcZWEow8tUTZrzKPMCmfYUSHp33zQ+
         ogLiJ8SzkHbeGn0CZmnUGJizLDx/ng4bddczRxa66QbHFqrrDMu1N1PMhn2KYg3SJbN5
         OW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219222; x=1739824022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPde6NcIQ47rHbegQG8dPMP+orPth983zEAPX8ktkAY=;
        b=pPwJ6ditE/donTIFnfix9TUPGfZgF+n0dguYiCKqzZYTmlISQaf34yaFBEQohxatbq
         tkDQdMEEkGi0w5LJGLrRhLqInT+YmVfR4ztqJgx4u9nrZjJ9HTG33D07NrYqBRNG/LLh
         YUu1ZBKVqw+ssX6HBQXR8TvbbeYuGBqO8jJHK14irbl8XhQHFIjNXUkXGVcgn17k7U7U
         ZnpxZtf0EAbJvz4usVtuPQMFHGg9Thsm+uYTc979DMpZx3HQ7/qZ36LcL2/ZF8kO8aob
         SD2W2HI/7biqWa43QwivZFoY0r+t89RyOXdHxzW/YligRXlXbUyPwAHd4A4mgc5o/egv
         wqvg==
X-Forwarded-Encrypted: i=1; AJvYcCVHIgs/aiy5QOqZk8KOb+kFdDFDTmrcyDqTMTTId8qPUZLsWxsc7XUzYFS3mt5pN6Zy5pF/Jvm3KfByPg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq1u01mgFBf86OhKxEwYyNcqX+w8Y7iyOs2QVw1Qur2H+y/ZGP
	EfQcTbSrKhMjs680IXkRNCB4aMqutqjNBKEb9A0VVAwH7/vWSzV35dsByYPerKg=
X-Gm-Gg: ASbGncsMNWuvNhXyD7ngrNreH+ddfHWVTtt4lhgIFpQd2yOTBnI1USsKEqJ4Jfo3Ite
	9MyR2C3R47ZhcNyXwD5J9c7ehj1j+FeWWx7M6Rvu2aKANO8UE4Kp+CpIiR+6eRQckBjM9irLfmv
	PF9ylkHM2zGYiqJBHWCEAzg/hNBYaac/u1WcO7qgnZwH+UrGfVU4iKu9/YM48MJ6b2O6/GKE2uo
	JwIckUPAfK0sU6sFQVgoRM2BroWvAvG5CSYQHClF2kzv2Wu/zb6RhGNAcLTA1Q+l9BGm2McbdCj
	yINFRHmIaxGC63zwz84Y5dvh5w==
X-Google-Smtp-Source: AGHT+IGkck8QMdE2zF0rHgCttuOewb5gUafKkLZkDOmgM8iUcqpClnt2HEbL9+VvYLlypifzjE6CDA==
X-Received: by 2002:a17:902:f687:b0:21f:4479:a34d with SMTP id d9443c01a7336-21f4e6bf3f3mr236952035ad.12.1739219221922;
        Mon, 10 Feb 2025 12:27:01 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:01 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:41 -0800
Subject: [PATCH v10 08/27] riscv mmu: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-8-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
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
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_122702_943053_61145508 
X-CRM114-Status: GOOD (  11.22  )
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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
