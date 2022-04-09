Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D6FC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Apr 2022 04:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPvO2A25/PG2iCvjy5cdTkRTIgA7bODWH1ngta5hhlw=; b=GlKJGahk49NCdz
	eDJWhEOdIbS1SMXm8FTOs+3ySzzC/YTBQJZIqIzBKCBHzE0alvNudUQ7fdh6FTixtFdoN9+PZN/4Z
	SV74BuEGs5iHdQ6xBMnafJTwITqW9CdWr+fKbN2dKXyLRVpVVXRCrakq/S+1dL2icDBjlMzLILt4n
	OdGJA8iWGYUk24LPxp6HBim6Fn6xQ9pUFdi7rsl27dtCOEhxCCAzInLEzbmr/5BRWBTe8iqAXzapU
	UbDvOtqINKMt1IS4arB5fkzcCUJb5MBw59rdXokyZv5wpAGVyfyM4Q9Ykg5Oc/xNYQPw8zKY1GxZj
	QYSwnF6Xm+oO8oeQ2gUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd2Yw-001xJ4-Oj; Sat, 09 Apr 2022 04:19:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd2Yp-001xH0-Br
 for linux-riscv@lists.infradead.org; Sat, 09 Apr 2022 04:18:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B1DCC60B40;
 Sat,  9 Apr 2022 04:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662C1C385A8;
 Sat,  9 Apr 2022 04:18:50 +0000 (UTC)
Message-ID: <147dc6cc-1fbb-558f-8e6d-29d4327d54b4@linux-m68k.org>
Date: Sat, 9 Apr 2022 14:18:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PULL] remove arch/h8300
Content-Language: en-US
To: Finn Thain <fthain@linux-m68k.org>, Rob Landley <rob@landley.net>
Cc: Daniel Palmer <daniel@0x0f.com>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@infradead.org>,
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
 <3d5cf48c-94f1-2948-1683-4a2a87f4c697@linux-m68k.org>
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <3d5cf48c-94f1-2948-1683-4a2a87f4c697@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_211855_551300_A6A4B1D2 
X-CRM114-Status: GOOD (  21.38  )
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


On 9/4/22 11:59, Finn Thain wrote:
> On Fri, 8 Apr 2022, Rob Landley wrote:
> 
>> On 4/5/22 08:07, Greg Ungerer wrote:
>>> On 5/4/22 13:23, Daniel Palmer wrote:
>>>> On Mon, 4 Apr 2022 at 22:42, Greg Ungerer <gerg@linux-m68k.org> wrote:
>>>>> But we could consider the Dragonball support for removal. I keep it
>>>>> compiling, but I don't use it and can't test that it actually works.
>>>>> Not sure that it has been used for a very long time now. And I
>>>>> didn't even realize but its serial driver (68328serial.c) was
>>>>> removed in 2015. No one seems too have noticed and complained.
>>>>
>>>> I noticed this and I am working on fixing it up for a new Dragonball
>>>> homebrew machine. I'm trying to add a 68000 machine to QEMU to make
>>>> the development easier because I'm currently waiting an hour or more
>>>> for a kernel to load over serial. It might be a few months.
>>
>> I've been booting Linux on qemu-system-m68k -M q800 for a couple years
>> now? (The CROSS=m68k target of mkroot in toybox?)
>>
>> # cat /proc/cpuinfo
>> CPU:		68040
>> MMU:		68040
>> FPU:		68040
>> Clocking:	1261.9MHz
>> BogoMips:	841.31
>> Calibration:	4206592 loops
>>
>> It certainly THINKS it's got m68000...
>>
> 
> Most 68040 processor variants have a built-in MMU and the m68k "nommu"
> Linux port doesn't support them. The nommu port covers processors like
> 68000, Dragonball etc. whereas the m68k "mmu" port covers 680x0 where x is
> one of 2,3,4,6 with MMU.
> 
>> $ qemu-system-m68k -cpu ?
>> cfv4e
>> m5206
>> m5208
>> m68000
>> m68010
>> m68020
>> m68030
>> m68040
>> m68060
>> any
>>
>> (I'd love to get an m68k nommu system working but never sat down and
>> worked out a kernel .config qemu agreed to run, plus compiler and libc.
>> Musl added m68k support but I dunno if that includes coldfire?)
>>
> 
> I could never figure out how to boot a coldfire machine in qemu either.
> There was no documentation about that back when I attempted it but maybe
> things have improved since.

FWIW this will do it:

     qemu-system-m68k -nographic -machine mcf5208evb -kernel vmlinux

That will boot an m5208evb_defconfig generated vmlinux.
But you will need a user space to get a full boot to login/shell.

Regards
Greg



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
