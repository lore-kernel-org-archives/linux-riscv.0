Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67E8C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 07:57:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3EC42173C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 07:57:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GigIN/r3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3EC42173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wpAbNZsJaRBJ7yoZLRmDVKBF8upU8tL6KwyCTIHOYo=; b=GigIN/r3gKYSg7
	3dgyRcnTBOED9k5SV3hdbQDbo3s6Cla1MgaV44jp2qvg50u/Z4NAWIxdsVvDWBHQv2yxCEsoZxghF
	GbBE4r09DfpB8dRUJUQbhHgj0q1G0C6po3jEENX2vrLPMbJ29tv4rRLSIXB/66XO+XfUBdNaWhNug
	a9trq9cyCzvj4+OuK+FvThWytkwD8La1w/TZ22cJf4+CtqdaINhAj7CE6x07tgFq3M0iJcJbS6P3R
	SdhjG4fSS6aJDMyKmjtRjBpXQt3D/jnJX6H20Qv4071nDEhEhna7fCJwW8b6OIEF4sPr5kboiONzi
	bg/tbqfZ5lDyTHq/Lkhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggmG4-0001CU-Jo; Tue, 08 Jan 2019 07:57:08 +0000
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggmG1-0001Bu-8N
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 07:57:06 +0000
Received: by mail-vs1-f68.google.com with SMTP id z3so1907923vsf.7
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jan 2019 23:57:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rySBcmuq6MC1aua4zuDq5jYyrsEtfhwGkXLDWTkT/u4=;
 b=T6rYy4mXXN1zYWqUDIzql/nHtAIqCjgpwiDt+THjEJI1zmRp4N6iQNHjGQJbvYOje5
 RzoxDDWw6xrK52M5dZj13MYtq3gPt1jo63tCIRAQMrBdcOZSk3+r6It+LiOHvaE0L5Z8
 1R0896199RC1kXZLdhnie0SCejYXRltmtOQnllm3XqHd9ZPjXDloaOnJ8c5Zkb9LGliU
 +R72OS+ovT//rb8vcrAzRKS4CyxnV88giW0dQRxLY3hCPijbmX3CBBPXF6GCkly0srj6
 mon9EnfNa0muBTlSxjx9J5Y9Qdjfxzph1+WCOMrZvslRE/Y3ccggebK7Kuvb3pBIv50B
 2rig==
X-Gm-Message-State: AJcUukfubImXAoSCX5KJTxhTWH5GRLbDOjtu9HzY+wl29dQyZLY32RxQ
 W+Xdztsu7x7CYYTnllpYDll536qi2BN1SRWtlPU=
X-Google-Smtp-Source: ALg8bN7yZ3Ohpnn9jvfWml12rXdCkhly+ugbSQmKYd7Z7sr38oPRiO/6vIQXT6r5clDdWnTRq/yPJYfQdkzkCaU5mn4=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr317002vsm.152.1546934223659; 
 Mon, 07 Jan 2019 23:57:03 -0800 (PST)
MIME-Version: 1.0
References: <1546904307-11124-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1546904307-11124-1-git-send-email-yamada.masahiro@socionext.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Jan 2019 08:56:52 +0100
Message-ID: <CAMuHMdU_wUjk=nw9QtWaNGzgb3cCUiKLZpPy+bmcn4qw6zbccw@mail.gmail.com>
Subject: Re: [PATCH] arch: unexport asm/shmparam.h for all architectures
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_235705_299904_A079A9EF 
X-CRM114-Status: GOOD (  14.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Mark Salter <msalter@redhat.com>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Kuo <rkuo@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Yamada-san,

On Tue, Jan 8, 2019 at 12:41 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Most architectures do not export shmparam.h to user-space.
>
>   $ find arch -name shmparam.h  | sort
>   arch/alpha/include/asm/shmparam.h
>   arch/arc/include/asm/shmparam.h
>   arch/arm64/include/asm/shmparam.h
>   arch/arm/include/asm/shmparam.h
>   arch/csky/include/asm/shmparam.h
>   arch/ia64/include/asm/shmparam.h
>   arch/mips/include/asm/shmparam.h
>   arch/nds32/include/asm/shmparam.h
>   arch/nios2/include/asm/shmparam.h
>   arch/parisc/include/asm/shmparam.h
>   arch/powerpc/include/asm/shmparam.h
>   arch/s390/include/asm/shmparam.h
>   arch/sh/include/asm/shmparam.h
>   arch/sparc/include/asm/shmparam.h
>   arch/x86/include/asm/shmparam.h
>   arch/xtensa/include/asm/shmparam.h
>
> Strangely, some users of the asm-generic wrapper export shmparam.h
>
>   $ git grep 'generic-y += shmparam.h'
>   arch/c6x/include/uapi/asm/Kbuild:generic-y += shmparam.h
>   arch/h8300/include/uapi/asm/Kbuild:generic-y += shmparam.h
>   arch/hexagon/include/uapi/asm/Kbuild:generic-y += shmparam.h
>   arch/m68k/include/uapi/asm/Kbuild:generic-y += shmparam.h
>   arch/microblaze/include/uapi/asm/Kbuild:generic-y += shmparam.h
>   arch/openrisc/include/uapi/asm/Kbuild:generic-y += shmparam.h
>   arch/riscv/include/asm/Kbuild:generic-y += shmparam.h
>   arch/unicore32/include/uapi/asm/Kbuild:generic-y += shmparam.h
>
> The newly added riscv correctly creates the asm-generic wrapper
> in the kernel space, but the others (c6x, h8300, hexagon, m68k,
> microblaze, openrisc, unicore32) create the one in the uapi directory.
>
> Digging into the git history, now I guess fcc8487d477a ("uapi:
> export all headers under uapi directories") was the misconversion.
> Prior to that commit, no architecture exported to shmparam.h
> As its commit description said, that commit exported shmparam.h
> for c6x, h8300, hexagon, m68k, openrisc, unicore32.
>
> 83f0124ad81e ("microblaze: remove asm-generic wrapper headers")
> accidentally exported shmparam.h for microblaze.
>
> This commit unexports shmparam.h for those architectures.
>
> There is no more reason to export include/uapi/asm-generic/shmparam.h,
> so it has been moved to include/asm-generic/shmparam.h
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks for your patch!

include/uapi/asm-generic/shmparam.h contains a single definition:

    #define SHMLBA PAGE_SIZE         /* attach addr a multiple of this */

So this definition is not used by userspace?

Note that it is refered to by include/uapi/linux/shm.h, albeit in a comment:

    #define SHM_RND         020000  /* round attach address to SHMLBA
boundary */

Glibc provides its own definition in /usr/include/x86_64-linux-gnu/bits/shm.h

    #define SHMLBA (__getpagesize ())

So probably this is safe.

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
