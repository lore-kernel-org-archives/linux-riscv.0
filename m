Return-Path: <SRS0=cyh3=56=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237DFC2BB1D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2020 19:30:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E85B220767
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2020 19:30:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mdq75zEw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E85B220767
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vwEpIy63mCp7p6IJUCWsO8m2bH9JPoxPbbC8HMS4EpQ=; b=mdq75zEwwBLEpGmGFB7hXjsm2
	dpOi87w+0Cnp9GAnxaaHgDo438DO1IhUL3d5UiZ6Z7U9GHcMQrT5blwhWylegV9J3Iw75yR9RiYTl
	Ac7/7OxrLLvdrsYaCpS5lSs8kqeX6qHpUbaHGtWBWor9//P1NcPja1X3j9yJZpAjUb4cXKxglT+FR
	qLyDToT6+QcVQu986RVzLD1/ZCro91Hp3t76eVMwvyfAtITkpdN3z7Sq53sTizowxj/GiGsVu5zmJ
	6Bs1AaFaA9CS2bGAj5VA9AsxKpaFXmS3uc6jDwKpvjdChHYpjxpF6n6xVm9If1i9oCKhZOVUnMGwQ
	dx5+kO6zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jORG9-0001h5-Tb; Tue, 14 Apr 2020 19:30:13 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jORG7-0000Cp-CQ
 for linux-riscv@lists.infradead.org; Tue, 14 Apr 2020 19:30:13 +0000
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MFbFW-1jTQO21pIU-00H7kx for <linux-riscv@lists.infradead.org>; Tue, 14
 Apr 2020 21:30:04 +0200
Received: by mail-qk1-f172.google.com with SMTP id l25so14672032qkk.3
 for <linux-riscv@lists.infradead.org>; Tue, 14 Apr 2020 12:30:04 -0700 (PDT)
X-Gm-Message-State: AGi0Puacl+OzSpjf5ihxgr4nsmBpWzOItm03bjZq9/O2RjKbC7VsuKz4
 AzOWJlSvWMBUg27zurSlK1WVmrqCh/rXhQmcxF4=
X-Google-Smtp-Source: APiQypITiUtB+6fwOLBsAbHscEX27ZziBUO1YtED1jtCdBFATrhYqphhXhWEGAUqYD652cM9cUGS42BS5oByWuiE2bw=
X-Received: by 2002:a37:ba47:: with SMTP id k68mr11683991qkf.394.1586892602983; 
 Tue, 14 Apr 2020 12:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200331093241.3728-1-tesheng@andestech.com>
 <CAK8P3a3LokurC0n9XiwtPQh9ZgQcswMKY4b+TEsQh1VgYDNeWA@mail.gmail.com>
 <20200408035118.GA1451@andestech.com>
 <CAK8P3a1JS3_2fWrhNTZx0eTWjJa-GTb4AscTPqydpSP5EB15Yw@mail.gmail.com>
 <20200414151748.GA5624@afzalpc>
In-Reply-To: <20200414151748.GA5624@afzalpc>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Apr 2020 21:29:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0JW9x-Wk9Ec3+zLjPHbWAvPQx8MF-xe-PnWUgEjRAuTg@mail.gmail.com>
Message-ID: <CAK8P3a0JW9x-Wk9Ec3+zLjPHbWAvPQx8MF-xe-PnWUgEjRAuTg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Highmem support for 32-bit RISC-V
To: afzal mohammed <afzal.mohd.ma@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dHhRUzYooW3Ffuqo6G2xEhwtLXStHPvRCHP/zeCmyqmB+D7QVpI
 V/MBhF/2IlSlYSDiD1ci5C5oe4e5GpkKE01z1rH649541aCF30KQ8eZlLRP5wQfWgZFxoH4
 5JmJbV26gxtqeLWeR6Fxo0Zjfm8PNupkAUSP1lqPk/l+I0YkIafQDtPHzUP8G4gUz7v90tc
 xOkwYwv5TNe+Qd4U7gPIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CE+ZErmPW/s=:d5+Urn2z5+h0nTPQqes8bW
 zRZwek6k78X4tf2UBm5oLSldGjazxyC3wfkMDbSNYb4PrBX8ka50faRk8MG2pWM0xutzl1jN0
 wGuuZYji3kpgOIzxtH+XKrV62zCh1orZBxGnmMzTBAR0k60bVeB2+5z7I11fMgjK07BRPl/VV
 kfEuHA1sGlxzaOqYYua9j9+l1lmhC3gZdc/hgDVWeXtUwKYQ4bLcnTLxRH58mlEUDcVflkGYU
 UdXkCU96Mj8WbuWaRRe/bKpOTkkBY+xjrengzPNWaaD9+F9uEmFokTecDkqDAUVC/dcI5Hk3T
 WYGyyBCSfAUONG6sCIf2fOlHzltY4MbThpK1YWGg8RHVqIm70smyzPMEkEMsENjpBQ9tQXTbC
 w7yTfx4ULyMgFgaCdM2ANbQxU8XAtedgYzZLM2BRPDmOkn0TsOnWJG20nAg6DXjN3Ip8pumKV
 wNLGBpM2kKaX4YSBSeWsl/Mg+6FQFrIBK6GD1PdbT7oUQ50wEYTNUKPRIQm42UhnfnagBjBGy
 idfBm1K2DQDw6AA+QlpHkTIOhklIQHhRWb9uMzrz+gmBMcfEwyptatAtLAbEw/ohRWNeAa3Oq
 EOg15aEXqohhWQeRfc0/U5lOvR/kvi0H5gKPDDMx/r6Jm7KkXHav23XNvqhls2ucdbHTa/u6e
 cTEqsA+nps0TpajhaLoRaNpWvZv6WWFpn2d0d5wUr+YH3Hv8BVi8deiv0QtiG77K3A1QxtCF3
 ckGccKxyWg1hWs2oJyyKSdS8mpQ8GZopMOpyysAZW7UuDZFsCT/jrYO6QH4ZHEzmhcWuZjNXp
 toeK6/sJ7kGclAgSqRzGV3GpCoITLwOrBsKu1d6rz34R4s9lKs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_123011_715443_63815DFA 
X-CRM114-Status: GOOD (  19.64  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: zong.li@sifive.com, Alan Kao <alankao@andestech.com>, atish.patra@wdc.com,
 Albert Ou <aou@eecs.berkeley.edu>, Gary Guo <gary@garyguo.net>,
 linux-riscv@lists.infradead.org, Steven Price <steven.price@arm.com>,
 alex@ghiti.fr, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, Borislav Petkov <bp@suse.de>,
 Eric Lin <tesheng@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 yash.shah@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 14, 2020 at 5:17 PM afzal mohammed <afzal.mohd.ma@gmail.com> wrote:
>
> + rmk
>
> Hi Arnd,
>
> On Wed, Apr 08, 2020 at 04:40:17PM +0200, Arnd Bergmann wrote:
>
> > No code yet, so far not much more than the ideas that I listed. We
> > are currently looking for someone interested in doing the work
> > or maybe sponsoring it if they have a strong interest.
>
> If no one have yet taken it up, i am interested in doing the work, i
> will sponsor myself :). i will proceed at a slow pace without derailing
> my other things normal.
>
> To keep expectations realistic: i have not yet taken task of this
> complexity, it is more of a learning for me. My familiarity with Linux
> at the ARM architecture level is mostly on no-MMU (Cortex-M), have not
> worked so far seriously on MMU Linux at the ARM architectural level,
> though used to go through ARM ARM v7-AR at times.

Thanks for offering to help, it's very much appreciated. Let me know how
it goes and if you have any more detailed questions.

> i have a few 32-bit ARM Cortex-A (A5, A8 & A9) boards, maximum RAM 1G,
> none have LPAE, seems i have to buy one for this purpose.

I would recommend starting in a qemu emulated system on a PC host,
you can just set it to emulate a Cortex-A15 or A7, and you can attach
gdb to the qemu instance to see where it crashes (which it inevitably
will).

You can also start by changing the functions in asm/uaccess.h to
use the linear kernel mapping and memcpy(), like the version in
arch/um/kernel/skas/uaccess.c does. This is slow, but will work on
regardless of whether user space is mapped, and you can do a
generic implementation that works on any architecture and put that
into include/asm-generic/uaccess.h.

A second step after that could be to unmap user space when entering
the kernel, without any change in the memory layout, this is still
mostly hardware independent and could easily be done in qemu
or any 32-bit ARM CPU.

Another thing to try early is to move the vmlinux virtual address
from the linear mapping into vmalloc space. This does not require
LPAE either, but it only works on relatively modern platforms that
don't have conflicting fixed mappings there.

If you get that far, I'll happily buy you a Raspberry Pi 4 with 4GB
for further experiments ;-)
That one can run both 64-bit and 32-bit kernels (with LPAE),
so you'd be able to test the limits and not rely on qemu to find
all bugs such as missing TLB flushes or barriers.

        Arnd

