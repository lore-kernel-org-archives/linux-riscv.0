Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5449C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3JE6UWA2OHl3SPLagj3PtZOvobkX/R2Mk5rt+lBAy0=; b=sEwG/muFNtOccn
	Rq4/Hjx0jekUBW7PgCJFdbmBGm8o7aZ/PJn0KoeoL9g7SJ6G4w0nSHTx3FouazfrupOfNUBs/wrwz
	hcJL9//rZsInFM6SqUzJMqBcrhuTGZYeNaoIGQOucEYq6LW7nELGYjz6C5JAZ8MWPhC3cufwEXvxB
	Xaezf/S/+5UZgIaRIRbaeCnpBcdUGONcgidfA91Av5ITDo6BMfFZeEHwgRnvOQ8E8ymwVGSLMRTwu
	BJM8Uqo33R/3g4Px5/QquDhHr3lRMmEyVK21/E348B4fEbtNbgzPEFh4WF0Bfjx5xlmTmvCBlSFof
	bSy8jo4fEn18V9CkLtAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwoc-00Bqfg-Oq; Tue, 15 Nov 2022 14:21:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwoZ-00Bqck-CI
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 14:21:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668522087; x=1700058087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T9xa+wT894O/BNbmmhpsL2DaZVMB3Ufsjex3WlA9okU=;
  b=0uzJRnAB5j83nNnHX+XcOofJYxvpqCstI2RG8PYOhNicRZxUe1dv408s
   XBBxbOdBAlA1UL9R7xDVX7zKR8hyhN7B6ROxFYm03jaDJdIQ1qvgmeSas
   HAX1xhqW9d8nBu9llQPi8OCg7BfoWtTWIqUPU4CWeozrQ3Ws4ooxoApPS
   GJZ+GZ2dbkCwCbqa0avnfx7yLYBCBOwSDvGvbQpyVZ9c6UCItuAcA0Lv0
   XpKAUXt9OidgyjLIvUxiZm093Se0Xuyryw2dEEz2dBo0NwI8A76fC8OhF
   lHraiNpJGCS/EZqWd1QTXQVXx2XKixNisbLRXfMRzZvoarOc3+/LfUKdm
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; 
   d="scan'208";a="123510930"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Nov 2022 07:21:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 15 Nov 2022 07:21:16 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 15 Nov 2022 07:21:13 -0700
Date: Tue, 15 Nov 2022 14:20:56 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/3] RZ/Five: Enable ADC/CANFD/I2C/OPP/Thermal Zones/TSU
Message-ID: <Y3OgSAnst0qt5WSk@wendy>
References: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_062127_565399_19D72DC2 
X-CRM114-Status: GOOD (  15.48  )
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

On Tue, Nov 15, 2022 at 10:51:32AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series aims to enable support for below blocks
> on RZ/Five SoC/SMARC EVK:
> - ADC
> - CANFD
> - I2C
> - OPP
> - Thermal Zones
> - TSU
> 
> Note, patches apply on top of [0].
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/log/?h=renesas-riscv-dt-for-v6.2
> 
> Cheers,
> Prabhakar
> 
> Lad Prabhakar (3):
>   riscv: Kconfig: Enable cpufreq kconfig menu
>   riscv: dts: renesas: r9a07g043f/rzfive-smarc-som: Enable
>     ADC/OPP/Thermal Zones/TSU
>   riscv: dts: renesas: rzfive-smarc: Enable CANFD/I2C

I know ~nothing about your SoC so idk if the values are correct, but I
did give it a go earlier to see if it did anything warning wise. Seeing
that it didn't cause any I am curious - how come these didn't land in
the original dts? Just waiting for driver stuff to land to support it?

Anyway, no new warnings which is what I care about - I suppose that
makes it an acked-by?
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Can include that tag if you like. Either way, nice to see some of the
/delete-node/s etc being removed.

Thanks,
Conor.

> 
>  arch/riscv/Kconfig                            |  2 ++
>  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |  2 ++
>  .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 11 --------
>  arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 27 -------------------
>  4 files changed, 4 insertions(+), 38 deletions(-)
> 
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
