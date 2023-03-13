Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CC1C6FD1C
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 03:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7K844KTKsW0rzGkg0oMYnHf3Wx36z9pCjezlapBm3Fw=; b=CSd4bM01hFxVEQ
	7vYec/2vRiOYX4Cw+ed4lfRD9Qpyjl1uqVaBOitvX7v65Neab8lDvwk2MZOa49RwwfMvKE6ZaDDAR
	rXwbYpT2sEKqUJDxamAf4t8nJnF4Pzfvr5Ps3rSfNNW9Kp+B/IoGka2o1AOtviJILsWB2hLR74cQd
	SEv+YzdFMLjx6R/az911a++W1ejl7Js47WgRwgIq4DdywBK/xmbtFsNvlZkj0nY0/KU4qdUVpOfgk
	uHaxutkdx/fDhSOyhkcR8iXdYh0nsFwORbMhDipZMeU/tTnaTQzkRYO94QlDw8MISZaSdrz2cgi33
	oxlIw4An48REAtRWUxzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbYTN-0046ET-3D; Mon, 13 Mar 2023 03:03:41 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbYTJ-00462x-Dg
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 03:03:39 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9644824E3E2;
	Mon, 13 Mar 2023 11:03:08 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Mar
 2023 10:37:35 +0800
Received: from [192.168.125.74] (183.27.96.115) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Mar
 2023 10:37:34 +0800
Message-ID: <afee6601-e21c-5cde-deab-221420de68e9@starfivetech.com>
Date: Mon, 13 Mar 2023 10:37:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 03/21] clk: starfive: Rename clk-starfive-jh7100.h to
 clk-starfive-jh71x0.h
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-4-hal.feng@starfivetech.com>
 <c7e5a23a-16f9-4e30-adc7-a422abeb50ef@spud>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <c7e5a23a-16f9-4e30-adc7-a422abeb50ef@spud>
X-Originating-IP: [183.27.96.115]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_200337_669021_27929649 
X-CRM114-Status: GOOD (  10.32  )
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

On Sun, 12 Mar 2023 14:00:23 +0000, Conor Dooley wrote:
> On Sat, Mar 11, 2023 at 05:07:15PM +0800, Hal Feng wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>> 
>> Rename clk-starfive-jh7100.h to clk-starfive-jh71x0.h for making
>> the code to be common.
>> 
>> Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../clk/starfive/{clk-starfive-jh7100.h => clk-starfive-jh71x0.h} | 0
> 
> So this patch has broken the build :(
> https://patchwork.kernel.org/project/linux-riscv/patch/20230311090733.56918-4-hal.feng@starfivetech.com/
> 
> I would imagine it is because you can't rename the header without also
> changing the users of the header.

Will fix it later. Thanks for pointing it out.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
