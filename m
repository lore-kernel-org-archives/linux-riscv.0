Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC165C47076
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 16:52:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5276D613D8
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 16:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5276D613D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8bTVwyhgS+CLJZNwbekRGn+HVnPlpx1voXWz+QwCg4=; b=rU42T8vvWylSmzXstVgZnDlm1o
	xKV5/U3jAY2VoOxVP6Zi/p/TDADFMxoWFaj/Sh/oiywi5XzWvEOkf+ULrYudUfijWzyv4gnoBmtsF
	6qOsfXIgU5ntFSnbQ8iAZMvaVKL3LCfSV9XtASeEnZHJlpBYJmw2ya//8Mg3L39GWoyoES+GgkaKl
	Ow0SzVHxYw0zLhXSycJMHSsWFp2BS1N7jzw5X/K5p90lTgVP2FidSIzrxrVyrk4g4CrB8wO+EvRU4
	/aXF2scI8IC+/KbwQD7eBwOzix9IQRiSgJCMSyLtrME/8DMICXrTX4HONEIHz96K0A8mAaZLaZQ89
	J2tToZsQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk8NY-000LoS-EZ; Fri, 21 May 2021 16:52:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk8NV-000Lnv-5Y
 for linux-riscv@desiato.infradead.org; Fri, 21 May 2021 16:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=fvVKZIh08je3V7R57Yy3qgYSEUd5usbVkYa2j9NtTvI=; b=sfvUZ1qMb2WI9mmV+1gegc9hXB
 Rl3W9CwnXpnsPO35jZjEXe90hgZd2qlz/5NuC6yJkUg9Z1fpUgmPIpdOUGoKgmEt+c8zHHQNNP6oN
 ZXhRZ42YAjAnwBSu7pHK4gLepI83B/vR+zvkbe/ig0kSX6yRcJC2iCq9ore/aPTwGR0PBjeik37Ua
 B0B2mrXYfbMqb6m475PGLFPyx4uoWg1xW3QWo4QZn+K0FGMbx3xYmTtAPPYN2iZ8QFr9qtQpKFJab
 6Wn9WLpSbWz+SlaAWp/GiswH4cs01yvqcopN8UKq0WM10Ow0kKd1Y1Gvy9r4arW86Jpj7BIIB923F
 l49rNiKQ==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk8NS-00HHzR-FJ
 for linux-riscv@lists.infradead.org; Fri, 21 May 2021 16:51:59 +0000
Received: by mail-pf1-x436.google.com with SMTP id e17so4728944pfl.5
 for <linux-riscv@lists.infradead.org>; Fri, 21 May 2021 09:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fvVKZIh08je3V7R57Yy3qgYSEUd5usbVkYa2j9NtTvI=;
 b=ECakFYMpqdrwjwDhbEDysTwyFEuOK4nvyYfIKeZsuiVs8l2bJc6tkJi8nHWIGmGflx
 CClQfiUpo2+cN1aSF8W/R7TAm0W9GeXSCkkky48O5JGYntoxqiTlczoUS9HN0hx23TsA
 4PA6p0YWQYap4vdXyX8XFPn0WkzFIA2NOOox+c874qL7ChxlPH8THgpMQEVv/K1ylIXM
 BcAIcU4sx5g8fStVeQncfvfBHknPd0OOP51PuUjM6KFc6eoYlRMvX+hzYh0wSc/45cdw
 aCdQJVLeh9sdFSaBPQnRQ1YjhXfX/KPt9gZN/553XKKdGHa1cebBYjffkePI36pA6qkd
 QsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fvVKZIh08je3V7R57Yy3qgYSEUd5usbVkYa2j9NtTvI=;
 b=ZbLAnkvhP1X5JATZ7JB+9ytGNc+uLITNokcdmuIXzY1XYSctpKC6nm7sN8VmvYxQ8q
 LaQIjfiPHpSt4gQ+fgrWFk+cn5gtG+arpewY5/sAj5KDfrMDiAFzAfRlcHkykyN0yfo3
 T36Ybaf0DBCrrIDSQym6ZF0GGvTt9swoW00J4nfJb6Fu1qGD0rKjcweohl4W3wQA35Ld
 VAZ3r/YIIU7d/L1bEfFKdlZo1biPm0Dbc8dSkQobgbDafy13s0DPCSUCLJWOoR3vu652
 +udQP/bK7SmkxcOPY2UtK2c2TxbyBhzh9CjiysJ1prplACe1F5KxCdH45pA6cjWIQt0D
 2J0Q==
X-Gm-Message-State: AOAM530t+Ih7RHP5BFQXI5I2YWVB7Ucc4y/Y6iQepwOO1velHXG15Tpz
 ptBItMSDxGTyzTHinD8Wz7jv9BSJxVQ=
X-Google-Smtp-Source: ABdhPJzog69dC6PiYJE/OJf2iYLaUtAZO9F2WqIysgASxjem1UQTGQg7xPYvszEfYAuPlJRBb54fXw==
X-Received: by 2002:aa7:8010:0:b029:254:f083:66fa with SMTP id
 j16-20020aa780100000b0290254f08366famr11332600pfi.17.1621615917028; 
 Fri, 21 May 2021 09:51:57 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id u7sm3580352pjc.16.2021.05.21.09.51.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 09:51:56 -0700 (PDT)
Subject: Re: [PATCH] net: macb: ensure the device is available before
 accessing GEMGXL control registers
To: Zong Li <zong.li@sifive.com>, nicolas.ferre@microchip.com,
 claudiu.beznea@microchip.com, davem@davemloft.net, kuba@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, schwab@linux-m68k.org,
 sboyd@kernel.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 geert@linux-m68k.org, yixun.lan@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20210521124859.101012-1-zong.li@sifive.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b4088995-605e-85ca-2f07-47d2654ac2c8@gmail.com>
Date: Fri, 21 May 2021 09:51:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210521124859.101012-1-zong.li@sifive.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_095158_546275_1F81E447 
X-CRM114-Status: GOOD (  18.13  )
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



On 5/21/2021 5:48 AM, Zong Li wrote:
> If runtime power menagement is enabled, the gigabit ethernet PLL would
> be disabled after macb_probe(). During this period of time, the system
> would hang up if we try to access GEMGXL control registers.
> 
> We can't put runtime_pm_get/runtime_pm_put/ there due to the issue of
> sleep inside atomic section (7fa2955ff70ce453 ("sh_eth: Fix sleeping
> function called from invalid context"). Add the similar flag to ensure
> the device is available before accessing GEMGXL device.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/net/ethernet/cadence/macb.h      | 2 ++
>  drivers/net/ethernet/cadence/macb_main.c | 7 +++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
> index d8d87213697c..acf5242ce715 100644
> --- a/drivers/net/ethernet/cadence/macb.h
> +++ b/drivers/net/ethernet/cadence/macb.h
> @@ -1309,6 +1309,8 @@ struct macb {
>  
>  	u32	rx_intr_mask;
>  
> +	unsigned int is_opened;
> +
>  	struct macb_pm_data pm_data;
>  	const struct macb_usrio_config *usrio;
>  };
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 6bc7d41d519b..e079ed10ad91 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -2781,6 +2781,8 @@ static int macb_open(struct net_device *dev)
>  	if (bp->ptp_info)
>  		bp->ptp_info->ptp_init(dev);
>  
> +	bp->is_opened = 1;
> +
>  	return 0;
>  
>  reset_hw:
> @@ -2818,6 +2820,8 @@ static int macb_close(struct net_device *dev)
>  	if (bp->ptp_info)
>  		bp->ptp_info->ptp_remove(dev);
>  
> +	bp->is_opened = 0;
> +
>  	pm_runtime_put(&bp->pdev->dev);
>  
>  	return 0;
> @@ -2867,6 +2871,9 @@ static struct net_device_stats *gem_get_stats(struct macb *bp)
>  	struct gem_stats *hwstat = &bp->hw_stats.gem;
>  	struct net_device_stats *nstat = &bp->dev->stats;
>  
> +	if (!bp->is_opened)
> +		return nstat;

The canonical way to do this check is to use netif_running(), and not
open code a boolean tracking whether a network device is opened or not.
-- 
Florian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
