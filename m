Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A96BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 23:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y682VRNcMVG8KOVBsHEZ/P+lmknKLSfIQKmyWABPD2M=; b=zXOKuK3j3AOogA
	5oM2H+rGWGyN6RbgqnY74IDlZecOSG3i0Uq5fXpuGqWVfyAfw8UVmBwqqqC04r2TM1Ugm55KIlJt5
	eGvlXM8nh7FMpZtPJHMF1xsEaFUDHqcYGG/7F13V74m/uQ5BMLlX2lO31urKPBPuWgvvzYjepwS9m
	cOX+JV0EiSuRjS9viQHIrPq3yBszXgkhi1dneTgutVrWCOeaChBBQbBiuG8nGrzXUIU8pNmahGAAt
	dARSFQ9zljEHm1SM8XU86zajQtUmNVzRBwSW3S0iA4ZcGJzLn8Ar2RaDsveh6I334PUKEVwFT60jX
	dQcMHl5+chM9y6JlkW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBm5B-009KUk-1Q; Wed, 13 Jul 2022 23:47:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBm57-009KSp-Ex
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 23:47:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB1D661B4C
	for <linux-riscv@lists.infradead.org>; Wed, 13 Jul 2022 23:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F6EC341C8
	for <linux-riscv@lists.infradead.org>; Wed, 13 Jul 2022 23:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657756068;
	bh=qz/y4cNJE+Zu2Oewv2BTIggQ9wuz1ZO9e2650HWZagQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eOE73fNCS9VoIkeVDiDdfw6d/P99h68DdnKtAmd7HvsjSRSX2N437LyR//2iDctl+
	 z38hdqsHqWypCL+cEbM3xIsxyj9UdOngLxecKfQQcmyqg50vrwDm8BdJ4ulLfNUvlV
	 /tlCVsPMLE1XApP9d+cw1p27noaFnOwGXEj9J2SPvz6alPdTb+esA+dn6w1EoY/yBs
	 +mJSVxDEfZkyXy4PSlVx+ym83A67nqd+4RNvS6N58T/5K4CoZvXCmb4/kHo1kuoDkP
	 0PNQTYhYI7B003FlJH+FHjMMAd7xQVS4Qcje/Rayu7+BHwpC0q3Ixj6RCnUcja/Wlw
	 zhq7GgMFv7ECQ==
Received: by mail-vs1-f41.google.com with SMTP id q26so65124vsp.11
        for <linux-riscv@lists.infradead.org>; Wed, 13 Jul 2022 16:47:48 -0700 (PDT)
X-Gm-Message-State: AJIora+FKNiLBufPfXgrd86pZZCAk25CgpyaSmkB7ipPne272gr6agV/
	YQXeu+ypW1tGyWBSnuvCGtlef4DIEUmK83GUr8g=
X-Google-Smtp-Source: AGRyM1vmNBeJUSbMgTl3pRhMqVMPOTSb1dwj/D/0eLxR/WhxIEaE+uG1bgCGWTtyPhyufuBXvVltKYuRYS8g5G2j8+g=
X-Received: by 2002:a67:cd94:0:b0:357:7a44:9a1a with SMTP id
 r20-20020a67cd94000000b003577a449a1amr2707867vsl.8.1657756067051; Wed, 13 Jul
 2022 16:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAJF2gTQoSQq_S4UvAiXgMviT040Ls8+VkDszQSke1a0zbXZ82A@mail.gmail.com>
 <mhng-7a274375-0d99-41c8-98a3-853d110f62e9@palmer-ri-x1c9>
 <CAJF2gTTXO42_TsZudaQuB9Re0teu__EZ11JZ96nktMqsQkMYNA@mail.gmail.com>
 <20220614110258.GA32157@anparri> <YrPei6q4rIAx6Ymf@boqun-archlinux>
 <fd664673-c4cc-be8f-9824-5272c5c79b40@nvidia.com> <CAJF2gTSEBQd75VWyyMwKuSDsLFoiBqB0WJfYsiEHVQbJgAgBvA@mail.gmail.com>
 <YsYivaDEksXPQPaH@boqun-archlinux>
In-Reply-To: <YsYivaDEksXPQPaH@boqun-archlinux>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 14 Jul 2022 07:47:35 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT=7+qYC-y1PapVx5yprmsr4mZGzRqz3hPq1i4SM-xqXg@mail.gmail.com>
Message-ID: <CAJF2gTT=7+qYC-y1PapVx5yprmsr4mZGzRqz3hPq1i4SM-xqXg@mail.gmail.com>
Subject: Re: [PATCH V4 5/5] riscv: atomic: Optimize LRSC-pairs atomic ops with
 .aqrl annotation
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Dan Lustig <dlustig@nvidia.com>, Andrea Parri <parri.andrea@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_164749_601511_980D79A8 
X-CRM114-Status: GOOD (  61.18  )
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

On Thu, Jul 7, 2022 at 8:04 AM Boqun Feng <boqun.feng@gmail.com> wrote:
>
> On Sat, Jun 25, 2022 at 01:29:50PM +0800, Guo Ren wrote:
> > On Fri, Jun 24, 2022 at 1:09 AM Dan Lustig <dlustig@nvidia.com> wrote:
> > >
> > > On 6/22/2022 11:31 PM, Boqun Feng wrote:
> > > > Hi,
> > > >
> > > > On Tue, Jun 14, 2022 at 01:03:47PM +0200, Andrea Parri wrote:
> > > > [...]
> > > >>> 5ce6c1f3535f ("riscv/atomic: Strengthen implementations with fences")
> > > >>> is about fixup wrong spinlock/unlock implementation and not relate to
> > > >>> this patch.
> > > >>
> > > >> No.  The commit in question is evidence of the fact that the changes
> > > >> you are presenting here (as an optimization) were buggy/incorrect at
> > > >> the time in which that commit was worked out.
> > > >>
> > > >>
> > > >>> Actually, sc.w.aqrl is very strong and the same with:
> > > >>> fence rw, rw
> > > >>> sc.w
> > > >>> fence rw,rw
> > > >>>
> > > >>> So "which do not give full-ordering with .aqrl" is not writen in
> > > >>> RISC-V ISA and we could use sc.w/d.aqrl with LKMM.
> > > >>>
> > > >>>>
> > > >>>>>> describes the issue more specifically, that's when we added these
> > > >>>>>> fences.  There have certainly been complains that these fences are too
> > > >>>>>> heavyweight for the HW to go fast, but IIUC it's the best option we have
> > > >>>>> Yeah, it would reduce the performance on D1 and our next-generation
> > > >>>>> processor has optimized fence performance a lot.
> > > >>>>
> > > >>>> Definately a bummer that the fences make the HW go slow, but I don't
> > > >>>> really see any other way to go about this.  If you think these mappings
> > > >>>> are valid for LKMM and RVWMO then we should figure this out, but trying
> > > >>>> to drop fences to make HW go faster in ways that violate the memory
> > > >>>> model is going to lead to insanity.
> > > >>> Actually, this patch is okay with the ISA spec, and Dan also thought
> > > >>> it was valid.
> > > >>>
> > > >>> ref: https://lore.kernel.org/lkml/41e01514-74ca-84f2-f5cc-2645c444fd8e@nvidia.com/raw
> > > >>
> > > >> "Thoughts" on this regard have _changed_.  Please compare that quote
> > > >> with, e.g.
> > > >>
> > > >>   https://lore.kernel.org/linux-riscv/ddd5ca34-805b-60c4-bf2a-d6a9d95d89e7@nvidia.com/
> > > >>
> > > >> So here's a suggestion:
> > > >>
> > > >> Reviewers of your patches have asked:  How come that code we used to
> > > >> consider as buggy is now considered "an optimization" (correct)?
> > > >>
> > > >> Denying the evidence or going around it is not making their job (and
> > > >> this upstreaming) easier, so why don't you address it?  Take time to
> > > >> review previous works and discussions in this area, understand them,
> > > >> and integrate such knowledge in future submissions.
> > > >>
> > > >
> > > > I agree with Andrea.
> > > >
> > > > And I actually took a look into this, and I think I find some
> > > > explanation. There are two versions of RISV memory model here:
> > > >
> > > > Model 2017: released at Dec 1, 2017 as a draft
> > > >
> > > >       https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/hKywNHBkAXM/m/QzUtxEWLBQAJ
> > > >
> > > > Model 2018: released at May 2, 2018
> > > >
> > > >       https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/xW03vmfmPuA/m/bMPk3UCWAgAJ
> > > >
> > > > Noted that previous conversation about commit 5ce6c1f3535f happened at
> > > > March 2018. So the timeline is roughly:
> > > >
> > > >       Model 2017 -> commit 5ce6c1f3535f -> Model 2018
> > > >
> > > > And in the email thread of Model 2018, the commit related to model
> > > > changes also got mentioned:
> > > >
> > > >       https://github.com/riscv/riscv-isa-manual/commit/b875fe417948635ed68b9644ffdf718cb343a81a
> > > >
> > > > in that commit, we can see the changes related to sc.aqrl are:
> > > >
> > > >        to have occurred between the LR and a successful SC.  The LR/SC
> > > >        sequence can be given acquire semantics by setting the {\em aq} bit on
> > > >       -the SC instruction.  The LR/SC sequence can be given release semantics
> > > >       -by setting the {\em rl} bit on the LR instruction.  Setting both {\em
> > > >       -  aq} and {\em rl} bits on the LR instruction, and setting the {\em
> > > >       -  aq} bit on the SC instruction makes the LR/SC sequence sequentially
> > > >       -consistent with respect to other sequentially consistent atomic
> > > >       -operations.
> > > >       +the LR instruction.  The LR/SC sequence can be given release semantics
> > > >       +by setting the {\em rl} bit on the SC instruction.  Setting the {\em
> > > >       +  aq} bit on the LR instruction, and setting both the {\em aq} and the {\em
> > > >       +  rl} bit on the SC instruction makes the LR/SC sequence sequentially
> > > >       +consistent, meaning that it cannot be reordered with earlier or
> > > >       +later memory operations from the same hart.
> > > >
> > > > note that Model 2018 explicitly says that "ld.aq+sc.aqrl" is ordered
> > > > against "earlier or later memory operations from the same hart", and
> > > > this statement was not in Model 2017.
> > > >
> > > > So my understanding of the story is that at some point between March and
> > > > May 2018, RISV memory model folks decided to add this rule, which does
> > > > look more consistent with other parts of the model and is useful.
> > > >
> > > > And this is why (and when) "ld.aq+sc.aqrl" can be used as a fully-ordered
> > > > barrier ;-)
> > > >
> > > > Now if my understanding is correct, to move forward, it's better that 1)
> > > > this patch gets resend with the above information (better rewording a
> > > > bit), and 2) gets an Acked-by from Dan to confirm this is a correct
> > > > history ;-)
> > >
> > > I'm a bit lost as to why digging into RISC-V mailing list history is
> > > relevant here...what's relevant is what was ratified in the RVWMO
> > > chapter of the RISC-V spec, and whether the code you're proposing
> > > is the most optimized code that is correct wrt RVWMO.
> > >
> > > Is your claim that the code you're proposing to fix was based on a
> > > pre-RVWMO RISC-V memory model definition, and you're updating it to
> > > be more RVWMO-compliant?
> > Could "lr + beq + sc.aqrl" provides a conditional RCsc here with
> > current spec? I only found "lr.aq + sc.aqrl" despcriton which is
> > un-conditional RCsc.
> >
>
> /me put the temporary RISCV memory model hat on and pretend to be a
> RISCV memory expert.
>
> I think the answer is yes, it's actually quite straightforwards given
> that RISCV treats PPO (Preserved Program Order) as part of GMO (Global
> Memory Order), considering the following (A and B are memory accesses):
>
>         A
>         ..
>         sc.aqrl // M
>         ..
>         B
>
> , A has a ->ppo ordering to M since "sc.aqrl" is a RELEASE, and M has
> a ->ppo ordeing to B since "sc.aqrl" is an AQUIRE, so
>
>         A ->ppo M ->ppo B
That also means M must fence.rl + sc + fence.aq. But in the release
consistency model, "rl + aq" is not legal and has no guarantee at all.

So sc.aqrl should be clarified in spec, but I only found "lr.aq +
sc.aqrl" description, see the patch commit log.

Could we treat sc.aqrl as a whole in ISA? Because in micro-arch, we
must separate it into pieces for implementation.

That is what the RVWMO should give out.

>
> And since RISCV describes that PPO is part of GMO:
>
> """
> The subset of program order that must be respected by the global memory
> order is known as preserved program order.
> """
>
> also in the herd model:
>
>         (* Main model axiom *)
>         acyclic co | rfe | fr | ppo as Model
If the herd7 model has defined that, I think it should be legal. Good catch.


>
> , therefore the ordering between A and B is GMO and GMO should be
> respected by all harts.
>
> Regards,
> Boqun
>
> > >
> > > Dan
> > >
> > > > Regards,
> > > > Boqun
> > > >
> > > >>   Andrea
> > > >>
> > > >>
> > > > [...]
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
