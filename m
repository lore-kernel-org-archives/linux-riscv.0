Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C727C76196
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 02:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSdBn0U9vC2dV3a06fdu1IBv/vHUiCzCTGpc0BgdrwI=; b=QrUaMjIK5SDKov
	nvgSf6NbGqOg+95FXk2hL0hx+l7/78u5stIKE8Dsk1HWHUtFmj5o8X3tMmUErwb4lpoPB0P1kvegV
	dma0hKBDvxrXZK4A8h4T22GHDmaXvj0JuCzHLVzyH2FADXt85w9f1QF2pdPVWw0ffEytUDEAjevtz
	Z8SkTmwgkaPA0CSMAT0khbmWoialj8Z40G8h7iw9cfkVzfJrXXkn4jmrtenH3WduG29Yvftq+yJdi
	Z4t03zHcYhBZgmKn+36eZtiNpuMqoUpafWdmwHqET46b4KEfrjTuLvHkBGU1mvJQ/xGMY0IyIbXd6
	uLwHRUKS2mjL11cQgJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phLNM-00GKjC-1a;
	Wed, 29 Mar 2023 02:17:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phLNK-00GKiC-04
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 02:17:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 76746B81F91;
	Wed, 29 Mar 2023 02:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235D6C433EF;
	Wed, 29 Mar 2023 02:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680056238;
	bh=HFOVDJOz0rbImC9oGs5gHJAEVLKuq6QbRug+jFmJR5Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BLYaPxU7FwPY+yezNxX8b+04N3VOjJX1R4VH9FfD2FmrXIPxaWF9GXMx+bR+wGUgq
	 FcTP3nGb5mD360od7UXDV+CsJdl0B/z0xYOLo8t2AueXz9/bvW4nWy0aH19dWvWJCv
	 rngogYAcmgzwCYs3tXrQ/7lJbby6V072F9ly974jhtWzPaAH+94fgAxhMlQNzXni+e
	 /KEc+cgXRrTQnH1mZHNT6HaMDJniM5DwMpw5vejG1mjqLxvp9nMQ9/2q1O7+Q9guV1
	 b7UFbDATJ3YUpZXvh825j2ta0uxs/YMWBNYGBQmv/GtI1SDseD25/1pmvmLmfazqzb
	 9zyosH8AZMpHg==
Date: Tue, 28 Mar 2023 19:17:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Samin Guo <samin.guo@starfivetech.com>
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
Message-ID: <20230328191716.18a302a1@kernel.org>
In-Reply-To: <20230328062009.25454-6-samin.guo@starfivetech.com>
References: <20230328062009.25454-1-samin.guo@starfivetech.com>
	<20230328062009.25454-6-samin.guo@starfivetech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_191722_214939_7BFD15BA 
X-CRM114-Status: UNSURE (   8.66  )
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

On Tue, 28 Mar 2023 14:20:08 +0800 Samin Guo wrote:
> This adds StarFive dwmac driver support on the StarFive JH7110 SoC.
> 
> Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>

Excellent, now it applies cleanly :)

Our clang build with W=1 complains that:

drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c:37:2: warning: variable 'rate' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
        default:
        ^~~~~~~
drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c:42:36: note: uninitialized use occurs here
        err = clk_set_rate(dwmac->clk_tx, rate);
                                          ^~~~
drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c:24:20: note: initialize the variable 'rate' to silence this warning
        unsigned long rate;
                          ^
                           = 0


not sure how you prefer to fix this. Maybe return early?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
