Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194CDC04FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 16:40:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE70B610FC
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 16:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE70B610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lOYU4nympvxsVBlJtYFvXja0Lx9qyxwoaVD41qvG40=; b=So5SuhSpmA72Gj
	jQk5aO+E8KT3XIPQyHQgwq406kVNFjX6glObajzWE6LTv3Se+JddckwDndSCahd5bk7byxFNpY90P
	zwRGO1gQJayagbBS0G8ZNZlh4aLNhMIVNgRsnnE89IHvotrSa7m5CaTvLpZHDmhPYZKuj9a3JtRtn
	cCM6xeO9emFkCU6j4AqSIh6fNaO4FXgvzkLIrhUDX8/Wm1gJyl1WZGUKJpfGuxCaLJJxW3iP1gy5V
	D6X610XBbq3TrQevFPdaM5Ale2Qtuo76wzlqKDanACbh2bZlAqE2v+darS29msWljzFZvxHZ5TLkx
	ngyp33BPyRaIsrRA/V8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llDcR-0018in-Mw; Mon, 24 May 2021 16:39:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll7lM-000pcC-Qb; Mon, 24 May 2021 10:24:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D2F161244;
 Mon, 24 May 2021 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621851884;
 bh=5wBiRHHSXJ69cFUjecB+aszzqhwYw/MhJXDMzSU3aiY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pK5GXFlN+YCuMLzRkryTFyUpVJAEwnP0vbi3xwjP6jH9zyZMvzC+0XT1/9n95bQrX
 77LPElvDmRwpEyjQ+Vt2rM4mAftSlCmR3oAMqfvsLQcddtFOpEfI+5OzLlommq+unm
 c1z9WKpYVrqqyRfaU1taNHEmXE5BpBfWetH1DWWfEW/q/4tSC9ActrMFlHWvRG91xV
 Iqt+xObwQDaIb1/6PpcojSSUO5P/HgU3bRs4B/TiDYp2fpqk0zZEpP1wralYzG9VK/
 2jMz7BaHTQs3BvgixAc5+Jfiil5oTbuXt0An5RS7g5NDy1QAwgsgxn7CU3wRk9FYs+
 Fyx6wyS0qENIw==
Received: by mail-oo1-f46.google.com with SMTP id
 v13-20020a4ac00d0000b029020b43b918eeso6231514oop.9; 
 Mon, 24 May 2021 03:24:44 -0700 (PDT)
X-Gm-Message-State: AOAM531afqjJP0YqrejNFoeF9Uhg56bcRR3VPEzlxOVoXrDGWauvY+3O
 CpZSUjjpm0V8yT2vMDsHKnwhDRJxeBe/1XAztSk=
X-Google-Smtp-Source: ABdhPJxuRHMn0Kx2Oweu4bILN4JMFbNf9fmAY08NovL1123TdXfK6IfWv4QLAq1YGWdjz8Wx+wrSdvtwgHP/dZgbZHc=
X-Received: by 2002:a4a:b202:: with SMTP id d2mr17739259ooo.13.1621851883493; 
 Mon, 24 May 2021 03:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210521192907.3040644-1-javierm@redhat.com>
In-Reply-To: <20210521192907.3040644-1-javierm@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 24 May 2021 12:24:32 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGrDm5yN5eRZJ0YAjCde=0Xw7hobC9Oz5CNovo0sWuM+g@mail.gmail.com>
Message-ID: <CAMj1kXGrDm5yN5eRZJ0YAjCde=0Xw7hobC9Oz5CNovo0sWuM+g@mail.gmail.com>
Subject: Re: [PATCH 0/2] allow the sysfb support to be used in non-x86 arches
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel@ffwll.ch>, Peter Robinson <pbrobinson@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Hans de Goede <hdegoede@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Ingo Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Russell King <linux@armlinux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_032444_924792_1C519386 
X-CRM114-Status: GOOD (  21.26  )
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

Hello Javier,

On Fri, 21 May 2021 at 21:29, Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> The x86 architecture platform has a Generic System Framebuffers (sysfb)
> support, that register a system frambuffer platform devices. It either
> registers a "simple-framebuffer" for the simple{fb,drm} drivers or legacy
> VGA/EFI FB devices for the vgafb/efifb drivers.
>
> Besides this, the EFI initialization code used by other architectures such
> as aarch64 and riscv, has similar logic but only register an EFI FB device.
>
> The sysfb is generic enough to be reused by other architectures and can be
> moved out of the arch/x86 directory to drivers/firmware, allowing the EFI
> logic used by non-x86 architectures to be folded into sysfb as well.
>
> Patch #1 in this series do the former while patch #2 the latter. This has
> been tested on x86_64 and aarch64 machines using the efifb, simplefb and
> simpledrm drivers. But more testing will be highly appreciated, to make
> sure that no regressions are being introduced by these changes.
>
> Since this touches both arch/{x86,arm,arm64,riscv} and drivers/firmware, I
> don't know how it should be merged. But I didn't find a way to split these.
>

We could merge this via the EFI tree without too much risk of
conflicts, I think.

However, I'd like to see a better explanation of why this is an improvement.
The diffstat does not show a huge net win, and it does not enable
anything we didn't already have before, right?


>
> Javier Martinez Canillas (2):
>   drivers/firmware: move x86 Generic System Framebuffers support
>   drivers/firmware: consolidate EFI framebuffer setup for all arches
>
>  arch/arm/Kconfig                              |  1 +
>  arch/arm/include/asm/efi.h                    |  5 +-
>  arch/arm64/Kconfig                            |  1 +
>  arch/arm64/include/asm/efi.h                  |  5 +-
>  arch/riscv/Kconfig                            |  1 +
>  arch/riscv/include/asm/efi.h                  |  5 +-
>  arch/x86/Kconfig                              | 27 +-----
>  arch/x86/kernel/Makefile                      |  3 -
>  drivers/firmware/Kconfig                      | 30 +++++++
>  drivers/firmware/Makefile                     |  2 +
>  drivers/firmware/efi/Makefile                 |  2 +
>  drivers/firmware/efi/efi-init.c               | 90 -------------------
>  .../firmware/efi}/sysfb_efi.c                 | 79 +++++++++++++++-
>  {arch/x86/kernel => drivers/firmware}/sysfb.c | 42 +++++----
>  .../firmware}/sysfb_simplefb.c                | 31 ++++---
>  .../x86/include/asm => include/linux}/sysfb.h | 34 +++----
>  16 files changed, 182 insertions(+), 176 deletions(-)
>  rename {arch/x86/kernel => drivers/firmware/efi}/sysfb_efi.c (84%)
>  rename {arch/x86/kernel => drivers/firmware}/sysfb.c (70%)
>  rename {arch/x86/kernel => drivers/firmware}/sysfb_simplefb.c (82%)
>  rename {arch/x86/include/asm => include/linux}/sysfb.h (68%)
>
> --
> 2.31.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
