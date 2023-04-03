Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD879C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 19:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6JGwI127cwvehTjWhFME3Ff9FwQgRsvq9wzursjZJ28=; b=P5tSBYEnmg6h/Z
	J532s/4v2u3qV8mFEuq8Hi8yCKYIQ+R0Uc5O2lWto8KiBHrs9p6pbO50sBprV3r3SaYCPjES1Rpn1
	wWzvtg/JOlcaJxkliWprJCLcC40PMdoQeRtzBcHLbJ06KC1zC7C76N/x5351RJZC1X+EszNwXkoAx
	fHkFx05eTonsS7e0SoF3aVVanovm3KbfWFWbefMpcklIFAUINmQAfVyEChvcBawuY+9Meew55m+R1
	uKjGSnNKPb8v1a01Jbypi2EFhmLdeitadVREivYnD9cuEoKwv2fFg5K0xO6L+JVIy7bPk4fp8S782
	kv6qGh0KW9l2ZzS7cTDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPxf-00GQ8d-06;
	Mon, 03 Apr 2023 19:35:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPxc-00GQ7o-1H
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 19:35:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E784862574;
	Mon,  3 Apr 2023 19:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1F2C433D2;
	Mon,  3 Apr 2023 19:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680550523;
	bh=jvtnWZFI2fGJeH2PxHp6LZJsWoWybXxjuO7vI5xdc+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y6p7mCvxr0BUh3aKtOMbCLM5/EIMGrzSJ9otvW1VaUDMJMnk+iJjhwZovzRPSKHGh
	 enymh2tMk49s2QKiOozwHvchGRtbYQRL5Ol/YfMF9gBH3tf8iU7w/Q1CLoygJ/bTvB
	 pQbNPxG0FRPjVBMDEsi+Nz9y8JWClfstHkWoHyRXWX6WH0PPIrD7MZr4C8+56Z8Uh2
	 /PSARdk4QAzH33kABAqlbI1+dr9kSBiUKatImd/nON1sEIWAP53B1n8LL2coMuD2AW
	 G7EyDPUI4pvKeK+h9F2Z18SyAKN3F1Mcgl1HbSlKPnpJQ8l8FD0dgBJBQTBbpneqr8
	 w2jCLwTX9pGSw==
From: Conor Dooley <conor@kernel.org>
To: linux-fpga@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Cc: conor@kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/7] PolarFire SoC Auto Update Support
Date: Mon,  3 Apr 2023 20:34:59 +0100
Message-Id: <20230403-audacity-champion-9aa7a47939f0@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331071823.956087-1-conor.dooley@microchip.com>
References: <20230331071823.956087-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=818; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=YlEC6sgE+Yocm04DZPoSm8ShZaYEwmR3DSX9EC6jsCo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnaWomZhzYo6ft1XXtpV/K3bxuLt0rLQtVrvUefWJxPF 5i+WM6yo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNZGcbwV7Cda2eLu27inZjv HTJbdki4z2NY1VTb/WTRSr1nNfvnOzMyrGc6fDhNrmezc+TWuuqrzzL28D51PvBx0jnRf9eXfCn 4zwIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_123524_471926_BF0BA751 
X-CRM114-Status: GOOD (  12.88  )
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

On Fri, 31 Mar 2023 08:18:16 +0100, Conor Dooley wrote:
> Hey all,
> 
> This patchset adds support for the "Auto Update" feature on PolarFire
> SoC that allows for writing an FPGA bistream to the SPI flash connected
> to the system controller.
> On powercycle (or reboot depending on how the firmware implements the
> openSBI SRST extension) "Auto Update" will take place, and program the
> FPGA with the contents of the SPI flash - provided that that image is
> valid and an actual upgrade from that already programmed!
> 
> [...]

Gonna take this one patch, since it's got ~nothing to do with the rest
of the series really, so:

Applied to riscv-soc-for-next, thanks!

[1/7] soc: microchip: mpfs: add a prefix to rx_callback()
      https://git.kernel.org/conor/c/4dd472bdafcb

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
