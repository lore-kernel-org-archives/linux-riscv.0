Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BAAC7EE30
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Jun 2025 10:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gqBjJL+H1E2L8caUwzY61/rRA/0zqLL76EkWzeuQ/Ms=; b=oggD2iIko8aON6
	SGrGYqDvEPuSCf9votkS/C2RX8j7KKkaALkTTc433OEUriJlBjwGgc+9zdWopezKY+UwCO/sVzfHz
	R1KKADOPW3gCIRc1wN96nX2ai8dQDYhDIV7x3rN9CAMvtS33zAbttrlEkawjCHENOa88EPP1GyVQu
	gssPpkeuf8UE512N56ic8e0qFKwFL0/11H06s8A3usFetEoSqSM2PkFjFNY+CnU9gKJ/qOGuGb7KF
	QdXPecX2HX6kCYun86SE5X2AOvERGU+VJcXkyR6aJ51y//NKMZx/PhTkn7Mgc66VHijKebYUBtklk
	7rLpYMo3iQBdUVZtk10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVpQs-000000009Rh-3R5R;
	Sun, 29 Jun 2025 10:38:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVpQq-000000009RM-0wnx
	for linux-riscv@lists.infradead.org;
	Sun, 29 Jun 2025 10:38:45 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a582e09144so824679f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jun 2025 03:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751193522; x=1751798322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1gaJEPn6+FMoWhU8f8CNz5ykYo4nCgXjpfeshekYKU=;
        b=gCqaV9H/uYgG2Yyyh28kmHLSvly+hdAAO//4adLrOxddQks8JqRLx3i3xPZI9xnahK
         xra1gQYBSoA63dQUm6hy7UxjWQlbijGhX6TVElILgUCzMFpf27t4KmdO8i5AEPcsssir
         3Sgd1G++Lq5InCMqDrnf4SUg2D/Nnm5Xyuw4nH9jhzG+HeNBh8QUHh/z9MZ9BC5KNpOs
         5XKw0JS0ilCfE/e1SdXJcHElNk0aneBryJL1HIcir3GbUTB5NBCqUa69M/xw+n4iYTai
         rmHa05y0CGs09nID/HCrbHSGbUgGfDIl7trdoXdMbSr8Bu5cZaryiAzcXBFgmzTmdFoD
         tTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751193522; x=1751798322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1gaJEPn6+FMoWhU8f8CNz5ykYo4nCgXjpfeshekYKU=;
        b=CPxXP+8qwLFE7RITCrHQHlYeC2yGK9yGg578SDyrTziKbkJK1ErCdhUPJ2dZzRugj+
         pZCDS44NIeUd2uhc4Z33LRtsGBGj+4vs3pAUOm2xizv6D8/zwNLttwxQIhJ1VlthdF1O
         u0uuaQIlUXX4+K9dTPFdgA3H8urmU3cuyyd4QQG5pTPRsoCIB5SN7gxyu3reF4i/4YqK
         ADWwjvcF4rHzbbn4lzXuLuzayA5jeMgZBs5u+985gHaPelNf+TgIQK8yCXUzX3hnKh3/
         18sVGGQpmt5oN8Xclcv8GJ1djck6jmUjfFGQmCw7PJsaiomv+79oMhD86JtbQxCsckpI
         WtLA==
X-Forwarded-Encrypted: i=1; AJvYcCX39U215V2arSm4CloadVITjjMeJneBO4IjaiofmZsoN6sniD92Pqs6OJMLtqc0WrDwR6JD/xGHm2974A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2pmrYl/RcN6Bbc2QIxtRJBv66ZKHixguvo4uJdO9Q1G6d2p/1
	Nl2pvArAKLOXOh6ukZAiD+CEjts+xSulwWoZAFX/G5UQMAbDgTPIjftL
X-Gm-Gg: ASbGncv2VByC/cjHPXYvNwxRbKedVV2wi7xoMePrx96uMGKlgQkbp4kAjGzu68/SZgf
	BdFDLBzJ8rENMsvMjuFZreo68M3Kq/XyUpCox8B0DfUmYXD3TOFM0rKAPM+RiekG4FaW+tT8506
	SjERwNVrK8k+PU6zT0Y7gZsIMGNfLmB3JwfK28ZC08ont/KRlfZ3Z2inFCEWj5c9NHpHnukL9XV
	ZQ9h2SRdQU4sEqRh/njjkw5z7te7MYC3NBz8Yg9wqbHF4+wepQnYgPs8bPx7lFU8vA/+Wa65Jke
	IlChMnZlkkbMOpO4dc31IHn9rEnKBNTRMce+5ruGgjNwp3EglM2IKnzoJKznnUnDUCO9fsGCRc1
	2ia8D/zg99lnwZkTIig==
X-Google-Smtp-Source: AGHT+IEdh0HApkzZdnPXw3HFe7Fd77TFNlHLJgOlIBuKyKHExXHiW7W73K/qKPWuNfigD6vS5J8l8g==
X-Received: by 2002:a05:6000:1786:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3a8f577fdf7mr8560588f8f.1.1751193522433;
        Sun, 29 Jun 2025 03:38:42 -0700 (PDT)
Received: from pumpkin (host-92-21-58-28.as13285.net. [92.21.58.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab15sm7550537f8f.33.2025.06.29.03.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 03:38:42 -0700 (PDT)
Date: Sun, 29 Jun 2025 11:38:40 +0100
From: David Laight <david.laight.linux@gmail.com>
To: cp0613@linux.alibaba.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, arnd@arndb.de,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux@rasmusvillemoes.dk,
 palmer@dabbelt.com, paul.walmsley@sifive.com, yury.norov@gmail.com
Subject: Re: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb
 extension
Message-ID: <20250629113840.2f319956@pumpkin>
In-Reply-To: <20250628120816.1679-1-cp0613@linux.alibaba.com>
References: <20250625170234.29605eed@pumpkin>
	<20250628120816.1679-1-cp0613@linux.alibaba.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_033844_290373_33F0A239 
X-CRM114-Status: GOOD (  17.14  )
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

On Sat, 28 Jun 2025 20:08:16 +0800
cp0613@linux.alibaba.com wrote:

> On Wed, 25 Jun 2025 17:02:34 +0100, david.laight.linux@gmail.com wrote:
> 
> > Is it even a gain in the zbb case?
> > The "rorw" is only ever going to help full word rotates.
> > Here you might as well do ((word << 8 | word) >> shift).
> > 
> > For "rol8" you'd need ((word << 24 | word) 'rol' shift).
> > I still bet the generic code is faster (but see below).
> > 
> > Same for 16bit rotates.
> > 
> > Actually the generic version is (probably) horrid for everything except x86.
> > See https://www.godbolt.org/z/xTxYj57To  
> 
> Thanks for your suggestion, this website is very inspiring. According to the
> results, the generic version is indeed the most friendly to x86. I think this
> is also a reason why other architectures should be optimized. Take the riscv64
> ror32 implementation as an example, compare the number of assembly instructions
> of the following two functions:
> ```
> u32 zbb_opt_ror32(u32 word, unsigned int shift)
> {
> 	asm volatile(
> 		".option push\n"
> 		".option arch,+zbb\n"
> 		"rorw %0, %1, %2\n"
> 		".option pop\n"
> 		: "=r" (word) : "r" (word), "r" (shift) :);
> 
> 	return word;
> }
> 
> u16 generic_ror32(u16 word, unsigned int shift)
> {
> 	return (word >> (shift & 31)) | (word << ((-shift) & 31));
> }
> ```
> Their disassembly is:
> ```
> zbb_opt_ror32:
> <+0>:     addi    sp,sp,-16
> <+2>:     sd      s0,0(sp)
> <+4>:     sd      ra,8(sp)
> <+6>:     addi    s0,sp,16
> <+8>:     .insn   4, 0x60b5553b
> <+12>:    ld      ra,8(sp)
> <+14>:    ld      s0,0(sp)
> <+16>:    sext.w  a0,a0
> <+18>:    addi    sp,sp,16
> <+20>:    ret
> 
> generic_ror32:
> <+0>:     addi    sp,sp,-16
> <+2>:     andi    a1,a1,31
> <+4>:     sd      s0,0(sp)
> <+6>:     sd      ra,8(sp)
> <+8>:     addi    s0,sp,16
> <+10>:    negw    a5,a1
> <+14>:    sllw    a5,a0,a5
> <+18>:    ld      ra,8(sp)
> <+20>:    ld      s0,0(sp)
> <+22>:    srlw    a0,a0,a1
> <+26>:    or      a0,a0,a5
> <+28>:    slli    a0,a0,0x30
> <+30>:    srli    a0,a0,0x30
> <+32>:    addi    sp,sp,16
> <+34>:    ret
> ```
> It can be found that the zbb optimized implementation uses fewer instructions,
> even for 16-bit and 8-bit data.

Far too many register spills to stack.
I think you've forgotten to specify -O2

	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
