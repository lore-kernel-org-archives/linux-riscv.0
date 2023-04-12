Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80889C77B70
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 02:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzdV4doyKCDZrAjMp+EbwOKw2d9CfX5sXrTtW4n56Ew=; b=sp8DsvS2HL6PMf
	bE8tc9KsV4I/j7ImO3ghVViw1luUWGeqY0iXib2xSQ1SwUj0dXpbJe5p6LfFpft6wFU/T0xooxFaP
	64r682DFvniMrM6egiVWIp4rz4isbPGVjK+iheQM8HrrpzizqXUO0UU1jfGjzcIaY51CzMNsCMoOr
	O7Uno+fJX/mDc5/02+Meky7gLZI7lT6t3IGY9wBYv3zUKtORssG/7avql7bktd46ggSvJ9OjFfaMu
	rQKwiPClhjO7hzlYMOCkhbKBDAHlTSBfEF69EBcn+QFys6f7GLis/OuL0ZrPUihhBMQhZYDE8GuEB
	gHx1WA8hG0jfC1PQlEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmQaB-001eD6-1l;
	Wed, 12 Apr 2023 02:51:39 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmQa8-001eCA-0E
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 02:51:38 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A679724E00A;
	Wed, 12 Apr 2023 10:51:12 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 10:51:12 +0800
Received: from [192.168.125.82] (113.72.145.176) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 10:51:11 +0800
Message-ID: <a2a90bfc-4dff-faaf-8b07-537bedbfb97f@starfivetech.com>
Date: Wed, 12 Apr 2023 10:51:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/7] dt-bindings: power: Constrain properties for
 JH7110 PMU
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-2-changhuang.liang@starfivetech.com>
 <20230411-vitality-exodus-f7e5d2e8576c@spud>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230411-vitality-exodus-f7e5d2e8576c@spud>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_195136_287604_906472E8 
X-CRM114-Status: GOOD (  10.36  )
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



On 2023/4/12 4:13, Conor Dooley wrote:
> On Mon, Apr 10, 2023 at 11:47:37PM -0700, Changhuang Liang wrote:
>> When use "starfive,jh7110-pmu-dphy" compatible, do not need the reg and
>> interrupts properties.
> 
> Please write a commit message explaining why this is needed.
> The commit message as-is is insufficient, but also IMO wrong incorrect.
> I think it would more accurately be "...: add jh7110 dphy pmu support" or
> similar & the body should explain why this particular PMU has no
> reg/interrupts.
> 
> Cheers,
> Conor.
> 

OK, Thanks for your comments, I will reorganize the commit message more clarity.

>>
>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> ---
>>  .../bindings/power/starfive,jh7110-pmu.yaml        | 14 ++++++++++++--
>>  include/dt-bindings/power/starfive,jh7110-pmu.h    |  3 +++
[...]
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
