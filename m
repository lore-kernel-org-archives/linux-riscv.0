Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4F3C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 07:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMFr6whIeZUUBrkdENHr+SfT0UL/2BQclt3Jx4s+d20=; b=2abpUt3vICz8Ex
	W8DJSV/hAnD9/ujzmm1dDMGfd2DEqI3ojvUyZ8tCluWPlidvlJ3w/C7q1/IIXyhrxaMzkccWxqQBy
	5QIDaW3anIRAm/P6vd/eCnL6JQEyvg0KeI5mitunYIWBpZJJzerDICNpIZeDaKJ+xWNnQCLtaqyhI
	5O2RmNbAv2CbAXUVX7ARlEfhEwuHiMg+AppFeFuZCYrd0axZE98dpVMNqJ1myIYp4B4SpyZS9Bvcl
	UEwYRCt2jXoeCCkKCGceMA25lVphQsD9sq0YkUA45vepfp4AQiySYh1bWcY+DjP+hvzeZ78x5opFZ
	DczJ+0f1ZdWjKJEfpNYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxMTe-002jBr-0g;
	Mon, 30 Oct 2023 07:14:22 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxMTb-002jBJ-0s;
	Mon, 30 Oct 2023 07:14:20 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39U7Cl8k048592;
	Mon, 30 Oct 2023 15:12:47 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Mon, 30 Oct 2023 15:12:46 +0800
Date: Mon, 30 Oct 2023 15:12:46 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH v3 RESEND 02/13] irqchip/riscv-intc: Allow large
 non-standard hwirq number
Message-ID: <ZT9XbuxE2vlvsfYG@APC323>
References: <20231023004100.2663486-1-peterlin@andestech.com>
 <20231023004100.2663486-3-peterlin@andestech.com>
 <87a5s44jyc.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a5s44jyc.ffs@tglx>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39U7Cl8k048592
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_001419_765722_E860C79E 
X-CRM114-Status: GOOD (  19.28  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Thomas,

Thanks for the review.

On Fri, Oct 27, 2023 at 09:12:59AM +0200, Thomas Gleixner wrote:
> On Mon, Oct 23 2023 at 08:40, Yu Chien Peter Lin wrote:
> > Currently, the implementation of the RISC-V INTC driver uses the
> > interrupt cause as hwirq and has a limitation of supporting a
> > maximum of 64 hwirqs. However, according to the privileged spec,
> > interrupt causes >= 16 are defined for platform use.
> >
> > This limitation prevents us from fully utilizing the available
> > local interrupt sources. Additionally, the hwirqs used on RISC-V
> > are sparse, with only interrupt numbers 1, 5 and 9 (plus Sscofpmf
> > or T-Head's PMU irq) being currently used for supervisor mode.
> >
> > The patch switches to using irq_domain_create_tree() which
> 
> git grep "This patch" Documentation/process/

Sure, will fix.

> > creates the radix tree map, allowing us to handle a larger
> > number of hwirqs.
> 
> Who is 'us'? We are not part of the chip and please write out 'hardware
> interrupts'

OK!

> > @@ -24,10 +24,8 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
> >  {
> >  	unsigned long cause = regs->cause & ~CAUSE_IRQ_FLAG;
> >  
> > -	if (unlikely(cause >= BITS_PER_LONG))
> > -		panic("unexpected interrupt cause");
> > -
> > -	generic_handle_domain_irq(intc_domain, cause);
> > +	if (generic_handle_domain_irq(intc_domain, cause))
> > +		pr_warn("Failed to handle interrupt (cause: %ld)\n", cause);
> 
> pr_warn_once() or at least pr_warn_ratelimited().

OK!

> >  }
> >  
> >  /*
> > @@ -117,8 +115,8 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn)
> >  {
> >  	int rc;
> >  
> > -	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
> > -					       &riscv_intc_domain_ops, NULL);
> > +	intc_domain = irq_domain_create_tree(fn, &riscv_intc_domain_ops,
> > +					     NULL);
> 
> Put it into one line. Linebreaking arguments is really only required
> when the line length is exceedingly long. This one is not.

OK! will fix.

Thanks,
Peter Lin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
