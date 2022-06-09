Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBBDC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 22:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sijbEUBgd/DjxSDu10m3JDEYE/43kHFaUEJsJwaYwMM=; b=HgM2cKdgY3sJQz
	EEeLwYcMox9na7emG218oo4jim36Mg+BW9XldTWc3xfDr15iQU5+V0LaHbMNJ9P+N4UqIKrmMB8GV
	0oh/xWxl2ZBpqbJnKgEhQ/ZIvdcoZagXMayvpTggjpB5Ho0ZhLxUD7cKgTRNckJmxYOZR9ZHZpSpl
	NfOJyPMXZ63L5TMJJCwytn/F4zhG/t6ad8e4aKv4QxauZB5dL7emH6H01p2ekDweZ9W0wUl5jtk5Q
	mBAx6Iee3ES4AiDaByBD2tMfcCr9m94ymo4cdeLYQBBkVurbUDpTH6OvTIVRP8DqW4Jqn8b4Li2Va
	wS5UyG47T9V+8U1F4Y6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzQxK-004TIx-8x; Thu, 09 Jun 2022 22:48:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzQxG-004THn-KG; Thu, 09 Jun 2022 22:48:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E00261FC2;
	Thu,  9 Jun 2022 22:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD70C341E4;
	Thu,  9 Jun 2022 22:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654814920;
	bh=fXQHcxnj09/NTw2WTFOlO+YMcNuPa2JywCYJxs8h+OI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tKaXvF9QRb62Y+vempgVpRbPDoZKp3cW4FtttO8/7E0uh+KETERHOu8TdTzwWAwrU
	 xGtYH/7o85i8ECoYtdzu2/ShEXy+m07iogmJ9CUJeAlDjbQ2g3dhnnWKivbd6l611c
	 ETEuLIgJTOC8tmx8PPLKakpM2Y2Dg6Cu1wXK+Dtq8oLRIw63QxqKIzj32OHFg3Gsw6
	 AGkKVZWTMj49Mv8nIzBDTZVpv3vfd2s0qEMP1rFfNqr6ubzI6iC51MVz/LLcWo+V7V
	 Kl+ZJHKlUAAw9KLyuLFScyw6YZsSX2/8Tbyln3mxluYtmDgtXTwVPl4MHJ2O27WoCG
	 e1lej69VaPWJw==
Received: by mail-ot1-f41.google.com with SMTP id l9-20020a056830268900b006054381dd35so18437688otu.4;
        Thu, 09 Jun 2022 15:48:40 -0700 (PDT)
X-Gm-Message-State: AOAM531PYbd9uSe7O3iEdaq+EGgKzG0m+XbREtEgdV/jFSW00WUTpAuC
	4Jh6ZkSWch45QBZ+Nwd0mEI2P51UaUveXQLQEiM=
X-Google-Smtp-Source: ABdhPJzemSM5GrpgirpnnQNTEDsYpAOxmoxNmoSmK2+phEV9mudE18JL5yVLSDRq4A8vq3lyLIBxhhDyWWNd79LGZgg=
X-Received: by 2002:a25:3b49:0:b0:664:5a43:5895 with SMTP id
 i70-20020a253b49000000b006645a435895mr1766286yba.9.1654814908410; Thu, 09 Jun
 2022 15:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220608000014.3054333-1-jarkko@profian.com> <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
 <YqAy0qjI4Lktk/uJ@iki.fi> <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
 <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
 <CAPhsuW6BzUtqnjvaGJScXRpghs0_V_phpdyd4_oAKhvmkX-GFw@mail.gmail.com>
 <YqEF6+YKqCHsWZJW@bombadil.infradead.org> <20220609034852.GA30873@lst.de>
 <YqH0iEgsi6+bwS3x@bombadil.infradead.org> <e7dedb9086193ca7682edc10fabc4195894e5146.camel@intel.com>
In-Reply-To: <e7dedb9086193ca7682edc10fabc4195894e5146.camel@intel.com>
From: Song Liu <song@kernel.org>
Date: Thu, 9 Jun 2022 15:48:17 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4rF1cFmdSUZD=Tw4QRmOf=v+V_2EhEphzJA5teqOrH0Q@mail.gmail.com>
Message-ID: <CAPhsuW4rF1cFmdSUZD=Tw4QRmOf=v+V_2EhEphzJA5teqOrH0Q@mail.gmail.com>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "hch@lst.de" <hch@lst.de>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, 
	"mcgrof@kernel.org" <mcgrof@kernel.org>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>, 
	"paulus@samba.org" <paulus@samba.org>, "zepan@sipeed.com" <zepan@sipeed.com>, 
	"iii@linux.ibm.com" <iii@linux.ibm.com>, "deller@gmx.de" <deller@gmx.de>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "joey.gouly@arm.com" <joey.gouly@arm.com>, 
	"anemo@mba.ocn.ne.jp" <anemo@mba.ocn.ne.jp>, "egorenar@linux.ibm.com" <egorenar@linux.ibm.com>, 
	"ast@kernel.org" <ast@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>, 
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "bp@alien8.de" <bp@alien8.de>, 
	"davem@davemloft.net" <davem@davemloft.net>, "x86@kernel.org" <x86@kernel.org>, 
	"luis.machado@linaro.org" <luis.machado@linaro.org>, "ebiederm@xmission.com" <ebiederm@xmission.com>, 
	"mbenes@suse.cz" <mbenes@suse.cz>, "mingo@redhat.com" <mingo@redhat.com>, 
	"jniethe5@gmail.com" <jniethe5@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, 
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "andreyknvl@gmail.com" <andreyknvl@gmail.com>, 
	"dja@axtens.net" <dja@axtens.net>, "liaochang1@huawei.com" <liaochang1@huawei.com>, 
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>, 
	"huschle@linux.ibm.com" <huschle@linux.ibm.com>, "will@kernel.org" <will@kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>, 
	"guoren@kernel.org" <guoren@kernel.org>, "nathan@kernel.org" <nathan@kernel.org>, 
	"dave.anglin@bell.net" <dave.anglin@bell.net>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"atomlin@redhat.com" <atomlin@redhat.com>, "bristot@redhat.com" <bristot@redhat.com>, 
	"naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "anup@brainfault.org" <anup@brainfault.org>, 
	"javierm@redhat.com" <javierm@redhat.com>, "linux@roeck-us.net" <linux@roeck-us.net>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	"philipp.tomsich@vrull.eu" <philipp.tomsich@vrull.eu>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"ndesaulniers@google.com" <ndesaulniers@google.com>, 
	"samitolvanen@google.com" <samitolvanen@google.com>, "yangtiezhu@loongson.cn" <yangtiezhu@loongson.cn>, 
	"aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "geert@linux-m68k.org" <geert@linux-m68k.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "heiko@sntech.de" <heiko@sntech.de>, 
	"nathaniel@profian.com" <nathaniel@profian.com>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>, "Sakkinen, Jarkko" <jarkko@profian.com>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, 
	"tmricht@linux.ibm.com" <tmricht@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"jarkko@kernel.org" <jarkko@kernel.org>, 
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"atishp@atishpatra.org" <atishp@atishpatra.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, 
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "nico@fluxnic.net" <nico@fluxnic.net>, 
	"masahiroy@kernel.org" <masahiroy@kernel.org>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, 
	"kernel@esmil.dk" <kernel@esmil.dk>, "ashimida@linux.alibaba.com" <ashimida@linux.alibaba.com>, 
	"elver@google.com" <elver@google.com>, "keescook@chromium.org" <keescook@chromium.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>, 
	"Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "andrealmeid@igalia.com" <andrealmeid@igalia.com>, 
	"changbin.du@intel.com" <changbin.du@intel.com>, 
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_154842_771684_34C5590A 
X-CRM114-Status: GOOD (  13.39  )
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

On Thu, Jun 9, 2022 at 11:41 AM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Thu, 2022-06-09 at 06:24 -0700, Luis Chamberlain wrote:

[...]

>
> Like say for a next step we moved prog pack out of bpf into core code,
> gave it it's own copy of module_alloc(), and then made kprobes use it.
> Then we would have something with improved W^X guard rails, and kprobes
> would not depend on modules anymore. I think maybe it's a step in the
> right direction, even if it's not perfect.

I was also thinking about where to put the prog pack allocator eventually.
Shall it be part of mm code or module code?

Btw, prog pack has more challenges with W^X requirement:
1. The arch need to have text poke mechanism;
2. Some users of prog pack need to learn to use the ROXbuffer with text poke,
  for example, how to calculate relative address differently.

Thanks,
Song

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
