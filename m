Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A105FC43602
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6prIDb0Bgj6TGGQUY1SYcdqvtg5ICDTPxqB2cuRL5U=; b=VTWTMQuOZHrsaZ
	feNj0sWVbejuAEJOEJw78K3uZ3/QNgiY4NpkqKdEU87gw/VvLcAIkPSVAsVIzwlec+0GQnb2BYp2Y
	qkQIiwSlymeivZ+46y5xzvr1Ys5AwIQI5qiYhDStQciGoApwcYJoi+TEiq1dw3910tAxL4mN8n30a
	EQVI9BSbzJnuD+BsUAj9UCkDM+sXWoKQwXzfVpAyBNOVAA6vWgEA4i96o+Az+d4XA/WZfJv3iBMfV
	PsZ0Br8TP0rZdXAqAfs0CF/77u68Hknez0MrK4dcb8BGOm6IIK21Pw0pB8oFaPeFBcOzZFDwLNU8w
	zkRQCbqD+iruJNqUxUag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmf9-0000000D8eK-09fN;
	Mon, 06 Jul 2026 16:59:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmf8-0000000D8e5-0OHn
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 16:59:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 884804145E;
	Mon,  6 Jul 2026 16:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD971F00A3A;
	Mon,  6 Jul 2026 16:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783357157;
	bh=G/GJvdohdQUVqTFvcavpouSFzIQxz4hc6MWQM/VTqSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZBmje5lFq83fDtpNCF4UKpMyPDr5ILuzk67xjRTwgE8hMK19K1akJ/liihNd1XGSu
	 jeXB9/SxlvRXg0Kh2eUtrHumVvD3sbG3Bdz1ZYa2SgsZWJH1qVWFYQA05lNzft9JGR
	 0aVBwMNsmPAw9f/d+WJRaE8UhV4qgUuu24m3cc/0dW3+pRmK2mDScC/2ZeT9a2Ik+O
	 62MaFXgr6wyL81KMZNqVaqXNOvzgyvuzkAcAO99dmRX7v3djo00Sc5f9kNppG1jWrV
	 5Hugdj/JPAisWESVvf/hCVnDqxdAVBS68ukRuylBe2m9PJt4CWFHtqSiSNPPtegeWQ
	 wqkJjbGcyOR/g==
Date: Mon, 6 Jul 2026 09:59:15 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/8] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <akve44tGHORcofdY@x1>
References: <20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org>
 <20260628-dfustini-atl-sc-cbqri-dt-v3-5-c9c1342fe3cf@kernel.org>
 <20260628213426.EB9C01F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260628213426.EB9C01F000E9@smtp.kernel.org>
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

On Sun, Jun 28, 2026 at 09:34:24PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Dynamically registered capacity controllers bypass capability validation, leading to hardware errors that abort CPU hotplug.
> --
> 
> commit 3d57a44029d899d70e2c81681585f914c01cc700
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv_cbqri: resctrl: Add cache allocation via capacity block mask
> 
> Wire CBQRI capacity controllers into resctrl as RDT_RESOURCE_L2 and
> RDT_RESOURCE_L3 schemata. Mismatched CC caps at the same cache level
> are treated as a fatal configuration error since fs/resctrl exposes a
> single per-rid cap set. Domains are created lazily in the cpuhp online
> callback so cpu_mask reflects only currently online CPUs.
> 
> > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resctrl.c
> > new file mode 100644
> > index 0000000000000..1fb0fbe1b000f
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_resctrl.c
> [ ... ]
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
> Does this regression cause CPU hotplug to abort if a capacity controller is
> dynamically registered (e.g., via a device tree overlay) after boot?
> 
> Late-registered controllers bypass the capability validation in
> cbqri_resctrl_pick_caches(). When a CPU sharing this new controller is
> hotplugged, it reaches this point to create a new domain.
> 
> If the late controller supports fewer RCIDs than the global controller,
> cbqri_init_domain_ctrlval() will issue out-of-bounds commands to the hardware
> because it iterates up to the global hw_res->ctrl->rcid_count:
> 
> drivers/resctrl/cbqri_resctrl.c:cbqri_init_domain_ctrlval() {
> ...
> 	for (i = 0; i < hw_res->ctrl->rcid_count; i++) {
> 		for (t = 0; t < CDP_NUM_TYPES; t++) {
> 			err = resctrl_arch_update_one(r, d, i, t, ...
> ...
> }
> 
> The hardware will reject the out-of-bounds RCID commands, and the resulting
> error will bubble up to cbqri_resctrl_online_cpu(), keeping the CPU
> permanently offline.
> 
> Should the capabilities of dynamically registered controllers be validated
> against hw_res->ctrl before attaching them?

cbqri_resctrl_pick_caches() drops a cache level entirely if its
same-level controllers disagree on rcid_count ), so every exposed level
is backed by controllers with a uniform rcid_count.

However, it doesn't hurt to harden it by iterating to the attached
domain's own hw_dom->hw_ctrl->rcid_count.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
