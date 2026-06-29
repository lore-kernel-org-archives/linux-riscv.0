Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88FCC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 22:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpTP+1WzNc6gTxrjtEw+NxBqLoiNXYQyCVz6e4NXPyc=; b=vKjcEJeONLVHE4
	YmHxXrhNVbgwzOF09kfMhJ8G+RZTSH/UVnJMhi2CHPQWc82JnwAD5JzvkWtdEkVgtPIrl2aR5HKbk
	QKDc8O+i2yqcK4V78JsbWB0k0GdguUN0vZ8LFeTqJdHQ6JHCXcOjE3nQwMG05olz0Eaa4oDhSBGw0
	7q1iUvjS8TbCUKaSsuz52Yb7ei65GmJlRmJ0sVwchq5vliSn1umEFm5OT3ViNMa9HVDFpYpFdWlVj
	UkCjiPk1BsAUVBkKfV0allRGTY/gpD24OLnUWg6PrESfPaWaOgCGSI9Xz+7oGr08BnvbkWhPpoL8A
	SrFOIKwNGeYmkg5dmjYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weKkO-0000000FYlq-3Cru;
	Mon, 29 Jun 2026 22:46:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weKkN-0000000FYlk-1FnO
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 22:46:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 10C5D600C3;
	Mon, 29 Jun 2026 22:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B335A1F000E9;
	Mon, 29 Jun 2026 22:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782773193;
	bh=LvtQOT1w607AXJpvAZlCEHoTQld1qa57ANws1Ah1o4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FBqEbyp1/Tnko9boOmLGRtzfous7Vq7W+sng5mOBVtL9TaWeZlznguqKG83b6e3yE
	 bmW1Hwp78yaArZlt5Y2wn+iKt6HZJYKNWxv9QA0kicCqbHPjscQUrGBgOOgTj4JfFP
	 vNVu4Ar1LG8D/Nv3szsMQt2IBUsmxPPdIylukXs6bcNh5WxwfU6FUK8fNBlZn8NHHi
	 Bc0TDzbzXMtaq+WUWSF8LkE3TGeCeekAV0q8xA8RopbafHSMZAJzRcnQDHrro3M16B
	 OVNEMuUL/eGdI4ph607NXIIL2FztQZvQwjAUfcPItMXgoz+aJjKFclrgZe6ixpNutR
	 BH0c4uAo0uNlQ==
Date: Mon, 29 Jun 2026 15:46:32 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/8] riscv: Add support for srmcfg CSR from Ssqosid
 extension
Message-ID: <akL1yNTmMvfB3uzy@x1>
References: <20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org>
 <20260628-dfustini-atl-sc-cbqri-dt-v3-3-c9c1342fe3cf@kernel.org>
 <20260628212820.D0DD51F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260628212820.D0DD51F000E9@smtp.kernel.org>
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

On Sun, Jun 28, 2026 at 09:28:20PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Failing cpuhp_setup_state skips PM notifier registration, silently breaking QoS IDs across system suspend/resume.
> --
> 
> commit e3ff463a672a85eb328bf3048323a464af88e408
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv: Add support for srmcfg CSR from Ssqosid extension
> 
> This commit adds support for the srmcfg CSR defined in the Ssqosid ISA
> extension. It introduces a per-task thread field and a per-CPU cache to track
> Resource Control ID (RCID) and Monitoring Counter ID (MCID) fields, updating
> the CSR during context switches.
> 
> Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> 
> [ ... ]
> 
> > diff --git a/arch/riscv/kernel/qos.c b/arch/riscv/kernel/qos.c
> > new file mode 100644
> > index 0000000000000..c8900d91996f2
> > --- /dev/null
> > +++ b/arch/riscv/kernel/qos.c
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
> > +	if (err < 0) {
> > +		pr_warn("srmcfg cpuhp registration failed (%d), cpus brought online after boot will not invalidate the CSR_SRMCFG cache\n",
> > +			err);
> > +		return err;
> 
> [Severity: Medium]
> If cpuhp_setup_state() fails and returns early here, the
> cpu_pm_register_notifier() registration is skipped, but the hardware
> capability RISCV_ISA_EXT_SSQOSID remains active.
> 
> Because returning an error from an arch_initcall does not halt the boot
> process, the QoS feature will remain active in the kernel.
> 
> If the PM notifier is not registered to invalidate the software cache upon
> exit from low-power states, will subsequent context switches find a cache
> match, mistakenly bypass the csr_write(), and execute tasks with the wrong
> hardware QoS ID?

Yes, it is possible. The early return in riscv_srmcfg_init() does skip
cpu_pm_register_notifier(), and that notifier is what invalidates the
per-cpu srmcfg cache across suspend/resume, so __switch_to_srmcfg()
could find a stale match and skip the csr write.

The risk is low, though. CPUHP_AP_ONLINE_DYN is a valid state, the
registration name is not null, and riscv_srmcfg_reset_cache() cannot
fail, so the only way cpuhp_setup_state() can fail is when no dynamic
hotplug states remain.

However, the fix is simple. The PM notifier is independent of the cpuhp
state, so I'll change riscv_srmcfg_init() to register it even if the
cpuhp setup failed.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
