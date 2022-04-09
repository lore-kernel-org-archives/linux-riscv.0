Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7A2C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Apr 2022 03:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQYCkmJ/r1B112gSDNbvWmRMEWfJAlrLHBcc85vQLQs=; b=WMZaMK1LjJlkRD
	Yy2f6Uem/Yru1kQG1lvJXhVAo+La98f4QhRYdC1TqblwTKGoTXSoi+8Y9hKrUQJgdjjOhVNOt7DLT
	BAS40uUTAQSErQZBYg8bYpeVROCYmKMNUTtjlBe5lkkc0nTix6CHRPLeizmUb6el35jx9nAUYSnbq
	4dp0q1Z6c6gspSU30m+muYX2hJ9tAuwfrfV25QNAAn71ziTp9SOlO7ZszpiyJgI03zbYbPdY5Jfsb
	nBvgJyhBelj4uOH+0Vom493C7zEUI3a3KOtGYNyqDeqJhlf3xtBaWVcWQdOk9i1qjPqvPIbmn4hWd
	u8YoE/xW7HESxmB/iJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd1v8-001saX-NV; Sat, 09 Apr 2022 03:37:54 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd1v5-001sZQ-1Z
 for linux-riscv@lists.infradead.org; Sat, 09 Apr 2022 03:37:52 +0000
Received: by mail-qv1-xf35.google.com with SMTP id a5so8979769qvx.1
 for <linux-riscv@lists.infradead.org>; Fri, 08 Apr 2022 20:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZPMboYNoi1Tq9s1o8EjnHiPJyfdvsa8XEDzwclG05nU=;
 b=ZSBY1RFuqn8ZwYn/HjI0d5AJ0GZqGT3Hv1VZHxXSu+MglJWtwv8mjtrMn7Wh8GSv0y
 C4FRuIwfEb9kASwqWhWnwoVm65oVzbnB2dRJSLcgX9+3EAkDZRixb2gtkR1DSWR5D82u
 oZl1VV9b4yJeD07+AStdFPt1TKOpNhUvl3f8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZPMboYNoi1Tq9s1o8EjnHiPJyfdvsa8XEDzwclG05nU=;
 b=xJO4z7d4woeI4VBdRjQB0dZgfO9hkzTfHLRJh/H/BAWM85oiWUAfN3DonNWSxV9CdJ
 833l1dCeAASSkBZFM1IFFEFvE1GfgD3/fcDm6oRH6LSLDDs4xRn26UXhniet5uVyUDZU
 SujWVgxJJvht4m/EwnVlmDnPfxh/sUv+qM3fTObxxH9JWpWcZeuSRaF4tSSjNMFo2UPL
 PP+PCzQy7mF3H2IHQ7rODidFbJBJf97feR1NQuRE/L8IjkmxY0XDq3PXDCSWPY7eYdC4
 pi6RNquTBox/JGRGi/I51qHI89Nr4pPcHBUSYgx/1rr/0vhHvg2+JauDeH0hKSowkLKy
 Jt9g==
X-Gm-Message-State: AOAM5332ABQvNcImYXJWpUUACTpABTDedvz8iDXNPer/Z1oOjqKn/aA1
 ExDILGCnb2hdwNFzXzY3aPMdHfDjdCS4h/bAgrFnNg==
X-Google-Smtp-Source: ABdhPJx2skHaFGBmVPuWh026ZrD9+x9YgR9mbH2KjPOfAg+qXm2Dy1h2UjyHmuuULVBn29BLaloUhjCyxN7D3zqhYTA=
X-Received: by 2002:ad4:5743:0:b0:441:6da8:dc5e with SMTP id
 q3-20020ad45743000000b004416da8dc5emr18980082qvx.13.1649475467635; Fri, 08
 Apr 2022 20:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <6a38e8b8-7ccc-afba-6826-cb6e4f92af83@linux-m68k.org>
 <CAFr9PXkk=8HOxPwVvFRzqHZteRREWxSOOcdjrcOPe0d=9AW2yQ@mail.gmail.com>
 <5b7687d4-8ba5-ad79-8a74-33fc2496a3db@linux-m68k.org>
 <8f9be869-7244-d92a-4683-f9c53da97755@landley.net>
In-Reply-To: <8f9be869-7244-d92a-4683-f9c53da97755@landley.net>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 9 Apr 2022 12:37:36 +0900
Message-ID: <CAFr9PXmMzFa_iD1iECi7S=DvpMRKgLu=7P+=2RmbEWtqczjduA@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To: Rob Landley <rob@landley.net>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christoph Hellwig <hch@infradead.org>,
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
X-CRM114-CacheID: sfid-20220408_203751_112481_0787E778 
X-CRM114-Status: GOOD (  21.29  )
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

Hi Rob,

On Sat, 9 Apr 2022 at 09:20, Rob Landley <rob@landley.net> wrote:

> I've been booting Linux on qemu-system-m68k -M q800 for a couple years now? (The
> CROSS=m68k target of mkroot in toybox?)
>
> # cat /proc/cpuinfo
> CPU:            68040
> MMU:            68040
> FPU:            68040
> Clocking:       1261.9MHz
> BogoMips:       841.31
> Calibration:    4206592 loops
>
> It certainly THINKS it's got m68000...

I couldn't work out how to define a mc68000 machine on the command line alone.
There might be a way but it didn't seem like it.

> (I'd love to get an m68k nommu system working but never sat down and worked out
> a kernel .config qemu agreed to run, plus compiler and libc. Musl added m68k
> support but I dunno if that includes coldfire?)

Once I get QEMU to emulate a simple mc68000 system my plan is to get
u-boot going (I managed to get it to build for plain mc68000 but I
didn't get far enough with the QEMU bit to try booting it yet) then
put together the buildroot configs to build qemu, u-boot, a kernel and
rootfs that just work. Then I can hook it into CI and have it build
and boot test automatically and it won't bit rot anymore.

> >> It looked like 68328serial.c was removed because someone tried to
> >> clean it up and it was decided that no one was using it and it was
> >> best to delete it.
> >> My plan was to at some point send a series to fix up the issues with
> >> the Dragonball support, revert removing the serial driver and adding
> >> the patch that cleaned it up.
> >
> > Nice. I will leave all the 68000/68328 code alone for now then.
>
> The q800 config uses CONFIG_SERIAL_PMACZILOG. Seems to work fine?

Dragonball uses a weird UART that doesn't seem to be compatible with
any of the common ones so it needs its own driver.

Cheers,

Daniel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
