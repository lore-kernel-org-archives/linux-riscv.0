Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161CFC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 22:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJE9uy8r+Z/1G6sV3hfj3EJ0TY8L9uqQLMaow7jlMd8=; b=tiW+iOaoWLGeD0
	qoBY1LUVNd+FrxnDD15T1aIJSKAHkrvvOvTF3PRWVh9+mVLROTbaA10TG76OZxAv1n394wTANj+yq
	5tN2b7rMCEl6EStC90KcwjcAl/r0+mz6EfpWLBGJvglBlFpLcSHFa5lrHgLU/fi4YCP74xtbpb8uq
	fn5Ee+4T1zZ6OAMfDtWu8A70gjZW7sXkVVqiMUC8AUvhIXJ9KqeGSwlH88DTKUycnv+Eog/aFDiIL
	nbNPVzLpdbJARYGw3DaxnkzvnDWy5Xmo1qQP5gMKRwFa1o3c26jWxhwGUCySKXnDBLqqNra28m/cg
	ZrH6xkb7uRNJtQdvvAEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tufJx-00000007Erl-0vsz;
	Tue, 18 Mar 2025 22:22:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufGB-00000007ELg-2fLn
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 22:18:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 047AC6159C;
	Tue, 18 Mar 2025 22:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9084CC4CEDD;
	Tue, 18 Mar 2025 22:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742336286;
	bh=VbNEyiFb42dykONAQYZYl+nQcsnE1mAUqffA8yPifhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QCQr2q/MUEILNanpc8aWLzKftqMlokcYhAxBD0E1xT0SNEJQ78K18BGWhCvIln4Uf
	 G3vbOK83DWIVaBX4FxK7mavcanSGvi9YlJV0GyUzvcDjDc/28xNWU+aKdMojZ9tWJM
	 14UbaVSVPhuS6WPpd5mI2sKNE0yIN2TodRRl0yiBOYHO6EjOUUXW3Ue6xHyhPTzZsQ
	 ZtCjC73WRR8wO0BsoKZIR/rSVgkraVnnqTd5977ZEX69dZaDP/x20IHDQxO/aSkNYr
	 yyqq5vlKDPcYYUsIfb6VNC0gFryUN0xexA6xIfh72LJ+ipOpBwYK2P4PqQpUXF2JqY
	 8I9OfL4AF7gzg==
Date: Tue, 18 Mar 2025 23:18:01 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v7 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <na4oeypp3a3qfaolhzvmj5b4s24zbgaq4vwsvm4wf2mefpcney@wuzszlh4ct3o>
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
 <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
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

the driver looks good, I just have a few neetpicks to point out,
that, along with Alex last comments, makes the v8 a good
candidate to be sent.

We still have time, to get this merged in this release cycle.

...

> +enum spacemit_i2c_state {
> +	STATE_IDLE,
> +	STATE_START,
> +	STATE_READ,
> +	STATE_WRITE,

Can you please use the SPACEMIT prefix for these enume?

> +};

...

> +static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 val;
> +
> +	/*
> +	 * Unmask interrupt bits for all xfer mode:
> +	 * bus error, arbitration loss detected.
> +	 * For transaction complete signal, we use master stop
> +	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
> +	 */
> +	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> +
> +	/*
> +	 * Unmask interrupt bits for interrupt xfer mode:
> +	 * DBR RX full.
> +	 * For tx empty interrupt SPACEMIT_CR_DTEIE, we only
> +	 * need to enable when trigger byte transfer to start
> +	 * data sending.

Can you please rephrase this sentence to something more
understandable?

> +	 */
> +	val |= SPACEMIT_CR_DRFIE;
> +
> +	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> +		val |= SPACEMIT_CR_MODE_FAST;
> +
> +	/* disable response to general call */
> +	val |= SPACEMIT_CR_GCD;
> +
> +	/* enable SCL clock output */
> +	val |= SPACEMIT_CR_SCLE;
> +
> +	/* enable master stop detected */
> +	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
> +
> +	writel(val, i2c->base + SPACEMIT_ICR);
> +}
> +
> +static inline void
> +spacemit_i2c_clear_int_status(struct spacemit_i2c_dev *i2c, u32 mask)
> +{
> +	writel(mask & SPACEMIT_I2C_INT_STATUS_MASK, i2c->base + SPACEMIT_ISR);
> +}
> +
> +static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 slave_addr_rw, val;

please don't use the word "slave_*", use "target_*, instead,
that's the new standard. Unless it aligns with the datasheets,
but that's not the case.

> +	struct i2c_msg *cur_msg = i2c->msgs + i2c->msg_idx;
> +
> +	i2c->read = !!(cur_msg->flags & I2C_M_RD);

...

> +static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> +{
> +	unsigned long time_left;

you can move this declaration inside the for loop.

> +	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
> +		struct i2c_msg *msg = &i2c->msgs[i2c->msg_idx];
> +

...

> +static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 val;
> +
> +	/*
> +	 * send transaction complete signal:

nit: /send/Send/

> +	 * error happens, detect master stop
> +	 */
> +	if (!(i2c->status & (SPACEMIT_SR_ERR | SPACEMIT_SR_MSD)))
> +		return;

...

> +static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
> +{
> +	unsigned long timeout;
> +	int idx = 0, cnt = 0;
> +
> +	while (idx < i2c->msg_num) {
> +		cnt += (i2c->msgs + idx)->len + 1;
> +		idx++;
> +	}

nit: with a for loop you would save the brackets and the idx
initialization.

> +
> +	/*
> +	 * multiply by 9 because each byte in I2C transmission requires

nit: /multiply/Multiply/

> +	 * 9 clock cycles: 8 bits of data plus 1 ACK/NACK bit.
> +	 */
> +	timeout = cnt * 9 * USEC_PER_SEC / i2c->clock_freq;
> +
> +	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 10) / i2c->msg_num;
> +}
> +
> +static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> +{
> +	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
> +	int ret;
> +
> +	i2c->msgs = msgs;
> +	i2c->msg_num = num;
> +
> +	spacemit_i2c_calc_timeout(i2c);
> +
> +	spacemit_i2c_init(i2c);
> +
> +	spacemit_i2c_enable(i2c);
> +
> +	ret = spacemit_i2c_wait_bus_idle(i2c);
> +	if (!ret)
> +		spacemit_i2c_xfer_msg(i2c);
> +
> +	if (ret < 0)
> +		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
> +	else if (ret)
> +		spacemit_i2c_check_bus_release(i2c);

Nit: this can all be:

	if (!ret)
		...
	else if (ret < 0)
		...
	else
		...

> +
> +	spacemit_i2c_disable(i2c);
> +
> +	if (ret == -ETIMEDOUT || ret == -EAGAIN)
> +		dev_alert(i2c->dev, "i2c transfer failed, ret %d err 0x%lx\n",
> +			  ret, i2c->status & SPACEMIT_SR_ERR);

dev_alert? Is it that bad? Let's use dev_err() instead.

> +
> +	return ret < 0 ? ret : num;
> +}

...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
