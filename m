Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EB1C54E64
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 01:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pnXiCuzSLGWaCz1gbcRtn3+p3kuhwFDVKs30DHGQVIk=; b=akRcA1gK0rj4qW
	zhnfQKkXW84GshxErU7uAqKlRJLM/NbX0OFy16QL9teV8gqqA6N4cWC4GdPYAuIl0edKqF/5n/Zg8
	b4ne0sJhNVe4AfwSw7Yk7+m1ptHh0A/yEESK6ng7ojzOzj4v6jZv0kttpbXN/VZVXuiuHbFDDq+l6
	Iy/CAX/4pChV/19vAYVIGk2guGYrojsy4Xv/RGpl4iJbwpcMp3NVOfKn4UVpRx+jJ7/YzWjEvQ+xD
	iEgj5C1AikC9+RrSB0BAcn1jA+Cel9KOSmhCdwgw3NTWVq7xOy7Bk+k2nyERMW6L/F8DKgpCBBrL3
	wv0bzUbR238h11wHzkmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rovlz-00000002fPe-0TN9;
	Tue, 26 Mar 2024 01:38:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rovlf-00000002fN0-299T
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 01:38:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0939ACE1850;
	Tue, 26 Mar 2024 01:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C26BC433C7;
	Tue, 26 Mar 2024 01:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711417100;
	bh=2QmSDgizxHwgM0JsXY7MomEdeWiJFYIJPQyEwfyZHMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OnFneb4zrbWGl6dWZjfuzujftcLqyYgdagHWflTF9W5RnERRc9X27JwdIMjGurzfR
	 sB2MEeNGztEwXwlTJlkTF+GsUz2SuOhBJly06KrcghliwNstJoNGJ2lB6DWpwCyrFs
	 q4goIGmiuYW62nunftRrNlRNHmo21Ib7q4Swl/3qoa5D2ZTc95r63VL0ALGkeBqrhB
	 Dp/3E6aL+PkW3dB1AddGbEW/Xye5txlSiXtT/6q7TTqB1hVEDYiDMapV4rUAAOWWnX
	 B3EppRNoleZS92qgSz7oEN/KLKsGWb6AaghgOwoTv/yF/ilBT71pgLsJeSnWEohQ+m
	 P6lBGF26u0xmA==
Date: Tue, 26 Mar 2024 09:25:05 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] clocksource/drivers/timer-clint: Add T-Head C9xx
 clint support
Message-ID: <ZgIj8QQ7zO_eSZcA@xhacker>
References: <20240325164021.3229-1-jszhang@kernel.org>
 <20240325164021.3229-6-jszhang@kernel.org>
 <72eac56e-61d4-e42f-cfbd-8bcc35ed7bb6@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <72eac56e-61d4-e42f-cfbd-8bcc35ed7bb6@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_183825_211804_CEF56615 
X-CRM114-Status: GOOD (  24.09  )
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

On Mon, Mar 25, 2024 at 03:22:11PM -0700, Bo Gan wrote:
> On 3/25/24 9:40 AM, Jisheng Zhang wrote:
> > The mtimecmp in T-Head C9xx clint only supports 32bit read/write,
> > implement such support.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >   drivers/clocksource/timer-clint.c | 24 ++++++++++++++++++++++++
> >   1 file changed, 24 insertions(+)
> > 
> > diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
> > index 4537c77e623c..71188732e8a3 100644
> > --- a/drivers/clocksource/timer-clint.c
> > +++ b/drivers/clocksource/timer-clint.c
> > @@ -34,6 +34,7 @@ static unsigned int clint_ipi_irq;
> >   static u64 __iomem *clint_timer_cmp;
> >   static unsigned long clint_timer_freq;
> >   static unsigned int clint_timer_irq;
> > +static bool is_c900_clint;
> >   #ifdef CONFIG_SMP
> >   static void clint_send_ipi(unsigned int cpu)
> > @@ -88,6 +89,19 @@ static int clint_clock_next_event(unsigned long delta,
> >   	return 0;
> >   }
> > +static int c900_clint_clock_next_event(unsigned long delta,
> > +				       struct clock_event_device *ce)
> > +{
> > +	void __iomem *r = clint_timer_cmp +
> > +			  cpuid_to_hartid_map(smp_processor_id());
> > +	u64 val = clint_get_cycles64() + delta;
> > +
> > +	csr_set(CSR_IE, IE_TIE);
> Perhaps you should do a writel_relaxed(-1, r) here. just like openSBI, because the update
> to mtimecmp is now split into 2 parts.
> https://github.com/riscv-software-src/opensbi/blob/v1.4/lib/utils/timer/aclint_mtimer.c#L54

Thanks, I also noticed the mtimecmp update on 32bit platforms doesn't
strictly follow the riscv spec:

# New comparand is in a1:a0.
li t0, -1
la t1, mtimecmp
sw t0, 0(t1) # No smaller than old value.
sw a1, 4(t1) # No smaller than new value.
sw a0, 0(t1) # New value.

So A new bug fix patch will be added in v2.


> 
> > +	writel_relaxed(val, r);
> > +	writel_relaxed(val >> 32, r + 4);
> > +	return 0;
> > +}
> > +>   static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
> >   	.name		= "clint_clockevent",
> >   	.features	= CLOCK_EVT_FEAT_ONESHOT,
> > @@ -99,6 +113,9 @@ static int clint_timer_starting_cpu(unsigned int cpu)
> >   {
> >   	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
> > +	if (is_c900_clint)
> > +		ce->set_next_event = c900_clint_clock_next_event;
> > +
> >   	ce->cpumask = cpumask_of(cpu);
> >   	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
> > @@ -233,5 +250,12 @@ static int __init clint_timer_init_dt(struct device_node *np)
> >   	return rc;
> >   }
> > +static int __init c900_clint_timer_init_dt(struct device_node *np)
> > +{
> > +	is_c900_clint = true;
> > +	return clint_timer_init_dt(np);
> > +}
> > +
> >   TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
> >   TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
> > +TIMER_OF_DECLARE(clint_timer2, "thead,c900-clint", clint_timer_init_dt);
> > 
> Better use a more generic term to describe the fact that mtimecmp doesn't support
> 64-bit mmio, just like what openSBI is currently doing, instead of making it c900 specific:

This has been mentioned in commit msg, but adding a code comment seems fine.
> 
> https://github.com/riscv-software-src/opensbi/blob/v1.4/lib/utils/timer/fdt_timer_mtimer.c#L152
> 
> Then your `is_c900_clint` becomes something like `timecmp_64bit_mmio`.
> 
> Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
