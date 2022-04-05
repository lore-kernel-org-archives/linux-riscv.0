Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E73C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 03:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+8s6DvgOI1L/qTEcwLjGleeIvOsQ7wudVfL6IReTLI=; b=HQwy1E+f/jAHKO
	4EWNikOV1k1PTUuRNas06Iy7BgmxefmzXrzggEC09YEvLilJpTjURNgry+5R33UzJkv3GR8K9Q8X4
	3mxF8IxYtSTPesGA0gsM5m23zEz5oH4erK1SOFK4bZ6ZMKGFtD2r544vlHYjfYDo57RKHr97q4jXY
	iWgKkNXwhncYN3MwVKmTiCpDFkf6TwhcN0fXl0jmY7xsYhDExwjnu77pz8vQSTNovhUJu47u7C/ok
	WYwbSumcd/BuFrn3tpPvOWAULoYBeOhye5t9oYqzH5To4IINxZpQkflcurPwVNRfdiNOSxaAWMZA8
	iuGC0OwQmjbEG4J8Kjew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbZnP-00Gzks-Oi; Tue, 05 Apr 2022 03:23:55 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbZnM-00Gzja-Ud
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 03:23:54 +0000
Received: by mail-qt1-x835.google.com with SMTP id b18so9427752qtk.13
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 20:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qApr9GrihVbOuWIYXrsrRfMhvE7Z9/nCtDMkcpQr1HA=;
 b=OUL2erKbptx3OSEXn+FNiSDEclLx26+4Q9s4Yc0HFFg2NowwbEnAZPwFjtfFoQXFSD
 HGr3WZcWj0bwCYYGq+VQH3lNm19kHiCLCcgHpy3MWFLUkJdqXzzsA6T3FCzHLz4UT2GP
 u+NVUKCBFvqmXaoDydp6uOSzgkS3i+tqmaGAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qApr9GrihVbOuWIYXrsrRfMhvE7Z9/nCtDMkcpQr1HA=;
 b=0Pfs6QG+N9EH5BGN/dcPZA8KTeNLkY6kFuK17OFa03qXhRF3MBYwNDpxxzOqbj+39Q
 I3kio6fQ+sBsd7j3keQ903ZGR/V4G17Vf1x623OxRhABpSUpmQaXZZJaTY/6UqcMiach
 KZsgUnZwBKhmNW/2//CK/xfTM9CvsYWAWz48+l99RsYGa9GIqOKGL2Icftc1lgpsnsN5
 vb/yx8bZyt9llu4BCeR5v8l0AgTzkqLtGpsgnP1xbuqKDfPc72EDgH18OjKpm6F8FJMR
 Z61mRyu3DL4Vvq9usRHL6bynU6Lg7ZuFW0859I3jRR6zY5ISAHBLRkHp6NBpg691Mvjs
 83GQ==
X-Gm-Message-State: AOAM533BbYe9vCldWmyI+7CZBui1IsK3V6QaDfT7TEVogRdRARYBltI6
 ISm5PtJqHGuX8sZybPmdEWiAMFUoBCulp28hsjPiQw==
X-Google-Smtp-Source: ABdhPJwynqhZqs8C04npxIC6XvYVeW6E//MMWg7Ai+dGctLoCRwKSkiHu3j/uCEqqA2vWJ4U1/uhkuomufhsrlhjYio=
X-Received: by 2002:a05:622a:110c:b0:2e1:fe6b:2f26 with SMTP id
 e12-20020a05622a110c00b002e1fe6b2f26mr1251546qty.201.1649129029903; Mon, 04
 Apr 2022 20:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <6a38e8b8-7ccc-afba-6826-cb6e4f92af83@linux-m68k.org>
In-Reply-To: <6a38e8b8-7ccc-afba-6826-cb6e4f92af83@linux-m68k.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 5 Apr 2022 12:23:39 +0900
Message-ID: <CAFr9PXkk=8HOxPwVvFRzqHZteRREWxSOOcdjrcOPe0d=9AW2yQ@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_202353_238602_21774AF9 
X-CRM114-Status: GOOD (  16.98  )
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

Hi Greg,

On Mon, 4 Apr 2022 at 22:42, Greg Ungerer <gerg@linux-m68k.org> wrote:
> But we could consider the Dragonball support for removal. I keep it compiling,
> but I don't use it and can't test that it actually works. Not sure that it
> has been used for a very long time now. And I didn't even realize but its
> serial driver (68328serial.c) was removed in 2015. No one seems too have
> noticed and complained.

I noticed this and I am working on fixing it up for a new Dragonball
homebrew machine.
I'm trying to add a 68000 machine to QEMU to make the development
easier because I'm currently waiting an hour or more for a kernel to
load over serial.
It might be a few months.

It looked like 68328serial.c was removed because someone tried to
clean it up and it was decided that no one was using it and it was
best to delete it.
My plan was to at some point send a series to fix up the issues with
the Dragonball support, revert removing the serial driver and adding
the patch that cleaned it up.

Cheers,

Daniel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
