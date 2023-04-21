Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D70C7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 07:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ADWBDiqpHWj3jUeeZYyEpd8x9xA0HnwvPnoGLX09Mk=; b=Z9FbmL7h45zJ9J
	eYnji2cQ/R3iCoKdSCyJSnkd0YbVUGotw/7aNV5zDEn8ee/Hraa36HIZaEZVN1PAiB19Vh+H/WJhi
	LYDTXPpU3nr9z4E0u2PfsSC1Y3L3pYAAzigcXqxcLV27WdbKZtw6eIzNsYlH/cq1QzPlkwyB6Bozh
	pk4ZHmKZdu7qENLPO3FtDOU2IXqDS2zsRTlThp+aQ1ZJRDRpx41cmSeCjKnTsSIBgCiNmMVAwcS51
	FGmOcUet5hUwQqgl638cpkwvvD0GKTKaXELxqxyi1gftdTdFazSOTypYd3qIhQwLRAMu6Mf2mHMqe
	PdvszmcbqzozG98v4nhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pplVP-00A0zh-0a;
	Fri, 21 Apr 2023 07:48:31 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pplVJ-00A0vm-2L
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 07:48:28 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 696ED8132;
	Fri, 21 Apr 2023 15:47:33 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Apr
 2023 15:47:33 +0800
Received: from [192.168.125.106] (113.72.145.137) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Apr
 2023 15:47:32 +0800
Message-ID: <dfa83b49-b9a9-67c7-0060-3575cbda1650@starfivetech.com>
Date: Fri, 21 Apr 2023 15:47:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RESEND v2 4/6] soc: starfive: Extract JH7110 pmu private
 operations
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
 <20230419035646.43702-5-changhuang.liang@starfivetech.com>
 <20230419-atypical-unbounded-99cbbff3091a@spud>
 <8ce740ac-54e9-bf31-1e03-2f3e0e9ef63c@starfivetech.com>
 <20230421-fringe-demise-606ff852ed25@wendy>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230421-fringe-demise-606ff852ed25@wendy>
X-Originating-IP: [113.72.145.137]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_004825_901870_EFDD7833 
X-CRM114-Status: GOOD (  12.19  )
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



On 2023/4/21 14:57, Conor Dooley wrote:
> On Fri, Apr 21, 2023 at 11:27:52AM +0800, Changhuang Liang wrote:
>> On 2023/4/20 1:47, Conor Dooley wrote:
>>> On Tue, Apr 18, 2023 at 08:56:44PM -0700, Changhuang Liang wrote:
>>>> Move JH7110 private operation into private data of compatible.
>>>> Convenient to expand different compatible.
>>>
>>> I prefer how the code looks in v2, thanks.
>>> However, just as in the prior patch, "Convenient to expand different
>>> compatible" isn't really a justification - specifically, supporting the
>>> power domain controller serving the dphy is your motivation here. The
>>> important difference being that it uses a regmap from a syscon and has
>>> no interrupts nor the encourage features.
>>>
>>
>> So should I expand the commit message which called "in order to add the 
>> aon power domain" although the patch is applied behind current patch.
> 
> Only if you have to resend for some other reason. If there is no other
> reason to resend then I will do this when I apply the patch.
> 
> Thanks,
> Conor.

OK, thanks for your support.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
