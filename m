Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B373DC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 13:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7d5+n0wmbNFASjCwHuFkDhHUkdaIL6n3+6TuVpjiWNE=; b=K/bd1V2BhQ2OoM
	XAl5YcXMC0BIuEISsF6fVBSxdtBXGXDR1bi7sGJg+nXJlvj7FhhdvgqqaSbxknciGCp3tqbRuOFje
	knfVeTJbTTWrSIsrrIKwbj/mwshi7I6okYFaFc45kbskh3pchCbNvVjRjz+aDeJAzavN/q5g/0+xp
	Yi/zmchMHLyJSyb92KPxU3xikEfL7OzwelAwZwrI6F58s3AyDeZqVDOeXiZLY/3kwAwT41RLfB0Aq
	R37REd1+iYa6I63FKNdXNCQ8ZpBMqhDPFpjLZrd/Nxr9dO96pAnyXOzTHtXx+lwnhAxoZfXwVj3NU
	yCi2aW2siZmQrM6A1Qzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n01KY-00AOcA-9B; Wed, 22 Dec 2021 13:06:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n01KV-00AOb8-JN
 for linux-riscv@lists.infradead.org; Wed, 22 Dec 2021 13:06:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D7AB61A40
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 13:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03E6C36AF3
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 13:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640178409;
 bh=+Bphm/tiPEFDYNkambYOvXEj7vwizPLJU5NueAxpGbU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jTXhOqo97ggpdKdhYZ0zO3hadSNcDpkK8jqvVEQOd2EOusUvNPlO8UFb1cUEYXQ03
 wMypA+fWhX+CK21LnEBBg59okmpcazUWC4q0J6TEKwPOIlQAp7+JwhZs/tvmwr/YK6
 7D/FtbUewcVF9B4b0piIOlOYIG8FVuLnwzIrSkAhdRyhb1Y0RZT+TcG6WzkoE42062
 Nk4LUDLrlKMrw71mLbqkyAZ3V6fR6K80WIyksz1/PIHDi1XqHdCzWVNuJVENJ1mV00
 Zd1uk1CfPBl+lVoe+IDPzGVb4DsVxVgbKixNyyPHRkw8dd1mDgYMvM5fP82ClysgHS
 yrnxpKbim7G/w==
Received: by mail-ua1-f41.google.com with SMTP id y23so4006380uay.7
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 05:06:49 -0800 (PST)
X-Gm-Message-State: AOAM532JEiuQTUh2+Dl3K9O+GcslRhAtwsRDD5yagLpXh0bzjz+s3gQX
 yl23OxqONi7QcVSlxalsaz9HGKGMPgYIKRS7s4I=
X-Google-Smtp-Source: ABdhPJyDkkqn4EX2hxcOREHl7ssuLgmpk5Qt11X/aLujji1sgU4cXkTBKmYGzlUZVU2QcCBFU9wGQL/zH2P4rpz0fQk=
X-Received: by 2002:a05:6102:a83:: with SMTP id n3mr1059249vsg.2.1640178408618; 
 Wed, 22 Dec 2021 05:06:48 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-3-guoren@kernel.org>
 <CAK8P3a3dS=Ne0Pd2qZc8vB2whM7AUcJ1BNbhtf6EEboWAPpSug@mail.gmail.com>
 <CAJF2gTTN1HZeycK-WOFH0EjmjtBB4T=9de6Qrjs=uhAsLoOFaQ@mail.gmail.com>
 <CAK8P3a3m2Mz4Tvu+3cdji6iq_wvFZsYoyKvnaNKTEjE+ivex6A@mail.gmail.com>
In-Reply-To: <CAK8P3a3m2Mz4Tvu+3cdji6iq_wvFZsYoyKvnaNKTEjE+ivex6A@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 22 Dec 2021 21:06:37 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQEp0hEousuEyp5cPCa5Remb_8HMZ-BXZ393_z7hbne7g@mail.gmail.com>
Message-ID: <CAJF2gTQEp0hEousuEyp5cPCa5Remb_8HMZ-BXZ393_z7hbne7g@mail.gmail.com>
Subject: Re: [PATCH 02/13] riscv: Fixup difference with defconfig
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_050651_744541_3D37F3DF 
X-CRM114-Status: GOOD (  21.08  )
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

On Wed, Dec 22, 2021 at 8:51 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Dec 22, 2021 at 12:34 PM Guo Ren <guoren@kernel.org> wrote:
> > On Wed, Dec 22, 2021 at 1:09 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
> > > If the intention is to keep them in sync, maybe use a fragment for 32-bit
> > > mode, like powerpc or mips do.
> >
> > Some people are familiar with "make rv32_defconfig". There has a
> > 32-bit.config fragment config in arch/riscv/configs/.
> >
> > I've tested with:
> >
> > make ARCH=riscv CROSS_COMPILE=riscv32-buildroot-linux-gnu-
> > EXTRA_CFLAGS+=-g O=../build-rv32/ defconfig 32-bit.config
> >
> > The above is tested Okay, do you mean we should delete rv32_defconfig?
> > I think it's another topic, I just want them the same in "compat"
> > patchset.
>
> I think what you can do is to add rv32_defconfig as a target in
> arch/riscv/Makefile the same way as rv32_randconfig, and then
> delete the other file, that will keep the existing process working
> for any existing users.
Good idea, I would try.

>
> Given that there are no specific rv32 SoC implementations supported
> by the kernel today (other than SOC_VIRT), the number of users
> would be close to zero anyway.
I really agree with you, but we still need the rv32 user mode
ecosystem for memory footprint.

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
