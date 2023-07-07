Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEB0EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 07:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWVNtdjYHVWBI5sYdX7ziMt6fRbsXJiuZ+YYekI6UUg=; b=Eebe/rojY5c/KC
	Vh53PBXywpid4OcqSn4DQpGa2qzeTEr80ZHV4N5Q1L3bq2eYlFAi9cI0T7SMS3WfSDOoaiKjBaCoj
	m3fZc7KOnZapEk73W7r+/cCaiu58knNDgQRWZ8ZqA51zNGpJNvhu5yF0gRw0GqThm/3ITVBCPMMBZ
	QRGyG8xppdek4GnfKuPN1MtbF8FVf9fZvpSX37W1MfWcuCCZL38ND8xi0QUHroDqUOkheqkoSdxpb
	nNgeqNSkwbPDsD/+SSZIdxcB8T3RcfY02vEOXy1A8YZl+idt/ZHskcqGNOKFdMeYVvUKNJyi0aEzZ
	kVsMmMgCBe0fg7/N9GPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHg9d-003tlG-1m;
	Fri, 07 Jul 2023 07:45:25 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHg9Z-003tfp-1b
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 07:45:24 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A0940819B;
	Fri,  7 Jul 2023 15:44:28 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Jul
 2023 15:44:28 +0800
Received: from [192.168.125.128] (113.72.145.114) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Jul
 2023 15:44:27 +0800
Message-ID: <0b6bd526-1b66-1091-8e9a-cae71d998021@starfivetech.com>
Date: Fri, 7 Jul 2023 15:41:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v6 0/7] Add PLL clocks driver and syscon for
 StarFive JH7110 SoC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Conor
 Dooley" <conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
 <913206a5-3ce2-3ce1-774e-3a4a9030b0e2@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <913206a5-3ce2-3ce1-774e-3a4a9030b0e2@linaro.org>
X-Originating-IP: [113.72.145.114]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_004521_741290_2F0D7956 
X-CRM114-Status: UNSURE (   7.86  )
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

On 2023/7/5 14:27, Krzysztof Kozlowski wrote:
> On 04/07/2023 08:46, Xingyu Wu wrote:
>> [Resending because it has a error about examples in syscon bingdings
>> and has to be fixed.]
> 
> Resending means you sent the same version. If you did not change
> anything, then it will fail, right? If you changed something, it is new
> version.
> 

Okay, I will fix it in new version of these patches. I sorry to make these noise.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
