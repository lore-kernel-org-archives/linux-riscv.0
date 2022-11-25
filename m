Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB0CC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 06:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whDQvY99mc3ax0afFmJOx7JasCeuNAacWKEe0GVCIDE=; b=bB9rb9sRtbEXJG
	+9cfvHWlrN3KS3vM+jJEQbZaiCfIhu9hP1oS6UomIk+oPHrHjeMORH7IqcxhRYZpDptTQx7AkkxkI
	MNVHgFgahkgJLDFXjOqJFOBNt4TWbUOjvR9CbWNSnMM1r9JswypgxxOGu0Pkfq48fyuUwJSmoykby
	gbrYapihFSe9w6ZiN1JsiWhemYmiHet8oqJO28KFcmPRy8YU/+nQoYrD2Ev8wiTS00RGPFUP7/Q6S
	OK4YhKEefntRHtEMyJ7RrUwLZVaXxCWVTxIkPgjaCSKi7ZsgHP0XAm8I+jg+cUyoxCQSNxMeIxtYK
	CLnDuyknab1CrvWFkHzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oySOm-00Dk6O-LP; Fri, 25 Nov 2022 06:41:20 +0000
Received: from [61.152.239.71] (helo=fd01.gateway.ufhost.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oySOY-00Djup-R2
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 06:41:19 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9286D24E35C;
	Fri, 25 Nov 2022 14:40:39 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 25 Nov
 2022 14:40:39 +0800
Received: from [192.168.125.106] (183.27.97.81) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 25 Nov
 2022 14:40:38 +0800
Message-ID: <72b3d10e-5a8e-ed42-6808-f53773913422@starfivetech.com>
Date: Fri, 25 Nov 2022 14:41:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 09/14] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-10-hal.feng@starfivetech.com>
 <1d62f95f-0edc-afd4-abb4-37fadc0b6a47@linaro.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <1d62f95f-0edc-afd4-abb4-37fadc0b6a47@linaro.org>
X-Originating-IP: [183.27.97.81]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_224107_055527_80FE4C8B 
X-CRM114-Status: GOOD (  11.31  )
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

On Mon, 21 Nov 2022 09:47:08 +0100, Krzysztof Kozlowski wrote:
> On 18/11/2022 02:06, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> > 
> > Add bindings for the system clock and reset generator (SYSCRG) on the
> > JH7110 RISC-V SoC by StarFive Ltd.
> > 
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> 
> Binding headers are coming with the file bringing bindings for the
> device, so you need to squash patches.

As we discussed in patch 7, could I merge patch 7, 8, 9, 10 and add the
following files in one commit?

include/dt-bindings/clock/starfive,jh7110-crg.h
include/dt-bindings/reset/starfive,jh7110-crg.h
Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml

Best regards,
Hal

> 
> > ---
> >  .../clock/starfive,jh7110-syscrg.yaml         | 80 +++++++++++++++++++
> >  MAINTAINERS                                   |  2 +-
> >  2 files changed, 81 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
