Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ACFCCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 13:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYfhBxPpzfryCw5+qNhC9PZEQGs80Nx0mdRBdofQvNY=; b=xXE9obAgTxq1j4
	cHIIMHGfnOXvv05uEWOsUNxlUNXAQ0MT0fqefkfPAODrvb005KbcWRsLXoRkzWTZhsKKf1tDJMnNF
	1Cun9gMY04vUzrfLltlBkJYrCLk0kLRn68Rz5GQDW0KpB+UuDggQOXdLeUWLJq4Hs/IlYlXBWTdVi
	ZWPjdiLXO9VO511S01SNQoHv5dqaeea0/PTebQuAO89F4tBC1EGnUSMpMTNUSx94f22Zt+YiDeSBG
	bw7NZ2hev7DzEdg7bLHvmDbu2iY8BTpfibHL+O1NR/0NMtYK1a7XuSBjdCkxar2c2pO9+ZkcEwajx
	AONIfoXf7e9JC8GJxRpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvKF-00000006MzL-3Jac;
	Thu, 23 Oct 2025 13:25:55 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvKD-00000006MxX-2Cyp
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 13:25:54 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b6cdba2663dso570230a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 06:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761225953; x=1761830753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeDKcuIcO6+2FhxyceVVS2WWiuktyVdq1WpyUni2wlA=;
        b=gaI9wtXBrIHx7P073yw0ynsaUAyAk8GtZwkvfimfh7mpehwZ8C+pq0aDWyCKDJhulr
         Zv6oJg4GdLgYFLffJp0SipLaoR6S0v0wfvoTkghwIw65PGDH7qzAYlszb/DdfuwtHd34
         qQ5QUzPOuYvRAqiS4clKF7o6U/V9CqLMhqhLDHRKaCfARipPLp2eiSyoFhb8mx9RfgG9
         4kFBQwUcDmI6J+MIOo03iN8VawgiN8SBqYjugDldNjEpftTSC66YsRX3NA3jbohcTTEJ
         AMVm7s7qVicCsG7r87eJDDrV7HHthssdWC/CcfAy5EE5tTt/4Bp7qpKpu+feWZ6P3ahn
         G8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761225953; x=1761830753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeDKcuIcO6+2FhxyceVVS2WWiuktyVdq1WpyUni2wlA=;
        b=suA7Kpii/BHFQIA1cvMj1cP57P4Ljfhux2h9kDHv63Q5nUbW43LKdwTX1JlU5E5YzW
         XEH/5R2lN0Gj7JMkwUPe39GzAyxJBWODKSQzGMnZCpnqaRSx9zV0YJjhrpLPAgdYBdMd
         ZOkIo5w03qanNzX0NQLk5z06238pMBX94cee+gjGLwXjLutcMD/oAi2lDAGb7AapRj2x
         WD0rU8k2FiBLtsLR9cvzggZO5GALuYCUiJm6uWrwCrIgOe0UDxCUvFp13niR0YHH8BWw
         Xqjm3H/a+N0cCDswscsSEkOu93LC7g0i9z5pguVhaBljV0f05wHcrJ3wqyZMo30NMRWs
         1CFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWMSIsJzJDQ6+RxlhkDJXyginVY1OkvRHZ9YLNWWEi2Hdgoxm533HnfDSVrCh078hV1ILjdzoLIAV3yQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9a5vBYztLP+9y2frktv+g2Z76LLT/zZwGwadZIDiGkdk50g85
	5v4CUVotqicvMSQPvaS0yP5VfSkAMmlcgwulWxw1zQ59ifh+ou8BuNPje2lVynl6SdA=
X-Gm-Gg: ASbGnctbdRFlzJKMp85wzzHr3dzhGZDfCfiNU8L9gRAfi560Lwat+QfKIgLIqzWz49y
	IIIakNy1dSoXl5RLUXLBbTGfjfCbNjL5igWnJlgYP8qDN2MS/K+59xEY5pD0qJvBUsIMPAwG1Nc
	xf4xowDCAy0lHPVG7Azh8KQHkG49/o/8vgJIa7moKfJXbhbhR22eejQEmFlVLTh53cJGQf6GHH1
	rqioZs3gR2V798rjYjHlbAUkG23le/7X2kGrIfHfwnC8s8tXnSLsh6y5B6SxUbyLaw98a0DCZZH
	kyvUb4TAHGjuyjXaPphcZ1hS1zZg1A+estV2Fv9YzG1/YktX2QGJkJAvGfnw1QByGYrc95ByRvU
	iAyoqcp8h9NQhS8TWWryPAOrF4hIDZtGvuhfOS1NnqLUGJTde9jzWBOugo6j1XOsxIlsLXSZxLl
	qeeIMTVLaS+F11ZKhUeYbm
X-Google-Smtp-Source: AGHT+IGAxsiF712OrLUPQ8MDODIL3Qk5KsmgHC3vsv1nzcwZbCFCIx22kpnWIeS8R2YjMhFzIyCVEQ==
X-Received: by 2002:a17:902:e5cf:b0:290:a32b:9095 with SMTP id d9443c01a7336-290cb7567fdmr344582925ad.54.1761225952677;
        Thu, 23 Oct 2025 06:25:52 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e23e4b3sm23432035ad.103.2025.10.23.06.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:25:52 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 23 Oct 2025 06:25:36 -0700
Subject: [PATCH v22 07/28] riscv/mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20251023-v5_user_cfi_series-v22-7-1d53ce35d8fd@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251023_062553_573211_06CA4940 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4c4057a2550e..e4eb4657e1b6 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -425,6 +425,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -765,6 +770,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
