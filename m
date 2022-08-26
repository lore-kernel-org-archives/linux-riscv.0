Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72C2ECAAD6
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 19:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zF19TOG0eu7PwtNlfeUB+6u00JSzRTEFkDP4WQLi33s=; b=GUdQ52vAt7PiTZMO6g+73QxnaO
	Cd8OIu9gAB9QtHU1D5IIVknmdsRbJi/k4m1Mrb8YDZSc134aOl2BooebNoTyeDVMHg88LgWPRvw/v
	OCp4L1isbjvEvSn7TpNkUSlWdODxPL9X/hXI5dGYEMn9uwqT/wu7vi1wyyyY5jz2liWkyyNOHiO/T
	NPP6r413X52sUigJvaxT3Fu6B3eL2HSZ75rS95AgV0PD+LVpJfmJOIWVUlmsH5zn2PDMcR4TziL2q
	uili837k42LI8tT5yalA50Ax93tEOkjTIF8Wsforl6tQPUbNluWuFvEhtRhrXE5Ywm9OAZiktuAzu
	cszwVabw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRek3-00ASA1-Lw; Fri, 26 Aug 2022 19:11:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oReWF-00AHSn-1q
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 18:57:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8876E61EB6;
	Fri, 26 Aug 2022 18:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B858C433D6;
	Fri, 26 Aug 2022 18:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661540244;
	bh=Et+UJP3nMFjSqnln2xBo9NvAK9eQG6VOhiPO8c+DwVA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LVtNQfn43hg0qP57cDq5ZVdSuV6F6hQMIY1+AMC/AT3Ul1lVgo3d7yFo6RNUVk2i6
	 5FSRXGpBJBqhoe+pGJ1ntBysI6RfXr0Yco3lgkrvokSb5lj4CM7c3fqnKeA1o8zNJj
	 qpDkgsGcaUaYSe1FBbU3qZ/B6euL+WJCJ/dvysJfwUePOdcCUc/YRcmHNLDSpNYtQO
	 +8zaYpy/gq7hM3eL4czpWP7kmgA1vsD7VpmWbjw3Ztf3dk9RcBgCnLQoPOXlexVvK4
	 vXYjs1nXVyORwzEph65O51zTPbwHy0vijKZm1M+rB6bLL90jOH/jnp4lnX0bpIddQP
	 b0X5KhiYBt9Rw==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1oReWA-0062Ce-OM;
	Fri, 26 Aug 2022 19:57:22 +0100
MIME-Version: 1.0
Date: Fri, 26 Aug 2022 19:57:22 +0100
From: Marc Zyngier <maz@kernel.org>
To: Conor.Dooley@microchip.com
Cc: apatel@ventanamicro.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 tglx@linutronix.de, daniel.lezcano@linaro.org, atishp@atishpatra.org,
 Alistair.Francis@wdc.com, anup@brainfault.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 4/7] RISC-V: Treat IPIs as normal Linux IRQs
In-Reply-To: <8f4ae429-0f12-2096-c07b-fe43b3abb4fe@microchip.com>
References: <20220820065446.389788-1-apatel@ventanamicro.com>
 <20220820065446.389788-5-apatel@ventanamicro.com>
 <8f4ae429-0f12-2096-c07b-fe43b3abb4fe@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <69e58f4dc2b74415a32a97998e862479@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: Conor.Dooley@microchip.com, apatel@ventanamicro.com, palmer@dabbelt.com, paul.walmsley@sifive.com, tglx@linutronix.de, daniel.lezcano@linaro.org, atishp@atishpatra.org, Alistair.Francis@wdc.com, anup@brainfault.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_115727_218641_F494EDF8 
X-CRM114-Status: GOOD (  20.28  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022-08-26 19:48, Conor.Dooley@microchip.com wrote:
> On 20/08/2022 07:54, Anup Patel wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Currently, the RISC-V kernel provides arch specific hooks (i.e.
>> struct riscv_ipi_ops) to register IPI handling methods. The stats
>> gathering of IPIs is also arch specific in the RISC-V kernel.
>> 
>> Other architectures (such as ARM, ARM64, and MIPS) have moved away
>> from custom arch specific IPI handling methods. Currently, these
>> architectures have Linux irqchip drivers providing a range of Linux
>> IRQ numbers to be used as IPIs and IPI triggering is done using
>> generic IPI APIs. This approach allows architectures to treat IPIs
>> as normal Linux IRQs and IPI stats gathering is done by the generic
>> Linux IRQ subsystem.
>> 
>> We extend the RISC-V IPI handling as-per above approach so that arch
>> specific IPI handling methods (struct riscv_ipi_ops) can be removed
>> and the IPI handling is done through the Linux IRQ subsystem.
>> 
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> 
>> +void riscv_ipi_set_virq_range(int virq, int nr)
>> +{
>> +       int i, err;
>> 
>> -               if (ops & (1 << IPI_IRQ_WORK)) {
>> -                       stats[IPI_IRQ_WORK]++;
>> -                       irq_work_run();
>> -               }
>> +       if (WARN_ON(ipi_virq_base))
>> +               return;
>> 
>> -#ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
>> -               if (ops & (1 << IPI_TIMER)) {
>> -                       stats[IPI_TIMER]++;
>> -                       tick_receive_broadcast();
>> -               }
>> -#endif
>> -               BUG_ON((ops >> IPI_MAX) != 0);
>> +       WARN_ON(nr < IPI_MAX);
>> +       nr_ipi = min(nr, IPI_MAX);
>> +       ipi_virq_base = virq;
>> +
>> +       /* Request IPIs */
>> +       for (i = 0; i < nr_ipi; i++) {
>> +               err = request_percpu_irq(ipi_virq_base + i, 
>> handle_IPI,
>> +                                        "IPI", &ipi_virq_base);
> 
> FWIW, ?sparse? does not like this:
> arch/riscv/kernel/smp.c:163:50: warning: incorrect type in argument 4
> (different address spaces)
> arch/riscv/kernel/smp.c:163:50:    expected void [noderef] __percpu
> *percpu_dev_id
> arch/riscv/kernel/smp.c:163:50:    got int *

Huh, well spotted. This will totally give the wrong sort of
result, as this is used as a percpu variable from the irq
core code.

The arm64 code passes instead a pointer to the CPU number, which
is not very useful, but at least not completely wrong.

I'm sure the RISC-V code has some sort of semi-useful data to
stuff in there instead of this.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
