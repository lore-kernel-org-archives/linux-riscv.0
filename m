Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBABC369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 09:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XeW8+TUrWHCGaMghs8QC67QFneRsl9EsUU2hKqKM5K8=; b=p6YBNf2GJQYKyy
	G8HSUE5ITEEoUAHyegiO+ciTe7B/cXlxy42iMoJ36EHNGc1Y8/x3UW2YfqGYW9ENi8aWSo+UJJYSu
	epzn85CvVWF8Ipj0IRJt9cOKVPjeYXe9BPkj06IlBX59j3g8qIP/qt5pQjRoeudmOvaxEQfwCTa0b
	Gsb65TwYBUm1bhfipg2iAeGVbuWTdBu7NCESrF7YiY1AD+69OMIscf/9g2o+AUJOSchMczGzDF7/Q
	nTrpSjY1YYZO0kiila2sIxMI7IZcDS62viUVFPr0dNjCyoZLz2U5AKsjkYRPsUjBedNnJ55LxUJw9
	B27WKNRsVZowWniO6/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t1D-0000000DWgd-3lfz;
	Thu, 24 Apr 2025 09:37:19 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qte-0000000D8D0-0Ehv
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:21:23 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-223f4c06e9fso6224315ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 00:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479281; x=1746084081; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=MVT7XtfMTpeogMxeXtkC/KlsbvWpPrwTpA6G2q3v0J4/uhn8k863d5g3GvJXRn+uEV
         PJvP3neKGPgaYidGBQl5qEICLdDGf2mIe7Et3mD7OZmR+IeZdSihO22JMeNOhr02pvbC
         XcVPz8CiBBPKK1HSSS3YTmh8IpVQZVe6jYz8N92xFFJHaCtaiYJtDRbR9kGiC3xG2Oip
         BX93Ko/zyjo3o3z4S11SgAcFbpB+6a+79rL602jOp/JWK5PjSsrzVFmtvPsAKij63HQp
         FIbnygRrnMquSuAA4B4Djg2emGxvjBapGKPCGY7nbpU3upRV3sCmRUsq2G+LqBVVhmWN
         6o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479281; x=1746084081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=sjMtPd21N2uF2Tx5dXPxopqjLDMhwioi5rZLVaWO5dvTZFjiatXpSTqiYVagqx7mDF
         ow8ZsOYzFyEw2+JBUprOiMgXptGYmzzcM/+wOlHLl9N3qug4buOq3sjFHk0gIqRGV50P
         7fXS/i0XO6W1UkjzV8d9rqvQmPDj1AQdImSg/gILhpT2fIwVK2bPywPSmwz4Mukc3Ohp
         IloiSluTs/rV1HDU4KLYfAd1yl5wWc4RixtkHCbxfayoRvTaM/d43S4wBtl4dEGLvusX
         JYZam1Z6MOfZorIqLAfyaXt0+/mCUWBqbcsnIyNdySxZ/eZf5Q1rrAb1Pc4bHjQtbXQK
         8r4A==
X-Forwarded-Encrypted: i=1; AJvYcCWGHoTFklNuMlLxjUh9fcY36Y0SVtGAHypw4q9QGNuVMwPt91sSDgXWW/Z8CSpuGih50FOfdUNOsTBQZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUUGnPzyRatx2YCDgYLBJ/HrzFAdkFRPFXCj2vBi3z5OEm80/g
	yBl+m60GViJ6qeMrsfl7HYl+hkbRi8aCpoG/3HdBXACR1eRSAyumzLya2UgNMyk=
X-Gm-Gg: ASbGncsEO4JgCMEJOKJ6F8g1/Y1hzPuRT/H2/t0yaJJpyHZlBP7/n7y+i7jgO6cnFr6
	GAexcaPxPIJdvMUnuZ3QC2TMFehsDdUU87pG03dMOj+B2OgZSQHF5GX0FzfN48+7IW0RTcRcIJs
	rPri8AXZ5XTIkujlPawRALhKfdA+/pnK6DBAwxCEvxfxXadT1CVXoCMc8gVJtKLOaYmWAYwOLOT
	MoDnXVzZ8e8ZNM+2DSwYDlLRTLKMoxbkiynHJRXD88zfpNtlmJ+2H9st51jySRM87tLM18JN4Y0
	ZN2tRAp/Jwb6BLxbPL3jauZgh5L0YAlLEbsnH/kMDjW7mmc1eTw=
X-Google-Smtp-Source: AGHT+IGB31thuufoxJYlKx2OJ9+59LtpnF6oD6iN+AzfxNeqUgzSARE3kzGHVOeHGGHAiVK6EGT83Q==
X-Received: by 2002:a17:902:c94c:b0:215:a56f:1e50 with SMTP id d9443c01a7336-22db47e5457mr21504655ad.8.1745479281373;
        Thu, 24 Apr 2025 00:21:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:21:20 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:33 -0700
Subject: [PATCH v13 18/28] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20250424-v5_user_cfi_series-v13-18-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
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
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_002122_111070_CA38078E 
X-CRM114-Status: GOOD (  10.77  )
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
index 4587201dd81d..6bb53ce72ed5 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -90,8 +90,8 @@ void __show_regs(struct pt_regs *regs)
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
