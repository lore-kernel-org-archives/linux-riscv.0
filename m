Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6044C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 13:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S40eQbY5npRBPiTQM4K81r+cq6E+KcHDZHqJ8rCLRUI=; b=E2eheoZvzTV1yu
	p7HCBj4awDFgtYBiz5BNRETVkTlM9PxweYOQiSlRdmtfS4z54RxLJZduNDLEuP044MT+7iEj4GPJo
	L8LwM6VTtQ1yOwEOb8PEBFgKLse5yq+BGX9dHCWwwLueVCFXf4+iDjhPF8onK5sqrTwAEMqYUdzsp
	TL8C1pRd5FksFuvPnny5ghOjmIIS6qQKMrBb43GXhsNExk+GcQtBue9ByBosxecjIc/GnVq6P/Tcb
	SinxJRw4o9Rmv6su4d0Z8LTYKDOE1MRBAO3SdEcwjRQfFmVTXpk8zEyB5TFEpInWgY5IaJ2n79NtX
	2EC9FY+JNA/CiESl6Q4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOfnv-00CScm-Pa; Mon, 28 Feb 2022 13:11:07 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOfUr-00CLWx-9B; Mon, 28 Feb 2022 12:51:27 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MidPj-1nt4Ix3hSx-00fm5O; Mon, 28 Feb 2022 13:51:20 +0100
Received: by mail-wr1-f46.google.com with SMTP id v21so15270210wrv.5;
 Mon, 28 Feb 2022 04:51:20 -0800 (PST)
X-Gm-Message-State: AOAM531WrBnS4cDBf/FA6VNpw+QzJgzb7NYwpvkuSn45eImDZKaQbOAd
 JM3LpFIZ1A42A84wx7aSPi5TZkBPKzvYOoDgpQY=
X-Google-Smtp-Source: ABdhPJxqAXtjqyu3XGhO9l+qeiMZpUmH3VvfwpXSNlGORAG+H/kTZ6DoBe9bebMaudh7ucMT2NCbvco6L/QKSBCYl4U=
X-Received: by 2002:a5d:63c2:0:b0:1ef:840e:e139 with SMTP id
 c2-20020a5d63c2000000b001ef840ee139mr8301106wrw.192.1646052680182; Mon, 28
 Feb 2022 04:51:20 -0800 (PST)
MIME-Version: 1.0
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-4-guoren@kernel.org>
 <b8e765910e274c0fb574ff23f88b881c@AcuMS.aculab.com>
 <CAJF2gTRQ0XWSjoEeREtEGr5PPD-rHrBKFY_i6_9uW3eEN_6muQ@mail.gmail.com>
 <e5ee4f6799704bd59b0c580157a05d2d@AcuMS.aculab.com>
 <CAJF2gTQhFK55z4juC7uHpWmHsEXSOkbMyXeid6KsnhfPRo7wqg@mail.gmail.com>
In-Reply-To: <CAJF2gTQhFK55z4juC7uHpWmHsEXSOkbMyXeid6KsnhfPRo7wqg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 28 Feb 2022 13:51:03 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0ZXuGWO+n2ghxhXmxntZAk_HPDmsk3cigdh2FBMQcKYA@mail.gmail.com>
Message-ID: <CAK8P3a0ZXuGWO+n2ghxhXmxntZAk_HPDmsk3cigdh2FBMQcKYA@mail.gmail.com>
Subject: Re: [PATCH V7 03/20] compat: consolidate the compat_flock{,
 64} definition
To: Guo Ren <guoren@kernel.org>
Cc: David Laight <David.Laight@aculab.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "arnd@arndb.de" <arnd@arndb.de>, "anup@brainfault.org" <anup@brainfault.org>, 
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
 "liush@allwinnertech.com" <liush@allwinnertech.com>,
 "wefu@redhat.com" <wefu@redhat.com>, 
 "drew@beagleboard.org" <drew@beagleboard.org>, 
 "wangjunqiang@iscas.ac.cn" <wangjunqiang@iscas.ac.cn>,
 "hch@lst.de" <hch@lst.de>, 
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, 
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, 
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "x86@kernel.org" <x86@kernel.org>
X-Provags-ID: V03:K1:Q+eNMlU2VItdky6+oDV8lM/N6wMEVquLZqGum0fB2ke+GvxIPB3
 ndsLfiNAZWFXsTG4Y+zkQPJUZomrH6HaKQxpMbvRZ9yAlj9Ny2LJ/USV7VHsEb1vDRSAqAs
 GbBCUGl2kSzO+DHNX7Q9Zeprsls4MJHqlnv4qlA3o/pzNdNEhKLQpk7XFoR4/8Nrv99PVtY
 STBPT+chRHNNY4gc12WtA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nUJ7eIzQFH4=:v5kRJZtnkcFyCrGWPW43fo
 lbBopdPXWkkpvoVhGNGogRNNFDq70R4WGdeTlxA3EcrLckbP6LVEDFUf3Qs56LNQwa+OaaL9O
 zhHiJKz7UeLZKy5LjYVrV0NfOcz5KmGzoA4wnUJ5lUrB5U7GoZ+lHQ6VO7jvTGX9gs+sXi/EI
 DpkxmaNm913QMX7xIqfWonGzRfw7nQBgRaF/M35JuP1moLVW3AcQDdb2Me6Ak7CVYGbffeqki
 AU+O0cdU1ZsU1xM16dyTG/SUiB5h5qESImJ/jf6UrTMtP2xOv19YxNWlWRien8A/WkiU/0jTW
 e3qwvuvMSmOvBspS3e/fDVoaHRCjmestZzM66QfbJeJNFXkMkpTtQSqFFaPqBZWXeAM7fZPUG
 4Jikua2pXYcvO9YpBYhC2UJ6HPPrZ6BhZl1Q0h0YCOciB0PJJvStNTIHuYYwVLXX839kqa9p0
 dZMqQz95PpwddgNNDW9rJA0MnLFFDve76osRM93cveDR1gHSDC3X0uClMTpQBKkLYg13V1dXO
 fNLb7mIkSOj9VygmcI7TOBJXYmuK7oKMYCMk6zDe6qTUnr55ZF6ZEkbc2pnQCka1wXwPcFFGK
 9GrFJ0S2sD+4LrlLLAY794fa/2zRfSyAcWDajTQ/YD2zuORgDQbwlx5k25DodC6kEHTnaKUkA
 QAQHxZl02PKVCkUs8piDLVml81B9pOW82kCtb7cL5WmXfN4BhmCRCYR1WdxWxEW9my+lQeikc
 CdBCuqPYPiHTj8x0seMAZMuG+Z/evipWO4TsOZXSpN3ehYtlqpmwFOqC7BZ63vwjBg2w+Ekyw
 o17JOLC/UirdsxPo3E5CyrH5teB69lL3Zdna2Cv3cxs1fJBL4c=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_045125_644201_7A29606E 
X-CRM114-Status: GOOD (  19.26  )
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

On Mon, Feb 28, 2022 at 1:13 PM Guo Ren <guoren@kernel.org> wrote:
> On Mon, Feb 28, 2022 at 8:02 PM David Laight <David.Laight@aculab.com> wrote:
> > From: Guo Ren Sent: 28 February 2022 11:52
> > > On Mon, Feb 28, 2022 at 2:40 PM David Laight <David.Laight@aculab.com> wrote:
> > > > ...
> > > > > +struct compat_flock64 {
> > > > > +     short           l_type;
> > > > > +     short           l_whence;
> > > > > +     compat_loff_t   l_start;
> > > > > +     compat_loff_t   l_len;
> > > > > +     compat_pid_t    l_pid;
> > > > > +#ifdef __ARCH_COMPAT_FLOCK64_PAD
> > > > > +     __ARCH_COMPAT_FLOCK64_PAD
> > > > > +#endif
> > > > > +} __ARCH_COMPAT_FLOCK64_PACK;
> > > > > +
> > > >
> > > > Provided compat_loff_t are correctly defined with __aligned__(4)
> > > See include/asm-generic/compat.h
> > >
> > > typedef s64 compat_loff_t;
> > >
> > > Only:
> > > #ifdef CONFIG_COMPAT_FOR_U64_ALIGNMENT
> > > typedef s64 __attribute__((aligned(4))) compat_s64;
> > >
> > > So how do you think compat_loff_t could be defined with __aligned__(4)?
> >
> > compat_loff_t should be compat_s64 not s64.
> >
> > The same should be done for all 64bit 'compat' types.
> Changing
> typedef s64 compat_loff_t;
> to
> typedef compat_s64 compat_loff_t;
>
> should be another patch and it affects all architectures, I don't
> think we should involve it in this series.

Agreed, your patch (originally from Christoph) looks fine, it correctly
transforms the seven copies of the structure into a shared version.

There is always more that can be improved, but for this series,
I think you have already done enough.

> look at kernel/power/user.c:
> struct compat_resume_swap_area {
>         compat_loff_t offset;
>         u32 dev;
> } __packed;
>
> I thnk keep "typedef s64 compat_loff_t;" is a sensible choice for
> COMPAT support patchset series.

The only references to compat_loff_t that we have in the kernel
could all be simplified by defining compat_loff_t as compat_s64
instead of s64, but it has no impact on correctness here.

Let's make sure you get your series into 5.18, and then David can
follow-up with any further cleanups after that.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
