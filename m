Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E3BC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Apr 2022 07:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qhfbt76j1UsD/UnnI4M1M5Rabl2tKNg8HAdIalhozfk=; b=Qt84bNk8Y8V1Nl
	FvtZnU70TSTg4t10dVWMhn3E6M/6HgEm0FqCS0DuJCVSctnPuzzoUcPUdlfP0+GxBLO6/FV+2WY3V
	aWfcWIwEN8bFcJPfWNdGoOt3aD1n06il8aQnjxOyNZHnUN/YfD4s7pLxkPmC7URNZki9OJChKKPPi
	yG1cXarpu62ydCmKHnXNEULtT0ICcAsXq64ZXeOFvwUP7UgMd82LF7SBHijy20A24iDoI765+mjdb
	c5wPgXzpePrcs0HB/IFgT4IMfpLENgWq/L0YIvPJIEOk7u5pu5XskOXG/32P9GxFywx92d2BTkGxa
	uezfWfR1zI4AhkQgVZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndRhz-004NCc-Ke; Sun, 10 Apr 2022 07:10:03 +0000
Received: from mail-oa1-x43.google.com ([2001:4860:4864:20::43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndRhu-004NAo-NQ
 for linux-riscv@lists.infradead.org; Sun, 10 Apr 2022 07:10:01 +0000
Received: by mail-oa1-x43.google.com with SMTP id
 586e51a60fabf-df22f50e0cso14095927fac.3
 for <linux-riscv@lists.infradead.org>; Sun, 10 Apr 2022 00:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OKup0UvyxPHrx0lsepB2qlQY1RT8puztmE8wI+Ie6eo=;
 b=QCTXxgYbpzlPbQmu7QRkEF4MSgBLoi71fZIg7nNTtVwhbP4ZzU0ijP5Katefmz09CM
 7nekHR+oM9sNPqq7w2ZC1Itd/L5PjXkgQDl/aBdYchkS7oXLbtyA7xzAKrBnfVmRd+T2
 rMk0+lA5ZL9QY5cmhoJyotOMDYzKf2H0YBAid47gFuq1ODRrYAxhcY0n6+VlQgvS0Nzv
 SB+jZI16hqzMhbV3BONWAvZIQQl3x2qkxtYOA6v2b3NdKaeKGeh8nJiN90wzxwUEn9zG
 BiinAFmTfMtXURXkkl/BCS77f4e26tAseFf7a7NM6Aqcx913REwEgW6LAJBc97rca0qu
 RScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OKup0UvyxPHrx0lsepB2qlQY1RT8puztmE8wI+Ie6eo=;
 b=MqFCUYpZGPQJ5cOT7wTuiLHa4Bv/+kkDc6G3YSiW6siyDgwathUpcHjnvN80Bk/3fc
 Hu2hyBpGSHvxJ54qW/bVKUXbazvW8t8iqaFFlMTGO1j3WKyGbzlwc0bxQiORuA+mqQth
 tGCnOgAk8jzLV+Rxs09Z2CbkoEjCWzaguX2m9Xq/pPmjjFlPSTKLoh/9sWCErAkDHE3D
 8IzDSCyvXTNohWJliqriCtjaSU2alh3ZNaAuIR95aCT07Mlr6hOjyvY46nyRvsJHMyQd
 uweZcFsvr6LbgblD2dObzX6DXAAq5Yyrcd5S0b9dWzEA85KhRoY1LvhxemjpoIk7nKAw
 Ax7A==
X-Gm-Message-State: AOAM530wIHY+8Haq44ptVPEZSeWLKqcvZHjsElV7EA+lg+xasHRxojSO
 yLJtXb1EgN+XdKHe7ZvmdzuIEg==
X-Google-Smtp-Source: ABdhPJxbO7EoBK0LBV5p3t+tud/FMcIYTo+1NKItqNRZ77i9OoY59ZK0upMNHy9Cd/jRS17Y3Yxziw==
X-Received: by 2002:a05:6870:a189:b0:da:b3f:2b83 with SMTP id
 a9-20020a056870a18900b000da0b3f2b83mr11770176oaf.290.1649574592181; 
 Sun, 10 Apr 2022 00:09:52 -0700 (PDT)
Received: from [192.168.224.179] ([172.58.198.202])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a056870831600b000ccfbea4f23sm11420278oae.33.2022.04.10.00.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 00:09:51 -0700 (PDT)
Message-ID: <1730bed2-3978-cc4d-98ad-b0f6af38ab8e@landley.net>
Date: Sun, 10 Apr 2022 02:13:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PULL] remove arch/h8300
Content-Language: en-US
To: Daniel Palmer <daniel@0x0f.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
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
 <CAFr9PXmMzFa_iD1iECi7S=DvpMRKgLu=7P+=2RmbEWtqczjduA@mail.gmail.com>
From: Rob Landley <rob@landley.net>
In-Reply-To: <CAFr9PXmMzFa_iD1iECi7S=DvpMRKgLu=7P+=2RmbEWtqczjduA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_000958_795770_A83FDB9F 
X-CRM114-Status: GOOD (  31.73  )
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

On 4/8/22 22:37, Daniel Palmer wrote:
> Hi Rob,
> 
> On Sat, 9 Apr 2022 at 09:20, Rob Landley <rob@landley.net> wrote:
> 
>> I've been booting Linux on qemu-system-m68k -M q800 for a couple years now? (The
>> CROSS=m68k target of mkroot in toybox?)
>>
>> # cat /proc/cpuinfo
>> CPU:            68040
>> MMU:            68040
>> FPU:            68040
>> Clocking:       1261.9MHz
>> BogoMips:       841.31
>> Calibration:    4206592 loops
>>
>> It certainly THINKS it's got m68000...
> 
> I couldn't work out how to define a mc68000 machine on the command line alone.
> There might be a way but it didn't seem like it.

By adding "-cpu m68000" to the qemu command line?

The problem is you need a working _system_. If you wget
http://landley.net/toybox/downloads/binaries/mkroot/latest/m68k.tgz and extract
it and run
./qemu-m68k.sh it boots to a shell prompt. If you "./qemu-m68k.sh -cpu m68000"
it doesn't boot because the kernel is built for 68040.

>> (I'd love to get an m68k nommu system working but never sat down and worked out
>> a kernel .config qemu agreed to run, plus compiler and libc. Musl added m68k
>> support but I dunno if that includes coldfire?)
> 
> Once I get QEMU to emulate a simple mc68000 system my plan is to get
> u-boot going (I managed to get it to build for plain mc68000 but I
> didn't get far enough with the QEMU bit to try booting it yet) then
> put together the buildroot configs to build qemu, u-boot, a kernel and
> rootfs that just work. Then I can hook it into CI and have it build
> and boot test automatically and it won't bit rot anymore.

I don't bother with buildroot much, I wrote a 300 line bash script that builds a
bootable Linux system instead:

  https://github.com/landley/toybox/blob/master/scripts/mkroot.sh

As for adding coldfire support, let's see... google for "qemu coldfire" first
hit is https://qemu.readthedocs.io/en/latest/system/target-m68k.html which says
the default board in qemu-system-m68k is coldfire and has run uclinux. There's a
defconfig for it (arch/m68k/configs/m5208evb_defconfig) so:

$ make ARCH=m68k m5208evb_defconfig
...
$ CROSS_COMPILE=m68k-linux-musl- make ARCH-m68k
...
$ qemu-system-m68k -nographic -kernel vmlinux

Hey, console output on serial using my existing m68k toolchain. Good sign. Ok,
let's see, can I get a userspace...

No, I can't. The coldfire kernel only supports BINFLT, which is an a.out
derivative. All the nommu targets I'm supporting are either FDPIC or (where gcc
hasn't merged fdpic support yet) I'm building static pie and using the FDPIC
loader in the kernel, which can load normal ELF: FDPIC makes the 4
bss/data/text/rodata sections independently relocatable and static PIE has those
4 glued together into one contiguous lump but at least that lump is relocatable,
so it's a lot worse about fragmentation but does at least RUN...

If I can't wire up the fdpic loader for coldfire, I can't build ELF format
binaries for it, and I just don't mess with a.out anymore.

>> >> It looked like 68328serial.c was removed because someone tried to
>> >> clean it up and it was decided that no one was using it and it was
>> >> best to delete it.
>> >> My plan was to at some point send a series to fix up the issues with
>> >> the Dragonball support, revert removing the serial driver and adding
>> >> the patch that cleaned it up.
>> >
>> > Nice. I will leave all the 68000/68328 code alone for now then.
>>
>> The q800 config uses CONFIG_SERIAL_PMACZILOG. Seems to work fine?
> 
> Dragonball uses a weird UART that doesn't seem to be compatible with
> any of the common ones so it needs its own driver.

Indeed.

That said, the 5208 is using CONFIG_SERIAL_MCF and I got serial output from the
kernel I just built. Pity it hasn't got FDPIC support...

> Cheers,
> 
> Daniel

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
