Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AACC4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 20:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKyLLuSxVL3WeH/i0M4a1GwLOB5BlR67gG6LcHZN72o=; b=OLQYsKVuMsDsLN
	KrA2okK+HUK7LKfzqufSI3GKwoXHEV1YpxWVg0CCgwNKrntnevHnfUX9q6axpWdSSV966hifjekqq
	/hFnRptl3kYjVXQZ65UtQ+nQDsqK53VWV56IkJ8J+tJFW+Hlh2HPmhe5i9f3GoSzOt4nryeKaPfiE
	0tpI84Pxaeh1YndmetEOWA0fErv7A8gp3Apoo4x5D1OhmdbIl75RyUWlH39yPjB3DIRrZiMXUXkBS
	iJsrWaLmj3oclcCCq8TYxAEHNJApDWqDijozdS2CrIykSKgd4AJshQmZeGF2HBmv9uVervQK+uGG0
	Tp+Q1BsKiXn3g21j7iJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkU4-004HlN-A9; Mon, 28 Nov 2022 20:12:08 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkU0-004Hjr-K1
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 20:12:06 +0000
Received: by mail-pf1-x429.google.com with SMTP id q12so7512441pfn.10
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 12:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M3hsvZmsRJ+Zyf2Ap7EqB/ctmjyXnmHpZWJb10knc0k=;
        b=WOaJzEscT0ssf37HvQjaxXmBSVsyI9lnys/H5psU1t6RKkI9snj3nnO4+e5Unbb6Pu
         CFuhxV7d7DWcdUat+VBlt6p5HHLEj2Ji03eG1f+SYRrKctRvdXshO8I76ReqC/xtw2SP
         P9RGNKGhf6KJOqnfghUtHWWnxL+eAegWiTrf6Y2O6ec9cGeFMTuugLZMffI6D0gSGpE4
         2OqgMzn19m/pN09ZQFe7Cw/t5+ax9a1g9JiP+uzKPT4zgQQXY939nQGnIyBoDc4yY7Bj
         wpf9ll9V3UYODruZ1kfu2RlVU50c/2tyn38dnXZFPibI8BAHyQMSJP5QmSrEtGJagrjv
         VmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3hsvZmsRJ+Zyf2Ap7EqB/ctmjyXnmHpZWJb10knc0k=;
        b=ijArXlP+LqjxwtRpkDO2hlOkIy6rkJK7pKWgGLpFbSnZh+PZjztrX9I15YR8O5zDU2
         qyIe+UXTM4y/sApP5N+W12IX2oXx3C3Q/ww7PadXEm9CkEtUqIeP1q6w15jU8eqCzFQQ
         uBNOU1jgAx2Ud+ShFxwgmyjuYABltgL2EE1aRfcNaJ4vCeW91jbWb8bu03hUiG+88QV4
         r3XaX6LyrPL+8W0zGebbQAScYyMx992nj4Uy1wRrQrlQe3M0s4Ur7/g+O2eNH2Qqoy4B
         4QuUFRrk0327kyndcIzzC+7VDl3ZPMPbQ5tmqJZrZlMbWDeCbBmf3M2i68nRdf3qKwgh
         /CHA==
X-Gm-Message-State: ANoB5pm4M8sytGdUSlbQ+WWQATenEFOrUj+wclbYfNlrkde4wcD8sLcA
	rh4LcnEJjikq0+C5Ihv/i7O9nRUH6Qabu7Qg48V8iw==
X-Google-Smtp-Source: AA0mqf6UGrhJcqE7QehgjRYcZVoAsAaD/+W27044VdbhNpH5sgmnawRrfidw/E22GiOZbZBQNjyChoGFd2ruFp/IaHc=
X-Received: by 2002:aa7:820a:0:b0:574:a642:ad40 with SMTP id
 k10-20020aa7820a000000b00574a642ad40mr20302955pfi.42.1669666319934; Mon, 28
 Nov 2022 12:11:59 -0800 (PST)
MIME-Version: 1.0
References: <20221128152442.3403-1-jszhang@kernel.org>
In-Reply-To: <20221128152442.3403-1-jszhang@kernel.org>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 28 Nov 2022 12:11:49 -0800
Message-ID: <CAHBxVyHg0fU9msnV4vgp4oK6aZZv+nc9mFTbTRjHNsgJAG0eyg@mail.gmail.com>
Subject: Re: [PATCH] riscv: head: use 0 as the default text_offset
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_121204_892668_DBF5EA84 
X-CRM114-Status: GOOD (  20.64  )
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

On Mon, Nov 28, 2022 at 7:34 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Commit 0f327f2aaad6 ("RISC-V: Add an Image header that boot loader can
> parse.") adds an image header which "is based on ARM64 boot image
> header and provides an opportunity to combine both ARM64 & RISC-V
> image headers in future.". At that time, arm64's default text_offset
> is 0x80000, this is to give "512 KB of guaranteed BSS space to put
> the swapper page tables" as commit cfa7ede20f13 ("arm64: set TEXT_OFFSET
> to 0x0 in preparation for removing it entirely") pointed out, but
> riscv doesn't need the space, so use 0 as the default text_offset.
>
> Before this patch, booting linux kernel on Sipeed bl808 M1s Dock
> with u-boot booti cmd:
> [    0.000000] OF: fdt: Ignoring memory range 0x50000000 - 0x50200000
> ...
> [    0.000000]   DMA32    [mem 0x0000000050200000-0x0000000053ffffff]
> As can be seen, 2MB DDR(0x50000000 - 0x501fffff) can't be used by
> linux.
>
> After this patch, the 64MB DDR is fully usable by linux
> [    0.000000]   DMA32    [mem 0x0000000050000000-0x0000000053ffffff]
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/head.S | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index b865046e4dbb..ef95943f7a70 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -38,18 +38,8 @@ ENTRY(_start)
>         .word 0
>  #endif
>         .balign 8
> -#ifdef CONFIG_RISCV_M_MODE
> -       /* Image load offset (0MB) from start of RAM for M-mode */
> +       /* Image load offset (0MB) from start of RAM */
>         .dword 0
> -#else
> -#if __riscv_xlen == 64
> -       /* Image load offset(2MB) from start of RAM */
> -       .dword 0x200000
> -#else
> -       /* Image load offset(4MB) from start of RAM */
> -       .dword 0x400000
> -#endif
> -#endif

NACK.
RV64 needs to boot at a 2MB aligned address and RV32 needs to boot at
a 4MB aligned address.
The firmware is assumed to live at the start of DRAM for Linux running
in S-mode.


>         /* Effective size of kernel image */
>         .dword _end - _start
>         .dword __HEAD_FLAGS
> --
> 2.37.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
