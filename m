Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEAAC28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MumQFkVlFgwDUTc/s4wO7TuelzR5c43aoOHU8jOO/UY=; b=B1hP/12/cW6SA7
	ykJhu+XwQ1Rei+kc1f93LCejD9CObGnt7BHzuCUeEDxtHE63Qbw4vqKL7/eA4BdNAnELGQzMrp15o
	Ek1D9VzyeCSD7aSRGeN+RS1HrY+hdim+WodBngvvepLC46yrkOZ8aWgEgZYGTd2G5h7u511JjKKC+
	uNN06jr8C3Ea6mvfa9KYJIVkbSAx/7xnL91gvaC/AX+VVOV3vPcFySmQQmrgyEdkTwTS7GpV1UTxj
	gX0dj54h8RhG/WLphCXhHUdh+r4YDDird/TzvISmKfz4IbayEDRnX9GfAPmNCjj3P3dmgJh+HwC4R
	STI6u8z6AhEQbeZ2dFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ3s1-0076W5-Gc; Mon, 22 Aug 2022 09:37:21 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ3ry-0076Sw-CU
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 09:37:19 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-11c896b879bso12184119fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 02:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=4HGc3LZLIVD8kqIdt1raEGvcbUqauzF4BNbgPe7E/m4=;
        b=Vddi06iK/aQLUQhroDryseV/sz/XWHCbErLlIe2o1mOVI1bupY4tLhk+VRnLmb0V5a
         lxJPc9USoVMuZmA3WbNlSWqkFdShqeJ56g8qAvRvvZM01X0n9c97/Y5TyYxr08nbkoAL
         2Tvm4R4qTbbj51lxydyWcIrqcRty59kLVu5zfkzf8irql4brlCLYxBFaEsa5592UmZxZ
         BMdcOsorSI8x5Hd66i7/JRKrJWJMWgfJQd2YsvQcOnfL8JJnhJuJdiVpGke038RhAaRT
         Wj+24NAlzx8l23wOADboQVfmI/ihU0V53IC17P3zuSHb9efKW3Wv9FrzHmjyxzK9ZNk/
         4BPg==
X-Gm-Message-State: ACgBeo1MMU3nQWv6eve0ZQxRJRFaOfp11N/xQatdb7sTWbDMJgibjXgy
	h6sBRFlOMG0jPzW8mmEoCDchIOqLh+UDKA==
X-Google-Smtp-Source: AA6agR6lrdZO6qxyPhaHkvo2cMLfa1Ri3b7mS+dzc8/QVE0y49ZJzI1QehVzEIHWBY/TbswsTQ6FhA==
X-Received: by 2002:a05:6870:309:b0:10c:8b6f:d0f with SMTP id m9-20020a056870030900b0010c8b6f0d0fmr11479073oaf.221.1661161033900;
        Mon, 22 Aug 2022 02:37:13 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id x126-20020acae084000000b0033b15465357sm2563315oig.5.2022.08.22.02.37.13
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 02:37:13 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id z22-20020a056830129600b0063711f456ceso7305478otp.7
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 02:37:13 -0700 (PDT)
X-Received: by 2002:a25:cbcf:0:b0:695:2d3b:366 with SMTP id
 b198-20020a25cbcf000000b006952d3b0366mr12458894ybg.365.1661161022925; Mon, 22
 Aug 2022 02:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220821113512.2056409-1-mail@conchuod.ie>
In-Reply-To: <20220821113512.2056409-1-mail@conchuod.ie>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Aug 2022 11:36:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_dpijX7YqSR+24wWDQr4roi7EBm1nbhJuWkoidAcCng@mail.gmail.com>
Message-ID: <CAMuHMdV_dpijX7YqSR+24wWDQr4roi7EBm1nbhJuWkoidAcCng@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add an asm-generic cpuinfo_op declaration
To: Conor Dooley <mail@conchuod.ie>
Cc: Michal Simek <monstr@monstr.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, 
	Linux-Arch <linux-arch@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_023718_471773_1877D828 
X-CRM114-Status: GOOD (  34.62  )
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

Hi Conor,

On Sun, Aug 21, 2022 at 1:36 PM Conor Dooley <mail@conchuod.ie> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> RISC-V is missing a prototype for cpuinfo_op. Rather than adding yet
> another `extern const struct seq_operations cpuinfo_op;` to an arch
> specific header file, create an asm-generic variant and migrate the
> existing arch variants there too. Obv. there are other archs that use
> cpuinfo_op but don't declare it and surely also have the same warning?
> I went for the minimum change here, but would be perfectly happy to
> extend the change to all archs if this change is worthwhile. Or just
> make a header in arch/riscv, any of the three work for me!
>
> If this isn't the approach I should've gone for, any direction would
> be great :) I tried pushing this last weekend to get LKP to test it but
> I got neither a build success nor a build failure email from it, so
> I figured I may as well just send the patches..
>
> I wasn't too sure if this could be a single patch, so I split it out
> into a patch fixing the issue on RISC-V & copy-paste patches for each
> arch that I moved.

Thanks for your series!

> Conor Dooley (6):
>   asm-generic: add a cpuinfo_ops definition in shared code
>   microblaze: use the asm-generic version of cpuinfo_op
>   s390: use the asm-generic version of cpuinfo_op
>   sh: use the asm-generic version of cpuinfo_op
>   sparc: use the asm-generic version of cpuinfo_op
>   x86: use the asm-generic version of cpuinfo_op
>
>  arch/microblaze/include/asm/processor.h | 2 +-
>  arch/riscv/include/asm/processor.h      | 1 +
>  arch/s390/include/asm/processor.h       | 2 +-
>  arch/sh/include/asm/processor.h         | 2 +-
>  arch/sparc/include/asm/cpudata.h        | 3 +--
>  arch/x86/include/asm/processor.h        | 2 +-
>  include/asm-generic/processor.h         | 7 +++++++
>  7 files changed, 13 insertions(+), 6 deletions(-)
>  create mode 100644 include/asm-generic/processor.h

I was a bit surprised not to find fs/proc/cpuinfo.c in the diffstat
above. That file already has an external declaration for cpuinfo_op,
and uses it rather unconditionally (that is, if CONFIG_PROC_FS=y)
on all architectures.

So I think you can just move that to include/linux/processor.h, include
the latter everywhere, and drop all architecture-specific copies.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
