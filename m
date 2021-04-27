Return-Path: <SRS0=01Py=JY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2B9C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Apr 2021 06:01:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A3EE613B4
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Apr 2021 06:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A3EE613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3f5e3wU1a+lxHlzrPSlV/mSVSMPLFuOnrTfc2nVxOHA=; b=eOqWVB/3XknHtaploZoFhpDkJ
	mIVn29kYfXJx7uXN6bLmkxa5N8PlHjrER3gMac5iFIPo1xUGWFm7dLoBYK63HOLIrJtir0fCVmA4/
	NljCveSlrY+h4f/+HRpS7HMYsUbHnhSJ9BCdnl58zMqIy9dax3fLgDbNqUAGswUnRRRGP/71mDYn/
	/J8LxPfb7BhQuTLxgiD3S7yzDt1Qgwj83Y9oDRyOcxAo4f+82x9zX9bRiuddE3dqsOD3bypJzcE/q
	fV2NO0VVf0btnh7pBy66XyIZYJ64B4QldKcL8pQIWmU7cLVXjnqjGqp2LZ8iqLPFw3+ofcp8JLi0S
	vgyvRGubw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbGmx-000olQ-EL; Tue, 27 Apr 2021 06:01:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbGmo-000oks-4j
 for linux-riscv@desiato.infradead.org; Tue, 27 Apr 2021 06:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=V788y0c+X/a1zmRPAQAXGKRnxOC2AaVnSQkeOdvO5LI=; b=oztlf2JomKa+aYmkCPTRtt+gZD
 7BuCzL4otJvNXDzeQPWmgl+vdtTrEEiacof1hErlzhZ0TYHR6K4NLKbKW3qRMcCmLI8Br0ducLaST
 BWIEcyDea9QFygw7ZqWhpUsahu0ddmWWgAF+ICLZqw6k+FJBYeIVxW/ygcHbQOdUYmfRsFuKHwM4G
 Yty5RwolH8ph/hPzT8lPm1O31ml3bRlL9sskWv/9bqS6ZWxD4W/QC4rycB2UnSz6VWt0xGqFfkRMv
 k3dE3gAyEsmXWdZi3eTXf+cC17Fzgfw6cI5zllTOv1qw+eqM6RH4LjawtgRzI0Qvn6sBH0QGNo+Bj
 ntf9OvBg==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbGml-00GSpt-DM
 for linux-riscv@lists.infradead.org; Tue, 27 Apr 2021 06:01:28 +0000
Received: by mail-wr1-x431.google.com with SMTP id x5so7862372wrv.13
 for <linux-riscv@lists.infradead.org>; Mon, 26 Apr 2021 23:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V788y0c+X/a1zmRPAQAXGKRnxOC2AaVnSQkeOdvO5LI=;
 b=tnW9bOiTFXPdF5WqGiM1bx3GweauOGsZgLIXJirpLSfLqj14Q9Pe/UOlTG0Vwsf+PS
 eYwZmaMxTyPKnvnlWVbEwGY/GsxPcC76DX/CexpPZlM8luIkEShUH3OgBhUzY2v3zJgf
 dxAZA3ZbmExm7jNMA3v9edYryBIZDXaR7gGDJuVWz/F6naoK9onAtJgLg2vmkXrFdCns
 c8bbc/3XB6dsZiaL7CssoZhS5S/6VrOp9QZDw6St/ExqVv1jvTbBFss7sEz53aMAlwM0
 dgJt2L97DBdoLgo3Oo7ITi5k1qcOX5CxamQSeyFaQgAP731aDuRy0fHogvKCiBaiPg8y
 aZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V788y0c+X/a1zmRPAQAXGKRnxOC2AaVnSQkeOdvO5LI=;
 b=O2z0Owk8b7At+dxIbbXte9mkYBuWv0GTGKnOSOMqQPv9UiPNVt+T97sEUAPg7JgldQ
 MQJ7F5ZJhCCDm+8cx+dK8bMz6oeXYlrlB0S1TpUAs/7R0c/gBbXgNwb6f/9cfAXRp35V
 xqhy5YAXzxa0u92V5rlXYG5JAkRqcBg4+Yq9X9KmUSPuEfXKabUGpzv1m77QVKu46r3A
 MfMHfouRNVVv6p66ov3NELmws0PjQ5bW9x17z1Y827/5Q/HWIsa/ho9ejGCqOmSkrOPF
 mQl5ZBnmI8Wl9MZIlMGUr9S1atdF9xjhV1ULklxnUvRZtOWd2ww4ZI6wuvQ0FSQ3YcMU
 HZQg==
X-Gm-Message-State: AOAM533KP3F3f33nylRKqZgJWl/rzmvpL02LmRPf/zuVkIAtq+OKULL+
 4kb9r79hxmc/TVkeQ1nsI9Ke2m9jWLMk0+cQKlatPA==
X-Google-Smtp-Source: ABdhPJwk/5A/pxkyur4hIjIrmR7tCVZaRwKqnd5AmklHqVov2deqZIaDvFuOFFB8FvsspJDazxupGWPv/FRiFupz7Zs=
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr6962352wrp.325.1619503281250; 
 Mon, 26 Apr 2021 23:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-d64da1be-bacd-4885-aaf2-fea3c763418c@palmerdabbelt-glaptop>
 <5b988c4e-25e9-f2b9-b08d-35bc37a245e4@sifive.com>
In-Reply-To: <5b988c4e-25e9-f2b9-b08d-35bc37a245e4@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 27 Apr 2021 11:31:09 +0530
Message-ID: <CAAhSdy2g13XkeiG4-=0pHVw9Oq5zAeseM2LgxHf6daXD+qnc1Q@mail.gmail.com>
Subject: Re: [PATCH v16 00/17] KVM RISC-V Support
To: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <Anup.Patel@wdc.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Graf <graf@amazon.com>, 
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, KVM General <kvm@vger.kernel.org>, 
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_230127_461250_07810A97 
X-CRM114-Status: GOOD (  41.51  )
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

Hi Paolo,

Looks like it will take more time for KVM RISC-V to be merged under arch/riscv.

Let's go ahead with your suggestion of having KVM RISC-V under drivers/staging
so that development is not blocked.

I will send-out v18 series which will add KVM RISC-V under the staging
directory.

Should we target Linux-5.14 ?

Regards,
Anup

On Tue, Apr 27, 2021 at 11:13 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Fri, 9 Apr 2021, Palmer Dabbelt wrote:
>
> > On Wed, 31 Mar 2021 02:21:58 PDT (-0700), pbonzini@redhat.com wrote:
> >
> > > Palmer, are you okay with merging RISC-V KVM?  Or should we place it in
> > > drivers/staging/riscv/kvm?
> >
> > I'm certainly ready to drop my objections to merging the code based on
> > it targeting a draft extension, but at a bare minimum I want to get a
> > new policy in place that everyone can agree to for merging code.  I've
> > tried to draft up a new policy a handful of times this week, but I'm not
> > really quite sure how to go about this: ultimately trying to build
> > stable interfaces around an unstable ISA is just a losing battle.  I've
> > got a bunch of stuff going on right now, but I'll try to find some time
> > to actually sit down and finish one.
> >
> > I know it might seem odd to complain about how slowly things are going
> > and then throw up another roadblock, but I really do think this is a
> > very important thing to get right.  I'm just not sure how we're going to
> > get anywhere with RISC-V without someone providing stability, so I want
> > to make sure that whatever we do here can be done reliably.  If we don't
> > I'm worried the vendors are just going to go off and do their own
> > software stacks, which will make getting everyone back on the same page
> > very difficult.
>
> I sympathize with Paolo, Anup, and others also.  Especially Anup, who has
> been updating and carrying the hypervisor patches for a long time now.
> And also Greentime, who has been carrying the V extension patches.  The
> RISC-V hypervisor specification, like several other RISC-V draft
> specifications, is taking longer to transition to the officially "frozen"
> stage than almost anyone in the RISC-V community would like.
>
> Since we share this frustration, the next questions are:
>
> - What are the root causes of the problem?
>
> - What's the right forum to address the root causes?
>
> To me, the root causes of the problems described in this thread aren't
> with the arch/riscv kernel maintenance guidelines, but rather with the
> RISC-V specification process itself.  And the right forum to address
> issues with the RISC-V specification process is with RISC-V International
> itself: the mailing lists, the participants, and the board of directors.
> Part of the challenge -- not simply with RISC-V, but with the Linux kernel
> or any other community -- is to ensure that incentives (and disincentives)
> are aligned with the appropriately responsible parts of the community.
> And when it comes to specification development, the right focus to align
> those incentives and disincentives is on RISC-V International.
>
> The arch/riscv patch acceptance guidelines are simply intended to ensure
> that the definition of what is and isn't RISC-V remains clear and
> unambiguous.  Even though the guidelines can result in short-term pain,
> the intention is to promote long-term stability and sustainable
> maintainability - particularly since the specifications get baked into
> hardware.  We've observed that attempting to chase draft specifications
> can cause significant churn: for example, the history of the RISC-V vector
> specification illustrates how a draft extension can undergo major,
> unexpected revisions throughout its journey towards ratification.  One of
> our responsibilities as kernel developers is to minimize that churn - not
> simply for our own sanity, or for the usability of RISC-V, but to ensure
> that we remain members in good standing of the broader kernel community.
> Those of us who were around for the ARM32 and ARM SoC kernel accelerando
> absorbed strong lessons in maintainability, and I doubt anyone here is
> interested in re-learning those the hard way.
>
> RVI states that the association is open to community participation.  The
> organizations that have joined RVI, I believe, have a strong stake in the
> health of the RISC-V ecosystem, just as the folks have here in this
> discussion.  If the goal really is to get quality specifications out the
> door faster, then let's focus the energy towards building consensus
> towards improving the process at RISC-V International.  If that's
> possible, the benefits won't only accrue to Linux developers, but to the
> entire RISC-V hardware and software development community at large.  If
> nothing else, it will be an interesting test of whether RISC-V
> International can take action to address these concerns and balance them
> with those of other stakeholders in the process.
>
>
> - Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
