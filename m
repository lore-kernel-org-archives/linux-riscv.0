Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A22BCAC5B0
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 01:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCb7L6txeejC6IhPPbREPBb/bQlMx9vwYgeMMF/Dn/0=; b=wzfdCvmiXkXc2K
	UBJFeyP6to6vkOaTbyNKqXTvlPyJzfvsMXnrTPOFQSav0kF5CWwoRIjFFvBKOcMu63w0OC416Z8m1
	DQMNMZk8u2d++fkxO6ihYtoxp16BMJdMuMtgm+HmLXqvz+Jt8TdBEWqGnccD9Dhdj3+47J0adGYMh
	2SrNYJEIZJKPZbySpLdB6gwKrfsrAGDDviRc0OB+CxKxjXu8MkvPI08fn/G/FhlJcsVtMMGTp0FqE
	VbLM6hIvKTwoVgu64K2wHxdOCxLBdmusGXMRnIfTOqE2fxjg9BoZumBfXM2vuiYzNfNdP+ChwuH0o
	7o2A+A7W5Isq1Yoj9q8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3P9D-00000003mua-2YlZ;
	Tue, 30 Sep 2025 01:27:19 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3P9A-00000003mtL-3P2h
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 01:27:18 +0000
Received: from localhost (unknown [116.232.147.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 78C0F335D92;
	Tue, 30 Sep 2025 01:27:13 +0000 (UTC)
Date: Tue, 30 Sep 2025 09:27:02 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3] i2c: spacemit: introduce pio for k1
Message-ID: <20250930012702-GYA1357001@gentoo.org>
References: <20250929-k1-i2c-atomic-v3-1-f7e660c138b6@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250929-k1-i2c-atomic-v3-1-f7e660c138b6@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_182716_879316_BCD771E7 
X-CRM114-Status: GOOD (  34.47  )
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

Hi Troy and I2C maintainer,

one thing I'd raise and seek I2C maintainer's suggestion, should this
driver introduce lock to protect multi context - non-atomic vs atomic vs
interrupt context, more than one i2c clients contend single controller?

On 14:07 Mon 29 Sep     , Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changes in v3:
> - drop 1-5 patches (have been merged)
> - modify commit message
> - use readl_poll_timeout_atomic() in wait_pio_xfer()
> - use msecs_to_jiffies() when get PIO mode timeout value
> - factor out transfer state handling into spacemit_i2c_handle_state().
> - do not disable/enable the controller IRQ around PIO transfers.
> - consolidate spacemit_i2c_init() interrupt setup
> - rename is_pio -> use_pio
> - rename spacemit_i2c_xfer() -> spacemit_i2c_xfer_common()
> - rename spacemit_i2c_int_xfer() -> spacemit_i2c_xfer()
> - rename spacemit_i2c_pio_xfer() -> spacemit_i2c_pio_xfer_atomic()
> - call spacemit_i2c_err_check() in wait_pio_xfer() when write last byte
> - Link to v2: https://lore.kernel.org/r/20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com
> 
> Changes in v2:
> - Patch 1/6:
>   Patch 3/6:
>   Patch 4/6:
>     - nothing
> - Patch 2/6:
>   - remove is_pio judgement in irq_handler()
> - Patch 5/6:
>   - fix wrong comment
>   - In spacemit_i2c_conditionally_reset_bus(), once the condition is met inside the loop, it should
>     return directly instead of using break.
> - Patch 6/6:
>   - add is_pio judgement in irq_handler()
>   - use a fixed timeout value when PIO
>   - use readl_poll_timeout() in  spacemit_i2c_wait_bus_idle() when PIO
> 
> - Link to v1: https://lore.kernel.org/r/20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com
> ---
>  drivers/i2c/busses/i2c-k1.c | 206 ++++++++++++++++++++++++++++++++++----------
>  1 file changed, 161 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 6b918770e612e098b8ad17418f420d87c94df166..21c5dd56e71f5e59434767329fb84d50d5c04178 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -97,6 +97,9 @@
>  
>  #define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
>  
[snip]..

> +static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c);
> +static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c);
please sort to avoid this kind declaration, if it's inevitable, 
you can move to top, before the function, after macro 

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
this is hard to read
		mask = SPACEMIT_SR_IRF | SPACEMIT_SR_ITE;
		if ((i2c->status & mask) == 0)
		..
> +			continue;
> +
> +		spacemit_i2c_handle_state(i2c);
> +
> +		/*
> +		 * This is the last byte to write of the current message.
> +		 * If we do not wait here, control will proceed directly to start(),
> +		 * which would overwrite the current data.
> +		 */
> +		if (!i2c->read && !i2c->unprocessed) {
> +			ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> +							i2c->status, i2c->status & SPACEMIT_SR_ITE,
> +							30, 1000);
> +			if (ret)
> +				return 0;
> +			/*
> +			 * In read mode, err_check() in handle_state properly handles what happens
> +			 * after the MSD bit is set. For writes it is different: in interrupt mode,
> +			 * an ITE (write-empty) interrupt is triggered after the last byte, and the
> +			 * MSD-related handling takes place there. In PIO mode, however, we need to
> +			 * explicitly call err_check() to emulate this step, otherwise the next
> +			 * transfer will fail.
> +			 */
> +			spacemit_i2c_err_check(i2c);
> +		}
> +	}
> +
> +	if (i2c->unprocessed)
> +		return 0;
> +
> +	return 1;
> +}
> +
>  static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>  {
>  	unsigned long time_left;
> @@ -310,10 +376,16 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>  
>  		reinit_completion(&i2c->complete);
>  
> -		spacemit_i2c_start(i2c);
..
> +		if (i2c->use_pio) {
> +			spacemit_i2c_start(i2c);
> +
> +			time_left = spacemit_i2c_wait_pio_xfer(i2c);
> +		} else {
> +			spacemit_i2c_start(i2c);
> +			time_left = wait_for_completion_timeout(&i2c->complete,
> +								i2c->adapt.timeout);
> +		}
suggest to distill a common function spacemit_i2c_wait_xfer_complete()
and converge above if/elselogic inside, which is more readable

>  
> -		time_left = wait_for_completion_timeout(&i2c->complete,
> -							i2c->adapt.timeout);
>  		if (!time_left) {
>  			dev_err(i2c->dev, "msg completion timeout\n");
..
>  			spacemit_i2c_conditionally_reset_bus(i2c);
btw, not introduced in this patch, spacemit_i2c_reset() followed unconditionally after
spacemit_i2c_conditionally_reset_bus() which is very confusing

please double check the logic


> @@ -341,6 +413,9 @@ static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
>  
>  static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
>  {
> +	if (!(i2c->status & SPACEMIT_SR_ITE))
> +		return;
> +
>  	/* if transfer completes, SPACEMIT_ISR will handle it */
>  	if (i2c->status & SPACEMIT_SR_MSD)
>  		return;
[snip]..
>  
> -static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> +static inline int
> +spacemit_i2c_xfer_common(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num, bool use_pio)
>  {
>  	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
>  	int ret;
>  
> +	i2c->use_pio = use_pio;
> +
>  	i2c->msgs = msgs;
>  	i2c->msg_num = num;
>  
..
> -	spacemit_i2c_calc_timeout(i2c);
> +	if (!i2c->use_pio)
> +		spacemit_i2c_calc_timeout(i2c);
> +	else
> +		i2c->adapt.timeout = msecs_to_jiffies(SPACEMIT_WAIT_TIMEOUT);
suggest merge "if else" into spacemit_i2c_calc_timeout(), same as previous suggestion
>  
>  	spacemit_i2c_init(i2c);
>  
>  	spacemit_i2c_enable(i2c);
>  
> +	/* To avoid being affected by the state of the previous transfer */
> +	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> +
I've not see my previous comment has been addressed!

>  	ret = spacemit_i2c_wait_bus_idle(i2c);
>  	if (!ret) {
>  		ret = spacemit_i2c_xfer_msg(i2c);
> @@ -506,11 +611,21 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
>  
>  	if (ret == -ETIMEDOUT || ret == -EAGAIN)
>  		dev_err(i2c->dev, "i2c transfer failed, ret %d err 0x%lx\n",
> -			  ret, i2c->status & SPACEMIT_SR_ERR);
> +			ret, i2c->status & SPACEMIT_SR_ERR);
>  
have to say, I personally don't like those unrelated changes, which
makes people review the patch even difficult
>  	return ret < 0 ? ret : num;
>  }
>  
> +static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> +{
> +	return spacemit_i2c_xfer_common(adapt, msgs, num, false);
> +}
> +
> +static int spacemit_i2c_pio_xfer_atomic(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> +{
> +	return spacemit_i2c_xfer_common(adapt, msgs, num, true);
> +}
> +

atomic API should not call sleepable function, please check this
spacemit_i2c_pio_xfer_atomic() -> 
  spacemit_i2c_xfer_common() -> 
    spacemit_i2c_xfer_msg() -> 
      spacemit_i2c_conditionally_reset_bus() -> 
        usleep_range()
    spacemit_i2c_check_bus_release() -> 
      usleep_range()

they are in err handle path, but still need to take care with caution


-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
