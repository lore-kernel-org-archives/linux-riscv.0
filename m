Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD1FC61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 13:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=flulh87L3VaV6RV1L0KP6mp/cbYms7zjWb53ou42bnM=; b=LtJUB2o1dR/Dey
	lu/mREFJw+c74Lj/hUaG4IDiMz04lZM0KQFRR82VrmKBNAOeq+gsyErSXh7FjXha29gmD3yMRlLne
	C023nmutFDjK/5fnDlXpUqjMBjleR3B1xyGs7wvtcOxZOfj3Ko0SATQj8IPP1RUITH+yLuN9CgOO5
	Dge0928nJL/Fa0iJX5rnSMVMArrPfFgjh9A+5erILVhw9t2N+sTBkyX1leCjszVZwyFrisLaUD9ui
	DPFw8lDptVPCnC74UTAh1gAUqDR4TcnihVhjro1jzQA7QYcEhGk6ZANyydq/P4QY925FukHVRAI8q
	GHGd1YXSbyo6RWNmr4pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUSHh-008EzA-UV; Tue, 21 Feb 2023 13:02:17 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUSHT-008Ekv-Ud
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 13:02:15 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9CEF624E2AE;
	Tue, 21 Feb 2023 21:01:19 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 21:01:19 +0800
Received: from [192.168.125.128] (183.27.98.67) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 21:01:18 +0800
Message-ID: <43d00fd9-ab24-442e-3f82-208edaf399d0@starfivetech.com>
Date: Tue, 21 Feb 2023 21:01:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 01/11] dt-bindings: clock: Add StarFive JH7110
 System-Top-Group clock and reset generator
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
 <20230221083323.302471-2-xingyu.wu@starfivetech.com>
 <430318ed-5b30-e549-a5ce-df83aa18adf9@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <430318ed-5b30-e549-a5ce-df83aa18adf9@linaro.org>
X-Originating-IP: [183.27.98.67]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_050204_334443_069BD903 
X-CRM114-Status: GOOD (  11.92  )
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

On 2023/2/21 19:25, Krzysztof Kozlowski wrote:
> On 21/02/2023 09:33, Xingyu Wu wrote:
>> Add bindings for the System-Top-Group clock and reset generator (STGCRG)
>> on the JH7110 RISC-V SoC by StarFive Ltd.
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> 
> 
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 93eb504c3b21..2e70c9f21989 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19914,6 +19914,7 @@ F:	arch/riscv/boot/dts/starfive/
>>  STARFIVE JH71X0 CLOCK DRIVERS
>>  M:	Emil Renner Berthing <kernel@esmil.dk>
>>  M:	Hal Feng <hal.feng@starfivetech.com>
>> +M:	Xingyu Wu <xingyu.wu@starfivetech.com>
> 
> No improvements here. You add here new bindings for one device and then
> - without explanation - add yourself to all Starfive clock bindings.
> Either explain it or drop it or move it to separate patch.
> 
> You already got comment for this.
> 

Sorry, I didn't understand what you meant before. Now my understanding is that, 
If I improvements JH71X0 driver no JH7110 driver, I could add this here. Right?

Is it OK if I do it this way to move it to separate patch like this?:
+STARFIVE JH7110 STG CLOCK DRIVERS
+M:	Xingyu Wu <xingyu.wu@starfivetech.com>


Best Regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
