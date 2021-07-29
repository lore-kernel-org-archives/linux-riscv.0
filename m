Return-Path: <SRS0=H4U1=MV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B700DC432BE
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jul 2021 05:36:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A40E608FB
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jul 2021 05:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A40E608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrHC9NQOzSfuoyVL3vWiHJdNvoadxiOfCNDxgMiARJw=; b=kOf4I7sR6lS/j9
	NBb/XLGbBZsP0+sTnrnGS+wKwgjXp2j+gzLMZtL8EUSZTDKg1vdONNP0emE8Uwtbi0zKiLgxPe/JY
	jHuiww5+ua7LQUwlbT31BaHxGQuPTxG0+eFByk0s05Y7JgfYP+/1XkSW3xyMCRbfKYRU1hTwSOP07
	dytdeHSOAOeMhOyjgQ/EGK+gIopKenKLUaw9dulmlv/3fbOaMld+KSBwv660s2m3tG+Hyf4PjA+JS
	0xWf0eh6seBleOntzKPra1gJvEYszGoxId4L+Gh4h2CrCywpisi8J54SkkkuC4pJpHVgNExp/YMab
	cD3vZbmNSTW2G2nhOzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8yic-0039O9-Fr; Thu, 29 Jul 2021 05:36:30 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8yiW-0039N5-QP
 for linux-riscv@lists.infradead.org; Thu, 29 Jul 2021 05:36:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 l4-20020a05600c1d04b02902506f89ad2dso5005704wms.1
 for <linux-riscv@lists.infradead.org>; Wed, 28 Jul 2021 22:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JpDxw18ZLgwbipCgFlvxBIciXYiO7op8Q9ue2Xjmcbs=;
 b=o5LPvTsq0l4OsscTvgnH9/wsTpbspVXBABAj+Su9kHFVq/CL44Jmz6o0g5ft97e04J
 D7Jx2Eax8EVYIKEy4x+ZkpC4U4hKhy9asV4BQ1keSuYEH5Lodxh5YYIzyhk+z6xjrOH4
 QSTFm07Z6vkDPCRLj7xlYUq5zvbgjHs9Y8xxp4KCj0iWpLM6DiLpt4eRULG1fCYQaTl5
 bUefvaDOTu8ShXl7Z3PiIqcN1FLE3EJHS/ilt5gjhuk1V+HRoBT4CeXBibinqQ41u2Vs
 rAaoiTovSa2bfo7nr43JTrvIPjQC7//hm3OeTOxpsL0yzufJvnpy7XDx2kxKN7zcMp1Y
 0MYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JpDxw18ZLgwbipCgFlvxBIciXYiO7op8Q9ue2Xjmcbs=;
 b=LJfr2oSJqu1MM1HnOlsVOuKabJ53pAk0ROWnsNp/ItOlNSGNMief9WVNq/x9x9xXgF
 ql2h0YrubM0wpE3JX8gRO3CIJml4S1v/uLMjKxb4GDF1l3Zojcq7zDuHSeAy9k5HlVgh
 4h/T0AV5NBZ7Qyf1TgKOKxHTEmwe2IwpupEnJWbjn6D8gSigT/9rTTBZ6wlTcZ6yarnb
 GouZvEAAiKlrfrjEjF09kF7CeAY6+GT8BnwN6rV78Wujk+9Rzx+TMJOj4+893oI1XjH0
 QIUkAbmO6Z5dzj6pNRPL79LYwkfqTL3RB+tx6aLH1xt/1A+cS/ae1O5GSnn62sdxwGD0
 XN/w==
X-Gm-Message-State: AOAM531n17VyrG2pLTezqfIx8wvW7zuV1TzcTXJnr5ze9r4ekAvI7yAX
 gk6uw1vTCK+26LaZC7iRdGoJ+Awl9dBa7D37QRZ/2Q==
X-Google-Smtp-Source: ABdhPJzOvSnOGPnXDXFEka6cyWxMLn749krCndUWIJPgiasluAR2vVfZSUTqyg1/vHq3tJ1n0K1u11AP1Zg7H9Mq2Zg=
X-Received: by 2002:a05:600c:2942:: with SMTP id
 n2mr12740398wmd.152.1627536982888; 
 Wed, 28 Jul 2021 22:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy1rA9e2iCJWeVEQwKTRfTZZaRZVcMe1o8wMnFiWOOGW3w@mail.gmail.com>
 <mhng-7fd3d454-cd80-4ede-baed-08003d66b3a4@palmerdabbelt-glaptop>
In-Reply-To: <mhng-7fd3d454-cd80-4ede-baed-08003d66b3a4@palmerdabbelt-glaptop>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Jul 2021 11:06:11 +0530
Message-ID: <CAAhSdy0T0_Gfa1eFA=rwQ+6NGT99FTo7wo3gcBQWkdj8OEvMWQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] Linux RISC-V ACLINT Support
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Anup Patel <Anup.Patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_223624_907526_C99179B6 
X-CRM114-Status: GOOD (  41.09  )
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

On Thu, Jul 29, 2021 at 10:00 AM Palmer Dabbelt
<palmerdabbelt@google.com> wrote:
>
> On Mon, 26 Jul 2021 06:01:01 PDT (-0700), anup@brainfault.org wrote:
> > Hi Marc,
> >
> > On Mon, Jul 26, 2021 at 8:02 PM Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On Mon, 26 Jul 2021 13:45:20 +0100,
> >> Anup Patel <anup@brainfault.org> wrote:
> >> >
> >> > Hi Marc,
> >> >
> >> > I have taken the approach of IPI domains (like you suggested) in this series.
> >> >
> >> > What do you think ?
> >>
> >> I have commented on the irqchip driver.
> >>
> >> As for the RISC-V specific code, I'll let the architecture maintainers
> >> look into it. I guess the elephant in the room is that this spec seems
> >> to be evolving, and that there is no HW implementation (how this
> >> driver maps on SF's CLINT is anybody's guess).
>
> There's a long history of interrupt controller efforts from the RISC-V
> foundation, and we've yet to have any of them result in hardware.
>
> > The SiFive CLINT is a more convoluted device and provides M-level
> > timer functionality and M-level IPI functionality in one MMIO device.
> >
> > The RISC-V ACLINT specification is more modular and backward
> > compatible with the SiFive CLINT. In fact, a SiFive CLINT device
> > can be viewed as a ACLINT MSWI device + ACLINT MTIMER device.
> > This means existing RISC-V boards having SiFive CLINT will be
> > automatically compliant to the RISC-V ACLINT specification.
>
> So is there any hardware that this new specification enables?  It seems
> to be a more convoluted way to describe the same mess we're already in.
> I'm not really inclined to take a bunch of code that just does the same
> thing via a more complicated specification.
>
> > Here's the RISC-V ACLINT spec:
> > https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
> >
> > The RISC-V ACLINT spec is quite stable and we are not seeing any
> > further changes hence I sent out RFC PATCHes to get feedback. The
> > RISC-V ACLINT spec will be frozen before 2021 end (i.e. before next
> > RISC-V summit).
>
> Have you talked to the other ISA folks about that?
>
> As far as I can tell this new spec allows for multiple MTIME registers,
> which seems to be in direct contradiction to the single -MTIME register

The RISC-V ISA spec only mandates a single view of MTIME registers
for all the HARTs

The RISC-V ISA spec does not mandate a single physical MTIME register.

In fact, multi-socket and multi-die systems will end-up having multiple
physical MTIME registers so on such systems these physical MTIME
registers need to be synchronized with hardware assistance. Please
refer to the MTIME synchronization section of ACLINT specification.

> as defined in the ISA manual.  It also seems to be vaguely incompatible
> WRT the definition of SSIP, but I'm not sure that one really matters all
> that much as it's not like old software can write the new registers.

Please loot at the ACLINT SSWI spec again. The SSIP bit definition
is to be modified where mip.SSIP bit is logical OR of software writable
bit and external SSIP signal. This way older software which uses
SBI call based IPI injection will work fine. In fact, this aspect of SSIP
bit is tested on QEMU RISC-V as well.

>
> I just talked to Krste and Andrew, they say they haven't heard of any of
> this.  I don't know what's going on over there, but it's very hard to
> review anything when I can't even tell where the ISA is defined.

Like mentioned in other thread, please first to talk to the actual
spec owners first. There are lot of working groups and activities
going on in RVI.

Regards,
Anup

>
> > The Linux NoMMU kernel (M-level) will use an ACLINT MSWI device
> > for IPI support whereas the regular Linux MMU kernel (S-level) will
> > use an ACLINT SSWI device for IPI support.
> >
> > The ACLINT SWI driver is a common IPI driver for both ACLINT
> > MSWI (Linux NoMMU) and ACLINT SSWI (Linux MMU). In fact,
> > the ACLINT SWI also works for IPI part (i.e. MSWI) of SiFive CLINT.
> >
> > Regards,
> > Anup
> >
> >>
> >>         M.
> >>
> >> --
> >> Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
