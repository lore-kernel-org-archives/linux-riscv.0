Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F642C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 18:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpA7Ng6M22Jbx4Pc/DVUiTiZFouuztThVuJRMORCs7M=; b=dfD9diz4auseE3jegwfoHRRLhR
	o4TrYs7/3qmx8RoS8h2OMsT7MmxVH2chWXlA6Wn0vN1icaZII8UB5C9JKFY3oXKT1ntEBKwm3N/WW
	lurqUagWScGtXTanADJZ6DQh+yS2pZnGk/gb0k5lWgw6HZo6PxYL4KMpkinTHLEKbY1Zv+Ht2QP+A
	Dlho5gACPHhXZzUHbly2kY97uL+zpHLUuJSM2TeXemukNoCmaqev+N+1odBHXuGbaAR2o9qOmLlXq
	jizHmxsxVt8O7aJjcbscaZpziaKg9L5D/cOw73gtVEwKo786puw7jBLU7RU1UZzoZQqJD/nbMgdHe
	OofZAk7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1uLA-00HDpB-5W; Mon, 27 Dec 2021 18:03:20 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1uL7-00HDoQ-Gt
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 18:03:18 +0000
Received: by mail-oi1-x232.google.com with SMTP id j124so26413289oih.12
 for <linux-riscv@lists.infradead.org>; Mon, 27 Dec 2021 10:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=estVpf11XBcCHh7/EsEMsmeAZD0WKzbLuknLI7vdHRc=;
 b=LJCpOzkwux2I4nV1n97aB9IUKvSkBGD3iUUD++H9D4mmSZ/D3sOacT6mjhY6fTgku+
 qHvc+fbPOsRqc0bg48tytzE8mIBM2Q1eievS683WX45BEBNPmwnuA5pe50fRib26/BFN
 6/HKVHvFnyD9BYbilNGf8XcOv8n2g3rE/wZ72yP5DmsbxhKomgtiL1oavpxuDRV/nXGy
 Q6fVaDX8ZKPQft53OsOgdJkO9erQ6zljua5QBUUoc8abkqBvgMv6sWSKnVXGfA3hpSaJ
 ONght/mWkC2YAJykH+ajzmQcuI5Eatc2quB10O3MQyTPoCGnzIJ1GaMjmVPuOQo3pET6
 WwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=estVpf11XBcCHh7/EsEMsmeAZD0WKzbLuknLI7vdHRc=;
 b=xNa8ooVsld6VXIobVWUowqE/3wSU3oYRquOsfIa0SzkJ0c/1rO8vSqozmZB5HrIpqS
 ZCSY/63ho6d4yMtVuGRonNfP/G75PRHxEnxprZLQJx+jexWfTeDH9c2b7O5Sde0rWcML
 z4dk6gKmF5dVkO/m1wk0NX4Kv6YdYxl5vJCWF0u/jMku7Pum2FFK0aHhHrJ1r0GS0Cpl
 WqJYln8N29atg1aC/bpyF3PQARgStVBeOa+ryHtDt49eTZCSST4xDm0evdSJLO9OYdkH
 abxao5v21ob3fEQKX63A3W/5u3lsmBmpczYLhW8px0VXFKqOXgMwCI0hLxu/cyv9FCpG
 SqMA==
X-Gm-Message-State: AOAM532vIcgq1pjsc83K5XrgIdwA0LrKKBF6e3voZgQ6YS8z5dLGMyUa
 PdRbhnwl3Dz067szjigY/3k=
X-Google-Smtp-Source: ABdhPJyPWxZ0FYqGXnkAxeGcmPPuoSSaJqXVZdkH1ZvL+v9Ry2ZD/jZglb5h2L0TwG+Cjf13kprmVw==
X-Received: by 2002:a05:6808:554:: with SMTP id
 i20mr14023491oig.51.1640628196494; 
 Mon, 27 Dec 2021 10:03:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f20sm3452616oiw.48.2021.12.27.10.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Dec 2021 10:03:15 -0800 (PST)
To: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann
 <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-26-schnelle@linux.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC 25/32] watchdog: Kconfig: add HAS_IOPORT dependencies
Message-ID: <280c0490-3a68-5498-5751-d53162203b5b@roeck-us.net>
Date: Mon, 27 Dec 2021 10:03:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211227164317.4146918-26-schnelle@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_100317_589614_C80FC392 
X-CRM114-Status: GOOD (  17.27  )
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

On 12/27/21 8:43 AM, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. We thus need to add HAS_IOPORT as dependency for
> those drivers using them.
> 

How is the need for HAS_IOPORT determined, when exactly is it needed,
and when not ?

$ git grep -E "inb|inw" drivers/watchdog/ | cut -f1 -d: | sort -u
drivers/watchdog/acquirewdt.c
drivers/watchdog/advantechwdt.c
drivers/watchdog/cpu5wdt.c
drivers/watchdog/f71808e_wdt.c
drivers/watchdog/ibmasr.c
drivers/watchdog/ie6xx_wdt.c
drivers/watchdog/it8712f_wdt.c
drivers/watchdog/it87_wdt.c
drivers/watchdog/iTCO_vendor_support.c
drivers/watchdog/iTCO_wdt.c
drivers/watchdog/Kconfig
drivers/watchdog/machzwd.c
drivers/watchdog/mixcomwd.c
drivers/watchdog/ni903x_wdt.c
drivers/watchdog/nic7018_wdt.c
drivers/watchdog/nv_tco.c
drivers/watchdog/pc87413_wdt.c
drivers/watchdog/pcwd.c
drivers/watchdog/pcwd_pci.c
drivers/watchdog/sbc60xxwdt.c
drivers/watchdog/sbc7240_wdt.c
drivers/watchdog/sc1200wdt.c
drivers/watchdog/sch311x_wdt.c
drivers/watchdog/smsc37b787_wdt.c
drivers/watchdog/sp5100_tco.c
drivers/watchdog/w83627hf_wdt.c
drivers/watchdog/w83877f_wdt.c
drivers/watchdog/w83977f_wdt.c
drivers/watchdog/wafer5823wdt.c
drivers/watchdog/wdt977.c
drivers/watchdog/wdt.c
drivers/watchdog/wdt_pci.c

Guenter

> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>   drivers/watchdog/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 05258109bcc2..2e87a65bdc8b 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -452,6 +452,7 @@ config 21285_WATCHDOG
>   config 977_WATCHDOG
>   	tristate "NetWinder WB83C977 watchdog"
>   	depends on (FOOTBRIDGE && ARCH_NETWINDER) || (ARM && COMPILE_TEST)
> +	depends on HAS_IOPORT
>   	help
>   	  Say Y here to include support for the WB977 watchdog included in
>   	  NetWinder machines. Alternatively say M to compile the driver as
> @@ -1200,6 +1201,7 @@ config ITCO_WDT
>   	select WATCHDOG_CORE
>   	depends on I2C || I2C=n
>   	depends on MFD_INTEL_PMC_BXT || !MFD_INTEL_PMC_BXT
> +	depends on HAS_IOPORT # for I2C_I801
>   	select LPC_ICH if !EXPERT
>   	select I2C_I801 if !EXPERT && I2C
>   	help
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
