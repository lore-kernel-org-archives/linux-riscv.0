Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AC9C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 10:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0OP7nf3mkhuQ6avOzctX0psMJuRgVdQR3VHeUCXlIM=; b=BuEGuSpc2sCGfA
	EqG5xbQegHk5ezYl9p8QTvuT1X6pnypTIu+1EUHx5xr3kceEnyvFJ7VhrTzBGr71/4dOON98oD6Ud
	1vmPhbyScAyI4Jqck4FRy9YqEG6f55gO8KXhGGNTxdzIj+UjdWjUVN9YkpOcW4oEH//kvx3k3xMpc
	OVkpS8+il/7/dY48JzSXzAh+83xEqaWx66LyBp4f9ckOyCy9QZhjQt5462D9VFohQPYs2w7jJsQwJ
	eCo9/yIYdUjUtWTE/5nh5mRliSqzwdKw4c6m0DPdz4M0UO15SjuViUZtToYFX3uQ5KXvmPRtUgKMk
	Ae5pxG0QAn8zYl228E/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA7Ty-00CCT8-1l; Tue, 27 Dec 2022 10:46:54 +0000
Received: from conssluserg-01.nifty.com ([210.131.2.80])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA7TY-00CCHB-PI; Tue, 27 Dec 2022 10:46:37 +0000
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 2BRAk7d6008751;
	Tue, 27 Dec 2022 19:46:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 2BRAk7d6008751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1672137968;
	bh=hAT2+icp0FeS8KOgo46qo7t6Jef4JstaJu/ndZaqtFg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fEOpxgS2x2gxsFd1RrBk9e4q/yj03wiP6CeZRGPiTxBMRfiI1DJa6Aa180cSLf9ib
	 NtyHili+AAtXemeTM7Lo79IHeyx+Ce+CuLzDqwbMbHpPqEBic8KqYINcdDlMO+/cIm
	 5psXSGGGbBPDe/n6kUvta0QZZNvtmslpW7eK+QcSt030pzzlB+j4GuE17bL5oMu6L0
	 9JFWWyH4RIzvA+I+amTEsTbr4NCLIF0D+NQG0FNt5tCn+v/5JflK8FJEQ6l+1BDRBP
	 TsZkY4AKooI5bvmvZdUPQdaazSvBQI4NxR2eeX4qo++fEnUkJPlQX9bPm691ZtHlJW
	 yMWBIgz+0s7UA==
X-Nifty-SrcIP: [209.85.167.50]
Received: by mail-lf1-f50.google.com with SMTP id bp15so19068727lfb.13;
        Tue, 27 Dec 2022 02:46:08 -0800 (PST)
X-Gm-Message-State: AFqh2kpBMGY6eLi3Oij6GsGYTmXlH5F1AMw9/SbXKMyXeQ8IHeziIoCC
	0n77IF7gV65DFJE2g/DBS89eWo/uti1xCEVdz9U=
X-Google-Smtp-Source: AMrXdXuE4MnsgNK7LbgNeBTPEXqbxTBO86saMESr9nvBj5yzAt2imNQX944Tj4ygTEzqgMUKgV9rSrjqAoEVs1kFEYY=
X-Received: by 2002:a05:6512:260f:b0:4cb:88c:c798 with SMTP id
 bt15-20020a056512260f00b004cb088cc798mr262689lfb.227.1672137966893; Tue, 27
 Dec 2022 02:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20221224192751.810363-1-masahiroy@kernel.org> <Y6hptEk8FmISixLS@spud>
 <CAK7LNAT39aZEw=0209ovYZ2kxtOaA2a51=XD9=LqYHjkTOEK4g@mail.gmail.com> <Y6oZ40fEArg7MJGo@spud>
In-Reply-To: <Y6oZ40fEArg7MJGo@spud>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 27 Dec 2022 19:45:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARkWU+ViAQ6QaTCivOuWFzQUiGQg3Fo9HqPOKymcOhOGA@mail.gmail.com>
Message-ID: <CAK7LNARkWU+ViAQ6QaTCivOuWFzQUiGQg3Fo9HqPOKymcOhOGA@mail.gmail.com>
Subject: Re: [PATCH] arch: fix broken BuildID for arm64 and riscv
To: Conor Dooley <conor@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, Dennis Gilmore <dennis@ausil.us>,
        Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
        Jisheng Zhang <jszhang@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_024629_333463_739776B5 
X-CRM114-Status: GOOD (  31.93  )
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

On Tue, Dec 27, 2022 at 7:02 AM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Masahiro,
>
> On Tue, Dec 27, 2022 at 04:06:35AM +0900, Masahiro Yamada wrote:
> > On Mon, Dec 26, 2022 at 12:18 AM Conor Dooley <conor@kernel.org> wrote:
> > > On Sun, Dec 25, 2022 at 04:27:51AM +0900, Masahiro Yamada wrote:
> > > > Dennis Gilmore reports that the BuildID is missing in the arm64 vmlinux
> > > > since commit 994b7ac1697b ("arm64: remove special treatment for the
> > > > link order of head.o").
> > > >
> > > > The issue is that the type of .notes section, which contains the BuildID,
> > > > changed from NOTES to PROGBITS.
> > > >
> > > > Ard Biesheuvel figured out that whichever object gets linked first gets
> > > > to decide the type of a section, and the PROGBITS type is the result of
> > > > the compiler emitting .note.GNU-stack as PROGBITS rather than NOTE.
> > > >
> > > > While Ard provided a fix for arm64, I want to fix this globally because
> > > > the same issue is happening on riscv since commit 2348e6bf4421 ("riscv:
> > > > remove special treatment for the link order of head.o"). This problem
> > > > will happen in general for other architectures if they start to drop
> > > > unneeded entries from scripts/head-object-list.txt.
> > > >
> > > > Discard .note.GNU-stack in include/asm-generic/vmlinux.lds.h.
> > > >
> > > > riscv needs to change its linker script so that DISCARDS comes before
> > > > the .notes section.
> > >
> > > No idea why I decided to look at patchwork today, but this seems to
> > > break the build on RISC-V, there's a whole load of the following in the
> > > output:
> > > `.LPFE4' referenced in section `__patchable_function_entries' of kernel/trace/trace_selftest_dynamic.o: defined in discarded section `.text.exit' of kernel/trace/trace_selftest_dynamic.o
> > >
> > > I assume that's what's doing it, but given the day that's in it - I
> > > haven't looked into this any further, nor gone and fished the logs out of
> > > the builder.
> >
> >
> > arch/riscv/kernel/vmlinux.lds.S clearly says:
> > /* we have to discard exit text and such at runtime, not link time */
> >
> > riscv already relies on the linker not discarding EXIT_{TEXT,DATA}
> > so riscv should define RUNTIME_DISCARD_EXIT like x86, arm64.
>
> Huh, fair enough. The diff for that appears to be trivial, but I was not
> able to correctly determine a fixes tag. I may have erred in my
> history-diving, but it's a wee bit hard to determine the correct fixes
> tag. That comment about runtime discards appears to date back to
> commit fbe934d69eb7 ("RISC-V: Build Infrastructure") in 2017 -
> apparently pre-dating the addition of the define in the first place.
>
> Commit 84d5f77fc2ee ("x86, vmlinux.lds: Add RUNTIME_DISCARD_EXIT to
> generic DISCARDS") added it to x86 but not to arm64 - but it seems like
> it was added to arm during a later reword. Does that make 84d5f77fc2ee
> the correct one to mark it as a fix of & riscv was just overlooked when
> the define was added?
>


You do not need to add the Fixes tag.

Currently, it is working, but it turns out bad
only when somebody moves "DISCARDS" up in the linker script.







> > Anyway, I came up with a simpler patch, so I do not need to
> > touch around arch linker scripts.
> >
> > I sent v2.
> > https://lore.kernel.org/lkml/20221226184537.744960-1-masahiroy@kernel.org/T/#u
>
> Sweet, thanks. Hopefully the automation likes that version better :)
>


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
