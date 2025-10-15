Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4902BCCD19E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SyWWzY0tITpmvgRWcQeNRLcudL9kEBC5yVyFc0gs07c=; b=1CGi/51qmGk0X1
	c+satHcjUoDOcSGTWZYOHabyTDyLQdMvlwEhuijgIrsYnECoSKLF1p0cT0kEuUs2VsjRIHpGz6XNT
	qG97hj2k9/X1xYcpo1/f/xgAHu32O4YgLelQTQKpN7q5fGvH2TOsYEiqSiQSoI1O1iXD9YZVP9LUT
	o1nzpWgxGd39+zd17fnlJQGTLGoB0oMqHQwjcoH/fEPseYzj3WkthnNkPlEsANdtMRTg4Qn0aBVjV
	8MEvPJ0IHQcu39MCXIQ0d+EKj2b2ISaG1MRm4pDXHquq4hxr7vsl1gpYzuecftgXBVmuAM4pWyCBH
	p/jycO4IFyMv+9IU+ihQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v961A-00000002Xiy-1vgS;
	Wed, 15 Oct 2025 18:14:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9619-00000002Xg3-1gfr
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Oct 2025 18:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/tg1KhEMZfMefo+THEb4ueoLXzfJu3WY6LEuxXprwk8=; b=kqFnyrHjgvUyRgQdhxGMqr6Qed
	9msZSCfZ3tW9cjxOu4e7xJcb84+9dyKnxyXQCpUjJ6nrWdHCuUcWUg0HjxHun8hxC8gkZAxD26kEt
	vEpFOxJq9iN8yTNs2TBxVqWhUxdXw0aN8Z+4FlNAUSqt6lyThf3kOx05oV2zTx63sQqAacggnJfqI
	9nf/0EdWSa9YMZD9y4okYg3hbwldzO6rd2xfBoI9GLRnoINtmNGgUyw4veafN9cp4+qn4kcxhPqzc
	5bdziNC413qhBDYFolhcqmmjwjv4Z/Bgho1q91FN/lcz7bwaPsdB0GOsROC7xLXEDnrNtiA6OsBYn
	0lIsB+dQ==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9614-000000066Ig-2Xlh
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:14:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29091d29fc8so3020125ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552065; x=1761156865; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tg1KhEMZfMefo+THEb4ueoLXzfJu3WY6LEuxXprwk8=;
        b=IZ0dDLv6vT2AKBtcNLnxWg9iTOB+7Fgj3O/OLFERvctyC9OmVz4h7HQPU/9KR5w4xS
         VCX/JEI/8MN/hjIQo1qo4JQ4rJZ5s/vx1/LERsT95ilLRslJ+EVKpjDViaHsqny3S2EJ
         iSha8+GgY2GKaTMxOWeWQtFSSLbOIM7uLgTSh2TEaatyGA1o3OnKgGPFgwiktkLUIEbA
         SeFGhU0P9IcuRsgi/jP5873t+hUzoMzWU053Hsm5pODM5fkrjs/kArKtavtPuNGxl77G
         NjV5ArrrVEwn7+Ye3tuDu5NqtoVv9YCFh6hSN2JLd8vD8u62pVhdZ48azgFaJ/+2LG2q
         ejhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552065; x=1761156865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tg1KhEMZfMefo+THEb4ueoLXzfJu3WY6LEuxXprwk8=;
        b=kzCShn7MiJuRM9fx6ZIuoZrXc+hcXK1r27ogSJZi4Vbo4jNrW0g6MaksVUCaDGZauP
         AazGUCZoKKmqa3QbSPtLLUCiUQWFgpa9/3On2oo5zOFBeZVQgUSwqRUtKxrfdcZvu7DL
         imEJG3mhEH6esgspOt6gCMicv2oZlpCghbF0tMZrDDspGEERTxSS1tZwAWbjlXhm3ILm
         YQ6dkmduj11bN8p0ksEmgeSLWj/ennimnAo66wvCEijkU/IcoCwpfrKBLT5CDifhhRkB
         fRTDmfAvYeNvUU+/wpHPCayX0A7uI94A7uAYBN5h492go1eSyPfmUv/W23ZYLiewkLVa
         xk8g==
X-Forwarded-Encrypted: i=1; AJvYcCVypZuoFQFJ9FmJ8aSMR5wTxHUKI6+IxCw6dKqbLMO/VN21zI8PBqwb/u+8pFPCuo17GCcEIwr/t+wFVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgyioDYoqJHlzYsoFcYQScVQh0Tjyk//ibNd18gqxdcaD46iEc
	b2I0U3U5vnPWZPGFBaCKi3MGjf2v2mbhNuw2i18gLjUNfvi7QArSfvvhMY8pl3j0rbQ=
X-Gm-Gg: ASbGncvX4IZNP/4bpV4DuZY0tUIEcTo9BUOLgh2ZFz8JuAKPx4lFxzegCGRIg7dC1wF
	Hhp8PLxdh1skokrbmVkRrV/envXkIuayWVYI9JfU3+W2o2NXxkKBdkhPPbls8WfUrytmLeFKhVM
	vUsf4Oe+Onrfl6xgr04cNavHxgc6wSDM/6DHbduzxrH4HeF3jSuzY5Lcc3CQN7IlrZ73sp85mOE
	1bZ9oqV7ObZ6E4gB+zbjs0navKy5QExpB2p4V3D10+D2esPKogYIGCD3gePtm+Peu9tDhjU36Vi
	A/JA7GalCFrnnKlLOB90WyhfYSnw4p83bUxlOP4/tAypI13srFDzFhVMuhM7oO7yTsoP2TsLZyP
	zDh5lfDP5QRksXrVOmtAhTjfyHdIcBMjZA9FSdQ4W+Cdh/huWQe8=
X-Google-Smtp-Source: AGHT+IFJldQrTahc3Q8sVNu0r3ng0kmfHptGVJgLteMAPNepRvaTO19nK3n/je32vdUKI1tH6x0IYQ==
X-Received: by 2002:a17:903:2f84:b0:28c:834f:d855 with SMTP id d9443c01a7336-290272667bcmr408470055ad.27.1760552064765;
        Wed, 15 Oct 2025 11:14:24 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:14:24 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:50 -0700
Subject: [PATCH v21 18/28] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20251015-v5_user_cfi_series-v21-18-6a07856e90e7@rivosinc.com>
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
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_191426_781094_B87243EA 
X-CRM114-Status: GOOD (  10.92  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
