Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC2BC87FCF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Aug 2025 04:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQeMSyZZON8v3i0sYq5Gdj/DESKNWZAy7I9y6h18aiY=; b=qUSvHUiuCZwJWa
	LE8bMSjseX+r2L0ryjJD5lSYn23qhcrmjIOs9Gxaou1cYpNqGze71YSYNKhh4xh0oWyUkuwcSTnb4
	iy3z6WvxX4E4L/LYPIQiH1CF85nZhvLlk8w5HBjCQBJkonddbeltCsLUaEEef6obFDk6Ln//aHcvJ
	Z1edrqr7hTakVV6tEYB/K7LI1IBl8oavCyfcBrOQS2FwpFbqS78THNyg6UsL3Q3exZyB/ekNicdDs
	GKqkMgX35LvRrNTcsKlPH4g1ai8JbSpgDY7liBy4He1PmrcDSJLFH8jPUaD1YP1iqeozjKN1Py/Zs
	MpmTHoCKAMg9uMUxzDPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukbfS-000000046Jm-31oP;
	Sat, 09 Aug 2025 04:58:54 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukbfQ-000000046JN-2KjZ
	for linux-riscv@lists.infradead.org;
	Sat, 09 Aug 2025 04:58:53 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-61592ff5ebbso4354896a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 08 Aug 2025 21:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1754715530; x=1755320330; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=at1zhscRtEKfmJ9O1JFBsDnAS0TG5AN6PuvpSo8Km/o=;
        b=hIhLBIXYTDOyCSXETTVJjYuTGLF4pzCeXMcZW5zdAwMA6RPBat0FNbLL0L81Msyx7h
         AI8EsqZ7dMCF3Zw2OsYiIP/y5hz0A7jLB5hqTRMyM2pDPluXquBxE7P5aSeIK231TLtQ
         1OIzWVAkhJLiOWLNJhA7ddkruf6nJbk3bFIZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754715530; x=1755320330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=at1zhscRtEKfmJ9O1JFBsDnAS0TG5AN6PuvpSo8Km/o=;
        b=lG4QIqVebZ8Qm+ZDzTie8HtmHQTp9vZK4zNSTy9p5r5Ib5IJ9JXu5xQgzR+CzBDQrj
         el9uwBl7okoAlPFN6VUrz9Q2hMhXVGcR58dFSFG0/6h87VgpOVgD876Uy9PTlPQEFzRx
         fLi5sh5b6VAjS+pvu+HbyQl80UkYt9kLphcFMy+MZ1afHS5zgjZKd5Ezs0mx79HcASMR
         1es47WSlEQhBxYnjn83eZCOEmimcmcJS9lMVnirNpiigZN7G+GJ/i7GjFv1C+gt9LBcR
         R9iGKkg9sVvx+gHiYvG/nfEEnuNJ/gk6+o7CdhpTLd6j+7sMXiGzMXUILVuzjjhRgjZB
         t7GA==
X-Gm-Message-State: AOJu0Yy0SsiojMQAFvAuvt+4yho7vi/tHfZmX0nMRF2sljOH6+Blv9pT
	cIr5yZ2SxbpLxe9pMaJ8+Xn3p1s2RHqwocyfeC9J2Y3XUNWk8h+J6mrUhCCP2CqFJEr4dXdE2Kc
	yr36bj3hQKA==
X-Gm-Gg: ASbGncuiQYjO1+yIHLahcdmwIYoPTRXYuE+9vZAdWcK/mzAglrUZq4Z57cEtkevZYNs
	1YTwKH8K6kwpPJeO+DYkIHxe76qgCJ7zddQNs87dDILK24YoiG+EtOP+JRlgWJRFuxIe26Ak84M
	M5B6rnCc9ey+FyCCKijD/wgvm2KU6Ocf+m5gCTW51XGh3MKth56QTN6F72u0a9EEPdR+fz7rJfW
	/RP8+7M323QpNbzjrv8PhWKI3EzQmU5EI1WzZcMDJGT7HxOsPdIcIYDIEok1frs37IcW/MPIfSk
	5zOhT1CYj7iXRljH3HzZgHJHSk9ius28UNESyoWEww+tneEPP9OhhW9ZEaKoneldXJcq8mgJj9D
	NRIdCUvj+js/ome48m4MCEO2gix6J+B+izpZGu7jVT3cfOuhmVvI2HnaavGEHtDoegboXlBsZP3
	6ILlp2XNI=
X-Google-Smtp-Source: AGHT+IGazRVsx73Ln70/PhAh0TUCoPnUHIFycQMP0ZQGyWKtc4rWibsFso/yv1tNp95zYfxyqggbUg==
X-Received: by 2002:a05:6402:5247:b0:615:af6c:3bbf with SMTP id 4fb4d7f45d1cf-617e2b9cb5dmr3799254a12.5.1754715530110;
        Fri, 08 Aug 2025 21:58:50 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7a20sm14567766a12.34.2025.08.08.21.58.49
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 21:58:49 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6154d14d6f6so3360545a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Aug 2025 21:58:49 -0700 (PDT)
X-Received: by 2002:a05:6402:5251:b0:611:f4b2:379c with SMTP id
 4fb4d7f45d1cf-617e56474a7mr3487462a12.20.1754715528810; Fri, 08 Aug 2025
 21:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-7755CB81-B0C6-42D3-82B5-CE37669F176C@palmerdabbelt-mac>
In-Reply-To: <mhng-7755CB81-B0C6-42D3-82B5-CE37669F176C@palmerdabbelt-mac>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 9 Aug 2025 07:58:32 +0300
X-Gmail-Original-Message-ID: <CAHk-=wjLCqUUWd8DzG+xsOn-yVL0Q=O35U9D6j6=2DUWX52ghQ@mail.gmail.com>
X-Gm-Features: Ac12FXzevhMtU9rC4l8wI5Rp-sBEnJ_jj9Gsv-onhS1DzwjKacJE8hz2OkVlG0g
Message-ID: <CAHk-=wjLCqUUWd8DzG+xsOn-yVL0Q=O35U9D6j6=2DUWX52ghQ@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 6.17 Merge Window, Part 1
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_215852_606008_C2BB4F8B 
X-CRM114-Status: GOOD (  15.04  )
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

On Fri, 8 Aug 2025 at 21:19, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> RISC-V Patches for the 6.17 Merge Window, Part 1

No. This is garbage and it came in too late. I asked for early pull
requests because I'm traveling, and if you can't follow that rule, at
least make the pull requests *good*.

This adds various garbage that isn't RISC-V specific to generic header files.

And by "garbage" I really mean it. This is stuff that nobody should
ever send me, never mind late in a merge window.

Like this crazy and pointless make_u32_from_two_u16() "helper".

That thing makes the world actively a worse place to live. It's
useless garbage that makes any user incomprehensible, and actively
*WORSE* than not using that stupid "helper".

If you write the code out as "(a << 16) + b", you know what it does
and which is the high word. Maybe you need to add a cast to make sure
that 'b' doesn't have high bits that pollutes the end result, so maybe
it's not going to be exactly _pretty_, but it's not going to be wrong
and incomprehensible either.

In contrast, if you write make_u32_from_two_u16(a,b) you have not a
f%^5ing clue what the word order is. IOW, you just made things
*WORSE*, and you added that "helper" to a generic non-RISC-V file
where people are apparently supposed to use it to make *other* code
worse too.

So no. Things like this need to get bent. It does not go into generic
header files, and it damn well does not happen late in the merge
window.

You're on notice: no more late pull requests, and no more garbage
outside the RISC-V tree.

Now, I would *hope* there's no garbage inside the RISC-V parts, but
that's your choice. But things in generic headers do not get polluted
by crazy stuff. And sending a big pull request the day before the
merge window closes in the hope that I'm too busy to care is not a
winning strategy.

So you get to try again in 6.18. EARLY in the that merge window. And
without the garbage.

                Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
