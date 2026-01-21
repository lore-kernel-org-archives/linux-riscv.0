Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BA7C44503
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 10:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wce/MI+hEEiUCdw/GUzvUdmp+2vd9/wYaOAWwMuViRA=; b=fWQBQz5GxPcRVg
	bYWbCOhXS8th2Uek1AiUAx/AdsJeM4o6R0lBY4VWyzjzbF2kPSqeZbZBKz5hxErDiLwQtx+o+Bj4E
	u0cDMO0SwP4Yd8bn5x7B8WrxzC7zKseDvIz/ZGSCVy+NHRxs778rjCfF96FiWJaiWqS0MfQWcmTx8
	OFwZiTFohtET6CA6QtAxCatfNN0KDDURyqOpzhgrnZxko6VdZnWKE+yIC5Zx6ffn3US7MUqxriwuq
	AzOMgQuZ15ynXDCrLlD2cqPA0tjQ1zgeTzwaSH32HxUxGs5ISE+FMf23fOSf2YDuD77iDhCxD8P0H
	+Nu37MKH/rkYanfkvPTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVtt-00000005JLm-051S;
	Wed, 21 Jan 2026 10:57:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVtp-00000005JLR-2ASj
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 10:57:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4801bc32725so32609305e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 02:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768993039; x=1769597839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVe0Qk3VMjV2txWtY8q1b+FCjHEWppjlIBEVCNldeh4=;
        b=gs+oRIPge7IV/OwMpOqYUUOiz/LRmO350yQaU8x3wsXp1DB2VEPwS6b0448HXb0ahM
         X0Sw8QYPpmb8Fc4YKwWZRxGzuoVQJwkKnSwUhte82o28kmz+bsDj0tQiM7hQUD8AmZUO
         6FVsJpQBJsf9VKBPCNUbBd60C6DBeQZ7+zVgWiB9xMa53wDplL/vcYHTIGbvvurcR2qd
         foPNctlPOlPvlNC9ItbxncpV0e7MvUzd9h/W10Pd2nMhDF/ezXIq0gtg8s/kI8XW+bJI
         5hC6Hy2xrTAyEWJE/5Ld/OlS4is+VryicCvCCKLUHr2yXrQwtCHYn1vwKJbv0GcjZ7/7
         7c5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768993039; x=1769597839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EVe0Qk3VMjV2txWtY8q1b+FCjHEWppjlIBEVCNldeh4=;
        b=byELaDcNUJdTaurhhhJZFHl9yBN/x9efx+Uz/JQLXtun/V9NcFWAVr1AxIU4SG7anC
         YfGO8xWT2Pbtbp+3kTPRVFg2/piflxfnUTprVZl//NC3I+6WjmyGtRP5NExjkk2JXYMN
         1K7jF+XcSYTVoXTNpNWYst7h/so2QjPhnH7ulDZERmHg1+HcgbC0T6j5mshgZd9X6+NC
         sW2haqcbGKnUGMvFRpNjvI2UJ7yhHnKXq3eu/FNq1xaLhfgKXXMSNryOoh5LhTKeUT3g
         HwCiAqI6OyHlYJKR3r4IfXTJzQmRbn+m4feRDyXMYIAhGk92Z37hLTYQHBOizulM+Xt+
         HAYg==
X-Forwarded-Encrypted: i=1; AJvYcCX2NijDicuafbzji/4vdKvZIovVA9iUCBWrqcFR5jpwgE5bTdPhG5ydZ5O8EZzqKw8SQvzIfdr2pASdow==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBcJokic8u/6Zq9XarSDan4vWJf+YPzr9mzl7sKvn9KZuBWxFB
	ZrkhRMnSsmQkkL7BEbeTWgCvgWSCsHuhfPnGB+VsH1PtXF/Pl/DWrlws
X-Gm-Gg: AZuq6aKj8NQ9AQs6Yub2VxSsFFkfpSXPsNGwVS/iuQujwf88o7m3F18sI8eQGL4dlXe
	3OxmVAdSZ/KNPwBkaVs6Rwq892CL4J+Va6HjOihrjB06zs1GyWoiYfNscBoO6bu+BOuUr0P/SQG
	4H2obJOt3XuQPlcs1J8dai+awtpjz1cJUwKVViHs7hPZWr755tlIwHYbXbwa3s2piVUIKN67eBk
	M7o+/lOJpaCsCjgnIMol3rYHEh1rjPesYukiJ/P98ChmQuSZV2CiHswqG4kJZq0aB2gap1HiDuh
	wHPY/BhDzcauPy4p7WKAQDHhMSeGeZqstvDsGv3Rn8ggfZIqx3i8/STtArEp1+Xoky1WvMdulEX
	wfyjK0owFBMPovCjLA89va1liLe2I2DH0PZbmalag7IDzBq9z7BurUdAspm9HFfLz+TEAxvqeRa
	us6yETGDxJpQyy6Bu1srFbwqb0wgZZqxGzam8Jwsa8MuFe9Yvf3qGVKFxiduUR668=
X-Received: by 2002:a05:600c:34d6:b0:47e:e20e:bbb7 with SMTP id 5b1f17b1804b1-4801eb1080amr246838145e9.25.1768993039340;
        Wed, 21 Jan 2026 02:57:19 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4802dc90068sm259182585e9.7.2026.01.21.02.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 02:57:19 -0800 (PST)
Date: Wed, 21 Jan 2026 10:57:17 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Feng Jiang <jiangfeng@kylinos.cn>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, akpm@linux-foundation.org,
 kees@kernel.org, andy@kernel.org, ebiggers@kernel.org,
 martin.petersen@oracle.com, ardb@kernel.org, charlie@rivosinc.com,
 conor.dooley@microchip.com, ajones@ventanamicro.com,
 linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 0/8] riscv: optimize string functions and add kunit
 tests
Message-ID: <20260121105717.04853c5d@pumpkin>
In-Reply-To: <CAHp75Ve_pyVm430FL=aEAw1Cnf-92T3Y23qh7pEOaMYMp9iyvw@mail.gmail.com>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
	<aW8whGcAR0x6FSRJ@smile.fi.intel.com>
	<691a0183-6f41-4956-82da-abb69a449919@kylinos.cn>
	<CAHp75Ve_pyVm430FL=aEAw1Cnf-92T3Y23qh7pEOaMYMp9iyvw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_025721_576464_D25CFB28 
X-CRM114-Status: GOOD (  12.61  )
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

On Wed, 21 Jan 2026 09:01:29 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

...
> I understand that. My point is if we move the generic implementation
> to use word-at-a-time technique the difference should not go 4x,
> right? Perhaps 1.5x or so. I believe this will be a very useful
> exercise.

I posted a version earlier.

After the initial setup (aligning the base address and loading
some constants the loop on x86-64 is 7 instructions (should be similar
for other architectures).
I think it will execute in 4 clocks.
You then need to find the byte in the word, easy enough on LE with
a fast ffs() - but harder otherwise.
The real problem is the cost for short strings.
Like memcpy() you need a hint from the source of the 'expected' length
(as a compile-time constant) to compile-time select the algorithm.

OTOH:
	for (;;) {
		if (!ptr[0]) return ptr - start;
		ptr += 2;
	while (ptr[-1]);
	return ptr - start - 1;
has two 'load+compare+branch' and one add per loop.
On x86 that might all overlap and give you a two-clock loop
that checks one byte every clock - faster than 'rep scasb'.
(You can get a two clock loop, but not a 1 clock loop.)
I think unrolling further will make little/no difference.

The break-even for the word-at-a-time version is probably at least 64
characters.

	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
