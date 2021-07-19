Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C671C12002
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 07:11:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC92D61029
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 07:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC92D61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMYuWkXp1W39cfKxgXhSMT+PhnsblWFBEHTgvysDngg=; b=F/tcb+6MS++U/z
	hE48SEZLBbZLi7GxpeXg5ycrYNuaFZHWrVyKZ4fGxjvw2j2jkaV+lPOxXxkKy8sskhWGDjQMd26AX
	/GL5x2cd+4n5hoZ2mK965Yf512NXGJFYtGE+J3XTElYIDxpjmS8NGEEbTxFt34nS7nZEfAmxNy0Yn
	JUs5MAAcAtCVq/vfPXunfvMFEIYLZ5rsXzV5iXu/eqBvv2/6sths1Lqe7flWVIzzh5ThN9Jav/+HN
	/xjoaRaa5U6ISGfKdC+l37GKxgUR+W21uVRJkzD/seP/HQKp/JKWnRJcyu33bn6j8u+NOZeexUNvU
	KnZDR1HbNA4SwxdIsZgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5NQt-008Yi0-D3; Mon, 19 Jul 2021 07:11:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5NQe-008Yf6-RR; Mon, 19 Jul 2021 07:11:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F5EC6100B;
 Mon, 19 Jul 2021 07:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626678664;
 bh=Pn/1Cj/0aZG99zqoi3ZzrECnvCBXU+18iWFv6gPyfSM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bCW39FLNMP4SZgn5kgvw/weq+kRv4VAQe9Yl0X9IvGIET79Sv111ytlAfkeuQCy4+
 0auxQNNbNpcDAZM+M+AmJAooC2j7JGbdI3GtyMeTbXItwsz/o3MvlXVKYKvsrfzlAe
 7jHJ2Y7UFFpuEjHACQP7iXhobcygebdszESwk7tiR9tZGSToYXOe/f2ZQKwNNJfA4T
 +WCaVuZ0r1K+eAHklgZ9MhZRHNmWZ65VuHQGHPiQOXyTpeXTvB+DriDAI2568NkFB7
 ZTzq+bOFDk5gzVRiYpdiUuhKiM1fPVCQmHVYae8dSOnQ9xq1yNQaNcSvPR2uHEf6hh
 XHmrehB38snjQ==
Received: by mail-ot1-f51.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so17308801otl.3; 
 Mon, 19 Jul 2021 00:11:04 -0700 (PDT)
X-Gm-Message-State: AOAM532ak6y681b0l8eKSZkGG/zODttciMxO0rVtgkwAwIxfBrW7fwDF
 DUO6TSb+70HP3GTlyE9iYbAePtob3bXJraK3hGU=
X-Google-Smtp-Source: ABdhPJwdHFS1KJDwdJGVFAPZ7EQmJ/6+hWchGT5fri4AF+nsIVeMNNoeRd43R/6tIlkpHhDM1d09UMCoJxuAR70rmFo=
X-Received: by 2002:a05:6830:34a6:: with SMTP id
 c38mr5088922otu.108.1626678663841; 
 Mon, 19 Jul 2021 00:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210625130947.1803678-1-javierm@redhat.com>
 <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
 <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
 <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
In-Reply-To: <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 19 Jul 2021 09:10:52 +0200
X-Gmail-Original-Message-ID: <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
Message-ID: <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
To: Dave Airlie <airlied@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 LKML <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-efi <linux-efi@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>, 
 "the arch/x86 maintainers" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Atish Patra <atish.patra@wdc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Robinson <pbrobinson@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Borislav Petkov <bp@suse.de>, 
 Will Deacon <will@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_001104_965744_C3B2B7D8 
X-CRM114-Status: GOOD (  32.72  )
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

On Mon, 19 Jul 2021 at 04:59, Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 15 Jul 2021 at 18:11, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Hi
> >
> > Am 13.07.21 um 18:59 schrieb Javier Martinez Canillas:
> > > On 6/25/21 3:09 PM, Javier Martinez Canillas wrote:
> > >> The simplefb and simpledrm drivers match against a "simple-framebuffer"
> > >> device, but for aarch64 this is only registered when using Device Trees
> > >> and there's a node with a "simple-framebuffer" compatible string.
> > >>
> > >> There is no code to register a "simple-framebuffer" platform device when
> > >> using EFI instead. In fact, the only platform device that's registered in
> > >> this case is an "efi-framebuffer", which means that the efifb driver is
> > >> the only driver supported to have an early console with EFI on aarch64.
> > >>
> > >> The x86 architecture platform has a Generic System Framebuffers (sysfb)
> > >> support, that register a system frambuffer platform device. It either
> > >> registers a "simple-framebuffer" for the simple{fb,drm} drivers or legacy
> > >> VGA/EFI FB devices for the vgafb/efifb drivers.
> > >>
> > >> The sysfb is generic enough to be reused by other architectures and can be
> > >> moved out of the arch/x86 directory to drivers/firmware, allowing the EFI
> > >> logic used by non-x86 architectures to be folded into sysfb as well.
> > >>
> > >
> > > Any more comments on this series? It would be nice for this to land so the
> > > simpledrm driver could be used on aarch64 EFI systems as well.
> > >
> > > The patches have already been acked by x86 and DRM folks.
> >
> > Time to get this merged, I'd say. People are asking for these patches
> > already.
>
> Can we just merge via drm-misc and make sure the acks are present and
> I'll deal with the fallout if any.
>

Fine with me. Could you stick it on a separate branch so I can double
check whether there are any issues wrt the EFI tree?

Thanks,
Ard.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
