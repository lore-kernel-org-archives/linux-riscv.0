Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3178C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 14:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7opeLN/KUFKeEzL485lptD2in6wcjeCsjfV3MtmdUI=; b=Bug7nHm4UkUcF2
	k8h+Uy1mrmTR0g9cYvBBMpZduFfdSW8++4RSspO2x+ASMk8kEaoOxPS+tevgh4SONLJ1/or6+bu1+
	nV1R6Il4W6dzmJ2w+P2lfRkZEn6zFfovIcou077RfbtNChdKLqwXvgFc2G6YbeF2dBsxbOE+p2aqC
	6yh62COHpNoZ9NDLq+5gp3kskoif76N15AoRtABkaFCiz/Anu3ChoPApFrNgLpPcEVjhGeOWz2y5H
	GRxTdn40zzBqnN87jzK0DSUBd9pvx4zxIHflzC3li7VkvczsJsHZewnwmR0Z1H3cR4oPJHRgqQFu/
	Fwi110v2F3eChHee05bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAYek-00BxDx-7s; Thu, 20 Jan 2022 14:43:18 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAYeX-00BxAF-BF; Thu, 20 Jan 2022 14:43:07 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N32y5-1m9crJ1Nu9-013Q4r; Thu, 20 Jan 2022 15:43:00 +0100
Received: by mail-oi1-f175.google.com with SMTP id bf5so9192353oib.4;
 Thu, 20 Jan 2022 06:42:59 -0800 (PST)
X-Gm-Message-State: AOAM531biRL5XYJLKA4g4TkVMgEJEWhoaEeioHeMIHb00MncT88rGMcD
 mPbvDHoQBz79cW4w+4wI2QBqnwfqeQg7t0V1kJw=
X-Google-Smtp-Source: ABdhPJx7CtRumP0QQYfXweJthBATxPSWS8llRiPfBtrUDHNd5XtCBWTkqgRw8si0X+m1xq787CRD7WnkdtRMWwwXsuo=
X-Received: by 2002:a05:6808:1490:: with SMTP id
 e16mr7781849oiw.84.1642689778452; 
 Thu, 20 Jan 2022 06:42:58 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-9-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-9-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 15:42:42 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0LxB3we9wHOa4OPmNow6wz5NP49zeYhh7QXNv-MiR8UA@mail.gmail.com>
Message-ID: <CAK8P3a0LxB3we9wHOa4OPmNow6wz5NP49zeYhh7QXNv-MiR8UA@mail.gmail.com>
Subject: Re: [PATCH V3 08/17] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:dMKauVZVVkdMbwA0KSioFm8Wr64Q5NyLdLrLn4IF/RX8a/bGP/q
 wCS99mwPPoEfAoN+EMG+Duwwq8StYpE3YmakDQTlXXI4D1FuXnFgdxtJO77GVIocPkVuCYE
 AFOmWXu3aXFs3zswu1whMx3d3HModfnu9oNUD6fd1jZwAsvdKIROnS8O0bY2Kk7bKN9jia6
 Ro8aAntBtT2ezDKnthGxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YgN0oisu7r4=:QwoQlC8i7E6JbzaeRHDWY5
 2HFCJoelDfBhUpwYwaeD55HaqYU2Ae5wDevm0yQhzMDPlkkCcfM6OSxXAA6rt6Sgvj1B/F+I6
 ZvScOqahxT7WJ37l0qhr2ES9NWxks+Au2/mfUZNpEJghjKP9qVdQU+EfACa0sg+U2eFqoxxhs
 FMAkhGEREpIyEU0mNKQypS+saCNDZi8o+m91OTS3nGuWHGKHRrBtl7J6pScl+D+EyKlS84cC0
 TV4tMcDUJe2EpYs1IJ0hbs9av7lavuD1LBobsZOlMrafE5XzxHAcSQgjnINgqBcxj3ee8Krdo
 vDqyeKQ3/gf9zSGf+24U4Y/7Oqj6qS+Zd1/j5Hw2obZwiwohUjSIYC0MAlqoOtDxqCman2e20
 eeAdl64goM+8KoKfjyP11JoZ8UK/wl4PsGpVYeTGL2iPblkkGqJ0kW1Oj3dmODxHI+xAVD0et
 gY+PG6zXWyh23wpl7URxSpkWkdxPlHwV5mhjma+ZJcKqDFirrwe6DmQmV80iQSGN80Z3oxGY/
 B77jyExmjxy2+hiN/oiecW65vMTP/az68Qv2THMHbIFWBZ1vAkQMQBATafFvrUngRUlf0lpQl
 tLOuUzDO1DN4s=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_064305_687377_958C53A4 
X-CRM114-Status: GOOD (  15.11  )
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

On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
>
>  /* The array of function pointers for syscalls. */
>  extern void * const sys_call_table[];
> +#ifdef CONFIG_COMPAT
> +extern void * const compat_sys_call_table[];
> +#endif

No need for the #ifdef, the normal convention is to just define the
extern declaration unconditionally for symbols that may or may not be defined.

> +COMPAT_SYSCALL_DEFINE3(truncate64, const char __user *, pathname,
> +                      arg_u32p(length))
> +{
> +       return ksys_truncate(pathname, arg_u64(length));
> +}

Are you sure these are the right calling conventions? According to [1],
I think the 64-bit argument should be in an aligned pair of registers,
which means you need an extra pad argument as in the arm64 version
of these functions. Same for ftruncate64, pread64, pwrite64, and
readahead.

> +COMPAT_SYSCALL_DEFINE3(ftruncate64, unsigned int, fd, arg_u32p(length))
> +{
> +       return ksys_ftruncate(fd, arg_u64(length));
> +}
> +
> +COMPAT_SYSCALL_DEFINE6(fallocate, int, fd, int, mode,
> +                      arg_u32p(offset), arg_u32p(len))
> +{
> +       return ksys_fallocate(fd, mode, arg_u64(offset), arg_u64(len));
> +}
> +
> +COMPAT_SYSCALL_DEFINE5(pread64, unsigned int, fd, char __user *, buf,
> +                      size_t, count, arg_u32p(pos))
> +{
> +       return ksys_pread64(fd, buf, count, arg_u64(pos));
> +}
> +
> +COMPAT_SYSCALL_DEFINE5(pwrite64, unsigned int, fd,
> +                      const char __user *, buf, size_t, count, arg_u32p(pos))
> +{
> +       return ksys_pwrite64(fd, buf, count, arg_u64(pos));
> +}
> +
> +COMPAT_SYSCALL_DEFINE6(sync_file_range, int, fd, arg_u32p(offset),
> +                      arg_u32p(nbytes), unsigned int, flags)
> +{
> +       return ksys_sync_file_range(fd, arg_u64(offset), arg_u64(nbytes),
> +                                   flags);
> +}
> +
> +COMPAT_SYSCALL_DEFINE4(readahead, int, fd, arg_u32p(offset),
> +                      size_t, count)
> +{
> +       return ksys_readahead(fd, arg_u64(offset), count);
> +}
> +
> +COMPAT_SYSCALL_DEFINE6(fadvise64_64, int, fd, int, advice, arg_u32p(offset),
> +                      arg_u32p(len))
> +{
> +       return ksys_fadvise64_64(fd, arg_u64(offset), arg_u64(len), advice);
> +}

I still feel like these should be the common implementations next to the
native handlers inside of an #ifdef CONFIG_COMPAT.

The names clash with the custom versions defined for powerpc and sparc,
but the duplicates look compatible if you can account for the padded
argument and the lo/hi order of the pairs, so could just be removed here
(all other architectures use custom function names instead).

        Arnd

[1] https://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
