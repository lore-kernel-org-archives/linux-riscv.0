Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E260CA6015
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 00:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YdGAYvY4QsNSQLqWXAW+Fb4eIM7GHWCLizQ6Xu+uOvY=; b=hL9RxpASuS65sl
	skl2IMi3WWSwcfgU0M+JU8bJB9eVpAXl+FwY6D9O2AWfZt7lUUiEGzHUd7+2fy7g7vf0gLxrLFd8n
	MVGTpaqgNfV1sg/4B+JCF1RUqt+fSDnnsAMCLBZOF+tBTSUsCtlUQ99l+wNfzwY12hQotm2NLKqqr
	BqnkBy/aJf8e/tMACoUcMuTvlNG1GVFFaN6J7gu5PZbD38pUGObi6y1ZTWUeNEZO1xSYSogVsmQz+
	rIT26K2qlD/z2z1oeLZ6ZLeV2PPMGqujqMjhjQ6Inv+CYCWIHvJjApsBF8tfJoBJ2xQmtSVim/gFd
	0cG3SNyuB5qxstJprRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyIi-00000005BUW-2ZlO;
	Fri, 09 Oct 2026 00:17:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyIh-00000005BUQ-0z43
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 00:17:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A3EE7409B0;
	Fri,  9 Oct 2026 00:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB06C1F000FF;
	Fri,  9 Oct 2026 00:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791505046;
	bh=PsEz5Ly+9fZPdh+QsIdIvKEuqDf6IQ3nEj1oB5NL9kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ebTesmEFj7mS7V8iHqLshsLvOwrqfef//eKNGp4vBfFK6nWmZfIEJC0j5seAa/nk6
	 q5H0pbcag9+t7U8RDRX+GxwV2HSOi+4CKZhSwJMoE0yPvQ5SBUX13o9udbeN3Aa65L
	 KUKBP52TAsHVVQgiSsVn1AENH5wY6BAaLt6+noYBGtBV4ZWFiSAoLBK2Xw+XqdfYhV
	 KcQyHK6OLRt1aJQUjumUP8Q52A5M6pk5SHRdf3dCnswbD5M9hMH3V95nIZQ1pA5veF
	 nB2vekAGFHfQAfv2LSwtdcnch5oXXjZwb3chvdwZ16zPY73BkIbuARH+aZ+hLC3juX
	 8TMTYJxQblyng==
Date: Fri, 9 Oct 2026 07:57:26 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] clocksource/timer-riscv: use riscv_has_extension_likely
Message-ID: <asgt5ngVC6x-L0VO@xhacker>
References: <20260902040453.6258-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260902040453.6258-1-jszhang@kernel.org>
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

On Wed, Sep 02, 2026 at 12:04:53PM +0800, Jisheng Zhang wrote:
> Instead of static branch, use riscv_has_extension_likely() to check
> whether SSTC is supported or not. For one thing, this is straight
> forward, no need to add and enable/disable a static branch during
> probe; For another, riscv_has_extension_likely() is based on
> alternative mechanism, it avoid some downsides of static branch, for
> example static branch's metadata in the __jump_table section, which is
> not discarded after ISA extensions are finalized, wastes some space.

Soft ping?

FWICT, this needs riscv arch maintainer review, then clocksource
maintainers can decide to merge it or not.

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/clocksource/timer-riscv.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index b310e6721fac..151f4f0cfd6c 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -29,12 +29,11 @@
>  #include <asm/sbi.h>
>  #include <asm/timex.h>
>  
> -static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
>  static bool riscv_timer_cannot_wake_cpu;
>  
>  static void riscv_clock_event_stop(void)
>  {
> -	if (static_branch_likely(&riscv_sstc_available)) {
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC)) {
>  		csr_write(CSR_STIMECMP, ULONG_MAX);
>  		if (IS_ENABLED(CONFIG_32BIT))
>  			csr_write(CSR_STIMECMPH, ULONG_MAX);
> @@ -48,7 +47,7 @@ static int riscv_clock_next_event(unsigned long delta,
>  {
>  	u64 next_tval = get_cycles64() + delta;
>  
> -	if (static_branch_likely(&riscv_sstc_available)) {
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC)) {
>  #if defined(CONFIG_32BIT)
>  		csr_write(CSR_STIMECMP, ULONG_MAX);
>  		csr_write(CSR_STIMECMPH, next_tval >> 32);
> @@ -112,7 +111,7 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
>  	ce->irq = riscv_clock_event_irq;
>  	if (riscv_timer_cannot_wake_cpu)
>  		ce->features |= CLOCK_EVT_FEAT_C3STOP;
> -	if (static_branch_likely(&riscv_sstc_available))
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC))
>  		ce->rating = 450;
>  	clockevents_config_and_register(ce, riscv_timebase, 100, ULONG_MAX);
>  
> @@ -186,10 +185,8 @@ static int __init riscv_timer_init_common(void)
>  		return error;
>  	}
>  
> -	if (riscv_isa_extension_available(NULL, SSTC)) {
> +	if (riscv_isa_extension_available(NULL, SSTC))
>  		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
> -		static_branch_enable(&riscv_sstc_available);
> -	}
>  
>  	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>  			 "clockevents/riscv/timer:starting",
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
