Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87633C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Dec 2021 15:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5dw9L21x+8MD6Q29XFfyR5Ai6/RJUUGDPLpGx/ElVA=; b=jsrM8gAwY0BM/M
	kU8aqTWlmq3Tty7MWd9o7epHI+EcgfsUmp5xB84gIDIBCUTFxMKKnIXT+rSpf4Gn7nCL67ReJtnIB
	E4iSaUrnahhOZYrmHFR/ipBu+1lZ71Vl8KbgZYRxk9ygbP/gA1WmI/meXTe1a7TXFP0PkZTt0F5d2
	xPg57yBC9LFmnMRKEBFLLz8i7vePwEeIuRtnFMX4zirvOw72/dPsEaHb99XBOa3LL4SO5UhW35BMH
	Xtr/AC005gEAtX3qegVKEz8mWlNtBtq3236ZqTJCQb62YUUNEETVRDOBRvkwGjnAmwbTDtLleRhAG
	E3i/N8bUZQykUJncoYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1VWz-00FepN-7I; Sun, 26 Dec 2021 15:33:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1VWw-00Fep2-6D
 for linux-riscv@lists.infradead.org; Sun, 26 Dec 2021 15:33:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7CC6060E2D
 for <linux-riscv@lists.infradead.org>; Sun, 26 Dec 2021 15:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577B9C36AEF
 for <linux-riscv@lists.infradead.org>; Sun, 26 Dec 2021 15:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640532828;
 bh=qXjCXDpcPsPTyQ6ukQoQTfDzaUiRrYwz51aMcieYhNs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZD5yjJFSDFtV7GuuoWbWXv7pNHjN0oL/6U0n9XbGilI1ftdEsbLQwhXaq+KT2Ov33
 s/thjAD/g2s++3W7TXHJD5zVXxLFZJdU62TrUnGu624ct/YMRvo+Er/aN/oLulbUYK
 Nxj7R1/+G0hyCTl4Ls7J2s1B3/+q4kAqNl89ovKcoC6DQ7vVBDLxduKygzqGemVT38
 mP2717ahX/Jz+ui4KUWWibX8DekCghLY/xT3LCPBO5CaEYJRJeIlwyU2+rwmZ6YQdT
 ecTh8X20GL/jXtLOQyo7KIKwFVr80x9A19wsNB5wjbZGD9vePsCCcTOu4L+v1hOTdI
 c4Qk1bylrAM1w==
Received: by mail-ua1-f54.google.com with SMTP id p2so22945916uad.11
 for <linux-riscv@lists.infradead.org>; Sun, 26 Dec 2021 07:33:48 -0800 (PST)
X-Gm-Message-State: AOAM533fNsOpyKl7h9Mgn0dHiRARHXkUWhFwgS5NOGL7TwCdXtU0c3+g
 7qkX8rvEN/kLIRtAEzguVK36wFpaDNxuy683CTQ=
X-Google-Smtp-Source: ABdhPJwyuGNHWPvWYsjivYwMgG2HNt6BpGFerAtNGcDQ5CFKT21wG/23KX6tdhStjNSAJxjyUtFcKM8wYL9/Nj6YrCc=
X-Received: by 2002:ab0:1e4a:: with SMTP id n10mr2054361uak.66.1640532827315; 
 Sun, 26 Dec 2021 07:33:47 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-4-guoren@kernel.org>
 <CAK8P3a3navO2Z2F5zxisby5EBNDo8rwQ6hxSuyniFgFxrQ5qXQ@mail.gmail.com>
 <CAJF2gTSssufQOQTXqzRjY8h_JjAmMs8jC6R+6d09K728=4fOOA@mail.gmail.com>
 <CAK8P3a19n3pa+hRfC-ToTPhH2hvgYY=mXo_u6ZWkbbSSY5_JAA@mail.gmail.com>
In-Reply-To: <CAK8P3a19n3pa+hRfC-ToTPhH2hvgYY=mXo_u6ZWkbbSSY5_JAA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 26 Dec 2021 23:33:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTcafkH5zDYbw=6UhXaHT+SdGskt-+6E==6f08nFj33Gw@mail.gmail.com>
Message-ID: <CAJF2gTTcafkH5zDYbw=6UhXaHT+SdGskt-+6E==6f08nFj33Gw@mail.gmail.com>
Subject: Re: [PATCH 03/13] riscv: compat: Add basic compat date type
 implementation
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
X-CRM114-CacheID: sfid-20211226_073350_351352_A1F3042E 
X-CRM114-Status: GOOD (  17.99  )
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

On Wed, Dec 22, 2021 at 8:47 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Dec 22, 2021 at 1:03 PM Guo Ren <guoren@kernel.org> wrote:
> > On Wed, Dec 22, 2021 at 1:13 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
> > >
> > > > +struct compat_stat {
> > > > +       compat_ulong_t  st_dev;
> > > > +       compat_ulong_t  st_ino;
> > > > +       compat_uint_t   st_mode;
> > > > +       compat_uint_t   st_nlink;
> > >
> > > You should not need a compat_stat, because native rv32 does not have a
> > > stat() syscall.
> > We need it:
> >
> > $ make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-
> > EXTRA_CFLAGS+=-g O=../build-riscv/ Image -j > /dev/null
> > /home/guoren/source/kernel/riscv-linux/fs/stat.c: In function 'cp_compat_stat':
> > /home/guoren/source/kernel/riscv-linux/fs/stat.c:645:21: error:
> > storage size of 'tmp' isn't known
> >   645 |  struct compat_stat tmp;
>
> I think that's just a bug in fs/stat.c. Every other architecture so
> far needed it,
> just not riscv, so we should add an appropriate #ifdef here. I would replace
> #ifdef CONFIG_COMPAT around these with __ARCH_WANT_COMPAT_STAT
> and then change all other compat architectures to define that depending
> on the configuration.
Agree, but I would keep compat_stat in the next version. You could add
__ARCH_WANT_COMPAT_STAT next.

>
>         Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
