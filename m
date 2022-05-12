Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC86CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 21:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rQ81XU459sw9j08iKllKr1Y3CbOMwlhJOQ8KgJweQU=; b=LFWhFpyDVLLWE/
	f3Ha/ZMutpa8AW2lrFEEaJG7o/Zb9mXFxUd4/bP98vbb/yLFjevLNSTftlnSnYHGQU2Sa9kdRiqoG
	NRu47Y52IFvUk1eys+xFPgWqmDGFZ4TKm3PJbSbyPGrtidlmpLbaU92Jart+TT4dwTn209kymN7LB
	yVXp2USy8isgzvmdkML7eLaDh5gm7oFqlkO8YIptVEp97rxvDk9TUyqiidfMZ/Qs65wKyFgvTtTMZ
	9/04MrxM8jxvvnImgpWFJb4Scg5dZR98Dw9sVgfgPGcCDvwlB35EyxMg7cNUG6+LlZ6JHOAgkdlFq
	aB6sNhuJHYKNTw6gl8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npGSb-00De3v-LK; Thu, 12 May 2022 21:35:01 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npGSY-00De2C-Tf
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 21:35:00 +0000
Received: by mail-lj1-x22c.google.com with SMTP id s27so8119303ljd.2
 for <linux-riscv@lists.infradead.org>; Thu, 12 May 2022 14:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZQ7XWRC9DHBCbnMYIg75BjuOh+AqnlsxWLkBLw38gMg=;
 b=RyvRBJqJ6A/80crvldPh+nyT51ONhyhj2H6A8d7bimHMuIlw7t236lI8FZ1x5sI7yo
 yecpm4AvtMfKa0ky8m4KWcfldVBnM+/jkS7rbn540P1gpzOkgDe/MNI5+7/Of4L0y/fx
 hUZrwUyiOHhsCAMP6t9xIKrbXsLAAP1yCdAenGft1xt7Gc4kFHjLu0CINeOAIdMMIl2r
 koQrhfmkYLuha/SpqrAH11rswzaH6Qw2sXOs3CUWytX2xxoxYT+NfwvOLTE9faNMzpyO
 naWtrKPMPuDZLzmY9oRapbK1L7miKvc/Nx2HxoxuERy/KNqDbk7hgcS3xnn+2rfUzdPP
 2qMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZQ7XWRC9DHBCbnMYIg75BjuOh+AqnlsxWLkBLw38gMg=;
 b=rb+Fd9MJs56fOWHm3um1F3F1VlDnbRoGJh1+79EsqHl4ci7uNX5G7pOWkmN4K3doG4
 KjlEPP3gsrIQhZ1OKYaXwfdooFrFafxWZ6pYqk6ELOakNdiV/MN0Yo7X5RqVgMWb8j2i
 SYEPOOjcx7O3mKK1jOZhjBdKWGfxn/YhsBB2bhnIT3tb4wp2HYSfDIaoSuEVGy8CPaGL
 bsBRfcO1yjyZ3ThEqZBetrJKFbtCNoDi7adEEvOxFeg9VFNHfGgahTW8mWRpW6U0JFJ9
 H5YZpnIIutiWLIziK1gtFW43o9dvcfekUQmYV81rmVlT/Y8ZJneNxadSFGgPBp36u6cY
 Ea0g==
X-Gm-Message-State: AOAM532XEAWJ3wwihgEOkW1FiLanIrcXb0oMsBABLuJ39jsH3YCHWQ35
 d9l00C9yGoYrwo62Dqe4d+8C21gP6SR+DGwlmrPd/A==
X-Google-Smtp-Source: ABdhPJzR3FWSdYG+QG5HFvSiewtwfQztKLWDP3xQpQ+zlszBDRabO8sM7sQnvjzTjgI/rOHcfyTW54Hx4W5/HYZYibk=
X-Received: by 2002:a2e:aa8e:0:b0:251:f929:3e7d with SMTP id
 bj14-20020a2eaa8e000000b00251f9293e7dmr1163096ljb.352.1652391291632; Thu, 12
 May 2022 14:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220512205545.992288-1-twd2.me@gmail.com>
In-Reply-To: <20220512205545.992288-1-twd2.me@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 12 May 2022 14:34:40 -0700
Message-ID: <CAKwvOdmJ26h4L=3+42xeWG0_mZmZXkye=+mNWgFOHbo59ZVz1w@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: build: Allow LTO to be selected
To: Wende Tan <twd2.me@gmail.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, nathan@kernel.org, llvm@lists.linux.dev, 
 Fangrui Song <maskray@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_143458_993325_F4C6B2CE 
X-CRM114-Status: GOOD (  26.42  )
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

On Thu, May 12, 2022 at 1:56 PM Wende Tan <twd2.me@gmail.com> wrote:
>
> Allow LTO to be selected for RISC-V, only when LLD >= 14, since there is an
> issue [1] in prior LLD versions that prevents LLD to generate proper
> machine code for RISC-V when writing `nop`s.
>
> I have tested enabling LTO for `defconfig`. The LLD took ~2m21s and ~3GiB
> on our Intel Xeon Gold 6140 server and produced an 18MiB Image. The image
> can boot to shell using an archriscv rootfs on QEMU.
>
> I have also tested it for `allyesconfig` without COMPILE_TEST, FTRACE,
> KASAN, and GCOV. The LLD took ~7h03m and ~335GiB on the server,

Haha! That's ok, allyesconfig is not expected to boot for any
architectures AFAIK. For CI, we simply verify we can build them; we
boot test everything but allyesconfig and allmodconfig (and
architectures which don't yet have qemu ports).  It helps detect when
assembler sources don't use enough encoding space when referenced
external symbols are too far away for larger images, IME.

That's a long time; first time I've seen a number from someone trying
to LTO allyesconfig!

> successfully producing a 1.7GiB Image. Unfortunately, we cannot boot this
> image because the `create_kernel_page_table()` -> `alloc_pmd_early()` ->
> `BUG_ON()` logic limits the image to be < 1GiB. Maybe we can fix it in a
> separate patch further.
>
> [1] https://github.com/llvm/llvm-project/issues/50505, resolved by LLVM
>     commit e63455d5e0e5 ("[MC] Use local MCSubtargetInfo in writeNops")

So looking at that change, it doesn't look like it touches LLD at all.
To me it touches both the assembler and the object streamer, which is
used by the compiler (and assembler) to stream instructions directly
into an object file (without the need for an external assembler).

That makes me think that
CLANG_VERSION >= 140000
would be more appropriate than
LLD_VERSION >= 140000

WDYT?

Also, I'm curious if the LLVM patch you had me commit for you recently
is at all related or necessary for this? If so, then the version check
should probably be against clang-15, not clang-14.
https://github.com/llvm/llvm-project/commit/6baaad740a5abb4bfcff022a8114abb4eea66a2d

Anyways, I just did a build+boot (in qemu) test of defconfig+thinlto
and defconfig+lto. LGTM

Tested-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Tested-by: Wende Tan <twd2.me@gmail.com>
> Signed-off-by: Wende Tan <twd2.me@gmail.com>
> ---
> v2:
> - Some textual changes suggested by Nick.
> - Drop the changes to `arch/riscv/Makefile`, since the LLVM issue is filed
>   and resolved.
> - Drop the unnecessary changes to `arch/riscv/kernel/vdso/Makefile`.
>
> v1: https://lore.kernel.org/linux-riscv/20210719205208.1023221-1-twd2.me@gmail.com/
> ---
>  arch/riscv/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 00fd9c548f26..c55f6b95e5af 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -38,6 +38,10 @@ config RISCV
>         select ARCH_SUPPORTS_ATOMIC_RMW
>         select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>         select ARCH_SUPPORTS_HUGETLBFS if MMU
> +       # LLD >= 14:
> +       # - https://github.com/llvm/llvm-project/issues/50505
> +       select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >= 140000
> +       select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >= 140000
>         select ARCH_USE_MEMTEST
>         select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>         select ARCH_WANT_FRAME_POINTERS
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
