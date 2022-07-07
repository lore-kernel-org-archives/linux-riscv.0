Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ACBC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 00:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXOqvRDX8x11rnSlo7tHV6MmptJ6lLC8v8E9t1AGoPk=; b=FN2evgJjAk4yY/
	fyao8ywKi8Z3IgaXM2vAd1iyCEinC413sc7eHA6W/8vtyrK96ZEDYDj5HurWWNzRxrj/dyMNxjj5N
	r/2MRB+e9XOR5dI7yEo5QlwZecAbmo7Jiuy2LWgBAKGjCtCZCEK0odL3bWyGFASWD/KRP7NIRrQLu
	VOpyDUaB691mW05PUo7tmiBPpdDDREIsQ/nnNHBy4vsVqkXBf/JmN8SCMXk8Xb8RoL9reg3f794uL
	0Y5M/PmxLXXpFExCFd7t1YolxxRRHg7vKc2L5FLd/q0u8Mt5E1MDWw16c70rDwTBgIg9WYSmuF7ju
	6qfQZoZQAAnAP27KcbFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9F06-00Cp6G-VP; Thu, 07 Jul 2022 00:04:11 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9F04-00Cp4F-CJ
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 00:04:10 +0000
Received: by mail-qk1-x733.google.com with SMTP id o26so5171132qkl.6
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 17:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=feedback-id:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=egYv15cXkA5RpPdPdInxwHuoYF9xGZOxfekqWFe0C9c=;
        b=GwM0NHat2U8pX71R1qnS62+slU9mefwq/s9YBnSLXYw4DRADz2gf7HZHLtcHa9acgK
         CiOX+j/LqJPvg8DLU32IqVEi8a8U0O98IGzzPO4dxyRsXmFtGOdfs+UgizGbu28s99KF
         EhQx/JUjrd21/jzwfg6ea25gOa6nkzRPjuE4TsLqhnItj/H53yEjW/y8Y4o9OSGULtRE
         g5Z4a7shQR9ZPkiCECNGiEDghqVIG8RAXCYPt9zPhVrhi+Vq3X87XBzeNHbOCScAFTbX
         NcR23wuT1z9OX9tGR5x2f5pGJBL2Xi3DMXhwwfKQHkWyblpVflAHkoAJF/HpG7klvv8A
         0GPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:feedback-id:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=egYv15cXkA5RpPdPdInxwHuoYF9xGZOxfekqWFe0C9c=;
        b=OpHxlTr/mWcUI+v44xQnw5BaADrwGZrkXOsho1XsI8KslnPWV2VipXc+FGfWAyQqtL
         F/Z94AUXfwpxO4IqCVCQcd5ZXX/vLovXW09943U0/jgAhK4XdyxYrMLsLMB9JkQVqpvp
         OdXjPZR8QEo9SitK25wDDdyDjW79wsZ4lGjDjiDNPIoDeg38p43lAWfNPB+cdThX8Tw6
         93mExTFdnAaL+GYtwPaQ9xdo03d/jL//OeIHrpdZFycPfFmUsECejMCxTiQsIcPsMVlT
         yqzLsiijuhycOKcgpceJCNbINYFjykHAw25d2FZ+Svy/8T9ALyl16xJEdcDc81jcPS/D
         2t1w==
X-Gm-Message-State: AJIora9n4OwIqDvjaaKaNvgI+YmkUcZDMk2Y36iiSrJXa7snD+NvaN/l
	IPjMOIEorM3E+rfdv5GP7vE=
X-Google-Smtp-Source: AGRyM1s8wlVaTUmg4hECDVOwDwbH2eEUQQYqtVJ75ghJoTPH5GVm7OZyfjfQ0GBQyfR71wYpmPlxLA==
X-Received: by 2002:a05:620a:1b8f:b0:6af:337a:5067 with SMTP id dv15-20020a05620a1b8f00b006af337a5067mr28799459qkb.343.1657152245657;
        Wed, 06 Jul 2022 17:04:05 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id bs24-20020ac86f18000000b00304fa21762csm17824263qtb.53.2022.07.06.17.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 17:04:04 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailauth.nyi.internal (Postfix) with ESMTP id 3BC1127C0054;
	Wed,  6 Jul 2022 20:04:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 06 Jul 2022 20:04:04 -0400
X-ME-Sender: <xms:8yLGYqt5mcXP06hhWtOGg6SmrTwOOyDrLdl4pa4yqBaZ8GW5s4K5qA>
    <xme:8yLGYveLQsGc0b2yS-NTHDAHDnsfiZJ6IWYLL6jrwA2z-Ec3-6hJsOMcfu2bZEb08
    4Cd1Lpw8uM18IDBTg>
X-ME-Received: <xmr:8yLGYlzaKUT2FQgS1DBmykpVtChQxFQO9ezy_3fRVngvhwU6Ll6Ml4QTXtVd0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigedgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepfffhvfevuffkfhggtggu
    jgesthdtrodttddtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfh
    gvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpedugfeghfekveekveet
    tddtgeehieefledttdegudeuledthfdvheeileeftdfffeenucffohhmrghinhepkhgvrh
    hnvghlrdhorhhgpdhgohhoghhlvgdrtghomhdprhhishgtvhdrohhrghdpghhithhhuhgs
    rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:8yLGYlMNtPmqK-WsxqwawZ_NmeqUAR1VS44l5mIuUrBHVEUlWgKwnA>
    <xmx:8yLGYq8CapQHbyONWIdey2L4v02EOjk_wtjbQfvWQzhZxCKgSUf5yw>
    <xmx:8yLGYtX6xiuLTGsmuTvr6rJlo5t_U2nuDqIoiR1sw7Te4m2H8lysPg>
    <xmx:9CLGYtVslXJQuBgzT5qENf1h1gVoapA-OJAEQ3Xy8TS8Qre29_8HoQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 20:04:02 -0400 (EDT)
Date: Wed, 6 Jul 2022 17:03:09 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Dan Lustig <dlustig@nvidia.com>, Andrea Parri <parri.andrea@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V4 5/5] riscv: atomic: Optimize LRSC-pairs atomic ops
 with .aqrl annotation
Message-ID: <YsYivaDEksXPQPaH@boqun-archlinux>
References: <CAJF2gTQoSQq_S4UvAiXgMviT040Ls8+VkDszQSke1a0zbXZ82A@mail.gmail.com>
 <mhng-7a274375-0d99-41c8-98a3-853d110f62e9@palmer-ri-x1c9>
 <CAJF2gTTXO42_TsZudaQuB9Re0teu__EZ11JZ96nktMqsQkMYNA@mail.gmail.com>
 <20220614110258.GA32157@anparri>
 <YrPei6q4rIAx6Ymf@boqun-archlinux>
 <fd664673-c4cc-be8f-9824-5272c5c79b40@nvidia.com>
 <CAJF2gTSEBQd75VWyyMwKuSDsLFoiBqB0WJfYsiEHVQbJgAgBvA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSEBQd75VWyyMwKuSDsLFoiBqB0WJfYsiEHVQbJgAgBvA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_170408_452214_0B7C72C5 
X-CRM114-Status: GOOD (  54.86  )
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

On Sat, Jun 25, 2022 at 01:29:50PM +0800, Guo Ren wrote:
> On Fri, Jun 24, 2022 at 1:09 AM Dan Lustig <dlustig@nvidia.com> wrote:
> >
> > On 6/22/2022 11:31 PM, Boqun Feng wrote:
> > > Hi,
> > >
> > > On Tue, Jun 14, 2022 at 01:03:47PM +0200, Andrea Parri wrote:
> > > [...]
> > >>> 5ce6c1f3535f ("riscv/atomic: Strengthen implementations with fences")
> > >>> is about fixup wrong spinlock/unlock implementation and not relate to
> > >>> this patch.
> > >>
> > >> No.  The commit in question is evidence of the fact that the changes
> > >> you are presenting here (as an optimization) were buggy/incorrect at
> > >> the time in which that commit was worked out.
> > >>
> > >>
> > >>> Actually, sc.w.aqrl is very strong and the same with:
> > >>> fence rw, rw
> > >>> sc.w
> > >>> fence rw,rw
> > >>>
> > >>> So "which do not give full-ordering with .aqrl" is not writen in
> > >>> RISC-V ISA and we could use sc.w/d.aqrl with LKMM.
> > >>>
> > >>>>
> > >>>>>> describes the issue more specifically, that's when we added these
> > >>>>>> fences.  There have certainly been complains that these fences are too
> > >>>>>> heavyweight for the HW to go fast, but IIUC it's the best option we have
> > >>>>> Yeah, it would reduce the performance on D1 and our next-generation
> > >>>>> processor has optimized fence performance a lot.
> > >>>>
> > >>>> Definately a bummer that the fences make the HW go slow, but I don't
> > >>>> really see any other way to go about this.  If you think these mappings
> > >>>> are valid for LKMM and RVWMO then we should figure this out, but trying
> > >>>> to drop fences to make HW go faster in ways that violate the memory
> > >>>> model is going to lead to insanity.
> > >>> Actually, this patch is okay with the ISA spec, and Dan also thought
> > >>> it was valid.
> > >>>
> > >>> ref: https://lore.kernel.org/lkml/41e01514-74ca-84f2-f5cc-2645c444fd8e@nvidia.com/raw
> > >>
> > >> "Thoughts" on this regard have _changed_.  Please compare that quote
> > >> with, e.g.
> > >>
> > >>   https://lore.kernel.org/linux-riscv/ddd5ca34-805b-60c4-bf2a-d6a9d95d89e7@nvidia.com/
> > >>
> > >> So here's a suggestion:
> > >>
> > >> Reviewers of your patches have asked:  How come that code we used to
> > >> consider as buggy is now considered "an optimization" (correct)?
> > >>
> > >> Denying the evidence or going around it is not making their job (and
> > >> this upstreaming) easier, so why don't you address it?  Take time to
> > >> review previous works and discussions in this area, understand them,
> > >> and integrate such knowledge in future submissions.
> > >>
> > >
> > > I agree with Andrea.
> > >
> > > And I actually took a look into this, and I think I find some
> > > explanation. There are two versions of RISV memory model here:
> > >
> > > Model 2017: released at Dec 1, 2017 as a draft
> > >
> > >       https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/hKywNHBkAXM/m/QzUtxEWLBQAJ
> > >
> > > Model 2018: released at May 2, 2018
> > >
> > >       https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/xW03vmfmPuA/m/bMPk3UCWAgAJ
> > >
> > > Noted that previous conversation about commit 5ce6c1f3535f happened at
> > > March 2018. So the timeline is roughly:
> > >
> > >       Model 2017 -> commit 5ce6c1f3535f -> Model 2018
> > >
> > > And in the email thread of Model 2018, the commit related to model
> > > changes also got mentioned:
> > >
> > >       https://github.com/riscv/riscv-isa-manual/commit/b875fe417948635ed68b9644ffdf718cb343a81a
> > >
> > > in that commit, we can see the changes related to sc.aqrl are:
> > >
> > >        to have occurred between the LR and a successful SC.  The LR/SC
> > >        sequence can be given acquire semantics by setting the {\em aq} bit on
> > >       -the SC instruction.  The LR/SC sequence can be given release semantics
> > >       -by setting the {\em rl} bit on the LR instruction.  Setting both {\em
> > >       -  aq} and {\em rl} bits on the LR instruction, and setting the {\em
> > >       -  aq} bit on the SC instruction makes the LR/SC sequence sequentially
> > >       -consistent with respect to other sequentially consistent atomic
> > >       -operations.
> > >       +the LR instruction.  The LR/SC sequence can be given release semantics
> > >       +by setting the {\em rl} bit on the SC instruction.  Setting the {\em
> > >       +  aq} bit on the LR instruction, and setting both the {\em aq} and the {\em
> > >       +  rl} bit on the SC instruction makes the LR/SC sequence sequentially
> > >       +consistent, meaning that it cannot be reordered with earlier or
> > >       +later memory operations from the same hart.
> > >
> > > note that Model 2018 explicitly says that "ld.aq+sc.aqrl" is ordered
> > > against "earlier or later memory operations from the same hart", and
> > > this statement was not in Model 2017.
> > >
> > > So my understanding of the story is that at some point between March and
> > > May 2018, RISV memory model folks decided to add this rule, which does
> > > look more consistent with other parts of the model and is useful.
> > >
> > > And this is why (and when) "ld.aq+sc.aqrl" can be used as a fully-ordered
> > > barrier ;-)
> > >
> > > Now if my understanding is correct, to move forward, it's better that 1)
> > > this patch gets resend with the above information (better rewording a
> > > bit), and 2) gets an Acked-by from Dan to confirm this is a correct
> > > history ;-)
> >
> > I'm a bit lost as to why digging into RISC-V mailing list history is
> > relevant here...what's relevant is what was ratified in the RVWMO
> > chapter of the RISC-V spec, and whether the code you're proposing
> > is the most optimized code that is correct wrt RVWMO.
> >
> > Is your claim that the code you're proposing to fix was based on a
> > pre-RVWMO RISC-V memory model definition, and you're updating it to
> > be more RVWMO-compliant?
> Could "lr + beq + sc.aqrl" provides a conditional RCsc here with
> current spec? I only found "lr.aq + sc.aqrl" despcriton which is
> un-conditional RCsc.
> 

/me put the temporary RISCV memory model hat on and pretend to be a
RISCV memory expert.

I think the answer is yes, it's actually quite straightforwards given
that RISCV treats PPO (Preserved Program Order) as part of GMO (Global
Memory Order), considering the following (A and B are memory accesses):

	A
	..
	sc.aqrl // M
	..
	B

, A has a ->ppo ordering to M since "sc.aqrl" is a RELEASE, and M has
a ->ppo ordeing to B since "sc.aqrl" is an AQUIRE, so

	A ->ppo M ->ppo B

And since RISCV describes that PPO is part of GMO:

"""
The subset of program order that must be respected by the global memory
order is known as preserved program order.
"""

also in the herd model:

	(* Main model axiom *)
	acyclic co | rfe | fr | ppo as Model

, therefore the ordering between A and B is GMO and GMO should be
respected by all harts.

Regards,
Boqun

> >
> > Dan
> >
> > > Regards,
> > > Boqun
> > >
> > >>   Andrea
> > >>
> > >>
> > > [...]
> 
> 
> 
> --
> Best Regards
>  Guo Ren
> 
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
