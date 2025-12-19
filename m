Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CEFD74965
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/j84sWrFCA8WKExX/jwlEeS6K6pT6Gqz8gcS+tnEf4M=; b=GdiBgEjn9rJiJj
	/fymDokqjxPLEP52yNKFWYKa10/aXvP6DHEgCfSpD2jCfVIbSG9TYBxK4DzwdYqaWnksbXobhuWfc
	TWutCnHQnT7Vobrve7Cr54ZQ0V/uI7RhasZimV35XCLbbbUWSmjyI/hNXV4e9Yasa7YUk3KUA2SUb
	kLdZ2q5HpTOqYttadHBtJ7jID54sE6/IQl+cHthsVOTtwgii+Q/d/kzqzKDh2HvSGBvWl2D1vr/Ds
	cQTqBJz3cTJXVRZ5DLGLA1WkDoibArJCg4YWCqZH658MSK/ZMJnSK4bMhKT78ELHbbCbK2PheViif
	FQutXdzYzJvwGeNtbhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVbq-00000009ooE-2HVm;
	Fri, 19 Dec 2025 08:13:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVbn-00000009on5-2XwJ
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 08:13:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 07FB7423D4;
	Fri, 19 Dec 2025 08:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4B5C4CEF1;
	Fri, 19 Dec 2025 08:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766131985;
	bh=f+RrjfVCBgq3UY1No8gqDTUXVFcFPU09Uy5DhqORVsA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hUEVguASheuvLht0vG4bqerZ4qXyBJDhgQ9N4gICfgoYkp2tcOdnUvuiXsQbR5vWb
	 2MRjucnHZFaLP+IyIrhDMjtcQrimJtAiPF3eUaYbb2pq1JHNoCEVbrjjm5QWaXWmap
	 5t+8ZZ0LESAAJYtRcrtT0UanhCz7t6IbAF+FGuj2iKcJ3RqMcK20pjvwfSWFdumvv+
	 9gGAeSRfvGhR5vWbNnUhVPf5wDsGT21A/Qu8Ua227VjPGRBi4Z9KPd2O2dfldfod2r
	 5YTbgYdRs8RmbJJZqTH1Z7OaiqsZxWPr3t+G0ETOpmGiz8S5gwVnw9jwhs/lv+SVDn
	 dfEXWXMQvPrqQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F3005380AA50;
	Fri, 19 Dec 2025 08:09:55 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/6] Add support for StarFive VisionFive 2 Lite board
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176613179479.3684357.2451207324135136166.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:09:54 +0000
References: <20251125075604.69370-1-hal.feng@starfivetech.com>
In-Reply-To: <20251125075604.69370-1-hal.feng@starfivetech.com>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, palmer@dabbelt.com, pjw@kernel.org,
 aou@eecs.berkeley.edu, rafael@kernel.org, viresh.kumar@linaro.org,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 bhelgaas@google.com, lgirdwood@gmail.com, broonie@kernel.org,
 emil.renner.berthing@canonical.com, heinrich.schuchardt@canonical.com,
 e@freeshell.de, devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001307_686976_9C3E8512 
X-CRM114-Status: UNSURE (   9.13  )
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Conor Dooley <conor.dooley@microchip.com>:

On Tue, 25 Nov 2025 15:55:58 +0800 you wrote:
> VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S industrial
> SoC which can run at -40~85 degrees centigrade and up to 1.25GHz.
> 
> Board features:
> - JH7110S SoC
> - 4/8 GiB LPDDR4 DRAM
> - AXP15060 PMIC
> - 40 pin GPIO header
> - 1x USB 3.0 host port
> - 3x USB 2.0 host port
> - 1x M.2 M-Key (size: 2242)
> - 1x MicroSD slot (optional non-removable 64GiB eMMC)
> - 1x QSPI Flash
> - 1x I2C EEPROM
> - 1x 1Gbps Ethernet port
> - SDIO-based Wi-Fi & UART-based Bluetooth
> - 1x HDMI port
> - 1x 2-lane DSI
> - 1x 2-lane CSI
> 
> [...]

Here is the summary with links:
  - [v4,1/6] PCI: starfive: Use regulator APIs instead of GPIO APIs to enable the 3V3 power supply of PCIe slots
    (no matching commit)
  - [v4,2/6] dt-bindings: riscv: Add StarFive JH7110S SoC and VisionFive 2 Lite board
    https://git.kernel.org/riscv/c/7a1e15b248d6
  - [v4,3/6] riscv: dts: starfive: jh7110-common: Move out some nodes to the board dts
    https://git.kernel.org/riscv/c/84853940a733
  - [v4,4/6] riscv: dts: starfive: Add common board dtsi for VisionFive 2 Lite variants
    https://git.kernel.org/riscv/c/2ad6d71a0de8
  - [v4,5/6] riscv: dts: starfive: Add VisionFive 2 Lite board device tree
    https://git.kernel.org/riscv/c/900b32fd601b
  - [v4,6/6] riscv: dts: starfive: Add VisionFive 2 Lite eMMC board device tree
    https://git.kernel.org/riscv/c/ae264ae12442

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
