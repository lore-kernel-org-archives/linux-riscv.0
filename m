Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27733CCD19E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYfhBxPpzfryCw5+qNhC9PZEQGs80Nx0mdRBdofQvNY=; b=KCpF2FkJkA2dPa
	rBhFQLkbNAdZb8nZ1st/leuzlZiXCEozM5zbUXeoIHavQjOUB6iUdWamfahrBJ7ip1vRruzwBtWYy
	c3aeHkWEs2lQ1mv0RuBTh805bAXg7+Z0z7S9AXkTnDkb0s/5Jqq0eU1nX6VVDtvzwMa8E1xl5kyVi
	sZ6XdMKwWtNzTkwh0X9HF7nJ5wLZKzPU0Mjj/HQIIrB4iHLxrnzD5g9Tje4VVNDJpp5V7X3CwJWq1
	lwvZXKs8j1UdP+iG8VCU9dkW/xSrqu5uzRahkOWKrLKWj+qJ1dWu9yv8yHtGtdG3Mn0/ofkuhJxf1
	6jY+OAYSRj3TxywGj89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960g-00000002X0N-0Pxf;
	Wed, 15 Oct 2025 18:14:02 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960d-00000002Ww0-2Oiw
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:14:00 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-27eec33b737so100488175ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552039; x=1761156839; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeDKcuIcO6+2FhxyceVVS2WWiuktyVdq1WpyUni2wlA=;
        b=d8QwV9uxOc+SAv2C6Q8BmuixG+bMhLdErmrE6ch/y1UkydZKNzHQDUQVXAcWJ0Kt8P
         F5si9qE0kDPTUIc9GJRF/5c7VdF5lS2bRUuwjYthett5RxvzLAY4z3LvaqMFMzI6oVFn
         Ck1Jm+rjtfGA06hKAURQblbH9CoWXvVMXMaNGgm54vPe2HW8RoEe9QEjWNYAuf+3hqH1
         6vcFX0N4cROnEhK9t60LVbOjVaOfJPNnSDXgLEpw1tPStp1a//S0aJUJi9+6AkD//wmO
         quk4DOzVpRC1BkDOGpI++72n+l0AD5AAff/KMa85m7tCr90VYmuWHLg3/rP3BT/oeydy
         XS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552039; x=1761156839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeDKcuIcO6+2FhxyceVVS2WWiuktyVdq1WpyUni2wlA=;
        b=pB8jWzstoDdqgDwPgb44yk7HxDhcPqVykZsl/is9bmkYVXPHtwKZGnCSk5ARJV8jjK
         aLvCnzLo92az7ye7k315pUMoGpOn5mJITGIkcqpMog7infiOwWr28jZoujc5HsT6HY6a
         Rc736K8eNji/AD9KAseeyXnOF4FvcBrSpN8Jjz1KIz7sd1fJ1VPFV6avVFbw4PLXnlnL
         aK44HLbCHFZwWNZhXBkwSyDN2PT+KY3G0n96PeGhkPxe2+leC3uwuoa/Rq5ErLUQdeLT
         KV+RUf8htB8rTnv25KT7QswnioYAbBe3nYJ7k9xby2NIqGe4UlRPAmx27YaQZJHUNWMJ
         rmlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4MsRWKTISZlQLhB+xlJqf7AOlhGbnlULi2D+pX1kwmLL231zGrLW5sBTIoELqFU9iMruWBsY6X1oCYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ8ALJ8b65mEi/vbcpiow6+OvdNXpxvCa6FL8HCZcn8+c+qWuD
	OTecqeftrNvQ7JkHvT+IYVK7CVpqSVoZ0RSRjcGrlLXQQrm1Ngc7TANjpucy6v9QJcA=
X-Gm-Gg: ASbGncuzB0HwQDFHxlJ7k6KuDpMuVaxzvc8oDPwxZJaxBksDj+5psiyKbf88TLCoP7b
	K+2SU9wntXXL2tx43lQjvo/y1UEtzpRJM+EEQMVhxXTDdZribKbtX0qWe/Jok7MTYZyNOrHtH2Y
	9qJAlaoE2AD+RW9u3888fwHJpggA0PE/YyThKBXKmY/LouzGAFVUxqNKQAlZ/IYDdErAkMIEvsO
	xuLuoDftOY3zXMfPvbdmX3MPsIzZIL9WBSuEXs0JUaHgCrbILQnK6cxcvf7yUJyYekMGNGBIGj/
	xBfH1YMpafj0S/lqR2IEvhWSigYNI9Z1jv9CQxRGCAuBPOXZqqzVpFnPlgQ49FkY90Ew2PQmA3P
	jPIe25wCdTLMq+H8WNpW4eEF/F2Vcv1dHEGQ4lXbu6mRy/mJUwzk=
X-Google-Smtp-Source: AGHT+IF7+0siZoxu9qB67nOXjy9vTyzrCE83G46axDJgPfnYJq92ADj9EdTAyl+KZI2DWODagqgyog==
X-Received: by 2002:a17:902:e786:b0:26e:7468:8a99 with SMTP id d9443c01a7336-290272c18e1mr357750345ad.36.1760552038791;
        Wed, 15 Oct 2025 11:13:58 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:13:58 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:39 -0700
Subject: [PATCH v21 07/28] riscv/mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20251015-v5_user_cfi_series-v21-7-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251015_111359_605634_7D068B62 
X-CRM114-Status: GOOD (  10.08  )
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
