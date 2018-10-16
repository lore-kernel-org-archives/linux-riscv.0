Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE9EC04EBD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 06:28:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79DF5208B3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 06:28:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oEKvcWQD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="oYqQ++nn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79DF5208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+QMrZRNTo5cC6NLTGHmOUogfCrFvVqvHu8Wfrznjz08=; b=oEKvcWQDCapaTHozGema8irlo
	VS6DFKnnUcy4+uVGJClYVITjH0CiDelMgsYYbhYJ2+yivTg4tdM2LyFgbYsvDoC1PErLow5B7+Z5u
	N1fE4Rg7bzfQXTbh+lULfXaMIeP2D2XXhyH/DcqBSjbAZfttx3QtDuNj/tx2wZ3kexICXCBkqEldv
	tvgEI6teTq/o9H0Mii8jOgRjovN3a6E8IG1NvTYJ5pWJqHIUqiGb/jqxd2mPNFm1E69e74ibxjjHY
	mU5LVrXh/0eWbNIMELXsem9JloU4d2nl6v1lZM1h5cD0WHbUAig5yIjOzjfNDWRHl/fjmakerNlzO
	LtGGlqR/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCIq4-0005rt-Jl; Tue, 16 Oct 2018 06:28:20 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCIq1-0005py-Ma
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 06:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1539671297; x=1571207297;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=u4tpebrrl/VBApdlfjTqTVktEETMmv+8uOZOVHOZvLM=;
 b=oYqQ++nnfeX7Y4C23xKW/sIjw8/tKLyd8vQ/H8zRJvw1lsrDbxNnAM8G
 VEp8HJacV5xpqP//VW3EUTil2Xu5gl+i+Xj/PivXfUyPMlwIPYQa7MZ60
 LpqftAmEDZbSLiCP0VIQR7I+VoqoFkK+5Y2hRwJIBfhoH+CmuyoOovoOu
 feK3rx9FXN2kpGa6/OuMgluRIbmzIbWNIS9EEoxWHwJzpHzC2jee9vPfq
 l62qUFmlDyTtw1ksHx8Zn8YgiSkaO+JFz/0W2NLAcHiSN1W9VVQg75WCy
 6Cli6J6u3j2MBbRxjk+u6y5/mfzVmEPqqxqFad/4ch+CXLwjAEOVZt0fS A==;
X-IronPort-AV: E=Sophos;i="5.54,387,1534780800"; d="scan'208";a="92036392"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Oct 2018 14:28:06 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 15 Oct 2018 23:13:15 -0700
Received: from 3k26jc2.ad.shared (HELO [10.86.52.227]) ([10.86.52.227])
 by uls-op-cesaip01.wdc.com with ESMTP; 15 Oct 2018 23:28:05 -0700
Subject: Re: [RFC 2/4] pwm: sifive: Add a driver for SiFive SoC PWM
To: Christoph Hellwig <hch@infradead.org>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-3-git-send-email-atish.patra@wdc.com>
 <20181010131128.GA29142@infradead.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <39685c1b-46cf-9e78-c9aa-46168627053f@wdc.com>
Date: Mon, 15 Oct 2018 23:28:04 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181010131128.GA29142@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_232817_775884_D3679972 
X-CRM114-Status: GOOD (  18.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Wesley Terpstra <wesley@sifive.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016062804.F8RYeSveWtrMhbh07EGtD8UoKtxExUkBVzn4vRP6xcg@z>

On 10/10/18 6:11 AM, Christoph Hellwig wrote:
> Thanks for getting these drivers submitted upstream!
> 
> I don't really know anything about PWM, so just some random nitpicking
> below..
> 
>> +	iowrite32(frac, pwm->regs + REG_PWMCMP0 + (dev->hwpwm * SIZE_PWMCMP));
> 
> * already has a higher precedence than +, so no need for the inner
> braces.
> 
>> +	duty = ioread32(pwm->regs + REG_PWMCMP0 + (dev->hwpwm * SIZE_PWMCMP));
> 
> Same here.

Will remove the braces in both places.
> 
>> +	/* (1 << (16+scale)) * 10^9/rate = real_period */
> 	unsigned long scalePow = (pwm->approx_period * (u64)rate) / 1000000000;
> 
> no camcel case, please.

My bad. I will fix that.

> 
>> +	int scale = ilog2(scalePow) - 16;
>> +
>> +	scale = clamp(scale, 0, 0xf);
> 
> Why not:
> 
> 	int scale = clamp(ilog2(scale_pow) - 16, 0, 0xf);
> 

Sure.

>> +static int sifive_pwm_clock_notifier(struct notifier_block *nb,
>> +				     unsigned long event, void *data)
>> +{
>> +	struct clk_notifier_data *ndata = data;
>> +	struct sifive_pwm_device *pwm = container_of(nb,
>> +						     struct sifive_pwm_device,
>> +						     notifier);
> 
> I don't think there are any guidlines, but I always prefer to just move
> the whole container_of onto a new line:
> 
> 	struct sifive_pwm_device *pwm =
> 		container_of(nb, struct sifive_pwm_device, notifier);

Done.

Regards,
Atish
> 
>> +static struct platform_driver sifive_pwm_driver = {
>> +	.probe = sifive_pwm_probe,
>> +	.remove = sifive_pwm_remove,
>> +	.driver = {
>> +		.name = "pwm-sifivem",
>> +		.of_match_table = of_match_ptr(sifive_pwm_of_match),
>> +	},
>> +};
> 
> What about using tabs to align this a little more nicely?
> 
> static struct platform_driver sifive_pwm_driver = {
> 	.probe			= sifive_pwm_probe,
> 	.remove			= sifive_pwm_remove,
> 	.driver = {
> 		.name		= "pwm-sifivem",
> 		.of_match_table	= of_match_ptr(sifive_pwm_of_match),
> 	},
> };
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
