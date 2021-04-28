Return-Path: <SRS0=fWiV=JZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F12C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 07:08:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AE6D61139
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 07:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AE6D61139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I8ISKSv5VG4kJ3yE43ZgguIPa5Vmq+le2SroEuhKt9c=; b=Ge6ujzDFw+o599fpyk8BBeLuq
	Kw+NX3X1QgIOVwXELC0CGhDF4kXdKWZxZdh4k/s1JXNjkq6AGa10PeETaHJtobjRafg3Ahz00IOnd
	UyJgu8JUbtqOqS++bIB58wEBeaUytx/dRYmMlND1Tn+Xqqg2OyUckzFO95Ht/d93SaPJqCoqOLwv+
	GyLm9jf6qg8fxmG+WdITE7k1jC9f0Xku49p7jGluxW8LcpI19Y4L2ko3j69EFe2g8Qn5kRyeupwj2
	plms4upTlr8azB20Mv/dVw+abyyC5GLQBDiaj03rT6f0H3YVUDK/bJBxCwPDw+9UuCY0YqRJwtj2P
	GdX0V4xug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbeIk-0031x8-Ig; Wed, 28 Apr 2021 07:08:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbeIb-0031vu-HO
 for linux-riscv@desiato.infradead.org; Wed, 28 Apr 2021 07:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7ePLPOp5H+0aF2LuqZ4lYuqUerlVt+njfmTxese7LhY=; b=qTnzc8OxLNgU+25iO7srfdb10s
 /pxpb7RIaqLZ3jGTDO7VEj1aeZJTyYGITHMTG6EBv4qTxauOovBF1GKj0XiQNAkqtvjIYAkXYUBFI
 JPQ58U4/iqK/B/eD1ou87jz39mJFvZlp4FnuSB7hqp38JEziJLR8BMh24Oj8sNK0hEyq0KYmobCvY
 7dSG+06OVd3oKRyjT4JNEvbS4FSQbrGLK+a0/xJLx4gwdkaj4rNj6y3I5s+NrCLGgJ5FuYzt0zdzc
 cweVjCDOhiMI/Vchl3fpWf5Aw3Pq8s1dtPimMSzAxTv8OQhZ1rPD4n6s98yNDqaWPx2Y9RwBb3Fwg
 mKHUUGLg==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbeIY-00HEqs-Gr
 for linux-riscv@lists.infradead.org; Wed, 28 Apr 2021 07:07:52 +0000
Received: by mail-wr1-x42f.google.com with SMTP id a4so61829004wrr.2
 for <linux-riscv@lists.infradead.org>; Wed, 28 Apr 2021 00:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7ePLPOp5H+0aF2LuqZ4lYuqUerlVt+njfmTxese7LhY=;
 b=OP4mXI4jjEoHoY29ERXrwS+GN54cc7kw+RjLLxk3LXHyetIfxpfFLjXZKPgu+690Rh
 glkTr6oapoKRje3Em4EMhVPdR6R8HMpKI3KfwfBk0U94sSiEGVNarG+MTnJcks3WSNWL
 gB2gnhcsMTpTkHeM5f6fNZng7TOxuOuFl6FhF4oHPFf4MdPYLRJGWXM5QXWP+ckJc6Ov
 UYIrAhUwJ3F/fY2qhSqZHbegDeuWxnWOUaGgbEbuf2W03LTsRXZgzzzmkmhLWi5dgYCG
 Su1s3TEagHdybmkhZWfgzCfn0GEuMCcHQ/VsMP07KN1QARxdWj3+9yYY6I/aaJ4nrIws
 knvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7ePLPOp5H+0aF2LuqZ4lYuqUerlVt+njfmTxese7LhY=;
 b=MaKI2RGUvucg+huXTm/BA1JvTbjIaD3XjLsPyKFlWC31n9yZ6ah9fEhS96EcSKOgTi
 RZ5DpS781t+EcKijF6m3VaXvcl39q9zwTjuzYAV/V2NjNaQFPSIrR4RopvNpzZqE4aPN
 X44E8VXLITdzGH2EOaRLAUNdZYXDougvprS16c82FKC48N3DxpqptGTPF+T7lftbg9UM
 NwOpshupvMcTvhKcjJfaHzyRXdNauIlkb7I63pSJFfT83AmQNrj2Wc96dSzdk7q7v+/p
 XRABIfI+DSfWArdDFupPeGV1rySybF/iJrVCLgCY7IpbFxQA8Zbnn+HT1MIo+aLfX1ap
 vpqg==
X-Gm-Message-State: AOAM531bma0OuMN/D/SpA5A4MOl+DmYZ6l/idU0w5hz43hZmStblFwOO
 1qETwe7di3xVvKMr2qyNjVk6fZaVbhVxAjXL7FROkg==
X-Google-Smtp-Source: ABdhPJz4qnl6RSSFskgOfFvyG++QMnht2mgJkG97O1L2rp+YCN+OC2F2vDr/zAZ0zYJu71bovqsMjIrdqkTivs+EoQQ=
X-Received: by 2002:adf:e846:: with SMTP id d6mr14148118wrn.356.1619593667902; 
 Wed, 28 Apr 2021 00:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-d64da1be-bacd-4885-aaf2-fea3c763418c@palmerdabbelt-glaptop>
 <5b988c4e-25e9-f2b9-b08d-35bc37a245e4@sifive.com>
 <CAAhSdy2g13XkeiG4-=0pHVw9Oq5zAeseM2LgxHf6daXD+qnc1Q@mail.gmail.com>
 <d6e2b882-ae97-1984-fc03-2ac595ee56b4@redhat.com>
In-Reply-To: <d6e2b882-ae97-1984-fc03-2ac595ee56b4@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Apr 2021 12:37:25 +0530
Message-ID: <CAAhSdy3V-8H8rLrGedfSPa1vFCSxcXCqaa0wA518JJstD9kPeg@mail.gmail.com>
Subject: Re: [PATCH v16 00/17] KVM RISC-V Support
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Anup Patel <Anup.Patel@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Graf <graf@amazon.com>, Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_000750_655046_F18649A2 
X-CRM114-Status: GOOD (  43.93  )
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

On Tue, Apr 27, 2021 at 12:34 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 27/04/21 08:01, Anup Patel wrote:
> > Hi Paolo,
> >
> > Looks like it will take more time for KVM RISC-V to be merged under arch/riscv.
> >
> > Let's go ahead with your suggestion of having KVM RISC-V under drivers/staging
> > so that development is not blocked.
> >
> > I will send-out v18 series which will add KVM RISC-V under the staging
> > directory.
> >
> > Should we target Linux-5.14 ?
>
> Yes, 5.14 is reasonable.  You'll have to adjust the MMU notifiers for
> the new API introduced in 5.13.

Sure, I will rebase on the new API introduced in 5.13

Regards,
Anup

>
> Paolo
>
> > Regards,
> > Anup
> >
> > On Tue, Apr 27, 2021 at 11:13 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> >>
> >> On Fri, 9 Apr 2021, Palmer Dabbelt wrote:
> >>
> >>> On Wed, 31 Mar 2021 02:21:58 PDT (-0700), pbonzini@redhat.com wrote:
> >>>
> >>>> Palmer, are you okay with merging RISC-V KVM?  Or should we place it in
> >>>> drivers/staging/riscv/kvm?
> >>>
> >>> I'm certainly ready to drop my objections to merging the code based on
> >>> it targeting a draft extension, but at a bare minimum I want to get a
> >>> new policy in place that everyone can agree to for merging code.  I've
> >>> tried to draft up a new policy a handful of times this week, but I'm not
> >>> really quite sure how to go about this: ultimately trying to build
> >>> stable interfaces around an unstable ISA is just a losing battle.  I've
> >>> got a bunch of stuff going on right now, but I'll try to find some time
> >>> to actually sit down and finish one.
> >>>
> >>> I know it might seem odd to complain about how slowly things are going
> >>> and then throw up another roadblock, but I really do think this is a
> >>> very important thing to get right.  I'm just not sure how we're going to
> >>> get anywhere with RISC-V without someone providing stability, so I want
> >>> to make sure that whatever we do here can be done reliably.  If we don't
> >>> I'm worried the vendors are just going to go off and do their own
> >>> software stacks, which will make getting everyone back on the same page
> >>> very difficult.
> >>
> >> I sympathize with Paolo, Anup, and others also.  Especially Anup, who has
> >> been updating and carrying the hypervisor patches for a long time now.
> >> And also Greentime, who has been carrying the V extension patches.  The
> >> RISC-V hypervisor specification, like several other RISC-V draft
> >> specifications, is taking longer to transition to the officially "frozen"
> >> stage than almost anyone in the RISC-V community would like.
> >>
> >> Since we share this frustration, the next questions are:
> >>
> >> - What are the root causes of the problem?
> >>
> >> - What's the right forum to address the root causes?
> >>
> >> To me, the root causes of the problems described in this thread aren't
> >> with the arch/riscv kernel maintenance guidelines, but rather with the
> >> RISC-V specification process itself.  And the right forum to address
> >> issues with the RISC-V specification process is with RISC-V International
> >> itself: the mailing lists, the participants, and the board of directors.
> >> Part of the challenge -- not simply with RISC-V, but with the Linux kernel
> >> or any other community -- is to ensure that incentives (and disincentives)
> >> are aligned with the appropriately responsible parts of the community.
> >> And when it comes to specification development, the right focus to align
> >> those incentives and disincentives is on RISC-V International.
> >>
> >> The arch/riscv patch acceptance guidelines are simply intended to ensure
> >> that the definition of what is and isn't RISC-V remains clear and
> >> unambiguous.  Even though the guidelines can result in short-term pain,
> >> the intention is to promote long-term stability and sustainable
> >> maintainability - particularly since the specifications get baked into
> >> hardware.  We've observed that attempting to chase draft specifications
> >> can cause significant churn: for example, the history of the RISC-V vector
> >> specification illustrates how a draft extension can undergo major,
> >> unexpected revisions throughout its journey towards ratification.  One of
> >> our responsibilities as kernel developers is to minimize that churn - not
> >> simply for our own sanity, or for the usability of RISC-V, but to ensure
> >> that we remain members in good standing of the broader kernel community.
> >> Those of us who were around for the ARM32 and ARM SoC kernel accelerando
> >> absorbed strong lessons in maintainability, and I doubt anyone here is
> >> interested in re-learning those the hard way.
> >>
> >> RVI states that the association is open to community participation.  The
> >> organizations that have joined RVI, I believe, have a strong stake in the
> >> health of the RISC-V ecosystem, just as the folks have here in this
> >> discussion.  If the goal really is to get quality specifications out the
> >> door faster, then let's focus the energy towards building consensus
> >> towards improving the process at RISC-V International.  If that's
> >> possible, the benefits won't only accrue to Linux developers, but to the
> >> entire RISC-V hardware and software development community at large.  If
> >> nothing else, it will be an interesting test of whether RISC-V
> >> International can take action to address these concerns and balance them
> >> with those of other stakeholders in the process.
> >>
> >>
> >> - Paul
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
