Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0CAC43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 00:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKJ0hlhuWk5xtqIM1Zh5JsitkhtjNg2zXqPe9crXyng=; b=nybF5r2all8f60
	TxSsTjxuITazq/XVg/sSxBIRPwIFvj4CWrtfvJMM/f0Qmr9VZ9pY89ojUKcIViWPdLLwzHWI+jRh2
	sIOSh4RupTGvJS3FoVw0q5ctkrw/YtBUsQRuBicIngYJaaO1MQc1Iso0WeghUifNRpFdSK3tBb8Bz
	SnxLbC2mGFUM7XvF5ND2MTFxrKmsTLW0VqIN6/LIsJRDUAoLJh8AaD6bNl36EOq7wPP4P9/f/Me5a
	kFOYNkbFnF2oIfYKHxwUG5nItlO+JJ7N+5NiBPLWRVUjP5Nmz1OlACDo00EcER4Qj9wo7Yl8TFQE5
	EWdVZ/tIpA14KUbu05nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgtcz-0000000Dpd8-29BR;
	Tue, 07 Jul 2026 00:25:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgtcx-0000000Dpcq-3ptw
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 00:25:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B5BE9600AA;
	Tue,  7 Jul 2026 00:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5EC1F000E9;
	Tue,  7 Jul 2026 00:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783383929;
	bh=EX5bDRcbg6XLyzbbFsSspBE0R+ovIvkBly+FTEt8N+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dAYIfgr1MViVwVg/Yqkt+wcVz2lRJcY0KvgY2dq01taupm/EqWjSaSH4rCaFU8Jsz
	 G4WnwXIAgI/POODehFp0KUxnfSs5owh+p1PBlOhHOflltQrzgdnZGgb99DC/0vK79n
	 W50yJMIHr4WDC0O0iQzrUriej/gfxGEtyu9NXDrS51Wyty1fITNMX71sFAmx4nc9Bw
	 nxE62D2bHzbU+nMZF68PNdheBGPs5qNFszED6ZcJinP1MO959JT18IpVJRgXci/drF
	 Y7MjjAJ5xXmb4j8PWkHCxNYaVz9H7Y2X3smMVWZJNb+un5waCJCaUPXFu8/s2ZlMIz
	 J3Y4I0CYb8WDg==
Date: Mon, 6 Jul 2026 17:25:28 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/8] riscv: Add support for srmcfg CSR from Ssqosid
 extension
Message-ID: <akxHeAstGx+DWxPz@x1>
References: <20260706-dfustini-atl-sc-cbqri-dt-v4-0-e75c20201d64@kernel.org>
 <20260706-dfustini-atl-sc-cbqri-dt-v4-3-e75c20201d64@kernel.org>
 <20260706231704.C4A741F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260706231704.C4A741F000E9@smtp.kernel.org>
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

On Mon, Jul 06, 2026 at 11:17:04PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Late CPU hotplug cache invalidation allows newly onlined CPUs to execute with implementation-defined CSR values and potentially bypass the CSR update.
> - [Medium] Missing resctrl architecture callbacks and generic subsystem integration, rendering the srmcfg context-switch logic functionally dead code.
> --
> 
> --- Patch [3]: [PATCH v4 3/8] riscv: Add support for srmcfg CSR from Ssqosid extension ---
> commit 5baf8388a55d26b8cdc1b9f1025583f7b6a3e4f3
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv: Add support for srmcfg CSR from Ssqosid extension
> 
> Add support for the srmcfg CSR defined in the Ssqosid ISA extension.
> The CSR contains two fields: Resource Control ID (RCID) and Monitoring
> Counter ID (MCID) for tracking resource usage.
> 
> Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> 
> >     resctrl_arch_set_closid_rmid() updates it when a task is assigned to a
> >     resctrl control or monitoring group.
> >     
> >     A per-cpu cpu_srmcfg_default holds the default srmcfg for each CPU, set
> >     by resctrl_arch_set_cpu_default_closid_rmid() on CPU group assignment.
> 
> [Severity: Medium]
> Are these resctrl architecture callbacks missing from this patch series?
> 
> The commit message mentions resctrl_arch_set_closid_rmid() and
> resctrl_arch_set_cpu_default_closid_rmid(), but they do not appear to be
> implemented.
> 
> Without these integration functions, the new srmcfg field in thread_struct
> and the cpu_srmcfg_default per-CPU variable are never updated.
> 
> Does this leave the context-switch tracking as functionally dead code that
> only ever zeroes the CSR?

They are added later in the series. This patch adds only the srmcfg CSR
plumbing that those callbacks drive.

> > +	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/srmcfg:online",
> > +				riscv_srmcfg_reset_cache, riscv_srmcfg_reset_cache);
> 
> [Severity: High]
> Does this late CPU hotplug cache invalidation allow newly onlined CPUs to
> execute with implementation-defined CSR values?
> 
> The CPU cache invalidation happens at CPUHP_AP_ONLINE_DYN, which runs on the
> target CPU itself. This means the CPU has already booted and context-switched
> into the hotplug thread before riscv_srmcfg_reset_cache() is called.
> 
> If a CPU is offlined while its software cpu_srmcfg cache happens to be 0, and
> then powered back on, its hardware SRMCFG register initializes to an
> implementation-defined value.
> 
> When the CPU context-switches to the cpuhp thread (which has a default
> srmcfg of 0), __switch_to_srmcfg() might see that the incoming thread's 0
> matches the stale software cache's 0.
> 
> Could this bypass the necessary CSR write, leaving the CPU to run with
> garbage values in the SRMCFG hardware CSR until the next context switch?

No, this won't happen. riscv_srmcfg_reset_cache() is the startup
callback of a CPUHP_AP_ONLINE_DYN state, which is ordered before
CPUHP_AP_ACTIVE. Only the idle task and per-cpu kthreads can run before
it, and their QoS tag does not matter.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
