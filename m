Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9D6C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 16:32:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4059B6140C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 16:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4059B6140C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B1JNYjABcH+hzB68FnV4gcZ/QUEz+iZ/mtswn8NdQZ0=; b=ovdpFnzut1i8KDJNxd54/zauX
	6Ocgml2aB3wB1SdpwBFQMalDIAtvVnmVvg2nQ4kTZmaMulPQABxvz8RBr20I+n7LkintkM3hsh6fb
	Yhjsp5jKZqn2NEX1pXs8h1KjwqxkJdsIKnfdZCYSJjp1Y8moczzKGHMG04h9ESetcbo9O2dqkF6+9
	QX7rPvRPC9ldvBWY50oSnXpDHPnWgPmOF0wYmkAJGJNj/tNrOdPduJVqqz14HtIGxm2F6jdEpZH3q
	R9DbLG2ukR3KoQsfOxer/srKNdyZ9RKwBFFLKylN5Msl5ZhUnmIOBXprZdAm0rYKpawLcMFUOvT6N
	j2qI6S8ZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc9aS-0063ky-0j; Thu, 29 Apr 2021 16:32:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9aO-0063kM-77
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 16:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=weXedyppiPqjfs4gYPMZr/jLJU0tpcI0KJ15HonorPY=; b=a5tF5ppki5LhUZ/yKRO2pTBi1C
 f1HD/grLmxJHu5EP0ZwmFctp2/02Lty8QTZ9B6fwhVeKAzrpCwIMtnEZqK5lMaeoAlN47mn/xEq7j
 x/nadBRMkAPRo5qSn3eAVBKaF4xUGxrD/MvcLOI5Hrf2sG+0RVTURgjGE0MRVLqiEE82y2KCXheCT
 OIsgdFca2YvUfk3v1ULXjiI4CM1MnebiR10vyrGJLSXKwjoafyj0LDBHNLHvCppZOGKeFWB/hbDGL
 EnHWRUVqLEn0eLMaoPNueF47aiEMnYr21Ktv4MJuhj5GSMZIOy6yCOb5ViRr6AT7ZUSV7o1+pM5Ka
 myCvoaFA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9aL-000lkC-Iz
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 16:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1619713937; x=1651249937;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hqg6GCymKi8MGlWIx2XifSrXyOJ+2DS2KKgnhY+o25c=;
 b=nuwH1QYqpkv75KEdc2eIZMysz9HXNnh/Q1SvwW7reinSR+0JInz/MP+D
 cah27+moCJKaHS7+blGJHc2JjOmtYkTDhfHiZ86CzOujBq4kfhTTXMcLd
 efpEtbKpmraeFIlIhVyS7yWKc6awQX5VO3B+VK5kVOuZL0K/xV1lcyqbQ
 +M3OY6bdo0utH3PNBEKc8wye3YqhUjC83UHem03dQv39dVX7TqeswesLj
 W4hDFgf0aZ8O+Nn17sgnRaTrr5DJ+XUe+eugEWGIqvDbcA4ib/m2GGnAb
 58POcVUG0UkBysUOncJBQF+zask1eICDWFwQjFRercaQ8i/kLlcd2JhvQ w==;
IronPort-SDR: sa6xaJUC2wpDcfdsfc9/3DuLsY6QIhK+Lij0cF1caQycbtdtzI1AYHt9rqjxJoiAMu7/k52Ys4
 rI/XO6uGRNC+gdkSSylW13+HJOpdp1e4+kTOX92dyzgjAer3v3yNPCi1KUhJWTKI6Q8QN7VnrH
 lClRW075l2fIyGZJCne1R1AnVE/eQBkU7L1lCkCCTB3KADR/YzQI71ZVHE2iF9RFmVeu1aPtcN
 DuuHsCmnX/ij0o27rA0+6GniQZGBxVIwFxQtyjg5cVJoF908gp2la/Ew/njJVS+wp1X18IeQVf
 Sk8=
X-IronPort-AV: E=Sophos;i="5.82,259,1613458800"; d="scan'208";a="112706308"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Apr 2021 09:32:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Apr 2021 09:32:15 -0700
Received: from [10.171.246.9] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 29 Apr 2021 09:32:13 -0700
Subject: Re: [PATCH] net: macb: Remove redundant assignment to w0 and queue
To: Jakub Kicinski <kuba@kernel.org>, Jiapeng Chong
 <jiapeng.chong@linux.alibaba.com>
CC: <claudiu.beznea@microchip.com>, <davem@davemloft.net>,
 <linux@armlinux.org.uk>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
References: <1619604188-120341-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <20210428122106.2597718a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <ac269e45-113c-1fc3-192a-97253633e031@microchip.com>
Date: Thu, 29 Apr 2021 18:32:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428122106.2597718a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_093217_720611_A65F21ED 
X-CRM114-Status: GOOD (  15.24  )
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

On 28/04/2021 at 21:21, Jakub Kicinski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Wed, 28 Apr 2021 18:03:08 +0800 Jiapeng Chong wrote:
>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
>> index 0f6a6cb..5f1dbc2 100644
>> --- a/drivers/net/ethernet/cadence/macb_main.c
>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>> @@ -3248,7 +3248,6 @@ static void gem_prog_cmp_regs(struct macb *bp, struct ethtool_rx_flow_spec *fs)
>>        /* ignore field if any masking set */
>>        if (tp4sp_m->ip4src == 0xFFFFFFFF) {
>>                /* 1st compare reg - IP source address */
>> -             w0 = 0;
>>                w1 = 0;
>>                w0 = tp4sp_v->ip4src;
>>                w1 = GEM_BFINS(T2DISMSK, 1, w1); /* 32-bit compare */
>> @@ -3262,7 +3261,6 @@ static void gem_prog_cmp_regs(struct macb *bp, struct ethtool_rx_flow_spec *fs)
>>        /* ignore field if any masking set */
>>        if (tp4sp_m->ip4dst == 0xFFFFFFFF) {
>>                /* 2nd compare reg - IP destination address */
>> -             w0 = 0;
>>                w1 = 0;
>>                w0 = tp4sp_v->ip4dst;
>>                w1 = GEM_BFINS(T2DISMSK, 1, w1); /* 32-bit compare */
> 
> Looks like this was written like that on purpose.
> 
>> @@ -4829,7 +4827,7 @@ static int __maybe_unused macb_suspend(struct device *dev)
>>   {
>>        struct net_device *netdev = dev_get_drvdata(dev);
>>        struct macb *bp = netdev_priv(netdev);
>> -     struct macb_queue *queue = bp->queues;
>> +     struct macb_queue *queue;
>>        unsigned long flags;
>>        unsigned int q;
>>        int err;
>> @@ -4916,7 +4914,7 @@ static int __maybe_unused macb_resume(struct device *dev)
>>   {
>>        struct net_device *netdev = dev_get_drvdata(dev);
>>        struct macb *bp = netdev_priv(netdev);
>> -     struct macb_queue *queue = bp->queues;
>> +     struct macb_queue *queue;
>>        unsigned long flags;
>>        unsigned int q;
>>        int err;
> 
> This chunk looks good!
> 
> Would you mind splitting the patch into two (1 - w0 assignments, and
> 2 - queue assignments) and reposting? We can merge the latter, the
> former is up to the driver maintainer to decide.

Good move Jakub, thanks for having suggested this as we are highlighting 
a bug!

Best regards,
   Nicolas

-- 
Nicolas Ferre

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
