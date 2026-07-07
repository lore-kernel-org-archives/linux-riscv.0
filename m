Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32131C43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 00:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPioFNRrcKfoJfaYTuX0ZBVgzKBKOX5cGvRzf697Gj8=; b=vns+e1NdH4GxkA
	6NpLTy1Ot7X4J3Are82ZZ1zZ1xxwXT4Y6nou/1BPEXvqQ7InThqhlyTFJZt8E79YCKUZim8uJWejd
	BRxfZ65AGPVgfp33DKt9GSbroTIETSvSygPHp21MIkUs0zVShiJWufiRV7j/gGqGIySQhKXgW9gJb
	Z+tNegRc+j/kvry5IVcfISKBxEvpTAETRLjxifmodhRJRbzhbOYkJGYDUWzCLN8X5QcKFwMd2TFBm
	xpkVeriW44tUBi1MDHod+Zmnfyl/caiNrjnXR3IpHO6KwkgGg7tI8dYjMmC9+XCWzLY6UoUGOAQ/i
	puGYKzl7Qpgi4lAODlfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgtwM-0000000DqQB-1EIJ;
	Tue, 07 Jul 2026 00:45:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgtwK-0000000DqPz-3sXS
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 00:45:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6DD86004E;
	Tue,  7 Jul 2026 00:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9DF1F000E9;
	Tue,  7 Jul 2026 00:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783385131;
	bh=v8+K3znB3MAe4tgPmMUKy+aJKRXY6ZUDTmKIVv/zF2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lPyatc3XbY4QpTKASirQKvVOei2XGodtwEsqv7qNKOJNtVz4LUwphPMGJeGuyE8a9
	 1WMJRRODm0LOePEKcMFQ4TYjCd+b4MBVl4susQP8tyANodhrBYQA68r+PAZAf8uaU7
	 PxuT05LmVE/RdcpkGivLyJAaLKQhE92gJE5FLimVoNUjZ3bP1EmeTc88T9qDR3wm3A
	 Uad3qcdB/Oyds14r/oQJp0pIOp0zjzdrzXGtWbQtHULZe56ugdZslBYXhF3JMQ1bZo
	 yXvaPVlDrvZZrXfnLK9BlNnSYXLAKUPj9TEUZO/9GSg5RbM2IiKYysS+a69dpmsIS6
	 vHjROyR/dxZDQ==
Date: Mon, 6 Jul 2026 17:45:30 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/8] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <akxMKn6HVbCfvAPE@x1>
References: <20260706-dfustini-atl-sc-cbqri-dt-v4-0-e75c20201d64@kernel.org>
 <20260706-dfustini-atl-sc-cbqri-dt-v4-5-e75c20201d64@kernel.org>
 <20260706232031.D95C21F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260706232031.D95C21F000E9@smtp.kernel.org>
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

On Mon, Jul 06, 2026 at 11:20:31PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] CBQRI controllers registered after system boot are not validated for mismatched capabilities when attached to resctrl domains.
> - [Medium] Missing ARCH_HAS_CPU_RESCTRL selection in RISC-V Kconfig prevents RESCTRL_FS from being enabled.
> --
> 
> --- Patch [5]: [PATCH v4 5/8] riscv_cbqri: resctrl: Add cache allocation via capacity block mask ---
> commit bf65a655f2aedc980d538dde50ae87b2b9ea72e4
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv_cbqri: resctrl: Add cache allocation via capacity block mask
> 
> Wire CBQRI capacity controllers into resctrl as RDT_RESOURCE_L2 and
> RDT_RESOURCE_L3 schemata. Domains are created lazily in the cpuhp online
> callback so cpu_mask reflects only currently online CPUs.
> 
> > diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
> > index 92b9c82cf9f39..f8566c003d495 100644
> > --- a/drivers/resctrl/Kconfig
> > +++ b/drivers/resctrl/Kconfig
> > @@ -42,3 +42,7 @@ menuconfig RISCV_CBQRI
> >  if RISCV_CBQRI
> >  
> >  endif
> > +
> > +config RISCV_CBQRI_RESCTRL_FS
> > +	bool
> > +	default y if RISCV_CBQRI && RESCTRL_FS
> 
> [Severity: Medium]
> Will this feature ever be enabled? Since the RISC-V architecture Kconfig does
> not currently select ARCH_HAS_CPU_RESCTRL, it appears RESCTRL_FS can never be
> satisfied, making this newly added support unreachable.

RISCV_CBQRI selects ARCH_HAS_CPU_RESCTRL in drivers/resctrl/Kconfig, so
RESCTRL_FS becomes selectable once CBQRI is enabled. The select is in
the CBQRI menuconfig rather than arch/riscv/Kconfig.

> > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resctrl.c
> > new file mode 100644
> > index 0000000000000..cb12a868561b9
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_resctrl.c
> 
> [ ... ]
> 
> > +static int cbqri_attach_cpu_to_cap_ctrl(struct cbqri_controller *ctrl,
> > +					unsigned int cpu)
> > +{
> > +	struct cbqri_resctrl_res *hw_res;
> > +	struct rdt_ctrl_domain *domain;
> > +	struct rdt_resource *res;
> > +	int dom_id;
> > +	int rid;
> > +
> > +	rid = cbqri_cache_level_to_rid(ctrl->cache.cache_level);
> > +	if (rid < 0)
> > +		return 0;
> > +	hw_res = &cbqri_resctrl_resources[rid];
> > +
> > +	if (!hw_res->ctrl)
> > +		return 0;
> > +
> > +	res = &hw_res->resctrl_res;
> > +	dom_id = ctrl->cache.cache_id;
> > +
> > +	domain = cbqri_find_ctrl_domain(&res->ctrl_domains, dom_id);
> > +	if (domain) {
> > +		cpumask_set_cpu(cpu, &domain->hdr.cpu_mask);
> > +		return 0;
> > +	}
> > +
> > +	domain = cbqri_create_ctrl_domain(ctrl, res, cpu, dom_id);
> 
> [Severity: High]
> Can a mismatched controller be attached here if it is probed after system boot?
> 
> While cbqri_resctrl_pick_caches() verifies that all controllers agree on
> capabilities like rcid_count and ncblks during boot, this function seems to
> unconditionally create a new control domain for late-attached controllers
> without similar validation against the baseline hw_res->ctrl capabilities.
> 
> If a deferred probe or late module load brings up a controller with fewer
> capabilities (such as a smaller capacity block mask or fewer RCIDs), could
> the resctrl core's use of the baseline capabilities lead to out-of-bounds
> hardware writes when programming this new controller?

That is not possible. This driver is always built-in when enabled and
the probe never returns deferred. The resctrl setup that calls
cbqri_resctrl_pick_caches() runs later at late_initcall(), so every
controller is already on cbqri_controllers by the time pick_caches()
validates the set.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
