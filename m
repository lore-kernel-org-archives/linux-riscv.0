Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A212EC32771
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 00:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/RFquxsYHWDphhd1MLe/jpghdUhuRMIhPNl8B4CVFc=; b=r50Ja9XjicLa+E
	wlAkhukSYBFCFeIrWie/umnhXnZW2PBDcoZT+OUyN1on7pw8BUhcik3D0DECVsgNzgXp79iIl+c17
	NnxwmrNNWHeMCjbmStTWs9O/JVnkI13jcHoiSZshZ0n0NVmXGGxdUY/UoZExSBbh8vCsKZ4GT+1yy
	IdYKevsJnZEJPSz8NfhigZT4/ScZp1VrIjbZC9ep/mchaYRMJZh0Nhz/Kzep7+/YIE6z6RZKEytU5
	p5hE2KwmCimoQcI25QxCOEdNZvafwcfHahCTnd7jVFny9AQvKCP4d5FVYro3tC0oHRGadIApTiPVp
	h66+575BUnZhUV2l24Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odhTT-000k0f-8m; Thu, 29 Sep 2022 00:32:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odhTQ-000jzo-Nt
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 00:32:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 16CEBB82239;
	Thu, 29 Sep 2022 00:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0221C433C1;
	Thu, 29 Sep 2022 00:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664411535;
	bh=IBKEGiblRpJ3fhBqxt2kaFHJ6u1oFa0nleCBfUtKjLo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NGxWz+EjeDeIPO//N47S3UPA7K3C9Nbw5ukc5iDp3A0MnUWVvTS/Ir8VOZvCq0CY/
	 CKMQmsIZrmYkM30lWzlgDeFm6hcu7cLUp04X3C9Td1LANaOD27MvK3bxH9xSDiDXzl
	 yS8nl8Q73+gCd6KllS0Y00LHKAxES4ZhPojGuc8sPT3dnlWrzNHpjQMgu5ag271u8g
	 HVYGqMQIfXQGYDbalSvjMDj+yLgPEGa8i4MJfL3QGGvChdGOrPa0Tj7+fg6koGh/iz
	 f8dwsp097ugYjtoslUvEe8N9ZkmtdUbCR8LmYs3Vefji4wU428he9ySFsgS/A973Tp
	 mLLnElISCJVjw==
MIME-Version: 1.0
In-Reply-To: <20220929003030.0A61AC433D6@smtp.kernel.org>
References: <20220909123123.2699583-1-conor.dooley@microchip.com> <20220909123123.2699583-2-conor.dooley@microchip.com> <20220929003030.0A61AC433D6@smtp.kernel.org>
Subject: Re: [PATCH v5 01/14] clk: microchip: mpfs: fix clk_cfg array bounds violation
From: Stephen Boyd <sboyd@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 28 Sep 2022 17:32:13 -0700
User-Agent: alot/0.10
Message-Id: <20220929003215.C0221C433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_173220_947134_94CE8FA6 
X-CRM114-Status: GOOD (  16.16  )
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

Quoting Stephen Boyd (2022-09-28 17:30:28)
> Quoting Conor Dooley (2022-09-09 05:31:10)
> > There is an array bounds violation present during clock registration,
> > triggered by current code by only specific toolchains. This seems to
> > fail gracefully in v6.0-rc1, using a toolchain build from the riscv-
> > gnu-toolchain repo and with clang-15, and life carries on. While
> > converting the driver to use standard clock structs/ops, kernel panics
> > were seen during boot when built with clang-15:
> > 
> [...]
> > 
> > If parent is RTCREF, so the macro becomes: &mpfs_cfg_clks[33].cfg.hw
> > which is well beyond the end of the array. Amazingly, builds with GCC
> > 11.1 see no problem here, booting correctly and hooking the parent up
> > etc. Builds with clang-15 do not, with the above panic.
> > 
> > Change the macro to use specific offsets depending on the parent rather
> > than the dt-binding's clock IDs.
> > 
> > Fixes: 1c6a7ea32b8c ("clk: microchip: mpfs: add RTCREF clock control")
> > CC: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> 
> I'll merge this patch over to clk-fixes as well.

Great I see it's already split out and on fixes branch. Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
