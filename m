Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA03C54F30
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 06:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhZnULThlRVsbqfMQp2+ccN2pXovwDEsD/Xr4vQdyNA=; b=PVftLDFeqKuo36
	82y7voSDpwzx2sQYNE3pBA3I4wMM7QqqGRb9oCLMp1+LaCghs1gJiQJyCftLJMhK4siFLcWdUrAYe
	ONWe+04v2+3DX9A9ESufG2bUSeWBUlP1+9m3Y2z3PpJbjQPHUROCk8kOh2fdLnSm8zcS91D07U4Ks
	j2al/lGZ7Fb4MT/BKo9Gfc1rEfddLFgAbeGkpTf+qNqUf9duIbtLxhe30DzIaS1NFfGrsvN6wUqe7
	gPB8ZPtWppjvfyYgSRIvj226bEbIeILUwzl16KPTmXXKCEQgJWfhnhxYDjvOjedOkt5xxtrHcX4f3
	mDDnGs1SKXF+EddtwwGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIM2w-000000037Rz-2r5a;
	Fri, 23 May 2025 06:38:22 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL0L-00000002zyO-0EfL
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:31:38 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso7470872b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978296; x=1748583096; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tvKQDIIBJb26wPDVIJoD2xzubcY8uay1NjKLxC4PFw=;
        b=DGhNE/a+Y90SSUWs4krwxft2ei0bI0qX0BOQvH33w/5/PrifsIyGKjR4kOc4DsIvbY
         iYx0S7dA0a54qA1qCYrDhSZd2UAj1j57y9QyKeTXFBSexbkXogzXk/8L5UtyrA5ii3Mc
         6wRVf7P/uUt0UYkosk2T9eKrQnW+V3Z02MUKMEhAOjJZmf5aSsp7xNm0Bbx8Tf9xTheM
         ofdU+Ruh/DUyDWaf7SyZ+l6+CvIArCNjt8ZtFgh3caWcgS9WLlMaLAzhrbesPJ+L8g3c
         3VJWCB6RKvfZVitx0KRf/PmgLifscuA80CiRHDNm5iNw8x/SyUcPngjljIazlJn5S5EV
         zIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978296; x=1748583096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tvKQDIIBJb26wPDVIJoD2xzubcY8uay1NjKLxC4PFw=;
        b=CWfCVS+L+YSGFY50MzUSoGK22caqjC8YqGj/eIPw2BHHs2JCNzGHMJydxxRnYMKLsa
         RjcbdW1IBJ6gMVCskZaLngkjiI9V0DyJadIIANXeNs6ZofRbliKkQOL7kI1uiCwWjjzq
         j6ckPxT9A8JVijBLvgqm0sST6S9lhJnJMiBuxadygCMzciab4+VzbD9BEXN0rOy5gCyM
         QgLK+f2Dh2QA+FHTHp+FYlNexD/hl6++70fkVncd7g5WPIRJgNtm3jcC4wP6TVKjgkFl
         6iNoQXfNrIsXntlLqbfbxGzeBPPjzWFEuNccW0tXiOXJEDuzYxLaS8mU76K2q54XXoU9
         VwcA==
X-Forwarded-Encrypted: i=1; AJvYcCVwOuV3zapRWXKoHjGAjwh9B9SRuPhnfC1C6JiOXOEuQkgauiYF/0Z2z/HXQwQ7vrXvtlRhjnOJJAnNHw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyid3qtn2yBGnCjzA6Jmm0jUs4HiHpcNHo/s0LsAuR4hsOBt/D4
	zTCcvNbzs0pnumAhW7sUcu43k5LZ/27Ni74Y2WYdOBBpB1toXI2VngQXehAJwxJYJb4=
X-Gm-Gg: ASbGncvDGvihMyWQgllm4TCF0ELa5tIRKenp2QnjSuwNv5VCz/Ls/pV7ULs6QyEvlLU
	cbFHrUIoVcVl37TJdT9Ydgszwcn6uZSyenABVOZJcY10iu2AIuMt8ESNcwKUwHbJgXg0WkFqrsT
	OuvMeyQj12mS+/wKhaSvjdNimJqcmMap7rrAu0arInXRL8YFVw0pGIvAmRDYzzgOmAEqQqpBA/W
	AeQydwS9Vrx2HHqMMEbFK3xphqHoZTzfM+f244VynI0w9GlorDoqMddDCn+xNuOksiq3gf6Z+lB
	+Jg//nCsXSCjLsPe1BukgzKyDfRYn+9CmI7NU0xnrt3j8RDj9STKG4bRMpZK2A==
X-Google-Smtp-Source: AGHT+IE8rK05QdJ1ITD+5XvR94KKlymVkOHWAITS/NaW03DRq0vlii2hXT8T9gkaCsqN/qPnStmT9w==
X-Received: by 2002:a05:6a00:9186:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-742a98a323bmr38743995b3a.18.1747978296025;
        Thu, 22 May 2025 22:31:36 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:31:35 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:10 -0700
Subject: [PATCH v16 07/27] riscv mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20250522-v5_user_cfi_series-v16-7-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
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
X-CRM114-CacheID: sfid-20250522_223137_104893_A1544E35 
X-CRM114-Status: GOOD (  10.30  )
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
index dba257cc4e2d..f21c888f59eb 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -433,6 +433,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -778,6 +783,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
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
