Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01728C10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:39:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C76BD21479
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iyb9gsee";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eKENM7Vl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C76BD21479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ArwvJJO+nz/TDQ2M66qFIvopYYScho8C3mKHzts3yzY=; b=iyb9gseeXb98DX
	d3vGQp1Im0JT6Qa97iceylxx3PJV3MdNyxIV+QBHlP8GvwzjLc/CgYbhxM1mXRJit2U79la5M8ZpK
	RZhqQmXUiubKdl/D6Zh23jYO15cDFHSx09E0Xqud/S7cb9qETXfpjhsTiZPKXQcce0QMp7cztuauQ
	EJSjouRqP/2shxF6Dbz+WCEQ3pXbricF1vEPxxLTq8NXzCUDIpO2L36M7Pk2foHpLNgyWxfyLORH+
	qAwEKPfd3s4QWqbpBDsd7fzzCF5Di4fUzvVmccTg2P64lNOaipTwptNM0RvivahJbMVHzgaP9rhn+
	OGtmLyH1GcroEHeqmGhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGzlX-0005Bz-Td; Thu, 18 Apr 2019 05:39:19 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGzlU-0005BY-KZ
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 05:39:18 +0000
Received: by mail-vs1-xe44.google.com with SMTP id o10so498748vsp.12
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I49wvlYq7D5JlBzIeYIfPLcNWvP+zL3hNSqD7FZ7LkY=;
 b=eKENM7VlYogZiu9LKw1HvlthciY0efM2NRwfvhdnWH5UYz7IY9RnPN4yev4Q+SyM9W
 YdiBLhyiVJeHQ9+caxTPQbD0pWn+V0WnnHXoprAgGsJToXR/dAfi6b1L2J3wzGcPrtzu
 FLBCSBvonUpQIBIMq//yfXcrvRxsfl6ta/QN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I49wvlYq7D5JlBzIeYIfPLcNWvP+zL3hNSqD7FZ7LkY=;
 b=CN7J/1lPKEoRB67gXOTvgmA0H8fCu6d+DfqbgiEpO1ce8luDUVIPzl1rEgAekAqg+r
 ONAyfg+4to8WTUt4D7JzxHJ/AJi7hR3y3ZFFvc8DiFsbb2gJKGmrKOKOueSDlGtxXrYV
 EJRzk682D5ffi6frqm1I+NviKovpQiQH6s0db0DfF7YwRvPWSFHfdPkkH+Frzw/TmhdY
 X8cYAVEpTqvnPSIszbT6HfQ43qT5xWWyVlXlggre3ALv7j2FatLiULvzwB/IB2R1Uz82
 d93lZmeM/SwYpGpDPiaOOcGFiGLqeIabPTrFXTWR6xrqOaxfdcKioHO6uVITPf4I/8/v
 4lTg==
X-Gm-Message-State: APjAAAXYKJJmki2n7jXUD3nUSG4p+Z6VT536mxCw85QRX2DQYr2jSMbZ
 baoLiL2ygivbGpfHiZt6o1VXQOM/Qy8=
X-Google-Smtp-Source: APXvYqwcWvtUZogFvSBFqgnLzhUJLTbPUm49aKptCNS6TmZXo3sJOvHkRM6OgHZuoAVoVSGM1lJCOg==
X-Received: by 2002:a67:f90d:: with SMTP id t13mr3628648vsq.53.1555565955242; 
 Wed, 17 Apr 2019 22:39:15 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com.
 [209.85.221.182])
 by smtp.gmail.com with ESMTPSA id 1sm189374uax.3.2019.04.17.22.39.14
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 22:39:15 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id d15so214826vka.8
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:39:14 -0700 (PDT)
X-Received: by 2002:a1f:3c83:: with SMTP id j125mr2514890vka.92.1555565530282; 
 Wed, 17 Apr 2019 22:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-12-alex@ghiti.fr>
In-Reply-To: <20190417052247.17809-12-alex@ghiti.fr>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 18 Apr 2019 00:31:58 -0500
X-Gmail-Original-Message-ID: <CAGXu5jJcQzDQGy907H0WXu-q1sPQaXgjuFbHHW60ajUuksZb3A@mail.gmail.com>
Message-ID: <CAGXu5jJcQzDQGy907H0WXu-q1sPQaXgjuFbHHW60ajUuksZb3A@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] riscv: Make mmap allocation top-down by default
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_223916_701234_B974E9BA 
X-CRM114-Status: GOOD (  15.31  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Burton <paul.burton@mips.com>,
 linux-riscv@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 17, 2019 at 12:34 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> In order to avoid wasting user address space by using bottom-up mmap
> allocation scheme, prefer top-down scheme when possible.
>
> Before:
> root@qemuriscv64:~# cat /proc/self/maps
> 00010000-00016000 r-xp 00000000 fe:00 6389       /bin/cat.coreutils
> 00016000-00017000 r--p 00005000 fe:00 6389       /bin/cat.coreutils
> 00017000-00018000 rw-p 00006000 fe:00 6389       /bin/cat.coreutils
> 00018000-00039000 rw-p 00000000 00:00 0          [heap]
> 1555556000-155556d000 r-xp 00000000 fe:00 7193   /lib/ld-2.28.so
> 155556d000-155556e000 r--p 00016000 fe:00 7193   /lib/ld-2.28.so
> 155556e000-155556f000 rw-p 00017000 fe:00 7193   /lib/ld-2.28.so
> 155556f000-1555570000 rw-p 00000000 00:00 0
> 1555570000-1555572000 r-xp 00000000 00:00 0      [vdso]
> 1555574000-1555576000 rw-p 00000000 00:00 0
> 1555576000-1555674000 r-xp 00000000 fe:00 7187   /lib/libc-2.28.so
> 1555674000-1555678000 r--p 000fd000 fe:00 7187   /lib/libc-2.28.so
> 1555678000-155567a000 rw-p 00101000 fe:00 7187   /lib/libc-2.28.so
> 155567a000-15556a0000 rw-p 00000000 00:00 0
> 3fffb90000-3fffbb1000 rw-p 00000000 00:00 0      [stack]
>
> After:
> root@qemuriscv64:~# cat /proc/self/maps
> 00010000-00016000 r-xp 00000000 fe:00 6389       /bin/cat.coreutils
> 00016000-00017000 r--p 00005000 fe:00 6389       /bin/cat.coreutils
> 00017000-00018000 rw-p 00006000 fe:00 6389       /bin/cat.coreutils
> 00018000-00039000 rw-p 00000000 00:00 0          [heap]
> 3ff7eb6000-3ff7ed8000 rw-p 00000000 00:00 0
> 3ff7ed8000-3ff7fd6000 r-xp 00000000 fe:00 7187   /lib/libc-2.28.so
> 3ff7fd6000-3ff7fda000 r--p 000fd000 fe:00 7187   /lib/libc-2.28.so
> 3ff7fda000-3ff7fdc000 rw-p 00101000 fe:00 7187   /lib/libc-2.28.so
> 3ff7fdc000-3ff7fe2000 rw-p 00000000 00:00 0
> 3ff7fe4000-3ff7fe6000 r-xp 00000000 00:00 0      [vdso]
> 3ff7fe6000-3ff7ffd000 r-xp 00000000 fe:00 7193   /lib/ld-2.28.so
> 3ff7ffd000-3ff7ffe000 r--p 00016000 fe:00 7193   /lib/ld-2.28.so
> 3ff7ffe000-3ff7fff000 rw-p 00017000 fe:00 7193   /lib/ld-2.28.so
> 3ff7fff000-3ff8000000 rw-p 00000000 00:00 0
> 3fff888000-3fff8a9000 rw-p 00000000 00:00 0      [stack]
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/riscv/Kconfig | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index eb56c82d8aa1..f5897e0dbc1c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -49,6 +49,17 @@ config RISCV
>         select GENERIC_IRQ_MULTI_HANDLER
>         select ARCH_HAS_PTE_SPECIAL
>         select HAVE_EBPF_JIT if 64BIT
> +       select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
> +       select HAVE_ARCH_MMAP_RND_BITS
> +
> +config ARCH_MMAP_RND_BITS_MIN
> +       default 18
> +
> +# max bits determined by the following formula:
> +#  VA_BITS - PAGE_SHIFT - 3
> +config ARCH_MMAP_RND_BITS_MAX
> +       default 33 if 64BIT # SV48 based
> +       default 18
>
>  config MMU
>         def_bool y
> --
> 2.20.1
>


-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
