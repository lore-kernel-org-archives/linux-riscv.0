Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AFCECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 22:51:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F61E2080A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 22:51:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LMKEBj5Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="YfeAw3mB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F61E2080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x22rRsToUM/2zJzGSg/g9Aa/SEcpBL3SvasrLBrCJWs=; b=LMKEBj5QmAtR1V
	uF8WcroHSAsES4oUdD2hKZPAugFgd5yztBnsRBuanHqI08ZuClaFGw8vky39SbVp8NlOppEaxHSU9
	0jcxQ4PMDPwxLoCmdyW1ZsZ+xS/oj5X+8FkGa7f9uUdRZ+WLNkTlVLzaDP88iMr0MQKbIVfZgGhzh
	dqeaNN08g1i+IDLFYarxgTEqmDKuP9t8dCR2LVMMq+afzqZBFH3eumV1Tvc++B7dtqFJt32UlgJo8
	1qvRxgow+im/yHlI5pq+ZWtnRkdOgyawrsoip6dqHvyvOamaix1v6+rV/xrw1W+/o/YuZJnqS6Gl3
	BWk9dZQ8E4WhUIMZFGtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHzKM-0005gm-1x; Wed, 31 Oct 2018 22:51:06 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHzKI-0005fT-Pr
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 22:51:04 +0000
Received: by mail-lj1-x242.google.com with SMTP id u6-v6so44357ljd.1
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 15:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o+AWPvS1ybMd/GJs1XxIzYJE6EQJCAlsQ6yYrHC9vYM=;
 b=YfeAw3mBtCZ4yDGaXX7TE94z3MlBGMx/dYwsWA6iZ7ElHyA7tv6KzqfFdKyMhE5IvP
 1i070ldez/bVNUDR7JmYZVjU+ryUoOpjUsKL/WrdpZ6PuxBI3qcCLQv7VdOgHaCq/Irn
 LtpIo+HBKalo1KXDn8ZR05PfhL0UI9Ef1IJguHs+UBnBg9U9971sAtsp1QwKg+YhtIFW
 qVuocEyj8hvnSGdqkY+jBwZcjzU98uOylwaSOTsE08Wj66YZSNHfLnDoilDzgGb0blIg
 592ep+Ngng3eXRP5kDFIazXR2+K8dXh7+1+wBLWKeVzvN16xp+bArH9IDeVQjPnPTjeQ
 w3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o+AWPvS1ybMd/GJs1XxIzYJE6EQJCAlsQ6yYrHC9vYM=;
 b=o8l7YYuccFaZNWvC9GNo+lI/zz+6/Qhtmg6vQ+kf2Bm04ypogwzkL2FJP5J+wI3K1r
 iLIgC391EY0pjZBTZpR3X5QphtCpAlfC8NwcHYCxPbDyCLI9xwK2s2Eo9ON7w3J9g0cl
 h+hqYf2rIVyDw2HEaw69KEPKhiTk1DkB+5MnxB3//NhyRT0ydghX7cXPZ+7kENQwwWe0
 u6Y91WO2eYLFI5FilWJBQfBUj2Dk8yXTHy/4pfDr7CMLM756OBL51DL/s+SlCrLlh9Qz
 PB94lS2lq+cm9AhKbbfCE5Ad4Fhbw+Pvt0qXi7+ysr3xZGrwUp9KohgXB8kFQZQDOeLG
 OVTw==
X-Gm-Message-State: AGRZ1gL9MS9suypBmMc6Ea3Xv4a8/jy37UEaXUGl9G/TRLoESvga9MAy
 r8wqWy3xxTkXqpExD2pRaEZAkVMdj5flaoW+t6/Ipw==
X-Google-Smtp-Source: AJdET5edcUhXQKmMP/bWjCjEJ5/yit/gdLNG6PcEkDTk3JuPxcKFGkQSReAqIH4aLvicH8ohswXcJVA8PYzdheL6KrA=
X-Received: by 2002:a2e:94ce:: with SMTP id
 r14-v6mr1531873ljh.34.1541026250462; 
 Wed, 31 Oct 2018 15:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAOesGMjXZNURZ4SdKjssYCcFv3=4MYLBpBpzvvb1rNM-fo=QHQ@mail.gmail.com>
 <mhng-111820e6-59c0-479a-a10f-f3729007ba70@palmer-si-x1c4>
In-Reply-To: <mhng-111820e6-59c0-479a-a10f-f3729007ba70@palmer-si-x1c4>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 31 Oct 2018 15:50:38 -0700
Message-ID:
 <CAOesGMj+wXcN_7yvakC=SvtYjO=TTqrs8YiVX1xT7-4p1pC_Mg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: defconfig: Enable printk timestamps
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_155102_840119_8D1D4B6F 
X-CRM114-Status: GOOD (  31.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, anup@brainfault.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 davem@sunset.davemloft.net, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031225038.unAOgIbm1lAUlADG2ZZBwmrEU7DyZ15CH7ZnhysaJ_s@z>

On Wed, Oct 31, 2018 at 1:42 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 31 Oct 2018 12:20:40 PDT (-0700), Olof Johansson wrote:
> > On Tue, Oct 30, 2018 at 5:37 AM Anup Patel <anup@brainfault.org> wrote:
> >>
> >> The printk timestamps are very useful information to visually see
> >> where kernel is spending time during boot. It also helps us see
> >> the timing of hotplug events at runtime.
> >>
> >> This patch enables printk timestamps in RISC-V defconfig so that
> >> we have it enabled by default (similar to other architectures
> >> such as x86_64, arm64, etc).
> >>
> >> Signed-off-by: Anup Patel <anup@brainfault.org>
> >
> > Acked-by: Olof Johansson <olof@lixom.net>
> >
> > For next time: doing a re-format of the defconfig (to shuffle config
> > order), plus changes in the same patch, tends to be a bit fragile. For
> > cases like these, I'd recommend hand-pruning to just flip the one
> > option if needed, and then have Palmer or Andrew refresh the defconfig
> > during a merge window if needed (usually quite rare).
>
> I poked around and it looks like most architectures have this enabled for at
> least one defconfig, with the big architectures having it enabled for all of
> them.

It's pretty convenient to have it on, and I think those who haven't
probably don't use those defconfigs much.

> I decided to do a bit of a case study here to try and figure out why some
> architectures have this enabled for some defconfigs but not for others, and as
> far as I can tell it's just an oversight.  Specifically, looking at sparc32 (#
> CONFIG_PRINTK_TIME is not set) vs sparc64 (CONFIG_PRINTK_TIME=y) I can't find
> any reason for the difference.  sparc32's setting can be traced back to

I'm not sure sparc32 is overly active these days, which might help explain it?

>     commit 216da721b881838d639a3987bf8a825e6b4aacdd
>     Author: David S. Miller <davem@sunset.davemloft.net>
>     Date:   Sun Dec 17 14:21:34 2006 -0800
>
>         [SPARC]: Update defconfig.
>
>         Signed-off-by: David S. Miller <davem@davemloft.net>
>
> which changes everything in the defconfig, while the sparc64 version dates back to
>
>     commit 3ebc284d52757cf39788731f8fddd70a89f7fc23
>     Author: David S. Miller <davem@sunset.davemloft.net>
>     Date:   Mon Jan 9 14:36:49 2006 -0800
>
>         [SPARC64]: Update defconfig.
>
>         Signed-off-by: David S. Miller <davem@davemloft.net>
>
> When we first submitted out port upstream we had an empty defconfig, with the
> theory being that we should just pick whatever the default in Kconfig is for
> everything.  That's obviously the wrong thing to do because most of those
> options are bogus.  At the time I didn't care enough to look because I just
> wanted something to work, but now I find myself asking the question "what goes
> in a defconfig?"  Is it:
>
> * What I, as the maintainer of arch/riscv, want?  That's essentially what it is
>   now, as we have things like "CONFIG_R8169=y" in there because I happened to
>   have one sitting around when we needed to plug in an Ethernet card to test
>   out PCIe.
> * What distributions expect?  There's a major element of this in there right
>   now, as half this stuff was just selected because the Debian and Fedora guys
>   suggested we do so because adding things to the RISC-V defconfig made it
>   easier to put together their build scripts.  For example, we ended up with
>   "CONFIG_EXPERT=y" because some setting necessary for the distros was hidden
>   behind it -- that seems like an odd default.
> * What users expect?  I'm not even sure who users are in this case, as from my
>   understating most people use distro kernels and don't twiddle Kconfig
>   options.
> * What is necessary to work on RISC-V hardware?  This seems like the most
>   reasonable use for an arch-specific defconfig, and subsumes things like
>   "CONFIG_SIFIVE_PLIC=y" because without the PLIC driver nothing will work (but
>   the PLIC driver shouldn't be enabled by default for all architectures, as
>   it's useless everywhere else).
>
> Maybe I've opened up a big can of worms here...  It just seems silly to have
> most of our current defconfig be RISC-V specific.

So, on 32-bit ARM we have heavy defconfig proliferation, and for arm64
there was a push to only have one defconfig. I'm heavily in favor of
the latter.

On ARM64, the options turned on, are more or less "what makes the
kernel useful on systems". Anything that would be needed to boot to a
rootfs tends to be =y, while some other things that might be optional
and not used everywhere tends to go in as modules.

Beyond that, for the most part it is maintainer preference. I've
normally turned on platforms and drivers I need for my boot farm on
the multi*defconfig configs on 32-bit ARM, and the same has been going
for 64-bit.

Distros will always want something different, for policy reasons or
otherwise. Main purpose of mainline defconfigs is to make mainline
kernels useful and bootable, so having more of a superset approach
makes a lot of sense in my mind.

> Anyway, I'm happy with the change because it meets my "what I want" criteria
> :).  I'll split it into two parts, though, as that way when someone else has to
> go to some archaeology on our port they'll be less likely to get lost.

Sounds good to me. On ARM, we sometimes do the "refresh defconfig"
runs across the board, but not for every release since it tends to get
churny. Make sure you do it before -rc1 to avoid conflicts if
contributors base branches on -rc1 and send them to you (probably not
that common yet).



-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
