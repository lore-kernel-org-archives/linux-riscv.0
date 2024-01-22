Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF40EC4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 08:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iiw5fKtYlob3riwiNueo2+oelweObLoFKUlZJbkP9xs=; b=GbI5mMMJ7NDI9w
	GSBilMerE5AS8xPtvJKaPm0H2EFoUzPl+6i4E13Dw+8fP//7LPc7FPMVYIWtfHo83P5aDmkTexEcW
	U5eA5R+Y0AspvMCbqWHGgrQQEs2OzZKAPVTKHD1MSLr4qD2RYBV6w8+9Vq/mq4D3ApLrCb+I06lYM
	WgSJrZ1qOhUOr1U2mbgBXS2DSb/6vaIseKhODRH3kYbbRaWl59wcOGDxWMKOO+i1OJTYNL0vtE+Bq
	eUbJIRi2GsQSFrZ7ZQjl65SjxsgE32EZeXxjFwTw3HgIALnActBPGA+lMhBrOrO78/N+tWQSYt74j
	DRN3UIGkftMv5r4yqL6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpUr-00B0w9-10;
	Mon, 22 Jan 2024 08:17:33 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpUm-00B0uW-0c
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 08:17:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAF611BF20D;
	Mon, 22 Jan 2024 08:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705911443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hftQ/3NQ3SEsGANsB0kuwB+4HmiO86h7hcHpWei/1cY=;
	b=JjuFux0TPgsxBh3Wr7htl8dzLwncaA4+bhaVv9DjNXlLHYsfxKhXWRrYnOqdccPFWYSZU9
	nNFBMmyBIWLVAGLqlnovcDgvQDTpJM4XF9OwsZ4VGK8s21Hkh0zFTCci0aDpFaglnJuBEC
	HXedDV07MNMJl+T0ZqExJpNZsTl2JGDXDarLF/EfYaKCjrxbSyOZmUbgnvFcG7h6ZLXgyo
	3h9D0EZf93N9d8qYXzBYH6pe6s43wiIWp6Ve+iaw0pIPsLYLUneUN1eJcAq8ZdEvk00N54
	BXNp5k31h49FARUEokf7um+pXt69qcw8NRSIwxkTncL9F4XUeiq1dujnyR55rw==
Date: Mon, 22 Jan 2024 09:17:22 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, chao.wei@sophgo.com, unicorn_wang@outlook.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dlan@gentoo.org
Subject: Re: [PATCH v7 2/3] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Message-ID: <20240122081722868bdda5@mail.local>
References: <20240122080631.2880-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240122080631.2880-1-qiujingbao.dlmu@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_001728_400743_D2ECC6D4 
X-CRM114-Status: GOOD (  13.14  )
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

On 22/01/2024 16:06:30+0800, Jingbao Qiu wrote:
> Implement the RTC driver for CV1800, which able to provide time alarm
> and calibrate functionality.
> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> ---
> 
> Depends on https://lore.kernel.org/all/IA1PR20MB4953C774D41EDF1EADB6EC18BB6D2@IA1PR20MB4953.namprd20.prod.outlook.com/

What is the dependency?


Also, please fix the checkpatch.pl --strict warnings

> +/**
> + * cv1800_rtc_32k_coarse_val_calib() - Using an external
> + * clock to coarse calibrate the crystal oscillator
> + * @info: the device of calibrated
> + *
> + * @return 0 on success, or -1 on fail
> + *
> + * This RTC has an independent 32KHz oscillator. However,
> + * the accuracy of this oscillator is easily affected by
> + * external environmental interference,resulting in lower
> + * accuracy than the internal oscillator.Therefore, a 25M
> + * crystal oscillator is used as a reference source to
> + * calibrate the RTC and improve its accuracy.Calibration
> + * is completed through two steps, namely rough calibration
> + * and fine calibration.
> + */
> +static int cv1800_rtc_32k_coarse_val_calib(struct cv1800_rtc_priv *info)

This is still not working as well as you think it is. You should
Implement the offset callbacks instead.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
