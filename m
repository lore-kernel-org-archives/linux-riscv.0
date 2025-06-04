Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1400C61CE8
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 17:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+2o/gIkt8et9EWtjWTnCk+ZaAj8ZBkstOAYTX6c81Y=; b=SA6GUAZoDD5qRt
	1fhvKB6KlvxXp1jd/XTb9dv7iWmWUyCjAOo9TT8//kDlEFWOZoPJZGaVAH7xyge6hz93xMdUTGPGu
	feJzRKaTatjKmf6xqAs/1l4wH9hbb0+b9USavNQPNeFVCon+9vFqjVQY2TWyCi9xsPYTHFIFU+d9i
	xTskHkJrKnWm9nMH0eBto43Z5QUSkMNrh+qfwo1Qpcx5A4yynOdo6DV5P+J0pOrDj5FFok/fzKSAV
	iRSB6cWWAakTu4a7wMn9CYb/3mxJNaPRC/MXGPUf62OEf2C61tz6lzQYoT4Bs3IU8tXgYP1OHN+Fb
	AqMk+pYIYNylvAral+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrlY-0000000DtxJ-2Nha;
	Wed, 04 Jun 2025 17:19:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrjl-0000000Dt87-2ENi
	for linux-riscv@bombadil.infradead.org;
	Wed, 04 Jun 2025 17:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lFMrn6lkdv1X+ZfMlc48xC4H7OLYGGf0+TbWHzoGarc=; b=j2NqS9ZCBoCZd8Veua+PUrbAxy
	9/fnfNqaDoxDMTF4HsPfEhic+Q8RfP41tgNrngJzatCvnNokAmicJdksmNzbs2zoIuf3Q4a/akTy8
	pK+IEwVPRK3uR4Gll7h70zVcvlyb58U3roIpMfRuZvv9xBTMA0LyczROoBuzpnGJjZRIzhQRBc1wU
	5spP+9/LDgvCpCmWrPcLnCEXFcnBaSDoGUddd0azI0DZBIEVzAuc7m9u2c/tMSkTkfe5F3ues3Z5p
	kkHzcmLNLmFsjhKutbueM2X2HYFbLks6NLbrozUdp7npRGNHJ5iq6sNzfvSoYCyyyUr1HrA0k/Yjz
	DsC1uxMA==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrji-00000000v9Q-3qFy
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 17:17:12 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-309fac646adso1218949a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057429; x=1749662229; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFMrn6lkdv1X+ZfMlc48xC4H7OLYGGf0+TbWHzoGarc=;
        b=eyPCRD35PoEEghqUyOgeq7AqAP+0jslR/byvNwMJaORWE5E7m9QIwfcxW4mxhi+TE4
         DTu58fl01oPON5oGdp9KkndX2YbR93RgsELurGtapyDduHzCSu8gzwKWbP/MUmfjUL6L
         uILVIvE7Y08CojUm07RRtS3aKitvWbleKqrZIbf2jQbfSSFtJ49ivFH3hpCL82hZjHMA
         0Q2MwRkaFVjl5ABegJQHtecd68h6D06dVeAq19tRXvwAuyPdbslbntkasdjP40eEeO30
         mNVUCG9m7qY1xfEAW9JzWSRCd2MV9i4iZ0yR9l0epo7oGiPCftjoWLZBvf/xu8K29sm2
         RoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057429; x=1749662229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFMrn6lkdv1X+ZfMlc48xC4H7OLYGGf0+TbWHzoGarc=;
        b=c6L9fKCvRaF1gNB1Xy9Do63y5RUevIt4NJwhgFvB2LpwKW8j+gIxgpy69Mi72qU8eo
         cwyNEQ1WzcakGLW0teOmRI+RPX7fv9w7WtIuFVpaifbwLYkCFYENTN0UzFtVwj7VHgwd
         R+oXDAlYBwg8woXHcZS5hU0SiCI2znLTgrqJeauQvXlzsZRyLhIgimAZvX4BzWgKvqp5
         FP+Esiq1PS3s9K70zLnt0MBfeHyrsnVqDX0tnexvdUrpFTSfm9hNpzoCWkRYpaQvzyPK
         oD6HC2VV8oEOVJYkJaqJ4z9lzJCdclZ+9btWq7ngAwB3T+gk4OsPW2qFM7e11GWwnEFP
         Zn6w==
X-Forwarded-Encrypted: i=1; AJvYcCU34R3R3iy8X9ij6m0rkZaPVXiD6MoB47C2mOoq3oNjU8foMgpx2ZOiIKNPQtsZAZB3C/Z789zOZAwkww==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYGdsXQBgO9wXt1Hlmys4jh1LYpd+2UDzMmkGhxyS5fVZhYpkV
	cO3+0/jDYRuy2klESGG3Dno5BPDxL21rDVa0clzkYPYTCmQAg4JKJXVn7U6Qae+8Wmw=
X-Gm-Gg: ASbGncuo4p95a3Ac13HRTPeRzfdUGMdev0FB7l2TVos6joY62G7B1qqt28eO9aIkR7I
	iOOzb4bQagDvS4uzh4/nfp/QTp6w8a9FHoEzcLkz59ncJEOzF3t8gvQBdzhzHOlwwB8wvnpdUOB
	LF7Az/4lL+is9p6kuy54qUxTYs4v6DdRUMO0lpF+/XEib+Q/Q2j1fGk4VQq7i/oAfDDv4We+A+j
	Hck+5aua79FE4Pmu5D4oUGvslNZGpkLfLMyr1Tf/ZZ3BcIGz+HGuig1NHM1cwffcNAwqs/suW02
	p9EIrzuFvYh6gFBA1uSvPoY8SNK4ULRwJPsQaMU2nTmv2605S0LUIWzlC/K5nA==
X-Google-Smtp-Source: AGHT+IFlP8U7HwtoOSXd944WBBufrK/n2f/2k4GAFM1M0xT22Zrh/4VuKUI/K1nQAjXVjiuSif/1Og==
X-Received: by 2002:a17:90b:2885:b0:2ff:4a8d:74f9 with SMTP id 98e67ed59e1d1-31328fa1825mr342034a91.10.1749057429139;
        Wed, 04 Jun 2025 10:17:09 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:17:08 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:42 -0700
Subject: [PATCH v17 18/27] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20250604-v5_user_cfi_series-v17-18-4565c2cf869f@rivosinc.com>
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250604_181711_084473_D490D4EB 
X-CRM114-Status: GOOD (  11.08  )
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
index 2caddcd62848..b801217bd4b8 100644
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
