Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9AAEB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 02:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCwfngKwrWqGx+Z/Pp/KOqFrlsJRIOvhIatHzlOUNzo=; b=k56LcyrK8RGpp2
	g0IdhELfcOJNhjuwMziPv+qUg8YolC4lnbYkgMjIbMfRq8pOQiQ0bZ5lJz8v/kzGx63FM/BKn9Gpf
	odxIFuQ+lHWbdbfZnebnXQ6XBySz4ZJo79kLeGE8Kcq1CfBByE1/9HgSMMXD6AgDUIGH/9n7oaRAC
	Gd9S0MEJGZbk6IBnpridyqsYTC8VwSiemANxgJ6bOHI3/+OXZpoE66yjZmBHYJk0LHghgMGzq36LB
	h/0jcE5ZrsI8NIkidZKCCPhmSIc5HiFVzFy0fUgpwwa88vPc4/eQcJKVB3hMigqB9yzKXIkHFK0wc
	yyeWkJLbMKRne+KJf/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfVt-00CbKK-0T;
	Fri, 21 Jul 2023 02:05:01 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfVq-00CbIt-1o
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 02:05:00 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D072181C5;
	Fri, 21 Jul 2023 10:04:28 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 10:04:28 +0800
Received: from [192.168.125.113] (113.72.147.86) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 10:04:28 +0800
Message-ID: <cb65c688-6f88-2ac0-3a99-acef6f0bfe55@starfivetech.com>
Date: Fri, 21 Jul 2023 10:04:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Jh7110 DTS Patches
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <kernel@esmil.dk>
References: <20230720-product-cheese-9f0fe22cc485@spud>
 <757fa8f2-4bab-07b3-13fd-aa983907bd77@starfivetech.com>
In-Reply-To: <757fa8f2-4bab-07b3-13fd-aa983907bd77@starfivetech.com>
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_190458_805657_F36ED4CB 
X-CRM114-Status: GOOD (  11.85  )
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



On 2023/7/21 10:00, Walker Chen wrote:
> 
> On 2023/7/21 1:51, Conor Dooley wrote:
>> Hey Walker,
>> 
>> I have picked up the patches that I can from the mailing list & they
>> should appear in tomorrow's iteration of linux-next. Could you get your
>> co-workers to resend whatever patches that depended on the syscons, PLLs
>> or STG etc clocks?
>> 
>> Some were still on patchwork, eg the TDM audio, that I could not apply &
>> will need to be rebased. In particular, it'd be nice to get the eMMC
>> patches resent, as what I could find on patchwork was quite old.
>> 
>> You can see what I have applied here:
>> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-dt-for-next
>> 
>> Thanks,
>> Conor.
> 
> Hi Conor,
> 
> I have notified my co-workers that are responsible for these modules to resend dts patch ASAP.
> These patches are submitted together, there may be conflicts.
> Could you please help solve it then ? 
> Thanks!
> 
> Walker
> 

The following modules require to resend dts patch:
DMA, GMAC, SDIO/EMMC, USB, Crypto, TRNG, TDM, MIPI CSI


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
