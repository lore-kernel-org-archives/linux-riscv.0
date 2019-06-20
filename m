Return-Path: <SRS0=Cc3s=UT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B8EC43613
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2019 18:40:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F4CC20656
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2019 18:40:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HlxLucFN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHrCrl9f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F4CC20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfjQgabM4XZiL4Xvgm6rtSO0KUTrZg++x3RzVNe1lfE=; b=HlxLucFN8TEeFA
	VwO2n/EwC8BS1+6cA20AI2FNsbe0uXgjYdRGUw4n8CX7vvqgsmxtSe7WCv329frBA1ooOMtHZst9V
	rkCAO/fP/zxEdZd+CNCTep8MYLXjGEyHR46yabS66xufOinq+sXdCVT4douOBSXXQpFmG80RollRV
	AMjh/F9ObhhI8VKuTkYFZCM8roHoVArc6ON6a/Y+o3+gQDreVlPYm4Gb1fR+IYRSup2i2uwuXFutV
	bWZnJCj2r62zoUj7E+XS0ZGhjOHbRmmHDcz7HczakbEFZ6SarfG4s8bqPtVPa13A4MmtGkp0bh8Ap
	Xb1HchNeVZe6y5ojSkBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1he1yp-0004mq-6G; Thu, 20 Jun 2019 18:40:15 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he1ym-0004mA-Nr
 for linux-riscv@lists.infradead.org; Thu, 20 Jun 2019 18:40:14 +0000
Received: by mail-wr1-x443.google.com with SMTP id n4so4013392wrw.13
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2019 11:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B2+bsHieq4A/+E5x9NOCK7Eg/tOyvnXucdeZEJ0h77U=;
 b=OHrCrl9fZmniwxVYQNzznREbqV7HoH3zsatHHAzP6xOT63Hny6JzQsvJjl5sasuV3d
 Cz8vitbJoHMVpAfa+xmeJ/1r5qlsmH6J7rYsMpYI9IOCABRTF+k4uFTUvkwZLQY9ykaY
 GTQsr6PTdtcKQU7zfgNxhUNU1MKp5mdhfxm9v6G3XdbtTghbvp2tHX2N6/hgIwEuRCJ9
 CEzHAmUoLZntOyFJ84m/QNHj+C6YE/Tte1/rqDwF66+iFPJXbkMx83EGXh5whm7egNdi
 Xhds3Fid1yrRCTr9XwgOh0x4FRLNK8q1OuJKhqUXEHrSNrnUIw45kSsxjU6Pv6AqFpIp
 XUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B2+bsHieq4A/+E5x9NOCK7Eg/tOyvnXucdeZEJ0h77U=;
 b=OAvagBwIgrYhC8GtXbYCwSy63PcwI/kZnTMXKxRvfmcAi/sacM9DNjCcEqJ1RYQLAa
 8hF2RPmaBEzZVTLZ+pNk0iduaZR2XlO7FOgdWQhT0aXVQvwvOpfT0fw+ZyuwSUDn6N6y
 Lr2U2h6cVzumr7Iv6p+ZESWD0jxuqNUzwDp1Rluq4qf5i/PSn8Icdf0D+150TSwJAL8U
 qfIVwjArTEmZ/bC6kGRsZk1/Yvq8zDxDjO8acOL9YjRuarOuNrfRlC4hQdYdUzs+QPjr
 CL79Iz2flX0d4X8vMxUQarubPTLWbg6NgVmD1wOOGF4BwDkXp9rdNEYU5S2PK/tRJjOp
 dDhg==
X-Gm-Message-State: APjAAAXLPaXxfWp8F8LzhAcGNWkCfthUj3Q3rEWaNFQ4s1QSg56q177g
 DdfO6QHcKaI6K6GkRTgv9S2VaVTXizJpDmY1KCk=
X-Google-Smtp-Source: APXvYqwSvkerhZRLiDyb7noHRAaL3Lg+lOGJD4/qiLq3safH3CpYYtWGwY+fABdBIO5JfcrBBBqoZDhGNasnw016sIU=
X-Received: by 2002:adf:afe8:: with SMTP id y40mr13100663wrd.328.1561056010808; 
 Thu, 20 Jun 2019 11:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <338f944c74c7540f71c27f30f5b46405b8440de3.camel@wdc.com>
 <c4a72786b3bee65ca2d5971e42cb22edf6cf7fce.camel@wdc.com>
 <CAAhSdy2-2tQ_ToRqBcB=q6Z5biZMvfQ9ok7hW508KjJM9fMNJQ@mail.gmail.com>
 <d66f7e401e27bcc486e6cf94eab3fd2ad9c0be30.camel@wdc.com>
In-Reply-To: <d66f7e401e27bcc486e6cf94eab3fd2ad9c0be30.camel@wdc.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Thu, 20 Jun 2019 21:39:58 +0300
Message-ID: <CAEn-LTq2bhbz3hJfU1Gcr1d_e=Om24S6=2f1PW0BWn7aXwPgHw@mail.gmail.com>
Subject: Re: HiFive Unleashed DT problem with 5.3-rc1 upstream kernel
To: Atish Patra <Atish.Patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_114012_783618_A246157E 
X-CRM114-Status: GOOD (  28.27  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, "mafm@debian.org" <mafm@debian.org>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "mark.corbin@embecosm.com" <mark.corbin@embecosm.com>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "rjones@redhat.com" <rjones@redhat.com>, Anup Patel <Anup.Patel@wdc.com>,
 "merker@debian.org" <merker@debian.org>,
 "yash.shah@sifive.com" <yash.shah@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "lukas.auer@aisec.fraunhofer.de" <lukas.auer@aisec.fraunhofer.de>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "wxjstz@126.com" <wxjstz@126.com>,
 "schwab@linux-m68k.org" <schwab@linux-m68k.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "hch@lst.de" <hch@lst.de>, "khilman@baylibre.com" <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 20, 2019 at 8:58 PM Atish Patra <Atish.Patra@wdc.com> wrote:
>
> On Thu, 2019-06-20 at 08:50 +0530, Anup Patel wrote:
> > On Thu, Jun 20, 2019 at 1:36 AM Atish Patra <Atish.Patra@wdc.com>
> > wrote:
> > > On Wed, 2019-06-19 at 13:02 -0700, Atish Patra wrote:
> > > > Hi All,
> > > >
> > > > We have been waiting for upstream kernel to boot on HiFive
> > > > Unleashed
> > > > for some time. Finally, all the required drivers will be
> > > > available in
> > > > 5.3-rc1 as Yash[1] & Paul's[2] patches are queued for merging.
> > > > Yay!!
> > > >
> > > > However, the DT/drivers in kernel are not backward compatible
> > > > with
> > > > the
> > > > DT provided by FSBL. That means, everybody need to upgrade to the
> > > > new
> > > > DT if they want to use upstream kernel. Here are some possible
> > > > approaches to allow a smooth transition.
> > > >
> > > > 1. Embedd the DT in OpenSBI directly and build it by default for
> > > > unleashed platform. (discussed in OpenSBI mailing list [3])
> > > >
> > > > Pros: No change in anybody's build system as long as they use
> > > > latest
> > > > OpenSBI.
> > > >
> > > > Cons: This sets a bad precedent for future platforms as OpenSBI
> > > > should
> > > > not be the place to keep/maintain device tress.
> > > >
> > > > It will also break non-Linux OS that have not upgraded their DT
> > > > to
> > > > match with kernel.
> > > >
> > > > 2. Link the updated DTB maintained by kernel using
> > > > FW_PAYLOAD_FDT_PATH
> > > > in OpenSBI.
> > > >
> > > > Pros: DT is maintained by kernel and OpenSBI just use the already
> > > > built
> > > > DTB.
> > > >
> > > > Cons: Creates a dependancy on Linux build system.
> > > > All Linux distro maintainers now have to update their build
> > > > script to
> > > > add that option and all documentation need to be updated.
> > > >
> > > > 3. Update FSBL:
> > > >
> > > > Pros: Cleanest approach.
> > > >
> > > > Cons: Everybody has to upgrade the FSBL which is not a simple ask
> > > > for
> > > > everyone. There is no FSBL binary available publicly as well. So
> > > > everybody has to build FSBL first.
> > > >
> > > > Any other possible solutions?
> > > >
> > > > Till now, 2 seems to be the preferred choice for now. Approach 3
> > > > is
> > > > also okay for longer term solution (given that FSBL binary and
> > > > instructions are available timely). But approach 2 requires extra
> > > > work
> > > > on distro maintainers. That's why we want to get an agreement
> > > > with
> > > > them
> > > > before recommonding any specific approach to anybody in the
> > > > community.
> > > >
> > > > Thoughts ?
> > > >
> > >
> > > Argh. I messed up the subject line first time.
> > > Sorry for the noise.
> >
> > I have 4th option which is even cleaner that 3rd option
> >
> > 4. U-Boot_SPL/Coreboot replace FSBL
> > The U-Boot_SPL/Coreboot will replace FSBL and load OpenSBI
> > FW_DYNAMIC, Platform DTB, and U-Boot_S_mode from boot
> > device (MMC/Flash). We can update OpenSBI FW_DYNAMIC,
> > Platform DTB, or U-Boot_S_mode separately anytime without
> > updating other images.
> >
> > Pros: Better than option 3
> >
> > Cons: None that I can think of.
> >
> > IMHO, it's right time replace FSBL with U-Boot_SPL/Coreboot
> > once and for all.
>
> +Lukas, + Xiang
>
> I completely agree that replacing FSBL with U-Boot SPL/coreboot is the
> best possible solution. However, the implementation of either one is
> not available upstream. Please correct me if I am wrong.
>
> So we need an intermediate solution until that happens. It seems that
> approach 2 is okay with majority. We have not heard anything from
> Fedora/debian folks though.
>

Here is my opinion from Fedora camp.

The preferred option would be U-Boot SPL for already mentioned
reason:
"... for the reason of using the same bootloader technology stack."

We already ship U-Boot SPL binaries for a high number of AArch64
and ARMv7 boards. Ideally we don't want to depend on external DTBs
stored in /boot (like it's done in Fedora ARMv7). The default DTB should
be built into the firmware (FSBL-style), but there might be an option
to pass external one for development/debugging reasons (i.e. override
the default one in firmware).

For me firmware (incl. DTB) is part of hardware.

SiFive Unleashed is a development board with a test chip, and it ships
in a low volumes thus right now I would just rebuild FSBL with new DTB
and provide instructions how to flash it.

>
> >  Also, running entire U-Boot in M-mode is just
> > an overkill.
> >
>
>
>
> > Regards,
> > Anup
> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
