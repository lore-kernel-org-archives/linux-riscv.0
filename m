Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DB6C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 10:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4dS/HMbeMfJ4HQZKU1N7Yr4scTDVLmYSHsNZsJcnNi0=; b=odSVbZrqIutEIB
	jAS+4vbCAzO5FtffVYJ+yUrpgtIZjx2UECEJMtd+Ofrk96Wr2T29dZM2z0NhOqBMNxyA3ZJWtAgNq
	nhrEwZeHS22UlLhinMfxiDors1ryWAaAQRXPr1hIKO5kYwu33H5RNzOdsxj9OlgdU37LbSzX5iPok
	mN+hrqf3NW/JCQ3NSHaL6kFNDV6baxZDEE+VB0NSbEd1lfS1REIvMDqKdP9RUcT30pLrNXobEhF4k
	SYSrA6mdix1HKLTWut98YhFwNbZu+/Z6858v1gDiFnHZl0q3PqN7EAIVDbxx+G3XW48tPBKqXkLXk
	dGnuWHhhwod5E1ft/XmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNBPJ-000Lh8-DV; Thu, 24 Feb 2022 10:31:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNBOV-000LNB-DL; Thu, 24 Feb 2022 10:30:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8BCE61648;
 Thu, 24 Feb 2022 10:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75BAC340FC;
 Thu, 24 Feb 2022 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645698641;
 bh=UVBFu/2kd+72msKvbsEhY06n98IaQ0VgsAo0y3uTQ2c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uKMo67CXZRSwdhBzi8/EEN9oztBr9soHLP8RvL0hIDZzDAQWECQ7f8/Z8eugIY42z
 hdfwcBluy+paiOgWEjWvgQKMnK4adKDRPYUcdzCO1eHFfPr8N0p6F+ynpzpVaLf9iv
 CZRG6rIeJEwNiFrzJtmKDTMeHAoxInP0LBcoot5lwoVNesSWsfBfyAK/NsNtQnkts0
 AMlDmrllC81ZcK3cvVTbMA9khRkXj8pu1dHnRsqHjwpW8ZIpgngP/5/BCpTl75RUUI
 vy/3K30H2fYs4D+RRMADFd4EhSy9aqCosQIJHK8SpqR9iXdhesbYPT0MaBTAKEOI9x
 ItmMoXkR49BCQ==
Received: by mail-vk1-f176.google.com with SMTP id x62so914059vkg.6;
 Thu, 24 Feb 2022 02:30:41 -0800 (PST)
X-Gm-Message-State: AOAM532UkT9CHBfXq5gTM0TpKqKMwBCA9I+4DdkulC/b3wpXztG5Ed9u
 0PkZczBuRXM8qE0yy1hqe5LPyeWAXAbbsZ+jxCU=
X-Google-Smtp-Source: ABdhPJzrvZFAbp4Whh2uDrOBDpqD226YSRYRm6BxUCxiOKTwC758aaNZI0rGrTfTm/5o1TQu5AW4BErik6sfPZlMfiQ=
X-Received: by 2002:a1f:2355:0:b0:32a:e5bb:29a1 with SMTP id
 j82-20020a1f2355000000b0032ae5bb29a1mr790584vkj.2.1645698640594; Thu, 24 Feb
 2022 02:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20220224085410.399351-1-guoren@kernel.org>
 <20220224085410.399351-12-guoren@kernel.org>
 <CAK8P3a3wg9S_zPad74FiJzYBn0M9bQyunuKzmH3z_QQrags5ng@mail.gmail.com>
In-Reply-To: <CAK8P3a3wg9S_zPad74FiJzYBn0M9bQyunuKzmH3z_QQrags5ng@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 24 Feb 2022 18:30:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQratosmRtoiKx9xTm3-gBSrnEaWgVrYj1U2WZafR1RVg@mail.gmail.com>
Message-ID: <CAJF2gTQratosmRtoiKx9xTm3-gBSrnEaWgVrYj1U2WZafR1RVg@mail.gmail.com>
Subject: Re: [PATCH V6 11/20] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_023043_599217_E698BCE8 
X-CRM114-Status: GOOD (  16.97  )
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

On Thu, Feb 24, 2022 at 5:38 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Feb 24, 2022 at 9:54 AM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Implement compat sys_call_table and some system call functions:
> > truncate64, ftruncate64, fallocate, pread64, pwrite64,
> > sync_file_range, readahead, fadvise64_64 which need argument
> > translation.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
>
> Here, I was hoping you'd convert some of the other architectures to use
> the same code, but the changes you did do look correct.
>
> Please at least add the missing bit for big-endian architectures here:
>
> +#if !defined(compat_arg_u64) && !defined(CONFIG_CPU_BIG_ENDIAN)
> +#define compat_arg_u64(name)           u32  name##_lo, u32  name##_hi
> +#define compat_arg_u64_dual(name)      u32, name##_lo, u32, name##_hi
> +#define compat_arg_u64_glue(name)      (((u64)name##_hi << 32) | \
> +                                        ((u64)name##_lo & 0xffffffffUL))
> +#endif
>
> with the lo/hi words swapped. With that change:
Got it, I would change it in next version of patch.

>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
