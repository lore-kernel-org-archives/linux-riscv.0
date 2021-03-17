Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238FEC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 04:21:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B728364F9E
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 04:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B728364F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=we/ZNu/x+MNsYAV8HASQRGuj3F/WhHER341/zSpVk6I=; b=f8rSlG5sLb6cQxWSfxmys4wqU
	TeXG446KYa76FbMgycKzpZiD0YfUOpt9vXxivRUO+5RyUI42hLSd4IQhs7scO1OgOgELyEzc5tPuC
	BpE6Bf1V3hYmCFYlLGt+srWof6Wbeh1oqnxFOLFWtk8t1sJNLI93tMQcEe7Jcsj1S6imeZI7IOIGG
	YIEXB3vt98uN0vT2OvLILRdc2N3g07iB7r5kPnGJ64Tg8Ixwmkt8xG8w71PAkUWYZ74SunBnMa8Tj
	H9koDaHViFBzRI2M+TnMdCBvZ1Khmf1+nMFaQEoOdwee8VHpY9kMxFij/NYxqC5YiRMdK5wusSnRC
	epfi/PB7Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMNgL-002RZL-Fb; Wed, 17 Mar 2021 04:21:17 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMNgF-002RY0-HM
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 04:21:13 +0000
Received: by mail-pj1-x1030.google.com with SMTP id t18so388074pjs.3
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 21:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HXYVxhu43hhLrqEKf+tmf+H4c3fejAv6galOVFdhTig=;
 b=GeZK/PsNwf2tqInzKNFZ6sQ24nmXXE2FaR9oVjuHWl/B8E1NaS0Z6PSgxVLA9DHSQ5
 H7WV8U2xSg7RnZcecjnOHSOFR+y7UfizhYkfAE9mYUvtt0+x2mWD2gXDBFmkReoT2Y5V
 KbiMW3QmEh49zsBnrIWkcWh8Gq+Gmo8wo9dz5UPo5ed7sSyXE13YQORJOb+RamaKZzSP
 2woab18A/AwsQUiLlweRBUdiVc7oHQH0MXG/YH0ySY9d80mR4Dfce7Hi+OGnfxHs6fgI
 WRs6XI5lSVaEk0TbV40AgQPPNsMQufTa46Bij8P86jo4g3w2bjmBdSH9dGL6DrREAtnx
 oPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=HXYVxhu43hhLrqEKf+tmf+H4c3fejAv6galOVFdhTig=;
 b=nmKpMglkdh0uw+Ve6Uxu0oVUrk3FztO51JSibU7wSfsJ9WgrkQWuf4Z+tlFdQpPcw7
 rUu2k9R8PZnxdzxvjlmW2NBxia/F2RSDmzyJFUg2zDM3wvTDQ8nTqoo/vEyu2Dp7R7c0
 J2rdAjPETpqx6lvVQ4Ttu1E1QlHoC3Vs7d/jP9CG8x4yGShlA011affDT6CvlqrN48Cd
 J6m3wnM/rD+CQK4leJiLv/WIT9ynqs1U5Ux9fmCujfkLsPs+52/CNZMbtMxTBn7nkgs8
 hpyaeWb6zlNNIlZgQ+L7Phzmpvy60BXZ3sujhuBxLJffGxugzIpON1kZEdoMIkv2FIrm
 e6/A==
X-Gm-Message-State: AOAM532w9KXIkDX0mknoWJY+Z1Qk35yy0Mnd0Wyq6pEJYyqw+aoWaooc
 oYV8T+LF3nROj+byxaujzD7ZqfhArKPzzQ==
X-Google-Smtp-Source: ABdhPJy2GuwRnJ65RVpPMpBxrmy+WvFjUatwD0BuNKxcxwcCy9wDUAJ647Gic1KOxNO0Q8TU8Mor4Q==
X-Received: by 2002:a17:90a:13c5:: with SMTP id
 s5mr2376241pjf.31.1615954869889; 
 Tue, 16 Mar 2021 21:21:09 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d14sm870413pji.22.2021.03.16.21.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 21:21:09 -0700 (PDT)
Date: Tue, 16 Mar 2021 21:21:09 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Mar 2021 21:20:32 PDT (-0700)
Subject: Re: [PATCH] riscv: Fix compilation error with Canaan SoC
In-Reply-To: <20210311102424.34743-1-damien.lemoal@wdc.com>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-cf63c6e5-9054-458e-b3a9-577ccfc6bd52@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_042111_908412_CBBBA98D 
X-CRM114-Status: GOOD (  15.97  )
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

On Thu, 11 Mar 2021 02:24:24 PST (-0800), Damien Le Moal wrote:
> When CONFIG_SOC_CANAAN is selected, the K210 sysctl driver is always
> compiled. Since this driver early init function calls the function
> k210_clk_early_init() implemented by the K210 clk driver, this driver
> must also always be selected for compilation ot avoid build failures.
>
> Avoid such build failures by always selecting CONFIG_COMMON_CLK and
> CONFIG_COMMON_CLK_K210 when CONFIG_SOC_CANAAN is enabled.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/Kconfig.socs | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 7efcece8896c..e1b2690b6e45 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -31,6 +31,8 @@ config SOC_CANAAN
>  	select SIFIVE_PLIC
>  	select ARCH_HAS_RESET_CONTROLLER
>  	select PINCTRL
> +	select COMMON_CLK
> +	select COMMON_CLK_K210
>  	help
>  	  This enables support for Canaan Kendryte K210 SoC platform hardware.

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
