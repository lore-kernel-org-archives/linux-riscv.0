Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F85DC3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 12:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCHXitkmQP3AMu+1UXFVkKlCBZ9HDsZMDluYa14gakI=; b=1LVp5fkzAvj7Ns
	ht53JVL2YKvPlgmDgdzdzy8012eLQCJWkbqpurl/hiEzScIbFC9l9o0IXyheHp9g+52iw8kTALE9r
	gRbHGGnuNMaK5X07BNY4o8016+O18avLbiN3xaA77MKaieN1O2WtlGzIeLyaw1z9Gnm3Fm1lMrDTu
	SuU3kt00NiFXaCZpxgFIJq3GoBMEImDdpiltQKbw6NplDYl7NRDCZol0vXbSeiCSszXoJGIVP61vs
	Tuasx84FzH9Cd49B2QDkRR9J5hziTrFQm2Q2cMK/Mr2ADWuBOYtAtcCRzsGwFVfOj5FH6rdr17VgO
	k99tXnJDqsOaTo33Z/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF79-0000000CRjU-1riL;
	Tue, 23 Jul 2024 12:59:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF6G-0000000CRH7-1skP
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 12:58:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF14460F2F;
	Tue, 23 Jul 2024 12:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FEC1C4AF0E;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721739517;
	bh=kSeQcsb2Iy9mD89DI1W9T/W97Me0c16VuTNwoa3LxLA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eoLyfYrsPmZ4wJcbTOllWPiC4ezzKszwpMpeBouBczI4KxP78lbuw6Rm9QzzsnXfJ
	 ncVEDyayw/Ji/3WF9egitc7fyjGxjysuPyy7C6Mp531OL04vpgKkoV08jqe9hSieAq
	 3C0rmxGiPiE2rGpo7DVOMOIH3aDPhogS/Pl6C1QcYr4GvXiZXOt5iAeo1lALnHF+IO
	 80zc5nX2Tr43BvuS1p7jaGcJ69OyXQVMz8VJsYki0rQg07xvbwQ+mH5OXPogvO2OiE
	 wO0UJ5T3DkDkvWzPZjmDuVTTLZO/HOBbcD3OuL0/yBh2vk6XUFR7C5B6/oibDUV5OD
	 9JWPx8Y1whATg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 86B28C43140;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] Add the core reset for UARTs of StarFive JH7110
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172173951654.10883.8693881019606490911.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jul 2024 12:58:36 +0000
References: <20240604084729.57239-1-hal.feng@starfivetech.com>
In-Reply-To: <20240604084729.57239-1-hal.feng@starfivetech.com>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 ilpo.jarvinen@linux.intel.com, p.zabel@pengutronix.de, conor+dt@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 emil.renner.berthing@canonical.com, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_055840_697479_6274536B 
X-CRM114-Status: UNSURE (   9.67  )
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

This series was applied to riscv/linux.git (for-next)
by Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

On Tue,  4 Jun 2024 16:47:26 +0800 you wrote:
> The UART of StarFive JH7110 needs two reset signals (apb, core) to
> initialize. This patch series adds the missing core reset.
> 
> Changes since v1:
> - Set maxItems to 1 for resets from other platforms.
> 
> History:
> v1: https://lore.kernel.org/all/20240517061713.95803-1-hal.feng@starfivetech.com/
> 
> [...]

Here is the summary with links:
  - [v2,1/3] dt-bindings: serial: snps-dw-apb-uart: Add one more reset signal for StarFive JH7110 SoC
    (no matching commit)
  - [v2,2/3] serial: 8250_dw: Use reset array API to get resets
    (no matching commit)
  - [v2,3/3] riscv: dts: starfive: jh7110: Add the core reset and jh7110 compatible for uarts
    https://git.kernel.org/riscv/c/4ed81d9dd75f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
