Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3835CCDE00B
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 00:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PjKWexyK017kD4t5sgUSwPjLSfPzwIGqtUBocSEiKE=; b=R0usfV2LsVFLp7
	v04390vSp+5z1U4cim8RJ1Oay8biEFL5oUxsy7+dvBPycKE1izpbA6yWCSNLJVXD8EC7Sa5YQus11
	NovTzuJi6RB6G+Rz74jncim2KQTqilu2Ra94X1VEqpbKhg3tzR5W0XXYzXPNd4q1MgW5cJFWc8yix
	7qjYjQw4wxZzFX/UPuzgowbgGgnGMwCRLz1EGEwaP3HQctumi4hmg0+WVdUd8oabS2VSVa988fcu3
	PISpoqbCcZtGIUpZPaybEL5dvs90tP96fumc9+sN0aN/N3olXvciMQo7fa4/1XsM627k0qcFz0eDr
	k8re0pO6+7qljfKUejyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcurW-0000000A3bh-08T3;
	Fri, 26 Jun 2026 00:56:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcurU-0000000A3bS-1Z15
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 00:56:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D548360098;
	Fri, 26 Jun 2026 00:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F9D1F000E9;
	Fri, 26 Jun 2026 00:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782435362;
	bh=ysKKFfnEd9fMd34RVQdBVCJIRaNtCRv3LpzVrhgDaX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mDoepVE53LkKVx3X0Az2q4ZO6fzO0EHxOt2Nsbda81xHb+VAlB8fTyVMuhpvHrca8
	 Ev50sfyZDfpx4SzeIF1E61JprAyY0Kn8ezkSLSUjfwMkOp8eK95+w+sseNyVwoQDj3
	 XbO/+7hWvif7xzMKHOf52aIFHqgHHJ+0xP8QuxubpEVp9dnjEthn8okC2TupivYCZ8
	 yCjgfka+6uDh/2nysqKEfWP2PTpnAEgPYAwcrqTckkTbEIXwhw7kbHxaY/hdGEXc1T
	 l4+izbOCea818ZmAAcRyxLOScFoZE03Bhg8/pOyrwxVQaLX/ISUfIpZaDnP9QpCB/m
	 OHrDomEwSY4xA==
Date: Thu, 25 Jun 2026 17:56:00 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 3/8] riscv: Add support for srmcfg CSR from Ssqosid
 extension
Message-ID: <aj3OIASOuSsvxJ+k@x1>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
 <20260624-dfustini-atl-sc-cbqri-dt-v2-3-2f8049fd902b@kernel.org>
 <20260625015006.DF5041F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260625015006.DF5041F000E9@smtp.kernel.org>
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

On Thu, Jun 25, 2026 at 01:50:06AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] CPU hotplug cache invalidation is registered at the wrong state (CPUHP_AP_ONLINE_DYN), allowing the srmcfg cache sentinel to be overwritten before the CPU goes offline.
> --
> 
> commit d51eb8c4a6c5a57f238cc53688229c08ea6418e1
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv: Add support for srmcfg CSR from Ssqosid extension
> 
> This commit adds support for the srmcfg CSR defined in the Ssqosid ISA
> extension. It introduces a per-cpu cache to avoid redundant CSR writes
> during context switches and uses CPU hotplug and PM notifiers to manage
> cache invalidation.
> 
> Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> 
> > diff --git a/arch/riscv/kernel/qos.c b/arch/riscv/kernel/qos.c
> > new file mode 100644
> > index 0000000000000..ea33201a43f61
> > --- /dev/null
> > +++ b/arch/riscv/kernel/qos.c
> 
> [ ... ]
> 
> > +static int riscv_srmcfg_reset_cache(unsigned int cpu)
> > +{
> > +	per_cpu(cpu_srmcfg, cpu) = U32_MAX;
> > +	return 0;
> > +}
> 
> [ ... ]
> 
> > +static int __init riscv_srmcfg_init(void)
> > +{
> > +	int err;
> > +
> > +	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SSQOSID))
> > +		return 0;
> > +
> > +	/*
> > +	 * cpuhp_setup_state() invokes the startup callback locally on every
> > +	 * already-online CPU, so no separate seed loop is needed here.
> > +	 */
> > +	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/srmcfg:online",
> > +				riscv_srmcfg_reset_cache, riscv_srmcfg_reset_cache);
> 
> [Severity: High]
> Does registering the hotplug callbacks at CPUHP_AP_ONLINE_DYN run too early
> during teardown and too late during startup?
> 
> Since CPUHP_AP_ONLINE_DYN teardown runs while the CPU is still schedulable,
> could the U32_MAX sentinel set by riscv_srmcfg_reset_cache() be overwritten
> by subsequent context switches (such as switching to the idle thread) before
> the CPU actually goes offline?

That is correct that the U32_MAX sentinel can be overwritten by the idle
task or per-cpu kthreads that run while CPU is dying. This is not a
problem in practice as they have thread.srmcfg == 0 which results in
cpu_srmcfg_default.

I will update the riscv_srmcfg_reset_cache() comment to clarify that the
teardown callback is not relied on.

> If a CPU is offlined and then onlined, the stale cache would persist while
> the hardware CSR has been reset. Because the CPU becomes schedulable before
> the CPUHP_AP_ONLINE_DYN startup callback runs, a task matching the stale
> cache might skip the required CSR write and run with incorrect hardware tags.

A normal task cannot run on the CPU before the startup callback re-arms
the sentinel. riscv_srmcfg_reset_cache() writes cpu_srmcfg = U32_MAX
before set_cpu_active(). Only the idle task and per-cpu kthreads run in
the window before, and they carry thread.srmcfg == 0. That means they
take the CPU default rcid and mcid, not stale ones.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
