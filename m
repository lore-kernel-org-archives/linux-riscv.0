Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EB1C32793
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Aug 2022 23:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LC3TX4EgMOQ6RVXBmLaK2ExcPH+fMTZIhxEejEttpNk=; b=nayTkExzDzsWdt
	RL1r2WYe30JH962g46O24d31q8NkgnAZJbY1p1kbdql7Q60pZMqGtRnGS8MkZ2iGv+inz5kgqe17W
	C/tNrERdBRdc9EYy2FIpq1ogH8KOrTziMFF1Z9L+BcZj0BfoOFQJirEvviLSQFmVWZrRac/Zf75/2
	4zbQ7pktYPeVTsyxUcajfqlVgou0rAJ+biUuyDQHck+UGNRENripouV/PjmDzHQ4D4BTo7U9c0VKJ
	1TEmgMxtqx+efbbeCCA3nn9uqxmO52QCI6wD9gqvWYsGlH1Jlb3DW2LzCzKOIPIX2eGawPu49U/fT
	aWfYXUjAxUHqHm5Ui1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQd17-0096on-JP; Tue, 23 Aug 2022 23:09:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQd0w-0096km-0q; Tue, 23 Aug 2022 23:08:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 51C2FCE204C;
	Tue, 23 Aug 2022 23:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8BAC433C1;
	Tue, 23 Aug 2022 23:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661296122;
	bh=etGtsQ8hpgqaYQRpo9CqjNo7mfEVd9+79g1wLm8oYME=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AYzhj9Rv8WS0WPWOtuTrDHU/yH/cQpdgsMrIGtkaf9IidgT4AJQc84OdZmhRJd/K7
	 uw9HKq3ikESZJaUK7GM55LxcS/qbMb8gJq2SDu+fXYSm5k8ZdLr9Ty8ULl/+L6b1CZ
	 sXHEdPzC/+pjG67AIQNYndA8vLVTarQx56i6AM0nAQyzMh9jVixSrqjQocqe1UtH8V
	 QbR+hSXT75zbw2BI7R4dS+/q853jcbFUYn/ziebYWRUko82Z1TGMn39MxZmttXfXVQ
	 2Ep8kHDQKuh1UifuTNodfc7ooOrRUkwXtFbhOvFJHFo7l1+wimGxOLR/ofJXRrv31Z
	 iDfumwWa9I06A==
MIME-Version: 1.0
In-Reply-To: <20220527102900.144894-1-iivanov@suse.de>
References: <20220527102900.144894-1-iivanov@suse.de>
Subject: Re: [PATCH v3] clk: bcm2835: Round UART input clock up
From: Stephen Boyd <sboyd@kernel.org>
Cc: Ivan T. Ivanov <iivanov@suse.de>, Phil Elwell <phil@raspberrypi.org>, kernel test robot <lkp@intel.com>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
To: Albert Ou <aou@eecs.berkeley.edu>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Ivan T. Ivanov <iivanov@suse.de>, Michael Turquette <mturquette@baylibre.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>
Date: Tue, 23 Aug 2022 16:08:40 -0700
User-Agent: alot/0.10
Message-Id: <20220823230842.AB8BAC433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_160854_424025_82534849 
X-CRM114-Status: GOOD (  30.60  )
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

Quoting Ivan T. Ivanov (2022-05-27 03:29:00)
> It was reported that RPi3[1] and RPi Zero 2W boards have issues with
> the Bluetooth. It turns out that when switching from initial to
> operation speed host and device no longer can talk each other because
> host uses incorrect UART baud rate.
> 
> The UART driver used in this case is amba-pl011. Original fix, see
> below Github link[2], was inside pl011 module, but somehow it didn't
> look as the right place to fix. Beside that this original rounding
> function is not exactly perfect for all possible clock values. So I
> deiced to move the hack to the platform which actually need it.
> 
> The UART clock is initialised to be as close to the requested
> frequency as possible without exceeding it. Now that there is a
> clock manager that returns the actual frequencies, an expected
> 48MHz clock is reported as 47999625. If the requested baud rate
> == requested clock/16, there is no headroom and the slight
> reduction in actual clock rate results in failure.
> 
> If increasing a clock by less than 0.1% changes it from ..999..
> to ..000.., round it up.
> 
> [1] https://bugzilla.suse.com/show_bug.cgi?id=1188238
> [2] https://github.com/raspberrypi/linux/commit/ab3f1b39537f6d3825b8873006fbe2fc5ff057b7
> 
> Cc: Phil Elwell <phil@raspberrypi.org>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> ---

This is waiting for someone like Stefan to review. It's customary to
include previous reviewers on new versions of patches.

-Stephen

> 
> Changes since v2
> * Added more information in commit message
> * Changed hand crafted round function with the one form math.h
> 
> Changes since v1
> Make bcm2835_clock_round() static to fix following warning
> when compiling for riscv:
> drivers/clk/bcm/clk-bcm2835.c:997:15: warning: no previous prototype for 'bcm2835_clock_round' [-Wmissing-prototypes]
> Reported-by: kernel test robot <lkp@intel.com>
> 
>  drivers/clk/bcm/clk-bcm2835.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 48a1eb9f2d55..cee59990a57b 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -30,6 +30,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/math.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> @@ -502,6 +503,8 @@ struct bcm2835_clock_data {
>         bool low_jitter;
>  
>         u32 tcnt_mux;
> +
> +       bool round_up;
>  };
>  
>  struct bcm2835_gate_data {
> @@ -993,12 +996,31 @@ static long bcm2835_clock_rate_from_divisor(struct bcm2835_clock *clock,
>         return temp;
>  }
>  
> +static unsigned long bcm2835_clock_round(unsigned long clk)
> +{
> +       unsigned long scaler;
> +
> +       scaler = 1;
> +       while (scaler * 100000 < clk)
> +               scaler *= 10;
> +
> +       /*
> +        * If increasing a clock by less than 0.1% changes it
> +        * from ..999.. to ..000.., round up.
> +        */
> +       if ((clk + scaler - 1) / scaler % 1000 == 0)
> +               clk = roundup(clk, scaler);
> +
> +       return clk;
> +}
> +
>  static unsigned long bcm2835_clock_get_rate(struct clk_hw *hw,
>                                             unsigned long parent_rate)
>  {
>         struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
>         struct bcm2835_cprman *cprman = clock->cprman;
>         const struct bcm2835_clock_data *data = clock->data;
> +       unsigned long rate;
>         u32 div;
>  
>         if (data->int_bits == 0 && data->frac_bits == 0)
> @@ -1006,7 +1028,12 @@ static unsigned long bcm2835_clock_get_rate(struct clk_hw *hw,
>  
>         div = cprman_read(cprman, data->div_reg);
>  
> -       return bcm2835_clock_rate_from_divisor(clock, parent_rate, div);
> +       rate = bcm2835_clock_rate_from_divisor(clock, parent_rate, div);
> +
> +       if (data->round_up)
> +               rate = bcm2835_clock_round(rate);
> +
> +       return rate;
>  }
>  
>  static void bcm2835_clock_wait_busy(struct bcm2835_clock *clock)
> @@ -2143,7 +2170,8 @@ static const struct bcm2835_clk_desc clk_desc_array[] = {
>                 .div_reg = CM_UARTDIV,
>                 .int_bits = 10,
>                 .frac_bits = 12,
> -               .tcnt_mux = 28),
> +               .tcnt_mux = 28,
> +               .round_up = true),
>  
>         /* TV encoder clock.  Only operating frequency is 108Mhz.  */
>         [BCM2835_CLOCK_VEC]     = REGISTER_PER_CLK(
> -- 
> 2.35.3
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
