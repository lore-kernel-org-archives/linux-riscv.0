Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99B5E77188
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jan 2025 00:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Yxc7kw/L90ji7FHq8FjrnO6N76gUdvdm8qPp5HjU5w=; b=QaUXa0BzLc5lgM
	HdUKkj3ELCSAcR0lNoLjRoRtk9uCgGHfwoJY9OpYNwBdir2iNR+17fTIRB46VyeOxGc11jivwxaim
	M6vXarjArayrBVe2OCqzJKUduoq/uRJjnkMxjD1B04tFbciM58hohyZREkAiH+ZYteHn9DHJWSIWO
	B1bmk6M0XtwSDbF1wg69yUmYVqF0EyGYvFY2QHjyN2yF+iikyEeaWr2JQiG8Oe6if5T3cvgOxE20P
	TWgoGBAZUM9VP2TN6YqqXloUwSa8kPb2rmWmxegTlAGOsl1oVsACKWAZLymMUQSXlyZdLSTf0Xugo
	E+awfA84VaX6BkJSmsbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTs7c-0000000EGPL-26Ti;
	Sat, 04 Jan 2025 00:34:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTs7a-0000000EGOy-0BU1
	for linux-riscv@lists.infradead.org;
	Sat, 04 Jan 2025 00:34:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A6975C5AD6;
	Sat,  4 Jan 2025 00:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6301DC4CEDD;
	Sat,  4 Jan 2025 00:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735950869;
	bh=JyOjKY01QW89CaP9/VHAV66mQRhkVQ7WCxYyIWeMNYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgU7JcGZROq6/EaqCU/7jbf21jPsAD09TJzcaUu1RH74OPaBJGcjcTIudvAsv+d5g
	 ys6AfxGPwTH0vIrkfGYz1r/QGx59tL8Kro3m12ZPFMq9I2PPI7wD8FoSVFUX6B1jZU
	 D9lXGgktGn5r/5301AYA+rvcQ2ntbxuIuCAHqHm6sgJDfDl2csYdli3osQDyVnOUOZ
	 Ch7gGzpz+N6s9pC6Py4kKIXeX7r8Lv9zrBDsY3m5N9V2AxdTF/Somg9bO613v0y+yO
	 o2st3LHEb6BQhNJAF5kay3zvbDy5mzYK/taPmGuAftvfMi0wZnZe3uMKvVclhrGnSK
	 zkfTovajh3AKA==
Date: Sat, 4 Jan 2025 01:34:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <mwpaontcdzmzwjay66cqknkxv4xzv364d4vm433pazajhbu2si@epzgjj77clrj>
References: <20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com>
 <20241125-k1-i2c-master-v4-2-0f3d5886336b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241125-k1-i2c-master-v4-2-0f3d5886336b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_163430_178962_6703377B 
X-CRM114-Status: GOOD (  28.51  )
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

sorry for having kept this patch unanswered for so long. I had a
quick look and I have a few comments through the lines.

...

> +config I2C_K1
> +	tristate "Spacemit K1 I2C adapter"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on OF
> +	help
> +	  This option enables support for the I2C interface on the Spacemit K1
> +	  platform.
> +
> +	  If you enable this configuration, the kernel will include support for
> +	  the I2C adapter specific to the Spacemit K1 platform. This driver ca

/ca/can/

> +	  be used to manage I2C bus transactions, which are necessary for
> +	  interfacing with I2C peripherals such as sensors, EEPROMs, and other
> +	  devices.
> +
> +	  This driver can also be compiled as a module. If you choose to build
> +	  it as a module, the resulting kernel module will be named `i2c-k1`.
> +	  Loading this module will enable the I2C functionality for the K1
> +	  platform dynamically, without requiring a rebuild of the kernel.

This last paragraph contains more information than necessary,
please check other similar cases and keep the same format.

(E.g.: "This driver can also be built as a module.  If so, the
module will be called i2c-ali1563.". People know already what
compiling as module means :-)).

>  config I2C_KEBA
>  	tristate "KEBA I2C controller support"
>  	depends on HAS_IOMEM

...

> +/* spacemit i2c registers */
> +#define ICR          0x0		/* Control Register */
> +#define ISR          0x4		/* Status Register */
> +#define ISAR         0x8		/* Slave Address Register */
> +#define IDBR         0xc		/* Data Buffer Register */
> +#define ILCR         0x10		/* Load Count Register */
> +#define IWCR         0x14		/* Wait Count Register */
> +#define IRST_CYC     0x18		/* Bus reset cycle counter */
> +#define IBMR         0x1c		/* Bus monitor register */
> +#define IWFIFO       0x20		/* Write FIFO Register */
> +#define IWFIFO_WPTR  0x24		/* Write FIFO Write Pointer Register */
> +#define IWFIFO_RPTR  0x28		/* Write FIFO Read Pointer Register */
> +#define IRFIFO       0x2c		/* Read FIFO Register */
> +#define IRFIFO_WPTR  0x30		/* Read FIFO Write Pointer Register */
> +#define IRFIFO_RPTR  0x34		/* Read FIFO Read Pointer Register */

Please do use a prefix for all the defines here, e.g. SPACEMINT_

...

> +static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> +{
> +	unsigned long time_left;
> +
> +	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
> +		i2c->cur_msg = i2c->msgs + i2c->msg_idx;
> +		i2c->msg_buf = i2c->cur_msg->buf;
> +		i2c->err = 0;
> +		i2c->status = 0;
> +		i2c->unprocessed = i2c->cur_msg->len;
> +
> +		reinit_completion(&i2c->complete);
> +
> +		spacemit_i2c_start(i2c);
> +
> +		time_left = wait_for_completion_timeout(&i2c->complete,
> +							i2c->adapt.timeout);
> +		if (unlikely(time_left == 0)) {

no need for unlikely here.

> +			dev_alert(i2c->dev, "msg completion timeout\n");

dev_alert is a bit too much, please use dev_err instead.

> +			spacemit_i2c_bus_reset(i2c);
> +			spacemit_i2c_reset(i2c);
> +			return -ETIMEDOUT;
> +		}

...

> +static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 val;
> +	/*
> +	 * send transaction complete signal:
> +	 * error happens, detect master stop
> +	 */
> +	if (likely(i2c->err || (i2c->status & SR_MSD))) {

I don't see a need for likely here.

> +		/*
> +		 * Here the transaction is already done, we don't need any

...

> +	ret = spacemit_i2c_xfer_msg(i2c);
> +	if (unlikely(ret < 0)) {
> +		dev_dbg(i2c->dev, "i2c transfer error\n");
> +		/* timeout error should not be overridden, and the transfer
> +		 * error will be confirmed by err handle function latter,
> +		 * the reset should be invalid argument error.
> +		 */

Please fix the commenting style (refer to
Documentation/process/coding-style.rst).

Besides, please, do not shorten words (err instead of error), we
are not in urge to save comment space. Please reword this comment
to be understood.

> +		if (ret != -ETIMEDOUT)
> +			ret = -EINVAL;

why do we need to change to -EINVAL? Doesn't seem like a good
practice

> +	}
> +
> +	return ret;
> +}

...

> +	spacemit_i2c_disable(i2c);
> +
> +	if (unlikely((ret == -ETIMEDOUT || ret == -EAGAIN)))

is unlikely necessary? What if ret has a different value?

Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
