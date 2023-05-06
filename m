Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AF9C77B75
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 01:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBN2crRmCv6dbzgfyV010Bq9Nw0SD+n/yYZr0l3bFV0=; b=Z7YHHipRgyWr0n
	/2AMMC5pKKsmOsZTVML8ry71+uzdkG0tBwfmdqVAJ7j5AQ4OiqM3pYWqXNnMnNwWkzAL9Hxbvj3rK
	MdGQ0MYRlzNH9mFkouVP4slS53E8A47img4j/gJ5b/wOpu7R+pQeqFESm2R/pQUYe27F/XZfwHhyz
	Oxzz130jZ4CxKkcu7s/sosAyeiTx2Kq1jLJHlIhcEaxOUqHHgXU/5ZUBuCgXW1cyXwWnp2PS5C6Xg
	LAvbWP4nK+oA1eYwcxlF+R6NwG9oceq1VLKsMAK2I4J8xDfCU5V/JiQtyUfbV9cAuQf+g8ABDo/aE
	jTLW+cTUEBFpvD6U3Y7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pv6zs-00CIFj-1P;
	Sat, 06 May 2023 01:46:04 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pv6zn-00CIDz-1K;
	Sat, 06 May 2023 01:46:02 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id C5CF424E199;
	Sat,  6 May 2023 09:45:08 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 6 May
 2023 09:45:08 +0800
Received: from [192.168.125.107] (183.27.98.219) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 6 May
 2023 09:45:07 +0800
Message-ID: <ba6a1a47-d3b1-ee16-4785-f5c61d593127@starfivetech.com>
Date: Sat, 6 May 2023 09:45:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <vkoul@kernel.org>,
	<linux-phy@lists.infradead.org>
References: <3ed72340-accc-4ad1-098f-4a2eb6448828@linaro.org>
 <482e812a-05dd-105c-189c-e926b4be9d28@starfivetech.com>
 <089e24d1-588a-4a56-f00b-0b35d1d99295@linaro.org>
 <ea5b5534-8fc2-7c84-a011-c1b42c6ed7a0@starfivetech.com>
 <1ac26c1a-1726-515d-6598-849a07ed0b86@linaro.org>
 <5adda0ad-965c-fbf0-878c-9d41d28b5c39@starfivetech.com>
 <86693969-59bf-5bcc-42a3-b6e94a0d6f3e@linaro.org>
 <fcfc8ba4-40a7-da43-3375-712bd7e7f4d5@starfivetech.com>
 <20230504-worshiper-ongoing-5581e1f2c2c4@wendy>
 <2f473307-2219-61a4-fa66-5848fe566cf0@starfivetech.com>
 <20230505-magician-poet-724c96020c2f@wendy>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230505-magician-poet-724c96020c2f@wendy>
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_184559_776067_F45E23CC 
X-CRM114-Status: GOOD (  12.14  )
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



On 2023/5/5 20:38, Conor Dooley wrote:
> On Fri, May 05, 2023 at 09:29:15AM +0800, Changhuang Liang wrote:
> 
>> But if keep this "starfive,jh7110-aon-syscon" compatible. Which .yaml match to
>> it? Use this series dt-bindings or syscon series dt-bindings.
> 
> There is no syscon series anymore, it's part of the PLL series now:
> https://lore.kernel.org/linux-clk/20230414024157.53203-1-xingyu.wu@starfivetech.com/
> 
> I don't really care what you, Walker & Xingyu decide to do, but add the
> binding in one series in a complete form. It's far less confusing to
> have only have one version of the binding on the go at once.
> 

Hi, Krzysztof and Conor

Due to the current aon pmu needs to be adjusted, it affects the syscon in PLL series.
So It's inevitable to change syscon in PLL series.

My current idea is PLL series don't add the aon_syscon node. I will add it in my
aon pmu series in next version like this:

aon_syscon: syscon@17010000 {
	compatible = "starfive,jh7110-aon-pmu", "syscon";
	reg = <0x0 0x17010000 0x0 0x1000>;
	#power-domain-cells = <1>;
};

In my opinion, the first we add "starfive,jh7110-aon-syscon" because "syscon" can 
not appear alone in the compatible. If we have "starfive,jh7110-aon-pmu", this
"starfive,jh7110-aon-syscon" is not a must-be need.

Do you agree with doing so.

Thanks,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
