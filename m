Return-Path: <SRS0=H4U1=MV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE82BC4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jul 2021 04:57:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57B5360F45
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jul 2021 04:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57B5360F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KywTNtjlWDw6No7Zr2gjJIeHiNer7WDNn8SU9O8Z9Xw=; b=OMEFx8DOIig03B
	VOMSwjYp2g6mAp/FgZ6HBaghSFnORhgy5Yvb4IgMx2dVYB0BkN9e9yjncDc1wOn33TIDERKit++57
	2DsbbudhDTjxm4mAufhN79IVzXGFIVbJUTI/IUnkC8jqNNmaXzID8C3WCT42R9RMWT8DzGirnFNQj
	GP/y58WkL6MHu584lgNs8hHhZyntjv6XaIPhH4NLK8SSBewpsyhZZsC4Ejkq+n4Xr+qiA7/WV6VQN
	nh2YbnXYfdxKJIj5DEwYqyf/Hm/2oAL8w/D89uZQf33Dr98EOIZ2p97ALnIOc7DW9s4rVivHElHlO
	YyeGsVHpg1H+sS/d8GbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8y6I-0035KJ-Hr; Thu, 29 Jul 2021 04:56:54 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8y6F-0035Ji-8d
 for linux-riscv@lists.infradead.org; Thu, 29 Jul 2021 04:56:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id m12so349562wru.12
 for <linux-riscv@lists.infradead.org>; Wed, 28 Jul 2021 21:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HgZ2ekjB2w4IATMge4zN6op9t2Z495TinwaLO8sLH0U=;
 b=cFFqioRADT538UWHbhbK/gKFUBiIb2E+GS9adDnd+Y5FNNDFj8UksFsBUAjkbdXtd6
 J/Q1lDxPGLM+Vg6I5wjdZwA5dcL8B5hNASh4M9zm0cWY/2ZVnctawbtYTlJxDgxADE9u
 qrvw/n7Y9VFbYLrL0gCliCt8Li/MSsWyiQo2Ylgc9Nw9lFxpoRmd0xOenpI8bHO+VrxK
 2U0sSdPlKvaxnAenqBccDx1sSZJoNZfohV7MvWjaAWPjKxRb3JoymN6LqHKgOAvReiMn
 mOD0tsfs11KfI/1UCrGPVRNdy2XfmTwl8pLrqTsv8OxQbUhXz9tkRoOX7F6ok2u2xKQs
 QYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HgZ2ekjB2w4IATMge4zN6op9t2Z495TinwaLO8sLH0U=;
 b=elYuSYeuTj8RIdyJ8R1WO46GCfbmH7QPZovyqJirPEg+kZkhJ8Ae+wHI8K5EeNdPHz
 KMD5kP2TuFGWAhM6SyZIks6IQHPq7BS/RtxTu8iNbY8HjW5jBQ5knqHs0mYPCfa9BOvf
 /wff4NrrRX2wOo3WF89RDfKOW8OeWAZfB26yGUYARBiEfGR4iY9G5o2LWVi34ey+T7J6
 Yum8AdzVl3ppfLJvlzDOGs3AqXIsI962fYMSYU5vpGPTaVVQ6OJ8RtMssDNnh5+zHne0
 SQNsufxXEwXcVEUwjVOeLPt2aVW17w88vWfmZgddxSD0uFuyjJ0aud59TVMeH4rPFcC/
 zGVQ==
X-Gm-Message-State: AOAM531GAIn5IC2z2+JcCqzUTIOnVNCb0lSW1dyvDjl8Nn9oJhmwdioE
 94Y+IoV4qEfh6B5eBYwYQpYZK0ck/86ezos1xQ1VSQ==
X-Google-Smtp-Source: ABdhPJy9zG4CjAQR/J6R19gfFDkrsm7e4WOPkyQ/kcxBrA8tFfhtF7n/4/gG7NkhctFeNwvdbA425f129B53LpKUKAE=
X-Received: by 2002:a05:6000:2a1:: with SMTP id
 l1mr2525748wry.128.1627534609273; 
 Wed, 28 Jul 2021 21:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy1rA9e2iCJWeVEQwKTRfTZZaRZVcMe1o8wMnFiWOOGW3w@mail.gmail.com>
 <mhng-7fd3d454-cd80-4ede-baed-08003d66b3a4@palmerdabbelt-glaptop>
In-Reply-To: <mhng-7fd3d454-cd80-4ede-baed-08003d66b3a4@palmerdabbelt-glaptop>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Jul 2021 10:26:38 +0530
Message-ID: <CAAhSdy0PsbAJdA=CX7fh=J8jaEh2XniXveQV8rhQWNzW=PBBwQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210728_215651_357596_2F517985 
X-CRM114-Status: GOOD (  43.58  )
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

The RISC-V AIA group was formed last year. Can you point me to which
interrupt controller efforts you are referring to.

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

Nope, it is much cleaner and modular compared to SiFive CLINT and
it is also backward compatible to SiFive CLINT.

Can you elaborate what part of the code you are not okay with ?

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

This spec is being developed by the RISC-V AIA group based on the
feedback from ISA folks and HW architects.

>
> As far as I can tell this new spec allows for multiple MTIME registers,
> which seems to be in direct contradiction to the single -MTIME register
> as defined in the ISA manual.  It also seems to be vaguely incompatible
> WRT the definition of SSIP, but I'm not sure that one really matters all
> that much as it's not like old software can write the new registers.

The ACLINT spec clearly defines that if we have multiple MTIME registers
then these registers must be synchronized to meet the architecture
requirements. The spec also defines a software mechanism for MTIME
synchronization. It is also possible for multiple MTIMER devices to share
same MTIME register. Please refer to the latest ACLINT spec.

>
> I just talked to Krste and Andrew, they say they haven't heard of any of
> this.  I don't know what's going on over there, but it's very hard to
> review anything when I can't even tell where the ISA is defined.

I am surprised by the respone you got because the ACLINT spec is
being developed by a working group of RISC-V International. In fact,
it is hosted on the RISC-V International GitHub. How can we host it on
RISC-V GitHub if it is not an official spec being developed by RVI.

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
