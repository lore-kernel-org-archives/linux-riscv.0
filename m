Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBF6C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 10:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mE4D74AAnra/GYdT1zHyU+Xk7mUrj3u0s9iebmsmEEQ=; b=kO4B4NiEGy7j1c
	PnulhZ0aAflX6rh6mzLFKKFukvyKkhnge1OCEgVu+JXw9L/d1SjTwr4XEpdUcnWidXs5L3gzQswip
	hN83m3aZuaPIg290RIzilF7GbFepH8LEwMY82UnJJAaRqEYlVNnIhV2/NXkWVKlEXldjGYt2c4y75
	JPDx85mGasbQ2/U8xG2x9iSB1XatR60FrSwgempv3p+hsRPYBvtO3+vBtKk2KSpeTYjWJEnUjqyKi
	4BkIgOipKIUfmwecV7C0szCLssfFJVSmnpVh5Jz4rkWKenjTp0zFqT7yEQwAXECIhWxgd+E3ah4oG
	5rQxrB2jrs8o+GE6ba7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbsI-007bGY-MT; Fri, 10 Jun 2022 10:28:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbs4-007bE1-UU; Fri, 10 Jun 2022 10:28:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2B6E12FC;
	Fri, 10 Jun 2022 03:27:58 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5DFF3F766;
	Fri, 10 Jun 2022 03:27:56 -0700 (PDT)
Date: Fri, 10 Jun 2022 11:27:53 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Morten Rasmussen <morten.rasmussen@arm.com>,
	Qing Wang <wangqing@vivo.com>, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 15/16] arch_topology: Set cluster identifier in each
 core/thread from /cpu-map
Message-ID: <20220610102753.virkx47uyfsojol6@bogus>
References: <20220525081416.3306043-10-sudeep.holla@arm.com>
 <20220525081416.3306043-11-sudeep.holla@arm.com>
 <20220525081416.3306043-12-sudeep.holla@arm.com>
 <20220525081416.3306043-13-sudeep.holla@arm.com>
 <20220525081416.3306043-14-sudeep.holla@arm.com>
 <20220525081416.3306043-15-sudeep.holla@arm.com>
 <20220525081416.3306043-16-sudeep.holla@arm.com>
 <947470ba-35fc-3c72-d01b-c0a7337216a2@arm.com>
 <20220606102159.dduxmvq4m2fm6gks@bogus>
 <CAKfTPtB8iPzEXipsJqNtd9-aJMKx-FAaiGMzOg58HgRQuo39iA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKfTPtB8iPzEXipsJqNtd9-aJMKx-FAaiGMzOg58HgRQuo39iA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_032806_770315_BACCC9BE 
X-CRM114-Status: GOOD (  27.74  )
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

On Fri, Jun 10, 2022 at 12:08:44PM +0200, Vincent Guittot wrote:
> On Mon, 6 Jun 2022 at 12:22, Sudeep Holla <sudeep.holla@arm.com> wrote:
> >

[...]

> > Why ? Are you suggesting that we shouldn't present the hardware cluster
> > to the topology because of the above reason ? If so, sorry that is not a
> > valid reason. We could add login to return NULL or appropriate value
> > needed in cpu_clustergroup_mask id it matches MC level mask if we can't
> > deal that in generic scheduler code. But the topology code can't be
> > compromised for that reason as it is user visible.
> 
> I tend to agree with Dietmar. The legacy use of cluster node in DT
> refers to the dynamiQ or legacy b.L cluster which is also aligned to
> the LLC and the MC scheduling level. The new cluster level that has
> been introduced recently does not target this level but some
> intermediate levels either inside like for the kupeng920 or the v9
> complex or outside like for the ampere altra. So I would say that
> there is one cluster node level in DT that refers to the same MC/LLC
> level and only an additional child/parent cluster node should be used
> to fill the clustergroup_mask.
>

Again I completely disagree. Let us look at the problems separately.
The hardware topology that some of the tools like lscpu and lstopo expects
what the hardware looks like and not the scheduler's view of the hardware.
So the topology masks that gets exposed to the user-space needs fixing
even today. I have reports from various tooling people about the same.
E.g. Juno getting exposed as dual socket system is utter non-sense.

Yes scheduler uses most of the topology masks as is but that is not a must.
There are these *group_mask functions that can implement what scheduler
needs to be fed.

I am not sure why the 2 issues are getting mixed up and that is the main
reason why I jumped into this to make sure the topology masks are
not tampered based on the way it needs to be used for scheduler.

Both ACPI and DT on a platform must present exact same hardware topology
to the user-space, there is no space for argument there.

> IIUC, we don't describe the dynamiQ level in ACPI which  uses cache
> topology instead to define cpu_coregroup_mask whereas DT described the
> dynamiQ instead of using cache topology. If you use cache topology
> now, then you should skip the dynamiQ
>

Yes, unless someone can work out a binding to represent that and convince
DT maintainers ;).

> Finally, even if CLS and MC have the same scheduling behavior for now,
> they might ends up with different scheduling properties which would
> mean that replacing MC level by CLS one for current SoC would become
> wrong
>

Again as I mentioned to Dietmar, that is something we can and must deal with
in those *group_mask and not expect topology mask to be altered to meet
CLS/MC or whatever sched domains needs. Sorry, that is my strong opinion
as the topology is already user-space visible and (tooling) people are
complaining that DT systems are broken and doesn't match ACPI systems.

So unless someone gives me non-scheduler and topology specific reasons
to change that, sorry but my opinion on this matter is not going to change ;).

You will get this view of topology, find a way to manage with all those
*group_mask functions. By the way it is already handled for ACPI systems,
so if you are not happy with that, then that needs fixing as this change
set just aligns the behaviour on similar ACPI system. So the Juno example
is incorrect for the reason that the behaviour of scheduler there is different
with DT and ACPI.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
