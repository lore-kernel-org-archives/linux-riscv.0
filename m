Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB2AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 13:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Nu4qp0vKb9P5wGG5x8bizvpJmHa+yc3IIruOVw4Tw4=; b=E+JytAEyyavC1e
	1snaP5+V39C//Li8HMrXA/j32L5X9lN4PmeWvgwtSglZITCZVo9F87T3uwj34zp7YVsdGGQ2HGTA4
	gUwiZzM2Gma1yy2IwHpE926OHgv6KiGlJp4BiqDCxX3jccSVH94ER4kj9B2rDFSJ429RW9H1UENyl
	dqkUomj9NxJeOvYrX2WduXt7UejfgXxts0lu1ybJs1xUv03uKkO+PowgXEMGLM+vIajC/o9QXeflK
	CSCUWlppkK5gfR/NzBz5i04OoSodcHunC7OsjNorimq4hlrHq2wYLtmsEpVkOphdO2aOAkwMJC+by
	y3nrYJ9peSHWKH3hR45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAXTT-00BejO-R5; Thu, 20 Jan 2022 13:27:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAXTH-00BeSO-7V; Thu, 20 Jan 2022 13:27:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 646BC6175E;
 Thu, 20 Jan 2022 13:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A391AC340E7;
 Thu, 20 Jan 2022 13:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642685240;
 bh=nij2NveTxD7AFS+dy/E2mbGaK4KnuKanTl6xzPnPkQc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FV+LquNrcNIM4IyWdRQJ+RvURALdqn9xfCmH3u+EPyPxG/8iNUaCslKvqNdupslBw
 QBRP2q+FNxO6+wSFKXMyFDUNcAy6V3evf7SWZUwB8rE9gCJk0lFv2usPRlA4tmXnjW
 vRGqr4TSyisCJv6r/7+ohMVsNxAxtBY3zte/1y5zEGDFC5uZXE7MNp3XDVrgmwwKCy
 AGAIguEIxRllBb8wrI5vQZ0cZFle3X27KHhHktX3rhu2eQxIiCHXn4K2loU116xQoc
 RLuRjDVXG8TasUHF/D9VQs3KiylNZRmOC3843iD+ztRTmijocFRzUI+MmuAOojOLAW
 /CrONDsZ7cwvg==
Received: by mail-vk1-f180.google.com with SMTP id w206so3581690vkd.10;
 Thu, 20 Jan 2022 05:27:20 -0800 (PST)
X-Gm-Message-State: AOAM530f0UByGVcGjqrEOsQaN9BLiY8BIwtI03BX4Bmbo+B4Jon7OXf1
 2dRjeJAD/+8Jb3x6CrAdnFYv+scd7hlQOcgsmYo=
X-Google-Smtp-Source: ABdhPJwXq7rWM9TR2/dX3Ce8RNnGwk7ErUknPTqNCDOUbla5Lz39Gh+9ETVvKbMYpePGn1XdP3gT3y8Rtd9l9zviaqA=
X-Received: by 2002:ac5:cbc8:: with SMTP id h8mr12691275vkn.8.1642685239536;
 Thu, 20 Jan 2022 05:27:19 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-8-guoren@kernel.org>
 <CAK8P3a1UvqsS-D7cVXBkp4KCRWDfquQ6QTkvrQ=FqLxhsAi7Rw@mail.gmail.com>
 <f16cf10425a14c2e8183d5c90667ce72@AcuMS.aculab.com>
In-Reply-To: <f16cf10425a14c2e8183d5c90667ce72@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 20 Jan 2022 21:27:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRwh40xDBkoRJWZEUketKFDAy7_z=-WW7E=T46yH4zPvw@mail.gmail.com>
Message-ID: <CAJF2gTRwh40xDBkoRJWZEUketKFDAy7_z=-WW7E=T46yH4zPvw@mail.gmail.com>
Subject: Re: [PATCH V3 07/17] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
To: David Laight <David.Laight@aculab.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 "inux-parisc@vger.kernel.org" <inux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_052723_366569_AEAB50F8 
X-CRM114-Status: GOOD (  17.50  )
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

On Thu, Jan 20, 2022 at 8:53 PM David Laight <David.Laight@aculab.com> wrote:
>
> > > Limit 32-bit compatible process in 0-2GB virtual address range
> > > (which is enough for real scenarios), because it could avoid
> > > address sign extend problem when 32-bit enter 64-bit and ease
> > > software design.
>
> Eh?
> I thought nearly all the other 32bit unix ports (of any flavour)
> put the user-kernel boundary at 3GB.
No, riscv32 is about 2.4G, csky is 2G/2.5G.

> (Apart from some very old sparc ones that use 3.5GB.)
>
> 2GB is used by Windows.
>
> I think the x86-64 32bit compat code even puts the boundary at 4GB.
Yes, we could give rv32 compat for 4GB with some effort. But it's unnecessary.

There are no history issues for rv32, we use compat mode to reduce
memory footprint. eg: only 64MB memory available.

At end compat for 4GB is another topic, let's give the initial compat
for 2GB support to riscv.

>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
