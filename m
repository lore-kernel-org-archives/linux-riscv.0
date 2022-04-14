Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D119DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 00:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ayzz5ZjYdRrrmPf/ruVB08oOFDiKjJMoVPzEEHF8LNU=; b=1Vl/7FHke1ka1K
	Q4sCHkqOfdK0VxULfpO9fwA/j3dD097erkZlJsJlg/SkU68F9gV7XDvTotqdY2/kAIRAIcgg6+qru
	zQYomwPOFLoV4FjB8uDFU25xZh4JAXzf01O7DO3EfsUMo69Irm6pIbCRC05Upc9Jwf2FQP31mX5Mx
	zPUncqJRhjkedD9ilHeilCR1GVmhfwOMLgHVGJjI5U5cEvPOVBp1ns6iKCQexcQXRDhyMRy92/YHI
	PrLRzuwk2AvoFGRSPXDRUB3gxzbF+sqjmg6a0Tok++cIEynmQTudhvQFnHjf6H+Jtzf9FLl7W0Rwb
	NgaHBw27ia/fhuN4r6cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nengH-003DNG-PG; Thu, 14 Apr 2022 00:49:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nengE-003DLb-P4
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 00:49:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D0CBBB818F1;
 Thu, 14 Apr 2022 00:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E38C385A3;
 Thu, 14 Apr 2022 00:49:43 +0000 (UTC)
Message-ID: <7a26156e-1f06-b0b1-2859-432a75e9e0d4@linux-m68k.org>
Date: Thu, 14 Apr 2022 10:49:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PULL] remove arch/h8300
Content-Language: en-US
To: Rob Landley <rob@landley.net>, Finn Thain <fthain@linux-m68k.org>
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
 <147dc6cc-1fbb-558f-8e6d-29d4327d54b4@linux-m68k.org>
 <ae4125f5-e725-43ed-d05b-b1f88c0cd50c@landley.net>
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <ae4125f5-e725-43ed-d05b-b1f88c0cd50c@landley.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_174951_160366_559E4E5F 
X-CRM114-Status: GOOD (  30.78  )
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



On 10/4/22 17:26, Rob Landley wrote:
> 
> 
> On 4/8/22 23:18, Greg Ungerer wrote:
>>
>> On 9/4/22 11:59, Finn Thain wrote:
>>> On Fri, 8 Apr 2022, Rob Landley wrote:
>>>
>>>> On 4/5/22 08:07, Greg Ungerer wrote:
>>>>> On 5/4/22 13:23, Daniel Palmer wrote:
>>>>>> On Mon, 4 Apr 2022 at 22:42, Greg Ungerer <gerg@linux-m68k.org> wrote:
>>>>>>> But we could consider the Dragonball support for removal. I keep it
>>>>>>> compiling, but I don't use it and can't test that it actually works.
>>>>>>> Not sure that it has been used for a very long time now. And I
>>>>>>> didn't even realize but its serial driver (68328serial.c) was
>>>>>>> removed in 2015. No one seems too have noticed and complained.
>>>>>>
>>>>>> I noticed this and I am working on fixing it up for a new Dragonball
>>>>>> homebrew machine. I'm trying to add a 68000 machine to QEMU to make
>>>>>> the development easier because I'm currently waiting an hour or more
>>>>>> for a kernel to load over serial. It might be a few months.
>>>>
>>>> I've been booting Linux on qemu-system-m68k -M q800 for a couple years
>>>> now? (The CROSS=m68k target of mkroot in toybox?)
>>>>
>>>> # cat /proc/cpuinfo
>>>> CPU:		68040
>>>> MMU:		68040
>>>> FPU:		68040
>>>> Clocking:	1261.9MHz
>>>> BogoMips:	841.31
>>>> Calibration:	4206592 loops
>>>>
>>>> It certainly THINKS it's got m68000...
>>>>
>>>
>>> Most 68040 processor variants have a built-in MMU and the m68k "nommu"
>>> Linux port doesn't support them. The nommu port covers processors like
>>> 68000, Dragonball etc. whereas the m68k "mmu" port covers 680x0 where x is
>>> one of 2,3,4,6 with MMU.
> 
> In theory you can switch the MMU off. (Or at least give it a NOP page table that
> maps all the physical memory into one big contiguous block 1:1 with the physical
> address and leave it there.)
> 
> Doesn't mean anybody's bothered to implement and add a config option to stub
> that out in the kernel yet. But presumably you could have a bootloader shim do it...
> 
>>>> (I'd love to get an m68k nommu system working but never sat down and
>>>> worked out a kernel .config qemu agreed to run, plus compiler and libc.
>>>> Musl added m68k support but I dunno if that includes coldfire?)
>>>>
>>>
>>> I could never figure out how to boot a coldfire machine in qemu either.
>>> There was no documentation about that back when I attempted it but maybe
>>> things have improved since.
>>
>> FWIW this will do it:
>>
>>       qemu-system-m68k -nographic -machine mcf5208evb -kernel vmlinux
>>
>> That will boot an m5208evb_defconfig generated vmlinux.
>> But you will need a user space to get a full boot to login/shell.
> 
> No FDPIC support. :(
> 
> I had a binflt toolchain working with uClibc in 2015 or so, but I end of lifed
> https://landley.net/aboriginal in 2017 (five years ago now). Multiple reasons,
> but one was the old "last GPLv2 release" toolchain was getting painful to force
> the kernel to build with.
> 
> These days there's articles on lwn.net about yanking a.out support, which fdpic
> is a buggy variant of that didn't actually have a maintained elf2flt repository
> when I was assembling my toolchain. (I vaguely recall I poked enough people that
> somebody picked it up and stuck a repository on github, but Jeff Dionne
> explained some fundamental design flaw that had been introduced having to do
> with register offsets being calculated in the wrong framework or something?
> 
> I don't remember, I lost interest because it's _conceptually_ obsolete. FDPIC is
> ELF with a little extra header info, it's clean and potentially even useful on
> with-MMU systems as extra ASLR. BINFLT is a.out run through a postprocessing
> tool that nominally converts ELF files into the new format but actually needs .o
> files from earlier in the process and is kind of an alternate linker except it
> doesn't replace the linker... It's layers of ugly.

FLAT format has nothing to do with a.out.
Removing a.out support from the kernel will have no impact on binfmt_flat.

Regards
Greg


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
