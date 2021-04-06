Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DAFC433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 17:25:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 808B9613BC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 17:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 808B9613BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Stci/+HmctMEplrBCdb9ihvvFgRy9qtpKEMTIBfH16g=; b=bhIW98fX8sxSxLchMcVLZ9rHg
	QGjlGBnAlMotiRcPLOUA2hocDRhSi3esla2yJWoxh2HObsLrukcE2vus9t95qVPkGRTAoZr0oisfK
	DNyv9RnR+DIV+sVCq3BipjUYO+rNKG6myh5yVg8Nwgsf0/2QjPxNrqONQy7DzN/42OojWuHuqf8WG
	VZhcy7SYFXL85iGAw8skVwUGQbukEFaAmpFFTR+gRG4/cFZ0toEOvPZmgs7+2xmHugxPaKlNa2Gnd
	pQc3r/sVGQKso6bqh5XwMUYgWnLIXrUslusr42IgM3UFTjBUMEHNlneGW+8NjdVQdMImGeBkeHifH
	S79mJWXGA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTpSF-003699-Ja; Tue, 06 Apr 2021 17:25:31 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTpSB-00368b-Iy
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 17:25:29 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id n44so2508448qvg.12
 for <linux-riscv@lists.infradead.org>; Tue, 06 Apr 2021 10:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HjIY6aWZ/uvHhM5BKnP3jscK0FBNItngTC5eimC1oFI=;
 b=V+JG4luCR0b56/p+Hv4EgOuljif4M7BrF1R+nfoI5OsEwCVXQqTm/WwMZ681EicIT+
 jf1Uwmh7DH9rA54IBEqp/nq7K6NXga/xs1A+ItmZm9vokyJcjNPKYj7O5qcA53sA/Twp
 2o8bvMag0JtT8juqcTglS+J12WkTotgnB/WApgui2mLBFslT1KL/GQ6e+qHE8b9eravs
 GdiEE9jfH5w/LeYxWmNa5+3jLpkvlMXRlL5RYS0sYuwKUTcVktfyuynNAASH3pallAwB
 wq2kdPf+QEEK58vg9OfEGamcBLde0344bTdvxQutG8G6qYTURwgul5zLA6SXB1tqWxa/
 8Q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HjIY6aWZ/uvHhM5BKnP3jscK0FBNItngTC5eimC1oFI=;
 b=r2l/xw0mV7Xr4UTwzwUZpPnHgw3CLT1up0v3+7cKUYn19gElGaZtc5lsgHQqhVkR5q
 ZahKg5tdQfraTE6lWjq33fIYXDwnd76bQBJevFWPwEEaktnkAauX3Jo2jF/FZFq1PbFw
 EIMiaSiqUpxPV4V6duIQIBQ3ejRyFym67rcWWHsWlzOhU/Y1qyoyi8szHHCsQo7W7z95
 7mq7MUEMXaQAw2vwd/5UpOZNMvO5f2qf8s44xccMenCbUwmyLqhlEeTSQ/0gs2yZuB86
 ifc1aJR0POLhHWxmIxzjx122w88FXhnFT59zLYHrqPG+3NpvGuE125V5A0sftu5IX/az
 Uk9g==
X-Gm-Message-State: AOAM530SyYN0DUnWX3qXZFv8wNMz6xN8pPdy8Vhs0L6XFd7oLAYz299C
 Cv2ZgyezuEUFrKaMPYNMCv4=
X-Google-Smtp-Source: ABdhPJxCnqpDDoiwmSWHUEP6xAQGZGQrKRlH4kuk7ohk/vvF7w4FMdf+MUERXRCuXqWJW7LJHmQ98Q==
X-Received: by 2002:ad4:4cca:: with SMTP id i10mr29832924qvz.49.1617729926315; 
 Tue, 06 Apr 2021 10:25:26 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id x14sm16025449qkx.112.2021.04.06.10.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:25:25 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailauth.nyi.internal (Postfix) with ESMTP id 2BABF27C0054;
 Tue,  6 Apr 2021 13:25:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 06 Apr 2021 13:25:25 -0400
X-ME-Sender: <xms:g5lsYIxIxkxRsm1u6D9obZmveykknLjLNrx5HhDgTnZymPCGIb97rQ>
 <xme:g5lsYMTHoGaNMpVBsIRTBuuyOp4jEgOQapucYXhNADKna11cwzYvMxOaIhrMgOmw0
 NBEFE7HOzpWeoRaZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhquhhn
 ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnheptdevvdfhkeevuedtueetgeefvdeuveehteelfeehfeelteetuefffeelleel
 ueevnecuffhomhgrihhnpehrihhstghvrdhorhhgpdhkvghrnhgvlhdrohhrghenucfkph
 epudefuddruddtjedrudegjedruddvieenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonh
 grlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghnghep
 pehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:g5lsYKV-_z2SguaFtbhfCJ_73Ja-6OesVU2kkZ2n8RTMu-IurrW8VA>
 <xmx:g5lsYGiWkAz5xAFkJkGL0tkmjZUfpf4A8CQ4JDWNJfV1vd8d1jRdGA>
 <xmx:g5lsYKA-1VQnwa1SqZrZgp5GROmrPdFSt59yP5dm2J2RQhrMXae4mg>
 <xmx:hZlsYO64iCXqEXTU581wijEu5WviGywcF7AjNoRq6Y12ZTfFP3TWmhnPzEUafgz4>
Received: from localhost (unknown [131.107.147.126])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9C6FD1080063;
 Tue,  6 Apr 2021 13:25:23 -0400 (EDT)
Date: Wed, 7 Apr 2021 01:24:12 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <YGyZPCxJYGOvqYZQ@boqun-archlinux>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTS4jexKsSiXBY=5rz53LjcLUZ1K4pxjYJDVQCWx_8JTuA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTS4jexKsSiXBY=5rz53LjcLUZ1K4pxjYJDVQCWx_8JTuA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_182527_711292_64F1E90A 
X-CRM114-Status: GOOD (  26.88  )
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

On Wed, Mar 31, 2021 at 11:22:35PM +0800, Guo Ren wrote:
> On Mon, Mar 29, 2021 at 8:50 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Mon, Mar 29, 2021 at 08:01:41PM +0800, Guo Ren wrote:
> > > u32 a = 0x55aa66bb;
> > > u16 *ptr = &a;
> > >
> > > CPU0                       CPU1
> > > =========             =========
> > > xchg16(ptr, new)     while(1)
> > >                                     WRITE_ONCE(*(ptr + 1), x);
> > >
> > > When we use lr.w/sc.w implement xchg16, it'll cause CPU0 deadlock.
> >
> > Then I think your LL/SC is broken.
> No, it's not broken LR.W/SC.W. Quote <8.3 Eventual Success of
> Store-Conditional Instructions>:
> 
> "As a consequence of the eventuality guarantee, if some harts in an
> execution environment are
> executing constrained LR/SC loops, and no other harts or devices in
> the execution environment
> execute an unconditional store or AMO to that reservation set, then at
> least one hart will
> eventually exit its constrained LR/SC loop. By contrast, if other
> harts or devices continue to
> write to that reservation set, it is not guaranteed that any hart will
> exit its LR/SC loop."
> 
> So I think it's a feature of LR/SC. How does the above code (also use
> ll.w/sc.w to implement xchg16) running on arm64?
> 
> 1: ldxr
>     eor
>     cbnz ... 2f
>     stxr
>     cbnz ... 1b   // I think it would deadlock for arm64.
> 
> "LL/SC fwd progress" which you have mentioned could guarantee stxr
> success? How hardware could do that?
> 

Actually, "old" riscv standard does provide fwd progress ;-) In

	https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf

Section "7.2 Load-Reserved/Store-Conditional Instructions":

"""
One advantage of CAS is that it guarantees that some hart eventually
makes progress, whereas an LR/SC atomic sequence could livelock
indefinitely on some systems. To avoid this concern, we added an
architectural guarantee of forward progress to LR/SC atomic sequences.
The restrictions on LR/SC sequence contents allows an implementation to
**capture a cache line on the LR and complete the LR/SC sequence by
holding off remote cache interventions for a bounded short time**.
"""

The guarantee is removed later due to "Earlier versions of this
specification imposed a stronger starvation-freedom guarantee. However,
the weaker livelock-freedom guarantee is sufficient to implement the C11
and C++11 languages, and is substantially easier to provide in some
microarchitectural styles."

But I take it as an example that hardware can guarantee this.

Regards,
Boqun

> >
> > That also means you really don't want to build super complex locking
> > primitives on top, because that live-lock will percolate through.
> >
> > Step 1 would be to get your architecute fixed such that it can provide
> > fwd progress guarantees for LL/SC. Otherwise there's absolutely no point
> > in building complex systems with it.
> --
> Best Regards
>  Guo Ren
> 
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
