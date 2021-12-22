Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8F7C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 12:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCx0sWyfNJ+lHcpV2rLZ0uDrbzNC9sb6PR6S2fLb7CE=; b=0/rxjTdaYfgwQG
	UHJc2GtQatuu5Y9anGA4pZPlhetmfL74twleMrDK7aM62nH8dny8H/LmJozjIqi9NnORVdccQrVt7
	MSp0atia7Iesw6a+CPs3S0KOgyKMrv3FML+b/CvyG4VyIpEFdWyKswILbt771Arszy+Zljo8U2fad
	SpATPKVFVUBzK7WS5OQtPNTZuQ5cul9ss+rzf+QA8JVbXsyKs3gjwl1A+N2T+9jAYfXP83SQc9QHI
	bN6/Jcuj//kZLl4FgMPUphWkRpm2PuyEcwxBe+MGCfZOMEACUSD1i3vNl8s0+Dex+uGZZyAwUelPs
	C24pH4y6ioHDJeyQ4Ijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n011h-00AJwu-CR; Wed, 22 Dec 2021 12:47:25 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n011O-00AJnY-3v
 for linux-riscv@lists.infradead.org; Wed, 22 Dec 2021 12:47:07 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MRn0U-1msxTB3vZa-00THRI for <linux-riscv@lists.infradead.org>; Wed, 22 Dec
 2021 13:47:03 +0100
Received: by mail-wr1-f54.google.com with SMTP id t18so4633440wrg.11
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 04:47:03 -0800 (PST)
X-Gm-Message-State: AOAM533ac3wG8qzBOdOxafWLBA2pLMBnKzMQCBPJbNdR3Ln/KDogs34M
 zzk/jVfMtQxyQe/QN4K8ZhkoHrw8YXClT5Oa4cs=
X-Google-Smtp-Source: ABdhPJzGHS+0FSFJawmPN4qrozHG2jZvyHLpVVATumqQCoz0M2O4wCbSVKWRKxMVEP1zq7AFGcfzbsz2Xb2ui4JNRRk=
X-Received: by 2002:adf:a352:: with SMTP id d18mr2002955wrb.317.1640177223561; 
 Wed, 22 Dec 2021 04:47:03 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-4-guoren@kernel.org>
 <CAK8P3a3navO2Z2F5zxisby5EBNDo8rwQ6hxSuyniFgFxrQ5qXQ@mail.gmail.com>
 <CAJF2gTSssufQOQTXqzRjY8h_JjAmMs8jC6R+6d09K728=4fOOA@mail.gmail.com>
In-Reply-To: <CAJF2gTSssufQOQTXqzRjY8h_JjAmMs8jC6R+6d09K728=4fOOA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Dec 2021 13:46:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a19n3pa+hRfC-ToTPhH2hvgYY=mXo_u6ZWkbbSSY5_JAA@mail.gmail.com>
Message-ID: <CAK8P3a19n3pa+hRfC-ToTPhH2hvgYY=mXo_u6ZWkbbSSY5_JAA@mail.gmail.com>
Subject: Re: [PATCH 03/13] riscv: compat: Add basic compat date type
 implementation
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:kqYOrXN5kVH6M0k+cLffy5pJ66AG/kPQ4/aXAQ88no+fjSm/usk
 xzukGUwb+//SlGbnEkCclYGjZt0wt02ehwiZN+AP7z0JP2M8V6yEIMEmQnZO2xFEIvs7o9s
 t2PVH7yN6+Gp2il97JP52hSRhEzXl0FTWq3w4DS568Cdkyafy6qAj/2lMvT2zbrPIxdNPFz
 G1oVg2Rsbjcv/bSoFJWAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OlLqo28dgcQ=:lfTUw4+zV7UJpI8KYToXG6
 BQW7hyuw2Au5IrqVBOdPH8BkP2JT5fQ1/BCwacNYQNQXT4yM/ElZ74Tei5D1UEVnz3PNfOLk+
 4qjjvHe2/78kW64BWS2FjOplhUBatwNAmId+k63Xq25EDaKba1frvwM9W4rkHGZlMmYKjw/Y0
 KFHmhMIdu2AEDGFyEWV0SvEv5+2bgXtiKr36XW/4rWPZaN+M5qmiQzSJifBsfaosSiyWKTxHp
 +C6Tp/W04w8EV3Ojp8g/pi/MMFa9sXWhRPCX0mpUl9FaXTR8dD4r+ByxAQhbdwBjpLrZZfNlR
 eoajSQ7hEp4xmgyp35jr8naEDxwJAlh/uz0K4LSUBSgzlEe5uqv0VodonvGLhiwyCf4Fe6Ak9
 tbyotre9M8mQRyeg51ff4/738e85W/lepFd3d1A27BkmB4Ck5cpGpA9yr/uByUb5jMpGzUQd6
 9G+PPQ7t/eVjsUILIluNgxoKWOy9C630kVNH7+CNw2diFuwQuKwuezTi9R1i2t2Tv4ZHJThBd
 ufT3iBDUeO+YbjTeYmbLQG1MGl1HP34rnUwtOPDbBRFigEtJ/+w6Uordoeo/eNmrMtNPzqQ+h
 vWyNapYUz1BzBatloF2m5MRo0SRSK1fRIu/nFmiKRayDEdN6A6QaQ6x1Oq3t/Y5Gmh6KW3bCw
 Gi3UAtMWpIoOvdcoQepxqp/Y0t5/nSP+myAQAuRjI1sED4UFNtOuYhRlUWNjztdvbeumhg46o
 aS9UTTE7ttAxRlbB7hQS40DBpQw5VnG8PpVt3/ZM88pF43qH1ee3nssZ9fqZzHdyqDjyEyHZt
 RF6frVHLOt9zMYmOmmBJHPQg+PZQ9hKoLu7RWbqCK20kEnm9Io=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_044706_507856_A3B6FC85 
X-CRM114-Status: GOOD (  13.79  )
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

On Wed, Dec 22, 2021 at 1:03 PM Guo Ren <guoren@kernel.org> wrote:
> On Wed, Dec 22, 2021 at 1:13 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
> >
> > > +struct compat_stat {
> > > +       compat_ulong_t  st_dev;
> > > +       compat_ulong_t  st_ino;
> > > +       compat_uint_t   st_mode;
> > > +       compat_uint_t   st_nlink;
> >
> > You should not need a compat_stat, because native rv32 does not have a
> > stat() syscall.
> We need it:
>
> $ make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-
> EXTRA_CFLAGS+=-g O=../build-riscv/ Image -j > /dev/null
> /home/guoren/source/kernel/riscv-linux/fs/stat.c: In function 'cp_compat_stat':
> /home/guoren/source/kernel/riscv-linux/fs/stat.c:645:21: error:
> storage size of 'tmp' isn't known
>   645 |  struct compat_stat tmp;

I think that's just a bug in fs/stat.c. Every other architecture so
far needed it,
just not riscv, so we should add an appropriate #ifdef here. I would replace
#ifdef CONFIG_COMPAT around these with __ARCH_WANT_COMPAT_STAT
and then change all other compat architectures to define that depending
on the configuration.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
