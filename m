Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023EDC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:From:
	Message-Id:Date:Mime-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFuGJuzVF4qXs1k5KGhHj0Y+BEWwEn8fHAN/FkfK1wk=; b=JTC4bGcWqfbKLP
	QcRni7CGmr85MSHMP1eIxDWvgSfL4PZkDmPhT9AZYjZ+coO5XmczYRr4sjjYxZpjhcvRrpxoAJRTZ
	UmdKbE25yflgEAXwqOSJ0MJuftx2guCj/VWCuUCM8lJfeu5lQ9VEKQicjJksIDVylYCiBEmpXan+o
	avfsXImote/a1zuDQPqUwm4KqSXal3BlfZH8x8UG621ocSxqF8be1+oMy6/tiYExkA9NZHX0AliAZ
	lyS58eHoXfcuZBC2ns5jNqIvsexiXjeIz5xoxHx3htAsjvtng7gDMvsXNkxkrAea6AJVZ8ppwDqz+
	YzG+Pp7JK1dlh8Q1u+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCE8-00000008ciD-1fcx;
	Mon, 13 Jul 2026 08:41:24 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCE4-00000008cdt-3jne
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 08:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1783932049;
	bh=sISlYduipxhIC/8+YFu6P/2Jp470bAA+Um+6jp0F3VM=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=Q2J3cJNuxeskSgJ4ev+Wp57H/q3qBNETBzwFBzMXbhK+eMhJXCCcNvNUfE11ERJhq
	 rtB25xb5hQ9XWnD4+gtiTbohT18JBHgHZHPLOzYT5oKtMsTW72NNyzjB4VnFuiyk7j
	 KZeLpCz0xCt+EYTyWxL48gwYWYE/DfF9Ckhl4HWk=
X-QQ-mid: zesmtpsz8t1783932042t6c01fbcf
X-QQ-Originating-IP: Ui0SBaoneSNF3lggyErwuB3eBcdpG+Je/wL+ND5KZrM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 13 Jul 2026 16:40:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 444654458287415658
EX-QQ-RecipientCnt: 9
Mime-Version: 1.0
Date: Mon, 13 Jul 2026 01:40:39 -0700
Message-Id: <DJXB4PDMYX0G.1TC9VBR96MHMA@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Pei Xiao" <xiaopei01@kylinos.cn>, <dlan@kernel.org>,
 <rafael@kernel.org>, <troy.mitchell@linux.spacemit.com>,
 <shuwei.wu@mailbox.org>, <linux-pm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] thermal: spacemit: k1: disable hardware on driver
 remove
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <1db7d94eeaced9a92e3670d28e0c97c22f15f108.1783931396.git.xiaopei01@kylinos.cn>
In-Reply-To: <1db7d94eeaced9a92e3670d28e0c97c22f15f108.1783931396.git.xiaopei01@kylinos.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MLbAtvpy5B1Plu3KWTkfIEgoeZG1t4ROjIB6YgU8CGbGoLp3vDz4h/mf
	cF2w90JzH9VuAPYeGktztKucOaN/xoIl6VP5QFurcULcYodbXc9LVDtAxfH0Odo+JApkHud
	Q0gkLDtRUR0YXGng2Mqbg0iMkM2atOJ0JsDD5Hh+/9dOE9wUJl2PQFDPgf7ti1C9dmc1W9Y
	QhUBl5gNgFJsasxwCaNgOh9Yn2mwn6C5AY0po/DAJ+pMxVJsHCnaam9qSmqO6eMj3QbWa2s
	ZWC/NUQ4kt/p4MqMTK/aiU+5278ey0SwnN+K9eKR8tveZim9kaymJstJjUV8TNCF7FgSdKp
	4BQKWTZa70FsZ5OYtKj3fqfETosCC6zL2U1OD3tl+OK1anh9LvVLdsr+WdoRBL3LCh0kwsk
	ST2MLjA+G9nneKSh9BM8wULy+f6/yesM/KWXKLJnSi4ElICtv9n9xX4wIdy90p+p1gygB2e
	1FjzDxSS7quI/LJuwtpe4U31VxwA5BI8Krp3f7UmN9Y0eQ9tU4QCh8tdnkj4VXf1c9904JS
	OeYJDBnT1t2SEYz3HtCRXhj074hm3SnJKFtYqNTTy/dAphX6RHGGhtD++360YcBUQtkGH5c
	aC9NUMqbz18Cim3Yb8Jvlf5ARuuh/4dy/CCWLrIZ1GgN/EHv3d20qDU6dilPA1kL54U4jyC
	oY4Ejwj02TPUNwXz4IlhqjzI28uXK26/TNy+UXEcptAGfyq78kaytNZz6iSlVCZRrUEOAp/
	8vns698ErXTXcOFz7l+FftJdSGRlz4ZhZXPdEYnRO2hKDZGpwXzVb+cptTFOQ5wC3a/q69M
	t7a7iMc4V9dFtpVZO6M41Z9EjhZTcp5CyR99Ok8Wdl4P+jRnZmS9v87Q9Ep9IGTMnaSNvol
	AgyIHTzUuTkgNv3ARO0zxZWLuLBDHzV3wH0D/TL4Yol8AeRu6xCefjfzqUyVgzufUisyK3R
	6ZtNQpNd6eBexOx7ebmMXwDuZU4xt1In45IcCMU81KGR3MmmH8BMPvqTB3xeOJ6Gmd6BRtN
	jgtZLjBuX368AJRFwPpQ9SMS/R1d0K9dNMHIqHaxsmsna2g1a6
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_014122_242297_483C3325 
X-CRM114-Status: GOOD (  14.06  )
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

On Mon Jul 13, 2026 at 1:32 AM PDT, Pei Xiao wrote:
> The driver uses devm_request_threaded_irq() but never disables the
> hardware interrupt enable, sensor enable, or sensor power bits when
> the driver is unbound.
>
> Add a devm action that clears K1_TSENSOR_INT_EN_REG,
> K1_TSENSOR_EN_ALL, and K1_TSENSOR_PCTRL_ENABLE on remove, mirroring
> what k1_tsensor_init() sets up.
>
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/thermal/spacemit/k1_tsensor.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/thermal/spacemit/k1_tsensor.c b/drivers/thermal/spacemit/k1_tsensor.c
> index 79222d233129..cf79dc7d403f 100644
> --- a/drivers/thermal/spacemit/k1_tsensor.c
> +++ b/drivers/thermal/spacemit/k1_tsensor.c
> @@ -199,6 +199,29 @@ static irqreturn_t k1_tsensor_irq_thread(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static void k1_tsensor_shutdown(struct k1_tsensor *ts)
> +{
> +	u32 val;
> +
> +	/* Disable all interrupts */
> +	writel(0xffffffff, ts->base + K1_TSENSOR_INT_EN_REG);
> +
> +	/* Disable all sensor */
> +	val = readl(ts->base + K1_TSENSOR_EN_REG);
> +	val &= ~K1_TSENSOR_EN_ALL;
> +	writel(val, ts->base + K1_TSENSOR_EN_REG);
> +
> +	/* Power down the sensor module */
> +	val = readl(ts->base + K1_TSENSOR_PCTRL_REG);
> +	val &= ~K1_TSENSOR_PCTRL_ENABLE;
Why is only the ENABLE bit cleared here?
At init time the driver also sets:
    val |= K1_TSENSOR_PCTRL_RAW_SEL |
    K1_TSENSOR_PCTRL_TEMP_MODE |
    K1_TSENSOR_PCTRL_HW_AUTO_MODE |
    K1_TSENSOR_PCTRL_ENABLE;

Should the other bits be cleared in shutdown as well, or is clearing ENABLE
alone?

                            - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
