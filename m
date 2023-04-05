Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECA5C7619A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 21:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0aGwK3T7NzXaMRc56sNRuEBwoGyPIHMxhwXzGHq+cM=; b=4ePBeHiJt5vXwE
	VcynrbCcLRAblQ1dopu/sBSqVMQBQ0+nYSzMW5kUMaM0FNa/t5Fvw7ejxvXt2/pR8HNxo9W8IP0fg
	LUPue8BIBFMDLy52TlnF67riI7obWZcHo5e11zDrDbXkPcAD5AWMrXxvZlJNKLN8gz2aaFmOM9Dru
	ey9nHUjTTeOo3F+OWThZN/dDRub+miUbxhsE9phNt7Frqor0h7oqjuQ4rk6We/ckzf7OQbBzf66jw
	UVryEDN0jr4hnQqBJqYAOdPnTinHob6ypQ2hAN8X7A3yD3B50AukOKZ3GdsifO6/sbtYi1ouufqy3
	N76kiHtze+uc9ooO1BmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkAjp-005joL-0A;
	Wed, 05 Apr 2023 21:32:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkAjm-005jnv-18
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 21:32:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E5EC164149;
	Wed,  5 Apr 2023 21:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F616C4339E;
	Wed,  5 Apr 2023 21:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680730333;
	bh=ZYZdVwjMqTBVBqbOREzP3WGiwNtKl7X0AW2KpDiF5Ak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qVFH337fZB65dZthbJjHQjCHT9K0MYnncK7lreCGZYiCg3v6yhy10TSuWvklUzlCe
	 ac2QmZICG3nHF+5P8AE9UfUQNnsNMQdXF2Ih/Ymfy2Wwd9Q/KZPX1+W3pSTRJrCwyJ
	 St0XMmFyV64kAhh1kYAjCG3nyB3Fe/cvozReILboJQ1BgTOlgnid3nS9TVrLpEG9iW
	 z+wZnY8/7fjfp0ngFIEEDfdDAH8y7ed5zzsKUxamD5btKo0bwx7KiVQzg2hyBzKLzY
	 Mmp10FVIjYFbDpubGwWFIJ1P6JzeCMNC2Pe8U2ENGqAH7HyIkr84DR3WdUzN4mCnaj
	 II/nkpsPvWj9Q==
From: Conor Dooley <conor@kernel.org>
To: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/22] Basic clock, reset & device tree support for StarFive JH7110 RISC-V SoC
Date: Wed,  5 Apr 2023 22:30:45 +0100
Message-Id: <20230405-wharf-rejoin-5222e5958611@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401111934.130844-1-hal.feng@starfivetech.com>
References: <20230401111934.130844-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=4xdzTSoq3uZ4FVpJV9Db9fLME5Mlhkbk3nlXZWw5e0A=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCm6L5o5ZL4EGarNDnjAsS2G/efL0C9fE1ZU3vmjmmf4c Efr5Hf/OkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCR5jyGf0ZuRvlXBA6/CdjM FaeX867RpMiBeeKtSw0Zgf6341e8dmf4zZqZ3G1mK/v6feLC+dvlOuO6pDwXmGxPTTZ9zl3zsnY WLwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_143214_466328_F04C80E9 
X-CRM114-Status: GOOD (  14.65  )
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

On Sat, 01 Apr 2023 19:19:12 +0800, Hal Feng wrote:
> This patch series adds basic clock, reset & DT support for StarFive
> JH7110 SoC.
> 
> @Stephen and @Conor, I have made this series start with the shared
> dt-bindings, so it will be easier to merge.
> 
> @Conor, patch 1, 2, 16~21 were already in your branch. Patch 22 is the
> same with the patch [1] I submitted before, which you had accepted but
> not merge it into your branch.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[01/22] dt-bindings: clock: Add StarFive JH7110 system clock and reset generator
        https://git.kernel.org/conor/c/7fce1e39f019
[02/22] dt-bindings: clock: Add StarFive JH7110 always-on clock and reset generator
        https://git.kernel.org/conor/c/3de0c9103258

These two are shared with clk.

[16/22] dt-bindings: timer: Add StarFive JH7110 clint
        https://git.kernel.org/conor/c/1ff5482ab9a5
[17/22] dt-bindings: interrupt-controller: Add StarFive JH7110 plic
        https://git.kernel.org/conor/c/8406d19ca049

I took these bindings too, as Palmer has done that in the past for new
SoC support.

[18/22] dt-bindings: riscv: Add SiFive S7 compatible
        https://git.kernel.org/conor/c/8868caa2a073
[19/22] riscv: dts: starfive: Add initial StarFive JH7110 device tree
        https://git.kernel.org/conor/c/60bf0a39842e
[20/22] riscv: dts: starfive: Add StarFive JH7110 pin function definitions
        https://git.kernel.org/conor/c/e22f09e598d1
[21/22] riscv: dts: starfive: Add StarFive JH7110 VisionFive 2 board device tree
        https://git.kernel.org/conor/c/54baba33392d
[22/22] riscv: dts: starfive: jh7110: Correct the properties of S7 core
        (squashed)

Hal, can you get your folks to resend whatever dts bits that are now
applicable? IOW, the dt-bindings for the entries are in a for-next
branch for some subsystem.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
