Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0481C83F14
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 07:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTnkmEdD6MivKXg7sgBw0A+jY9bdL2WTvNIVbywGxRw=; b=l8ttwCLHZusXo2
	C+N6Z54UQ15vZ9xsbuHuaOpm0++uyqb5VPu7iOplnCWwdbDo0RsSakjmj0k34M0/Ld2s/WRvyOlMg
	m8nPthBvoiRVotuy5HBxFqN1X6PSXsHfVWWMTq1FOmptMoTfv7jgj6v4hFVxqorImXmxlFbuI5Q4i
	2n2j5kpW6QkVbhV+9ceIRNsrgAgI1XSK4SUUHoVobVJrZkyWJpYHo3gUq6OcurYwlqtgk3Ypci9Ho
	Gm2pwMuhh2w1XiZc7cFes4RoYbnrtqQJxK0as6zZJCG0gMUK/sHg5PsclTtt/Qme4CnhiFbfOKR1f
	SvImkd8eWhC9rkYV65dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qatPs-00Ay8V-3D;
	Tue, 29 Aug 2023 07:45:37 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qatPo-00Ay5k-1R
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 07:45:35 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id BAA887FC9;
	Tue, 29 Aug 2023 15:44:42 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 29 Aug
 2023 15:44:42 +0800
Received: from [192.168.125.72] (113.72.145.245) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 29 Aug
 2023 15:44:41 +0800
Message-ID: <ddb9fe8e-4d64-4a7a-284f-e8b7dfc03966@starfivetech.com>
Date: Tue, 29 Aug 2023 15:44:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RFC v4 4/4] riscv: dts: starfive: jh7100: Add PWM node and pins
 configuration
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pwm@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Thierry Reding
	<thierry.reding@gmail.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@pengutronix.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Paul Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230825081328.204442-1-william.qiu@starfivetech.com>
 <20230825081328.204442-5-william.qiu@starfivetech.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230825081328.204442-5-william.qiu@starfivetech.com>
X-Originating-IP: [113.72.145.245]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_004532_672611_A726B8AA 
X-CRM114-Status: UNSURE (   4.11  )
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

On Fri, 25 Aug 2023 16:13:28 +0800, William Qiu wrote:
> Add StarFive JH7100 PWM controller node and add PWM pins configuration
> on VisionFive 2 board.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
