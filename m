Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C729C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 09:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxWoXQvi3/Y3RDRb2zXY2j7sScToxHTijZfy6c1DhNM=; b=Jldq/JJ0Wx2cIj
	843+Dk4UUyhIOYauntz35VKwxOKjbjwSIwfx8zxLO0X3bi6srI2Gv+9B2A/HJtPddKtPDr1VU3NTg
	JB4v5AMKfX1lNYb9PFiQPMnIfMSBCL3OlQaiFn2VvgWIlWgRZTaUZiqK9xsOFOh7ni5Xz1Wn6CRj5
	VJHBH/36S3xh7143SCYxD1QOFlYvc4cI9X8z3TPjFlhDJ1fb4VMbnbv5HrkzrxO7W9zoKxqeBAyr6
	Rd0VehPmd9voTyswhWGX78gVpIvDmfc5YukHWOsOoIQqVQUMyrdW2jCJ005u1HNqr8NOtQnu0JLX3
	/uMWnHQ/Z3Hm5c8/mVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmBAL-009m9d-Mt; Wed, 04 May 2022 09:19:25 +0000
Received: from mail3-163.sinamail.sina.com.cn ([202.108.3.163])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmB7t-009kRk-GE
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 09:16:58 +0000
Received: from unknown (HELO localhost.localdomain)([114.249.57.134])
 by sina.com (172.16.97.27) with ESMTP
 id 62724460000235F9; Wed, 4 May 2022 17:16:18 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 43443549283611
From: Hillf Danton <hdanton@sina.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, daire.mcnamara@microchip.com
Subject: Re: [PATCH v2] i2c: add support for microchip fpga i2c controllers
Date: Wed,  4 May 2022 17:16:22 +0800
Message-Id: <20220504091622.5024-1-hdanton@sina.com>
In-Reply-To: <20220321125855.3227057-1-conor.dooley@microchip.com>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_021653_754301_6F52A7D4 
X-CRM114-Status: GOOD (  11.42  )
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

On Mon, 21 Mar 2022 12:58:56 +0000 Conor Dooley wrote:
> +
> +static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
> +{
> +	u32 status = idev->isr_status;
> +	u8 ctrl;
> +
> +	if (!idev->buf)
> +		return IRQ_NONE;
> +
> +	switch (status) {
> +	case STATUS_M_START_SENT:
> +	case STATUS_M_REPEATED_START_SENT:
> +		ctrl = readb(idev->base + CORE_I2C_CTRL);
> +		ctrl &= ~CTRL_STA;
> +		writeb(idev->addr, idev->base + CORE_I2C_DATA);
> +		writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +		if (idev->msg_len <= 0)
> +			goto finished;
> +		break;
> +	case STATUS_M_ARB_LOST:
> +		idev->msg_err = -EAGAIN;
> +		goto finished;
> +	case STATUS_M_SLAW_ACK:
> +	case STATUS_M_TX_DATA_ACK:
> +		if (idev->msg_len > 0)
> +			mchp_corei2c_fill_tx(idev);
> +		else
> +			goto last_byte;
> +		break;
> +	case STATUS_M_TX_DATA_NACK:
> +	case STATUS_M_SLAR_NACK:
> +	case STATUS_M_SLAW_NACK:
> +		idev->msg_err = -ENXIO;
> +		goto last_byte;
> +	case STATUS_M_SLAR_ACK:
> +		ctrl = readb(idev->base + CORE_I2C_CTRL);
> +		if (idev->msg_len == 1u) {
> +			ctrl &= ~CTRL_AA;
> +			writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +		} else {
> +			ctrl |= CTRL_AA;
> +			writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +		}
> +		if (idev->msg_len < 1u)
> +			goto last_byte;
> +		break;
> +	case STATUS_M_RX_DATA_ACKED:
> +		mchp_corei2c_empty_rx(idev);
> +		break;
> +	case STATUS_M_RX_DATA_NACKED:
> +		mchp_corei2c_empty_rx(idev);
> +		if (idev->msg_len == 0)
> +			goto last_byte;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return IRQ_HANDLED;
> +
> +last_byte:
> +	/* On the last byte to be transmitted, send STOP */
> +	mchp_corei2c_stop(idev);
> +finished:
> +	complete(&idev->msg_complete);
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t mchp_corei2c_isr(int irq, void *_dev)
> +{
> +	struct mchp_corei2c_dev *idev = _dev;
> +	irqreturn_t ret = IRQ_NONE;
> +	u8 ctrl;
> +
> +	ctrl = readb(idev->base + CORE_I2C_CTRL);
> +	if (ctrl & CTRL_SI) {
> +		idev->isr_status = readb(idev->base + CORE_I2C_STATUS);
> +		ret = mchp_corei2c_handle_isr(idev);
> +	}
> +
> +	/* Clear the si flag */
> +	ctrl = readb(idev->base + CORE_I2C_CTRL);
> +	ctrl &= ~CTRL_SI;
> +	writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +
> +	return ret;
> +}
> +
> +static int mchp_corei2c_xfer_msg(struct mchp_corei2c_dev *idev,
> +				 struct i2c_msg *msg)
> +{
> +	u8 ctrl;
> +	unsigned long time_left;
> +
> +	if (msg->len == 0)
> +		return -EINVAL;
> +
> +	idev->addr = i2c_8bit_addr_from_msg(msg);
> +	idev->msg_len = msg->len;
> +	idev->buf = msg->buf;
> +	idev->msg_err = 0;
> +	idev->msg_read = (msg->flags & I2C_M_RD);
> +
> +	reinit_completion(&idev->msg_complete);

Would you specify why you need reinit completion? Is it likely to race
with the complete() above in mchp_corei2c_handle_isr()?

Hillf
> +
> +	mchp_corei2c_core_enable(idev);
> +
> +	ctrl = readb(idev->base + CORE_I2C_CTRL);
> +	ctrl |= CTRL_STA;
> +	writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +
> +	time_left = wait_for_completion_timeout(&idev->msg_complete,
> +						MICROCHIP_I2C_TIMEOUT);
> +	if (!time_left)
> +		return -ETIMEDOUT;
> +
> +	return idev->msg_err;
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
