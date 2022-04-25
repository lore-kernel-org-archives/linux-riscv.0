Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBBAC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Apr 2022 07:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5+psay0fzpdqErHHYf+rHxVLPNG1Fnc0lnaBaV7lEU=; b=jpZ2kw/M838BYL
	hlcSq1ZxsxP9m62/PNnygxafnf757FBbwiYjmURY1kWUCpSGqJ6j8JxXYlj8ktosA2UpabGGvNJib
	Og0wDXLD4CmpTO8vmi0L4urinjPMVo/B3ZK9gMd+wdLNXSSPIYmTnaWrCbXl08LnCoeyKrZxhtl6D
	bpfjM5qKizmKrYDeiGos6uzh0cADiMpZpqJMreDVTDOw8JCaKsFPXpD8MOlbfHTQKnKIqViS5/k94
	qEAuWTfZetsuYeCgjIBzcsmmqUvwwjK1z8iqsFnho5GMSIWmrgq1ztfVVrNvrI/Ad3uN2dGDGVxRv
	rFNhCUp8UfxgAQQA8pVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nitLI-008dhC-G9; Mon, 25 Apr 2022 07:41:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nitL5-008dfM-TQ; Mon, 25 Apr 2022 07:40:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8DD9E612FB;
 Mon, 25 Apr 2022 07:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F0AC385A4;
 Mon, 25 Apr 2022 07:40:49 +0000 (UTC)
Message-ID: <ee410d9d-25dc-3b87-08d2-c4c8e71575a3@linux-m68k.org>
Date: Mon, 25 Apr 2022 17:40:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] binfmt_flat: Remove shared library support
Content-Language: en-US
To: Rob Landley <rob@landley.net>, Kees Cook <keescook@chromium.org>,
 Rich Felker <dalias@libc.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, ebiederm@xmission.com,
 damien.lemoal@opensource.wdc.com, Niklas.Cassel@wdc.com,
 viro@zeniv.linux.org.uk, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, vapier@gentoo.org, stable@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
 linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
 ysato@users.sourceforge.jp
References: <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
 <mhng-32cab6aa-87a3-4a5c-bf83-836c25432fdd@palmer-ri-x1c9>
 <20220420165935.GA12207@brightrain.aerifal.cx>
 <202204201044.ACFEB0C@keescook>
 <ab454879-5506-fe7d-cd59-812a6bc9d193@landley.net>
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <ab454879-5506-fe7d-cd59-812a6bc9d193@landley.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_004056_077080_418DF0C5 
X-CRM114-Status: GOOD (  20.96  )
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


On 25/4/22 13:38, Rob Landley wrote:
> On 4/20/22 12:47, Kees Cook wrote:
>>> For what it's worth, bimfmt_flat (with or without shared library
>>> support) should be simple to implement as a binfmt_misc handler if
>>> anyone needs the old shared library support (or if kernel wanted to
>>> drop it entirely, which I would be in favor of). That's how I handled
>>> old aout binaries I wanted to run after aout was removed: trivial
>>> binfmt_misc loader.
>>
>> Yeah, I was trying to understand why systems were using binfmt_flat and
>> not binfmt_elf, given the mention of elf2flat -- is there really such a
>> large kernel memory footprint savings to be had from removing
>> binfmt_elf?
> 
> elf2flat is a terrible name: it doesn't take an executable as input, it takes a
> .o file as input. (I mean it's an elf format .o file, but... misleading.)

No, not at all. "elf2flt" is exactly what it does. Couldn't get a
more accurate name.


>> But regardless, yes, it seems like if you're doing anything remotely
>> needing shared libraries with binfmt_flat, such a system could just use
>> ELF instead.
> 
> A) The binfmt_elf.c loader won't run on nommu systems. The fdpic loader will,
> and in theory can handle normal ELF binaries (it's ELF with _more_
> capabilities), but sadly it's not supported on most architectures for reasons
> that are unclear to me.

Inertia. Flat format has been around a very long time.
And for most people it just works. Flat format works on MMU systems
as well, though you would have to be crazy to choose to do that.


> B) You can't run conventional ELF on nommu, because everything is offset from 0
> so PID 1 eats that address range and you can't run exec program.
> 
> You can run PIE binaries on nommu (the symbols offset from a base pointer which
> can point anywhere), but they're inefficient (can't share text or rodata
> sections between instances because every symbol is offset from a single shared
> base pointer), and highly vulnerable to fragmentation (because it needs a
> contiguous blob of memory for text, rodata, bss, and data: see single base
> pointer everything has an integer offset from).
> 
> All fdpic really does is give you 4 base pointers, one for each section. That
> way you can share text and rodata, and put bss and data into smaller independent
> fragments of memory. Various security guys use this as super-aslr even on mmu
> systems, but tend not to advertise that they're doing so. :)

Well flat got half way there. You can have separate text/rodata and data/bss,
used a lot back in the day for execute-in-place of the code.

Regards
Greg



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
