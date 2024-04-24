Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A339C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 20:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmDuLlePuJ4RhIHBNeV7NF82Ben0PAVQKS1+qlhE3Uw=; b=Q0YVg/LeRGB2FI
	bIXFvHajD/AyvO/Qx3rMsWn9ThQq36UhdaRCBZhtCOk6r5J6TGBjfPkkZmS9W8mV0pxH3ebANk12s
	gLiP3X5rcHe5UaLw++uQyc4h54Z1HdMgoUYzrdrqriPgyy4fVUs9epvDvh/nf3SZ1/BUwXjUd6VW3
	CNFjpo5I3WKibuciePPMmcUdwRrQ7fXMYKZ+PD4jV1P+yifY8BhF9Ih+I3DGW73YDD/Ud4NUOS7Af
	Cnu+T9LsTU7pKE2ZSM+BAezsty4DhqYFrw5JDjM3X8U9MnQnCCBYnYo+k5Atfg9ctgZ8MRMR35Yh6
	JM6Du5gzw65AEP+2f9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzjIF-00000005w5h-19de;
	Wed, 24 Apr 2024 20:32:39 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzjIB-00000005w4Q-44BJ
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 20:32:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D3D3240002;
	Wed, 24 Apr 2024 20:32:29 +0000 (UTC)
Message-ID: <41835766-b7d7-4f81-aca7-4a8136ba9971@ghiti.fr>
Date: Wed, 24 Apr 2024 22:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add notifier for PLL0 clock and set it 1.5GHz on
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20240410033148.213991-1-xingyu.wu@starfivetech.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240410033148.213991-1-xingyu.wu@starfivetech.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_133236_244505_DB1DD517 
X-CRM114-Status: GOOD (  19.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Xingyu,

On 10/04/2024 05:31, Xingyu Wu wrote:
> This patch is to add the notifier for PLL0 clock and set the PLL0 rate
> to 1.5GHz to fix the lower rate of CPUfreq on the JH7110 SoC.
>
> The first patch is to add the notifier for PLL0 clock. Setting the PLL0
> rate need the son clock (cpu_root) to switch its parent clock to OSC
> clock and switch it back after setting PLL0 rate. It need to use the
> cpu_root clock from SYSCRG and register the notifier in the SYSCRG
> driver.
>
> The second patch is to set cpu_core rate to 500MHz and PLL0 rate to
> 1.5GHz to fix the problem about the lower rate of CPUfreq on the
> visionfive board. The cpu_core clock rate is set to 500MHz first to
> ensure that the cpu frequency will not suddenly become high and the cpu
> voltage is not enough to cause a crash when the PLL0 is set to 1.5GHz.
> The cpu voltage and frequency are then adjusted together by CPUfreq.
>
> Changes since v3:
> - Added the notifier for PLL0 clock.
> - Set cpu_core rate in DTS
>
> v3: https://lore.kernel.org/all/20240402090920.11627-1-xingyu.wu@starfivetech.com/
>
> Changes since v2:
> - Made the steps into the process into the process of setting PLL0 rate
>
> v2: https://lore.kernel.org/all/20230821152915.208366-1-xingyu.wu@starfivetech.com/
>
> Changes since v1:
> - Added the fixes tag in the commit.
>
> v1: https://lore.kernel.org/all/20230811033631.160912-1-xingyu.wu@starfivetech.com/
>
> Xingyu Wu (2):
>    clk: starfive: jh7110-sys: Add notifier for PLL clock
>    riscv: dts: starfive: visionfive-2: Fix lower rate of CPUfreq by
>      setting PLL0 rate to 1.5GHz
>
>   .../jh7110-starfive-visionfive-2.dtsi         |  6 ++++
>   .../clk/starfive/clk-starfive-jh7110-sys.c    | 31 ++++++++++++++++++-
>   drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 ++
>   3 files changed, 38 insertions(+), 1 deletion(-)


I only took a quick look so I'm not sure: does patch 2 depend on patch 
1? In that case, I think the Fixes tag should be applied to both patches.

And as this is a fix, will you respin a new version soon for 6.9?

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
