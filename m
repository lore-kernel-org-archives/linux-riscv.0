Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3D7C55160
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 02:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/qEdA5A8jjJZVpLtY6EjTuTBgzs1GIIepAn4HL2M9s=; b=0B78WcY3L13vMC
	KTwmKTnxHgVwCzffQfX45c6xJOJla4mWVcsQl0mIV7Gwyws6wMexs4j2+14rAbWQvbpJuHHOe3rUQ
	9JOo4/ZQjUM7LlKjGKy368PW2Gxe0oloF3+2xCo58mIkrpG6DuK3YUHPJA0AZJN82P091yjN5RZH7
	sd7ICBbwW9fiwamyFfpehA4uF5zbV52I0LfGOtfPF7i5hkL/ewA1iJkVwdfyj1F07w9HHqiVAHRhQ
	2OOqnGDEiv2SExYjdcIedYkvLdOH+ZpKnWPR5XMFRNWkj2Qt0UK6r4jL6Q2IhwOckedA7RTcQh8mh
	c0v7PC71v5GvWBcq5tJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGD8-00000009Jxs-2cl8;
	Thu, 30 Jul 2026 02:09:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGD7-00000009Jxk-35u7
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 02:09:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3227E600AA;
	Thu, 30 Jul 2026 02:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C9C1F000E9;
	Thu, 30 Jul 2026 02:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785377364;
	bh=rC7XJL1MEmVzJmoF0ZyVUyVyMkq3ME78sp4/7MgIVyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D477bWzRDA4+HkK5wu0NO4fz1pwMbc7oirxhk+GVTNm37ZRPFU28XYT3XoLqrqETq
	 kUtdDc/Wg5tKmoOdXCEANRbWGXudFhXFC/BpPHISvWQZlnhPVUAgXvMymxj4rh4Yv1
	 f01rTeJRoxGkHWRRWIF056XiJpRVnq1SS+c9oAJIYSuVCufXptYM1buqk2w7R7clsl
	 3dGOtCDpBUiZ0bqpK4SKHrLU8vwD0g/XhBG7tqdZo8XmpNYX0JzYzXj3uEZLb63cEK
	 Hj0kcglDHPO3g9ewf4nfsoLacriMwccx3mtHNdD4418kHW+V50SySDa7YHfkcM3AGu
	 V/RqpMcMbzKiQ==
Date: Wed, 29 Jul 2026 19:09:23 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v6 5/8] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <amqyUyUaUVRtH4Og@x1>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org>
 <20260729-dfustini-atl-sc-cbqri-dt-v6-5-7c22b05d461b@kernel.org>
 <20260730012722.A77E71F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260730012722.A77E71F000E9@smtp.kernel.org>
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

On Thu, Jul 30, 2026 at 01:27:22AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Capacity controllers registered after boot bypass capability validation, which can cause resctrl failures and hardware writes with out-of-bounds parameters.
> --
> 
> --- Patch [5]: [PATCH v6 5/8] riscv_cbqri: resctrl: Add cache allocation via capacity block mask ---
> commit b95a917a4c4e682ec805c748e42c4a7bedae47b2
> Author: Drew Fustini <fustini@kernel.org>
> 
>     riscv_cbqri: resctrl: Add cache allocation via capacity block mask
> 
> This commit wires CBQRI capacity controllers into resctrl as RDT_RESOURCE_L2
> and RDT_RESOURCE_L3 schemata. It handles domain creation during the cpuhp
> online callback for offline CPUs, and defines context-switch and capability
> checks for RISC-V.
> 
> > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resctrl.c
> > index 0000000000000..0c4bfa2a7f433
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_resctrl.c
> [ ... ]
> > +static int cbqri_attach_cpu_to_all_ctrls(unsigned int cpu)
> > +{
> > +	static const u32 levels[] = { 2, 3 };
> > +	struct cbqri_controller *ctrl, *c;
> > +	struct cbqri_resctrl_res *hw_res;
> > +	struct rdt_ctrl_domain *d;
> > +	struct cacheinfo *ci;
> > +	int i, rid;
> [ ... ]
> > +		/* The controller backing this CPU's cache at this level. */
> > +		ctrl = NULL;
> > +		list_for_each_entry(c, &cbqri_controllers, list) {
> > +			if (c->type == CBQRI_CONTROLLER_TYPE_CAPACITY &&
> > +			    c->alloc_capable &&
> > +			    c->cache.cache_level == levels[i] &&
> > +			    c->cache.cache_id == ci->id) {
> > +				ctrl = c;
> > +				break;
> > +			}
> > +		}
> > +		if (!ctrl)
> > +			continue;
> > +
> > +		d = cbqri_find_ctrl_domain(&hw_res->resctrl_res.ctrl_domains,
> > +					   ci->id);
> > +		if (d) {
> > +			cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
> > +			continue;
> > +		}
> > +
> > +		d = cbqri_create_ctrl_domain(ctrl, &hw_res->resctrl_res, cpu,
> > +					     ci->id);
> 
> [Severity: High]
> Does this code allow a late-registered controller to bypass the capability
> validation?
> 
> During boot, cbqri_resctrl_pick_caches() validates that all controllers at a
> given cache level have identical capabilities (like ncblks and rcid_count)
> using cbqri_cc_caps_agree().
> 
> However, in the CPU hotplug path, if a new cache controller is probed
> after boot, cbqri_attach_cpu_to_all_ctrls() finds it and creates a
> domain without verifying it matches the baseline hw_res->ctrl.

This is not a problem as there is no path that registers a controller
after boot.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
