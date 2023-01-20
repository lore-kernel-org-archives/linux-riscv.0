Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5FEC25B50
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 22:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7WAA+Sv5SCFvs+ofciJOpWyy/f5UFBRjVisNJ01vxLI=; b=kvM0iLP6oNgCVU
	3jK1+snw+av5XMCcn7ObvtlnyZUe1h278jQygKPDk4OlJ2NxSzmKCWovq73J2G2HU+OPR5f/FLyIp
	F9hwAVIITVLt8kVbzOZU8JycaoDe3mgnpMc/y38YXPFk4k7M9BFtn+or/scEvTurqpM7OSYilOgbV
	e7Lc9QiXYkwnqoqPFlQuJjoJswDLnAKirqGtcsrQkX77kW3yZ8chVjzKXsWw5mbuCiSMKvMSGjPV3
	VM/HkXkItxHyfLi2FobS+cmjollrnBLVTTUj9HgGTYzPnW9k03rKddHDnyv/lk5wS1uxpP8W4A4kc
	CLOVgWaXnBSQhH/G2KvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIzmV-00CVAW-9s; Fri, 20 Jan 2023 22:22:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIzmS-00CV9f-By
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 22:22:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F0E4DB8281D;
	Fri, 20 Jan 2023 22:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E812FC4339B;
	Fri, 20 Jan 2023 22:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674253357;
	bh=/B3zFHsbmUuGcZFPrh9xj1KkPrOVA+AyCX+HZKfxBSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fpYwxFukNmMNbXlyBZIS3seg83mrQYDkDXJPUU2/yt0Sevg1q41fnxmiXxikKHr+K
	 TaLL6FeojH28nSTCZxdFLaESnSk7UrMiN4gRc4ykfl8JR4YRWwS1hJeGk/Jr1ruxuV
	 Ksb0N/mBWl5NYBvUfxm4eZQeo3vXCN/qZTWtB6ZyO4UrUzmQ6VuO5n8Z+GGZBCZ7fo
	 xxY+FsODVZgWKliDzH3WD+r6J+fdDsaUJC1M9o8fZTzfQhXmcdFmPNNgWj1VvtqI4r
	 r+XP9P/ikkE/LATGVdkctIEICL5/cWnvppt4tTnXwnpA30gyW/r2E6x31TDbTUIfbs
	 GbayQlsvzsiuQ==
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Walker Chen <walker.chen@starfivetech.com>
Cc: conor@kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] JH7110 PMU Support
Date: Fri, 20 Jan 2023 22:21:54 +0000
Message-Id: <167425300253.196995.6414153954346182622.b4-ty@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119094447.21939-1-walker.chen@starfivetech.com>
References: <20230119094447.21939-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=934; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=PKB/daeDLqS7LF3I2YHL9Fy5Hx8w0JBq6gduu4aGKmM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMmnhf849mce2XZrb5Z/abxJmdacbacr3FcbLMhLFJiWp2Kt vep/RykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbi9YuR4VD73DnrulU3XPO+tuteo8 LEe3zGwasXsmxI29R5YmHFibOMDG8nKkzUjnz1Xr77VVpwQGRhTsk63eB9830LCqs/HFnDyA4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_142240_603131_B314F682 
X-CRM114-Status: GOOD (  12.39  )
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

On Thu, 19 Jan 2023 17:44:45 +0800, Walker Chen wrote:
> This patchset adds PMU (Power Management Unit) controller driver for the
> StarFive JH7110 SoC. In order to meet low power requirements, PMU is
> designed for including multiple PM domains that can be used for power
> gating of selected IP blocks for power saving by reduced leakage
> current. The first patch adds device tree binding for PM domain provider
> and consumer. The second patch adds pmu driver and support JH7110 SoC.
> 
> [...]

Applied to riscv-soc-for-next, thanks!

[1/2] dt-bindings: power: Add starfive,jh7110-pmu
      https://git.kernel.org/conor/c/1fc7606d5083f79a20eb9cfd77c0dbd9299421c1
[2/2] soc: starfive: Add StarFive JH71XX pmu driver
      https://git.kernel.org/conor/c/08b9a94e8654d402bfd1f5496b077503d69aa2cf

I modified the MAINTAINERS entry to remove the include directory that
was deleted along the way.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
