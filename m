Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A945C28B2E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ar4SyAPKPfkSHaklPGCLUcvtZ4U6CoVqdHZBbcC+pn0=; b=EBvBiWtVmGWSnP
	unYFgqWR+erpUQB7KisU0P8ZlDhNRckKtpNXu3gjNTdY8PoQHkefVis4i/hOYVej4tKuU4srg+vyl
	m09hehsbs2QMX0fTDTIUPpW168ekR8ETFobyEzAPVB0KlPgVxY5x97xsBUJ5PlN+LW496F1vepqo3
	dRL14YfdqEoVMBTVrlMkORvernIzeWBJ3+Q9yDDhUzL5fjfzTHODVBrDnHQYjugHFvram/oLPqyz7
	zl3niBBDC2bqN0ptxsDn0whSiHV0wmThRHHNm0UQeLbSY3ZU9VIwN0b51gupCcyjMMOiA8nXXe39R
	FrbORJnSZ66PQEmx3Z3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfGw-00000003DK4-2YW9;
	Mon, 10 Mar 2025 15:42:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treV0-000000031cK-2xh7
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Mar 2025 14:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WPde6NcIQ47rHbegQG8dPMP+orPth983zEAPX8ktkAY=; b=Ku1wrFl09+vCQvUzwTAs5dGRjG
	Siizgr0QeoEXBxmu9wuFAY7G8bRbWTvLQr29OlhtvxHtJqupm5E/8OSFJyd1tBxKFI6vY787W/+Ex
	KYemjPwO/UVpsIgUvy9zorAfO6EcDEullibXlucLt50Tv/5H5Kfc9q8QbZUAnTkR/ZcL08BIw3SoI
	/aLIpttIVjhAOj+8dz6IIQnesO+T9qYXSikRQCPvewxQ8kWDAY3pbKHzZDKHE1L8MsSXIqSto6TQS
	wPobOyiCzyMhidVbkMiDCMg652W+y15yt4oGIcww0f3V3pOKQCG2NY/fsVdm4dv02aNEsAJEwX/nC
	f0Teiicg==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treUw-00000001sJd-2IOJ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 14:52:57 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22398e09e39so78269235ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 07:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618372; x=1742223172; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPde6NcIQ47rHbegQG8dPMP+orPth983zEAPX8ktkAY=;
        b=YtYxhyGWlo+plHbsN3iKzhkpMLV0bE0Xeej+rlhoKoeCBDgHSXU9w7caJ8/7mxd9Pc
         frXDqOCUWt0I34YUU4rCazyi+b9lMeMJ56N6gK1jhHQtsHUwLxrF7GWzzyLIxiOpMljx
         KmM336VFlX5I1F1/9ZfcgO47v5V6OVmNRzeZ8OFIARdbGdJ32RHCj/rt9UfKwqUgWI8h
         EQYjEVWSk22YxcaHKWshGUe2rfEOgpCJ3R1gAo/SBrLJpLNv8W6UhRGQI7pQcjfX0MdM
         LTssE/leMufewOJO2LgtXWX+giuRdSoSWjxzC+VI+PkisTd705S1exOt//drnX1Si1ev
         /SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618372; x=1742223172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPde6NcIQ47rHbegQG8dPMP+orPth983zEAPX8ktkAY=;
        b=QkJqfnWamIsQmQk/poVq14wnJZ77OPDHQPTFVfYBJ4NM5Ise/1okiAhzJgkPjgiqF3
         5Xt9J07Rkl9u7HgknLJ4tHyCOJo76ZLr15CLcjpcvd6QLWOPplx5u0tGhYWnboMG5ImZ
         Ol47y+iiAKaA7n/XaI0qQHG5Ws+oNkRfLpONvCu8mLKNwdQDYL+8Q6kexGPTo5m+70MK
         AhP4jJSmlActg7Owdz0kLxvkuHDHnBSDtfB6+f2HjVXlUjgL511W5BnntwzAclQWBgQA
         nd7ZQ8ggu6jcXVSoH3dqV+XMsgyzm2SzvrYMZnlp4VdVdFTkp8cHRexltW+x+gdyy0/P
         og4g==
X-Forwarded-Encrypted: i=1; AJvYcCX2k0GUs20aVsdNqTzJM1USZ+kAoVVkvkFILRH9lS2Rqdtb68sJ7/4cLM4zmKYqI9xEqaWaJ71+iGPJuw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3ph2apT4eJ2WRVuFPuHtiupHsGM+iNz2z9NU7fYNJ1cpZ3ve4
	YMABfYaGoqzLwM6HUXU7ldhSG4siZx1GSAUzJhJ0lx0J8q8ImhtCBWsEuVTpkY4=
X-Gm-Gg: ASbGnctLfVv5J98dy/ZVo8Gm6TBOCjopl1VxGl7SuXWuW9UDrVOcb2N3NhgksG+OVYo
	8petXI++PCTdEwhWzJu7xdQkmJfQIF+BJm06Qvx+MYiNCKr19CSUF1Y/tQt98hoGUUuDCZndlX9
	9dnlF/iGi7y9O7X83ouC6jjm82Bx0bq9Agi2OGjdnaZHyv58USTS0BxV4z8Tr1c3iaVkpudOiO6
	akLAD+TWUQv6WY1bX2dBHAdoL6uLcdbfQJHlBdwRJ0G2azKirIAJPj9Yg7uY3e1kqAfBINvzIYk
	S3aFTDSmQv2DWAUkHxrhhnJOLMxX6oOd33qJG2e+17XbLJDngbkCCsA=
X-Google-Smtp-Source: AGHT+IFqTxU+p9IhkI8RGdvHdyJEHoK+vlH5JWBOUOv0UhGLOT20CpZOV0dtGMVo/7iEBeBe/MTApw==
X-Received: by 2002:a05:6a00:928b:b0:736:4d44:8b77 with SMTP id d2e1a72fcca58-736aaa1cf9fmr27006391b3a.8.1741618372105;
        Mon, 10 Mar 2025 07:52:52 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:52:51 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:30 -0700
Subject: [PATCH v11 08/27] riscv mmu: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20250310-v5_user_cfi_series-v11-8-86b36cbfb910@rivosinc.com>
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250310_145254_606822_285E0ECD 
X-CRM114-Status: GOOD (  11.28  )
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
