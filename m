Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60977C87FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 23:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Z9gEq2kGnN8fbd2ajoJgOVKdrbSEcxZdLrdahDP4Lw=; b=S5gtjG9jWMKgSQ
	wqIIBE2MCLmMCpVzav5lT0EjP+c6Xo7ZVTDWdxntAKkAnKzWzv8VZxH187Ge0WhWqHQRBgOkTelLO
	zR6Rc79H1Rjr/yZBNLFQvwvPgM/G/aw/nP+Ff/XeinKHGqvPLNDgKR864ITMDybAMof90ValPL62T
	NfpdD5L/49R8pGkIj74bS3MWcSmHoR6EZodJ0VhabSwH3TOjmN4gjie+/AaNldz6r/d1BEhBpDBbg
	Sb5hY7JVbZ5M7PdZmu620tGOAbQK176TY5z4VPIg7Fs4AHP1HKdxfZ3tmycGf498y+kfA1PEXDGuH
	vg6Vg9HZ68xfwbYpAx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhca4-00000004cMb-2684;
	Thu, 31 Jul 2025 23:21:00 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcZJ-00000004ba5-42kO
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 23:20:15 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-24049d1643aso7997215ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 31 Jul 2025 16:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1754004013; x=1754608813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaOhr4B8UIBnpyYSF4WgF0h84c6zm8BnVR368xQHyas=;
        b=r2aHeDz6vU1Gwns7CDQe05tzGhLJ+GNBBqBODpx+idcp6F/9I1qjPnsICp1xYODm7Y
         2QEdd7zUPYgiJlddGQceBOKZPrZhkAb40p/o8csHuxpreygvZBhX/y8kNzj3ODgCtlSm
         Psgm+ZI1Y26cV60QNxXQw1X4lk6YaH0But44JWnZWYLavkxEDiDQBXlk5AMtfere7Vf4
         mKljiAzJxqHz/yyczX/qobuQLrkNRWQrerE2nSS5eqjvWLrTvywcMI1TdpJd/1HEKo2N
         ATLbMDyWzuykbCgw5W53AFNNcgKf9pAxQL2ea/V3XgxsnByvWDudEoU/hOSJnTmI57KP
         X6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754004013; x=1754608813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaOhr4B8UIBnpyYSF4WgF0h84c6zm8BnVR368xQHyas=;
        b=Kswb/5btjGCj9AJ5MpLEdKgkN6nhGYUhjuwCVk0UdJSyOO5dDqPSDSuDy17it74ft0
         kpXk9ZBobDkdoAhTrB5hpS3jJAVKFjT9bGS5yoXFA1QnysMgdmBy8D6GafQfHmPZxCba
         N2JO8izWf3l10dVObFeR9p7M14ewQ0DEd+dF3anpeZeQxIFhVAyceHKGxN1kcuCV2rAr
         oVRb+tWVdnqHT8ZlefE4KLUpIxcICuivl/bOSpIxxeD9Bd+gb4k7D57ju1zc4vr1cazT
         3RarEo/ZtzaSf2TRFu7OomAR7ziQSgcbznQvZsWW6La4fDD6wFrKvN7mfRThpnlPcoOT
         2MrA==
X-Forwarded-Encrypted: i=1; AJvYcCXFCnHlt7LZS0eh0mKctQ4OuxnzblLBubxqJTthWJV50/j1qnji1xiGqXrEt7jTbiVL6e0wFKUx+eXnlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUBPuAY+7gPxo2Wi95ZL/L4Fgwd6jpe99WlVd0YSzKBg4enKZI
	4SGMOJNoyn/N9wi5ZdlcVAxx+YdcN04weYy4NQMOA0ha4zPL8eH8VDqufxDdATHKqTM=
X-Gm-Gg: ASbGncsv/PYzXxo2yKSwMPELAK9ypPl4CyOoapbhPzoMjdUNRCjoTeHDkqILaXj/1t3
	bMGkjosM1qwjK8kYbn6kui5XPl3k8dPwiEbIHrG7GwhRUS+yQnlBl1XVZYcYal+nHpMlOd0mEN+
	PbrB3bCWfoH3993ryo5pufLO/0jXT+ZnyInmHswSL44Fun2jRJGU2iTnxTOXHVjFcRW+eFIPb6S
	JO5b9cPus+JDAbI1li6pi/IS+zjFOvze1Oh1Sko2Nx/W/fNqIZvaNSx55cVuYIR4+FKiGl0QmHv
	a6kB6VUEe8eSYZL5WOq28i+/MJJFSGfuhCdROAd2chtuRuGmlQibWSACK2CxfjenMi357XwopoC
	QKN5YSWK8qK+3lSh3kxSXEREezNvFWMbb
X-Google-Smtp-Source: AGHT+IEOx2kNK4TLWda5A9GHVV0DV0Tzu98/FGzwUAzzSt+lpD57+aAlabnlaZr4ia9ZMoripanr5A==
X-Received: by 2002:a17:902:d48d:b0:242:1a:1710 with SMTP id d9443c01a7336-2422a3397e4mr5432705ad.6.1754004013350;
        Thu, 31 Jul 2025 16:20:13 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm5773085a91.7.2025.07.31.16.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:20:12 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 31 Jul 2025 16:19:28 -0700
Subject: [PATCH v19 18/27] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20250731-v5_user_cfi_series-v19-18-09b468d7beab@rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250731_162014_010560_BB18AE53 
X-CRM114-Status: GOOD (  11.28  )
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
