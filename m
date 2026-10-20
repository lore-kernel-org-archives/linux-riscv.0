Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD34606A319
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 20:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Ty3kdFV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H9uaiLSu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/5RP38EMStjs1IdYptGSYE5iiSE3upHJA8fIvecZMM=; b=2Ty3kdFV14nQzx
	wVcVZw4mJTRYwM8iY12F8QZMc3gB4n08jGuVn2+E58e6QLbOocAy2FFJiXIyPaEDqJyE0Ux0jeLXB
	+Hoj3w6RJr+XKsE6cwt66DNGPGkx7TpvP3tgIAAobGjDLN4S67Dn28SEHTTDwAIYe6BgPoPY3JgjU
	D19PglgSFQeJaVLSSQkzgF00ZGL7nObpVa2E7v+LdwJOHRhQayYYeM9JgXGBK3EDBcDb0Hhv2m0Za
	Qwl3HvJxM5Pwq6ThESBUjGGOPbFioTgfOn7cN9GHWoHMsIy0sKPzOUXi9Tnc8RevIepnFi/caaMZU
	memMnd8besxE28KLj2Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJG7Y-0000000AaJo-3PuB;
	Tue, 20 Oct 2026 20:07:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJG7X-0000000AaJE-1vcS
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 20:07:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A4AB60136;
	Tue, 20 Oct 2026 20:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427201F000C9;
	Tue, 20 Oct 2026 20:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792526856;
	bh=E2BGEbDmLFbyDFnjpJoQXmoXVufyoU6uu+OtS+on9zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H9uaiLSu6EN8ZMZq3/0JMSJPE29d2PjlBFMnCo4seWtCTz0f2ARFbSmnvnjmrbNbr
	 r22afbzsogdoWoQFtLND62nuBZ5boJ5Kq94KNgfb63qfNSi3Un1J8MO2aChHSJsMjZ
	 LyhNJL0TYaW/zhN/AcrBvXO/ahu6lOZpiOr3fAdXUD4sY2K4cYc/KAU8XklZJMtzu5
	 3tL7eaI8RBuZ8pUC/Pvf2+LSADAZDP8oJNwyWTdoqk1Zww7hynaKaD1pvJOQ5utyzL
	 2bP6TvWec1JC0u3mPd9wwV3QP3f3qqPGw5KGhj2x5vE5aPdAlN7qXa5mJQ/aAi5DNL
	 QBbisxdPEIJ9w==
Date: Tue, 20 Oct 2026 13:07:35 -0700
From: Drew Fustini <fustini@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
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
Subject: Re: [PATCH v9 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <atfKB-aHUdQAlmho@thelio>
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org>
 <20261003-dfustini-atl-sc-cbqri-dt-v9-2-52fd8be98dcf@kernel.org>
 <49444078-0777-4318-9f8b-0d582d8a29ad@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49444078-0777-4318-9f8b-0d582d8a29ad@intel.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 11:37:52AM -0700, Reinette Chatre wrote:
> Hi Drew,

Hi, thanks for your comments and Ack.

> On 10/3/26 12:12 AM, Drew Fustini wrote:
> 
> ...
> 
> > diff --git a/arch/riscv/include/asm/resctrl.h b/arch/riscv/include/asm/resctrl.h
> > new file mode 100644
> > index 000000000000..867db663d958
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/resctrl.h
> 
> ...
> 
> > +/**
> > + * resctrl_arch_mon_ctx_alloc() - allocate per-monitor-event arch context
> > + * @r:     resctrl resource being monitored
> > + * @evtid: which monitor event needs context
> > + *
> > + * The CBQRI driver implements no monitoring events, so there is no per-event
> > + * context to allocate and the stub returns NULL. fs/resctrl references it
> > + * unconditionally before checking resctrl_arch_mon_capable().
> 
> The last sentence is unexpected. fs/resctrl only calls resctrl_arch_mon_ctx_alloc()
> from mon_event_read(), __check_limbo() and mbm_update_one_event(), and none of these
> can run on a system that does not support monitoring.

Good point, I will remove that final sentence.

> > + */
> > +void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
> > +
> > +/**
> 
> ...
> 
> > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resctrl.c
> > new file mode 100644
> > index 000000000000..f10a24761b25
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_resctrl.c
> 
> ...
> 
> > +void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
> > +{
> > +	u32 num_closid = resctrl_arch_get_num_closid(r);
> > +	struct rdt_ctrl_domain *d;
> > +	enum resctrl_conf_type t;
> > +	u32 default_ctrl;
> > +	u32 i;
> > +
> > +	lockdep_assert_cpus_held();
> > +
> > +	if (!num_closid)
> > +		return;
> > +
> > +	default_ctrl = resctrl_get_default_ctrl(r);
> > +
> > +	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
> > +		for (i = 0; i < num_closid; i++) {
> > +			for (t = 0; t < CDP_NUM_TYPES; t++) {
> > +				int rerr;
> > +
> > +				rerr = resctrl_arch_update_one(r, d, i, t, default_ctrl);
> > +				if (rerr)
> > +					pr_err_ratelimited("rid=%d reset RCID %u type %u failed (%d)\n",
> > +							   r->rid, i, t, rerr);
> > +			}
> > +		}
> 
> 
> Above looks to be an open-code of cbqri_init_domain_ctrlval(). The loop
> is unexpected here due to the duplicate writes impacting types not used by current
> CDP mode that the comment within cbqri_init_domain_ctrlval() justifies.

Thanks for pointing this out. I'll simplify it by calling
cbqri_init_domain_ctrlval() for each domain.

> 
> > +	}
> > +}
> > +
> 
> ...
> 
> > +
> > +static int cbqri_init_domain_ctrlval(struct rdt_resource *r, struct rdt_ctrl_domain *d)
> > +{
> > +	u32 num_closid = resctrl_arch_get_num_closid(r);
> > +	enum resctrl_conf_type t;
> > +	int err = 0;
> > +	u32 i;
> > +
> > +	for (i = 0; i < num_closid; i++) {
> > +		/*
> > +		 * Seed both DATA and CODE staged slots so a later mount
> 
> nit: This seems to refer to d->staged_config[] that is only populated by resctrl fs.

I'll change the wording to refer to the hardware configuration for each
type and not the staged config.

> 
> > +		 * with -o cdp does not see stale CODE values.
> > +		 * On non-AT controllers cbqri_cc_alloc_op() masks AT to 0
> > +		 * so all three iterations land on the same hardware state.
> > +		 * The redundant writes are harmless.
> > +		 */
> > +		for (t = 0; t < CDP_NUM_TYPES; t++) {
> > +			err = resctrl_arch_update_one(r, d, i, t,
> > +						      resctrl_get_default_ctrl(r));
> > +			if (err)
> > +				return err;
> > +		}
> > +	}
> > +	return 0;
> > +}
> > +
> 
> ...
> 
> > +/*
> > + * Attach a CPU to the picked capacity controller at each cache level whose
> > + * cache the CPU shares. On failure, detach the CPU from everything attached
> > + * so far: the cpuhp core does not run this state's offline teardown when
> > + * its startup fails, so a partial attach would otherwise leak into the
> > + * domain cpu_masks. Caller holds cbqri_domain_list_lock.
> > + */
> > +static int cbqri_attach_cpu_to_all_ctrls(unsigned int cpu)
> > +{
> > +	static const u32 levels[] = { 2, 3 };
> > +	struct cbqri_resctrl_res *hw_res;
> > +	struct cbqri_controller *ctrl;
> > +	struct rdt_ctrl_domain *d;
> > +	struct list_head *pos;
> > +	struct cacheinfo *ci;
> > +	int i, rid;
> > +
> > +	lockdep_assert_held(&cbqri_domain_list_lock);
> > +
> > +	for (i = 0; i < ARRAY_SIZE(levels); i++) {
> > +		ci = get_cpu_cacheinfo_level(cpu, levels[i]);
> > +		if (!ci)
> > +			continue;
> > +
> > +		rid = cbqri_cache_level_to_rid(levels[i]);
> > +		hw_res = &cbqri_resctrl_resources[rid];
> > +		if (!hw_res->nr_ctrls)
> > +			continue;
> > +
> > +		ctrl = cbqri_resctrl_find_ctrl(hw_res, ci->id);
> > +		if (!ctrl) {
> > +			pr_warn_once("no L%u controller for cache id %u, CPU %u is not controlled at this level\n",
> > +				     levels[i], ci->id, cpu);
> > +			continue;
> > +		}
> > +
> > +		d = cbqri_find_ctrl_domain(&hw_res->resctrl_res.ctrl_domains,
> > +					   ci->id, &pos);
> > +		if (d) {
> > +			cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
> > +			continue;
> > +		}
> > +
> > +		d = cbqri_create_ctrl_domain(ctrl, &hw_res->resctrl_res, cpu,
> > +					     ci->id, pos);
> > +		if (IS_ERR(d)) {
> > +			cbqri_detach_cpu_from_all_ctrls(cpu);
> > +			return PTR_ERR(d);
> > +		}
> 
> Should a failure to set up one domain prevent the CPU from coming online?
> 
> As I understand the driver already brings a CPU online without a domain (albeit
> with a pr_warn_once()) at a level when its cache has no controller (the earlier
> cbqri_resctrl_find_ctrl()), so I wonder if here (on domain creation failure) the
> CPU could just be left without a domain at this level without failing the CPU
> online entirely? It looks like cbqri_detach_cpu_from_all_ctrls() keeps the domains
> consistent.

Good question. It does seem like an additional cpu would be beneficial
to a system, even if the qos functionality is not working as expected.
I will change the driver to warn but not fail the cpu online.

> 
> In the end this is a driver design question, so up to you.
> 
> I just have a few nits and a check-in on the design but all the resctrl filesystem 
> interactions look good to me.
> 
> The one open is the coordination with Tony's series that moves the
> resctrl_arch_alloc_capable() and resctrl_arch_mon_capable() work into
> resctrl filesystem. Thanks for making the switch to use alloc_capable, that will
> simplify the accompanying RISC-V changes.

I'll remove the hooks if Tony's series lands first.

> Acked-by: Reinette Chatre <reinette.chatre@intel.com>

Thanks for your attention on this series!

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
