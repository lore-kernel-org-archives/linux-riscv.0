Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A251C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 10:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FtPZrG6VHX9O/s6chyaTOt8vUWCTHzo2cD+EHcJImTQ=; b=zgCRkHuMyh/rjg
	4e+HHYjcKMo6amONzeeRKljvFWhol9NOT50MFWxPleJxCtcP99Hm9wdMqxufNVjnYVqv44FlL9d+R
	LR1Mlo/9+rmzB1Zrl4YXiQGiE9GiJ8gyGJsluqNjfMiaM0b4PQQ9nm2dCiwKOAdKb+9vWgDhxNFfn
	Lc29AmFZ5LY2IxKJfZtIqIxX1PP0s3ha8oIBMXzmrqbkHgrwqwWLv//c+xGgO7/SqLh8B9+C7BNyu
	S6OfEnWiNaWNQO7uplS8/A4MxSI4T4oyG0PjCxsUPr5JD8qASVBOjzfUCUrRZyVHNx5v/M1qLhqtp
	3/cuEQaS7hYZBuy2SY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n29zf-000jJG-47; Tue, 28 Dec 2021 10:46:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n29zc-000jIt-GO
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 10:46:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05E53611AB
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 10:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580E7C36AEF
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 10:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640688367;
 bh=U+V1CkmbZBVFDNrTtu3JXIoCsZNe5+ieKfxsjE6LzTo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vBoaERdeUoN9SARn2rIkRIdBM/RkNV56R3KYHyrO17lU9vQGyzbrGt9xFHq4B6YVw
 17SAGkTQ/GY9bBEr8uFQC9orJoeMp+DMZQZCql6c/r7YZEy4Y9ZuaJ9ZD6pNZEGE1J
 IDvdoqsN7v/y98w1JehD30pRT8hB1tlaPhW95X/lb7YAo8Xl0uh4lr94i1VyV04S7/
 7afrFkCACwce9kUh9SSN++M0yX7yXt2xiUMYsZjBJPUGcTttd2VGVtTu/n0pZ2CWG7
 UcEk30Rfbyfu+yukAyA0iJhQgrp+wkBvRsDVIFx0uaMyAa6LEPzQitTO0W1BsQratW
 31G1llpOA031A==
Received: by mail-ua1-f53.google.com with SMTP id o63so31358133uao.5
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 02:46:07 -0800 (PST)
X-Gm-Message-State: AOAM533NbxFbDhrGY2yTqVij2m0Mlw4B0jMLVrKGj8uFPszNbn+VMnve
 wCUYWJqCrq6VXfsFIwt7aeTaYSrX1BO8embHWCc=
X-Google-Smtp-Source: ABdhPJyJO/QZGPhSWHidfuno57Nt9H8ou5iTVmhz7TytJIpYhTwzD+9zhpoEtxO0maq1+WBuLE9EhmBTohPUIG84hXo=
X-Received: by 2002:a67:e244:: with SMTP id w4mr5472081vse.51.1640688366318;
 Tue, 28 Dec 2021 02:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <CAK8P3a37+0=CCE7283VQ4QZ1tZqcU+A2POUGXtvdM46ZMHx-gw@mail.gmail.com>
 <CAJF2gTRAxX0qEcNmw+5N=3jZcJw9YF75oRjT7Y5FUMUkHoSz4Q@mail.gmail.com>
 <20211226162223.795f9417@xhacker>
 <CAJF2gTRHND1F_-5+Euzy-UdRRdg2oAXDY4dt8_5p9JxsHDSe6Q@mail.gmail.com>
 <CAK8P3a08kawHpz6RsLZsvNNn0_WKaFWRU-7M4fJ3e7i7J+GQcA@mail.gmail.com>
 <CAJF2gTQ04utyOc9=q9Tu92togGuyygKgq3tWwfPBCuyTfLh2SQ@mail.gmail.com>
 <AA7091EA-C3AF-47CE-B0C5-E2ECE4133D09@jrtc27.com>
In-Reply-To: <AA7091EA-C3AF-47CE-B0C5-E2ECE4133D09@jrtc27.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 28 Dec 2021 18:45:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS20NDDWSacEt0mhBeR-t4pZbeS43CDq9eSqHpjzHHdVA@mail.gmail.com>
Message-ID: <CAJF2gTS20NDDWSacEt0mhBeR-t4pZbeS43CDq9eSqHpjzHHdVA@mail.gmail.com>
Subject: Re: [PATCH 00/13] riscv: compat: Add COMPAT mode support for rv64
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_024608_674299_2C613EB8 
X-CRM114-Status: GOOD (  27.76  )
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

On Mon, Dec 27, 2021 at 10:29 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 27 Dec 2021, at 01:16, Guo Ren <guoren@kernel.org> wrote:
> >
> > On Mon, Dec 27, 2021 at 4:31 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> On Sun, Dec 26, 2021 at 7:38 AM Guo Ren <guoren@kernel.org> wrote:
> >>> On Sun, Dec 26, 2021 at 4:36 PM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
> >>>> On Wed, 22 Dec 2021 20:59:30 +0800 Guo Ren <guoren@kernel.org> wrote:
> >>>>> On Wed, Dec 22, 2021 at 2:10 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >>>>
> >>>> What about adding RV64 ILP32 support instead? This don't need HW side
> >>>> modifications so can benefit all RV64.
> >>>
> >>> ILP32 is another topic in C Language Data Type Models and it couldn't
> >>> replace the standard rv32 ecosystem.
> >>> COMPAT is a common framework in Linux (7 arches have been supported),
> >>> so let rv64 support COMPAT mode is considerable.
> >>>
> >>> Customers would choose ILP32 / RV32-compat by themself and that
> >>> depends on which one has a better ecosystem.
> >>
> >> From a kernel perspective, supporting both is not much more work than
> >> supporting either of them. We had the same debate for Arm64, and ended
> >> up never merging the ILP32 patches despite them being well written
> >> and maintainable, to limit the number of supported user space ABIs
> >> as well as the possible attack vectors when there is an exploitable
> >> bug that is specific to an ABI.
> >>
> >> arm64 does support big-endian mode, which is a similar niche, but it
> >> can't easily be removed after it's already supported. Supporting normal
> >> compat mode is the easiest here because it doesn't add another user
> >> space ABI, but I'd strongly recommend not to add any other ones.
> >
> > @Palmer Dabbelt How do you think about supporting ILP32 & COMPAT both
> > in rv64? And let users vote by foot which is better.
>
> As psABI TG co-chair I really do not want an ILP32 RV64 to exist if it
> can at all be avoided. Every single attempt at an ILP32 ABI for a
> 64-bit architecture has failed to take off in the past, so I struggle
> to see why RV64 will be any different. So, in my opinion, there is a
> relatively high barrier to entry for it to be an official frozen ABI,
> and without it being that I doubt upstreams will want to go near it, be
> it Linux, GCC, binutils or GCC, but they can speak for themselves if
> they feel otherwise.
>
> Also, with every year that goes by, ILP32 becomes more and more limited
> in what you can use it for, due to increased memory footprints...
Agree, I think we are on the right road :)

>
> Jess

>


--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
