Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD51D29FB2
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 20:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWCMHKXREbui/pVKM6wTaV8KgKzFhdyfJs0bzIw28GM=; b=u4+supdmKhQ2fu
	8kVH/nn5nw0NZv5ZmgTfuUF1tvux82PDiBpFIi/g7z9qah9sgDGvG8JgRZmujTIU52/5/TVjusl4m
	s4sD2YSbOMVq7b2UKuA6naSvhEZRMk5BxDrB+hjkYaCFibQFdMl6yswFLYxyMRiTISAWoM+/VrSwI
	cGo3OP4uvbbuhJSSqlp/HW5kyW4goOUc3GMUZq7N9PhKvgShjGeLAOn72yvkKINg6j7WJMRmaOTPH
	lAztuzsvAoBxwyd4Wg2W+nUMqG0iqv1MaZTdidiXwL+Cfeg69l3/EIbLGeexCIhAUYbtSPLhXkmAi
	4aqFiNKMGsn/IBaHpUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFZA-00000008Ypg-2mhH;
	Thu, 04 Dec 2025 20:04:40 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFZ5-00000008YhD-2qGj
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 20:04:38 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2953ad5517dso13892415ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 12:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878675; x=1765483475; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7cVA4V+tsTGYh8faQvOG85ZxC8pPRVoW62aZwUk0L0=;
        b=aXHZK1bpXi69K+Fz+tByRaq0WiADYtPbGPhCYx74ZVauw4qYkMOmAKHgTvO6uV5k0k
         B3huoaSFdvhHc+D4uxIXztDo1zR75coGyC15klAYFajb+jP+C5W5Le0djUhnHBPyIiir
         tDYG1NSpvn+183O8hp3hxJrjnLp0lEevEbW5u3G97wLxCARCjE8yjLR8uwTSJGinumEP
         b0QsTkHyTK/CxoJyG/E9g1NgzuXSuDqc6SlCBVS2Wc0FCdyfyS51MLG/G1lnXim4hsjF
         XOkhj4y5Eq/ZoBUUGY2f0Qh6HmCxqWhaa8CeFyb6CFGibd1Uhd0ZjGa4GDjZ3tPmaa9v
         8dQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878675; x=1765483475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y7cVA4V+tsTGYh8faQvOG85ZxC8pPRVoW62aZwUk0L0=;
        b=GDHFh334hrrz6jxC6yPYpCUTTx+/4ajy4aKRwr071YT/mdQDsH2+EjjIm9YmL5R7pt
         0XEoyq0P9RIHwfa8F2J5Cql70CPJMz4a0NtjJSXNzvIwFRSPf9GYuXQSUgKCBuzzks4J
         lhhDRIxCYHOxAKUrr2raK7sCIYujuOSBMhVtrzRjux3NIRsMrOU7rSGgrnzQ3rjk3vjn
         IKqe2aIo98rs2vlBtkj+4D/zws3iwhZYaCr8+E0LFx116WmEPChIwAOKCn1lD6AB5r/j
         tspp/fLz4CTBWYiIJb9BTg+OkhCO4InDFUZ3yLZieuFlC+kgeadcHDUu2zoW/feCxtDc
         SKZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ6kdd91W4OR+cNcXIPkj8neiPYYy33TexJ5R5RrIFWt1hTsw4GtAXgFRlbyfImFq0DfKeljOkEmBC/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+ojGrroHY28M+THw2scRG3IMvm3l0UlI/VYcIOmze8p91aSiW
	1aPEpX4BenhqEMGaOPSv/IFxIgodQZRCs/hhRo+lpBiQJJ42tnUMSyGXxDBLz/lXRKs=
X-Gm-Gg: ASbGncvzq5IUYdfOAY6hQC/y7BIGbMdVAbiHVBgf2pQQrcCH8OGuJjrpMhZM4xrL2df
	8WTeCcRdv+pWJsHlCsZZY45o3Y0Zp0vgEbKkGguIC8KqeLPnoDiXkV5PhPNqMq/KlM48fK4KDCK
	s71Ys1ZdjHfZe91QaaimCeYh5H2kOsHZV4MMg0p9ioLOEZIo3o/tLz5LLSkdDUAML+m/XZNeYg+
	nf+ENFFjtvYzGZP5qyX4JbmSsO3D2Ht9Aj9MVOCRpObaNQYk6+5H6431rbjGyKUElhms571Ul34
	KyYHcrg4Ok5FzNOfdaDjI8uFdfCQnYb+gzgybYKNzgVCiC9Fe3v++gTflDUcLZ2QKZskLb+iq0Q
	IdCyD02D3L13TONkfSU1sL/bDYtcIfoBe3Jseixj6F9JRZEOaux9XdGQ7rMPyOzKcT6tkau1zpz
	n26Rnwqx7FYXzLL43jHyxzB3BnSbw4tcM=
X-Google-Smtp-Source: AGHT+IH3DRNGCvULusk0MSN0c34XACnhHDWSefcdBCkji/UkCW9Cgr1V8Io5HqSxhaCaIYKCC+gGlw==
X-Received: by 2002:a05:7022:5e0e:b0:11b:9386:a38d with SMTP id a92af1059eb24-11df64a5fe7mr2337882c88.48.1764878674645;
        Thu, 04 Dec 2025 12:04:34 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:34 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:04:07 -0800
Subject: [PATCH v24 18/28] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20251204-v5_user_cfi_series-v24-18-ada7a3ba14dc@rivosinc.com>
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
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878636; l=1182;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=5pCsCIMJf4iBOvf300q6+KPihTaIQ8ZBfY4WmoGUnLE=;
 b=gAgt0qiA01P7drDBMqFQXuoLVXR1r0qiMVxyXn0hwdIA1M7y9CqEeq19oXDcQmb0Z/54Aoug8
 68he+4K0zLTDttF3EANbQpNqxF1OUC/aAhnwKbqrODAAIjZ7IEJnRR9
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_120435_878718_FDDE3C8B 
X-CRM114-Status: GOOD (  11.00  )
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

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 49f527e3acfd..aacb23978f93 100644
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
