Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BACC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 16:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5XL2ApzN3FDgdH45IcVV5WcHQikZcOOp+lSctixw7F0=; b=fgOzBMBNeZYH6R
	ac1ptBHLvbtXxZNwFI27rExy/VLz48qrVhijuZeovKeFwM/na7hLYyoOl5ClvehWvyDSD0D7HiV/B
	dQEeLEO55ixp7Mt+KIhr/2M+TI8+oNcTnNuDwINZBPrn6mqp+lAoAdqrKZntKPqQLD172euGfxGwy
	9E2DhLL2R6BCwV/oAD8PCIHv5XBfLQKB6cmyp2bH6jTT9vU7Z6ZfuvFlCpWwRSXkKJaA2tgnnZgsa
	IeoiS3F8AWwKj1Vky+tdKLZDfgSGBsVv/QgnFm1O2nbDQlEsWxGkNged5AjvbaTF16okTIy1TV1bw
	7ErFajw9vuproMbPIs0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1rxS-003Ion-Gv; Thu, 16 Jun 2022 16:02:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1rx7-003Ied-EU; Thu, 16 Jun 2022 16:02:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2816611FB;
	Thu, 16 Jun 2022 09:02:33 -0700 (PDT)
Received: from [10.1.34.12] (e125579.cambridge.arm.com [10.1.34.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D842A3F73B;
	Thu, 16 Jun 2022 09:02:30 -0700 (PDT)
Message-ID: <73574a8f-5c72-8f7e-3dc4-42493131681e@arm.com>
Date: Thu, 16 Jun 2022 17:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 15/16] arch_topology: Set cluster identifier in each
 core/thread from /cpu-map
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
 Atish Patra <atishp@rivosinc.com>,
 Morten Rasmussen <morten.rasmussen@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
References: <20220525081416.3306043-12-sudeep.holla@arm.com>
 <20220525081416.3306043-13-sudeep.holla@arm.com>
 <20220525081416.3306043-14-sudeep.holla@arm.com>
 <20220525081416.3306043-15-sudeep.holla@arm.com>
 <20220525081416.3306043-16-sudeep.holla@arm.com>
 <947470ba-35fc-3c72-d01b-c0a7337216a2@arm.com>
 <20220606102159.dduxmvq4m2fm6gks@bogus>
 <CAKfTPtB8iPzEXipsJqNtd9-aJMKx-FAaiGMzOg58HgRQuo39iA@mail.gmail.com>
 <20220610102753.virkx47uyfsojol6@bogus>
 <af7d6f49-09c5-6e60-988c-51c3c7c04d96@arm.com>
 <20220613111743.3od6a5dyyogad4ay@bogus>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20220613111743.3od6a5dyyogad4ay@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_090237_652830_7BA72187 
X-CRM114-Status: GOOD (  39.52  )
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

On 13/06/2022 12:17, Sudeep Holla wrote:
> On Mon, Jun 13, 2022 at 11:19:36AM +0200, Dietmar Eggemann wrote:
>> On 10/06/2022 12:27, Sudeep Holla wrote:
>>> On Fri, Jun 10, 2022 at 12:08:44PM +0200, Vincent Guittot wrote:
>>>> On Mon, 6 Jun 2022 at 12:22, Sudeep Holla <sudeep.holla@arm.com> wrote:

[...]

>>> Again I completely disagree. Let us look at the problems separately.
>>> The hardware topology that some of the tools like lscpu and lstopo expects
>>> what the hardware looks like and not the scheduler's view of the hardware.
>>> So the topology masks that gets exposed to the user-space needs fixing
>>> even today. I have reports from various tooling people about the same.
>>> E.g. Juno getting exposed as dual socket system is utter non-sense.
>>>
>>> Yes scheduler uses most of the topology masks as is but that is not a must.
>>> There are these *group_mask functions that can implement what scheduler
>>> needs to be fed.
>>>
>>> I am not sure why the 2 issues are getting mixed up and that is the main
>>> reason why I jumped into this to make sure the topology masks are
>>> not tampered based on the way it needs to be used for scheduler.
>>
>> I'm all in favor of not mixing up those 2 issues. But I don't understand
>> why you have to glue them together.
>>
> 
> What are you referring as 'glue them together'. As I said this series just
> address the hardware topology and if there is any impact on sched domains
> then it is do with alignment with ACPI and DT platform behaviour. I am not
> adding anything more to glue topology and info needed for sched domains.

You can fix (1) without (2) parsing 1. level cluster nodes as
cluster_siblings.

>> (1) DT systems broken in userspace (lstopo shows Juno with 2 Packages)
>>
> 
> Correct.
> 
>> (2) Introduce CONFIG_SCHED_CLUSTER for DT systems
>>
> 
> If that is a problem, you need to disable it for DT platforms. Not
> supporting proper hardware topology is not the way to workaround the
> issues enabling CONFIG_SCHED_CLUSTER for DT systems IMO.
> 
>>
>> (1) This can be solved with your patch-set w/o setting `(1. level)
>>     cpu-map cluster nodes`. The `socket nodes` taking over the
>>     functionality of the `cluster nodes` sorts out the `Juno is seen as
>>     having 2 packages`.
>>     This will make core_sibling not suitable for cpu_coregroup_mask()
>>     anymore. But this is OK since llc from cacheinfo (i.e. llc_sibling)
>>     takes over here.
>>     There is no need to involve `cluster nodes` anymore.
>>
> 
> Again you are just deferring introducing CONFIG_SCHED_CLUSTER on DT
> which is fine but I don't agree with your approach.
> 
>> (2) This will only make sense for Armv9 L2 complexes if we connect `2.
>>     level cpu-map cluster nodes` with cluster_id and cluster_sibling.
>>     And only then clusters would mean the same thing in ACPI and DT.
>>     I guess this was mentioned already a couple of times.
>>
> 
> Indeed. But I don't get what you mean by 2 level here. ACPI puts 1st level

cpu_map {
  socket0 {
    cluster0 {    <-- 1. level cluster
      cluster0 {  <-- 2. level cluster (3 -->)
        core0 {

        };
        core1 {

        };
      cluster1 {
  ...

Armv9 L2 complexes: e.g. QC SM8450:

      .---------------.
CPU   |0 1 2 3 4 5 6 7|
      +---------------+
uarch |l l l l m m m b| (so called tri-gear: little, medium, big)
      +---------------+
  L2  |   |   | | | | | <-- 2. level cluster, Armv9 L2 complexes (<-- 3)
      +---------------+
  L3  |<--         -->|
      +---------------+
      |<-- cluster -->|
      +---------------+
      |<--   DSU   -->|
      '---------------'

Only if we map (i) into cluster_sibling, we get the same hardware
representation (for the task scheduler) for ACPI (4) and DT (5) systems.

(4) examples:

Kunpeng920 - 24 CPUs sharing LLC (cpu_coregroup_mask()), 4 CPUs sharing
L3-tag (cpu_clustergroup_mask()).

X86 Jacobsville - 24 CPUs sharing LLC (L3), 4 CPUs sharing L2

Armv9 L2 complexes: e.g. QC SM8450 - 8 CPUs sharing LLC (L3), (for A510
(little CPUs)) 2 CPUs sharing L2

> cpu nodes in cluster mask. So we are just aligning to it on DT platforms
> here. So if you are saying that is an issue, please fix that for ACPI too.
> 

[...]

>>> So unless someone gives me non-scheduler and topology specific reasons
>>> to change that, sorry but my opinion on this matter is not going to change ;).
>>
>> `lstopo` is fine with a now correct /sys/.../topology/package_cpus (or
>> core_siblings (old filename). It's not reading
>> /sys/.../topology/cluster_cpus (yet) so why set it (wrongly) to 0x39 for
>> CPU0 on Juno when it can stay 0x01?
>>
> 
> On ACPI ? If so, it could be the package ID in the ACPI table which can be
> invalid and kernel use the table offset as ID. It is not ideal but doesn't
> affect the masks. The current value 0 or 1 on Juno is cluster ID and they
> contribute to wrong package cpu masks.
> 
> 
> And yes lstopo doesn't read cluster IDs. But we expose them in ACPI system
> and not on DT which was my main point.

Understood. But a Kunpeng920 `cluster_cpus_list` file would contain
logically different information than a Juno `cluster_cpus_list` file.

Kunpeng920 `cluster_cpus_list` contain 4 CPUs sharing L3-tag (less than
LLC) whereas Juno cluster_cpus_list contain 2 or 4 CPUs (which is LLC).

I think key is to agree what a CLUSTER actually represent and especially
in case when `the level of topology above CPUs` is congruent with LLC
boundaries. Because my feeling is that people didn't pay attention to
this detail when they introduced SCHED_CONFIG_CLUSTER. A related issue
is the Ampere Altra hack in cpu_coregroup_mask().

> As pointed out earlier, have you checked ACPI on Juno and with 
> CONFIG_SCHED_CLUSTER ? If the behaviour with my series on DT and ACPI
> differs, then it is an issue. But AFAIU, it doesn't and that is my main
> argument. You are just assuming what we have on Juno with DT is correct
> which may be w.r.t to scheduler but definitely not with respect to the
> hardware topology exposed to the users. So my aim is to get that fixed.

I never run Juno w/ ACPI. Are you saying that
find_acpi_cpu_topology_cluster() returns cpu_topology[cpu].cluster_id's
which match the `1. level cluster nodes`?

The function header of find_acpi_cpu_topology_cluster() says that `...
the cluster, if present is the level of topology above CPUs. ...`.

From this perspective I can see your point. But this is then still
clearly poorly designed. How would we ever support CONFIG_SCHED_CLUSTER
in DT when it really (potentially) would bring a benefit (i.e. in the
Armv9 L2-complex case) and not only create trouble for the task
scheduler to setup its domains correctly? Also in case we stick to
setting CONFIG_SCHED_CLUSTER=1 by default, CLS should be the default LLC
sched domain and MC the exceptional one. Just to respect the way how the
task scheduler removes not useful domains today.

> If you are not happy with that, then how can be be happy with what is the
> current behaviour on ACPI + and - CONFIG_SCHED_CLUSTER. I haven't got
> your opinion yet on that matter.

I guess it's clear now that ACPI + CONFIG_SCHED_CLUSTER with ``the level
of topology above CPUs` is congruent with LLC` creates trouble to the
scheduler. So I don't see why we should replicate this for DT. Let's
discuss further tomorrow in person.

[...]





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
