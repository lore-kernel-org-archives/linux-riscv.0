Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BBCC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 10:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Message-Id:Date:Mime-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRdfCoX76IhhrbyXLfa2V2zeRzw15oOLNy5zMxflIrA=; b=Ppesz2icMVADvA
	6oP8es7gXN/+DlYDv75tu9YgYFs83tCJDoyKIvNYh3fR6oo+V22vVf75mHvL74Tvb4qurxB4nhfuD
	EnQ4lTFfqzdTLnAuOE28BF1jTn0w8ojhqxfrft/Eb4fxnfyzANpC6je0hhVBm5T4O7/pxEtIYL1zR
	VV3hnJTuc6b2eQQ0kgnISXtHKhCuKU5oEyRSMi4dhSLex5zzYObui9lQNYP5p/6kCxeZENGfnkT8x
	UrPGaGpRqyY+QCyTvim0iw42vGQ4KE9skiW8hck7WG71qSRGNsLtL2WS/OG/Qe9H6IAkOqPD2YrQc
	wVWfHHg/4dgt2p3GsQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaVu-0000000BaOa-36w8;
	Tue, 14 Jul 2026 10:37:22 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaVs-0000000BaOB-0XPR
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 10:37:21 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gzwjR2vkfzKngL;
	Tue, 14 Jul 2026 12:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784025435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1fJftTlqcE8eGqPtuk9WNWMOkdgjG7MBJckMaW+Ctd4=;
	b=yjCk071X+S4HfzaHmqtjhvuSeEbGlGnYTbaY9AzfBzULBfWei2jZwsSwtScHtZ3WtJuVKz
	DkIK3HyDU6JOLOhI+zu/38QN3BeaEX4gHoE7JFTJWPShdJf2WfTm7tiLUtGfmK+cIykg/E
	+e1qlSXSs6GRBYVotVNAa+rO8bq6p4brai7k4VaQsBZW/v2qN7IoMS2bu1hDSXb1AQ3+2C
	13e60lwZYNqxvsr2CY1yxcOpeGQY8KIE+LHGFL0H1mgpaNmTX2jz6sALoSI7j9gSrf+8Ai
	O0G4hwMGpPJy/my2bbXjA8pxRey7qNCUR7Npro88+gpDXPBvIe6r23YgBX2UPQ==
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784025433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1fJftTlqcE8eGqPtuk9WNWMOkdgjG7MBJckMaW+Ctd4=;
	b=V5T5SpTduNeivrpuenzg45SjjTyc8GkSKnn3uTMiGldsqUP9gNRJl0cyId5d+yelfTi6XT
	rPVPXo6uc+6yxydWEMrHqmFOt+4Bx05i+amAk+2zQ6YllKqiWAt3qM05J8thgofCGFxN8x
	Y+BHe4jy2Nurb6fFVRK/JHL8kw+sXEuRtaxTL94eS8ukPBxJ4JtjPsBWE4nftpG6JbgfDU
	7EnIfrppq1zILJ81GDS9DPuvQkidImOdidp6OONjdFJ65eXuHA0RM3Lf8oNTmqYjKJaWfQ
	wBDVophvGdyV1fv1B8Qv8ocj/hJG7lS6twlj7eHIXzZdWnR6COg4o3vygmEjkw==
Date: Tue, 14 Jul 2026 18:36:59 +0800
Message-Id: <DJY88BBD7RCM.20K3BATZ6JIM7@mailbox.org>
Subject: Re: [PATCH] thermal: spacemit: k1: disable hardware on driver
 remove
From: "Shuwei Wu" <shuwei.wu@mailbox.org>
To: "Pei Xiao" <xiaopei01@kylinos.cn>, <dlan@kernel.org>,
 <rafael@kernel.org>, <troy.mitchell@linux.spacemit.com>,
 <shuwei.wu@mailbox.org>, <linux-pm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
References: <1db7d94eeaced9a92e3670d28e0c97c22f15f108.1783931396.git.xiaopei01@kylinos.cn>
In-Reply-To: <1db7d94eeaced9a92e3670d28e0c97c22f15f108.1783931396.git.xiaopei01@kylinos.cn>
X-MBO-RS-META: dawor4uopnap8bhihc8hfk6snj5jbmo4
X-MBO-RS-ID: 9c12ea2705f8e50f429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_033720_475504_736DCC4A 
X-CRM114-Status: GOOD (  27.20  )
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

Hi Pei,

On Mon Jul 13, 2026 at 4:32 PM CST, Pei Xiao wrote:
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
> +	writel(val, ts->base + K1_TSENSOR_PCTRL_REG);
> +}
> +
> +static void devm_k1_tsensor_shutdown(void *data)
> +{
> +	k1_tsensor_shutdown(data);
> +}
> +
>  static int k1_tsensor_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -229,6 +252,10 @@ static int k1_tsensor_probe(struct platform_device *pdev)
>  
>  	k1_tsensor_init(ts);
>  
> +	ret = devm_add_action_or_reset(dev, devm_k1_tsensor_shutdown, ts);
> +	if (ret)
> +		return ret;
> +
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;

Sorry, I missed the hardware cleanup in the original driver.
Thanks for fixing it.

I also found that registering the shutdown action immediately after
k1_tsensor_init() would cause the thermal zones to be released before
the IRQ during devres cleanup. The IRQ thread may then access an
unregistered thermal zone.

I changed the order so that the thermal zones are registered first,
followed by the IRQ and the shutdown action.
On removal, the hardware interrupt is disabled first, then the IRQ
is released, and finally the thermal zones are released.

-> % git --no-pager diff drivers/thermal/spacemit/k1_tsensor.c
diff --git a/drivers/thermal/spacemit/k1_tsensor.c b/drivers/thermal/spacemit/k1_tsensor.c
index 79222d233129..57dbc652a405 100644
--- a/drivers/thermal/spacemit/k1_tsensor.c
+++ b/drivers/thermal/spacemit/k1_tsensor.c
@@ -199,6 +199,32 @@ static irqreturn_t k1_tsensor_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }

+static void k1_tsensor_shutdown(struct k1_tsensor *ts)
+{
+	u32 val;
+
+	/* Disable all interrupts */
+	writel(0xffffffff, ts->base + K1_TSENSOR_INT_EN_REG);
+
+	/* Disable all sensors */
+	val = readl(ts->base + K1_TSENSOR_EN_REG);
+	val &= ~K1_TSENSOR_EN_ALL;
+	writel(val, ts->base + K1_TSENSOR_EN_REG);
+
+	/* Clear the sampling configuration set by k1_tsensor_init(). */
+	val = readl(ts->base + K1_TSENSOR_TIME_REG);
+	val &= ~(K1_TSENSOR_TIME_FILTER_PERIOD |
+		 K1_TSENSOR_TIME_ADC_CNT_RST |
+		 K1_TSENSOR_TIME_WAIT_REF_CNT);
+	writel(val, ts->base + K1_TSENSOR_TIME_REG);
+
+	/* Clear the control bits configured by k1_tsensor_init(). */
+	val = readl(ts->base + K1_TSENSOR_PCTRL_REG);
+	val &= ~(K1_TSENSOR_PCTRL_RAW_SEL |
+		 K1_TSENSOR_PCTRL_TEMP_MODE |
+		 K1_TSENSOR_PCTRL_HW_AUTO_MODE |
+		 K1_TSENSOR_PCTRL_ENABLE);
+	writel(val, ts->base + K1_TSENSOR_PCTRL_REG);
+}
+
+static void devm_k1_tsensor_shutdown(void *data)
+{
+	k1_tsensor_shutdown(data);
+}
+
 static int k1_tsensor_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -229,34 +255,48 @@ static int k1_tsensor_probe(struct platform_device *pdev)

 	k1_tsensor_init(ts);

-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	ret = devm_request_threaded_irq(dev, irq, NULL,
-					k1_tsensor_irq_thread,
-					IRQF_ONESHOT, "k1_tsensor", ts);
-	if (ret < 0)
-		return ret;
-
 	for (i = 0; i < MAX_SENSOR_NUMBER; ++i) {
 		ts->ch[i].id = i;
 		ts->ch[i].ts = ts;
 		ts->ch[i].tzd = devm_thermal_of_zone_register(dev, i, ts->ch + i, &k1_tsensor_ops);
-		if (IS_ERR(ts->ch[i].tzd))
-			return PTR_ERR(ts->ch[i].tzd);
+		if (IS_ERR(ts->ch[i].tzd)) {
+			ret = PTR_ERR(ts->ch[i].tzd);
+			goto err_shutdown;
+		}

 		/* Attach sysfs hwmon attributes for userspace monitoring */
 		ret = devm_thermal_add_hwmon_sysfs(dev, ts->ch[i].tzd);
 		if (ret)
 			dev_warn(dev, "Failed to add hwmon sysfs attributes\n");
+	}

-		k1_tsensor_enable_irq(ts->ch + i);
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0) {
+		goto err_shutdown;
 	}

+	ret = devm_request_threaded_irq(dev, irq, NULL,
+					k1_tsensor_irq_thread,
+					IRQF_ONESHOT, "k1_tsensor", ts);
+	if (ret < 0)
+		goto err_shutdown;
+
+	ret = devm_add_action_or_reset(dev, devm_k1_tsensor_shutdown, ts);
+	if (ret)
+		return ret;
+
+	/* Enable interrupts only after all zones and the handler are ready. */
+	for (i = 0; i < MAX_SENSOR_NUMBER; ++i)
+		k1_tsensor_enable_irq(ts->ch + i);
+
 	platform_set_drvdata(pdev, ts);

 	return 0;
+
+err_shutdown:
+	k1_tsensor_shutdown(ts);
+	return ret;
 }

 static const struct of_device_id k1_tsensor_dt_ids[] = {

-- 
Best regards,
Shuwei Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
