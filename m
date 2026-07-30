Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAE2C54FCD
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 02:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pr1/ZCErWBjWLqwO8ExUzA65smnsgG0UOJLbRi6NdBo=; b=hR23yJxo+SDKWq
	mhr16u9OE7KlIEmVMy3o4RFUO4VsiMLzJIiG2RCuuqRKSHeKiEzEKtfoVVhIiYYXHKjwIFf0ntGlv
	4vMUP5F2JAeUvtFblisws5LdE9BuZiCQ/LSgeAJljwEQPn4lTk492+amWvsZH3crk5MdJLEh90T3L
	7VZdS+BIsLaOyS5HnSxsbDqiQ+NLf43+w9/aDUeCZ0dqCaVdF0GLC50oQfSlSyN1vBcLrGrTzuvuC
	tWlERR3Q25Z25hugBFwPqFgnJZ/W1UN3CKn5q/VH/U/dd2/LWHdVwYhbXzd5R3jnsmP7ZktskFCLh
	R/ITW6jRySR7iztToq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpG8t-00000009JaK-0jQB;
	Thu, 30 Jul 2026 02:05:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpG8r-00000009JZw-2EEv
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 02:05:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B044E600AA;
	Thu, 30 Jul 2026 02:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577981F000E9;
	Thu, 30 Jul 2026 02:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785377100;
	bh=2h/UiwhfC8NhEeNz6SwfkBcRk32SdeEgA/eWffwd11U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mVav8ruBQx3ZjBROniP7omxBRdJzUlSfjgjBGwo1Cmw5ROZ/3VTKdyCBqvXNUU0LQ
	 gHa4a1I0vKjtimTUOskSPw+bd4U9IZow86IdwrJdI450pPLUQ3dEVTcLlYCNAKtkTC
	 Pga5RYeiwlz4A7kV4PgEama44e/g37tpGlcPWkerYbZ5P7ZVAfVkMtxErjIXHvymyJ
	 lP6flSNv+6KWqWyL8bVDOgT2ISJFjc1fucHeeB2Gw18bs+CmNWqt5zyLV6hEVEsKyT
	 jF5jFzyK+UPGIeBpYVbrkYot5IccnQo5A3BkdDmptduKaefA21rCaLgsJsMN+sQ/HY
	 l0MYRX6fvkTQQ==
Date: Wed, 29 Jul 2026 19:04:58 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v6 3/8] riscv: Add support for srmcfg CSR from Ssqosid
 extension
Message-ID: <amqxSpkxWw6/zXcq@x1>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org>
 <20260729-dfustini-atl-sc-cbqri-dt-v6-3-7c22b05d461b@kernel.org>
 <20260730012227.58F5C1F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260730012227.58F5C1F000E9@smtp.kernel.org>
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

On Thu, Jul 30, 2026 at 01:22:26AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The `srmcfg` CSR is not initialized during early boot or CPU hotplug bringup, leaving CPUs running with undefined QoS tags.
> - [Medium] The architecture-specific resctrl setters `resctrl_arch_set_closid_rmid()` and `resctrl_arch_set_cpu_default_closid_rmid()` are missing.
> --
> 
> --- Patch [3]: [PATCH v6 3/8] riscv: Add support for srmcfg CSR from Ssqosid extension ---
> commit a02eee11a5e49e74d1e00459d9acc1ec4a1982fa
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
> > The context-switch path writes the field to the CSR, and
> > resctrl_arch_set_closid_rmid() updates it when a task is assigned to a
> > resctrl control or monitoring group.
> > 
> > A per-cpu cpu_srmcfg_default holds the default srmcfg for each CPU, set
> > by resctrl_arch_set_cpu_default_closid_rmid() on CPU group assignment.
> 
> [Severity: Medium]
> Neither resctrl_arch_set_closid_rmid() nor
> resctrl_arch_set_cpu_default_closid_rmid() appear to be implemented in this
> patch. 
> 
> Since they are missing, are thread_struct.srmcfg and cpu_srmcfg_default ever
> actually modified from their initial zero values?

Both are added in patch 5 along with the rest of the resctrl glue. I
already explained that this is not a problem but sashiko doesn't read
replies.

> > diff --git a/arch/riscv/kernel/qos.c b/arch/riscv/kernel/qos.c
> > index 0000000000000..99925c0e93dd8
> > --- /dev/null
> > +++ b/arch/riscv/kernel/qos.c
> > @@ -0,0 +1,101 @@
> 
> [ ... ]
> 
> > +	/*
> > +	 * cpuhp_setup_state() invokes the startup callback locally on every
> > +	 * already-online CPU, so no separate seed loop is needed here.
> > +	 */
> > +	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/srmcfg:online",
> > +				riscv_srmcfg_reset_cache, riscv_srmcfg_reset_cache);
> 
> [Severity: High]
> Does this software cache correctly handle CPU hotplug and early boot?
> 
> When a CPU is offlined, it continues context-switching as it goes down, which
> overwrites the U32_MAX cache sentinel with a valid tag (such as 0 for the idle
> thread).
> 
> When the CPU is brought back online, its hardware srmcfg CSR is reset to an
> implementation-defined value. If the software cache cpu_srmcfg is still 0, the
> first context switch to a task with a 0 tag in __switch_to_srmcfg() will see
> thread_srmcfg == cpu_srmcfg and skip the CSR write:
> 
> arch/riscv/include/asm/qos.h:__switch_to_srmcfg() {
>     ...
>     if (thread_srmcfg != __this_cpu_read(cpu_srmcfg)) {
>         __this_cpu_write(cpu_srmcfg, thread_srmcfg);
>         csr_write(CSR_SRMCFG, thread_srmcfg);
>     }
>     ...
> }
> 
> This leaves the hardware CSR undefined until this CPUHP_AP_ONLINE_DYN startup
> callback runs. Is CPUHP_AP_ONLINE_DYN too late to prevent the CPU from running
> with undefined QoS tags?

This is not a problem. Only the idle task and per-cpu kthreads run in
that window, and they run with the hart's reset srmcfg value.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
