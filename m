Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017D8CD4F25
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 13:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4chSPW9dgrLOgSC4tqpMuavaaBnoylOqq2YB5c+sOo=; b=ypJl02dGzOmRxv
	Hi0iZzpcQPb86bdr9w1XpwLACmAp1baDyCb/S5lcHOBn2YF3phj8QMzOKskZjPTg+OApeOucwdvZ+
	45oYbZjjKbj1lckLurs4bf6vaNKOxFwDdaSvCFZSDRGxqZclEu0B4uxNfOE0DdzipVJWs0ND4Wltf
	YlsgdcQ2euOxMnKEv7OL40EOig762GJ84QoL+clN1hvnUWUnAnqq+FFL5WByfUWXZzbmnCmZDy0nu
	UyE2cI79bH9/vYnPEUJIy2GwImlyJpZd0u1niywbb8Nk60xDEERwnxoKkBJMeAwWMHrAq8ClheRrU
	EcwU/elCGc+0wC6AyHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNssX-00000008Tof-29sy;
	Fri, 15 May 2026 13:47:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNssW-00000008ToR-3zwu
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 13:47:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13B9760138;
	Fri, 15 May 2026 13:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0878C2BCB0;
	Fri, 15 May 2026 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778852819;
	bh=1DnnCkmocMnHe94ZkReRXuscYumyh1GIuX6FKsRW7gU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i9XkkD7PzP8uXBEEeDm7JVQRgf3aXLKbGhB6VQPjUauVsBNxvwtykf+WkzilGX8ts
	 84SQVmaqdX+JHhbm1JRAmvgKyLzDGn3CqeurmAZrGxQAf2V1MHJVZPIS9tP8t5dCqL
	 i4MfOu9SjKwoUD3SphCYbNr19xkwnuGlkhvjuY771bYEKpzm7cjx/Hi+sMNtnRIwku
	 MuzBkNZOgfdh+SNj9O9sPfwgHUILfE2nWcl/PqWmPBJqd7lAIy6ymCuwxbUh+6GmIB
	 45slBgCu9dRiZP0peWw8U8iSkzxUEWR78T3Qaxqd4MlSea2Ol6TKg//YmR0Q09QMuc
	 7XnrCDrVjmuXg==
Date: Fri, 15 May 2026 06:46:58 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC v4 07/18] riscv_cbqri: Add capacity controller probe
 and allocation device ops
Message-ID: <agcj0jBGTAllxjCu@tt-p14-dfustini>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-7-eb53831ef683@kernel.org>
 <20260512012635.84FCCC2BCB0@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260512012635.84FCCC2BCB0@smtp.kernel.org>
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

On Tue, May 12, 2026 at 01:26:34AM +0000, sashiko-bot@kernel.org wrote:
[..] 
> > +int cbqri_apply_cache_config(struct cbqri_controller *ctrl, u32 closid,
> > +			     const struct cbqri_cc_config *cfg)
> > +{
> > +	bool need_at_mirror;
> > +	u64 saved_cbm = 0;
> > +	int err = 0;
> > +	u64 reg;
> > +
> > +	mutex_lock(&ctrl->lock);
> > +
> > +	need_at_mirror = ctrl->cc.supports_alloc_at_code && !cfg->cdp_enabled;
> > +
> > +	/*
> > +	 * Capture the cfg->at half CBM before any write so a partial
> > +	 * AT-mirror failure can revert and keep the two halves consistent.
> > +	 */
> > +	if (need_at_mirror) {
> > +		err = cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT,
> > +					closid, cfg->at);
> > +		if (err < 0)
> > +			goto out;
> > +		saved_cbm = ioread64(ctrl->base + CBQRI_CC_BLOCK_MASK_OFF);
> > +	}
> 
> To mitigate silent firmware no-ops where the hardware returns success without
> updating the staging register, cbqri_read_cache_config() pre-clears
> the register.
> 
> If a silent no-op occurs here during the READ_LIMIT operation, could
> saved_cbm capture stale MMIO data? If a revert is later triggered, does
> this risk writing garbage data back and corrupting the controller's capacity
> allocation state?

I will change it to pre-clear cc_block_mask before the READ_LIMIT so a
silent firmware no-op surfaces as zero rather than stale data.

> > +	/* Get the operation status */
> > +	*status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
> > +
> > +	/*
> > +	 * Check for the AT support if the register is implemented
> > +	 * (if not, the status value will remain 0)
> > +	 */
> > +	if (*status != 0) {
> > +		/*
> > +		 * Re-issue operation with AT=CODE so the controller
> > +		 * latches AT=CODE on supported hardware (or resets it to 0
> > +		 * on hardware that doesn't). OP must be a defined CBQRI op
> > +		 * here. OP=0 is a no-op and would silently disable CDP.
> > +		 */
> > +		reg = saved_reg;
> > +		FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_OP_MASK, &reg, operation);
> > +		FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_AT_MASK, &reg,
> > +			     CBQRI_CONTROL_REGISTERS_AT_CODE);
> > +		iowrite64(reg, ctrl->base + reg_offset);
> 
> When issuing the second probe to verify AT support, the code restores the raw
> boot-time register state via reg = saved_reg.
> 
> Does this execute the command against whatever uninitialized RCID value the
> firmware originally left in the register, since the RCID mask is not cleared
> again? If the RCID is out of bounds, could the hardware reject the operation,
> causing the driver to falsely report that supports_alloc_at_code is false?
> 

I will change cbqri_probe_feature() to build each write from saved_reg
masked clean of OP, AT, RCID, and EVT_ID before ORing in the intended
fields.

> > +static int cbqri_probe_cc(struct cbqri_controller *ctrl)
> > +{
> 
> [ ... ]
> 
> > +	/*
> > +	 * Resolve cache_size via cacheinfo. cpus_read_lock satisfies
> > +	 * lockdep_assert_cpus_held() inside get_cpu_cacheinfo_level(). If
> > +	 * every cpu_mask member is offline, cache_size stays 0 and the
> > +	 * controller cannot back occupancy monitoring.
> > +	 */
> > +	cpus_read_lock();
> > +	if (!ctrl->cache.cache_size) {
> > +		int cpu = cpumask_first_and(&ctrl->cache.cpu_mask, cpu_online_mask);
> > +
> > +		if (cpu < nr_cpu_ids) {
> > +			struct cacheinfo *ci;
> > +
> > +			ci = get_cpu_cacheinfo_level(cpu, ctrl->cache.cache_level);
> > +			if (ci)
> > +				ctrl->cache.cache_size = ci->size;
> > +		}
> > +	}
> > +	cpus_read_unlock();
> 
> A comment in riscv_cbqri_register_controller() states that cache_size is
> filled lazily during probe.
> 
> Since cbqri_probe_cc() is invoked synchronously during early boot
> registration, wouldn't CPUs in other clusters still be offline? Because there
> is no lazy re-evaluation mechanism or CPU hotplug hook later on, does this
> permanently leave ctrl->cache.cache_size at 0 and break occupancy monitoring
> calculations for those controllers?

ACPI parsing runs at subsys_initcall which is after smp_init() brings up
the secondary CPUs, so every cpu in cpu_mask is online by the time
cbqri_probe_cc() runs.
> 
> > +void cbqri_controller_destroy(struct cbqri_controller *ctrl)
> > +{
> > +	kfree(ctrl);
> > +}
> 
> When riscv_cbqri_unregister_last() is used to roll back a successful
> registration, it calls this function to free the controller.
> 
> Does this leak the I/O mappings and memory regions, since it fails to call
> iounmap(ctrl->base) and release_mem_region() for the resources successfully
> allocated during cbqri_probe_controller()?

I will fix this to mirror the probe error paths. They already clean up
and clear ctrl->base before returning, so destroying a probe-failed
controller does not double free or unmap an already-released region.

> > +int riscv_cbqri_register_controller(const struct cbqri_controller_info *info)
> > +{
> > +	struct cbqri_controller *ctrl;
> > +	int err;
> > +
> > +	if (!info->addr) {
> > +		pr_warn("skipping controller with invalid addr=0x0\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ctrl = kzalloc(sizeof(*ctrl), GFP_KERNEL);
> > +	if (!ctrl)
> > +		return -ENOMEM;
> > +
> > +	mutex_init(&ctrl->lock);
> > +
> > +	ctrl->addr = info->addr;
> > +	ctrl->size = info->size;
> > +	ctrl->type = info->type;
> > +	ctrl->rcid_count = info->rcid_count;
> > +	ctrl->mcid_count = info->mcid_count;
> 
> The cbqri header explicitly defines CBQRI_MAX_RCID and CBQRI_MAX_MCID as 1024,
> alongside documentation warning that a malformed firmware table claiming a
> large number of IDs could trip the soft-lockup watchdog during per-id MMIO
> init loops.
> 
> Is it safe to blindly assign these counts without validating them against the
> safety caps? Could a malformed ACPI or DT table bypass this protection and
> trigger a soft lockup during boot?

CBQRI_MAX_RCID and CBQRI_MAX_MCID are enforced in acpi_parse_rqsc()
which is the only firmware discovery path that exists today. Any value
that reaches riscv_cbqri_register_controller() has already passed that.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
