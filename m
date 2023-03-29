Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D5AC74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 06:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8L+vivnET9J72IjSem2frdmE9ly6dpokePo/EU7n8E=; b=d2ez1odw+3Fe6G
	22y/ayB9L9AP6AXE/rKsMYUnw8woyEyP1dBrZE1G3/oNHdhAbsTVqdhW/Gf1/xwubGcVqAyCzReBP
	UV+jEt+VcdJQV9pZ+TdCs7t/x2m33nrz+QcPL9f165Z8vRrr+6+2QIov4tFAgSvhG5zNWLmVuA0rb
	8L62pvIiHL7Et/lJ4hkZcYOOXSxVzoenxGgPC3KWMoHmeifE+TploQdd7/XmchG8HmgCPPav5Ba4W
	0xeDBLuOu2jsRTyAEaVKD2Rep3OtuyhQs2ozJYLSPbLk3aoKdCzdm2d4kJcnzgckw3jsFzKg2cDpu
	aga7ToPgKEJV1esOfTEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phPFn-00GnkJ-09;
	Wed, 29 Mar 2023 06:25:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phPFk-00Gnib-1z
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 06:25:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BFDBAB82012;
	Wed, 29 Mar 2023 06:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBE1C433D2;
	Wed, 29 Mar 2023 06:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680071143;
	bh=58+TN5T0+QqVRS20B5Y2g96nsW5P5e4yB9oBRdQxQUE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bmp/jVkYGlPKwlDUOCwbyn4BQA+z6qAuxf6+14Evq4w9P9TYv+e3PnlI15k2/vlfP
	 MjnvP7IC8LIBdmMObfHqjtzD4DH4qGPt8aOKoflWptDTXZ0ZY+0TWS/kiT975YEpDP
	 pkkUyCm7bAZuVABxmUg+OiZoGYUIPHMzF3mNUMuC1PhR7Cs/csNCXS3pqMKRuJjUfA
	 Kc9G1RmxHqdShSjDrv6TmPYL3E6eJyCClAzErsfsVbr3VU0TzMmvqZNjZZ7yBxWysL
	 //x/987vYKpd24QP5DNTrfff8Ofyfh23Brze5v6vBWFkCnBvyCDeTsS5aUwN5Kf4sI
	 7H198CtZ3IdHw==
Date: Tue, 28 Mar 2023 23:25:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Guo Samin <samin.guo@starfivetech.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
 <kernel@esmil.dk>, Jose Abreu <joabreu@synopsys.com>, Richard Cochran
 <richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
 <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
 <yanhong.wang@starfivetech.com>, Tommaso Merciai <tomm.merciai@gmail.com>
Subject: Re: [net-next v9 5/6] net: stmmac: Add glue layer for StarFive
 JH7110 SoC
Message-ID: <20230328232541.5539bce6@kernel.org>
In-Reply-To: <f8be0cf7-fe78-7e63-7fbc-78d083a9f186@starfivetech.com>
References: <20230328062009.25454-1-samin.guo@starfivetech.com>
	<20230328062009.25454-6-samin.guo@starfivetech.com>
	<20230328191716.18a302a1@kernel.org>
	<f8be0cf7-fe78-7e63-7fbc-78d083a9f186@starfivetech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_232548_819405_F57A67FC 
X-CRM114-Status: UNSURE (   9.87  )
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

On Wed, 29 Mar 2023 10:57:00 +0800 Guo Samin wrote:
> static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed)
> {
>         struct starfive_dwmac *dwmac = priv;
>         unsigned long rate;
>         int err;
> 
> 	rate = clk_get_rate(dwmac->tx_clk);
> 
>         switch (speed) {
>         case SPEED_1000:
>                 rate = 125000000;
>                 break;
>         case SPEED_100:
>                 rate = 25000000;
>                 break;
>         case SPEED_10:
>                 rate = 2500000;
>                 break;
>         default:
>                 dev_err(dwmac->dev, "invalid speed %u\n", speed);
>                 break;
>         }   
> 
>         err = clk_set_rate(dwmac->clk_tx, rate);
>         if (err)
>                 dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
> }
> 
> What do you think?

Yup, that's even better.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
