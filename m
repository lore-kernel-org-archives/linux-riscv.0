Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81185C77B72
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 07:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0dcesSLlO4utS0wN/H5WG1OTfVpD5W1XgVbaoSJVKA=; b=WRgaCqTulZSaWc
	4usP6cbHjt3LmZTlz+oTl10on+PM+D5hPBw0Q+KbtLpFARXRWcXHD63B+xvngfxQT/5/nQ+Pd2jjh
	dvKhwFzHrOpP90NMNZ6m7AHOgV2m8QM7gPV42X7/AvyOM6w+fc6a9iHIerkuRfjjBD22nc610gFUC
	AxKmSVUD/FnIrJBVuGrUfg5TtR7DPhwip3IBfIm6YfwzI/nk/cDe4pK4AHJWHydduXtW3af8koeH6
	SYM0IVFEpmk0BIogr5AZ/B8MzQvTTp9oxzd9vA4/JHHa1my7LPoenlrbUViBiWm0OUxrNEBUhag9L
	MkF8mZuiW422JJhzz6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVHn-002AEV-0S;
	Wed, 12 Apr 2023 07:52:59 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVHk-002AD7-0G
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 07:52:58 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 6484024DF03;
	Wed, 12 Apr 2023 15:52:43 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 15:52:43 +0800
Received: from [192.168.125.82] (113.72.145.176) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 15:52:42 +0800
Message-ID: <9f729ae6-8b20-e77c-18f7-cbe093f8a3b9@starfivetech.com>
Date: Wed, 12 Apr 2023 15:52:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 5/7] soc: starfive: Use call back to parse device tree
 resources
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-6-changhuang.liang@starfivetech.com>
 <20230411-stimuli-reapprove-4659d50e5d2e@spud>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230411-stimuli-reapprove-4659d50e5d2e@spud>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_005256_306964_6EEEFC31 
X-CRM114-Status: GOOD (  10.32  )
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



On 2023/4/12 5:06, Conor Dooley wrote:
> On Mon, Apr 10, 2023 at 11:47:41PM -0700, Changhuang Liang wrote:
>> Different compatible parse device tree resources work in different ways.
> 
> Right now there is only one compatible, so this commit message needs to
> be expanded on to provide more information on your motivation.
> 

OK, will add more commit message.

>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> 
>>  static int jh71xx_pmu_init_domain(struct jh71xx_pmu *pmu, int index)
>>  {
[...]
>>  
>>  	match_data = of_device_get_match_data(dev);
>>  	if (!match_data)
>>  		return -EINVAL;
>>  
>> +	if (match_data->pmu_parse_dt) {
> 
> How can this be false?
> 
> Cheers,
> Conor.

Yes, it will not be false, I will delete this if condition

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
