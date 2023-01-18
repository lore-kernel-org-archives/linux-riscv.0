Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99803C32793
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 07:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rX4yzG+DDFGT9KxGGSfHePV6jToHoCf/QgGq7MfUgy4=; b=jOxoYcVIUtl1tN
	dE+ndzJWhO5BXT8JPnpwaya8F8/stJT7RP/q6pPd7YETBXkm76hURr2kJMiWkYxnssRTl1Y9cBAsZ
	4WWnLr4xYxfc13QaxhHNw3UMv1UNgumFShlrBaEpyiRwNI28YLB8EF7CqcUjhepHzvbxFwBB8sI8I
	Cm/myvvZNOfSh5oIpgS9c6/CMRSspXNoHDgh4bNl2mqmXk9xJ1AqDCCoWQMNfjrrED4RdEd2+ZX5O
	z7ol0+7wcDuHJHpWLNxfWG5DtKhrY8SNskxXq1z08cJDzVYrTP+0ZEt9xKi+opxzD7HEjAU78LUtv
	OnImNNF7Moijamr/8C5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI2U9-00H9G1-2N; Wed, 18 Jan 2023 07:03:49 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI2U5-00H9Dj-9R
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 07:03:47 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BC4BB24DC7D;
	Wed, 18 Jan 2023 15:03:31 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 18 Jan
 2023 15:03:31 +0800
Received: from [192.168.125.95] (113.72.144.40) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 18 Jan
 2023 15:03:31 +0800
Message-ID: <065dbed0-00af-d38f-9044-d9d8835db1e8@starfivetech.com>
Date: Wed, 18 Jan 2023 15:03:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/3] dt-bindings: power: Add starfive,jh7110-pmu
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230116074259.22874-1-walker.chen@starfivetech.com>
 <20230116074259.22874-2-walker.chen@starfivetech.com>
 <1b42fe97-16fa-d004-539f-54e2cfecd38f@linaro.org>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <1b42fe97-16fa-d004-539f-54e2cfecd38f@linaro.org>
X-Originating-IP: [113.72.144.40]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_230345_540437_A22632C6 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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

On 2023/1/17 18:55, Krzysztof Kozlowski wrote:
> On 16/01/2023 08:42, Walker Chen wrote:
>> Add bindings for the Power Management Unit on the StarFive JH7110 SoC.
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../bindings/power/starfive,jh7110-pmu.yaml   | 45 +++++++++++++++++++
>>  .../dt-bindings/power/starfive,jh7110-pmu.h   | 17 +++++++
>>  2 files changed, 62 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
>>  create mode 100644 include/dt-bindings/power/starfive,jh7110-pmu.h
>> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

Thanks a lot for your review!

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
