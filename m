Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B46CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 20:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwvA+SFFXfjJTBg0nSY1AVgqF/31WtdEXAZUz/8upEI=; b=Stc1Q/2JpEkSJZ
	yJmwUWbFTUm9TGlbnenSNyaNXQh0UdvmUgRUPF0o5SFciliMAGVgd3Q95wWs3njja/KnUZxIXxJoT
	3LeB8p3Pdyj1Klv7c2MspBohqe0Byk5RG5inZM2gr7uk+SEuNP1s1b5HOKYm1qOa2SkRq/5DClf2Q
	FpQ2tW9D56dpAI9J5rP8QQKjayh0HOgjqrK7yR43RraTNgxon9xBmUlCoQNi2PTlLMI5vvJ0BO2pG
	UHhRw41to6LoQKYmJJdvX+eFlC1JvjjmKoL4gywnldVsPwN0cj+bmcVRH9U5G/2JqaC80VssMwVoB
	qIrmvGbm0l+Jc+uYzUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwPx-0000000EteX-3PgM;
	Mon, 20 Oct 2025 20:23:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwPv-0000000Etb0-3zDr
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 20:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=cRwldBzHIQH4g/MXesqTddRa2wH3mKxscowbsdJ3rFs=; b=SCNqzn3knGI/RchqiiAw8QTWAO
	tlhAsAM17DgKAsiN7YdErcAiMBBWGDcOnWxFvqOGSAwRvtqzY5VgOWO6ELLjsMgX/eMOyFhXPJyCG
	/Xriel8bRN5d2BRLUQQSdf2rUDMHkHDoATYLZDW6fPEaEZJPMpPqcuzhq8XYZkmAoEH5uhNGSqHCr
	xIDnuLJHxArYfy29X0n2v6vb3h9INk4ynuDF+Uo8SGrjbX43WI1SJnRsQvaETwl5SjEsiq3+XMHm1
	9HvXkkuzOjDgvl/Wtk1FES0ePXo1Bq5KMr8jJFtHBY4MNf1p/IaLMR7NAOs3r0jDYZoWN4sC9VuAD
	JtDENu2A==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwPo-00000000z3i-2RtY
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 20:23:42 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-781206cce18so4889371b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760991773; x=1761596573; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRwldBzHIQH4g/MXesqTddRa2wH3mKxscowbsdJ3rFs=;
        b=cAt0zoyfe+L9GYp9th845/SpzYVpLJPhpNL6YgB7O6HaEQDeB4EPGoP46qxQl1J0DN
         6AtWUKQ04ZWXjelnOr+aDVzF5G6+XRJwiJ13GoVMpINsqqGx2tpI3hUZDf1yBIDx9X/Q
         EiPH0THa2eCESppkWP1JDCozOlSI9U4GSprikVgTWpzIpo3u/wkXy1QSjJLMTcAbCNRJ
         xlla0Hs6s3rYmxFBmZAe2LPfPptNRAdHy3l0qBwtqNQR5+PZ5YAcuv93L2uY84nZy0c3
         gr9gKE2NMqn0CLh/xs6euE3c+dGQCNXsQKOWvMjyk9sgir0V8dcTSCxC5httatlvU0fk
         R1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991773; x=1761596573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRwldBzHIQH4g/MXesqTddRa2wH3mKxscowbsdJ3rFs=;
        b=roEfG8J7GvAwbrr7bUpoS+1wcv/93MlRdctfSth8gBs1hTiEyU4kP+qDWSIqLfXbAf
         wRSRu9L2gD2y8L7eZQQfdy/dSmDOnkPvtiomzBq2iqNXCeDN5J/TzV9vlh4tmeQWkMEl
         TQcsTcg41zjelydpvFxrAnyLMInjJjIY9EfofDEriUwbDK4t54QxnHnbGoOxeRfHE2Oz
         5AruT4I9vWG1lDDIZA503aHA2f/YXI58pRdQGrKD7Y70TmyQD2FUzlpQuFeLdiPydwst
         jFqsF/P1bHQ6VmkodU+EFW3x+gvvEE3/hEDfX7Ms0R1FlG43i0ZuNh2Sey0uwBmkeCjZ
         cHYw==
X-Forwarded-Encrypted: i=1; AJvYcCUN5EINHsiXIRxGkTYVT8j7Nqct5ePudiCg7pwr2IPerlwatIfejn2T1AOUx+nqxjPTOwlbaBREpNuFqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoYbuJRsJD3zni59vyKgDrnwTjRl54DBr1ebs6HoRdfLed1nxk
	oZn6s8/4mH7F6u0JMxPTjVmPoKWiUIF/ojK7IA5UbKzVzQTMJGBcFBEzowp0pRxONiw=
X-Gm-Gg: ASbGnctiRomVaw1aCPd1UJ1uQBd1iAvLQoNcClNyTOsOjdTeiHOGb/FPft9kZ0XH/lW
	Mi9SyEn0DRmNZJliirOu0y6SA7XAobawk5riwPMEHNXod6JTNsMX1whMs+8ASDL+yVaNDeIXvqh
	9dDN3S/6OqxqSdD0CKi/PMZ1ZEtsHoBUGfgoT/QTSv4TRCi+crKuHetyCfbOHCLNv9YUUccJkij
	boQTIFVWV3YZuZGYjpuc77XF354HJWrlzFcaCp2lV9bEtQRGZoEWRCgY6NWyMvAXhxOqFvMvCDj
	PhuEHdMp4Ur/D545r+LONCl0ZmwXIHXwaYD5hiukSbZnFbD/SvZL3OKCjQdXQILOCav419xjWJH
	sEJszm08vUjp9wxeZU+7cLkJxjdVHuns2exdzo/ZLLfIEqsbdssRcbl8s2mH9XI7ivG+gCMPadY
	gMH6NjwKW2Xg==
X-Google-Smtp-Source: AGHT+IEWBLf7wq6f3FV6257yUouPbLkY/Mk/oWHqmnpiJ0fcsMsMtz1kgTZV512lCf/qTagDTur4QA==
X-Received: by 2002:a05:6a20:9148:b0:2be:8ead:1bec with SMTP id adf61e73a8af0-33495e6781fmr24121585637.24.1760991773177;
        Mon, 20 Oct 2025 13:22:53 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a766745dasm8443240a12.14.2025.10.20.13.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:22:52 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:22:36 -0700
Subject: [PATCH v22 07/28] riscv/mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-7-66732256ad8f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251020_212337_864033_C1E8A59B 
X-CRM114-Status: GOOD (  10.55  )
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
