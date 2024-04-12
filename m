Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0D7C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 08:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fi8j7Xctk/7b4GnT/OEnxo159/J0Xotf4dWs/kXH6z0=; b=1ihDFYY9EtbeCn
	TMJtFRe4OIF89Q6IoW8L0zjC2rrpIfqrHsbba8tvnEM6KFLxfwUjhemSnEd/EwTGhL6TE23rDpDPx
	fby8ntQLtrDO62ok3O4VjHpmKCOC/YQyBoTFjZ1dP8GTSwAJkrHEjWiejfchJPwMEFmdgT8b0mZ3m
	VjdpzSxINMDTiMZBc4K2AsqMndBdeFtP91o5psB150mkYURhA4m/2OMfAYQYNnwLXbZBvn2T/Cm1I
	Os3ilMSeEbMNqC5z2s7fgarknxZ09hGTs3gIT4ptW9Z93R9qqeFFUBfPa6a93xk35ud5oRYqRp482
	4fG8wbu3h2OS8zWnsDvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCBx-0000000G3qW-0F7R;
	Fri, 12 Apr 2024 08:23:25 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCBu-0000000G3pI-2CQW
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 08:23:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9AB23240002;
	Fri, 12 Apr 2024 08:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712910199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WClP5G2kcne2eneGfMBtJOI0aNW9KDauYWuKR9jT1z4=;
	b=dPKmMVyYATklsYzaKp5rf8tkpd+f8IfUhBwqPg7KpvV0hJVLgglFurhnD9lDD9pp5jb2BJ
	EVpvAgSIhTCZuuB1OvUya3PUnL3Of0JjnBLw65HaPawxCiA9cFsr4TQgKpho7BDCght/0X
	IgyV6JqdpIEKwTiwHRc0jwxsfMpPJAVf/Uq21A5FbA8F5X41Qcm1pCLfK0YQh9Cpvy4GY8
	e9HY7QaJhLZloTZ8GX+53+ZiuS11njbK9QqEATLSLYyPH60o3RVKD20bvNiyoCJlNWVFqx
	aLwOgDa0jeU9IHB/ezZs02Ex1epHDZbeGhMeAqpFfCcm6iPgLyTTWWa0ckt1zA==
Date: Fri, 12 Apr 2024 10:23:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wefu@redhat.com
Cc: jszhang@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, guoren@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/5] drivers/rtc/rtc-xgene: Add prescaler support in APM
 X-Gene RTC driver
Message-ID: <20240412082315682039eb@mail.local>
References: <20240412080238.134191-1-wefu@redhat.com>
 <20240412080238.134191-2-wefu@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412080238.134191-2-wefu@redhat.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_012322_718301_9029D0CB 
X-CRM114-Status: GOOD (  17.16  )
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

On 12/04/2024 16:01:43+0800, wefu@redhat.com wrote:
> From: Wei Fu <wefu@redhat.com>
> 
> This patch add Counter Prescaler support in APM X-Gene RTC driver by
> getting prescaler (Optional) property value from dtb.
> 
> Signed-off-by: Wei Fu <wefu@redhat.com>
> ---
>  drivers/rtc/Kconfig     | 10 ++++++++++
>  drivers/rtc/rtc-xgene.c | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index c63e32d012f2..3a89f1e6095d 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1888,6 +1888,16 @@ config RTC_DRV_XGENE
>  	  This driver can also be built as a module, if so, the module
>  	  will be called "rtc-xgene".
>  
> +config RTC_DRV_XGENE_PRESCALER
> +	bool "Pre-scaler Counter support for APM X-Gene RTC driver"
> +	depends on RTC_DRV_XGENE
> +	depends on ARCH_THEAD
> +	default y
> +	help
> +	  Say Y here if your Soc has Pre-scaler Counter support on rtc-xgene.
> +
> +	  This hardware support can only be found in DW_apb_rtc after v2.06a.
> +

I don't feel like this needs a config option, rather you should have a
proper compatible string that will tell the driver whether the feature
is available.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
