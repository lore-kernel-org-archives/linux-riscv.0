Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501B2C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Apr 2022 04:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7p2py7567sh5qjKJ/hZWoSjqH1gAGJOuipmZ5P9NHI=; b=CBi/HXRO1yqxLY
	CrCLVLNOqdqoeVumVt7Hr6qPLewqVxeI3fG9RW5d3jlo0ebcAkz9UM4Y5pKxGbxChoek7Urxf1LJL
	CW8dAKElzCNMm/EltD35zVUaTdffG2I0xpSyMFfMRdsvGWqxcpXPyJAP4Mpzv1PwcSStnnAH2rtFa
	4FrSuh0B8rl4kGcWMpIV6dTC4SG793upT6hLMNqNKMnIxSoceQcYc5kdjf7DkGHyjEW1e5v9N6VMq
	otjzTNmHjm6SfDB6aaZJ7DisZHRX8SqqO9Bo9rmKNutrW8l55dUH57e9d8EovV5SvCITOOvggmt4U
	PU5Yjo8+WyQSKBM6Fzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd2UQ-001wq5-7b; Sat, 09 Apr 2022 04:14:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd2UM-001woq-5y
 for linux-riscv@lists.infradead.org; Sat, 09 Apr 2022 04:14:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 05CB9B82DEE;
 Sat,  9 Apr 2022 04:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560CCC385A4;
 Sat,  9 Apr 2022 04:14:11 +0000 (UTC)
Message-ID: <3146e4cc-71b4-126f-1d0c-9da2bb8282ca@linux-m68k.org>
Date: Sat, 9 Apr 2022 14:14:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PULL] remove arch/h8300
Content-Language: en-US
To: Rob Landley <rob@landley.net>, Daniel Palmer <daniel@0x0f.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 "moderated list:H8/300 ARCHITECTURE"
 <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <6a38e8b8-7ccc-afba-6826-cb6e4f92af83@linux-m68k.org>
 <CAFr9PXkk=8HOxPwVvFRzqHZteRREWxSOOcdjrcOPe0d=9AW2yQ@mail.gmail.com>
 <5b7687d4-8ba5-ad79-8a74-33fc2496a3db@linux-m68k.org>
 <8f9be869-7244-d92a-4683-f9c53da97755@landley.net>
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <8f9be869-7244-d92a-4683-f9c53da97755@landley.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_211418_643944_9BA7195F 
X-CRM114-Status: GOOD (  24.29  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 9/4/22 10:24, Rob Landley wrote:
> On 4/5/22 08:07, Greg Ungerer wrote:
>> On 5/4/22 13:23, Daniel Palmer wrote:
>>> On Mon, 4 Apr 2022 at 22:42, Greg Ungerer <gerg@linux-m68k.org> wrote:
>>>> But we could consider the Dragonball support for removal. I keep it compiling,
>>>> but I don't use it and can't test that it actually works. Not sure that it
>>>> has been used for a very long time now. And I didn't even realize but its
>>>> serial driver (68328serial.c) was removed in 2015. No one seems too have
>>>> noticed and complained.
>>>
>>> I noticed this and I am working on fixing it up for a new Dragonball
>>> homebrew machine.
>>> I'm trying to add a 68000 machine to QEMU to make the development
>>> easier because I'm currently waiting an hour or more for a kernel to
>>> load over serial.
>>> It might be a few months.
> 
> I've been booting Linux on qemu-system-m68k -M q800 for a couple years now? (The
> CROSS=m68k target of mkroot in toybox?)
> 
> # cat /proc/cpuinfo
> CPU:		68040
> MMU:		68040
> FPU:		68040
> Clocking:	1261.9MHz
> BogoMips:	841.31
> Calibration:	4206592 loops
> 
> It certainly THINKS it's got m68000...
> 
> $ qemu-system-m68k -cpu ?
> cfv4e
> m5206
> m5208
> m68000
> m68010
> m68020
> m68030
> m68040
> m68060
> any
> 
> (I'd love to get an m68k nommu system working but never sat down and worked out
> a kernel .config qemu agreed to run, plus compiler and libc. Musl added m68k
> support but I dunno if that includes coldfire?)

I run and test all development rc and release kernels on the qemu m5208 target
(that is a ColdFire v2 nommu core, the "-machine mcf5208evb" qemu target).
Of course I test real hardware as well :-)

The kernel's m5208evb_defconfig works for qemu. Though you will need to sort
out a user space to get to a login/shell. I mostly use the last uClibc for
that.



>>> It looked like 68328serial.c was removed because someone tried to
>>> clean it up and it was decided that no one was using it and it was
>>> best to delete it.
>>> My plan was to at some point send a series to fix up the issues with
>>> the Dragonball support, revert removing the serial driver and adding
>>> the patch that cleaned it up.
>>
>> Nice. I will leave all the 68000/68328 code alone for now then.
> 
> The q800 config uses CONFIG_SERIAL_PMACZILOG. Seems to work fine?

Sure, but the Dragonball are a 68328 SoC family. Its serial hardware block
is different, needs a different driver. At least all the ColdFire parts
use the same internal hardware serial block.

Regards
Greg



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
