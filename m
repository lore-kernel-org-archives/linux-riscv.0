Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538E5C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 22:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmQd/fwZ8vyo4Gei8dAqtXqCpglM2cFx1ZqJevMHWDo=; b=r/EYP0F0Mb97Co
	u8VKij1U5+4NoMcqQdH10P8SDoBcP0A4q8wGzf7s16YMWtqQtTRkUn/3+rlYBpIpePLJUxuM8rOt7
	k5993E2lxzWUaqvMFx3x9P7wOczyRBQUUnXKq64uwyf3tf+Bs17eS5Yqo26FDyyJ78TXPPGLBgtU0
	j5Cf8O/NzwJ4Fn7AknJMdiIhLbHoaRy8aDiSOJRNHwBy0YAnFyDPZ8oUW5wQQK3JXaJxuiojCo0zc
	d/itP9wWMnf91d/0qYHVuNJ/65Lschs2wKbMZphGel8vFqTQzxVTmjftWscxmGBDju41TmIOil3qq
	a2O9Z3KRE07GPpK9ktvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1bkj-00Gidv-86; Wed, 15 Jun 2022 22:44:45 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1bkX-00Gia4-5l
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 22:44:35 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-31756c8143aso27165827b3.12
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jun 2022 15:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4tavlAUV9j8wy9Y5ZQvNo9SbXkg+xPmAoMXm4I/5xKc=;
        b=aZNQ5xMgIiG+HULjGPsz/c4fuu1pIiVq25bbPs0kP7PT4TVBMUXWXxCb+XdLlboNiS
         BY1QO9YbEkE1ucrqKunLlScMzaeQjou00OCPBM4w+t5MZQLjUIxAd7DQQBe7lKb1FOG+
         c5NGYsihwrfO1Ad6GDXI18YoVHjQaZ+S2FCfah4pFm6qevntRpdMtuxzgJO8y299+li5
         Gqz5VJ4/8kRzkg8gMQO32Vz1ItJbqloXo35C1YbgSSBn/9u/TCyYr1NOYhdJhHFkYht2
         DpG6H7EHtm3JLFKAXgoVXB5PaPGNQANnNBqDYGif7OcNDRf0fXUlmM6+kwFRCJtliAI8
         CZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4tavlAUV9j8wy9Y5ZQvNo9SbXkg+xPmAoMXm4I/5xKc=;
        b=L7KF1JVz0yOybP2qD0GkL2APi/JyicMb+Fzx0o9iGeYkQhxlo4Aj847As549Gd17yH
         PCOu7GiVThCHcVwQrO+RKEZIGOT9QRpEpQsQoeMN0d+HeugOa9g6pQgZAakXdtj1PtyH
         qp6i5AM41lID0WwsVIB/pweijX8DDgVW9MAo5I42B8HzmcYIMFAgYxcXDgI/xfdrQ6VH
         cG5Z7KHI09wDG1OtCzpaoZxv5J0b6kjsvAxbfTa923O1a1+rCRBRoKxsXmm1k5VKIyhm
         wfxt/kDRirn83pb4qEV8/VJQsvZ86/mBrG8AmHPDKLd3W1q3qV87eVcJZIO9p/YOVk/e
         WuSQ==
X-Gm-Message-State: AJIora/9O+XerZag1X+AU/8RzjDrVADDOYRdCyJw2LdI8mDW3+XnwNoX
	C0E71L1r/2g5VoFsrbKKG8VE6cIr5wDUw70K6bwIvw==
X-Google-Smtp-Source: AGRyM1stRFtj29Af2h8WR1JcITwxs/W78sA8TWkUE/45znWIrRL39l5SwaqbU8gHEq2Pk+V2tvNYYWtmYMer5uWOrHY=
X-Received: by 2002:a81:8707:0:b0:314:1c64:eb4d with SMTP id
 x7-20020a818707000000b003141c64eb4dmr2323993ywf.86.1655333069287; Wed, 15 Jun
 2022 15:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220525081416.3306043-12-sudeep.holla@arm.com>
 <20220525081416.3306043-13-sudeep.holla@arm.com> <20220525081416.3306043-14-sudeep.holla@arm.com>
 <20220525081416.3306043-15-sudeep.holla@arm.com> <20220525081416.3306043-16-sudeep.holla@arm.com>
 <947470ba-35fc-3c72-d01b-c0a7337216a2@arm.com> <20220606102159.dduxmvq4m2fm6gks@bogus>
 <CAKfTPtB8iPzEXipsJqNtd9-aJMKx-FAaiGMzOg58HgRQuo39iA@mail.gmail.com>
 <20220610102753.virkx47uyfsojol6@bogus> <CAKfTPtD==UMjbSGHvKxT_z=LyvsJt=UCHsqkbgVnagbn5Aqpcw@mail.gmail.com>
 <20220615170033.q4og4pnmpwdg3l2g@bogus>
In-Reply-To: <20220615170033.q4og4pnmpwdg3l2g@bogus>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 16 Jun 2022 00:44:17 +0200
Message-ID: <CAKfTPtCeox-qjaoXqOawaghZDwsKBF6FBPENFtsQSb2r6JPy2w@mail.gmail.com>
Subject: Re: [PATCH v3 15/16] arch_topology: Set cluster identifier in each
 core/thread from /cpu-map
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Morten Rasmussen <morten.rasmussen@arm.com>, Qing Wang <wangqing@vivo.com>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_154433_308022_4CA4C222 
X-CRM114-Status: GOOD (  58.98  )
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

On Wed, 15 Jun 2022 at 19:01, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> Please note until we agree on unified view for hardware topology, I will
> temporarily ignore any scheduler domain related issues/concerns as this
> thread/discussion is mixing up too much IMO. I am not ignoring sched_domain
> concerns, but deferring it until we agree on the hardware topology view
> which is user visible and how that impacts sched domain topology can be
> considered soon following that.
>
> On Tue, Jun 14, 2022 at 07:59:23PM +0200, Vincent Guittot wrote:
> > On Fri, 10 Jun 2022 at 12:27, Sudeep Holla <sudeep.holla@arm.com> wrote:
> > >
> > > On Fri, Jun 10, 2022 at 12:08:44PM +0200, Vincent Guittot wrote:
> > > > On Mon, 6 Jun 2022 at 12:22, Sudeep Holla <sudeep.holla@arm.com> wrote:
> > > > >
> > >
> > > [...]
> > >
> > > > > Why ? Are you suggesting that we shouldn't present the hardware cluster
> > > > > to the topology because of the above reason ? If so, sorry that is not a
> > > > > valid reason. We could add login to return NULL or appropriate value
> > > > > needed in cpu_clustergroup_mask id it matches MC level mask if we can't
> > > > > deal that in generic scheduler code. But the topology code can't be
> > > > > compromised for that reason as it is user visible.
> > > >
> > > > I tend to agree with Dietmar. The legacy use of cluster node in DT
> > > > refers to the dynamiQ or legacy b.L cluster which is also aligned to
> > > > the LLC and the MC scheduling level. The new cluster level that has
> > > > been introduced recently does not target this level but some
> > > > intermediate levels either inside like for the kupeng920 or the v9
> > > > complex or outside like for the ampere altra. So I would say that
> > > > there is one cluster node level in DT that refers to the same MC/LLC
> > > > level and only an additional child/parent cluster node should be used
> > > > to fill the clustergroup_mask.
> > > >
> > >
> > > Again I completely disagree. Let us look at the problems separately.
> > > The hardware topology that some of the tools like lscpu and lstopo expects
> > > what the hardware looks like and not the scheduler's view of the hardware.
> > > So the topology masks that gets exposed to the user-space needs fixing
> > > even today. I have reports from various tooling people about the same.
> > > E.g. Juno getting exposed as dual socket system is utter non-sense.
> > >
> > > Yes scheduler uses most of the topology masks as is but that is not a must.
> > > There are these *group_mask functions that can implement what scheduler
> > > needs to be fed.
> > >
> > > I am not sure why the 2 issues are getting mixed up and that is the main
> > > reason why I jumped into this to make sure the topology masks are
> > > not tampered based on the way it needs to be used for scheduler.
> > >
> > > Both ACPI and DT on a platform must present exact same hardware topology
> > > to the user-space, there is no space for argument there.
> >
> > But that's exactly my point there:
> > ACPI doesn't show the dynamiQ level anywhere but only the llc which
> > are the same and your patch makes the dynamiQ level visible for DT in
> > addition to llc
> >
>
> Sorry if I am missing something obvious here, but both ACPI and DT has no
> special representation for dynamiQ clusters and hence it is impossible to
> deduce the same from either DT or ACPI. Can you provide some details
> or example as what you are referring as dynamiQ. Also what you mean by
> dynamiQ not shown on ACPI while shown with DT systems. If there is any
> discrepancies, we need to fix.

The cpu-map node in DT is following the dynamiQ or the legacy
big.LITTLE topology. As an example  the hikey6220 has 2 clusters, the
hikey960 has 2 clusters that reflect big.LITTLE and the sdm845 has one
cluster that reflects the dynamiQ cluster.

now my mistake is to have made the assumption that core_sibling is
arch_topology was used to reflect the cores sharing cache but after
looking more deeply in the code it seems to be a lucky coincidence

>
> Now, what I refer as discrepancy for example on Juno is below:
> (value read from a subset of per cpu sysfs files)
> cpu                     0       1       2       3       4       5
> cluster_id              -1      -1      -1      -1      -1      -1
> physical_package_id     1       0       0       1       1       1
> cluster_cpus_list       0       1       2       3       4       5
> package_cpus_list       0,3-5   1-2     1-2     0,3-5   0,3-5   0,3-5
>
> The above one is for DT which is wrong in all the 4 entries above.
> The below one is on ACPI and after applying my series on Juno.
>
> cpu                     0       1       2       3       4       5
> cluster_id              1       0       0       1       1       1
> physical_package_id     0       0       0       0       0       0
> cluster_cpus_list       0,3-5   1-2     1-2     0,3-5   0,3-5   0,3-5
> package_cpus_list       0-5     0-5     0-5     0-5     0-5     0-5
>
> This matches the expectation from the various userspace tools like lscpu,
> lstopo,..etc.
>
> > >
> > > > IIUC, we don't describe the dynamiQ level in ACPI which  uses cache
> > > > topology instead to define cpu_coregroup_mask whereas DT described the
> > > > dynamiQ instead of using cache topology. If you use cache topology
> > > > now, then you should skip the dynamiQ
> > > >
> > >
> > > Yes, unless someone can work out a binding to represent that and convince
> > > DT maintainers ;).
> > >
> > > > Finally, even if CLS and MC have the same scheduling behavior for now,
> > > > they might ends up with different scheduling properties which would
> > > > mean that replacing MC level by CLS one for current SoC would become
> > > > wrong
> > > >
> > >
> > > Again as I mentioned to Dietmar, that is something we can and must deal with
> > > in those *group_mask and not expect topology mask to be altered to meet
> > > CLS/MC or whatever sched domains needs. Sorry, that is my strong opinion
> > > as the topology is already user-space visible and (tooling) people are
> > > complaining that DT systems are broken and doesn't match ACPI systems.
> >
> > again, your proposal doesn't help here because the DT will show a
> > level that doesn't appears in ACPI
> >
>
> Which level exactly ? It matches exactly for Juno, the sysfs files are
> exact match after my changes. Again don't mix the scheduler domains for
> arguments here.
>
> > >
> > > So unless someone gives me non-scheduler and topology specific reasons
> > > to change that, sorry but my opinion on this matter is not going to change ;).
> > >
> > > You will get this view of topology, find a way to manage with all those
> > > *group_mask functions. By the way it is already handled for ACPI systems,
> >
> > AFAICT, no it's not, the cluster described in ACPI is not the dynamiQ
> > level that you make now visible to DT
>
> Again, no. There is no binding for dynamiQ level either in DT or ACPI and
> hence there is no way it can become visible on DT. So I have no idea why
> there is a thought process or assumption about existence of dynamiQ level
> in the DT. It doesn't exist. If that is wrong, can you point me to the
> bindings as well as existing device tree ? If you are referring to the
> phantom domains Dietmar mentioned in earlier threads, then they don't exist.
> It is made up and one need to get the bindings pushed before we can address
> such a system.
>
> --
> Regards,
> Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
