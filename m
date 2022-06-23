Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B1AC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egf8YYasFVhY+o7WafM6oT2UDCuZyJn9A21hmNzJrjw=; b=Sep/4FjjPeVIEG
	labzupHpCthzSAqWUKy+Q6IDNuPUUy3WuzvbAlW6U/2RCuMbY7SVGhSxVFL0cxi8HrKk+atCR+X/h
	ZcDP6O2IxFMH3T0fryK1jykxkeZjdgQ6OOFzRG+HsblUVVvJk6Mgsfus+9FOxZIiOz1dV1NHa7K01
	cx/6VhEKZYI4No1TAcGnzjPD5BclampVl0b8/hRnFcuCDG6NexrG9W+ftK/UMcRGpW5QkMkFuw5AD
	Gmdwl9qaNF+pT1zAlkuISCca2kQJMfWGetYSBSWjk6sCmDaDuXUpwFcmlocYJPA1n6vOeKDatFS4w
	yc9AApkX3mZxLcwQ5jOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4R3E-00GDJH-In; Thu, 23 Jun 2022 17:55:32 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4R3B-00GDIO-So
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 17:55:31 +0000
Received: by mail-qk1-x72d.google.com with SMTP id p63so15556919qkd.10
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 10:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=feedback-id:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UL6VZe4xX6RusXDF47C8DXFCgl3ZVmVUhDz9s8GH6hE=;
        b=PLmUuzq/7uSgu04xUBGadLJkUoeOBkEc+KT9X2ETfZHJDR8nD1kNpHOsuO1B+vqEZo
         22pGZC/jwG2fuWRSRHMId8eLN8dgegaAdk5QnUZOE+wtbBKouUj8NCIWyaJRwWyRoNSP
         B0VfuZMup2C1Y5GHBikeVcj4SJFDEzO3YYY7p3qEPPiLykTiyNdRGWaFrP8zjER4QD64
         PPuDvu03DybJNLk95Kl9FslOWyPX0vPN41FOOA56luFEYDqh2lrMwp5uFI/XkCfb3gVz
         X0jJ9cZvUS6+oPM7z+qjDyVTLArhQlu0FBdJ8uRQMJfsKNfr0bBAg9RQet9lFaZpEpGc
         1qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:feedback-id:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=UL6VZe4xX6RusXDF47C8DXFCgl3ZVmVUhDz9s8GH6hE=;
        b=u+7mWY35cwh/9HoNcmWOZvs947gNT/lZxN7WQNRYLeEmPZRuYXCLujVxWfgY39gVQ+
         GpCm71dQYKGp81O8RkbBd6mmKBoGlvh7YIjAq4dOsPwjyQVLymzt1IoBgtWUv8Sg3QPg
         Q7Ff17iXrsSe+E/O2NMWwZtJY1Znf1pBbD4wB8ENy4u6WbxsYRSFb98s1PYTn0HZh9bC
         MoIuOvwNKBDXBoQbm/BcM04nGOgqYtFagenb6PDLxkAYf43JyFKY4CLN3y2HiKJ1wUDr
         Ndl6+2wtE3gZjNIXpFffNnLIWyT+QibqGAWwfOre2QrB+TSA6ivDG460DBrYPTh+Y5Ov
         l5ug==
X-Gm-Message-State: AJIora/n3qYOWweXvExZL1EVnnbL12COYeF0BOhcDPhERIEMuzLw6SWI
	xzD2moU/e3nr9DAEhEIDvPw=
X-Google-Smtp-Source: AGRyM1uYXqyDlmIqV1TNqLVKGZNJVjFMdHZOQ6z/NGMJ1jlnG39b+iYhRNvViAr8Vmww95m00eY9Iw==
X-Received: by 2002:a05:620a:d53:b0:6ae:f9c8:f6a4 with SMTP id o19-20020a05620a0d5300b006aef9c8f6a4mr2259123qkl.343.1656006928488;
        Thu, 23 Jun 2022 10:55:28 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id p13-20020a05622a048d00b00304dd83a9b1sm18670431qtx.82.2022.06.23.10.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 10:55:27 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id 54FBA27C0054;
	Thu, 23 Jun 2022 13:55:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 23 Jun 2022 13:55:27 -0400
X-ME-Sender: <xms:Dqm0YhEnueb_OOGhXG6s1RMyvWz6RxwjVypk0DEolW9Fv3IVEzRFcA>
    <xme:Dqm0YmUEkZ-JG1crYZ-ABedloCYpv5AoQ92I19YMNAHKfJ7mw4BROfeq8i4iy3Z37
    zfHHZvhXfpUbzBsNg>
X-ME-Received: <xmr:Dqm0YjL1LdX7LCq6TAAN1eoPd4xPHvGsJpbIC-rqdRmSeg_za1W5NJ4V83ESxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfhfgggt
    uggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrd
    hfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepffekvedvjeehuddt
    tefhjeeitddttdfhteffudefudelkedtvdfguddvhfejleeunecuffhomhgrihhnpehkvg
    hrnhgvlhdrohhrghdpghhoohhglhgvrdgtohhmpdhrihhstghvrdhorhhgpdhgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeeh
    tdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmse
    hfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:Dqm0YnG-17kvC6ytGlhCEhXPjgvcKTDkeLg8oQrcgDT20Ibx3TudKw>
    <xmx:Dqm0YnVgZcBokeogHutY1LPnMK5bm5HWmTDpUjvQ93BvSlzMVVYhQQ>
    <xmx:Dqm0YiPMleLP5LJ3PoABrA9PqWoKr_h6-EoxwrGbv9V628DOe5TzgA>
    <xmx:Dqm0YqMtE5JUeF_5RvSNogrULcifiH3c6cWi5StRee4QiNCBQGn8pA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 13:55:25 -0400 (EDT)
Date: Thu, 23 Jun 2022 10:55:11 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Dan Lustig <dlustig@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>, Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V4 5/5] riscv: atomic: Optimize LRSC-pairs atomic ops
 with .aqrl annotation
Message-ID: <YrSo/3iUuO0AL76T@boqun-archlinux>
References: <CAJF2gTQoSQq_S4UvAiXgMviT040Ls8+VkDszQSke1a0zbXZ82A@mail.gmail.com>
 <mhng-7a274375-0d99-41c8-98a3-853d110f62e9@palmer-ri-x1c9>
 <CAJF2gTTXO42_TsZudaQuB9Re0teu__EZ11JZ96nktMqsQkMYNA@mail.gmail.com>
 <20220614110258.GA32157@anparri>
 <YrPei6q4rIAx6Ymf@boqun-archlinux>
 <fd664673-c4cc-be8f-9824-5272c5c79b40@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd664673-c4cc-be8f-9824-5272c5c79b40@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_105529_985609_D696F5AB 
X-CRM114-Status: GOOD (  52.36  )
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

On Thu, Jun 23, 2022 at 01:09:23PM -0400, Dan Lustig wrote:
> On 6/22/2022 11:31 PM, Boqun Feng wrote:
> > Hi,
> > 
> > On Tue, Jun 14, 2022 at 01:03:47PM +0200, Andrea Parri wrote:
> > [...]
> >>> 5ce6c1f3535f ("riscv/atomic: Strengthen implementations with fences")
> >>> is about fixup wrong spinlock/unlock implementation and not relate to
> >>> this patch.
> >>
> >> No.  The commit in question is evidence of the fact that the changes
> >> you are presenting here (as an optimization) were buggy/incorrect at
> >> the time in which that commit was worked out.
> >>
> >>
> >>> Actually, sc.w.aqrl is very strong and the same with:
> >>> fence rw, rw
> >>> sc.w
> >>> fence rw,rw
> >>>
> >>> So "which do not give full-ordering with .aqrl" is not writen in
> >>> RISC-V ISA and we could use sc.w/d.aqrl with LKMM.
> >>>
> >>>>
> >>>>>> describes the issue more specifically, that's when we added these
> >>>>>> fences.  There have certainly been complains that these fences are too
> >>>>>> heavyweight for the HW to go fast, but IIUC it's the best option we have
> >>>>> Yeah, it would reduce the performance on D1 and our next-generation
> >>>>> processor has optimized fence performance a lot.
> >>>>
> >>>> Definately a bummer that the fences make the HW go slow, but I don't
> >>>> really see any other way to go about this.  If you think these mappings
> >>>> are valid for LKMM and RVWMO then we should figure this out, but trying
> >>>> to drop fences to make HW go faster in ways that violate the memory
> >>>> model is going to lead to insanity.
> >>> Actually, this patch is okay with the ISA spec, and Dan also thought
> >>> it was valid.
> >>>
> >>> ref: https://lore.kernel.org/lkml/41e01514-74ca-84f2-f5cc-2645c444fd8e@nvidia.com/raw
> >>
> >> "Thoughts" on this regard have _changed_.  Please compare that quote
> >> with, e.g.
> >>
> >>   https://lore.kernel.org/linux-riscv/ddd5ca34-805b-60c4-bf2a-d6a9d95d89e7@nvidia.com/
> >>
> >> So here's a suggestion:
> >>
> >> Reviewers of your patches have asked:  How come that code we used to
> >> consider as buggy is now considered "an optimization" (correct)?
> >>
> >> Denying the evidence or going around it is not making their job (and
> >> this upstreaming) easier, so why don't you address it?  Take time to
> >> review previous works and discussions in this area, understand them,
> >> and integrate such knowledge in future submissions.
> >>
> > 
> > I agree with Andrea.
> > 
> > And I actually took a look into this, and I think I find some
> > explanation. There are two versions of RISV memory model here:
> > 
> > Model 2017: released at Dec 1, 2017 as a draft
> > 
> > 	https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/hKywNHBkAXM/m/QzUtxEWLBQAJ
> > 
> > Model 2018: released at May 2, 2018
> > 
> > 	https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/xW03vmfmPuA/m/bMPk3UCWAgAJ
> > 
> > Noted that previous conversation about commit 5ce6c1f3535f happened at
> > March 2018. So the timeline is roughly:
> > 
> > 	Model 2017 -> commit 5ce6c1f3535f -> Model 2018
> > 
> > And in the email thread of Model 2018, the commit related to model
> > changes also got mentioned:
> > 
> > 	https://github.com/riscv/riscv-isa-manual/commit/b875fe417948635ed68b9644ffdf718cb343a81a
> > 
> > in that commit, we can see the changes related to sc.aqrl are:
> > 
> > 	 to have occurred between the LR and a successful SC.  The LR/SC
> > 	 sequence can be given acquire semantics by setting the {\em aq} bit on
> > 	-the SC instruction.  The LR/SC sequence can be given release semantics
> > 	-by setting the {\em rl} bit on the LR instruction.  Setting both {\em
> > 	-  aq} and {\em rl} bits on the LR instruction, and setting the {\em
> > 	-  aq} bit on the SC instruction makes the LR/SC sequence sequentially
> > 	-consistent with respect to other sequentially consistent atomic
> > 	-operations.
> > 	+the LR instruction.  The LR/SC sequence can be given release semantics
> > 	+by setting the {\em rl} bit on the SC instruction.  Setting the {\em
> > 	+  aq} bit on the LR instruction, and setting both the {\em aq} and the {\em
> > 	+  rl} bit on the SC instruction makes the LR/SC sequence sequentially
> > 	+consistent, meaning that it cannot be reordered with earlier or
> > 	+later memory operations from the same hart.
> > 
> > note that Model 2018 explicitly says that "ld.aq+sc.aqrl" is ordered
> > against "earlier or later memory operations from the same hart", and
> > this statement was not in Model 2017.
> > 
> > So my understanding of the story is that at some point between March and
> > May 2018, RISV memory model folks decided to add this rule, which does
> > look more consistent with other parts of the model and is useful.
> > 
> > And this is why (and when) "ld.aq+sc.aqrl" can be used as a fully-ordered
> > barrier ;-)
> > 
> > Now if my understanding is correct, to move forward, it's better that 1)
> > this patch gets resend with the above information (better rewording a
> > bit), and 2) gets an Acked-by from Dan to confirm this is a correct
> > history ;-)
> 
> I'm a bit lost as to why digging into RISC-V mailing list history is
> relevant here...what's relevant is what was ratified in the RVWMO
> chapter of the RISC-V spec, and whether the code you're proposing
> is the most optimized code that is correct wrt RVWMO.
> 
> Is your claim that the code you're proposing to fix was based on a
> pre-RVWMO RISC-V memory model definition, and you're updating it to
> be more RVWMO-compliant?
> 

Well, first it's not my code ;-)

The thing is that this patch proposed by Guo Ren kinda fixes/revertes a
previous commit 5ce6c1f3535f ("riscv/atomic: Strengthen implementations
with fences"). It looks to me that Guo Ren's patch fits the current
RISCV memory model and Linux kernel memory model, but the question is
that commit 5ce6c1f3535f was also a fix, so why do we change things
back and forth? If I understand correctly, this is also what Palmer and
Andrea asked for.

My understanding is that commit 5ce6c1f3535f was based on a draft RVWMO
that was different than the current one. I'd love to record this
difference in the commit log of Guo Ren's patch, so that later on we
know why we changed things back and forth. To do so, the confirmation
from RVWMO authors is helpful.

Hope that I make things more clear ;-)

Regards,
Boqun

> Dan
> 
> > Regards,
> > Boqun
> > 
> >>   Andrea
> >>
> >>
> > [...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
