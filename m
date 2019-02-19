Return-Path: <SRS0=ksV6=Q2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18C4C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 20:06:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74FE621738
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 20:06:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ksa4VRtD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74FE621738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ZnTuy9nrig/dmsUkMT4jqsQY8EgMtHEFGaEmmkAGuA=; b=ksa4VRtDn/m8ne
	a9rqfplJXv58cmJtBwEhgMiC67PXsd74aAjpA+SY7LN4CCu7c66gKIlrYxrivaqguZgAIcwcNGQJE
	+jiYvFDfj5MFDVD3ymfjdNJJhysNnbBsqdfR/tOVrAZw0SJKxOLksH8vGJeEFcS2bW1roF8IVuiBp
	N8yqCOkVJQCU9HXUyf6lJC74GmsCrWU+VkKgnAam/htjQxgii113QwCODRneaYU6UkpsHyzN7Uul3
	ATn4c+xuXkxQ+90keGWBNFN/5ugC3sc3CgPHnKZAW0WqH69nFFWyEmNbUL3IDNdw8Vnz8jZr9XdbZ
	ny44FYpiTrIp2jhXUeGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwBev-0005TL-E2; Tue, 19 Feb 2019 20:06:29 +0000
Received: from mail-vs1-f65.google.com ([209.85.217.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwBen-0005LD-1C; Tue, 19 Feb 2019 20:06:22 +0000
Received: by mail-vs1-f65.google.com with SMTP id h132so707407vsd.5;
 Tue, 19 Feb 2019 12:06:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qrPDfFD419WXEO/Ox/P57kfC5mLoe6ykDtuRf6HwQCM=;
 b=SziVFyuFW1yjW15FFdyszc5xcUcyAYeAg2JVAIV+mUCSsNJauVNcyqXov2xk+HHDaJ
 iRpPpnGfIo3xMMzgBypVLJTZcOYQ5Nv+47x9AD2YNw/PSB09so/Ul2MeSpFbUAQeGVgz
 P0HAdYjnGXi8YgSevoUOxKhMuCuPD4LJB1ruKh9P7CXOy9eU/+jJdYKTHZFPm5FlnqJa
 np/Y9IucGfvlFtaz+XmlmF5FOviL3HHPHNTyeEKluJcyK+BUUXB2X9wNHqLsQG7FrbUE
 upVjReUWfJqO9/bGc6D9xLECQ/wABPLpSlXJoHlMXf8xPF4DrsVoFn0efG/Jhmegfnci
 946A==
X-Gm-Message-State: AHQUAuY6BybsopfIZHSasF3MzEvLuXjSBL5aEYp9YrfBk1c4z1MYxdHa
 ZMnpN8v42yTzkk5rhsD1Z2yU1P7x4tbCWsw1MII=
X-Google-Smtp-Source: AHgI3Ib18vAebzMi8QNZdyMzAby/KMYvso9+J5p1Ojoxw8uC/kqVFYjx0IxWnjTNVemie5I0XTSFanp0y00Ao6gKBz8=
X-Received: by 2002:a67:ead0:: with SMTP id s16mr12174157vso.63.1550606776640; 
 Tue, 19 Feb 2019 12:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20190218210712.3503891-1-arnd@arndb.de>
 <20190218210712.3503891-5-arnd@arndb.de>
In-Reply-To: <20190218210712.3503891-5-arnd@arndb.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Feb 2019 21:06:04 +0100
Message-ID: <CAMuHMdVbz=_GFMnKx4PuxpmG9jpdA=Do2XnR3bY5wRZPM3G+Gw@mail.gmail.com>
Subject: Re: [PATCH 4/8] asm-generic: Make time32 syscall numbers optional
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_120621_077298_2BDC0577 
X-CRM114-Status: GOOD (  13.22  )
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 "moderated list:H8/300 ARCHITECTURE"
 <uclinux-h8-devel@lists.sourceforge.jp>, Yury Norov <yury.norov@gmail.com>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Linux API <linux-api@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vineet Gupta <vgupta@synopsys.com>,
 Guo Ren <guoren@kernel.org>, Greentime Hu <green.hu@gmail.com>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Guan Xuetao <gxt@pku.edu.cn>,
 Stafford Horne <shorne@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Arnd,

On Tue, Feb 19, 2019 at 3:34 AM Arnd Bergmann <arnd@arndb.de> wrote:
> We don't want new architectures to even provide the old 32-bit time_t
> based system calls any more, or define the syscall number macros.
>
> Add a new __ARCH_WANT_TIME32_SYSCALLS macro that gets enabled for all
> existing 32-bit architectures so we don't change any current behavior.

... (only) 32-bit architectures using the generic syscall list, right?

> Since this symbol is evaluated in user space as well, we cannot use
> a Kconfig CONFIG_* macro but have to define it in uapi/asm/unistd.h.
>
> On 64-bit architectures, the same system call numbers mostly refer to
> the system calls we want to keep, as they already pass 64-bit time_t.
>
> As new architectures no longer provide these, we need new exceptions
> in checksyscalls.sh.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arc/include/uapi/asm/unistd.h       |  1 +
>  arch/arm64/include/uapi/asm/unistd.h     |  1 +
>  arch/c6x/include/uapi/asm/unistd.h       |  1 +
>  arch/csky/include/uapi/asm/unistd.h      |  1 +
>  arch/h8300/include/uapi/asm/unistd.h     |  1 +
>  arch/hexagon/include/uapi/asm/unistd.h   |  1 +
>  arch/nds32/include/uapi/asm/unistd.h     |  1 +
>  arch/nios2/include/uapi/asm/unistd.h     |  1 +
>  arch/openrisc/include/uapi/asm/unistd.h  |  1 +
>  arch/riscv/include/uapi/asm/unistd.h     |  3 ++
>  arch/unicore32/include/uapi/asm/unistd.h |  1 +
>  include/uapi/asm-generic/unistd.h        | 36 ++++++++++++++++++++++++
>  scripts/checksyscalls.sh                 |  7 +++++
>  13 files changed, 56 insertions(+)

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
