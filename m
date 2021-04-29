Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A0EC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 16:23:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BA9C613F1
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 16:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BA9C613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rr6jzJL6HfWiIIxIewJGfUvq60hAEwiLPzenqKjeIhg=; b=YzdJe13sD3X/msAHirOeu4k80
	IJ2gowZLA0McIcr5JeVn9SvvFZsoT/EjYiYEWDSvbSKc9D98bPpb1ROUJ+scWOCnmehGt/VlNulbb
	ul54cmlAQV0q8xpmLsWHjeXBmabXrHhhumUbfnwWCFeCxQqizinreYamUvwzZ1OkS0nGo1Sg/KWhS
	PRxqx8GHSBmsuZKbJ5S4yGQEBef4wuQNi2rh6nYGZW5s9s0Wg6tAjEbUiRFbHNs46/7blkJqsRC82
	h+ib79J7spHvDMHnc5iWZsEHRMJc7URTCmkOQNaNuOLfJrDi/v7eMqlhy71iKT/V/J0SGW6lAKSAg
	DAutsTsvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc9R6-0062aN-VG; Thu, 29 Apr 2021 16:22:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9R5-0062aE-FG
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 16:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=lS5ui2LIN/jns61jMI+NEmkgbdZa81SaVZHOH40XKMI=; b=EcKv6c4hKKImJDgGzNsdnrSTFm
 HqDnAH1ox/p2SFY1QTrmInVV7u+rVNTaXp2v/eytMWJF2yZwbFZrjhjqFHxpQY6Q3krTuK4ZtBISQ
 Rw27X6tqt5s0lGXJHkOfMyRt3Th/Mqh45r0ORgH+vQaT/hGW/XgwO4P/atKbb0p9kFRXSi70V7OTB
 80lEQfwtv97NraCVhwomLEM79aEYA9Gw++oe+ZF+I3vsFXBMrRgEa3XQ3ksm8tb7QILsUW/vphqIA
 9/LB0uvckasAP8ba3NikA5nU5T94yC0XUNaseLUDxQhKHtb0tvxJt/IbBFr+Fu3dur7ak+seJbdub
 tAJsFsQA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9R2-000l8x-1h
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 16:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1619713360; x=1651249360;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7BcdnZisl7B8/PzFL89x7k4XXNQZrdodFVgVdVog5FU=;
 b=FLDp7iGQyHQFUZ+5R4u5Oj5x+2L5IV6dj57xbWIO/8vx8esP2i+BQ3U8
 +WQykPZwRaaPS+N4Robiu+NYzaEHYjHytRdKyMdW7wzZ8Qf5oW9+DMW+k
 Piv87ywYzvRamLUQPvUGO388A3l7PqYM+JXoHYvVCdu6nSTuo5+fYLiwB
 NAeNoDozJSnAg6zDUxVOypI354YYeEKyddpi4hV6hbyarImq99x2MjIwk
 RVI5nl4gVPqcT5/Q7kLbBfsQ/W7/oVTzetUnB7LbYBRGVo2fzrLSuQ77C
 gDdONHZFkOn0DfjVaw1xDy5Ry0OzsjCdLlS5gSCXyZ3QTZ2qz/U2Dk/SQ w==;
IronPort-SDR: 9up+t1yzJJ4pGk6aqPHPwq23SeK79ZZS0/Y/Ik5MOTulOKzh5caNovjBGbxJ6lrde4h5QZmJrQ
 G73+Fc0cmYnSDDjVoLsU2YXwIrUMjba7jmRXoEesjVW0Q60ssAZUtNzH6Q9iWHH4rUT3nyL+3R
 Wna9vys0auG6ohc1PqenBrWVDC6VWLhnGT5WJ0I82sPJzhT+fDtLMfo0fttZvYpj/xGIWpcQTN
 xg1HYukdxQqRdkLC3pEkIDPiA8Fr/Yr5p1A7x76LvkAVhFk/dbR+oH+9VmdG9amUI3uuiwhn1e
 sn0=
X-IronPort-AV: E=Sophos;i="5.82,259,1613458800"; d="scan'208";a="115378716"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Apr 2021 09:22:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Apr 2021 09:22:36 -0700
Received: from [10.171.246.9] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 29 Apr 2021 09:22:34 -0700
Subject: Re: [PATCH] net: macb: Remove redundant assignment to queue
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
CC: <claudiu.beznea@microchip.com>, <kuba@kernel.org>, <davem@davemloft.net>, 
 <linux@armlinux.org.uk>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>, 
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
References: <1619691946-90305-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <8c969699-6ce3-4731-e33c-2d1b045aafab@microchip.com>
Date: Thu, 29 Apr 2021 18:22:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1619691946-90305-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_092240_433440_BA367F6E 
X-CRM114-Status: GOOD (  17.48  )
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

On 29/04/2021 at 12:25, Jiapeng Chong wrote:
> Variable queue is set to bp->queues but these values is not used as it
> is overwritten later on, hence redundant assignment  can be removed.
> 
> Cleans up the following clang-analyzer warning:
> 
> drivers/net/ethernet/cadence/macb_main.c:4919:21: warning: Value stored
> to 'queue' during its initialization is never read
> [clang-analyzer-deadcode.DeadStores].
> 
> drivers/net/ethernet/cadence/macb_main.c:4832:21: warning: Value stored
> to 'queue' during its initialization is never read
> [clang-analyzer-deadcode.DeadStores].
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Looks good to me as assignments are done in for loops:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Regards,
   Nicolas

> ---
>   drivers/net/ethernet/cadence/macb_main.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 0f6a6cb..5693850 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -4829,7 +4829,7 @@ static int __maybe_unused macb_suspend(struct device *dev)
>   {
>          struct net_device *netdev = dev_get_drvdata(dev);
>          struct macb *bp = netdev_priv(netdev);
> -       struct macb_queue *queue = bp->queues;
> +       struct macb_queue *queue;
>          unsigned long flags;
>          unsigned int q;
>          int err;
> @@ -4916,7 +4916,7 @@ static int __maybe_unused macb_resume(struct device *dev)
>   {
>          struct net_device *netdev = dev_get_drvdata(dev);
>          struct macb *bp = netdev_priv(netdev);
> -       struct macb_queue *queue = bp->queues;
> +       struct macb_queue *queue;
>          unsigned long flags;
>          unsigned int q;
>          int err;
> --
> 1.8.3.1
> 


-- 
Nicolas Ferre

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
