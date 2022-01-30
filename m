Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4507AC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 11:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlCKd6a1AvEFFNMDkZVNuUc9QoeBqKhy+J+3DEoCtd8=; b=TglUF5ey7DuwQI
	e7HKJIXsCBMYvP5uwa0xnwzrDig3lw91GJgMcRagkE1wu6T8XoyFFymBwtw+Kv3EMqlaQDv17NeYI
	WPDqyzNu+ZFLqYRpnrwr/R5Pos8Ue3UZ1TH0/eSf9y1AlPJsCTbOfN7itOO+pCCR18jZK26MsScs1
	42mEDr3TcHPvyKCgJdrd421XKa0/fUKJJW4WOG3TZ6QIe0lHvwYo/u07M7L2xAGB36Cq15b5b4UrP
	AAaBMwyGztJTBbpsqfqYriG1iXNE8XamIB5ghHQXlNGDFjGqxHT6tZrKujLiNwVYQ7gnB06oeTPgW
	m0Ow0cS3sjXYHurvNcOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nE8Vs-006QTj-Bc; Sun, 30 Jan 2022 11:36:56 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nE8Vf-006QOn-0o; Sun, 30 Jan 2022 11:36:45 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MIdW7-1n04AH3XS1-00EeY6; Sun, 30 Jan 2022 12:36:41 +0100
Received: by mail-oi1-f174.google.com with SMTP id s185so21409711oie.3;
 Sun, 30 Jan 2022 03:36:39 -0800 (PST)
X-Gm-Message-State: AOAM530B/LNXhW/wXXIrr5mQpemGZzdnLbkOfHpMkjhNwvCSAEfcUam8
 zV2mJxVlvDcWM4LINbgkR5vs6oWZUU5Ecg4t+bQ=
X-Google-Smtp-Source: ABdhPJx02/VRPT+lHqxP4cUEJpaptHk8IWYJlq+IlqFxgivaG7fXilNMey5++lAxG71rgAwjbfrXcV/NpMPlqrdhT2Y=
X-Received: by 2002:aca:f03:: with SMTP id 3mr10491465oip.102.1643542598876;
 Sun, 30 Jan 2022 03:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-7-guoren@kernel.org>
 <CAK8P3a3_kVB78-26sxdsEjb3MMcco6U55tc7siCBFZbJjyH6Sw@mail.gmail.com>
 <CAJF2gTThb8_-T0iOFVZoJrvZqeFvjfWB+AdFyOwtGhN9aG-MQQ@mail.gmail.com>
In-Reply-To: <CAJF2gTThb8_-T0iOFVZoJrvZqeFvjfWB+AdFyOwtGhN9aG-MQQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 30 Jan 2022 12:36:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3A9AMyv7ABRpUgrTo3sg+SogoDSG5cudR87iK+PifU4g@mail.gmail.com>
Message-ID: <CAK8P3a3A9AMyv7ABRpUgrTo3sg+SogoDSG5cudR87iK+PifU4g@mail.gmail.com>
Subject: Re: [PATCH V4 06/17] riscv: compat: Add basic compat date type
 implementation
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:IV3NvOXma8zd3LPZ/luEVe4Utx1jP1vtqpjZhijNGqnqjXGoGVa
 sM9cishSNbBB+egdbYRqv/wBNAfbedyvd/QdETbQYEE/djiTgJeIbSOAYt6BLjzU5JX0lHW
 4DJB7Z3T6gpE+DDGOyrtiUc7PLRaZw8nnZdk79YkXxVpAK9+totGM242XzUk1O/jiNEGtnA
 vbRwoD5XPhXxobbljq7hw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0hKwKT7T+mA=:B6i8esaWsuHPXK0n2Q2MQ5
 zwWRleJxFJlQxMM+w2Tua3VyldFkrd3guwqcYlDEbRRwV+VIuCSZ0uxT46qPz63aIGMdwTkLF
 RHniU5d8i7KQ7RyPzjbvAK6ppDsrSxpYr+oZDYp8z0X2jZHMrOoXv/Iuk4t67NcO9nMGDptxm
 90Yu5gu8xWTIudm3pTHggNd5l9ONFzJAYdUI7OI0NZ8c/6VSMMPsSgAxH8+3Hwy2aU86aXLkU
 r72l3IcaMEe/7jRh2MTxiVKowZmaYTjA07aknB+w0ck8rdZxUiTYqlAnjkQaQms9YJ6hDf1N/
 +ALiK2uOnNn4r9mdZB4ABR1E6VvV2rLiom182aEIt2Uk12z0x9jJ30Q1Jch4k4V+WTxjkJEtu
 NYI3zpGI64tbolSR3jazaKbdcL0uzdxYsq7mpXDJVBHdmTc+/eqJxt1KptgvytDwkbIWi9xFg
 BsOUmcKtXgsyQh96kAPrdQb2UeCmJ76E7vxNpCPfhVQgWLXkeILBcdgNYLBm1WX/LDGKgciF0
 OnvlBh/JV9QrtgNSOPG6dSzIGtr6WcI0qL4QeyA/FK5D4vvZ+5FkLA2jpUvsvP63ChkFxyTOj
 /qG/hO8AKgREUCQ+0TQllpPdKOi+pZfFEqipmrMMxc39ivgZpGUjFsJOJK4AB7glO6HpBmFxr
 mHK8ChQ2b0vV+O8XSbn4E/+JHAncT5XaxVTB3d58v9inwuPo6XlMkwYODX9GBAWvA0Zr0ZS+O
 WdfpI9zHdTTS3N56MtAktdnApsO6eV3h5TMq9Pn4Pg3miT7/jnhJN+klRyw6JzPtNhFjt5dV6
 JMkfRMuxXyeM3R32RfpQyOxho39YuQ4mB1Y9UW18imb+h5tuuQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_033643_361830_806A3C19 
X-CRM114-Status: GOOD (  15.71  )
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

On Sun, Jan 30, 2022 at 6:47 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Sun, Jan 30, 2022 at 5:56 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Sat, Jan 29, 2022 at 1:17 PM <guoren@kernel.org> wrote:
> > > +
> > > +#define COMPAT_RLIM_INFINITY   0x7fffffff
> > >
> > > +#define F_GETLK64      12
> > > +#define F_SETLK64      13
> > > +#define F_SETLKW64     14
> >
> > These now come from the generic definitions I think. The flock definitions
> > are just the normal ones,
> Yes, it could be removed after Christoph Hellwig's patch merged.

Rgiht, I keep forgetting that this is a separate series, so this is fine.

> > and AFAICT the RLIM_INIFINITY definition here
> > is actually wrong and should be the default 0xffffffffu to match the
> > native (~0UL) definition.
> Yes, native rv32 used ~0UL, although its task_size is only 2.4GB.

The rlimit range has very little to do with the virtual memory address
limits, it is used for a number of other things that are typically more
limited in practice.

> I would remove #define COMPAT_RLIM_INFINITY   0x7fffffff

Ok.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
