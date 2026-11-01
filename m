Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F35160A2611
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yspEtEMb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K+V9Dv3q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6IOMu2E50EX9UwwlzuyxIFV2kQQjGeHTh3Kjyj3Wd5U=; b=yspEtEMb8oX9uq/TyzDsMVpJZP
	Wg861E7EnfJYbdVXz832nZSQeXMCiWGF6XqqfzgQ2pQB1h6SpXhGaHgVqQ1ugVtmUxwpD6TFnbUb+
	gxKMJrNfvB1RGzG+rFxyWtIgxf320Wa76k4Rf15zu1cV9xqRrIEh12rFqxztSNcupkoV6sSUfC6LR
	ggUK9MpAgXlsnRkSBauveqnfJii+DIyTvUCOGDjiQR47jmb+SHeLS9yYHC+A/+i5vLyYoHdduemRr
	uFqz52dw1vGmxMVqudvlAzFXr5ZBwgxWckAKsVmvP1duBveC5YV+gQ2MrVBBVuAgV5Mfcn+Tsbdnd
	7ihpebjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqE-0000000Eyxk-3wQk;
	Sun, 01 Nov 2026 22:15:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqC-0000000EytQ-0Rl4;
	Sun, 01 Nov 2026 22:15:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B7A7744006;
	Sun,  1 Nov 2026 22:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0951F00A23;
	Sun,  1 Nov 2026 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571351;
	bh=FccY8w4XVKmL62rTrNsIiuAmg2iirAJ9NTvcPUeI7l0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=K+V9Dv3qcTj5160hj+SlEd6bb36GPd0hfxFxqjLqYo66VpB8oCIm4PuHm9pjlid/h
	 xICIzZcud0NUgf8UqhSDgZUnCOe+E4H24SE9jF1p7O4fFeppaF6xJ19c2x3GponAYK
	 zBB0xnPMXK3KXJyJgXpeecppENU8uStUTuAYpN58z1zi5XdcZnpfMOTU/Sjz04mpNh
	 EBDswN/2U3tv2zVNouRalxGVIPr45mrQWsWqgkUoAJAzcLHlFn+u4O5aPuxyp1V9hh
	 nqI9MBjEMOeTC+Cpzk8pdEQbjpMVozvCH8kCeYtfZV/f7RAOqeoEUa4gaQ0O3fobrF
	 9dSJrBw8PPsVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D3DF38003B8;
	Sun,  1 Nov 2026 22:15:51 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v16 0/7] net: stmmac: qcom-ethqos: add support
 for
 SCMI power domains
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357135004.2624073.6498267080189807632.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:15:50 +0000
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, vkoul@kernel.org, peppe.cavallaro@st.com,
 wens@kernel.org, jernej.skrabec@gmail.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com, shawnguo@kernel.org,
 festevam@gmail.com, jan.petrous@oss.nxp.com, s32@nxp.com,
 mohd.anwar@oss.qualcomm.com, romain.gantois@bootlin.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, mripard@kernel.org,
 christophe.roullier@foss.st.com, brgl@kernel.org, edumazet@kernel.org,
 radu@rendec.net, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, dfustini@tenstorrent.com,
 linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, bartosz.golaszewski@linaro.org,
 sashiko-bot@kernel.org, martin.blumenstingl@googlemail.com,
 krzysztof.kozlowski@oss.qualcomm.com, prabhakar.mahadev-lad.rj@bp.renesas.com
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to riscv/linux.git (fixes)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 14 Oct 2026 14:36:39 +0200 you wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
> 
> [...]

Here is the summary with links:
  - [net-next,v16,1/7] net: stmmac: dwmac4: don't program the 1us tick counter without a CSR clock
    https://git.kernel.org/riscv/c/d09d7b8e86e5
  - [net-next,v16,2/7] dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
    https://git.kernel.org/riscv/c/534198a05d92
  - [net-next,v16,3/7] net: stmmac: qcom-ethqos: set serdes mode before powerup
    https://git.kernel.org/riscv/c/7af44cb9e447
  - [net-next,v16,4/7] net: stmmac: qcom-ethqos: update phy_mode to the resolved interface in mac_finish()
    https://git.kernel.org/riscv/c/05b3ea7346e3
  - [net-next,v16,5/7] net: stmmac: qcom-ethqos: reuse the address of ethqos_emac_driver_data
    https://git.kernel.org/riscv/c/92719abd6378
  - [net-next,v16,6/7] net: stmmac: qcom-ethqos: factor out linux-level setup into a separate function
    https://git.kernel.org/riscv/c/acf1e3db9151
  - [net-next,v16,7/7] net: stmmac: qcom-ethqos: add support for sa8255p
    https://git.kernel.org/riscv/c/bb3183e1c938

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
