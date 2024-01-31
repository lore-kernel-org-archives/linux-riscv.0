Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC0DC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 12:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9h9ZD32M5uPtj6yg3Da3JwG4+M9wCW4yi3Nt5muajE=; b=aDEwkE5WS1ExWh
	H5VrZFkjW7PGwY7dQnLnetNHhtNjPgB3gnf1Bl7c0CqBfoGtZxW9vNdnSNaW8aLmr3l1MY/hHwmb7
	yZK3MFFtFHWkHfn6UoC8zERFdU8CS1UeH69o6l3El794cRdtrHRY4cvVbXaaX3zx1jFDpFunVEJew
	8dhh2/7Kw9fLxLeK85+y2L4s6v2NROctTTKChU+Vf8aGmS+IQP4bREX/V67CuM6N23Qg+9EYn/Hge
	KdCzMj1hnIx985xrF2JHtEZOEXgMSPkNTnY0MkZfvFdOP9pYXvmcZ/Fz1La8gSJEf8zmY8hv5sCKz
	KSF4i1mRy/GPCdr5lRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9f2-00000003KSS-0MoH;
	Wed, 31 Jan 2024 12:25:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9ez-00000003KRc-3GPv
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 12:25:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D35A5CE2036;
	Wed, 31 Jan 2024 12:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3575FC433C7;
	Wed, 31 Jan 2024 12:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706703940;
	bh=pFsCpJSLk0dh72t0fhH3sbqbPwdiOraKzWAQDmmK2Xw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BKWUsnvXlCFIsCKmwvsVgtprb4GpHXt7/kVarXgzN9FU+EqkG3aUPMHTGnwceQR4h
	 VojfTgj3McCQ1IAayF4Jqy+eO5iQ3ZWjO1WENIP26Cg6lrDn2YvzDBbArS/l2VI+r5
	 8O1bXx27TXwTLe+c1L94liTE1gO/v/cq1T9IRu7/6d2rbzBE2/D9a/SsgA6uFF8XOq
	 canyBdS75OzFpREQbXSnVbRHAJHRwKyW32ME+HLt4rLsPuZqaiC5pFzpLDObJHjw3e
	 mB1b7SthXpeHcdVlZ1XECxatH0arF7IfJiYKCGWghX2/eBwTJM/orChLn6kWL1Y1/P
	 t3CacpRqXGJZg==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v6 0/4] Enable networking support for StarFive JH7100 SoC
Date: Wed, 31 Jan 2024 12:25:30 +0000
Message-ID: <20240131-sitter-parabola-8a2e86faa77f@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220211743.2490518-1-cristian.ciocaltea@collabora.com>
References: <20231220211743.2490518-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1081; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=QpjxKADVuxDHO2HHz1mJLhLzOw0DBvtxFU1iut/HhaM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKm7bCyjD5d2OlRF8PLW7+z+duVV4xQZhtszgq8axl4Ib TJrlfnYUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIlcmsrIsHbKbM4q7dOH3UPN g3u+C264YKjs8PpRb9Lv5o67C2V3dTEy7Lv3YLK2exd3R1fLkZe5Lw8fvqb1xjF07uOUS1PsNP6 b8gIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_042546_023254_CCBEC023 
X-CRM114-Status: GOOD (  10.04  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 20 Dec 2023 23:17:38 +0200, Cristian Ciocaltea wrote:
> This patch series adds ethernet support for the StarFive JH7100 SoC and
> makes it available for the StarFive VisionFive V1 and BeagleV Starlight
> boards, although I could only validate on the former SBC.  Thank you Emil
> and Geert for helping with tests on BeagleV!
> 
> The work is heavily based on the reference implementation [1] and depends
> on the SiFive Composable Cache controller and non-coherent DMA support
> provided by Emil via [2] and [3].
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/4] riscv: dts: starfive: jh7100: Add sysmain and gmac DT nodes
      https://git.kernel.org/conor/c/5ca37ca2a483
[2/4] riscv: dts: starfive: jh7100-common: Setup pinmux and enable gmac
      https://git.kernel.org/conor/c/6e204aa2116c
[3/4] riscv: dts: starfive: visionfive-v1: Setup ethernet phy
      https://git.kernel.org/conor/c/e16d3dc0a2d7
[4/4] riscv: dts: starfive: beaglev-starlight: Setup phy reset gpio
      https://git.kernel.org/conor/c/2db68ddbf33a

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
