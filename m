Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BF5C38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 23:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXWjRkGVp1KAObq+jSu/SFeEXwap7qVYH0fXC6+hn24=; b=YL5+H8bG1jKgqb
	FMZg7ZjefTf1ed0ogyZ75xHjZLF+wNubijSphLxapOAlA4skJVJTItcYxSzIFL0qYAEQS8oQV64t5
	sndrkEvbtCWXkJDCm6bL8/eLsA+hBIJy8AHw5ytLu0EgHUdkZCHKfNOVTZOV91rvuFYKAbN1xLGKa
	7B2FUV+/ka8yi5g984pb3OVAScaww+Xz3sKc4dSQC0ZaaiU1uGsJzeufeUNTjILgbqjS4xLKOUXtH
	wd03wtJwOwaK87lgTiuwVls+AaRQwYgfhcKJdcWKOhVEzoCo9/+/M7wBf/hTSqcWIAFzIteCQ+erM
	yT/l3dum6dZ++ONiV2Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLY0h-00Gp89-No; Fri, 27 Jan 2023 23:19:55 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLY0W-00Gp3H-UX
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 23:19:46 +0000
Received: by mail-pj1-x1029.google.com with SMTP id nn18-20020a17090b38d200b0022bfb584987so6150126pjb.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 15:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8CUiuR0W5E+PBhliE9B5Xpc1hgvQcn7IvZXYHXz1Ztk=;
        b=paJf4L9cWbEi06hvXF3W+dvDzKcJfx5lCtIJZryT2W6x9jn8QFdqdeSxBXueWWBz4l
         rmERWAhF8Jm6eVjAbcEKqXWk92TaZ81krplTYlrMd/cx7BLYELfqbb5CODOLpDvn3Wml
         kRDg2FG0oQukaBrpadAmUfS7JdX6dtNX5Yhxfrmh9fF25lANpaUbh+OUe4mJnDmapjXX
         gkAdUczu4u3q5myPePEFbhYsOrjzSYhCHKeHI7PmJlrIZYidHb64mfDumPwdlk9pOjoP
         gInzuu73k1EMmj9geC+hKbAVQjTYtmE/jHVcj9mm7ngPUJ7ymq4p0azycwmTjONcP99X
         kwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CUiuR0W5E+PBhliE9B5Xpc1hgvQcn7IvZXYHXz1Ztk=;
        b=NGBS8r9TBUliQXr/KZ3iG3zNPSn7zmjLhQFGuvLdibvSgKWAxVHmgD2zp0LyqngxM0
         3KMTqCHni2IDrGjTnd/xAlSsDqV156S/pByHgf+NusUtbiK6+IVqBnVG+zjE0KANOyCu
         IXdmPKBrF3H7HP4xyYU27wpCNvp07TtLFm6Q4D6/C+yiDDVB/ofDYTYb1lbynocgwtTA
         DzvnVzBA4PulqUZQgFxcZIMM2Jt0A7rn4blLN/I5Ms3enlN3tUrk7zodKjxuSW+pMx2F
         UUvz7IyryvWrqCWf2+q1vC6F+eg14JIBafwC8R/GfS4P6sx3tMM9UPFwZsAcLcUAfyEj
         CVOA==
X-Gm-Message-State: AO0yUKUD/UkcYbW1sFq5/+aY5U5S2ithvFROlWkvJabpBzcDpl/n0ZPO
	e4f3jK7UtT1sY76cgB7h4vYNyt81TPlh6c0qOLbhfOg84FMNBZYw
X-Google-Smtp-Source: AK7set86nD7AHLHjFHADNw68YHO3+pTEXmPYEX73qRUo91NxvyvumPLImtBCeS4GMfu57Ja5MOsxUjtYU3znLSUgghw=
X-Received: by 2002:a17:90a:2ec7:b0:22c:419a:f4cd with SMTP id
 h7-20020a17090a2ec700b0022c419af4cdmr750919pjs.74.1674861577303; Fri, 27 Jan
 2023 15:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20221221235147.45lkqmosndritfpe@google.com> <mhng-17d41c33-7f33-4a1c-8af2-ae7d07134e8c@palmer-ri-x1c9>
In-Reply-To: <mhng-17d41c33-7f33-4a1c-8af2-ae7d07134e8c@palmer-ri-x1c9>
From: Fangrui Song <maskray@google.com>
Date: Fri, 27 Jan 2023 18:19:25 -0500
Message-ID: <CAFP8O3J1Pn+_BMKXtxB+avtYyZ+bBKffHfNOXoJPMD5QHv5obQ@mail.gmail.com>
Subject: Re: [PATCH v2] vdso: Improve cmd_vdso_check to check all dynamic relocations
To: Arnd Bergmann <arnd@arndb.de>
Cc: christophe.leroy@csgroup.eu, Palmer Dabbelt <palmer@dabbelt.com>, luto@kernel.org, 
	tglx@linutronix.de, vincenzo.frascino@arm.com, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_151945_006196_97F6A365 
X-CRM114-Status: GOOD (  22.65  )
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

On Thu, Dec 29, 2022 at 11:22 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 21 Dec 2022 15:51:47 PST (-0800), maskray@google.com wrote:
> > The actual intention is that no dynamic relocation exists. However, some
> > GNU ld ports produce unneeded R_*_NONE. (If a port fails to determine
> > the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
> > relocations. E.g. ld's powerpc port recently fixed
> > https://sourceware.org/bugzilla/show_bug.cgi?id=29540) R_*_NONE are
> > generally no-op in the dynamic loaders. So just ignore them.
> >
> > With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
> > bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
> > not called "absolute relocations". (The patch is motivated by the arm64
> > port missing R_AARCH64_RELATIVE.)
> >
> > Signed-off-by: Fangrui Song <maskray@google.com>
> > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---
> > Change from v1:
> > * rebase after 8ac3b5cd3e0521d92f9755e90d140382fc292510 (lib/vdso: use "grep -E" instead of "egrep")
> > * change the commit message to mention an example GNU ld bug; no longer say the patch fixes a deprecated egrep use
> > ---
> >   arch/arm/vdso/Makefile            |  3 ---
> >   arch/arm64/kernel/vdso/Makefile   |  3 ---
> >   arch/arm64/kernel/vdso32/Makefile |  3 ---
> >   arch/csky/kernel/vdso/Makefile    |  3 ---
> >   arch/loongarch/vdso/Makefile      |  3 ---
> >   arch/mips/vdso/Makefile           |  3 ---
> >   arch/powerpc/kernel/vdso/Makefile |  1 -
> >   arch/riscv/kernel/vdso/Makefile   |  3 ---
> >   arch/s390/kernel/vdso32/Makefile  |  2 --
> >   arch/s390/kernel/vdso64/Makefile  |  2 --
> >   arch/x86/entry/vdso/Makefile      |  4 ----
> >   lib/vdso/Makefile                 | 13 ++++---------
> >   12 files changed, 4 insertions(+), 39 deletions(-)
>
> [snip]
>
> > diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> > index 06e6b27f3bcc..d85c37e11b21 100644
> > --- a/arch/riscv/kernel/vdso/Makefile
> > +++ b/arch/riscv/kernel/vdso/Makefile
> > @@ -1,9 +1,6 @@
> >   # SPDX-License-Identifier: GPL-2.0-only
> >   # Copied from arch/tile/kernel/vdso/Makefile
> >
> > -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
> > -# the inclusion of generic Makefile.
> > -ARCH_REL_TYPE_ABS := R_RISCV_32|R_RISCV_64|R_RISCV_JUMP_SLOT
> >   include $(srctree)/lib/vdso/Makefile
> >   # Symbols present in the vdso
> >   vdso-syms  = rt_sigreturn
>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
>
> Thanks!

Looks like this patch hasn't been picked yet...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
