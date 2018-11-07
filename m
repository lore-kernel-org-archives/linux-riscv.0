Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BA6C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 12:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED90C2081D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 12:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ph1074W9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IGx7rear"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED90C2081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CgQH9fUfxhQJzIFw8szScpzwZDZnQ2tAdDyWYqOuqmo=; b=ph1074W9XtiZFI
	E7thcFSJQzZm2dsEPTZJvyIoIi1uTfVzuHRNAqaAHit0HvOseBg7uWZqZu0eioL1r4mTaVAyGWK8N
	FDbNicMPz+QUilxhXnfjoY7XSyQwWGJuEOfFsVHq0xxByTXzeYxZ4bvhrHpc41FkEnwOdy3y4anco
	K8QF5hqAj9aSiR9tEKT6xaDCIVA4B/GY+9pjlosJn0xn4OpkEXSPUzry4aYddKsjU2sXuVH5ktnHX
	jpshdBdL5Xx1NkUCya4GQHBoAGYYSFPjfPo4KebnCvXLoEbBiX0a2xBdsjpVDBM1qhgCi4T7wA/8p
	UkDNnjthm0gE1ntUrPbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKMwd-000803-7u; Wed, 07 Nov 2018 12:28:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKMwc-0007zm-8T
 for linux-riscv@bombadil.infradead.org; Wed, 07 Nov 2018 12:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6PSv/00Yi0e5x3l22ZQP6wGDEVVDGXgstkJnF3d+z1M=; b=IGx7rearEj9o6TE7EdAoouS93
 CKzMfgalG/pX56LsmmfjGPPrGxHGd9C8b+KQcna+86Ivx45Ltfzknbyk9nW4M53lveEw89Qxf979a
 xJ+H7Dq+QE/LCGya1SBXDCWht0KJwsl0PmKK1Cs0InnS8WD/h+dViwEu2Epqu6mSST6rRVSJriJ9F
 GPrN5+qPQF6i86pk0BE3sP2WPc9CQmv3lzRk+uOLoPKxu/hVrayvXQiWXhTo2GY2Nvy8TGP/clkIF
 x8BgxMMJRsr2+LX5AK+lR8nbDxPP45ZK9cv57WrOXrt1erVIOCEyGyUydqfc7+thqwtV9IJhTb/Si
 +GAhKljaQ==;
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKMwY-0007iq-PK
 for linux-riscv@lists.infradead.org; Wed, 07 Nov 2018 12:28:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF95580D;
 Wed,  7 Nov 2018 04:28:11 -0800 (PST)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6434E3F5CF;
 Wed,  7 Nov 2018 04:28:09 -0800 (PST)
Date: Wed, 7 Nov 2018 12:28:03 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [RFC 0/2] Add RISC-V cpu topology
Message-ID: <20181107122803.GA8433@e107155-lin>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
 <20181106141331.GA28458@e107155-lin>
 <969fc2a5198984e0dfe8c3f585dc65f9@mailhost.ics.forth.gr>
 <20181106162051.w7fyweuxrl7ujzuz@lakrids.cambridge.arm.com>
 <abcae019e6ae749b17ecb0c721fd3177@mailhost.ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abcae019e6ae749b17ecb0c721fd3177@mailhost.ics.forth.gr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_122823_162643_0BB7A3E0 
X-CRM114-Status: GOOD (  49.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Damien.LeMoal@wdc.com, alankao@andestech.com, hch@infradead.org,
 anup@brainfault.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 zong@andestech.com, Atish Patra <atish.patra@wdc.com>, robh+dt@kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>, linux-riscv@lists.infradead.org,
 tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107122803.Qr37jBbrmj4jnKP8Z1IRoDhBKzq8kPJs-JS491Qjc4I@z>

On Wed, Nov 07, 2018 at 04:31:34AM +0200, Nick Kossifidis wrote:
[...]

>
> Mark and Sudeep thanks a lot for your feedback, I guess you convinced me
> that having a device tree binding for the scheduler is not a correct
> approach.
>

Thanks :)

> It's not a device after all and I agree that the device tree shouldn't
> become an OS configuration file. Regarding multiple levels of shared
> resources my point is that since cpu-map doesn't contain any information of
> what is shared among the cluster/core members it's not easy to do any
> further translation. Last time I checked the arm code that uses cpu-map, it
> only defines one domain for SMT, one for MC and then everything else is
> ignored. No matter how many clusters have been defined, anything above the
> core level is the same (and then I guess you started talking about adding
> "packages" on the representation side).
>

Correct.

> The reason I proposed to have a binding for the scheduler directly is not
> only because it's simpler and closer to what really happens in the code, it
> also makes more sense to me than the combination of cpu-map with all the
> related mappings e.g. for numa or caches or power domains etc.
>

Again you are just looking at it with Linux kernel perspective.

> However you are right we could definitely augment cpu-map to include support
> for what I'm saying and clean things up, and since you are open about
> improving it here is a proposal that I hope you find interesting: At first
> let's get rid of the <thread> nodes, they don't make sense:
>
> thread0 {
>  cpu = <&CPU0>;
> };
>

Do you have any strong reasons to do so ?
Since it's already there for some time, I believe we can't remove it for
backward compatibility reasons.

> A thread node can't have more than one cpu entry and any properties
> should be on the cpu node itself, so it doesn't / can't add any
> more information. We could just have an array of cpu nodes on the
> <core> node, it's much cleaner this way.
>
> core0 {
>  members = <&CPU0>, <&CPU1>;
> };
>

I agree, but we have kernel code using it(arm64/kernel/topology.c). It's
too late to remove it. But we can always keep to optional if we move the
ARM64 binding as generic to start with and mandate it for only ARM64.

> Then let's allow the cluster and core nodes to accept attributes that are
> common for the cpus they contain. Right now this is considered invalid.
>

Yes, we have discussed in the past and decided not to. I am fine if we
need to change it, but assuming the topology implies other information
could be wrong. On ARM platforms we have learnt it, so we kept any
information away from topology. I assume same with RISC-V, different
vendors implement in different ways, so it's better to consider those
factors.

> For power domains we have a generic binding described on
> Documentation/devicetree/bindings/power/power_domain.txt
> which basically says that we need to put power-domains = <power domain
> specifiers> attribute on each of the cpu nodes.
>

OK, but what's wrong with that. I gives full flexibility.

> The same happens with the capacity binding specified for arm on
> Documentation/devicetree/bindings/arm/cpu-capacity.txt
> which says we should add the capacity-dmips-mhz on each of the cpu nodes.
>

Ditto, we may need this for our single cluster DSU systems.

> The same also happens with the generic numa binding on
> Documentation/devicetree/bindings/numa.txt
> which says we should add the nuna-node-id on each of the cpu nodes.
>

Yes, but again what's the problem ?

> We could allow for these attributes to exist on cluster and core nodes
> as well so that we can represent their properties better. It shouldn't
> be a big deal and it can be done in a backwards-compatible way (if we
> don't find them on the cpu node, climb up the topology hierarchy until
> we find them / not find them at all). All I'm saying is that I prefer this:
>

[...]

>
> cluster0 {
>  cluster0 {
>   core0 {
>    power-domains = <&pdc 0>;
>    numa-node-id = <0>;
>    capacity-dmips-mhz = <578>;
>    members = <&cpu0>, <&cpu1>;
>   }
>  };
>  cluster1 {
>   capacity-dmips-mhz = <1024>;
>   core0 {
>    power-domains = <&pdc 1>;
>    numa-node-id = <1>;
>    members = <&cpu2>;
>   };
>   core1 {
>    power-domains = <&pdc 2>;
>    numa-node-id = <2>;
>    members = <&cpu3>;
>   };
>  };
> }
>

Why are you so keen on optimising the representation ?
If you are worried about large systems, generate one instead of
handcrafted.

> When it comes to shared resources, the standard dt mappings we have are for
> caches and are on the device spec standard (coming from power pc's ePAPR
> standard I think). The below comes from HiFive unleashed's device tree
> (U540Config.dts) that follows the spec:
>

I don't understand what you are trying to explain, ePAPR does specify
per CPU entries.

[...]

> Note that the cache-controller node that's common between the 4 cores can
> exist anywhere BUT the cluster node ! However it's a property of the
> cluster.
> A quick search through the tree got me r8a77980.dtsi that defines the cache
> on the cpus node and I'm sure there are other similar cases. Wouldn't this
> be better ?
>
> cluster0 {
>  core0 {
>   cache-controller@2010000 {
>    cache-block-size = <64>;
>    cache-level = <2>;
>    cache-sets = <2048>;
>    cache-size = <2097152>;
>    cache-unified;
>    compatible = "sifive,ccache0", "cache";
>    ...
>   };
>   members = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;

Not a good idea IMO.

> We could even remove next-level-cache from the cpu nodes and infer it from
> the  topology (search the topology upwards until we get a node that's
> "cache"-compatible), we can again make this backwards-compatible.
>

Why are you assuming that they *have* to be so aligned with topology ?
How do you deal with different kind of systems ?

>
> Finally from the examples above I'd like to stress out that the distinction
> between a cluster and a core doesn't make much sense and it also makes the
> representation more complicated. To begin with, how would you call the setup
> on HiFive Unleashed ? A cluster of 4 cores that share the same L3 cache ?
> One core with 4 harts that share the same L3 cache ? We could represent it
> like this instead:
>

Just represent each physical cache and get the list of CPUs sharing it.
Doesn't matter what it is: cluster or cluster of clusters or cluster of
harts, blah, blah. It really doesn't matter.

>
> We could e.g. keep only cluster nodes and allow them to contain either an
> array of harts or other cluster sub-nodes + optionally a set of attributes,
> common to the members/sub-nodes of the cluster. This way we'll get in the
> first example:
>

All these fancy new ideas you are proposing are good if vendors follow
some things religiously, but I really doubt if that's true. So just
have maximum flexibility so that we can represent maximum number of
systems without having to redefine the bindings again and again for the
same thing.

So instead of finding ways to optimise, you should really come up with
list of shortcomings in the existing bindings so that we cover more
platforms with generic bindings. IMO you are too concerned on optimisation
of DT representation which may defeat the purpose of generic bindings.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
