Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64D3C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 16:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3zukzP7LJ3CMiLzNeNEgv4d64EosT3MYlJ08jkBq84=; b=U1gGImKjtWckY/
	LS3ac4GR74jIDlDQeJozKTwNw6/iVzV/nu2gGmDM/U4BLkHffa4/OgSlSTeBrROmOGTfLYfojy+n1
	Eufg25Kp4L5Hhd/AJB/NwX3Z+gtzebhVL9cYMrFrXK05Ipr/wSOzSzBT1v9PUnpfTtFFbu30DCWtJ
	tI+g5IXEKEEEEua/vAdIVVajvk2nhPHI/XNgIbrUpPnsZw+d2z0e8oXQcr3b+hHAq915pSKE1K8lI
	nmAtozC9VcJj0xiiCuc9DcrkuRErThgSjKBYDldAADQ2bm1pu7IecT1N+Lu0D1TUoAhIhGfbCvOLR
	GQPil+QnNRyXzocl/Cow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyyIs-00EEEL-24; Wed, 08 Jun 2022 16:13:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyyIm-00EE9a-T6; Wed, 08 Jun 2022 16:13:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4CC8CB828AC;
	Wed,  8 Jun 2022 16:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936EAC341D3;
	Wed,  8 Jun 2022 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654704777;
	bh=sPGKDjlNYa4MR2u/HdIgrLdEoGRguN2WqLZlFp878w8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HtYdKOzL60S50CSdu15Hbl7rcp8s7a6FjJd46ni2tBu8mgjYZBFmN4xRjvcLr+HFL
	 Ef33rVtviLf26nPeBg+8ngXYycCJZVH31+vQ+PjGpS3n03W2uZWanRjLXPuUu19R59
	 4NjYuGR/ZOwnmUzdzFIR6dIaXRSqDecj4Qr79IwtQ83bPX7GkHS3y8UBYbyVF6LP5m
	 KPvmHGMu6y+S2FQLvko6YR83CvA8guulti0JSYwj51T3MFxNJbsfzhr7dqzIGYogZa
	 5/y4Ww6Yv15hlg7oS7rujceQJumlZGZ/X8aPO9PQaITIFs0nB2Kl1sg3oVal5Fs1iw
	 eNzrw4LYXl9hw==
Received: by mail-yb1-f171.google.com with SMTP id y188so7836948ybe.11;
        Wed, 08 Jun 2022 09:12:57 -0700 (PDT)
X-Gm-Message-State: AOAM531j0Cq8JXcNu5Q0k25NST+oSNBLrQI7k7glvGrqNSlaCAi4Qr2v
	h4ZIJGtmbrFPs0Lv66cqURhVOil6m+Q1ZwZ17jk=
X-Google-Smtp-Source: ABdhPJzo2KFde92icAvNQAhts5Ivj5Z3Zxtv6YtGuJhZFN0HTgsP9YMJk/IQIjq/wQ9d9NGuy7Qoa0yG3TY53Ynahlk=
X-Received: by 2002:a25:a242:0:b0:651:a78d:4636 with SMTP id
 b60-20020a25a242000000b00651a78d4636mr35602450ybi.9.1654704765774; Wed, 08
 Jun 2022 09:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220608000014.3054333-1-jarkko@profian.com> <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
 <YqAy0qjI4Lktk/uJ@iki.fi> <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
In-Reply-To: <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 8 Jun 2022 09:12:34 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
Message-ID: <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Jarkko Sakkinen <jarkko@profian.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nathaniel McCallum <nathaniel@profian.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Kees Cook <keescook@chromium.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, Marco Elver <elver@google.com>, 
	Dan Li <ashimida@linux.alibaba.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Nick Desaulniers <ndesaulniers@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Chen Zhongjin <chenzhongjin@huawei.com>, Nicolas Pitre <nico@fluxnic.net>, 
	Mark Brown <broonie@kernel.org>, Luis Machado <luis.machado@linaro.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Joey Gouly <joey.gouly@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Guenter Roeck <linux@roeck-us.net>, 
	Dave Anglin <dave.anglin@bell.net>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Alexei Starovoitov <ast@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>, 
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Changbin Du <changbin.du@intel.com>, Heiko Stuebner <heiko@sntech.de>, 
	Liao Chang <liaochang1@huawei.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Wu Caize <zepan@sipeed.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Tobias Huschle <huschle@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, 
	Michael Roth <michael.roth@amd.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Miroslav Benes <mbenes@suse.cz>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Aaron Tomlin <atomlin@redhat.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	sparclinux <sparclinux@vger.kernel.org>, linux-modules@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_091301_292005_699840F6 
X-CRM114-Status: GOOD (  34.52  )
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

On Wed, Jun 8, 2022 at 7:21 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> Hi Jarkko,
>
> On Wed, 8 Jun 2022 08:25:38 +0300
> Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> > On Wed, Jun 08, 2022 at 10:35:42AM +0800, Guo Ren wrote:
> > > .
> > >
> > > On Wed, Jun 8, 2022 at 8:02 AM Jarkko Sakkinen <jarkko@profian.com> wrote:
> > > >
> > > > Tracing with kprobes while running a monolithic kernel is currently
> > > > impossible because CONFIG_KPROBES is dependent of CONFIG_MODULES.  This
> > > > dependency is a result of kprobes code using the module allocator for the
> > > > trampoline code.
> > > >
> > > > Detaching kprobes from modules helps to squeeze down the user space,
> > > > e.g. when developing new core kernel features, while still having all
> > > > the nice tracing capabilities.
> > > >
> > > > For kernel/ and arch/*, move module_alloc() and module_memfree() to
> > > > module_alloc.c, and compile as part of vmlinux when either CONFIG_MODULES
> > > > or CONFIG_KPROBES is enabled.  In addition, flag kernel module specific
> > > > code with CONFIG_MODULES.
> > > >
> > > > As the result, kprobes can be used with a monolithic kernel.
> > > It's strange when MODULES is n, but vmlinux still obtains module_alloc.
> > >
> > > Maybe we need a kprobe_alloc, right?
> >
> > Perhaps not the best name but at least it documents the fact that
> > they use the same allocator.
> >
> > Few years ago I carved up something "half-way there" for kprobes,
> > and I used the name text_alloc() [*].
> >
> > [*] https://lore.kernel.org/all/20200724050553.1724168-1-jarkko.sakkinen@linux.intel.com/
>
> Yeah, I remember that. Thank you for updating your patch!
> I think the idea (split module_alloc() from CONFIG_MODULE) is good to me.
> If module support maintainers think this name is not good, you may be
> able to rename it as text_alloc() and make the module_alloc() as a
> wrapper of it.

IIUC, most users of module_alloc() use it to allocate memory for text, except
that module code uses it for both text and data. Therefore, I guess calling it
text_alloc() is not 100% accurate until we change the module code (to use
a different API to allocate memory for data).

Thanks,
Song

>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> for kprobe side.
>
> Thank you,
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
