Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA02C388F2
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:37:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65FBF2074B
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d4e8sI1N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="iG5fZ4XP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65FBF2074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vVxu0nVCZn1qgdztv+sP/iNwFqwfuFQFDvOOgqWq6e0=; b=d4e8sI1N5QWxd4EBnzTyMsZRA
	JI2qvMbIquGqWIqfy6WI6+2FggaEwlNu03GXVIxjphIHewZeuwTvLBRZF2LwRHT48TyaQys2Qr9FZ
	ktjVeh+dsdqhpajpzE2vAxtbC5sgfgD1brMrBWluBA2KMpuPrX8suIF6h5Fz+1g5vwf3hIBZRYoz+
	bFDSySGsmuAwyPl5f+oVC9qbWaxJsG71lo8Lg2pVBvNk5mutRksoQFxyswNnwitiLjcvaLpJDkJZA
	xxOEIOqA0SLBH156VWyQIGaQrHWk7hGOW5nbTkLvDPCBdeuku+v2dAowB+q2vQMvJxzF1iuVxG3UF
	tZcdxCMBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka1Aw-00077o-N9; Tue, 03 Nov 2020 18:36:58 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka1Au-00076o-S9
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 18:36:58 +0000
Received: by mail-il1-x144.google.com with SMTP id z2so16988780ilh.11
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 10:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hYbQzlD7g6CgMEWc3wST+ZDYhV+JHgWV0zK7h/WfMj0=;
 b=iG5fZ4XP9AuvacaY3DzFjo+WannOzars7jtIdP0wgaDlrlYSJvqAaB6jd7l1j4CO8p
 9/kZcI/PuZpz3E7mNyYf0nvFqoK5bHBPZQH6nRMdWE5/zcPThauK4IdPzuZBEUeI/TpB
 OktHTxoGsI4069vUpZ22tgkm1d/C77ndMad64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hYbQzlD7g6CgMEWc3wST+ZDYhV+JHgWV0zK7h/WfMj0=;
 b=RbvJ9z71d0MZIYYpfhDO6j4tNptYNz/VKXambImdOoSyIig3lgVIIebLUolHrG4v+h
 2m9wvlxesQbBiLzuhz5c7UqvrwLY51VJkDOC/kLRBJA7tz+PaUcuvA6WYGchvf0ZB0RL
 xwXd8BLfFqWkhciHTcegyr0xuW02waqyfIGELzUXjdOieuMPkeq64EFQoWKlpKDrh+BP
 EnQFVTjqauTTyg0EdbX7VuKDQ/Q7kv1vIJS3FJOxhS3/55hzHApYDDHAHnZ05EsW5W38
 pcTaYpAuNaYSs4Em0e6qZFqNYJvFe0JSK+TqaAA/SwdW+NtyCcPNoThse88Rmw3e4RXY
 2sig==
X-Gm-Message-State: AOAM531kJbw9/QZQHtMlNk6YJkqlyuvB+z0L4GzTagwS7hYhfN6rQ/i8
 w3ZuSsWYkxqLE/zoGiQ166ZLb5x2cUC5JlkJczJv
X-Google-Smtp-Source: ABdhPJx+f5Ogky6p999+76oktJVi6X+vrRgYJsuz5k2oZd0lveLH427nrSylT9VxPXleQYaNaD7hBezO9gV6D/ZVbcc=
X-Received: by 2002:a92:3305:: with SMTP id a5mr174396ilf.219.1604428614935;
 Tue, 03 Nov 2020 10:36:54 -0800 (PST)
MIME-Version: 1.0
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-3-atish.patra@wdc.com>
 <41f1248b-78c6-bac1-410b-9e222368c5f6@codethink.co.uk>
 <CAOnJCUJhQ=Zv0S4iCK4CDzQr_dfkw3J6ycdM=p6=5B2_sL1Ekg@mail.gmail.com>
 <2d7cc829-5df6-6b94-4c8f-9bae6080444e@codethink.co.uk>
 <CAOnJCULejyF9xyLk5M0TXqW_=nn0KM5aE8nhK+1h0Xayd2pKUg@mail.gmail.com>
 <fbe404b5-3bb1-dd00-e558-e4a55960b767@microchip.com>
 <fe079b4a-5410-5cc8-3f5e-8a95b573078a@codethink.co.uk>
In-Reply-To: <fe079b4a-5410-5cc8-3f5e-8a95b573078a@codethink.co.uk>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 Nov 2020 10:36:43 -0800
Message-ID: <CAOnJCUKH77XDymG+jAUYHP+5TC2aabTR4f8jF6s6FqqQNR=_CQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
To: Ben Dooks <ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_133657_020473_FC4A7193 
X-CRM114-Status: GOOD (  24.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Daire McNamara <Daire.McNamara@microchip.com>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Padmarao Begari <Padmarao.Begari@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 3, 2020 at 10:28 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 03/11/2020 18:10, Cyril.Jean@microchip.com wrote:
> > On 11/3/20 3:07 PM, Atish Patra wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>
> >> On Fri, Oct 30, 2020 at 2:20 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> ,snip[
>
> >>>> @Cyril : Can we enable both eMMC & sdcard at the same time ?
> >>> I would put /both/ in but only enable the one in use for the moment.
> >>> Our boards are booting of eMMC as supplied, so this isn't going to work
> >>> as well. The eMMC is 8bit wide, and thus is only delivering 11MB/sec
> >>> instead of 22MB/sec. This performance is still not great, but losing
> >>> half the data-rate is just not good.
> >>>
> >> I am not sure what should be enabled by default. Updating sdcard is much
> >> easier than eMMC card and we use that approach.
> >>
> >> @Cyril: Is there a way that we can enable both ?
> >>
> > Yes, we can enable both but this requires a modification to the FPGA
> > design. One of the guys prototyped this while I was away. We will move
> > this along. This will require reprogramming the FPGA with a new design
> > and HSS version.
> >
> > Regards,
> >
> > Cyril.
>
> I either missed or couldn't find a way of forcing the boot mode to be
> from the SD slot. Have I missed something? At the moment we'd like to
> have more storage available as the ~7G free on the eMMC is not enough.
>

I use tftpboot to load the kernel & DT from the network. SD card is
enabled in this DT and Linux
kernel uses SD slot instead of eMMC.

To summarize, eMMC is used for HSS & U-Boot while SD card is used for
Linux which makes
more storage available to Linux.

IMO, we should enable the sdcard for Linux DT until updated FPGA
design & HSS is available.

> --
> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
>
> https://www.codethink.co.uk/privacy.html



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
