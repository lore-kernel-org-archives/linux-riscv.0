Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DA0606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 19:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KSHSUkm9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqzBwZIr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PWth4w8WshDAKdRDsg+Oo0JT44eZizi0RAZcP46KRSQ=; b=KSHSUkm96nwP/L1MDcLjAWsAju
	GJp6GkrXIf+poHnbEIV/+q44UewnURC2qPfjr4vXN2GlCrTdnvXTxjPfgnc0lX/qvrPFFpoKT1T4j
	0IJrDIMkg6AQP9AB/V38NWvDZHkhZyAiJ1gJKYJ9Xi89ZrGacFkVsFNPbCn/lvRoBVO0zP/Clq03T
	zV+bkL2i/Wkpwg4IIUJffoTZPK26TrpwADn4jnaJIOC38gK/GU1dzNc7a+U14kGwvPOaNEtW6Hqnm
	sp+opOoFrt8T6zgT+ZVrjkfaIsq9/Pd0xdI1Koruxp/vijNRarLvOSUaVrTgGkX43VNZX3tc1+N9C
	dkkxN21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwbi-00000007g0A-0Ax6;
	Tue, 24 Nov 2026 19:55:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwbg-00000007fyh-1MaD;
	Tue, 24 Nov 2026 19:55:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 646FE6252B;
	Tue, 24 Nov 2026 19:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F54A1F000D0;
	Tue, 24 Nov 2026 19:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795550110;
	bh=grUnuBcgp8t+MSOi+H3ID6xVrMhx8VhnciDCacLxfxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NqzBwZIr1Pg6A41nBWqgIzK4e+hizMaKakN+ommcoqE8FSgoJSIdIy26TcQJkhjhD
	 CTbByepXplY6cFG0WrpRRsegDFzkug4NrSWMurNVoJojlOzKvhgUAIQ2TVmw4lNrIB
	 9WBvC6wpwtrnxzthS4Ju5xSO9ASxGNKlPrMQTMBl0z3aTaWMwXVf4yLT6NG/xqxJtc
	 gkt4jnzHDNJHKOvIdniIQvdxbcda3qnaSnItVe4gn4GAbb8Dq+piBD7thPqQXGI1O2
	 hInqTW8J0LYat7sAtWVe7dNkTOw3bS/vUEY951EC8/+A1wV510CCCRXKDjwb3VSlwE
	 qYpJbQ1HmNmhg==
Date: Tue, 24 Nov 2026 11:55:09 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v4 2/2] phy: add a driver for T-Head TH1520 USB PHY
Message-ID: <awXrnQVKZBXKsV2c@thelio>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
 <20261103081444.1983071-3-zhengxingda@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261103081444.1983071-3-zhengxingda@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 04:14:44PM +0800, Icenowy Zheng wrote:
> The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY, with
> some PHY parameters exported as another system controller along with it.
> 
> A few PHY parameters have unusable defaults. Add a driver that programs
> them before releasing the PHY from reset in addition to
> clock/reset/regulator management.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> Changes in v4:
> - Make exit callback always success to prevent PHY state machine desync
>   with clk/rst state as suggested by Sashiko.
> - Re-wrap some comments targetting full 80 columns.
> - Use dev_err_probe for PHY creation error handling, to prevent spamming
>   the kernel log with -EPROBE_DEFER.
> Changes in v3:
> - Use fsleep() to replace udelay(), and add proper inclusion of
>   linux/delay.h for this function. (fsleep() suggested by Drew and
>   inclusion suggested by Sashiko)
> - Adapt Drew's suggestion on the wording of the commit message's 2nd
>   paragraph.
> Changes in v2:
> - Removed unreferenced register names.
> - Changed the behavior to leaving bus clock on instead of binding it to
>   the regmap.
> - Removed early return for reset deassert failure in phy exit callback.
> - Tweaked the Kconfig item (removed default value and added "select
>   REGMAP_MMIO).
> 
>  drivers/phy/Kconfig                |   1 +
>  drivers/phy/Makefile               |   1 +
>  drivers/phy/thead/Kconfig          |  12 ++
>  drivers/phy/thead/Makefile         |   2 +
>  drivers/phy/thead/phy-th1520-usb.c | 179 +++++++++++++++++++++++++++++
>  5 files changed, 195 insertions(+)
>  create mode 100644 drivers/phy/thead/Kconfig
>  create mode 100644 drivers/phy/thead/Makefile
>  create mode 100644 drivers/phy/thead/phy-th1520-usb.c

Sorry for the delay in review. I think binding and driver dir should be
added under thead soc support in MAINTAINERS, right?

> +struct th1520_usb_phy {
> +	struct platform_device *pdev;

It seems that pdev is only assigned in th1520_usb_phy_probe() and never
read. I think it can be dropped.

With those addressed:

Reviewed-by: Drew Fustini <fustini@kernel.org>

BTW, I see that I never applied the MISC clock patches (1 to 3) from the
v1 series [1] like I said I would. Do you still want me to apply them?
If so, I will fix up the platform data check for usb_suspend_div_clk in
patch 2 when applying.

Thanks,
Drew

[1] https://lore.kernel.org/r/20260507081710.4090814-1-zhengxingda@iscas.ac.cn/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
