Return-Path: <SRS0=Oyqu=FB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2D9C3E8C5
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2020 18:46:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AFFB21D7F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2020 18:46:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d7LhfLcN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AFFB21D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d70zRJPK4T5/Qg5OD/z7xZp+Egrxq/73Q4d70WCBffc=; b=d7LhfLcNYfIpB1Z5cRht69hdC
	U58Z8q8kQa2WCDfkNkD2vMx7kaLzZlNsPIiLQ5neEqVnljSUrR2y6T7NbSrpRq/j6L+POjMJ47KFk
	Ap22hyILvVyl5m/dMXcJdo2qs7AATGe6edLgqCGtOpTvgMODQy581dVWwom3S4UeGBK/HriFH6zcj
	eodFueT/kDJ2UMw1jOFJ4BkelW3cOm6MnkaksdbI1i7TcOMd0tlQFWlmkPCFaqpFcRlVamexnZmft
	tTRqFGewjQ4mcLjHn1CDn2BTeKZCuiAl+jKkqJODs2sAwD7JT434+krtjuviRfm2odTZWSk5njk5f
	RHJevzRag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiikh-0000xQ-Mf; Fri, 27 Nov 2020 18:45:51 +0000
Received: from [2601:1c0:6280:3f0::cc1f]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiike-0000vy-Et; Fri, 27 Nov 2020 18:45:48 +0000
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <20201127183003.2849-1-info@metux.net>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ba756539-2435-3587-3aeb-31e7ce95aad7@infradead.org>
Date: Fri, 27 Nov 2020 10:45:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127183003.2849-1-info@metux.net>
Content-Language: en-US
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
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org, bgolaszewski@baylibre.com,
 linux-riscv@lists.infradead.org, jasowang@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/27/20 10:30 AM, Enrico Weigelt, metux IT consult wrote:
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 5d4de5cd6759..e8414d82cf75 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1613,4 +1613,13 @@ config GPIO_MOCKUP
>  	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
>  	  it.
>  
> +config GPIO_VIRTIO
> +	tristate "VirtIO GPIO support"
> +	depends on VIRTIO
> +	help
> +	  Say Y here to enable guest support for virtio based GPIOs.

	                                         virtio-based

> +
> +	  These virtual gpios can be routed to real GPIOs or attached to

	                GPIOs

> +	  simulators on the host (qemu).
> +
>  endif


-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
