Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD7ED2A522
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 20:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnSbpo4heOoLq+QpjmIMFf/lbamSyOJtmufe4TuMG1U=; b=K6OJtuZOUi1qAA
	OWvnO3LDbm3J6ihsP6CXsgpwgDbBhy+Umaq43u7oMOQjLb1tFQ3hy9HdPoXzJSUOVowHxtA858GXN
	oko7wni9VUSRAmROAecMEYOpZdkdhrUVh9BrLgZd0g35O/3IwSqRvRMLZt7ENt84v/djcgVYS8cxb
	0s/R/FVzvsuL1Sy8cAoYrYKYoGj/8NBwDb6FgKVyscpnPqFX4Eh+UgI373peShYL7YrQpsnzsVYma
	WQciaWayz8VTxUXEvehxS/ItmgkyHhuMXBAN/nUOaPpmyF2mCZcQHzBFFjIWdMFsBi4E+daLaLUGR
	Qec2VydNCl4HYQ7GkUtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFYm-00000008YJI-0qwj;
	Thu, 04 Dec 2025 20:04:16 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFYj-00000008YFM-3CwD
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 20:04:14 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso1037693b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 12:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878653; x=1765483453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FldpuJVG3boWADnTyrci9WEZv61t3vqu/iLtDVGsedQ=;
        b=E5qe+rkSaOOslyzHgv4i+LucsBZ8i1ZwWrt1EualVkd8/VYW7VL494oEp5n882hKRn
         j1nZDHt/M+HFDkFa9JTu2pE8dcirySZvQWwJmc5rsLcSeSR/i12YXk5GeFiwQhRTGJlo
         ThR6WA6M1KfYmpBRwvQ+MGYMpKLZCuQo3UwG1y0/QNYBV/J49LuPqLkoFbi+4UVIHv6t
         Tuj0MdMveENnGPvUW1DgTwdEoIR3JPzBMytn18HltWbHjbmLlX1+1shRI1YdShlL9VDl
         klcqOUQ9j/vMSw+GkcmNkfuJLumhYfFgtj84U0nToMQtlIA7MeGdhtBfkW9ZIZNGw+7z
         os2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878653; x=1765483453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FldpuJVG3boWADnTyrci9WEZv61t3vqu/iLtDVGsedQ=;
        b=fDfVR+Vb2yuY0PSkDpYL9DefOrOaS0T2ZDCJqpDXutFwIrZe+x7VpwTdFz/zhqSfie
         X5wF4joA95tIDirvyfKIzKLXKk+YXThLrkhvgLYAHrvgahzBlz5wPtZB7qiYEavoWlNj
         Xd03FSoB25XgNP4iZIBw1d1HR4ajJ4CvUArz+em4Lwa1fwC15BrS1LJnSJ86HxDRFP3l
         X3n5GJOobLlK9UAYFa5bS5dlxR4BUM8Bx5qXEV5kMH4I9wL32OHwfAOmCsWswMaLSBhb
         c21SiD6NuEMf4fuADcoc3YojYmQIJkjohIUCQHkpWeyNGdIrQPTkxddLgxVi9LPTaHp/
         m5aw==
X-Forwarded-Encrypted: i=1; AJvYcCVX3L/73FTriLHrm5eCfp04iY4vlHwqCb7loXf7qQ1b6b5jSxzsOTru+R4hdDFlDSghrvfSOuW+v8pczg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiPV9MBxUqyiUJWYRF8gz5p83irfqbSqr4zFG/c0eVchrnuAcC
	/h7jT9DWig/u56Q96IPBEYQVrV7cQPAqgXQuV+cAQ5OpuoyXcsxm1Dk0NfvBHLsw85k=
X-Gm-Gg: ASbGnctwmD40gaLGvtg8uVaKnHTIPaevUPaEXRBVLLnrHJanLVRgxhGh/T0Gersf1re
	rUmE/uIFANQtJGzx9JSNUWSnz6pnV/jZ2Hw5x4ZNjU5xv/T1v73kwsNk6x++pmXdS8DQzj7azLT
	WUDE1q7Oh326xNAP5I+hHb8Z/g5DxaYHf+1BaHhGLkVUtvTO8YRgyUxCeYuSKxTX0DG+HJbs5Fa
	1Qj4hOKJfE3MxI9SnA5AzMf0DWl02RUQ1mAusk6UnHtnFnuu97kh/U75+tGX7w1aJimEgSx3NfW
	5mhTjNekM6/YAjmHJDakvi/ROetbbNu2G+edZjSG0eiSJqpoXvAidiBr3v6vnvuncxEWbstSesN
	cw3gqitzrsMziaoeoaG+Rd0Bl1UEhcQZ+2hPLRAuqa1rKHeT5ZsgxdiY7gR8tHJGZeEvqc0Sa57
	/wI//ez5UJXZ/0sVN/VoeA
X-Google-Smtp-Source: AGHT+IGjVnFtxoq+ijVcDtx0OCHTq9OmWeXCmlU4QkZIcha6VRvMSqK/PJx+/0y8YF7KOcJH2N5m7Q==
X-Received: by 2002:a05:7022:ebc6:b0:119:e56b:989d with SMTP id a92af1059eb24-11df64571cbmr3629950c88.4.1764878652823;
        Thu, 04 Dec 2025 12:04:12 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:12 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:03:56 -0800
Subject: [PATCH v24 07/28] riscv/mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20251204-v5_user_cfi_series-v24-7-ada7a3ba14dc@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878635; l=1430;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=nBM+gKOHTmPMkti0DTh5flAX5grcW8t0U+G6mikLn4g=;
 b=uY7iQ2LIkJgteQ4Sw4sUrLdwxATM/reMziN4oXAuyJmOqbeIfYCABxovYmWTfoYHQF59573Pn
 VjYOzhAFsF+BgJRsL7YkYitn/mU561XLQqyY2K9okW1m+HpBcCwq0OE
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_120413_811190_AF9DBC12 
X-CRM114-Status: UNSURE (   9.82  )
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
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
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
