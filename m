Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5DECD4F3C
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 00:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IrXFzQJ+TGQQT84VwOR8WB3EKFO17fbdH+4vVoxqBjo=; b=Tjdb5milIyJPRa
	/xLkufsBLUqYCKH3GtbvsljXe2uePDCKa2pirF4zD905Xdeh8YRM7wN9Oj0Ik+cR2oyl9qbo8VE62
	u2ImMTd5Rn236g1DGfeAoZSaKFqMbVei+oMK/zZEd+fNnn/GqkUuSlB0n9x78arQqtWbdH8rSAJMh
	wM56A2hh/Xmsf8wpWyUitLOPBmVFlyD0ybDc9nz9nho43V9HtFBCScBSsYkYRYZbpDjP051rBzOi1
	zFDxFDRcpyZwfv9uIW1lbwfh2ek1p1SbjqjELRXEyaTAfIkBkyN4hE/v+9pLcQW1ciqkJUHD7I8aD
	F6dXQQ3oEpMeBgCgKd6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOPRT-0000000Bmqk-3jqO;
	Sun, 17 May 2026 00:33:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOPRR-0000000BmqC-2pFU
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 00:33:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45EC0445C0;
	Sun, 17 May 2026 00:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA160C2BCB7;
	Sun, 17 May 2026 00:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778977992;
	bh=qRIb6ZmSrNofEDsljDIWiiN08PPfTUE7Lq2HqPPzlUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdL7VIT09HhkiQHA7TeU6drm8yVCTUUFlkvZ1U+fzweRpcfgSouxpbl3wgbXJG2UA
	 /ywkE4bO+ZeZNhFUvFGKBljK4s9BiUs3PnbiJA0gANA5PjIU9ByVTY47YoZFzmnty3
	 xgWI5sz1I6tmdgTK+2hpH1snO3/GlgeLAxK81JjvTXzD8XXjeO0879Y3vEKQS9ii4G
	 KwLpaQkwc/2vKpbvEBrjht1B5qs4QT/hL72qgvzC5O0WxvsBwcpcoNQmrnbv1BmFbQ
	 bzasbapRgqsr73XRy4sXW5wlhYbeA7PoowXAmTHud/TtJWH9jCiuVZMSjCocrlHFsX
	 pdMdsSr8VrPgA==
Date: Sat, 16 May 2026 17:33:10 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko@lists.linux.dev
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 13/18] riscv_cbqri: resctrl: Add MB_MIN bandwidth
 allocation via Rbwb
Message-ID: <agkMxmmZOwLdSlWS@thelio>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-13-eb53831ef683@kernel.org>
 <20260512054240.432A6C2BCB0@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260512054240.432A6C2BCB0@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_173313_757107_ABCC48DB 
X-CRM114-Status: GOOD (  30.65  )
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

On Tue, May 12, 2026 at 05:42:39AM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resctrl.c
> > index d8fd9b06703fa..bcd9367e3555c 100644
> > --- a/drivers/resctrl/cbqri_resctrl.c
> > +++ b/drivers/resctrl/cbqri_resctrl.c
> > @@ -415,6 +415,9 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
> >  	case RDT_RESOURCE_L2:
> >  	case RDT_RESOURCE_L3:
> >  		return cbqri_apply_cache_config_dom(dom, r, closid, t, cfg_val);
> > +	case RDT_RESOURCE_MB_MIN:
> > +		/* sum(Rbwb) <= MRBWB validation runs inside cbqri_apply_rbwb(). */
> > +		return cbqri_apply_rbwb(dom->hw_ctrl, closid, cfg_val, true);
> 
> When a resctrl group is removed, does the framework invoke an architecture
> hook to reset the hardware control values to a minimum default?
> 
> If the CLOSID is freed but the previously configured bandwidth value remains
> pinned in the software cache (ctrl->rbwb_cache[closid]), will this abandoned
> value falsely inflate the sum during subsequent cbqri_apply_rbwb() calls?
> 
> Could this cause new allocation attempts to fail with -EINVAL, effectively
> creating a permanent denial of service for bandwidth allocations until the
> leaked CLOSID is coincidentally re-allocated?

resctrl has no arch-side hook, so the cached Rbwb for the freed closid
stays counted in the sum and could prevent new allocations.

The solution is probably a new resctrl_arch_* callback that resctrl
invokes on group destroy with a CBQRI implementation that resets
rbwb_cache[closid] back to the minimum. However, that would touch
fs/resctrl and all arch backends, so I will look at addressing that in a
future series.

> > @@ -491,15 +503,42 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
> >  		return;
> >  
> >  	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
> > -		for (i = 0; i < hw_res->ctrl->rcid_count; i++) {
> > -			for (t = 0; t < CDP_NUM_TYPES; t++) {
> > +		dom = container_of(d, struct cbqri_resctrl_dom,
> > +				   resctrl_ctrl_dom);
> > +
> > +		switch (r->rid) {
> > +		case RDT_RESOURCE_MB_MIN:
> > +			/*
> > +			 * CBQRI section 4.5: Rbwb >= 1, sum(Rbwb) <= MRBWB.
> > +			 * Walk N-1..1 first so the final sum lands at
> > +			 * MRBWB. Use the unchecked helper since the
> > +			 * intermediate sum may exceed MRBWB.
> > +			 */
> 
> This isn't a bug, but is this comment accurate?
> 
> Since the loop strictly reduces the allocations for RCIDs N-1 down to 1
> before finally increasing RCID 0 to the remaining budget, doesn't the
> running hardware sum strictly decrease until the final step? 
> 
> Does the intermediate sum ever actually transiently exceed MRBWB?

I will reword the comment. The hardware sum decreases through the walk
and never exceeds MRBWB. However, the cache-based sum transiently
exceeds MRBWB.

> > +			for (i = 0; i < hw_res->ctrl->rcid_count; i++) {
> > +				u32 rcid = (i + 1) % hw_res->ctrl->rcid_count;
> > +				u64 rbwb = (rcid == 0) ?
> > +					dom->hw_ctrl->bc.mrbwb - (hw_res->ctrl->rcid_count - 1) : 1;
> 
> If the hardware capability reports mrbwb == rcid_count - 1, will this
> calculation evaluate exactly to 0 for RCID 0?
> 
> If so, does cbqri_apply_rbwb() bypass the internal sum validation
> (which checks if rbwb > 0) and blindly write 0 to the hardware, violating
> the CBQRI section 4.5 requirement that Rbwb >= 1?

cbqri_probe_bc() already rejects mrbwb < rcid_count and refuses to
register the controller in that case. So by the time this reset runs,
mrbwb >= rcid_count is guaranteed and the subtraction yields at least 1.

I'll add a WARN_ON(mrbwb < rcid_count) at the top of the reset walk, or
factor the budget calculation into a helper that the probe and reset
paths share.

> > +static int cbqri_attach_cpu_to_one_bw_res(struct cbqri_controller *ctrl,
> > +					  enum resctrl_res_level rid,
> > +					  unsigned int cpu)
> > +{
> > +	struct cbqri_resctrl_res *hw_res = &cbqri_resctrl_resources[rid];
> > +	struct rdt_resource *res = &hw_res->resctrl_res;
> > +	struct rdt_ctrl_domain *domain;
> > +	int dom_id = ctrl->mem.prox_dom;
> > +
> > +	if (!hw_res->ctrl)
> > +		return 0;
> > +
> > +	domain = cbqri_find_ctrl_domain(&res->ctrl_domains, dom_id);
> > +	if (domain) {
> 
> If a system has multiple memory bandwidth controllers within the same NUMA
> node, will the second controller match the existing domain via
> cbqri_find_ctrl_domain() here?
> 
> Since struct cbqri_resctrl_dom only stores a single hw_ctrl pointer,
> does this mean the secondary controller is never tracked by the domain and
> its hardware limits will be silently ignored during subsequent configurations?

Multiple memory bandwidth controllers are not supported. I will update
it to detect the collision and reject the second BC at registration
time. 

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
