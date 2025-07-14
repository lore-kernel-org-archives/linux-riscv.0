Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A723EC83F20
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 01:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11AlV3/D4mQTpbaiZ+Evj7+0h4xtmNNlTtS/nxTbylw=; b=hEhNhNhhubVAEb
	ZvWiuhX7/KhMw3PxybQkXCliF3eKmJZIKqXADWppZMIUwUC7WhyiQjMPLVYAU4rY2MYIRrxubl/YC
	UrAKal23RW2PNX1uqTp0gY7A18/3glJWIwFE/OxnjaKEnRsrGj4Q2VcAWIANaoqNxw2AkF5NZGqwR
	ENUwn3tFvOKKncE74KWFPxmxtJYQuDHcRm6UFUH/I1Hvlen19jvcOGNMOTarzD+Ukz31J8xsAg/de
	AD1rUJe7VWpha/vY0dfBHsM1RoFqL8xncRrjjsgBCQanGDBfOrfFyJtmHgXJWHq+QPbz8EjDW2x1q
	JXIDGbV0qxiA+3QgXH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub7jo-00000000t0d-0GAM;
	Mon, 14 Jul 2025 01:12:12 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub7ji-00000000sws-2KA8
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 01:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1752455472;
	bh=Amtu/BMQ4xmWdYjBSji486U4RjhuzbYA7jha03pBhjg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=BBPlxzk9Adp+ew3JynSnWvYMw4IvBcfdrKJfvabsUdK+/1Qja0Yzxrw+oNX7zSIiQ
	 MxFfC4+PGANzE3Pg70aYSynMuQrbTjfiTKs/bGNfmCaX6gSll+k95DzHnfewLwmYZS
	 WHOo4pT/Vc/44lzj/NUtuE1T30vCYszP+gSNEDqE=
X-QQ-mid: esmtpgz11t1752455466t98e6bb1f
X-QQ-Originating-IP: sb1Z4YGB401YU+EpphLSHmw9KA7oI9snJgML1SxSMyk=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 14 Jul 2025 09:11:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4221218909025609194
EX-QQ-RecipientCnt: 7
Date: Mon, 14 Jul 2025 09:11:05 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: configure ILCR for accurate SCL frequency
Message-ID: <54384E7E7AD6D77C+aHRZKYHMHTiHXPWW@LT-Guozexi>
References: <20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com>
 <bf6nkxdfctgz2tacf3vm6tv4qhd72vbqj52gu6kt2fc5erltkw@nufl7i3bddkb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf6nkxdfctgz2tacf3vm6tv4qhd72vbqj52gu6kt2fc5erltkw@nufl7i3bddkb>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NSEFX6u+4l+KDZ9Z+o4732aEfDt7l3MfBCgkh3FgU6RdpVeVwB2wXZV/
	PPMLlq/OSDUd+1z6aSYEZHp+aQ2YnY1omlVxMV70bSSVm8wH0ihSaAclGdQg74xadApPykE
	oHqVdHpuD7vtS6gpP7LVsQkcuvwgEuuTKVuWDrMLy2BKFC9Ry26j7JzjirzS2GIbK6KHi2x
	9h2yQkhFVZ4FA4myRI13VKXl7qCgn1Owmop8wF7k942Bnh3QNmV3jJ6S5v+qFhOL256cx1N
	Nva59Pgw8/pzt7KtKk6Gwau90Op/zz9YRQgcZFNh4r1VgLOQHSHPbhoZn7OpGUz4kPVrPig
	hrHpsBhlEhHuzNfDqtHrYDqm2U/RIVQsg+vrDzNBqTRS0dyCE6mKKrsEPkAFHD9YUUnzTlu
	zIeRvVz67LXjBSUAzkNSDDnrl56VUOEeZdNl1or6WO2+TgDsoehL75BS4wPENaupMEorDXU
	O3rU+JdcFrHCOMxuu+KCfr/RjnokJj2ilYHTtg4WbFHXWlQ4in+oEb/6NX5rh48oorqgHKo
	LyCQ7zJ/AbdO8zvWg3YxCRx1lRjziBGJHgtetvjcJTEIKkW8c3UhPcj7/V10yYEw1eoZjBn
	23KfHzef2UXOTY8ARALNGrNh9aewNxUmTsrtdANCvdPi0vmrJ36CexM12KDowHIHcVLIEYT
	vgkkGkB9hm2NT9p1wIEdm40nM7M6wqkZUAxXQQKnk3Lmzobbkc9fNMW8BjkPosuN2SXhxpt
	eimSeAlX6QgmxsZ2O1q5emhHvNKmmq3NAWYkLgUGCw4rAMhhDT3sFr24FEQk8pzWdCVdzPm
	TmKEGCXfAvmZs48U3HrC4gn1lpVJJtCfvr1UYws4PMmpWTLJn+7C7FDpZS6A4GgT4/9g+0Q
	IpdruTdGlI+Qjw4XCejH2nQ2oxQrQhjDlT+h1LPbGuz8Yw2tqEZaJ1t4XzNHqy6IO/y2s1R
	tJ+1XmLwlj+Vazh8T6QPXgOiHQEduxH3hdUh3JGqgEuo2NERxg500KmkP6AvIrHe6/f4=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_181207_625417_5DA5FF27 
X-CRM114-Status: GOOD (  21.93  )
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

Hi Andi, Thanks for your review!

On Fri, Jul 11, 2025 at 11:20:48AM +0200, Andi Shyti wrote:
> Hi Troy,
> 
> > - #include <linux/clk.h>
> > - #include <linux/i2c.h>
> > - #include <linux/iopoll.h>
> > - #include <linux/module.h>
> > - #include <linux/of_address.h>
> > - #include <linux/platform_device.h>
> > +#include "linux/bits.h"
> 
> this should be <linux/bits.h>
> 
> > +#include <linux/clk.h>
> > +#include <linux/clkdev.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/i2c.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> 
> Is the diff a bit noisy or am I failing to see some differences?
I removed whitespaces

> 
> >  /* spacemit i2c registers */
> >  #define SPACEMIT_ICR		 0x0		/* Control register */
> >  #define SPACEMIT_ISR		 0x4		/* Status register */
> >  #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
> > +#define SPACEMIT_ILCR		 0x10		/* Load Count Register */
> >  #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
> 
> ...
> 
> > +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> > +				unsigned long parent_rate)
> 
> here the alignment is a bit off.
> 
> > +{
> > +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> > +	u32 lv, lcr;
> > +
> > +	lv = DIV_ROUND_UP(parent_rate, rate);
> 
> do we want to sanity check the lv value here?
Yes, I'll check it in the next version.

> 
> > +	lcr = readl(i2c->base + SPACEMIT_ILCR);
> > +	if (i2c->mode == SPACEMIT_MODE_STANDARD) {
> > +		lcr &= ~SPACEMIT_LCR_LV_STANDARD_MASK;
> > +		lcr |= lv << SPACEMIT_LCR_LV_STANDARD_SHIFT;
> > +	} else if (i2c->mode == SPACEMIT_MODE_FAST) {
> > +		lcr &= ~SPACEMIT_LCR_LV_FAST_MASK;
> > +		lcr |= lv << SPACEMIT_LCR_LV_FAST_SHIFT;
> > +	}
> > +	writel(lcr, i2c->base + SPACEMIT_ILCR);
> > +
> > +	return 0;
> > +}
> > +
> > +static long spacemit_i2c_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> > +				unsigned long *parent_rate)
> 
> Alignment.
> 
> > +{
> > +	u32 lv, freq;
> > +
> > +	lv = DIV_ROUND_UP(*parent_rate, rate);
> > +	freq = DIV_ROUND_UP(*parent_rate, lv);
> > +
> > +	return freq;
> > +}
> > +
> > +static unsigned long spacemit_i2c_clk_recalc_rate(struct clk_hw *hw,
> > +						unsigned long parent_rate)
> 
> alignment.
> 
> > +{
> 
> ...
> 
> > @@ -519,15 +636,13 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
> >  		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
> >  
> >  	/* For now, this driver doesn't support high-speed. */
> > -	if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> > -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> > -			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
> > -		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
> > -	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> > -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> > -			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
> > -		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
> > -	}
> > +	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
> > +	    i2c->clock_freq <= SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> > +		i2c->mode = SPACEMIT_MODE_FAST;
> > +	else if (i2c->clock_freq && i2c->clock_freq <= SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ)
> > +		i2c->mode = SPACEMIT_MODE_STANDARD;
> > +	else
> > +		return -EINVAL;
> 
> Should we print an error here? And how likely is this case to
> happen? Perhaps we can force the mode even if the frequency is
> off and move forward instead of forcing the failure.
Yes we can force the mode to fast.

        - Troy
> 
> Andi
> 
> >  
> >  	i2c->dev = &pdev->dev;
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
