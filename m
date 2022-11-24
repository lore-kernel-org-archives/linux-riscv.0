Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC08C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 01:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpKMHbes+Pa4EhxoVlZNG9z7KmEf9r84WJ1JNrlyKo0=; b=XYnpODifTbMHYS
	InITz+mykPDSBZ1zeGVWBJ7el6GxN9AUJ0qTRZ3+rRmjfKv3BE7/HB/Kll6FOciE0Dtcf8Hn9NPZP
	3fHe67sckS55ZJIPEziLfgX1Gs3t9bvxTq2rjS+OUGLYuw3YAU1761D5FPSAOphCUKVN8RR+K8Q1l
	D0tCaiPLgC7YBDITQxkp1FNx0ca8EtHg4FGUk/u1cEjUQjP6kdTf9MdzUfRDwiDaYH2dwVkAs5zw8
	onGSI1JF2GCY5h8BOYpbIlRGSzGuBmXN98y0monagPa7pqnNsivv4+x/4uTxlTBkfla7mLUWreIms
	VHw3QNH7JJigh9sHywiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy1VJ-003cFK-HD; Thu, 24 Nov 2022 01:58:17 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy1VD-003btz-R4
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 01:58:15 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 3CCD724E15C;
	Thu, 24 Nov 2022 09:57:16 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 24 Nov
 2022 09:57:16 +0800
Received: from [192.168.125.106] (183.27.97.81) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 24 Nov
 2022 09:57:15 +0800
Message-ID: <f26a5b7e-4329-67fe-5179-f8cd255de032@starfivetech.com>
Date: Thu, 24 Nov 2022 09:57:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 1/8] dt-bindings: riscv: Add StarFive JH7110 SoC and
 VisionFive2 board
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier
	<maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Linus
 Walleij" <linus.walleij@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-2-hal.feng@starfivetech.com>
 <202211190418.2AJ4ImtE072425@SH1-CSMTP-DB111.sundns.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <202211190418.2AJ4ImtE072425@SH1-CSMTP-DB111.sundns.com>
X-Originating-IP: [183.27.97.81]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_175812_169644_10CC3ABE 
X-CRM114-Status: UNSURE (   9.11  )
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

On Fri, 18 Nov 2022 19:31:36 +0800, Conor Dooley wrote:
> On Fri, Nov 18, 2022 at 09:17:07AM +0800, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> > 
> > Add device tree bindings for the StarFive JH7110 RISC-V SoC [1]
> > and the VisionFive2 board [2] equipped with it.
> > 
> > [1]: https://doc-en.rvspace.org/Doc_Center/jh7110.html
> > [2]: https://doc-en.rvspace.org/Doc_Center/visionfive_2.html
> 
> Could you make these two into "Link:" tags please?
> Otherwise,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

OK, will fix it in the next version. Thanks.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
