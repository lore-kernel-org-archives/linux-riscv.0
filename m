Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669F9CCD1B7
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 20:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYfhBxPpzfryCw5+qNhC9PZEQGs80Nx0mdRBdofQvNY=; b=pA7rzguvTG7oMB
	Dmt4SEXEfmFqM9/rj1+RgCkZo7D2XJObq6hnjVad1opojJDLkoVYivOWt3Y7iCLAuNlaI5IOghJrh
	inqpt8jJRiHhwG65PqLZT0EOtZB+vzLSQ+Y152tpA9zTI/vRuIA8/RlAQc0Xr/EW8NG2cbnGmpS4a
	ffO6+mIQlONsDltrAcqb22loD7IGFLy4A2CbGgOqMR0MzDb9xJ/4QueumqEXYt9k2/vw4wuCjTZFG
	lKOZQ55U7Y+RCZ6k56/oLCWuVZawMPDmrYCqeqTnUG+7uvvIOJUYJPdsWD/cGIXSaSgA8qkgmK5nj
	fSfTNypOsNG5DySZfH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwtA-0000000ExhM-2xHo;
	Mon, 20 Oct 2025 20:53:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwt9-0000000ExgF-1aRq
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 20:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=oeDKcuIcO6+2FhxyceVVS2WWiuktyVdq1WpyUni2wlA=; b=Bvn38Q0yKt5bzqNRUANeWAUA8a
	zMFZUZlyx0uHPKBbPpNI/XcxJD/YJjCUpDZQlw9lIVRtwkXLXOxLkRZLZzPE82ZdbGrDmRvtnPVu0
	Zpibjzg06PXl3q1oFg3T7bVP/VUKCB5WxGcrKvT0bTRpxbaR8p4xR+TST42ppOjeNEDbRsLX7FOQH
	pkFzNWuRI+PnJXjOB9/vLiZbcaL2jw4310hSSC7d745hGPmQbsdtN6SoSIDukINgwNBSM0Ulrs340
	vFKk91GyLIxwYVRe5PySNpQCdE97m9BQJykvgGw9GsEYd6VgawFSqIB808jh1wpUt+QCjinGOnPjP
	5cdQN62Q==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwt4-00000001eTu-3ZDc
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 20:53:54 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7a23208a0c2so1747578b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760993630; x=1761598430; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeDKcuIcO6+2FhxyceVVS2WWiuktyVdq1WpyUni2wlA=;
        b=Aty4T/+p8flI+OYvnZJxaUFYeaQIidiOziu3s20Tb9YpBScHusNklggVYPUJqNCh5z
         mVjlH+Z/eGpXktOx9ReuOHnZ5otsZvMCCwumtX3+KoLQupKMQD/Oc+/4hxeukEPqVhzv
         ywEWH6eRCbRz+mgae/oKuPv9xylRDvPO5LR8EFV+OOM4sMNYQtwSoV6IFyU8q+Ix/TOp
         J/s9V/CkfUcGb1QwHo4RcP5S1jb9KBCGRp/AyTlMk0U0SYV+Z6XVUXeL/9dyWTOHnMPC
         DZo3LVhRIOilGk7dWfYHhmJtk6TBQ42DeQaSlelCuBUZSQhRfdhR7TR9H329f4GpEtUC
         1k/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993630; x=1761598430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeDKcuIcO6+2FhxyceVVS2WWiuktyVdq1WpyUni2wlA=;
        b=OrpLFORdS4Cp505RnUvqSn325EZqRym0V9DCua/LjEvol+McLhMH4fbElC+DUXCecV
         Mtccyz013xvwbiXvYD9YltKWMZRafsfgR9RwAkgnFjnt/D3gXvwIMryhngHg8MRAJpDI
         youIUe5Km/tz6u6ktuEvPQ6L7d99yCWy2Kz0WafKQkch+e+O4zgmBYeMK38SnR1kx8Kj
         QXRPr2CTlk7Ao2jBe4hcc7kxKerh+KNjxXzRmlDVl0ntMmF2nZ0rVICl2eHo7XEh9W0C
         /flL3ez6LmNUrZV9/0UJaxfpyXATkxFaop/NN8mt9S0IjSWCnkRZ3qjtepPqGZZZT9tm
         17Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUILK9b64mJBwgUTANGUA/WIuSeH9hhaJ/zewORDmQXblGLDeFnzEB4kQUKeCHTK+VO6damhAegm9zZfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjfXjQruBKEdEmDa0XEO+p5ZxySP+H+D8pitFjYk2IPOIyujIV
	qYhQ/DNBU7gIJ10AuWCra+vOWvOuu8lS1GAv2YKYerRyOJyJjHAo5tR5jIGhhcOB7x0=
X-Gm-Gg: ASbGncvChjk6End+Lv+aAZlFvIdZyaK8Vho6Fwh1A2ZVlhJMGHeB7Lh1j7HhoLkFbC5
	TM26MXyMvmH6J4MitMX6pMgAQcc5pIDrwWu4gIZNZFVbguta1Jkbterqi8D3GdgHaC4YKYw9H1R
	M5SExlOYSLsIMoMFARP0UegM+iy0W/pswgDQRXuF9+ZQ1n3ApwMVSWzXmyFqUHo7dWnAqQQJ9lL
	aSaKU2HO445gmyKvE5JEhvw69+FY4eKdx0b5O/DPiKuYXrZC7+/2f6vcOSbjKqAmUc8uKkheyn2
	pwJeLnRL3SNfX+JvhHb1PDT5RcB/sLOgBxxDXTfNWrqKncFa/0xjY2IFst04bzNRQyreiEgGuYN
	VMpNSu0JHY3yRL9F9svWIvoE4WQpgJz0PODLV0xB/QPamwxMtwWOQS6F2aPShOBP+NwxVd7Z7Zq
	AptQMt8ZCfdZOuD1hnQh8r
X-Google-Smtp-Source: AGHT+IFyzyRYR8N4pw/RqABJpFBkHAgssztpR2AfShjzj8U9HBjqzgn01yskrDk53sXzLiQsCgAq5A==
X-Received: by 2002:a05:6a00:21c4:b0:780:f6db:b1af with SMTP id d2e1a72fcca58-7a220acb6a1mr17244647b3a.16.1760993629790;
        Mon, 20 Oct 2025 13:53:49 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1591dsm9453867b3a.7.2025.10.20.13.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:53:49 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:53:36 -0700
Subject: [PATCH v22 07/28] riscv/mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-7-9ae5510d1c6f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251020_215352_231410_EA447134 
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
