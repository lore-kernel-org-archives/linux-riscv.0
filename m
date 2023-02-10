Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C25DC636CD
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 15:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mYwaZm8SB1vg2/eOPUpm7oLYjsnmDFrqppqC3q0R9f4=; b=IQjPtGqu0cq0TL
	w4zh8e0gqIuKIX7/5PzjtLc4dD8/6oqLG+CZl+zGQ3+PKc1fWCTqujtTcHzusIh2rgKQrlsQIqwOo
	USbQu9F4RrkA+1volwMX2uVgpfNz71JArHNXcqapj1G6JeoQD6lbUc9hOXWoQVk/mChNtX2rZAkQy
	2ze5GTdVeOt4naSneV/EHg2uVHPPIGN8fn/VbpG/mwG2vSLer7IgpC0dQ4E2LRH/J9Q267xMTh9nO
	XRJ791s7I2l/mvSUPHZwjtfdaLZWEpFbFovjcynv+cfR5OOkLAWjDPV+R68ge2J/lO6hngYal3XaD
	b+/M4eqeJE3Fc6FmvDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQVKH-006LKM-F1; Fri, 10 Feb 2023 15:28:37 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQVKD-006LH3-1J
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 15:28:35 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-16aaa20f516so7135528fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Feb 2023 07:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9hVlPe6eJuNFcNFFfLabGm+E19dcSTToLIMGVvbXQT4=;
        b=knlC8WzdrM/m+aS0ypSlu3cSKtJRHjQV63Bd4AUvQDADk5tAA69DFKVPfxX64FG9dr
         OUxbAR/GHmcxaqX/NDk8dfC/xkQBhpElTCweaD88AHi1gDlQywT6wlsLnpwUH3EHWmtN
         hZVWOYdxSQ0j3noNiOG/v99wBcLMkBEvQDihEhAYfI7K+QiM+k2TP9hMw7+QjOkIdZls
         7riK1kAy/JtjEKfFaVpDXkIF8H9VpOMuVL1eICK0jFGCFxl+woDgir07I9A67HsdQhzn
         wC/+YPuZBvd7kCyfuXaANBxeV5UVL01A/ceg7opO/A2Y4RES6IZLl6q3WnFMHQiRrVJc
         5Qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hVlPe6eJuNFcNFFfLabGm+E19dcSTToLIMGVvbXQT4=;
        b=Wv0QOFSG2n8GTjwntvuXczdRF+oQYKsZVHGl5he6iayVCMOectza2ipMx9jLys/BWh
         LKLBdMtZzEhL87d1al/w0qVLaRK91w5SS8/mcquB1m35OKs9jfFHs6dnJiMdn06VSiWF
         J6U+5Mu/jbmWDq1C1y6XgYB+UE+xfcXOmtk0/VmvE0tpp29EMhHNieL4Tp771YKStBF2
         XtFnevxPb5RRZVrTMzvyJ3/3iramsqwJ4QXpilR1lhk3TWRXkFpPHZcGmPY+ix6huOcJ
         Dq6THroRt2qVDbTeOoiZrmM4CODSW4DPvTucme35RoZpL/PUhCsslE7QuR66ZmUU4seX
         oxFQ==
X-Gm-Message-State: AO0yUKW3+h2n6w2r+rJ4Pvrnu73zsOoulZYNyIAbEwtpP0jJLheUoiIl
	eRHcI+7vVfZdumb2UCNnhTc=
X-Google-Smtp-Source: AK7set+LobSO3egjDr5FecVn4QDlPWobGrRvafyWYi36GTE4G99DwPOP03YbIaL2mFkuOGcxF7eqfQ==
X-Received: by 2002:a05:6870:c148:b0:169:c54d:f069 with SMTP id g8-20020a056870c14800b00169c54df069mr8281713oad.26.1676042904162;
        Fri, 10 Feb 2023 07:28:24 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h43-20020a056870172b00b001676a4dc22bsm1946836oae.58.2023.02.10.07.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 07:28:22 -0800 (PST)
Message-ID: <690da4a4-b4df-f316-e948-38c857237095@roeck-us.net>
Date: Fri, 10 Feb 2023 07:28:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org
References: <20221219094233.179153-1-xingyu.wu@starfivetech.com>
 <20221219094233.179153-3-xingyu.wu@starfivetech.com>
 <20230201224619.GA3194283@roeck-us.net>
 <8feda5d9-8510-acbf-1ec2-3a0e67df0adc@starfivetech.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/3] drivers: watchdog: Add StarFive Watchdog driver
In-Reply-To: <8feda5d9-8510-acbf-1ec2-3a0e67df0adc@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_072833_131363_B55145C0 
X-CRM114-Status: GOOD (  48.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/9/23 23:01, Xingyu Wu wrote:
> On 2023/2/2 6:46, Guenter Roeck wrote:
>> On Mon, Dec 19, 2022 at 05:42:32PM +0800, Xingyu Wu wrote:
>>> Add watchdog driver for the StarFive JH7110 SoC.
>>>
>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>
>> This driver is almost impossible for me to review. There is a lot of code
>> which doesn't make sense to me. I'll outline some of it below, but this is
>> by far not a complete review.
> 
> Thanks for your review. It is enough complete and useful.
> 
>>
>>> [...]
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/err.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/io.h>
>>> +#include <linux/iopoll.h>
>>> +#include <linux/module.h>
>>> +#include <linux/moduleparam.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/reset.h>
>>> +#include <linux/reset-controller.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/timer.h>
>>> +#include <linux/types.h>
>>> +#include <linux/uaccess.h>
>>> +#include <linux/watchdog.h>
>>
>> Several of those include files are unnecessary.
> 
> Will drop it.
> 
>>
>>> [...]
>>> +
>>> +static bool nowayout = WATCHDOG_NOWAYOUT;
>>> +static int tmr_margin;
>>> +static int tmr_atboot = STARFIVE_WDT_ATBOOT;
>>> +static int soft_noboot;
>>> +
>>> +module_param(tmr_margin, int, 0);
>>> +module_param(tmr_atboot, int, 0);
>>> +module_param(nowayout, bool, 0);
>>> +module_param(soft_noboot, int, 0);
>>> +
>>> +MODULE_PARM_DESC(tmr_margin, "Watchdog tmr_margin in seconds. (default="
>>> +		 __MODULE_STRING(STARFIVE_WDT_DEFAULT_TIME) ")");
>>
>> Use "timeout" or "heartbeat".
> 
> Will fix.
> 
>>
>>> +MODULE_PARM_DESC(tmr_atboot,
>>> +		 "Watchdog is started at boot time if set to 1, default="
>>> +		 __MODULE_STRING(STARFIVE_WDT_ATBOOT));
>>
>> Use "early_enable"
> 
> Will fix.
> 
>>
>>> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>>> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>>> +MODULE_PARM_DESC(soft_noboot,
>>> +		 "Watchdog action, set to 1 to ignore reboots, 0 to reboot (default 0)");
>>
>> I do not understand what this module parameter is supposed to be used for,
>> and what the "soft_' prefix is supposed to mean.
> 
> This 'soft_noboot' means watchdog reset enabled status. If 'soft_noboot' is set to 1,
> it means reset is disabled and do not reboot.Or 'reboot_disbled' instead?
> 

That means it does nothing ? Why load the watchdog in the first place then ?

>>
>>> [...]
>>> +#ifdef CONFIG_OF
>>> +/* Register bias in JH7110 */
>>> +static const struct starfive_wdt_variant drv_data_jh7110 = {
>>> +	.control = STARFIVE_WDT_JH7110_CONTROL,
>>> +	.load = STARFIVE_WDT_JH7110_LOAD,
>>> +	.enable = STARFIVE_WDT_JH7110_CONTROL,
>>> +	.value = STARFIVE_WDT_JH7110_VALUE,
>>> +	.int_clr = STARFIVE_WDT_JH7110_INTCLR,
>>> +	.unlock = STARFIVE_WDT_JH7110_LOCK,
>>> +	.unlock_key = STARFIVE_WDT_JH7110_UNLOCK_KEY,
>>> +	.irq_is_raise = STARFIVE_WDT_JH7110_IMS,
>>> +	.enrst_shift = STARFIVE_WDT_JH7110_RESEN_SHIFT,
>>> +	.en_shift = STARFIVE_WDT_JH7110_EN_SHIFT,
>>> +};
>>> +
>>> +static const struct of_device_id starfive_wdt_match[] = {
>>> +	{ .compatible = "starfive,jh7110-wdt", .data = &drv_data_jh7110 },
>>> +	{}
>>> +};
>>> +MODULE_DEVICE_TABLE(of, starfive_wdt_match);
>>> +#endif
>>> +
>>> +static const struct platform_device_id starfive_wdt_ids[] = {
>>> +	{
>>> +		.name = "starfive-jh7110-wdt",
>>> +		.driver_data = (unsigned long)&drv_data_jh7110,
>>
>> This will fail to compile if CONFIG_OF=n.
> 
> Will drop '#ifdef CONFIG_OF'.
> 
>>
>>> +	},
>>> +	{}
>>> +};
>>> +MODULE_DEVICE_TABLE(platform, starfive_wdt_ids);
>>> +
>>> +static int starfive_wdt_get_clock_rate(struct starfive_wdt *wdt)
>>> +{
>>> +	if (!IS_ERR(wdt->core_clk)) {
>>> +		wdt->freq = clk_get_rate(wdt->core_clk);
>>
>> wdt->freq can at least in theory be 0, which would
>> result in a zero-divide crash later on.
> 
> Will add a check whether rate is 0 to avoid zero-divide crash.
> 
>>
>>> +		return 0;
>>> +	}
>>> +	dev_err(wdt->dev, "get clock rate failed.\n");
>>> +
>>> +	return -ENOENT;
>>
>> The above code can not be reached.
>>
>>> +}
>>> +
>>> +static int starfive_wdt_enable_clock(struct starfive_wdt *wdt)
>>> +{
>>> +	int ret = 0;
>>> +
>>> +	wdt->apb_clk = devm_clk_get_enabled(wdt->dev, "apb");
>>> +	if (IS_ERR(wdt->apb_clk)) {
>>> +		dev_err(wdt->dev, "failed to get and enable apb clock.\n");
>>> +		ret = PTR_ERR(wdt->apb_clk);
>>> +		return ret;
>>> +	}
>>> +
>>> +	wdt->core_clk = devm_clk_get_enabled(wdt->dev, "core");
>>> +	if (IS_ERR(wdt->core_clk)) {
>>> +		dev_err(wdt->dev, "failed to get and enable core clock.\n");
>>> +		ret = PTR_ERR(wdt->core_clk);
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int starfive_wdt_reset_init(struct starfive_wdt *wdt)
>>> +{
>>> +	int ret = 0;
>>> +
>>> +	wdt->rsts = devm_reset_control_array_get_exclusive(wdt->dev);
>>> +	if (!IS_ERR(wdt->rsts)) {
>>
>> Error handling should come first, and return immediately.
> 
> Will change the order and return error first.
> 
>>
>>> +		ret = reset_control_deassert(wdt->rsts);
>>> +		if (ret)
>>> +			dev_err(wdt->dev, "failed to deassert rsts.\n");
>>> +	} else {
>>> +		dev_err(wdt->dev, "failed to get rsts error.\n");
>>> +		ret = PTR_ERR(wdt->rsts);
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> [...]
>>> +
>>> +/* interrupt status whether has been raised from the counter */
>>> +static bool starfive_wdt_raise_irq_status(struct starfive_wdt *wdt)
>>> +{
>>> +	return !!readl(wdt->base + wdt->drv_data->irq_is_raise);
>>> +}
>>> +
>>> +static void starfive_wdt_int_clr(struct starfive_wdt *wdt)
>>> +{
>>> +	writel(STARFIVE_WDT_INTCLR, wdt->base + wdt->drv_data->int_clr);
>>> +}
>>
>> There is no explanation for this interrupt handling (or, rather,
>> non-handling since there is no interrupt handler. What is the purpose
>> of even having all this code ?
> 
> Because the watchdog raise an interrupt signal on the hardware when timeout,
> although we do not use interrupt handler on the sorfware, but the watchdog
> initialization or reload also need to clear the hardware interrupt signal.
> 

That should be documented.

>>
>>> [...]
>>> +
>>> +static unsigned int starfive_wdt_max_timeout(struct starfive_wdt *wdt)
>>> +{
>>> +	return DIV_ROUND_UP(STARFIVE_WDT_MAXCNT, wdt->freq) - 1;
>>> +}
>>
>> For a frequency of 1 MHz, this results in a maximum timeout of 4294.
>>
>> This value is then used in starfive_wdt_set_timeout(), but as
>> (4294 * 1000000) / 2, which is then again compared against
>> STARFIVE_WDT_MAXCNT. Somewhere this calculation is wrong.
> 
> Modify to 'DIV_ROUND_UP(STARFIVE_WDT_MAXCNT, (wdt->freq / 2)) - 1'.
> 
>>
>> [...]
>>> +
>>> +static int starfive_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>>> +				void *data)
>>> +{
>>> +	struct starfive_wdt *wdt = watchdog_get_drvdata(wdd);
>>> +
>>> +	spin_lock(&wdt->lock);
>>> +	starfive_wdt_unlock(wdt);
>>> +	/* disable watchdog, to be safe */
>>> +	starfive_wdt_disable(wdt);
>>> +
>>> +	if (soft_noboot)
>>> +		starfive_wdt_disable_reset(wdt);
>>> +	else
>>> +		starfive_wdt_enable_reset(wdt);
>>> +
>>
>> This is a _restart_ handler. Disabling it doesn't make any sense.
> 
> Will drop 'starfive_wdt_disable_reset(wdt)' part.
> 
>>
>>> +	/* put native values into count */
>>> +	starfive_wdt_set_count(wdt, wdt->count);
>>> +
>>> +	/* set the watchdog to go and reset */
>>> +	starfive_wdt_int_clr(wdt);
>>> +	starfive_wdt_enable(wdt);
>>> +
>>> +	starfive_wdt_lock(wdt);
>>> +	spin_unlock(&wdt->lock);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int starfive_wdt_set_timeout(struct watchdog_device *wdd,
>>> +				    unsigned int timeout)
>>> +{
>>> +	struct starfive_wdt *wdt = watchdog_get_drvdata(wdd);
>>> +
>>> +	unsigned long freq = wdt->freq;
>>> +	unsigned int count;
>>> +
>>> +	spin_lock(&wdt->lock);
>>> +
>>> +	if (timeout < wdt->wdt_device.min_timeout)
>>> +		return -EINVAL;
>>
>> This is checked by the watchdog core.
> 
> Will drop it.
> 
>>
>>> +
>>> +	/*
>>> +	 * This watchdog takes twice timeouts to reset.
>>> +	 * In order to reduce time to reset, should set half count value.
>>> +	 */
>>> +	count = timeout * freq / 2;
>>> +
>>> +	if (count > STARFIVE_WDT_MAXCNT) {
>>
>> count is an unsigned int, which is pretty much everywhere a 32-bit
>> value. STARFIVE_WDT_MAXCNT is 0xffffffff. How is an unsigned integer
>> ever supposed to be larger than 0xffffffff ?
>>
>>> +		dev_warn(wdt->dev, "timeout %d too big,use the MAX-timeout set.\n",
>>> +			 timeout);
>>> +		timeout = starfive_wdt_max_timeout(wdt);
>>> +		count = timeout * freq;
>>
>> This is confusing. First, the timeout range is checked by the calling code,
>> which makes sure it is never larger than max_timeout. max_timeout is
>> set to the value returned by starfive_wdt_max_timeout().
>> Thus, count = timeout * freq / 2 will _never_ be larger than
>> STARFIVE_WDT_MAXCNT. Even if it ever was, it doesn't make sense
>> to use a count value of timeout * freq in that case, ie a value which
>> could be twice as large as the supposed maximum value.
> 
> Change 'count' type to 'u64'. And if 'count' is larger than STARFIVE_WDT_MAXCNT,
> 'count' is equal to STARFIVE_WDT_MAXCNT. Does that seem OK?
> 

That would not change anything. This is not about overflows; I would
have mentioned that. count can still never be larger than STARFIVE_WDT_MAXCNT.
Please do the math.

>>
>>> +	}
>>> +
>>> +	dev_info(wdt->dev, "Heartbeat: timeout=%d, count/2=%d (%08x)\n",
>>> +		 timeout, count, count);
>>
>> No. Drop such noise. Make it a debug message if you think you need it.
> 
> Will modify it to 'dev_dbg'.
> 
>>
>>> +
>>> +	starfive_wdt_unlock(wdt);
>>> +	starfive_wdt_disable(wdt);
>>> +	starfive_wdt_set_reload_count(wdt, count);
>>> +	starfive_wdt_enable(wdt);
>>> +	starfive_wdt_lock(wdt);
>>> +
>>> +	wdt->count = count;
>>> +	wdd->timeout = timeout;
>>> +
>>> +	spin_unlock(&wdt->lock);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +#define OPTIONS (WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE)
>>> +
>>> +static const struct watchdog_info starfive_wdt_ident = {
>>> +	.options = OPTIONS,
>>> +	.firmware_version = 0,
>>
>> It is not necessary to initilize a static variable with 0.
> 
> Will drop '0'.
> 
>>
>>> +	.identity = "StarFive Watchdog",
>>> +};
>>> +
>>> +static const struct watchdog_ops starfive_wdt_ops = {
>>> +	.owner = THIS_MODULE,
>>> +	.start = starfive_wdt_start,
>>> +	.stop = starfive_wdt_pm_stop,
>>> +	.ping = starfive_wdt_keepalive,
>>> +	.set_timeout = starfive_wdt_set_timeout,
>>> +	.restart = starfive_wdt_restart,
>>> +	.get_timeleft = starfive_wdt_get_timeleft,
>>> +};
>>> +
>>> +static const struct watchdog_device starfive_wdd = {
>>> +	.info = &starfive_wdt_ident,
>>> +	.ops = &starfive_wdt_ops,
>>> +	.timeout = STARFIVE_WDT_DEFAULT_TIME,
>>> +};
>>> +
>>> +static inline const struct starfive_wdt_variant *
>>> +starfive_wdt_get_drv_data(struct platform_device *pdev)
>>> +{
>>> +	const struct starfive_wdt_variant *variant;
>>> +
>>> +	variant = of_device_get_match_data(&pdev->dev);
>>> +	if (!variant) {
>>> +		/* Device matched by platform_device_id */
>>> +		variant = (struct starfive_wdt_variant *)
>>> +			   platform_get_device_id(pdev)->driver_data;
>>> +	}
>>> +
>>> +	return variant;
>>> +}
>>> +
>>> +static int starfive_wdt_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	struct starfive_wdt *wdt;
>>> +	int started = 0;
>>
>> What is this variable supposed to be used for ? It is alway 0.
> 
> This variable is used to switch for debugging whether to allow the watchdog
> to be started at boot time by driver. I think I should remove it.
> 
>>
>>> [...]
>>> +
>>> +	if (tmr_atboot && started == 0) {
>>> +		starfive_wdt_start(&wdt->wdt_device);
>>> +	} else if (!tmr_atboot) {
>>> +		/*
>>> +		 *if we're not enabling the watchdog, then ensure it is
>>> +		 * disabled if it has been left running from the bootloader
>>> +		 * or other source.
>>> +		 */
>>> +		starfive_wdt_stop(&wdt->wdt_device);
>>
>> If it _is_ running from the boot loader, the watchdog core is not
>> informed about it. If it is started here, it is not informed either.
>> This is unusual and will need to be explained.
>> Why ?
> 
> Is is okay to remove the 'started'?
> 
Yes, though of course it would be better if the watchdog is kept running
in that situation and the watchdog core is informed about it. Also,
the watchdog core is still not informed that the watchdog is running
(i.e., WDOG_HW_RUNNING is not set) when it is explicitly started.

>>
>>> +	}
>>> +
>>> +#ifdef CONFIG_PM
>>> +	clk_disable_unprepare(wdt->core_clk);
>>> +	clk_disable_unprepare(wdt->apb_clk);
>>> +#endif
>>
>> I do not understand the above code. Why stop the watchdog if CONFIG_PM
>> is enabled, even if it is supposed to be running ?
> 
> There misses a check about 'early_enable' and add 'if (!early_enable)'.
> There means that disable clock when watchdog sleep and CONFIG_PM is enable.
> Then enable clock when watchdog work by 'starfive_wdt_runtime_resume' function.
> 

I am quite sure that you are supposed to use pm functions for that purpose,
such as pm_runtime_get_sync(), pm_runtime_put_sync(), and pm_runtime_enable(),
similar to the code in omap_wdt.c.

>>
>>> +
>>> +	platform_set_drvdata(pdev, wdt);
>>> +
>>> +	return 0;
>>> +
>>> +err_clk_disable:
>>> +	clk_disable_unprepare(wdt->core_clk);
>>> +	clk_disable_unprepare(wdt->apb_clk);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int starfive_wdt_remove(struct platform_device *dev)
>>> +{
>>> +	struct starfive_wdt *wdt = platform_get_drvdata(dev);
>>> +
>>> +	starfive_wdt_mask_and_disable_reset(wdt, true);
>>> +	watchdog_unregister_device(&wdt->wdt_device);
>>> +
>>> +	clk_disable_unprepare(wdt->core_clk);
>>> +	clk_disable_unprepare(wdt->apb_clk);
>>> +	pm_runtime_disable(wdt->dev);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void starfive_wdt_shutdown(struct platform_device *dev)
>>> +{
>>> +	struct starfive_wdt *wdt = platform_get_drvdata(dev);
>>> +
>>> +	starfive_wdt_mask_and_disable_reset(wdt, true);
>>> +
>>> +	starfive_wdt_pm_stop(&wdt->wdt_device);
>>> +}
>>> +
>>> +#ifdef CONFIG_PM_SLEEP
>>> +static int starfive_wdt_suspend(struct device *dev)
>>> +{
>>> +	int ret;
>>> +	struct starfive_wdt *wdt = dev_get_drvdata(dev);
>>> +
>>> +	starfive_wdt_unlock(wdt);
>>> +
>>> +	/* Save watchdog state, and turn it off. */
>>> +	wdt->reload = starfive_wdt_get_count(wdt);
>>> +
>>> +	starfive_wdt_mask_and_disable_reset(wdt, true);
>>> +
>>> +	/* Note that WTCNT doesn't need to be saved. */
>>> +	starfive_wdt_stop(&wdt->wdt_device);
>>> +	pm_runtime_force_suspend(dev);
>>> +
>>> +	starfive_wdt_lock(wdt);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int starfive_wdt_resume(struct device *dev)
>>> +{
>>> +	int ret;
>>> +	struct starfive_wdt *wdt = dev_get_drvdata(dev);
>>> +
>>> +	starfive_wdt_unlock(wdt);
>>> +
>>> +	pm_runtime_force_resume(dev);
>>> +
>>> +	/* Restore watchdog state. */
>>> +	starfive_wdt_set_reload_count(wdt, wdt->reload);
>>> +
>>> +	starfive_wdt_restart(&wdt->wdt_device, 0, NULL);
>>
>> I do not understand this call. Per its definition it is a restart handler,
>> supposed to restart the hardware. Why would anyone want to restart the
>> system on resume ?
> 
> The watchdog start counting from 'count' to 0 on everytime resume like a restart.
> So I directly use a restart.
> 

That doesn't answer my question. The "restart" callback resets the hardware.
starfive_wdt_restart() is registered as restart handler, and thus expected
to reset the hardware. It it doesn't reset the hardware, it should not
register itself as restart handler. If it does restart the hardware, calling
it on resume would automatically reset the system on each resume.
Something is wrong here, and will have to be fixed.

I _suspect_ that you think that the restart callback is supposed to reset
the watchdog. That would be wrong. It resets (restarts) the hardware,
not the watchdog. Please read Documentation/watchdog/watchdog-kernel-api.rst
if there are questions about this callback.

Thanks,
Guenter

>>
>>> +
>>> +	starfive_wdt_mask_and_disable_reset(wdt, false);
>>> +
>>> +	starfive_wdt_lock(wdt);
>>> +
>>> +	return 0;
>>> +}
>>> +#endif /* CONFIG_PM_SLEEP */
>>> +
>>> +#ifdef CONFIG_PM
>>> +static int starfive_wdt_runtime_suspend(struct device *dev)
>>> +{
>>> +	struct starfive_wdt *wdt = dev_get_drvdata(dev);
>>> +
>>> +	clk_disable_unprepare(wdt->apb_clk);
>>> +	clk_disable_unprepare(wdt->core_clk);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int starfive_wdt_runtime_resume(struct device *dev)
>>> +{
>>> +	struct starfive_wdt *wdt = dev_get_drvdata(dev);
>>> +	int ret;
>>> +
>>> +	ret = clk_prepare_enable(wdt->apb_clk);
>>> +	if (ret) {
>>> +		dev_err(wdt->dev, "failed to enable apb_clk.\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = clk_prepare_enable(wdt->core_clk);
>>> +	if (ret)
>>> +		dev_err(wdt->dev, "failed to enable core_clk.\n");
>>> +
>>> +	return ret;
>>> +}
>>> +#endif /* CONFIG_PM */
>>> +
>>> +static const struct dev_pm_ops starfive_wdt_pm_ops = {
>>> +	SET_RUNTIME_PM_OPS(starfive_wdt_runtime_suspend, starfive_wdt_runtime_resume, NULL)
>>> +	SET_SYSTEM_SLEEP_PM_OPS(starfive_wdt_suspend, starfive_wdt_resume)
>>> +};
>>> +
>>> +static struct platform_driver starfive_wdt_driver = {
>>> +	.probe		= starfive_wdt_probe,
>>> +	.remove		= starfive_wdt_remove,
>>> +	.shutdown	= starfive_wdt_shutdown,
>>> +	.id_table	= starfive_wdt_ids,
>>> +	.driver		= {
>>> +		.name	= "starfive-wdt",
>>> +		.pm	= &starfive_wdt_pm_ops,
>>> +		.of_match_table = of_match_ptr(starfive_wdt_match),
>>> +	},
>>> +};
>>> +
>>> +module_platform_driver(starfive_wdt_driver);
>>> +
>>> +MODULE_AUTHOR("Xingyu Wu <xingyu.wu@starfivetech.com>");
>>> +MODULE_AUTHOR("Samin Guo <samin.guo@starfivetech.com>");
>>> +MODULE_DESCRIPTION("StarFive Watchdog Device Driver");
>>> +MODULE_LICENSE("GPL v2");
> 
> 
> Thank for your review, I will modify this according to your suggestions.
> 
> Best regards,
> Xingyu Wu
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
