Return-Path: <SRS0=Rh5D=OG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A19CC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 04:42:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32A2F611C6
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 04:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32A2F611C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gCka2YnjDwDCfeutd1FSE1H2jSUEgYorrMUvUZtW83M=; b=na1x3ySpvgs3e8
	cE95W4R4xOqEoSHWWibY19z7SonfnhjtYI90mVJehL1AqDj89bZ3PC3idd0wk8vGtc7g65sodgCzQ
	qzK/Qrz1Zhyk5l2ejFlGARXwt6CZTE9ljdiGAw2fVdDOL53ZullPbx0eNUtbBD8AJ8A0n6P/esc9n
	mopURGd1FXXHXvT2cT9xAWwMZxJnoj0+O2LzavKonN6D40hCc0qD7F6vjec2EtpZ6Ajq4lQ1JfxbW
	LY5g/3zvtuFRj0OHgdLpchvP46iUN2qcv2k9GLYXAKy5NaCm2SF9CLrsIUiR1Tci9NqiRLSkmnDVN
	WkrBM9DvmoTjuO54ywAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQjER-00AJgH-0u; Thu, 16 Sep 2021 04:42:43 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQjEN-00AJfX-Hd
 for linux-riscv@lists.infradead.org; Thu, 16 Sep 2021 04:42:41 +0000
Received: by mail-yb1-xb35.google.com with SMTP id y16so10434019ybm.3
 for <linux-riscv@lists.infradead.org>; Wed, 15 Sep 2021 21:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FI6YcgDTwmh92T2Tz0zE+YLI6Tc+4Fm0YSTJ17PXswQ=;
 b=becGQyFpbtC4G/09KFN7ZM9j4ZAjZDFIlLPI4icTAnOAuMMuV2pUbVZIQmpnBXmzNq
 H/zKbZzlXSBmQJJrNIKm4qqwLXN3fjm1VAK6sRBLEo3JGbF9B+68TG9LV/Q1DWCT1PIa
 G3FfSyFoelepOtGOkEZF+ugdBNbcwyiigfW9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FI6YcgDTwmh92T2Tz0zE+YLI6Tc+4Fm0YSTJ17PXswQ=;
 b=Ftbum4pfFQI31etO/7vjdWeEdMZhDkHpJ9eVNp9B6X+9tuYDbHNCDWivR/hupKFlZo
 jfcWlpVswdGCdtyfpFtC906TUAyvQ6/r0zPENyiTYA871g98Ll+VnYax5s0jLacVx9SS
 CE1B+fhHlGRKj0Q49evUvDZsIe1oXK/WVTXpUjZ9VgUjPx4fcWfmmJucjcZH3jm5Haw1
 qlDISuPm1rlEY+qtmootjoaqFgn2899hOhnUv4BCh0PUg9+9gCeqbmV9t518weFlesqR
 KTiQpC5rZg/wmfoe4b2vcgYr3k/AkAR2+YT5i/IXtlGHIzKI63Og9pXs8e1VAfV8RKNa
 2T1Q==
X-Gm-Message-State: AOAM530IXceulwxdS0dkfQtP/mV+2ujO3IP7IX6pcOAYFZDO07NNaoCR
 xdiiJ5YKYzAKypkC4CuTxA5RSiPWhsnUIHZCQ2ev
X-Google-Smtp-Source: ABdhPJzX4DibkVG6ODqR3hw14RQsMpLCXnQQnm7eQIzxz69L+RLuUsKzkMvS55nHRhEN9xk9I90s1MZ38yc3G4x6Wpo=
X-Received: by 2002:a25:9d83:: with SMTP id v3mr4465092ybp.97.1631767358505;
 Wed, 15 Sep 2021 21:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-5-guoren@kernel.org>
 <20210915075007.GD20024@lst.de>
 <CAJF2gTSgbmff7aTjwTD+rhQroWeaXfjepGeEAmooBV6d4u70kg@mail.gmail.com>
 <CAAhSdy1hdgn94eQKkgG6WtWxf-cNEFnaxPtKTgOKeRaBO5V-zg@mail.gmail.com>
In-Reply-To: <CAAhSdy1hdgn94eQKkgG6WtWxf-cNEFnaxPtKTgOKeRaBO5V-zg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 15 Sep 2021 21:42:27 -0700
Message-ID: <CAOnJCU+j33gaq4rDsXnDotTRnfCxsR81V4aHayNjbg7=DsB3Fw@mail.gmail.com>
Subject: Re: [RFC PATCH V4 4/6] RISC-V: Implement arch_sync_dma* functions
To: Anup Patel <anup@brainfault.org>
Cc: Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 gordan.markus@canonical.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_214239_631783_FAA55836 
X-CRM114-Status: GOOD (  26.21  )
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

On Wed, Sep 15, 2021 at 9:25 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Sep 16, 2021 at 7:03 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Wed, Sep 15, 2021 at 3:50 PM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > On Sat, Sep 11, 2021 at 05:21:37PM +0800, guoren@kernel.org wrote:
> > > > +static void __dma_sync(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> > > > +{
> > > > +     if ((dir == DMA_FROM_DEVICE) && (dma_cache_sync->cache_invalidate))
> > > > +             dma_cache_sync->cache_invalidate(paddr, size);
> > > > +     else if ((dir == DMA_TO_DEVICE) && (dma_cache_sync->cache_clean))
> > > > +             dma_cache_sync->cache_clean(paddr, size);
> > > > +     else if ((dir == DMA_BIDIRECTIONAL) && dma_cache_sync->cache_flush)
> > > > +             dma_cache_sync->cache_flush(paddr, size);
> > > > +}
> > >
> > > Despite various snipplets this is a still pretty much the broken previous
> > > versions.  These need to use the CMO instructions directly which are
> > > about to go into review, and then your SBI can trap on those can call
> > > whatever non-standard mess you're using.
> > I think you mean put an ALTERNATIVE slot in the prologue of __dma_sync?
> >
> > #define ALT_DMA_SYNC()                                           \
> > asm(ALTERNATIVE(".rept 64\n nop\n .endr\n", "<vendor code>",
> > XXX_VENDOR_ID,        \
> >                 ERRATA_XXX, CONFIG_ERRATA_XXX)  \
> >                 : : : "memory")
> >
> > static void __dma_sync(phys_addr_t paddr, size_t size, enum
> > dma_data_direction dir)
> > {
> >         ALT_DMA_SYNC();
> >
> >         /* future cmo codes */
> > }
>
> I think Christoph is suggesting to always use CMO instructions for
> implementing arch specific DMA sync functions. The SBI implementation
> will trap-n-emulate CMO instructions when underlying HW does not
> have it. This means custom cache instructions on D1 can reside in
> the platform support code of OpenSBI.
>
> I also agree with the above suggestion. At least, this will ensure that we
> have only one way of doing cache operations from S-mode perspective
> which is CMO instructions.
>

Sounds good to me. For stralight Socs, we may need to add a l2 cache controller
driver in OpenSBI as well. IIRC, sifive cores do have some M-mode only
CMO instructions
as well but they may not align with CMO spec. I have to double check.


> Regards,
> Anup
>
> >
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
