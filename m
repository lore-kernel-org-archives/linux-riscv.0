Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F3CC87FC9
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 17:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJGPR7mgsoJMzQ6LdgKykVbd56EUF5Ncxx0FhEbHQHQ=; b=wE3Ngpyiq3Kkoj
	DCdZiER/T/Mp04Vh58LU7eiLDwGa32VlLPmB7RYv3i2S+KWaDfLsMrXZzpwUSooEo55sx4g9RpWrN
	zMwDLdLwxPP/45wezRk0eNJGbhNd7H/If/mLERlWyXt5AG8qaTcB2Zcbl+oIUGeHgop2bD9Cky2aG
	YwBMkSWdks5BuXxyrAU/ElVMcnRMd9vsLkgBHI8sKyNZrxrPnwD88LrgPkH7XgbanhSCBGe6S1mWg
	YQhmX8Gr+mPq7BHhd55evhVQVvIkd1DjZYXAj5KTolOrlwOQMCvzbr3mqhjv5lIpllMhpqyZC3UVe
	Ca6xWYScoPy4rFgBH2bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoDL-0000000HMvw-3ocs;
	Tue, 29 Jul 2025 17:34:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoDJ-0000000HMvZ-3yaf
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 17:34:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2886E44F77;
	Tue, 29 Jul 2025 17:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAE0C4CEEF;
	Tue, 29 Jul 2025 17:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753810449;
	bh=gqjJxvrbJzU+Y1NaVhsDYvQYmRoqY8d4rd0tdxvq+Yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eabzNBFbEPWmcOna09473itgkl4JYClURyCLK83NCanQbjgmk90/+qQJY4Atgytqj
	 rYUAH1qzzNHxQd1yjgU2/kCgl6TPIO0Wi6V37MaKbNVUOxy/qtS4t1CB9eIOH0oS4+
	 th0zFV34hG1n34QcTIOpj8/6/RppgfpxA9iciNRgDIeuFbjPW3LDT8Owui3zZXUiGi
	 OuCfrzJ5zARMJfLQaie8aapd8hyBFJwp0TwOqaXm8sPlGpioGvKPZ6kOfwOJxDEW+Q
	 agWpZZCjjMuS6hAMoOB2K03GV5vtXoQaE6RvdFwuB7KakvFjH9jFdBp8R7hMj5DJIz
	 0fdzZucjTtp4w==
Date: Tue, 29 Jul 2025 10:34:07 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 0/3] Fix broken link with TH1520 GMAC when linkspeed
 changes
Message-ID: <aIkGDxstQ9Eimw4p@x1>
References: <20250729093734.40132-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250729093734.40132-1-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_103410_004604_542B95DF 
X-CRM114-Status: GOOD (  19.18  )
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

On Tue, Jul 29, 2025 at 09:37:31AM +0000, Yao Zi wrote:
> It's noted that on TH1520 SoC, the GMAC's link becomes broken after
> the link speed is changed (for example, running ethtool -s eth0 speed
> 100 on the peer when negotiated to 1Gbps), but the GMAC could function
> normally if the speed is brought back to the initial.
> 
> Just like many other SoCs utilizing STMMAC IP, we need to adjust the TX
> clock supplying TH1520's GMAC through some SoC-specific glue registers
> when linkspeed changes. But it's found that after the full kernel
> startup, reading from them results in garbage and writing to them makes
> no effect, which is the cause of broken link.
> 
> Further testing shows perisys-apb4-hclk must be ungated for normal
> access to Th1520 GMAC APB glue registers, which is neither described in
> dt-binding nor acquired by the driver.
> 
> This series expands the dt-binding of TH1520's GMAC to allow an extra
> "APB glue registers interface clock", instructs the driver to acquire
> and enable the clock, and finally supplies CLK_PERISYS_APB4_HCLK for
> TH1520's GMACs in SoC devicetree.
> 
> Yao Zi (3):
>   dt-bindings: net: thead,th1520-gmac: Describe APB interface clock
>   net: stmmac: thead: Get and enable APB clock on initialization
>   riscv: dts: thead: Add APB clocks for TH1520 GMACs
> 
>  .../devicetree/bindings/net/thead,th1520-gmac.yaml     |  8 ++++++--
>  arch/riscv/boot/dts/thead/th1520.dtsi                  | 10 ++++++----
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c      |  6 ++++++
>  3 files changed, 18 insertions(+), 6 deletions(-)
> 
> -- 
> 2.50.1
> 

Thanks for fixing this issue. I've tested this series on next-20250729
with my LPi4a. I'm able to change the speed from 1000 to 100 and back to
1000. The network continues to work without any problems through those
transistions.

Tested-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
