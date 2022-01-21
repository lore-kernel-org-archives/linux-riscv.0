Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9963C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jan 2022 07:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ZZMsiQ5wGdiJvz/XaGn4v0AXik52pj4Hrse/qpAIIA=; b=QdnQ6chJKhYAUc
	Be5x+QUvgXxhGpYmExAdk4sdIx0emxmfwsanqASXcWbfLE7XwmiYr45UB02CSH1m3t0PDGPc3a8t3
	oXQsv6zpUMQ5wNnUoWakVwSUzuzcRCswDsrVDBy3MFzNgJR0fXJX6MnlDzcEjRq5XjxujO3Oln9l+
	9hj8nhLHcdiv3K0+Tl/9r/Dampyw4IZdH4A3HxI828lqu4GJgnrNy0dfTVFKuZYZPtjW+J+CH4PMq
	/Su5QCTbovRrr35NMQEMNwl3KHtblekkGNYfTSvK9TM3X6tGoy/KI14voSHxKLswSADZIXCgRImWY
	Mfes1MYY3hla6h5Ny4Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAntt-00E0fQ-3R; Fri, 21 Jan 2022 06:59:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAntg-00E0c4-RT; Fri, 21 Jan 2022 06:59:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D87F6177A;
 Fri, 21 Jan 2022 06:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9A6C340EF;
 Fri, 21 Jan 2022 06:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642748382;
 bh=4ShAu9TMO9pCCFhxDCpJN37xIb8io+l6Oyhyz+wkc74=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rkWc8GrmU4jDh8MIgKhU1tVmZnCPK978zpVeaoKL9BABXmrLvJhp7qT1axvVYenFf
 EXl+ILKxghGdYexiqzYSqUGqzgOJdRw9gxLBkPt1lugs/J2H5kUsa8aA2+geA99vJC
 kLBagAY8ht9vk/XtIQSnuK2KgVnBG1tZNY3D+9ZpekZpAe6KG4Y1gKHuohLVN8Frmz
 tT2NlAfoov0vkk9BzpknOsIfrUfWc/Co/Jj4RBd96p/9JkewBRZ2gjADB/m/KTeuzB
 RegN4xP87sZHPeAD0ROhV9YXpgX9yXjHzCBlxEjIP0LlJnVH/PD2rGtIyqpYIfLIwl
 Ft604c34avssg==
Received: by mail-vk1-f178.google.com with SMTP id 19so5027064vkl.2;
 Thu, 20 Jan 2022 22:59:42 -0800 (PST)
X-Gm-Message-State: AOAM533lGeHy9H1wi6UDrFMDc74GSpLbHmJQ9UawuDSAiBQiy+7KqwPo
 eAa5NYMZh5ceWcdaznIXc1FSEluoD79SnSeZHao=
X-Google-Smtp-Source: ABdhPJzfHGuI3QjQ1xrUHESSAg6lyHrYGXHJnEkduCUf4mRHX9u1+bm5wEa4HeHgEF2DEq8OtNRB3r3xOJW73X//3VQ=
X-Received: by 2002:ac5:cbc8:: with SMTP id h8mr1146902vkn.8.1642748381690;
 Thu, 20 Jan 2022 22:59:41 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-7-guoren@kernel.org>
 <CAK8P3a00uYPBBphpipBoqCnGFwr_C9vDzS1p1iLN==YTVOARug@mail.gmail.com>
In-Reply-To: <CAK8P3a00uYPBBphpipBoqCnGFwr_C9vDzS1p1iLN==YTVOARug@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Jan 2022 14:59:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQVgDkyVdoezsrA4AN=9C7RMOxZBCyLB2JvQkKYsLud3Q@mail.gmail.com>
Message-ID: <CAJF2gTQVgDkyVdoezsrA4AN=9C7RMOxZBCyLB2JvQkKYsLud3Q@mail.gmail.com>
Subject: Re: [PATCH V3 06/17] riscv: compat: Add basic compat date type
 implementation
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_225944_956572_C6CE98DE 
X-CRM114-Status: GOOD (  14.91  )
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

On Thu, Jan 20, 2022 at 5:35 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jan 20, 2022 at 8:38 AM <guoren@kernel.org> wrote:
>
> > @@ -0,0 +1,136 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_COMPAT_H
> > +#define __ASM_COMPAT_H
> > +
> > +#define compat_mode_t  compat_mode_t
> > +typedef u16            compat_mode_t;
>
> I think this one is wrong, as rv32 should get the native definition from
>
> include/uapi/asm-generic/posix_types.h:typedef unsigned int     __kernel_mode_t;
>
> I think it works if you just remove those two lines. The rest looks good to me.
Yes, you are right. compat_mode_t should be unsigned int.

>
>        Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
