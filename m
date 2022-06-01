Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41339C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 12:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PG5OMzvAiZo94dqGupMqgVFzoJH3WdwKyrwdiDxAuV0=; b=JoZ3jz1/IEiFNh
	1WEcCv3deTuAbHY4Rxr+4ZEAMaolc9IeSaBf0B8dbC478ktXPJFWDtLhLX1aJKbyFagH/rF93bfof
	M8flc7s7j4EOXs+FiCHczyD0KV2Kxvfoou6rMlr2LqsweQAo07JBxzNmNrBtRJPyI1C+Ut83jqSVh
	xnkDYnSrR98VuvNuiDSUgcymeaVmEjKYxlLz6a1GD4i3G6nszSXdrgBCfzrnJbIpksah4MIAuZJzk
	9s/z73rkeerXzc4CDCVOCQloqq7KUQ6yXcgS08ef0nchDS7mlL2KapToUk1dvrPZAYV/L2VaYGC83
	Aaq7Ul5RbJuG7jx0gOhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwNjf-00G5Q9-5K; Wed, 01 Jun 2022 12:46:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwNjU-00G5Me-CB; Wed, 01 Jun 2022 12:45:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B3F9ED1;
	Wed,  1 Jun 2022 05:45:51 -0700 (PDT)
Received: from bogus (unknown [10.57.9.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D5863F73D;
	Wed,  1 Jun 2022 05:45:48 -0700 (PDT)
Date: Wed, 1 Jun 2022 13:45:01 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Gavin Shan <gshan@redhat.com>
Cc: linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Morten Rasmussen <morten.rasmussen@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 02/16] cacheinfo: Add helper to access any cache index
 for a given CPU
Message-ID: <20220601124501.v4ylb4oqs4uq2oxj@bogus>
References: <20220525081416.3306043-1-sudeep.holla@arm.com>
 <20220525081416.3306043-2-sudeep.holla@arm.com>
 <20220525081416.3306043-3-sudeep.holla@arm.com>
 <9a70f2b2-e45c-b125-1c14-d5a06097be58@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a70f2b2-e45c-b125-1c14-d5a06097be58@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_054552_546784_176E0332 
X-CRM114-Status: GOOD (  26.03  )
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

On Wed, Jun 01, 2022 at 10:44:20AM +0800, Gavin Shan wrote:
> Hi Sudeep,
> 
> On 5/25/22 4:14 PM, Sudeep Holla wrote:
> > The cacheinfo for a given CPU at a given index is used at quite a few
> > places by fetching the base point for index 0 using the helper
> > per_cpu_cacheinfo(cpu) and offseting it by the required index.
> > 
> > Instead, add another helper to fetch the required pointer directly and
> > use it to simplify and improve readability.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >   drivers/base/cacheinfo.c | 14 +++++++-------
> >   1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> 
> s/offseting/offsetting
> 
> It looks good to me with below nits fixed:
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
> 
> > diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> > index b0bde272e2ae..c4547d8ac6f3 100644
> > --- a/drivers/base/cacheinfo.c
> > +++ b/drivers/base/cacheinfo.c
> > @@ -25,6 +25,8 @@ static DEFINE_PER_CPU(struct cpu_cacheinfo, ci_cpu_cacheinfo);
> >   #define ci_cacheinfo(cpu)	(&per_cpu(ci_cpu_cacheinfo, cpu))
> >   #define cache_leaves(cpu)	(ci_cacheinfo(cpu)->num_leaves)
> >   #define per_cpu_cacheinfo(cpu)	(ci_cacheinfo(cpu)->info_list)
> > +#define per_cpu_cacheinfo_idx(cpu, idx)		\
> > +				(per_cpu_cacheinfo(cpu) + (idx))
> >   struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu)
> >   {
> > @@ -172,7 +174,7 @@ static int cache_setup_of_node(unsigned int cpu)
> >   	}
> >   	while (index < cache_leaves(cpu)) {
> > -		this_leaf = this_cpu_ci->info_list + index;
> > +		this_leaf = per_cpu_cacheinfo_idx(cpu, index);
> >   		if (this_leaf->level != 1)
> >   			np = of_find_next_cache_node(np);
> >   		else
> > @@ -231,7 +233,7 @@ static int cache_shared_cpu_map_setup(unsigned int cpu)
> >   	for (index = 0; index < cache_leaves(cpu); index++) {
> >   		unsigned int i;
> > -		this_leaf = this_cpu_ci->info_list + index;
> > +		this_leaf = per_cpu_cacheinfo_idx(cpu, index);
> >   		/* skip if shared_cpu_map is already populated */
> >   		if (!cpumask_empty(&this_leaf->shared_cpu_map))
> >   			continue;
> > @@ -242,7 +244,7 @@ static int cache_shared_cpu_map_setup(unsigned int cpu)
> >   			if (i == cpu || !sib_cpu_ci->info_list)
> >   				continue;/* skip if itself or no cacheinfo */
> > -			sib_leaf = sib_cpu_ci->info_list + index;
> > +			sib_leaf = per_cpu_cacheinfo_idx(i, index);
> >   			if (cache_leaves_are_shared(this_leaf, sib_leaf)) {
> >   				cpumask_set_cpu(cpu, &sib_leaf->shared_cpu_map);
> >   				cpumask_set_cpu(i, &this_leaf->shared_cpu_map);
> > @@ -258,12 +260,11 @@ static int cache_shared_cpu_map_setup(unsigned int cpu)
> >   static void cache_shared_cpu_map_remove(unsigned int cpu)
> >   {
> > -	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
> >   	struct cacheinfo *this_leaf, *sib_leaf;
> >   	unsigned int sibling, index;
> >   	for (index = 0; index < cache_leaves(cpu); index++) {
> > -		this_leaf = this_cpu_ci->info_list + index;
> > +		this_leaf = per_cpu_cacheinfo_idx(cpu, index);
> >   		for_each_cpu(sibling, &this_leaf->shared_cpu_map) {
> >   			struct cpu_cacheinfo *sib_cpu_ci;
> > 
> 
> In cache_shared_cpu_map_remove(), the newly introduced macro
> can be applied when the sibling CPU's cache info is fetched.
> 
>     sib_leaf = sib_cpu_ci->info_list + index;
> 
>     to
> 
>     sib_leaf = per_cpu_cacheinfo_idx(sibling, index);
> 

Right, I clearly missed to identify this. Thanks again for the review, all
other comments are now fixed locally and pushed @[1], will post them as part
of next version.

--
Regards,
Sudeep

[1] https://git.kernel.org/sudeep.holla/h/arch_topology

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
