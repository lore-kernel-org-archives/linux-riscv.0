Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B545CC7619A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 08:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LU3GjAwITrXKsmTYTtqs6M3CfxbawYcnlwiqOmfykvY=; b=t8NtiKCEWjUaQV
	DOs09JJUFlSfBCpSzH7xcdp4XnBL1f66JSIPt7HPt/D7KnPovlIptIB64Ta7EeSNb4KBdXF3I8eiz
	jKrhqJUVP3PZg1vbIFgmO7wnzx1LGV/gdU3K9Uu3YMr96S9q1Kp8dMuPBGHrWzFV3Wnsyc/iqO4/k
	fPX72tUtV+DzOr9E4bfAnw7JpSn4eeA4bymGLWFYccVKTc7xeBG66C9YILVWgKpI3OLUulEe9FPDX
	eToi0Ovy+pA5Lzi0NfYMyXmw4Z9vQg+eLRpRg2BmlnbE5CoSTwFR/Koqx1btql9N1yexUBQB5+cjb
	M4Ddb4hVdEExqRJ1siWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVhg-002ESZ-0E;
	Wed, 12 Apr 2023 08:19:44 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVhd-002ERJ-29
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 08:19:43 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3BBD824E1BE;
	Wed, 12 Apr 2023 16:19:29 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 16:19:29 +0800
Received: from [192.168.125.82] (113.72.145.176) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 16:19:28 +0800
Message-ID: <68839732-2d3f-aafc-8744-550f4bfa27f0@starfivetech.com>
Date: Wed, 12 Apr 2023 16:19:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 6/7] soc: starfive: Add dphy pmu support
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-7-changhuang.liang@starfivetech.com>
 <20230411-iron-everybody-70b78e94aee5@spud>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230411-iron-everybody-70b78e94aee5@spud>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_011942_007430_8C3173D0 
X-CRM114-Status: GOOD (  12.87  )
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



On 2023/4/12 5:15, Conor Dooley wrote:
> On Mon, Apr 10, 2023 at 11:47:42PM -0700, Changhuang Liang wrote:
>> Add dphy pmu to turn on/off the dphy power switch.
[...]
>> +
>>  static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
>>  {
>>  	struct jh71xx_pmu *pmu = pmd->pmu;
>> @@ -191,6 +213,8 @@ static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
>>  
>>  	if (pmu->match_data->pmu_type == JH71XX_PMU_GENERAL)
>>  		ret = jh71xx_pmu_general_set_state(pmd, mask, on);
>> +	else if (pmu->match_data->pmu_type == JH71XX_PMU_DPHY)
>> +		ret = jh71xx_pmu_dphy_set_state(pmd, mask, on);
> 
> Perhaps I am verging on over-complication, but I dislike this carry on.
> Is this the only time we'll see a power domain provider coming out of
> a syscon, or are there likely to be more?
> Either way, I think having an ops struct w/ both parse_dt() and the
> set_state() implementations would be neater than what you have here.
> 

OK, I will use call back make here neater.

> Very much open to dissenting opinions there though. Emil? Walker?
> 
> Cheers,
> Conor.
> 
>>  
>>  	return ret;
>>  }
[...]
>> -- 
>> 2.25.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
