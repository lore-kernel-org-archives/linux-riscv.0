Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCACC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 07:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPY6X1PoW+tyLLBn6PQR8UxoFYysDQBfqgGSur0/edw=; b=j0HxjmMvaGij+C
	9cdvJ6rjyMLFe0K9e+Om01kFn4SnZbQb22Ho5McdwaNKu62vVPejlQNK0KRTJqQMpweKcklRIxYdJ
	eY5vdgpCt7bgI9Z0Ed6UlAqqj5vveclkgFbubmEnpxPsqt6r+uX9WiEgy8f4tLajmBuEFGCEtK3tp
	5AYRdpGbl09rQXTr2UpuCvYg7Dm962fBCuAgMWP54Zsw8ng4faErJKatLuF/0iHqQlGZWrM6jFh11
	+knYWWjU4Vg2nmHOuLERxbmVhxOIQysSmTOsrHg8cEbT8HC3bQ1cZ+PCa/VdQQGebOr6+AHM29mWI
	l8bTFB9CN02DUaiKfkxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxNBo-00BC3N-17;
	Fri, 12 May 2023 07:27:44 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxNBl-00BC2n-1K
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 07:27:42 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id AECBF24E2D7;
	Fri, 12 May 2023 15:27:29 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 15:27:29 +0800
Received: from [192.168.125.131] (113.72.146.187) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 15:27:28 +0800
Message-ID: <67944796-cdc8-77a8-d99f-16eeff865923@starfivetech.com>
Date: Fri, 12 May 2023 15:25:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 7/7] riscv: dts: starfive: jh7110: Add PLL clock node
 and modify syscrg node
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
	<conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, "Rob Herring" <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "Hal Feng" <hal.feng@starfivetech.com>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-8-xingyu.wu@starfivetech.com>
 <c432c26b-27d3-80dc-fe6b-457996234871@linaro.org>
 <0463378b-60d8-ee05-2a2e-1e709b882bae@starfivetech.com>
 <72c8f49e-ad3e-9241-f2dc-cd523ea19d14@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <72c8f49e-ad3e-9241-f2dc-cd523ea19d14@linaro.org>
X-Originating-IP: [113.72.146.187]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_002741_629761_534B777C 
X-CRM114-Status: UNSURE (   9.80  )
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

On 2023/5/12 15:22, Krzysztof Kozlowski wrote:
> On 12/05/2023 09:15, Xingyu Wu wrote:
>> On 2023/5/12 14:37, Krzysztof Kozlowski wrote:
>>> On 12/05/2023 04:20, Xingyu Wu wrote:
>>>> Add the PLL clock node for the Starfive JH7110 SoC and
>>>> modify the SYSCRG node to add PLL clocks input.
>>>
>>>
>>>> @@ -465,6 +469,12 @@ syscrg: clock-controller@13020000 {
>>>>  		sys_syscon: syscon@13030000 {
>>>>  			compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
>>>>  			reg = <0x0 0x13030000 0x0 0x1000>;
>>>> +
>>>> +			pllclk: clock-controller {
>>>> +				compatible = "starfive,jh7110-pll";
>>>> +				clocks = <&osc>;
>>>> +				#clock-cells = <1>;
>>>
>>> This should be part of previous patch. You just added that node. Don't
>>> add half of devices but entire device.
>>>
>> 
>> So do I merge the patch 6 and patch 7 into one patch and add syscon and
>> clock-controller together?
> 
> I am okay with adding users of clocks in separate patch, but the clock
> controller - so part of SYS - should be added when adding SYS.
> 

Got it. Thanks.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
