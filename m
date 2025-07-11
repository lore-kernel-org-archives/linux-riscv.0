Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577ADC83F1B
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 20:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Z9gEq2kGnN8fbd2ajoJgOVKdrbSEcxZdLrdahDP4Lw=; b=VmoA4vrf8fU+gK
	U8LS8FQ0Afkcpd8R8xMwWdfADxyCG8gY2swvVRivsYvDOw5u8RJJVvBTIj8hVNvQEYL0vn5MRuAHw
	V7iMtFCcwekLgDsUHPvbvK7dKdK3sy+Nw7XOCqSfEqVMz+Ff858Oc+rCUGLuU7qWTMA+Ewpy8h9Q7
	3vDourBJ19G9nIMCTnMqA3F9rjr9YTvfhfInweLF3XFUWNTyMx/9Hm16Q8yxOwd7ytl3jc4KcOZ47
	OnqnpBBBuPZJ7YBxHqhpWa0emMD9MiYKa2wRKhecSQwx80D7QDaj5t2b2///kex+WJmZ8KzG5a8iW
	IGfFPcPKINg0PbqnyfVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKeX-0000000FoWX-0zzP;
	Fri, 11 Jul 2025 20:47:29 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJi9-0000000Fgcz-3tXL
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 19:47:11 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-74b54af901bso1691903b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 12:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263229; x=1752868029; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaOhr4B8UIBnpyYSF4WgF0h84c6zm8BnVR368xQHyas=;
        b=yWeCyiH73tdg6gqwfpZPPj40Xq5hignwhrdxelpjXGG8p+QSkEA1IRKFJhw9Aw24bG
         jiTDz/ZR6BNk95HdhOBokQRZsODBMLG0Hdmkxb8GuvGIM7+V/ybR65445QUWNYirHbGB
         WzvCnbw5bYOkKUqvyriXa5fIWZdBZXLhoH3MbBZgeUQ/099Me2+IO2rUXKO4Xr8M/+Hu
         2BqsLuL/MTzZmAgifiPd0al3POdi6MCguK1KqJSTnSt2ScrLhFpUuM0hFQEWGtHerOVv
         2DRosMgHQJlfRA35ZyxDbn95B8uOUhbncGYGeOTGepTrtOeN/8wwz/0orIJSsNnkPRtr
         XcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263229; x=1752868029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaOhr4B8UIBnpyYSF4WgF0h84c6zm8BnVR368xQHyas=;
        b=HB1smO4iOd8JAmXTI5SgVqqYVWopNLjxdni/VaZnN6Ij2xudZ2dhmkTxyB+oorNlWW
         N58VvI2OJu8KhyE+BBZEdpYinDoOLLeJtZYY3E9ahn4BzfqLMc2fBOwpk3TKAlOEuYvx
         pr0l2SfqZYFdxzaXIC/PqayiMX7dKM4/JJmrCSFpW+JDERpL3Uz1rTz1GhXGL/Qz8cGx
         5bqHv9JcQsPAOlMa1USuy7kvt+a9ZjiOyhND0cVnJ3AvSFtKpKC275FwccFZx1cHAZBq
         jQu4XkYDHu3OEhyD0ANGUTk/fFhe+TrtEQr846ldB0UHodQWeJHFafAFGaJWLV2Uw5lN
         8nBw==
X-Forwarded-Encrypted: i=1; AJvYcCVeKuqjGrem53HwIVKTFveYbLjK0iy69sNrCZmpri5IPGrXPKMpeu1Sxm8yeXHDunEH0ryEuPTX+VmoOg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw09c0695O+Y6L2wmCppqJMb2nwOAAHxrM779BU2u00C0QI+nhX
	Jjr9Jwsk4Jq+JFPyd0SniQOdnYkwQQTo/mPM4M+XWl/s9J03BWzzha0AHZCJZs7hAqk=
X-Gm-Gg: ASbGncu0leT2ULGUW1wDBh5iyPz5xHSCSb8WVF99AyFT7tv7OVL07fRtW5SmhEKxvg9
	EIyCmb2li17bVuSmo6dlVgyKjwO74w1vtwxBpmgFmmlVM3Fm+zVVECCdlrEmCpe673rdAACs7Y9
	ObTcSLjPiBO2fywZUcBhPb2Q0BWXv4wkz0VHj8bvNMlg6jd5wUhIaiqfXx/nbn7qGGUt6Ho+ZOa
	NTak6RzdizFE6EWwRY8zazpTa0aVOu+lFXN4KlUYX7Q4ajjOnxIPzpxQGJlPQNd5HzC0XY+R4RG
	lGW9FWqBx+Oe/k3NWinEngxO5Jmkh5YosjRABNVhGMh/zlJF55lCxH11y7hdQzITJQoBNTnZl3X
	atAoSGqgxoAfPOCGVfnuLfKQgQwQEeyPt
X-Google-Smtp-Source: AGHT+IGMRlPkCtoSr/DdLAT4x1zW1ahni9MMTdhSvmgOPFcqLwaQsTjIrpUSbeL2qcQ1/fjo21TBHQ==
X-Received: by 2002:a05:6a21:48b:b0:224:a21:6b6f with SMTP id adf61e73a8af0-231203133b5mr7517648637.28.1752263229244;
        Fri, 11 Jul 2025 12:47:09 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:47:08 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:23 -0700
Subject: [PATCH v18 18/27] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20250711-v5_user_cfi_series-v18-18-a8ee62f9f38e@rivosinc.com>
References: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
In-Reply-To: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
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
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_124709_975111_62082FEC 
X-CRM114-Status: GOOD (  11.16  )
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

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 91db51413fab..a88b06ad2f9a 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -93,8 +93,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
