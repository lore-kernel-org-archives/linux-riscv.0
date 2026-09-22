Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E4FC982FA
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 06:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vw7rmukb7s48V/rifu0os1bT69luZin+Rgi7JGxZmCo=; b=akdmyIQEm1gzKB
	0FbyiIq1k9RIzwJpPAymKD4zBXECZKPaFNdHTvCzD3ElFLsxG71YY9JQhXRSYCrJ3ym/rzMuEEDYe
	ftnc+wTwbmEag3TE4HEghWtPbGHe1iThj9HxGaBM7Wcqwu40n2JvvlLGLxPlv7Jok3EIq8OsBZ+fy
	zDHyUXuEi2CftooQBhUV20F8ZocxI2+0GYJ+CfghZHh0GJfCXfhXqs0BcUUDlF6jjmBXkkVZHClvW
	oh0QLx6lsNDssxDYBwNMcLmqigNtXIHXvLQ8aFyGgeKpYb2P9whEVUUDDbQ8UEE1LfO4oTAc8etH+
	7BpZlkv9DPrjDgh+mLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uRm-00000004Q2t-44cv;
	Tue, 22 Sep 2026 06:57:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uRm-00000004Q1u-08ZT
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 06:57:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FB7B6020F;
	Tue, 22 Sep 2026 06:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2131F00893;
	Tue, 22 Sep 2026 06:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060264;
	bh=wW8a8o616DUzdAjD6CwK+b+Uo/lFg+x8oHawcTMiox4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UCA4Oi5AFR7OJmvro2G98gGLyf8qPVDjxfeVmBNMcAMRmKg5m7v/siJ4t+CPd3X+h
	 gmbm9Y4BRNB/NlOLuJr7tfegfl3ctu+20ZKZIHUQ+9MlkIumLY95XOVhAR7A1+m1Hn
	 AycUibTclkfbc/E+l2fYhWorgnUfZgtlXewhDVLZp/+UNY1Bjl7U5Wan9R+7nHKWt0
	 Osri/YtqQESko3Zcfce15xpYkFfEnI/XA+5G5TGqLSEqGIfhQtNxH1ZZIY44Rpedbm
	 R/8sfQWhXn0kI0o/43CVdRUe2sI4xNZVVVTRkkiQLsWhd8GTVGJkH7Gd3/sEQxTaqV
	 N9k7MvL17takQ==
Date: Mon, 21 Sep 2026 23:57:43 -0700
From: Drew Fustini <fustini@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <arIm5yXDZhkH3KLm@thelio>
References: <20260917-dfustini-atl-sc-cbqri-dt-v8-0-7964e8d73fe8@kernel.org>
 <20260917-dfustini-atl-sc-cbqri-dt-v8-2-7964e8d73fe8@kernel.org>
 <fb4813cf-b21e-43ca-9bd4-4b42d2214aa6@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb4813cf-b21e-43ca-9bd4-4b42d2214aa6@intel.com>
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

On Thu, Sep 17, 2026 at 05:54:35PM -0700, Reinette Chatre wrote:
> Hi Drew,

Hi, thanks for the review.

> On 9/17/26 9:39 AM, Drew Fustini wrote:
> > diff --git a/arch/riscv/include/asm/resctrl.h b/arch/riscv/include/asm/resctrl.h
> > new file mode 100644
> > index 000000000000..b08f4e12f7aa
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/resctrl.h
> 
> ...
> 
> > +/**
> > + * resctrl_arch_alloc_capable() - any CBQRI controller exposes resctrl alloc
> > + *
> > + * Returns true once at least one CBQRI controller has successfully probed for
> > + * a resctrl-exposed cache capacity allocation feature. Only meaningful after
> > + * cbqri_resctrl_setup() runs at late_initcall.
> > + */
> > +bool resctrl_arch_alloc_capable(void);
> > +
> > +/**
> > + * resctrl_arch_mon_capable() - any CBQRI controller exposes resctrl monitoring
> > + *
> > + * The CBQRI driver implements capacity allocation only and wires up no
> > + * monitoring events, so this always returns false. fs/resctrl references it
> > + * unconditionally, hence the stub.
> > + */
> > +bool resctrl_arch_mon_capable(void);
> > +
> 
> fyi ... I aim to comment more details later in this patch but for now please note that
> there are plans to remove the above two hooks since resctrl self has needed
> information via the rdt_resource::alloc_capable and rdt_resource::mon_capable flags.
> 
> For reference:
> 	https://lore.kernel.org/lkml/20260916231320.14502-7-tony.luck@intel.com/
> 
> I see this has impact on this driver that I comment more below.

Thanks for letting me know. cbqri_resctrl_control_init() already sets
rdt_resource::alloc_capable, so I will drop exposed_alloc_capable. I
will have cbqri_resctrl_teardown() clear rdt_resource::alloc_capable.

Should I wait to drop the hook until Tony's series is applied?

> > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resctrl.c
> > new file mode 100644
> > index 000000000000..0c4bfa2a7f43
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_resctrl.c
> > @@ -0,0 +1,785 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cacheinfo.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/riscv_cbqri.h>
> 
> Just an observation (I have no intention to comment on the style):
> The new c files in this series seem to make an effort to have the #include
> files organized alphabetically, except when if comes to the file above?

Good catch, I'll fix that.

> > +struct cbqri_resctrl_res {
> > +	struct cbqri_controller *ctrl;
> > +	struct rdt_resource     resctrl_res;
> > +	bool                    cdp_enabled;
> > +};
> > +
> > +struct cbqri_resctrl_dom {
> > +	struct rdt_ctrl_domain  resctrl_ctrl_dom;
> > +	struct cbqri_controller *hw_ctrl;
> > +};
> 
> Is cbqri_resctrl_dom::hw_ctrl necessary? From what I can tell it is
> initialized from cbqri_resctrl_res::ctrl when a new domain is created
> and thus identical in all domains that belong to a resource. 
> 
> It looks to me as though the resource is always available when the associated
> controller information is needed so it looks like just cbqri_resctrl_res::ctrl
> could do?

cbqri_resctrl_dom::hw_ctrl is needed when a cache level has more than
one controller. Each cache instance has its own register block, so a
domain has to reach its own controller.

> The way the data is organized results in potentially confusing code since, for
> example, when initializing the control values of a single domain
> (cbqri_init_domain_ctrlval()) the RCID count is obtained from the domain's
> cbqri_resctrl_dom::hw_ctrl::rcid_count but when initializing the control values of
> all domains (resctrl_arch_reset_all_ctrls()) the RCID count is obtained from the
> resource's cbqri_resctrl_res::ctrl::rcid_count instead of each domain's domain
> cbqri_resctrl_dom::hw_ctrl::rcid_count.

Good point, I will read the rcid_count from the resource.

> > +static void cbqri_resctrl_accumulate_caps(void)
> > +{
> > +	int rid;
> > +
> > +	for (rid = 0; rid < RDT_NUM_RESOURCES; rid++) {
> > +		struct cbqri_resctrl_res *hw_res = &cbqri_resctrl_resources[rid];
> > +
> > +		if (!hw_res->ctrl)
> > +			continue;
> > +		if (hw_res->ctrl->alloc_capable)
> > +			exposed_alloc_capable = true;
> > +	}
> > +}
> 
> Since it captures whether any of the resources are alloc_capable it looks like
> exposed_alloc_capable indeed reflects the same information as what resctrl will
> use after resctrl_arch_alloc_capable() is dropped (see patch linked earlier).
> Except that cbqri_resctrl_teardown() only resets exposed_alloc_capable but not
> the rdt_resource::mon_capable and rdt_resource::alloc_capable flags that the new
> helper will use to determine if a resource is capable of allocation or monitoring.
> 
> The new helper will thus change behavior. It looks like resctrl_exit() is only
> called on error path during initialization so it seems unlikely that those flags
> will be referenced by this driver.
> 
> If there are plans to call resctrl_exit() in other paths like MPAM driver does there
> may be issues since the resctrl filesystem may still be mounted and when user space
> unmounts it the rdt_resource::mon_capable and rdt_resource::alloc_capable will be
> used and result in some arch callbacks called.
> 
> I wonder if it may simplify driver initialization to call resctrl_init() _after_
> setting up the CPU online/offline handlers (this is how the x86 driver does it).

I don't think there will be a need to call resctrl_exit() in other
paths. I will move resctrl_init() after cpuhp_setup_state().

> > +static struct rdt_ctrl_domain *cbqri_create_ctrl_domain(struct cbqri_controller *ctrl,
> > +							struct rdt_resource *res,
> > +							unsigned int cpu, int dom_id)
> > +{
> > +	struct rdt_ctrl_domain *domain;
> > +	struct list_head *pos = NULL;
> > +	int err;
> > +
> > +	domain = cbqri_new_domain(ctrl);
> > +	if (!domain)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	cpumask_set_cpu(cpu, &domain->hdr.cpu_mask);
> > +	domain->hdr.id = dom_id;
> > +	domain->hdr.type = RESCTRL_CTRL_DOMAIN;
> > +	domain->hdr.rid = res->rid;
> > +
> > +	err = cbqri_init_domain_ctrlval(res, domain);
> > +	if (err)
> > +		goto free;
> > +
> > +	err = resctrl_online_ctrl_domain(res, domain);
> > +	if (err)
> > +		goto free;
> > +
> > +	/*
> > +	 * Publish only after the domain is fully initialized and online, so a
> > +	 * reader walking the RCU list never sees a half-built domain.
> > +	 */
> > +	resctrl_find_domain(&res->ctrl_domains, dom_id, &pos);
> 
> The caller loops over the domain list to determine whether it needs to create
> a new domain or not and then this domain create code loops over the list again
> to determine where to insert the new domain. Could this perhaps be simplified if
> the first loop  cbqri_attach_cpu_to_all_ctrls()->cbqri_find_ctrl_domain() determines
> the position at the same time as determining the presence and pass that to
> this function to just do the insert without searching the list again?

Yes, that is a good idea. I will change this.

> > +/*
> > + * Attach a CPU to the capacity controller at each cache level whose cache
> > + * the CPU shares. On failure, detach the CPU from everything attached so
> > + * far: the cpuhp core does not run this state's offline teardown when its
> > + * startup fails, so a partial attach would otherwise leak into the domain
> > + * cpu_masks. Caller holds cbqri_domain_list_lock.
> > + */
> > +static int cbqri_attach_cpu_to_all_ctrls(unsigned int cpu)
> > +{
> > +	static const u32 levels[] = { 2, 3 };
> > +	struct cbqri_controller *ctrl, *c;
> > +	struct cbqri_resctrl_res *hw_res;
> > +	struct rdt_ctrl_domain *d;
> > +	struct cacheinfo *ci;
> > +	int i, rid;
> > +
> > +	lockdep_assert_held(&cbqri_domain_list_lock);
> > +
> > +	/*
> > +	 * Hold cbqri_controllers_lock across the walk so a controller
> > +	 * registered after boot cannot corrupt it. The register path takes
> > +	 * it as a leaf and never cbqri_domain_list_lock, so this nesting
> > +	 * cannot invert.
> > +	 */
> > +	guard(mutex)(&cbqri_controllers_lock);
> > +
> > +	for (i = 0; i < ARRAY_SIZE(levels); i++) {
> > +		ci = get_cpu_cacheinfo_level(cpu, levels[i]);
> > +		if (!ci)
> > +			continue;
> > +
> > +		rid = cbqri_cache_level_to_rid(levels[i]);
> > +		hw_res = &cbqri_resctrl_resources[rid];
> > +		if (!hw_res->ctrl)
> > +			continue;
> > +
> > +		/* The controller backing this CPU's cache at this level. */
> > +		ctrl = NULL;
> > +		list_for_each_entry(c, &cbqri_controllers, list) {
> > +			if (c->type == CBQRI_CONTROLLER_TYPE_CAPACITY &&> +			    c->alloc_capable &&
> > +			    c->cache.cache_level == levels[i] &&
> > +			    c->cache.cache_id == ci->id) {
> > +				ctrl = c;
> > +				break;
> 
> Is it necessary to loop over cbqri_controllers and repeat these tests? Above seems to
> duplicate the work done during initialization (cbqri_resctrl_pick_caches()) that resulted
> in initialization of cbqri_resctrl_res::ctrl so it seems that after testing for existence
> this function could just use cbqri_resctrl_res::ctrl without again referencing cbqri_controllers?
> 
> If I understand correctly it may be that new controllers appear in cbqri_controllers 
> after this driver is initialized and the resources are initialized so the CPU online/offline
> helpers may need to take care how any controllers in cbqri_controllers not seen by
> cbqri_resctrl_setup() are handled.

The problem is that every controller that passed cbqri_cc_caps_agree()
is forgotten except the first. I will change cbqri_resctrl_pick_caches()
to keep every controller accepted for a level and have the online path
look up the cpu's cache id in that set.

> > +static int __init cbqri_arch_late_init(void)
> > +{
> > +	int err;
> > +
> > +	if (!riscv_isa_extension_available(NULL, SSQOSID))
> > +		return -ENODEV;
> > +
> > +	err = cbqri_resctrl_setup();
> > +	if (err)
> > +		return err;
> > +
> > +	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "cbqri:online",
> > +				cbqri_resctrl_online_cpu,
> > +				cbqri_resctrl_offline_cpu);
> > +	if (err < 0) {
> > +		cbqri_resctrl_teardown();
> 
> cbqri_resctrl_teardown() calls resctrl_exit() that will complain
> via WARN_ON_ONCE() if any domains exist at that time. It is not clear
> to me if this can be guaranteed here.

I think moving resctrl_init() after cpuhp_setup_state() should eliminate
the possibility since a cpuhp failure then has nothing to tear down.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
