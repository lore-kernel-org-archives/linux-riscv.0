Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0520C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 04:21:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 823BF205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 04:21:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C+iu6Wx1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="rwgVWrIX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 823BF205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1qmM/wRtKq3hrdQ8cllj8cBKQktWlCKOcyZ4zJKGJs=; b=C+iu6Wx1UXtUFg
	VoCxeM/opHPft1dSGUoh9xfhc6n7octdLgIc/sNMF2AScl9huo5quNLazZ6FpGuJEAFWgEDL8PGgC
	sNgcpOp8lbePXDkwuZeCPgJbzHgMDyHG71Ox2qp4yTmkRWFo2OqepBYxZ+lvn/8ngiskWkBn4TwJ6
	BH1gfE9KIlopKNscVHig+/VyjNFOi3QBdHQUMJ8ZDcWF5hHUMtYW/75CIfDW4J0FMMif0Vg6pgCdB
	DJUBiM0cXcmTmORBcLIwJ7D6U9snd4le2udr47w0lhx4ZJaAnvAvaoAsEOCJTabTa75USIjtTM8hb
	JPEIKVzEDp5QGs62YkrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gI4UV-0006qG-Fx; Thu, 01 Nov 2018 04:21:55 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gI4UR-0006oA-U8
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 04:21:53 +0000
Received: by mail-wr1-x443.google.com with SMTP id r10-v6so18743530wrv.6
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 21:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j16l5dr4MqYSx094xWUe0/P9jIVKP+hv7JWO+T5J8ic=;
 b=rwgVWrIXg9mRXMHeQ2B4btxvwj97tNOe1i/n1I877ArZpI8047SYuB99Q1oYJO0ZJI
 vWVsPSk5ZXiN9VBkUPyFJF6Ur3tDeTFR67nxxH6HLEtMivrOhxTrIvpkucnilClwV11C
 RpkI/0OxGpauhkx0JsDuznEGHALFsUEsPEEjCiir3WDG87V/la7MmSrMsmSN+9vZNGAP
 B/q0lEnn+l972XnKr9wBN2hNjnCGrDZC3rhDeLCKsrv3xrDyjjpgwMHVY3DWa+0bIRq/
 BnG+pL5WQtLRhu6jpSaVbnmW5BABn0EoR8yohLaLlgdBCIh0HU+ZOX/lPUiUUWFfwNxr
 q43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j16l5dr4MqYSx094xWUe0/P9jIVKP+hv7JWO+T5J8ic=;
 b=LwxxMWLjzSl9MRZef+Nc4o2bCwImh8k3JHtWMiqaOD3ovzXz3dkfzoIDUbIh3L+1Xm
 rvijAtDrewN6w9cflBADXdVr8GhiHfR0ppIqOpKIMAytDeUe6sv77WZwCjRZQj8bJHg/
 QccVWvQJ0IJaG97odyBCfoxqxWFt5XVTEnLM4KSkxXKYRDtKiqSXvj4VcvGmdTk5vqo6
 /PRU3VrHbIey07V/jstmdPiJf27X6MBjNh8Z7PVrWTl1+ico3kdooeZff/VJJzwOy9Gp
 k6bEF31F9KgxLT2oaXpBm9jkrWqSQ/TNqhpjqWi5p0Gz2AiEzsevvhw8jz+41+rTNKhd
 TgZw==
X-Gm-Message-State: AGRZ1gIr6pTmvkwxVVj/ZkY3rFP3zLJ1z/FwIWzm0uO+6Vl6gm5iaDCw
 vzMR6g5MUeArFxdQBu2TV2+r5kO2zau9vMuHb4AVzw==
X-Google-Smtp-Source: AJdET5e95u3WZPSh9/1hvoCsdZQlLz2Xd5Ro79DftSLmeT+m7eT0MBgRxWGJuf+8F3RwXUq8KWYE+vXLayuAn4Qm53U=
X-Received: by 2002:adf:eb8e:: with SMTP id
 t14-v6mr5156851wrn.109.1541046099000; 
 Wed, 31 Oct 2018 21:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAOesGMjXZNURZ4SdKjssYCcFv3=4MYLBpBpzvvb1rNM-fo=QHQ@mail.gmail.com>
 <mhng-111820e6-59c0-479a-a10f-f3729007ba70@palmer-si-x1c4>
 <CAOesGMj+wXcN_7yvakC=SvtYjO=TTqrs8YiVX1xT7-4p1pC_Mg@mail.gmail.com>
In-Reply-To: <CAOesGMj+wXcN_7yvakC=SvtYjO=TTqrs8YiVX1xT7-4p1pC_Mg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 1 Nov 2018 09:51:28 +0530
Message-ID:
 <CAAhSdy2YeEw7gamK3z=ZD_+qkoDgNRC-CpJaHCJhpZFQpxxefg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: defconfig: Enable printk timestamps
To: Olof Johansson <olof@lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_212151_973008_5E8652C5 
X-CRM114-Status: GOOD (  37.40  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 davem@sunset.davemloft.net, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101042128.JkVVntNLy9Vel5gmZhWoaUs0rd1iNs2UtqeOjZu8lKs@z>

On Thu, Nov 1, 2018 at 4:20 AM Olof Johansson <olof@lixom.net> wrote:
>
> On Wed, Oct 31, 2018 at 1:42 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> >
> > On Wed, 31 Oct 2018 12:20:40 PDT (-0700), Olof Johansson wrote:
> > > On Tue, Oct 30, 2018 at 5:37 AM Anup Patel <anup@brainfault.org> wrote:
> > >>
> > >> The printk timestamps are very useful information to visually see
> > >> where kernel is spending time during boot. It also helps us see
> > >> the timing of hotplug events at runtime.
> > >>
> > >> This patch enables printk timestamps in RISC-V defconfig so that
> > >> we have it enabled by default (similar to other architectures
> > >> such as x86_64, arm64, etc).
> > >>
> > >> Signed-off-by: Anup Patel <anup@brainfault.org>
> > >
> > > Acked-by: Olof Johansson <olof@lixom.net>
> > >
> > > For next time: doing a re-format of the defconfig (to shuffle config
> > > order), plus changes in the same patch, tends to be a bit fragile. For
> > > cases like these, I'd recommend hand-pruning to just flip the one
> > > option if needed, and then have Palmer or Andrew refresh the defconfig
> > > during a merge window if needed (usually quite rare).
> >
> > I poked around and it looks like most architectures have this enabled for at
> > least one defconfig, with the big architectures having it enabled for all of
> > them.
>
> It's pretty convenient to have it on, and I think those who haven't
> probably don't use those defconfigs much.
>
> > I decided to do a bit of a case study here to try and figure out why some
> > architectures have this enabled for some defconfigs but not for others, and as
> > far as I can tell it's just an oversight.  Specifically, looking at sparc32 (#
> > CONFIG_PRINTK_TIME is not set) vs sparc64 (CONFIG_PRINTK_TIME=y) I can't find
> > any reason for the difference.  sparc32's setting can be traced back to
>
> I'm not sure sparc32 is overly active these days, which might help explain it?
>
> >     commit 216da721b881838d639a3987bf8a825e6b4aacdd
> >     Author: David S. Miller <davem@sunset.davemloft.net>
> >     Date:   Sun Dec 17 14:21:34 2006 -0800
> >
> >         [SPARC]: Update defconfig.
> >
> >         Signed-off-by: David S. Miller <davem@davemloft.net>
> >
> > which changes everything in the defconfig, while the sparc64 version dates back to
> >
> >     commit 3ebc284d52757cf39788731f8fddd70a89f7fc23
> >     Author: David S. Miller <davem@sunset.davemloft.net>
> >     Date:   Mon Jan 9 14:36:49 2006 -0800
> >
> >         [SPARC64]: Update defconfig.
> >
> >         Signed-off-by: David S. Miller <davem@davemloft.net>
> >
> > When we first submitted out port upstream we had an empty defconfig, with the
> > theory being that we should just pick whatever the default in Kconfig is for
> > everything.  That's obviously the wrong thing to do because most of those
> > options are bogus.  At the time I didn't care enough to look because I just
> > wanted something to work, but now I find myself asking the question "what goes
> > in a defconfig?"  Is it:
> >
> > * What I, as the maintainer of arch/riscv, want?  That's essentially what it is
> >   now, as we have things like "CONFIG_R8169=y" in there because I happened to
> >   have one sitting around when we needed to plug in an Ethernet card to test
> >   out PCIe.
> > * What distributions expect?  There's a major element of this in there right
> >   now, as half this stuff was just selected because the Debian and Fedora guys
> >   suggested we do so because adding things to the RISC-V defconfig made it
> >   easier to put together their build scripts.  For example, we ended up with
> >   "CONFIG_EXPERT=y" because some setting necessary for the distros was hidden
> >   behind it -- that seems like an odd default.
> > * What users expect?  I'm not even sure who users are in this case, as from my
> >   understating most people use distro kernels and don't twiddle Kconfig
> >   options.
> > * What is necessary to work on RISC-V hardware?  This seems like the most
> >   reasonable use for an arch-specific defconfig, and subsumes things like
> >   "CONFIG_SIFIVE_PLIC=y" because without the PLIC driver nothing will work (but
> >   the PLIC driver shouldn't be enabled by default for all architectures, as
> >   it's useless everywhere else).
> >
> > Maybe I've opened up a big can of worms here...  It just seems silly to have
> > most of our current defconfig be RISC-V specific.
>
> So, on 32-bit ARM we have heavy defconfig proliferation, and for arm64
> there was a push to only have one defconfig. I'm heavily in favor of
> the latter.
>
> On ARM64, the options turned on, are more or less "what makes the
> kernel useful on systems". Anything that would be needed to boot to a
> rootfs tends to be =y, while some other things that might be optional
> and not used everywhere tends to go in as modules.
>
> Beyond that, for the most part it is maintainer preference. I've
> normally turned on platforms and drivers I need for my boot farm on
> the multi*defconfig configs on 32-bit ARM, and the same has been going
> for 64-bit.
>
> Distros will always want something different, for policy reasons or
> otherwise. Main purpose of mainline defconfigs is to make mainline
> kernels useful and bootable, so having more of a superset approach
> makes a lot of sense in my mind.
>
> > Anyway, I'm happy with the change because it meets my "what I want" criteria
> > :).  I'll split it into two parts, though, as that way when someone else has to
> > go to some archaeology on our port they'll be less likely to get lost.
>
> Sounds good to me. On ARM, we sometimes do the "refresh defconfig"
> runs across the board, but not for every release since it tends to get
> churny. Make sure you do it before -rc1 to avoid conflicts if
> contributors base branches on -rc1 and send them to you (probably not
> that common yet).
>

Thanks for the comments Olof and Palmar.

I will break it into two patches and send it right away.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
