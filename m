Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BD7C4363A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 21:13:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFC212078E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 21:13:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MyGte25B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="kdzNUrb1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFC212078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nXJYCHSH55Oq8sFlvwv3N1+avX+rS7oC5Wq+kF8RPP8=; b=MyGte25B3vV4aac0Puj84yKiJ
	AV6OjwisBXZ7ybS0dMSo4Af3QmUgJyskGAhTCUsDax987+C+iBp7yUXudWtQi3aPvh1qvuaWW7QNk
	WEttXusKLKR9pLhv+5UbMRXH5pk15SrkPh1+PXKeiQ/Rs+w9g0tIGRDfKGeNubH+OlOcSPv4ZuxAc
	tVVtQMpUbZaIpKAHy97jLQnZ1AaGQAsDxKnSRCKR1bALqj2cWlEB9YkXgH0vMF6NKnlz47BN6aEsS
	PfppxfiZbifM94yQvLtwDBaKu0q0SQarcNhwNBjcoDojJMQ7xjRwo7ytu6YIA/KaJkJasfPYfe53G
	ACUOQ++dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPXn2-0004F0-PV; Mon, 05 Oct 2020 21:13:00 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPXmz-0004EA-MQ
 for linux-riscv@lists.infradead.org; Mon, 05 Oct 2020 21:12:58 +0000
Received: by mail-il1-x143.google.com with SMTP id c5so9153092ilk.11
 for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2020 14:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hKXwSMve9PnldoH43kS3Xgw5qsEbRZ3Kf03jpGjBYtg=;
 b=kdzNUrb1DhZ2jENYGiwAQKI6NwynyshSmiBq14W8rPg2MF0psG+TQ2FRmPIcYQW/bm
 YdinuQL1h+9HkZZ+MIFLcgfrLEpZT4Se5cjqeZOREyJ9Yx4wGfhrrE0KK9jDsBVjSGbd
 hlrOhl31YH5Otjhzo7Sg4w3G7dNl7mQUad1gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hKXwSMve9PnldoH43kS3Xgw5qsEbRZ3Kf03jpGjBYtg=;
 b=giQVtu2JtveAdy3d3BrMtdrumwIka0PemG5C0TH32eRsXjL/mI1kMUVlnL8pTrp7dR
 jyHUE/rAxr2md5Wybq5AL6mOMTG5cb1hrMC9teknb2HxIG0+phRgQmdss+wn+2aQCdhR
 LaZWyc3x/vWK2ofIvxfbCkdF+/oDRdLM8qoRdeYVJYxN9yxIYqVSqwK4qP/YDDburej1
 3E7BWMIG3FShYPOEEKVO2qSsQgbd4+vDXNwNq2b0tip9aciKC4/UpGju8OTOqktdmMcz
 2YQIAqUXIW6ZL9596g5V9SBuC5xGNUKQqsJPJe2nd1kRsWsY8Xm8Y6DV9taezWuQxKGo
 ZsJQ==
X-Gm-Message-State: AOAM530O/G4VLd23TWOlN3ks12vk42dTsjmuSAx7dgpDSAq7IGYU30cM
 SN/zKrqDWXMwFnDVS2ycbV9bjPKfGWwsZ9N0Uubt
X-Google-Smtp-Source: ABdhPJzIPIQeIy/04Z4P4HcGGP5E5bBjfX0fewLMGLvvvCgeX+bqmqNmYXQ/+bGXmMYqx2Lldqxmz4h9L1DJTUt3lrs=
X-Received: by 2002:a05:6e02:54d:: with SMTP id
 i13mr991738ils.219.1601932375822; 
 Mon, 05 Oct 2020 14:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <87362stt1l.fsf@igel.home>
 <mhng-b2aa7eab-cb69-4113-8c32-b5fcbd7e9150@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-b2aa7eab-cb69-4113-8c32-b5fcbd7e9150@palmerdabbelt-glaptop1>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 5 Oct 2020 14:12:44 -0700
Message-ID: <CAOnJCUKa82Faf0DLfhR10i3dSJrQ6JZWwmCiLWTaAQf173CYwQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] riscv: Fixup static_obj() fail
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_171257_896572_274503DC 
X-CRM114-Status: GOOD (  25.99  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Tycho Andersen <tycho@tycho.ws>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Hu <nickhu@andestech.com>, Anup Patel <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Andreas Schwab <schwab@linux-m68k.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Greentime Hu <greentime.hu@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 5, 2020 at 12:46 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Mon, 05 Oct 2020 11:40:54 PDT (-0700), schwab@linux-m68k.org wrote:
> > On Okt 05 2020, Palmer Dabbelt wrote:
> >
> >> On Mon, 05 Oct 2020 01:25:22 PDT (-0700), schwab@linux-m68k.org wrote:
> >>> On Sep 14 2020, Aurelien Jarno wrote:
> >>>
> >>>> How should we proceed to get that fixed in time for 5.9? For the older
> >>>> branches where it has been backported (so far 5.7 and 5.8), should we
> >>>> just get that commit reverted instead?
> >>>
> >>> Why is this still broken?
> >>
> >> Sorry, I hadn't seen this.  I'm not seeing a boot failure on 5.9-rc8 with just
> >> CONFIG_HARDENED_USERCPOY=y in addition to defconfig (on QEMU, though I doubt
> >> that's relevant here).
> >
> > I don't see a boot failure either, but eventually you will get crashes
> > like this, and resources are not properly released:
> >
> > [ 4560.936645] usercopy: Kernel memory overwrite attempt detected to kernel text (offset 241626, size 16)!
> > [ 4560.945324] ------------[ cut here ]------------
> > [ 4560.949954] kernel BUG at mm/usercopy.c:99!
> > [ 4560.954030] Kernel BUG [#1]
> > [ 4560.956805] Modules linked in: nfsv3 nfs_acl rfkill mmc_block sf_pdma i2c_ocores virt_dma spi_sifive uio_pdrv_genirq uio loop drm drm_panel_orientation_quirks rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace fscache af_packet mscc macsec macb ptp pps_core phylink of_mdio fixed_phy libphy pwm_sifive mmc_spi crc_itu_t crc7 of_mmc_spi mmc_core spi_bitbang sunrpc sg dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua
> > [ 4560.995103] CPU: 2 PID: 23806 Comm: nis Not tainted 5.8.10-1-default #1 openSUSE Tumbleweed (unreleased)
> > [ 4561.004563] epc: ffffffe00036140e ra : ffffffe00036140e sp : ffffffe004bc7d60
> > [ 4561.011679]  gp : ffffffe00127ee60 tp : ffffffe1b05d0000 t0 : ffffffe001297ca0
> > [ 4561.018886]  t1 : ffffffe001297c30 t2 : 0000000000000000 s0 : ffffffe004bc7d80
> > [ 4561.026093]  s1 : ffffffe00003afda a0 : 000000000000005b a1 : ffffffe1f7d67588
> > [ 4561.033298]  a2 : ffffffe1f7d6c108 a3 : 0000000000000000 a4 : ffffffe000043e80
> > [ 4561.040506]  a5 : ffffffe1f7d6be80 a6 : 0000000000000144 a7 : 0000000000000000
> > [ 4561.047712]  s2 : 0000000000000010 s3 : 0000000000000000 s4 : ffffffe00003afea
> > [ 4561.054918]  s5 : ffffffe1f7e00e80 s6 : 0000002af4a2c2e0 s7 : fffffffffffff000
> > [ 4561.062124]  s8 : 0000003ffffff000 s9 : ffffffe19f985400 s10: 0000000000000010
> > [ 4561.069329]  s11: ffffffe1f7e00e80 t3 : 0000000000038fa8 t4 : 0000000000038fa8
> > [ 4561.076533]  t5 : 0000000000000001 t6 : ffffffe00128e062
> > [ 4561.081832] status: 0000000200000120 badaddr: 0000000000000000 cause: 0000000000000003
> > [ 4561.089821] ---[ end trace a7c93e7595e9c2cc ]---
> > [ 4561.095589] BUG: Bad rss-counter state mm:00000000c54f4c29 type:MM_ANONPAGES val:1
>
> Ah, I must have misunderstood.  I guess I just assumed "init crashes" meant on
> boot, not just at some time later.  I just sent out a patch reverting this, LMK
> if it fixes the issue.  I have some work stuff to do, but I'll try to find some
> time tonight to look into fixing both of the bugs -- otherwise I'll just take
> the revert (assuming it does actually fix the issue for you and passes the
> tests).
>
> I saw Atish post after I started writing this: I agree we need to sort of the
> kernel's memory map, I just think it's too late for 5.9.
>

Yes. It is definitely a for-next material. I will try to take a stab
at this if nobody else has an objection.

> > Andreas.
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
