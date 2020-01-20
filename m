Return-Path: <SRS0=JNpN=3J=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B96C33CA1
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2020 09:10:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 149662077C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2020 09:10:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kzjb1kF9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8JoobvH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 149662077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:
	References:In-Reply-To:Subject:To:From:Date:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n2WYF7K/zdDWIboGc7AnAgFinjHk/RRv8sNL2PVTa8Q=; b=Kzjb1kF93W01UQJNn29jSYckG
	1zPwO6viGjApZ2cQ4rjZb0WbsTsJnywJABdCYwXnRsuKkqK18H89dBFmZtIOWagYByq2rZq4YCFaj
	jTu6gLhRu1Ix2Ztt+x0V5FjKa63K9UFODq8CzLdTx1GH+1/LA4wbEefqNUNBqeTlVlmmHkfDi2wDT
	rU+GnHeFwbwf3iXvAtTk/+HTvl11NfB3yjoiNqmlagl6j58KFOQmNPWJfhMXRJcD4sZWBXbXoD2ql
	gHJ/VopP31suEnYMRIW2/WQKxVxJ5oQbyANO+2LUJ4K4nUmSiMZp6aFZQwBGH4gg4+2cT7tHCqnCe
	x+9MgAU1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itT4J-0002EG-8f; Mon, 20 Jan 2020 09:09:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itT4D-0002DV-Qf
 for linux-riscv@lists.infradead.org; Mon, 20 Jan 2020 09:09:58 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A67020684;
 Mon, 20 Jan 2020 09:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579511393;
 bh=vbAaO1LjWMydY+UDit/LOlD+QdhAMjmRUBC6/xTciUI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z8JoobvHuhNgmbrbIoqg/RNLpNLhodMK2TnkhVzBAaozj7wRwet84iBLCdbKiu68V
 JTPENT7TvgZv0pRxV3YVp4G79sL4cu+peo64P9DRY6axIzHnliS19t4ctptG/k6BU0
 Ae//fG/4yViRpu4zaXyfma5rNZ92GppC49HKsues=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1itT4B-000DhL-KB; Mon, 20 Jan 2020 09:09:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 20 Jan 2020 10:09:51 +0100
From: Marc Zyngier <maz@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v4 0/6] GPIO & Hierarchy IRQ support for HiFive Unleashed
In-Reply-To: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
References: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
Message-ID: <8dcb52c94eb5a585f6cf052c18571805@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: yash.shah@sifive.com, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 tglx@linutronix.de, jason@lakedaemon.net, bmeng.cn@gmail.com,
 atish.patra@wdc.com, sagar.kadam@sifive.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_010953_905770_D629547C 
X-CRM114-Status: GOOD (  18.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 jason@lakedaemon.net, atish.patra@wdc.com, sachin.ghadi@sifive.com,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 bgolaszewski@baylibre.com, robh+dt@kernel.org, palmer@dabbelt.com,
 sagar.kadam@sifive.com, linux-gpio@vger.kernel.org, paul.walmsley@sifive.com,
 tglx@linutronix.de, bmeng.cn@gmail.com, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2019-12-10 12:11, Yash Shah wrote:
> This patch series adds GPIO drivers, DT documentation and DT nodes for
> HiFive Unleashed board. The gpio patches are mostly based on Wesley's 
> patch.
> The patchset also adds hierarchy irq domain support as it is required 
> by this
> gpio driver. It also includes the irqdomain patch to introduce
> irq_domain_translate_onecell() and irq-nvic driver patch to use this 
> newly
> introduced function.
> 
> This patchset is based on Linux 5.4-rc6 and tested on HiFive Unleashed 
> board
> 
> Changes:
> v4 vs v3:
> - Rename the DT yaml document to more standard naming 
> (sifive,gpio.yaml)
> - Drop "clock-names" property from yaml document
> - Add "minItems" to "interrupts" node in yaml
> 
> v3 vs v2:
> - Include patch for irq-nvic driver to use irq_domain_translate_onecell
> - Remove unnecessary inclusion of header files
> - Use a single prefix for all symbols in this driver
> - Rename the "enabled" field of struct sifive_gpio to "irq_state"
> - Remove unused variables and locking from probe()
> - Other minor changes
> 
> v2 vs v1:
> - Add patch to introduce irq_domain_translate_onecell() and use it in
>   the sifive PLIC driver
> - Drop the usage of own locks, instead use internal bgpio_locks
> - Consistently use regmap for register access throughout the gpio code
> - Convert the GPIO DT documentation into a json schema
> - Other minor changes based upon feedback received on v1
> 
> v1 vs RFC:
> Incorporated below changes as suggested by Linus Walleij on RFC version 
> of this
> patchset[0]
> - Dropped PWM patches as they are already merged.
> - Include "GPIO_GENERIC" and "REGMAP_MMIO" in Kconfig select option
> - Remove unwanted inclusion of header files
> - Use regmap MMIO instead of customised sifive_assign_bit()
> - Use GPIOLIB_GENERIC and bgpio_init() to set up the accessors
> - Use hierarchical irqdomain
> 
> [0]
> https://lore.kernel.org/linux-riscv/20181010123519.RVexDppaPFpIWl7QU_hpP8tc5qqWPJgeuLYn0FaGbeQ@z/
> 
> Yash Shah (6):
>   genirq: introduce irq_domain_translate_onecell
>   irqchip: nvic: Use irq_domain_translate_onecell instead of custom 
> func
>   irqchip: sifive: Support hierarchy irq domain
>   gpio: sifive: Add DT documentation for SiFive GPIO
>   gpio: sifive: Add GPIO driver for SiFive SoCs
>   riscv: dts: Add DT support for SiFive FU540 GPIO driver

I've queued the first 5 patches. The last one should go via the
corresponding platform tree.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

