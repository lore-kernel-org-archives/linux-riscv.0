Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D107C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 07:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zAaA3ie2iish35xUF4+eQRisGVBmm77nzLHk8I57/ic=; b=pflJNDoG4qfwMA
	1hEdjzJe/UELaqs3PXMms1TJIAKd1DqiyXNUI9Vp8+cj2qlHZb1ah+S2/Wi+bMwCQoFZKo17hoxqQ
	RN0FWCvTbp8avJbXJUI0rqYIALBxoYogv6HvkJK7WdoDnmVKOQCFobf9AAdcg4t/cbRwbxvsFA5Us
	t5+ADSAc1cadslx77uf6x9nkogrxR+y3s3aKd81MpvMG4Bt8fLCrRPnI6ZPiuThxgQ9DSAUJZEs14
	nI+6H10kKlhs7LP8AGG9Tw/zZi23IUqyMBqQVT5mnIeCEUVNkNBGcwOHbhKMIh8Hb4uLocJzn0D6/
	BIs6vLrrX/58RJ3Op47w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxN2f-00BAdL-2N;
	Fri, 12 May 2023 07:18:17 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxN2b-00BAb7-33
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 07:18:16 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B68FD24E287;
	Fri, 12 May 2023 15:17:26 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 15:17:26 +0800
Received: from [192.168.125.131] (113.72.146.187) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 15:17:25 +0800
Message-ID: <0463378b-60d8-ee05-2a2e-1e709b882bae@starfivetech.com>
Date: Fri, 12 May 2023 15:15:50 +0800
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
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <c432c26b-27d3-80dc-fe6b-457996234871@linaro.org>
X-Originating-IP: [113.72.146.187]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_001814_155474_6BF1219E 
X-CRM114-Status: UNSURE (   9.37  )
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

On 2023/5/12 14:37, Krzysztof Kozlowski wrote:
> On 12/05/2023 04:20, Xingyu Wu wrote:
>> Add the PLL clock node for the Starfive JH7110 SoC and
>> modify the SYSCRG node to add PLL clocks input.
> 
> 
>> @@ -465,6 +469,12 @@ syscrg: clock-controller@13020000 {
>>  		sys_syscon: syscon@13030000 {
>>  			compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
>>  			reg = <0x0 0x13030000 0x0 0x1000>;
>> +
>> +			pllclk: clock-controller {
>> +				compatible = "starfive,jh7110-pll";
>> +				clocks = <&osc>;
>> +				#clock-cells = <1>;
> 
> This should be part of previous patch. You just added that node. Don't
> add half of devices but entire device.
> 

So do I merge the patch 6 and patch 7 into one patch and add syscon and
clock-controller together?

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
