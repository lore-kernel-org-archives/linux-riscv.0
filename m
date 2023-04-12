Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3303EC77B6E
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 06:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xO7yIUUYVVzGkq3lr3YzNhO/Jkl2G+0gGKxJg03wImE=; b=TlIJb+8pQw6UUh
	IEtVoFT2dzoLRzFkISu2xjX+oib17ylUQ+/uzl9DsYb9yLLOV8r2Fma0bTg2TzjkBWQyFfJ+ApQoI
	D0hAC9znRSOYOuhqSwWam4gv5cpmhSYgIUDcUiequtsQ5hkyKi72xIH2OMgGexJR19G2P3tqPWIqw
	iRVkpSOJSIL11Mqqb2dFICSrAnvHJ8s/PtywPQiBlF4xHGwfzCnXeE0VyG3Je5vJR288UysWYqGAB
	Py4UFXsHgp6TovU2FGgaOS8yLf024uhzbM7/vMfOtkiqyhCsuR0+uX0gUMyGweAxMJSDBNF7E8QGj
	m3ck+a3ZSOcJes4jjccQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmUCP-002000-1P;
	Wed, 12 Apr 2023 06:43:21 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmUCL-001zw6-0n
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 06:43:19 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id CE4CB7F98;
	Wed, 12 Apr 2023 14:42:43 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 14:42:43 +0800
Received: from [192.168.125.82] (113.72.145.176) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 14:42:42 +0800
Message-ID: <1e3e917a-17ff-2a06-e127-e0d43b731301@starfivetech.com>
Date: Wed, 12 Apr 2023 14:42:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 4/7] soc: starfive: Add pmu type operation
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-5-changhuang.liang@starfivetech.com>
 <20230411-flavoring-sternness-a3b6cdee9fcb@spud>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230411-flavoring-sternness-a3b6cdee9fcb@spud>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_234317_594117_21E76E77 
X-CRM114-Status: GOOD (  15.35  )
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



On 2023/4/12 4:52, Conor Dooley wrote:
> Hey Changhuang Liang,
> 
> On Mon, Apr 10, 2023 at 11:47:40PM -0700, Changhuang Liang wrote:
>> Add pmu type, make a distinction between different PMU.
> 
> Please write more detailed commit messages, thanks.
> 

OK, will write more detail for it.

>>
>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> ---
>>  drivers/soc/starfive/jh71xx_pmu.c | 55 ++++++++++++++++++++++---------
>>  1 file changed, 39 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/soc/starfive/jh71xx_pmu.c b/drivers/soc/starfive/jh71xx_pmu.c
>> index 306218c83691..98f6849d61de 100644
>> --- a/drivers/soc/starfive/jh71xx_pmu.c
>> +++ b/drivers/soc/starfive/jh71xx_pmu.c
>> @@ -45,6 +45,12 @@
>>   */
>>  #define JH71XX_PMU_TIMEOUT_US		100
>>  
>> +/* pmu type */
> 
> Delete this comment, it's obvious.
> 

OK, will delete this line.

>> +enum pmu_type {
>> +	JH71XX_PMU_GENERAL,
> 
> I'm really not sold on GENERAL as a name.
> Why not name these after the compatibles?
>

OK, will change to "JH71XX_PMU".
 
>> +	JH71XX_PMU_DPHY,
>> +};
>> +
>>  struct jh71xx_domain_info {
>>  	const char * const name;
>>  	unsigned int flags;
>> @@ -54,6 +60,7 @@ struct jh71xx_domain_info {
>>  struct jh71xx_pmu_match_data {
>>  	const struct jh71xx_domain_info *domain_info;
>>  	int num_domains;
>> +	u8 pmu_type;
> 
> This is an enum, not a u8?
> 

OK, will fix it.

> Thanks,
> Conor.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
