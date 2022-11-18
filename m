Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD5BC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 06:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFQAAo+GNxwsm29mSqSgDTdc3i8qOdzA3txj0eSLH7E=; b=PaNg2ElG8ng9YU
	rOeLscQwCLiWK3F7Hu6DZu1159q+fcueGI/dVXxU7ZZ9ZMZbhKikwRwhtFE3t2pESn5mPMXfjaM7H
	eeASK43rMuD/R4PMjxCy6PIt0rI7JFnx/tMhEm5krfvdG8CUav78ZJS3w1rwZQLfN03R0Nj4lNoDz
	qpaxyBBip8HRhRqcc3658uRcJ7wYcQHTc65lKmqv2re+dUeWd+jx6O7UlXeyxBxHLAqQedC/V4I0Y
	GDm1didcJNRmkKB5dNLZQ8s8pIItCw9NlCRG7YMsXEmJKw2gJOiZFXNjO3aA/EJ0TbyMqStLWe7Eg
	K9Jnu1P0gXq5vGovYsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovvJs-002SsL-Uq; Fri, 18 Nov 2022 06:57:48 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovvJn-002SqM-PO
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 06:57:46 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 42FBB24E07C;
	Fri, 18 Nov 2022 14:57:15 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 14:57:15 +0800
Received: from [192.168.50.235] (183.27.96.116) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 14:57:14 +0800
Message-ID: <676607a9-2fbc-0bd6-8209-650547dd21e3@starfivetech.com>
Date: Fri, 18 Nov 2022 14:56:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 2/5] dt-bindings: pinctrl: Add StarFive JH7110 sys
 pinctrl
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jianlong Huang
	<jianlong.huang@starfivetech.com>, <linux-riscv@lists.infradead.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, <devicetree@vger.kernel.org>, "Emil Renner
 Berthing" <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
References: <20221118011108.70715-1-hal.feng@starfivetech.com>
 <20221118011108.70715-3-hal.feng@starfivetech.com>
 <166874355750.392596.1548443526558920682.robh@kernel.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <166874355750.392596.1548443526558920682.robh@kernel.org>
X-Originating-IP: [183.27.96.116]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_225744_114440_7B776472 
X-CRM114-Status: GOOD (  12.33  )
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

On Thu, 17 Nov 2022 21:56:14 -0600, Rob Herring wrote:
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.example.dts:21:18: fatal error: dt-bindings/clock/starfive-jh7110.h: No such file or directory
>    21 |         #include <dt-bindings/clock/starfive-jh7110.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1492: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221118011108.70715-3-hal.feng@starfivetech.com
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.

This patch series depends on the patch series [1].

[1] https://lore.kernel.org/all/20221118010627.70576-1-hal.feng@starfivetech.com/

Best regards,
Hal

> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
