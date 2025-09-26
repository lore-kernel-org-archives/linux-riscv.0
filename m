Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BFCCAC5AE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 11:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aG/sIc8jpoDzHOpRB+fVgSZ42ZFmhO0cxFxrhALmKi0=; b=CLm7JMqi98/wdo
	38kA5g1KV3yrL8Ow5QHuyBzgIQULm3nUQbxFOZwO2DGcCyJwsN+5bIV1UyMDH+Juq3PC4+bxZumid
	4ZxFPMM6KBHKwtA8CYgWlyZmbwYFuD1dL81SEXvKKmzhoLPd8xrshranfyXWio3F0THQAI+sC9LY5
	SRVdFHlY9lbVBGf9T3xmzmaDG33BOBYEWDD4lmY22Fqe49+kW6gwD8HvMB3fEi2gYS5yqOMD60Rn3
	eK37Seo87PcyWiZ+b/Gv8SW2doROVRLYM0jE+Q3SDzsv0E3EhSFLju6Eens8m445+9xt4nsgStaVy
	VzE7nqWdgwl6mbPaLi1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26Lx-00000000gMS-1JHV;
	Fri, 26 Sep 2025 11:11:05 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26Lu-00000000gKD-0n6r
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 11:11:03 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AAA74340BDE;
	Fri, 26 Sep 2025 11:10:59 +0000 (UTC)
Date: Fri, 26 Sep 2025 19:10:55 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <20250926111055-GYB1324993@gentoo.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_041102_262736_16BD2BDC 
X-CRM114-Status: GOOD (  33.43  )
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

Hi Troy,

On 10:02 Thu 25 Sep     , Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C with interrupts disabled.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 164 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 140 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 6b918770e612e098b8ad17418f420d87c94df166..e403eb7d6f329f4fe5c5242f94cc21094dff105c 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -97,6 +97,9 @@
>  
>  #define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
>  
> +/* Constants */
> +#define SPACEMIT_WAIT_TIMEOUT      1000 /* ms */
> +
>  enum spacemit_i2c_state {
>  	SPACEMIT_STATE_IDLE,
>  	SPACEMIT_STATE_START,
> @@ -125,6 +128,7 @@ struct spacemit_i2c_dev {
>  
>  	enum spacemit_i2c_state state;
>  	bool read;
> +	bool is_pio;
using_pio_mode or simply use_pio, but have to say..

I feel it's improper to have this flag here, since it's not a controller
level feature, I understand it was introduced to support aotmic operation

Personally, I'd suggest to pass the flag in xfer(), then propagate down to
whatever needed, so it limit to single transmission which more flexible

>  	struct completion complete;
>  	u32 status;
>  };
> @@ -206,9 +210,14 @@ static int spacemit_i2c_wait_bus_idle(struct spacemit_i2c_dev *i2c)
>  	if (!(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)))
>  		return 0;
>  
> -	ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> -				 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> -				 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> +	if (!i2c->is_pio)
> +		ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> +					 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> +					 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> +	else
> +		ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> +						val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> +						1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
question, since you have already used state-machine to track the I2C process,
can you not poke hardware ISR register in a scatter way? I'd rather see it handled
more closely in a interrupt context or related?

btw, does some bits of the ISR register have read-then-clear feature?
which may require special attention to handle..

>  	if (ret)
>  		spacemit_i2c_reset(i2c);
>  
> @@ -226,7 +235,7 @@ static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
>  
>  static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  {
> -	u32 val;
> +	u32 val = 0;
>  
>  	/*
>  	 * Unmask interrupt bits for all xfer mode:
> @@ -234,7 +243,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  	 * For transaction complete signal, we use master stop
>  	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
>  	 */
> -	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> +	if (!i2c->is_pio)
..
> +		val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
>  
>  	/*
>  	 * Unmask interrupt bits for interrupt xfer mode:
> @@ -244,7 +254,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  	 * i2c_start function.
>  	 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
>  	 */
> -	val |= SPACEMIT_CR_DRFIE;
> +	if (!i2c->is_pio)
..
> +		val |= SPACEMIT_CR_DRFIE;
>  
>  	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
>  		val |= SPACEMIT_CR_MODE_FAST;
> @@ -256,7 +267,10 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  	val |= SPACEMIT_CR_SCLE;
>  
>  	/* enable master stop detected */
> -	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
> +	val |= SPACEMIT_CR_MSDE;
> +
> +	if (!i2c->is_pio)
> +		val |= SPACEMIT_CR_MSDIE;
can you converge all assignment under one if?
>  
>  	writel(val, i2c->base + SPACEMIT_ICR);
>  
> @@ -293,10 +307,54 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
>  	/* send start pulse */
>  	val = readl(i2c->base + SPACEMIT_ICR);
>  	val &= ~SPACEMIT_CR_STOP;
> -	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB | SPACEMIT_CR_DTEIE;
> +	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB;
> +
> +	if (!i2c->is_pio)
> +		val |= SPACEMIT_CR_DTEIE;
> +
>  	writel(val, i2c->base + SPACEMIT_ICR);
>  }
>  
> +static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid);
> +static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 msec = jiffies_to_msecs(i2c->adapt.timeout);
> +	ktime_t timeout = ktime_add_ms(ktime_get(), msec);
> +	int ret;
> +
> +	while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0) {
> +		udelay(10);
> +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
> +
> +		spacemit_i2c_clear_int_status(i2c, i2c->status);
> +
> +		if (!(i2c->status & SPACEMIT_SR_IRF) && !(i2c->status & SPACEMIT_SR_ITE))
> +			continue;
> +
> +		spacemit_i2c_irq_handler(0, i2c);

can you refactor and construct a new function? that can be reused between
irq() and pio() cases, it makes people confused..

> +
> +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
> +
> +		/*
> +		 * This is the last byte to write of the current message.
> +		 * If we do not wait here, control will proceed directly to start(),
> +		 * which would overwrite the current data.
> +		 */
> +		if (!i2c->read && !i2c->unprocessed) {
> +			ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> +						i2c->status, i2c->status & SPACEMIT_SR_ITE,
> +						30, 1000);
> +			if (ret)
> +				return 0;
> +		}
> +	}
> +
> +	if (i2c->unprocessed)
> +		return 0;
> +
> +	return 1;
> +}
> +

[snip]..

>  static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
> @@ -416,13 +505,20 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>  	struct spacemit_i2c_dev *i2c = devid;
>  	u32 status, val;
>  
> -	status = readl(i2c->base + SPACEMIT_ISR);
> -	if (!status)
> -		return IRQ_HANDLED;
> +	/*
> +	 * In PIO mode, do not read status again.
> +	 * It has already been read in wait_pio_xfer(),
> +	 * and reading it clears some bits.
> +	 */
> +	if (!i2c->is_pio) {
> +		status = readl(i2c->base + SPACEMIT_ISR);
> +		if (!status)
> +			return IRQ_HANDLED;
>  
> -	i2c->status = status;
> +		i2c->status = status;
>  
> -	spacemit_i2c_clear_int_status(i2c, status);
> +		spacemit_i2c_clear_int_status(i2c, status);
> +	}
>  
>  	if (i2c->status & SPACEMIT_SR_ERR)
>  		goto err_out;
> @@ -445,7 +541,10 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>  	}
>  
>  	if (i2c->state != SPACEMIT_STATE_IDLE) {
> -		val |= SPACEMIT_CR_TB | SPACEMIT_CR_ALDIE;
> +		val |= SPACEMIT_CR_TB;
> +		if (i2c->is_pio)
> +			val |= SPACEMIT_CR_ALDIE;
> +
>  
>  		if (spacemit_i2c_is_last_msg(i2c)) {
>  			/* trigger next byte with stop */
> @@ -479,15 +578,21 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
>  	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 10) / i2c->msg_num;
>  }
>  
> -static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> +static inline int
> +spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num, bool is_pio)
s/spacemit_i2c_xfer/spacemit_i2c_xfer_common/

s/is_pio/atomic/, I'd suggest to distinguish 'pio' vs 'atomic'

>  {
>  	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
>  	int ret;
>  
> +	i2c->is_pio = is_pio;
so, check my previous comment, you use this member to cache the flag..

> +
>  	i2c->msgs = msgs;
>  	i2c->msg_num = num;
>  
> -	spacemit_i2c_calc_timeout(i2c);
> +	if (!i2c->is_pio)
> +		spacemit_i2c_calc_timeout(i2c);
> +	else
> +		i2c->adapt.timeout = SPACEMIT_WAIT_TIMEOUT;
>  
>  	spacemit_i2c_init(i2c);
>  
> @@ -506,18 +611,29 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
>  
>  	if (ret == -ETIMEDOUT || ret == -EAGAIN)
>  		dev_err(i2c->dev, "i2c transfer failed, ret %d err 0x%lx\n",
> -			  ret, i2c->status & SPACEMIT_SR_ERR);
> +			ret, i2c->status & SPACEMIT_SR_ERR);
>  
>  	return ret < 0 ? ret : num;
>  }
>  
> +static int spacemit_i2c_int_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)

> +{
> +	return spacemit_i2c_xfer(adapt, msgs, num, false);
> +}
> +
> +static int spacemit_i2c_pio_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> +{
> +	return spacemit_i2c_xfer(adapt, msgs, num, true);
> +}
> +
>  static u32 spacemit_i2c_func(struct i2c_adapter *adap)
>  {
>  	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
>  }
>  
>  static const struct i2c_algorithm spacemit_i2c_algo = {
> -	.xfer = spacemit_i2c_xfer,
> +	.xfer = spacemit_i2c_int_xfer,
> +	.xfer_atomic = spacemit_i2c_pio_xfer,
I'd suggest to align with core function's prototype,
s/spacemit_i2c_int_xfer/spacemit_i2c_xfer/
s/spacemit_i2c_pio_xfer/spacemit_i2c_pio_xfer_atomic /

>  	.functionality = spacemit_i2c_func,
>  };
>  
> 
> -- 
> 2.51.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
