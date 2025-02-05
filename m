Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3F8C0219A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 02:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ar4SyAPKPfkSHaklPGCLUcvtZ4U6CoVqdHZBbcC+pn0=; b=qU427wq4wNoD0I
	rez5vi13FsYAme3sXULdo1d3qxe/RMri86onymMbJk6r57KJTh7QUtXaW5tdkZ/bYq35xi4243MQE
	S54FiUa/5t4JqVB+tLgsKCWWDh3Bx4W/D6ZMn9VweWI/1T+Usf12edGzAjH7nN1GjJLqSy6jcLJ5d
	kF7vXnGy40MIEqFhdcomynN9PrkaTW2ddOX1td9SmVkv0zUMor2PkYq2Q5VuApKma9+psyZEasgAu
	uF55BjyOCsQiQ1TK8or8dK26TXqrgPFmPJdund1rkmYbRwIkRze01S49Gsv2NmEbtYpaq+Rmk0qda
	fy+35mscQwonPDvktbvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVBy-000000028Uz-4AF3;
	Wed, 05 Feb 2025 02:31:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7W-000000021Xd-3cis
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 01:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WPde6NcIQ47rHbegQG8dPMP+orPth983zEAPX8ktkAY=; b=BrK3/vLAvh2oYdm/M2xsRcjDMd
	YlHHNUGhjy34+q2bEElDrAv9kCUlRLic7wqjglrIhRp0QmlCuylXOKfxEENdNE9y5J681iYx0jx8L
	Azouzp6ZWxehdAjhs7/87Zpk/0SrtmRsmD+meUJ9nxujeo7fzgAtkv9HbYqkpdbt61N2Z5VMzvgsG
	Sxg4IgdwIQR/N+s3yb/GBqJOlOKkCELv4PFgYn1s39F5UVlcvwI1xgTomhKA/GY5tROwggb319ZRu
	ScDJOB0V5FB4RDk5p+QDzVsrmg/JkiN8YY6jmpHw0D9qqkS3+ijk8vyQQMymlvhdRjDW5fXULsKoX
	ELs9wwww==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7J-0000000GTq0-2qmD
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:18 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so10942288a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718529; x=1739323329; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPde6NcIQ47rHbegQG8dPMP+orPth983zEAPX8ktkAY=;
        b=jGfPOGF9HaX59j03tItNsQyWq3ZmlqJVCrnUKO7irJMcy5xj67h4Ghl1jONeHW3jJL
         4dR4FuDXntJmMMBDammBPxgNnbc8jmNBNrd1mLQPEaGtfpJ8e9zNr/r7IK1ySm1luNRY
         89IIl2MjYFo9iuJaJgjpxCmC8pTvOxkkbPEvmuNbVucRiReYtlayL2G5ujBd7VjE8B+n
         ZdHzSNQDDUHroJH1zFqoVTKBb94vYI/W3LYrGDKHw6ACF/hNpFUy5jJRD8a8QnHKBDRN
         TadiOT1eTij4RcLcRkaB9X7oZvx7iYahKSGzV15e1Ebx8eL1gXAhN71vL+9PBsBAnICv
         6ntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718529; x=1739323329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPde6NcIQ47rHbegQG8dPMP+orPth983zEAPX8ktkAY=;
        b=rV78kl/8pFDy8u0XWpIDU4aaNnaZaoLBzoBoRQKOGm57hQyDLU6PZ0vQv/LZEq7I+A
         hrPYNh3ywtSw0uUWnfTCGSx5YPYxWHzHAaB5GV6ZQ9Gqwn4INjkBNclDD+vEqfVat27r
         wVYIZbSTyihTBuPToIFvdPNg2daz4erIyAebQcrfUEEc6FEbwtAis1ZCrbsCIeLpRf8n
         eaNjPSfXbA/Kq29WxJZ3ksrjFdXtsCrhatSfm34ZjImHjOx0H03jtIYDD3L8e8kXA6xS
         G3CufnwxR05jFRddajKUWT+qWjHrATfYoKARI+JVPqKmifiVl5z+0gcxq1BadnbYaM+B
         XjqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUilvCrK6ZI2Cq0ozcpL0a4vJMsaUMWXN8giUGrDoAFB+LNMtt92mI7izgIbY7dkCaHe9KrGJNH0wFxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx5IKYalK5KZ/Xrl0z2HG6xBMpDaaJ5aq7zfzyw1JcfKKw0dct
	X/Bps3gHhzyEcKkCcQmRCBViQqkhk/ZfW31eAoGZtuh/n1SI8qFuQPH9fZguKHMJFxH+4w/KhIw
	w
X-Gm-Gg: ASbGnctUowzF/Jz4FPVxwfyD3490RTet1Gw9FhNNe/3sLjc6ebQZ/vw8AIM24n+dQWi
	XEknCkKst3hmsyIsZyKPh9BgLlsLxPdXI7ucyFO2/GIJbCdoRGcf0HrvbO4Kd+nhkvZsWPo5YOY
	W1xd2OLiR7vGUxFqZGrGRIoLe0SXIupReHIxljX8GmT3+b2n90377rzck+KO4JEp8/xjPQHljnM
	5hCwLNISV1MzAbyHKEyNE48KclC20CbBEyhcmZwNK7IGZMQt6UYNgznyvOVawu5tD+L9BRgw92g
	ZrKr2PGoJBT/dpp3Yyq0A97tGw==
X-Google-Smtp-Source: AGHT+IEPr/jAZdU1BeAv0MTLO4+mRSsOemI+fwwJ0UmsHYAhZKBwL5jRXw2/FSsvJQ9vrjQzGW+zkw==
X-Received: by 2002:a05:6a00:35cb:b0:72d:8fa2:9999 with SMTP id d2e1a72fcca58-73035140b35mr1685541b3a.11.1738718529305;
        Tue, 04 Feb 2025 17:22:09 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:08 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:21:55 -0800
Subject: [PATCH v9 08/26] riscv mmu: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-8-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_012214_134266_1BAD2A6C 
X-CRM114-Status: GOOD (  11.21  )
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
