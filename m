Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DA8C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 06:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KV8td7CQ+kdMcpAmxNBG05K4mXYcil8DzUvYY2SSheY=; b=B37wn/o+//IXgn
	peJfogZOIyXakvQDSj8PGqOlBXkbBqV5K0kfBT0YgpBHfmV8Z2/O7nAjVnUAU3r1g5uvEFHRp4s+l
	+WEHpiu9+ZkfzQohUxO0GtNgTMSMJ89RQN5mICmYPaZ4lYqlnBaTg1NQiZT+CPrxQZJ6r5l6gJWG/
	+cE/vD3YAoVoZnPiX64tGMgyo/FxXmlbbQOw9BnugTnqKtaEsAwbhwnHx3lSUmpbetMYin3TPjEP8
	L/CPyiCRkebkeic9NWrPi+w550TL97LYN0dfrJORGWXO3kQXMlhymf81qeYyYvNW+25FjbW4aDZYF
	cH2BxC4s2/Y83QDeqLxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8tV-0000000CAP0-0Vpn;
	Thu, 19 Jun 2025 06:37:05 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8Yd-0000000C8Wx-0ZVS
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 06:15:33 +0000
Received: from [192.168.33.139] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowACHONf6qlNoGg+LBw--.43032S2;
	Thu, 19 Jun 2025 14:15:23 +0800 (CST)
Message-ID: <acac9522-fb19-4659-8e1a-544bf75f3864@iscas.ac.cn>
Date: Thu, 19 Jun 2025 14:15:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] regulator: spacemit: support SpacemiT P1 regulators
To: Alex Elder <elder@riscstar.com>, lee@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-4-elder@riscstar.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250613210150.1468845-4-elder@riscstar.com>
X-CM-TRANSID: qwCowACHONf6qlNoGg+LBw--.43032S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4xXF1xZFWktr1DKr18Grg_yoW8Ww1UpF
	s0vr9xCr1ktFWrur4xur9Fy3W5W3Z3XasrAry8Jw45W3yDCF1xZr4DtF43ZF1kZrn5Gr12
	934kuF4xWFnxWrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxUB1SrDUUUU
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_231531_555891_56F631ED 
X-CRM114-Status: GOOD (  12.30  )
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

On 6/14/25 05:01, Alex Elder wrote:
> <snip>
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 6d8988387da45..7bb7b8fad24f2 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1384,6 +1384,15 @@ config REGULATOR_SLG51000
>  	  The SLG51000 is seven compact and customizable low dropout
>  	  regulators.
>  
> +config REGULATOR_SPACEMIT_P1
> +	tristate "SpacemiT P1 regulators"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	default ARCH_SPACEMIT
> +	help
> +	  Enable support for regulators implemented by the SpacemiT P1
> +	  power controller.  The P1 implements 6 high-efficiency buck
> +	  converters and 12 programmable LDO regulators.
Needs module name in help text, as is the case with spacemit-pmic.
> +
>  config REGULATOR_STM32_BOOSTER
>  	tristate "STMicroelectronics STM32 BOOSTER"
>  	depends on ARCH_STM32 || COMPILE_TEST
>
> <snip>
>
> +static struct platform_driver p1_regulator_driver = {
> +	.probe = p1_regulator_probe,
> +	.driver = {
> +		.name = "spacemit-p1-regulator",
> +	},
> +};
> +
> +module_platform_driver(p1_regulator_driver);
> +
> +MODULE_DESCRIPTION("SpacemiT P1 regulator driver");
> +MODULE_LICENSE("GPL");

If this driver is compiled as a module, it needs to be found by modalias
so the driver auto-loads after spacemit-pmic registers the regulator
device, so you need:

+MODULE_ALIAS("platform:spacemit-p1-regulator");

Also, consider extracting the name to a macro:

#define DRV_NAME "spacemit-p1-regulator"

Also, consider naming this consistently: "spacemit-p1", or
"spacemit-p1-regulator"?

Regards,
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
