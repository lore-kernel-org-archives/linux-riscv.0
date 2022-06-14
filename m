Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C37C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 17:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tjz/bMRAHUEWxYYiic/Zfb2YHSQcDnIH+qC6jqWVozk=; b=mDjdhx4RBf6uzu
	4CM21vQSDmRDbeRcvbBX11Yg+m6DcyNCVPJvM76IISzMlENzGVlcqr6ulLY+vQZT5EEO+pPVJJe9v
	X2RweMf9sHHQhh2S0xX2IDyczuwuXVPSU+MQsgrGPYryZ48BiTVWggP01ThsJ17mi8z92MA/A6uUJ
	r5ZY/ENsAspnTwGBKV7jwmJgDKq575jlop41SwhuZjWwpHh5OH4JjyvaJDm83i74UZxunWtvcypEG
	fRGoLozhvaxAMKwKbACrNM/QgYb/f2SZr+/r+wAZEWOrbLBn1ZkCC9Ekvzug5LnPHs5XHK3++RB6Z
	IHh+7oJZ+3dNrt53Xc2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ApK-00Aewp-Or; Tue, 14 Jun 2022 17:59:42 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ApH-00AevS-GB
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 17:59:41 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-3137316bb69so37628227b3.10
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jun 2022 10:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=26g0MRBcct9YNTtppVTH2VrL+ERGht+b/7zwiSemUyA=;
        b=J/nOyu12o+bRB6Fge5isqT7wonLs+xdaSOYk2ZzUXUfdYO+tT/NdTBYHgwhpGYQ2OZ
         RPmye6epdqPtaw2Nbws6asqaYf+6aVxIqXDMZqxjNbzCQ3zwB1L5G/BhpEzxNla/VIO8
         cDStVQFFwJb6UTJpX5S+LIugBTOAwh6cGWRiIgHiZi3tWxT7rMU+TWdd2QMU7ovh8PNx
         gwaIT5F7fFUR2oLX1CsaFR9TrEfJFASZUCVW8i9DhsF3f8y+wbxkjn4QyC9i8LNrGM93
         gQQlBK9AywuTU1ofkcSnNRSmzJuv/FDzyMjYLJrFjuFY9oaCAxFePfAUwZONNTzqOrtA
         C31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=26g0MRBcct9YNTtppVTH2VrL+ERGht+b/7zwiSemUyA=;
        b=qVcdUt7Hv6X+0AarwBPhgNHlY7P/RzqCjsLkTZnF3qgkEcF4zC81hP88B3km0jYaUv
         K60Akf86jlYtPpNnsQaDQ/Qz4xugP4WjPRPYmrHgvziS/2Mc9BQK+MQOQckzDyKJrkHS
         RlkbrM+jxwW+9wMmKrSK2Nd+uv9QZvP4in+VljzptBd3I6pxmOBn6HkUeyPv732+vhpX
         WaFRfT+oh1PsJvh3yuLiiCC5+PXYDv+6DM8GjKQLmx1a0sFdQjCu9oWEsKEdcCi36F/N
         mulogXlsmyZ15SEWv5+X5HeKgPMX99BrFKOCwQCBbJRKTS46Q4XUnvKIW43VszsY+EF+
         AuqA==
X-Gm-Message-State: AJIora82L15M/mA2lj1j5l+RRmIexo/nqiWqMGowiaEJkrGnX9tX4/+4
	z5bogg1HkBq0zXwr1jrEfqihUSI8WS3XiNdhCkjB4A==
X-Google-Smtp-Source: AGRyM1uYZTCyS6ekVxMN4LE950ueaI6pIZQPKcwQF0t97ENb1ZzjK0WrhozZcmpCzb6Uo04yXOpLPQ3F6GVqXwU6Q74=
X-Received: by 2002:a81:2f84:0:b0:314:2bfd:bf1f with SMTP id
 v126-20020a812f84000000b003142bfdbf1fmr7094481ywv.320.1655229576055; Tue, 14
 Jun 2022 10:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220525081416.3306043-10-sudeep.holla@arm.com>
 <20220525081416.3306043-11-sudeep.holla@arm.com> <20220525081416.3306043-12-sudeep.holla@arm.com>
 <20220525081416.3306043-13-sudeep.holla@arm.com> <20220525081416.3306043-14-sudeep.holla@arm.com>
 <20220525081416.3306043-15-sudeep.holla@arm.com> <20220525081416.3306043-16-sudeep.holla@arm.com>
 <947470ba-35fc-3c72-d01b-c0a7337216a2@arm.com> <20220606102159.dduxmvq4m2fm6gks@bogus>
 <CAKfTPtB8iPzEXipsJqNtd9-aJMKx-FAaiGMzOg58HgRQuo39iA@mail.gmail.com> <20220610102753.virkx47uyfsojol6@bogus>
In-Reply-To: <20220610102753.virkx47uyfsojol6@bogus>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 14 Jun 2022 19:59:23 +0200
Message-ID: <CAKfTPtD==UMjbSGHvKxT_z=LyvsJt=UCHsqkbgVnagbn5Aqpcw@mail.gmail.com>
Subject: Re: [PATCH v3 15/16] arch_topology: Set cluster identifier in each
 core/thread from /cpu-map
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Morten Rasmussen <morten.rasmussen@arm.com>, Qing Wang <wangqing@vivo.com>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_105939_585909_370CB379 
X-CRM114-Status: GOOD (  40.01  )
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

On Fri, 10 Jun 2022 at 12:27, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Fri, Jun 10, 2022 at 12:08:44PM +0200, Vincent Guittot wrote:
> > On Mon, 6 Jun 2022 at 12:22, Sudeep Holla <sudeep.holla@arm.com> wrote:
> > >
>
> [...]
>
> > > Why ? Are you suggesting that we shouldn't present the hardware cluster
> > > to the topology because of the above reason ? If so, sorry that is not a
> > > valid reason. We could add login to return NULL or appropriate value
> > > needed in cpu_clustergroup_mask id it matches MC level mask if we can't
> > > deal that in generic scheduler code. But the topology code can't be
> > > compromised for that reason as it is user visible.
> >
> > I tend to agree with Dietmar. The legacy use of cluster node in DT
> > refers to the dynamiQ or legacy b.L cluster which is also aligned to
> > the LLC and the MC scheduling level. The new cluster level that has
> > been introduced recently does not target this level but some
> > intermediate levels either inside like for the kupeng920 or the v9
> > complex or outside like for the ampere altra. So I would say that
> > there is one cluster node level in DT that refers to the same MC/LLC
> > level and only an additional child/parent cluster node should be used
> > to fill the clustergroup_mask.
> >
>
> Again I completely disagree. Let us look at the problems separately.
> The hardware topology that some of the tools like lscpu and lstopo expects
> what the hardware looks like and not the scheduler's view of the hardware.
> So the topology masks that gets exposed to the user-space needs fixing
> even today. I have reports from various tooling people about the same.
> E.g. Juno getting exposed as dual socket system is utter non-sense.
>
> Yes scheduler uses most of the topology masks as is but that is not a must.
> There are these *group_mask functions that can implement what scheduler
> needs to be fed.
>
> I am not sure why the 2 issues are getting mixed up and that is the main
> reason why I jumped into this to make sure the topology masks are
> not tampered based on the way it needs to be used for scheduler.
>
> Both ACPI and DT on a platform must present exact same hardware topology
> to the user-space, there is no space for argument there.

But that's exactly my point there:
ACPI doesn't show the dynamiQ level anywhere but only the llc which
are the same and your patch makes the dynamiQ level visible for DT in
addition to llc

>
> > IIUC, we don't describe the dynamiQ level in ACPI which  uses cache
> > topology instead to define cpu_coregroup_mask whereas DT described the
> > dynamiQ instead of using cache topology. If you use cache topology
> > now, then you should skip the dynamiQ
> >
>
> Yes, unless someone can work out a binding to represent that and convince
> DT maintainers ;).
>
> > Finally, even if CLS and MC have the same scheduling behavior for now,
> > they might ends up with different scheduling properties which would
> > mean that replacing MC level by CLS one for current SoC would become
> > wrong
> >
>
> Again as I mentioned to Dietmar, that is something we can and must deal with
> in those *group_mask and not expect topology mask to be altered to meet
> CLS/MC or whatever sched domains needs. Sorry, that is my strong opinion
> as the topology is already user-space visible and (tooling) people are
> complaining that DT systems are broken and doesn't match ACPI systems.

again, your proposal doesn't help here because the DT will show a
level that doesn't appears in ACPI

>
> So unless someone gives me non-scheduler and topology specific reasons
> to change that, sorry but my opinion on this matter is not going to change ;).
>
> You will get this view of topology, find a way to manage with all those
> *group_mask functions. By the way it is already handled for ACPI systems,

AFAICT, no it's not, the cluster described in ACPI is not the dynamiQ
level that you make now visible to DT

> so if you are not happy with that, then that needs fixing as this change
> set just aligns the behaviour on similar ACPI system. So the Juno example
> is incorrect for the reason that the behaviour of scheduler there is different
> with DT and ACPI.
>
> --
> Regards,
> Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
