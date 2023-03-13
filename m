Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F47CC6FD1C
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 03:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vP8D2oRNs9ZRS5elw3t8tEsRJogMfy3O6+TYiQZDCC4=; b=bjITyeqKz5d88P
	9+RqNXzKEZruH2AjvuQFqexlky06EXLrCw23/lQS+6xZLwdoFGDiIhM7qih0sOTj+v7ZkpsiJrUat
	JE89c5S/N0XpYNmvDEiPQAXMpqqx64q8h0iAc4yql2AUyIyP3BeqPFPCsIDQ3REQBGgI4I/kXAcjH
	1mLg6N0OstFiL5v35Hzv6zv01DBhgXvZPgRWb5ytqWNUcP3efZrEULHdL9FS0FsXWBjQ52aOERBDd
	W3uplRrFa1tww5HJv1exZqgZ/9Ri6ThfoIxiwdpWX0je2dMBDDMi38ffGLjy6WQ5yvzr2ZIOLCdQo
	craZr+SwdsM9MPOw1CtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbYQO-0045lz-Ep; Mon, 13 Mar 2023 03:00:36 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbYQI-0045jI-6T
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 03:00:34 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id D92C224E252;
	Mon, 13 Mar 2023 10:59:44 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Mar
 2023 10:47:59 +0800
Received: from [192.168.125.74] (183.27.96.115) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Mar
 2023 10:47:58 +0800
Message-ID: <80549148-1bad-9190-c4ea-a9555d15ca38@starfivetech.com>
Date: Mon, 13 Mar 2023 10:47:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 11/21] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Ben Dooks <ben.dooks@sifive.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor@kernel.org>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>, Thomas Gleixner
	<tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, <linux-clk@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-12-hal.feng@starfivetech.com>
 <167854282659.42837.5915012938593380363.robh@kernel.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <167854282659.42837.5915012938593380363.robh@kernel.org>
X-Originating-IP: [183.27.96.115]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_200030_587240_812FBEA9 
X-CRM114-Status: GOOD (  14.66  )
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

On Sat, 11 Mar 2023 08:17:00 -0600, Rob Herring wrote:
> On Sat, 11 Mar 2023 17:07:23 +0800, Hal Feng wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>> 
>> Add bindings for the system clock and reset generator (SYSCRG) on the
>> JH7110 RISC-V SoC by StarFive Ltd.
>> 
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../clock/starfive,jh7110-syscrg.yaml         | 104 +++++++++
>>  MAINTAINERS                                   |   8 +-
>>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 203 ++++++++++++++++++
>>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 142 ++++++++++++
>>  4 files changed, 454 insertions(+), 3 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>>  create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
>>  create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h
>> 
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 
> Missing tags:
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

This patch has been changed a lot and I am not sure whether it's still
the one you want. So I removed the Reviewed-by tag.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
