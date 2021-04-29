Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C95C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 16:55:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBFB2613F8
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 16:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBFB2613F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aH4j3vG34qPCd0cgD4Vk7CZAH6/BIojIXu+TkXFyzPI=; b=E3JsilGkwiPLFuvm5a3mk55bO
	UVAIEKOw+eIz8zVstpQBWstgV95Byl/tVtyMbNtGIOa7mp3xrPFs+9LFEyUYLJofDtYDl00w2VLPI
	Ux80rEd5aLPozWQrGEk0Mh/gxXNtW8d1Txkxt9F93Hisfuxa/dFK/ii8a3UCOq9v+4KdjrlLqQTm+
	Tze8jS/922M2h4F6t/mqQo86H6TrO9f3ov688BWDGPncKzxobVwnu/ec3taQrScxBloKaR0XKK5wS
	3M3h+SgLmcqVktwdZLnd+BRaBIzPpnoFfPh8UT1lBAwaTESoJz+ytjcuTlF6eQezmZNkdi/7uU+Di
	bO9rTVzsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc9wg-0065Dn-9T; Thu, 29 Apr 2021 16:55:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9wd-0065DM-Pj
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 16:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=02q1ro0iWAbhE+LUZzZfGP0eK1ppaotOtxmIVusmPDQ=; b=bXcMg9qkBL9v9wqoXgpuHflQyf
 8CBmfVtlJUhIU/Vi1C+Q6Qdf2QNooNwFgkgmn8KlnM6jAaIkljyq/U1mP2iy3mge3WyntunMZfP1W
 h3p7dz48RNEYwA0gXaH6D0FVp+Q7M7RsJYzvh9WIxIF+j8FGwh77GORrFRVeJi6ov48T1YSwKtD/X
 WVm2dSwpQf+HRvsjxyUhLCZSmHLu21r53mOpzHCXpnW3ZZlcRqr2a67dU6ARApPquBCpbTmFf7wLH
 fNirpTlr0BDjoAZPU691mb+bH09WvJAbsYsRYN8DK9mAEnV3b+mrd3+Ad8wGBMhPBLulonqibozxT
 h0h58hPg==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9wb-000mv2-8U
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 16:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1619715317; x=1651251317;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ScWp8ofsYrARe5yBRyhUEWi4uTfNWBn2+W2xJb2CiZM=;
 b=BCuUAkjKQLbAWpl0InQzcTNpTlCmwG+DzalgYvhz2qpc9AhSzDIVRv30
 Q7pDIi+60xadebKIDN7OOPhpJZAmJd2jqhoDDP97iuFPNrupStz2gAbiA
 uq0zSLuu+MJ7yaz4+zxwkteaI16dj8hpL6fQjC+/AX8rm6IkwxnviOsxG
 w06TXphEuwIZjs21uutuvrx3W7Uzp1bu5k8Quc7VR1Lj9cDsfDDW5+vN0
 XZRUq3FmgcRymtsvPVyjoytVpTqHgwVHZ0w3l6ln6PopGAiD04lVC+i0J
 OQrxio3uzUaXWV6uTr8/CHYt2ESfxYTQ0IEO6EnGsqP6aHPw+WIC1ccgx g==;
IronPort-SDR: CJnHrgFd1mS2gYtmha0/lmYBCzIBsfW9GcOBZlk2T7wKu4yryOLJFaPdL4/+lJHntBA4zk2DMB
 LFlaNrZ2phLO7cow+cmgtjkJVQk2Shmi8ivPOGq6h9MskKJvSdJqFzD6Jo4Toam4VoXARPgr/f
 ugQAHma/IWZBmF4pdTJ8zB6VrXv1Cjh3LSlxb7XfhUE5aR9CJky6KNS0nBAh7lWr5IGZE2nGJU
 OR/lF5Xgiuu4ESzOUsW5S9lkkGcs2i/hAd8vtODcmToQRBJEYwnIX+PcXk5LcRBSc2YKkz2ZAG
 ylE=
X-IronPort-AV: E=Sophos;i="5.82,259,1613458800"; d="scan'208";a="53032240"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Apr 2021 09:55:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Apr 2021 09:55:14 -0700
Received: from [10.171.246.9] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 29 Apr 2021 09:55:12 -0700
Subject: Re: [PATCH] net: macb: Remove redundant assignment to w0
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Rafal Ozieblo
 <rafalo@cadence.com>
CC: <claudiu.beznea@microchip.com>, <davem@davemloft.net>, <kuba@kernel.org>, 
 <linux@armlinux.org.uk>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>, 
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Michal Simek <michal.simek@xilinx.com>
References: <1619691982-90657-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <80a97aa9-0bf4-d6c5-597e-4440b07ecdaf@microchip.com>
Date: Thu, 29 Apr 2021 18:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1619691982-90657-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_095517_400672_E81975CD 
X-CRM114-Status: GOOD (  20.29  )
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

On 29/04/2021 at 12:26, Jiapeng Chong wrote:
> Variable w0 is set to zero but these values is not used as it is
> overwritten later on, hence redundant assignment can be removed.
> 
> Cleans up the following clang-analyzer warning:
> 
> drivers/net/ethernet/cadence/macb_main.c:3265:3: warning: Value stored
> to 'w0' is never read [clang-analyzer-deadcode.DeadStores].
> 
> drivers/net/ethernet/cadence/macb_main.c:3251:3: warning: Value stored
> to 'w0' is never read [clang-analyzer-deadcode.DeadStores].
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

NACK: there seems to be a massive bug in this code as I have the strong 
feeling that '=' must be replaces by '|=' in subsequent assignment of 
w0, W1... otherwise I don't understand the meaning of all this!

I don't know how RX filtering must be done in this controller neither 
how to test it so if nobody steps in to fix this, I'll probably have to 
do a patch based on datasheet only.

Please comment if you have a view on this.

Best regards,
   Nicolas

> ---
>   drivers/net/ethernet/cadence/macb_main.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 0f6a6cb..741b2e3 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -3248,7 +3248,6 @@ static void gem_prog_cmp_regs(struct macb *bp, struct ethtool_rx_flow_spec *fs)
>          /* ignore field if any masking set */
>          if (tp4sp_m->ip4src == 0xFFFFFFFF) {
>                  /* 1st compare reg - IP source address */
> -               w0 = 0;
>                  w1 = 0;
>                  w0 = tp4sp_v->ip4src;
>                  w1 = GEM_BFINS(T2DISMSK, 1, w1); /* 32-bit compare */
> @@ -3262,7 +3261,6 @@ static void gem_prog_cmp_regs(struct macb *bp, struct ethtool_rx_flow_spec *fs)
>          /* ignore field if any masking set */
>          if (tp4sp_m->ip4dst == 0xFFFFFFFF) {
>                  /* 2nd compare reg - IP destination address */
> -               w0 = 0;
>                  w1 = 0;
>                  w0 = tp4sp_v->ip4dst;
>                  w1 = GEM_BFINS(T2DISMSK, 1, w1); /* 32-bit compare */
> --
> 1.8.3.1
> 


-- 
Nicolas Ferre

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
