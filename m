Return-Path: <SRS0=HcYa=DW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B54C43457
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2020 21:23:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 626452076A
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2020 21:23:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JEMOoeq4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2+Ax4gm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 626452076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=abdnrqx5wtU86dRKNxstpG7sOAzrPO6gNM/AZZVRixs=; b=JEMOoeq4lM3aemGrdHCVU+97p
	1p7LvMddARAk6GdlyEGPH+r74YTbilF7G48MUXk1ifaLXCAg+eTzcPF59e2Hie/+a+5S2bZUiNXtA
	7GhezefkPYRrkkuhXdP8QqMYQROt9fId3U6DIEogwVQmIb7PGg2juhG6B08as8s61+TvhUqGqYS/O
	8yAFz9bCh0GnyrjiBU167KBzorj/HCRNBXG+T8T7sRX4WDAYA1ShbRuWWlUl/Z/qFvpEvaaxmkm8g
	VqiZJwt1mXQgJqJhfj7z7NAOk4aB3O2p8Hupy8Gx9zNBrZHsm2yVU1V74CEThhUlfo+d6IrSxdSru
	W/H5l9L/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTAiw-0005S1-Nx; Thu, 15 Oct 2020 21:23:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTAiu-0005RD-7X
 for linux-riscv@lists.infradead.org; Thu, 15 Oct 2020 21:23:44 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 23ECE20759;
 Thu, 15 Oct 2020 21:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602797022;
 bh=VscXPeqlcKVbdjZBU6CUVcSFWH6y6A9dEwXSrkAyznM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F2+Ax4gmR/rlAvQFBBLCxTl11n9Muv1FLIYT5KjeWoOqNcmA/9erXLTC/fTOU5sqw
 /R6aEyD5tNMme1gJ5yt3lnD5+2a94ihk82WOHCzf1uwRB7Z+nLI8xdg8g4VD75rpj7
 Ddnem6dp894T2fJIbKKp8V1PGElvmpdbfQMsiKMU=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kTAiq-001UWJ-8L; Thu, 15 Oct 2020 22:23:40 +0100
MIME-Version: 1.0
Date: Thu, 15 Oct 2020 22:23:40 +0100
From: Marc Zyngier <maz@kernel.org>
To: Greentime Hu <greentime.hu@sifive.com>
Subject: Re: [PATCH 2/2] irqchip/sifive-plic: Fix the interrupt was enabled
 accidentally issue.
In-Reply-To: <20201012135724.110579-2-greentime.hu@sifive.com>
References: <20201012135724.110579-1-greentime.hu@sifive.com>
 <20201012135724.110579-2-greentime.hu@sifive.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <5bedfbc723665c979eb73eefadb21970@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: greentime.hu@sifive.com, tglx@linutronix.de,
 jason@lakedaemon.net, palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_172344_421088_245DA3B0 
X-CRM114-Status: GOOD (  20.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: jason@lakedaemon.net, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, tglx@linutronix.de, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-10-12 14:57, Greentime Hu wrote:
> In commit 2ca0b460bbcb ("genirq/affinity: Make affinity setting if
> activated opt-in"),
> it added irqd_affinity_on_activate() checking in the function
> irq_set_affinity_deactivated() so it will return false here.
> In that case, it will call irq_try_set_affinity() -> plic_irq_toggle()
> which will enable the interrupt to cause the CPU hang.
> 
> 	if (irq_set_affinity_deactivated())
> 		return 0;
> 	...
> 	irq_try_set_affinity(data, mask, force);
> 
> [  919.015783] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [  919.020922] rcu:     0-...0: (0 ticks this GP)
> idle=7d2/1/0x4000000000000002 softirq=1424/1424 fqs=105807
> [  919.030295]  (detected by 1, t=225825 jiffies, g=1561, q=3496)
> [  919.036109] Task dump for CPU 0:
> [  919.039321] kworker/0:1     R  running task        0    30      2 
> 0x00000008
> [  919.046359] Workqueue: events set_brightness_delayed
> [  919.051302] Call Trace:
> [  919.053738] [<ffffffe000930d92>] __schedule+0x194/0x4de
> [  982.035783] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [  982.040923] rcu:     0-...0: (0 ticks this GP)
> idle=7d2/1/0x4000000000000002 softirq=1424/1424 fqs=113325
> [  982.050294]  (detected by 1, t=241580 jiffies, g=1561, q=3509)
> [  982.056108] Task dump for CPU 0:
> [  982.059321] kworker/0:1     R  running task        0    30      2 
> 0x00000008
> [  982.066359] Workqueue: events set_brightness_delayed
> [  982.071302] Call Trace:
> [  982.073739] [<ffffffe000930d92>] __schedule+0x194/0x4de
> [..]
> 
> After applying this patch, the CPU hang issue can be fixed.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-sifive-plic.c
> b/drivers/irqchip/irq-sifive-plic.c
> index 4cc8a2657a6d..8a673d9cff69 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -183,10 +183,14 @@ static int plic_irqdomain_map(struct irq_domain
> *d, unsigned int irq,
>  			      irq_hw_number_t hwirq)
>  {
>  	struct plic_priv *priv = d->host_data;
> +	struct irq_data *irqd;
> 
>  	irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
>  			    handle_fasteoi_irq, NULL, NULL);
>  	irq_set_noprobe(irq);
> +	irqd = irq_get_irq_data(irq);
> +	irqd_set_single_target(irqd);
> +	irqd_set_affinity_on_activate(irqd);
>  	irq_set_affinity(irq, &priv->lmask);
>  	return 0;
>  }

How does this fix anything? The plic driver doesn't have an activate
callback, so how does it make any difference? I get the feeling this
papers over another issue.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
