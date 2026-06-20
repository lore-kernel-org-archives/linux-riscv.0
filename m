Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8C8CD98E4
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jun 2026 06:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVejAXtlxwQBpA/SthfRTtWxmH/tT3o7xHf1KVl9k/s=; b=uMXSk3DT9hW9yh
	AD5ZhJkv2m/53Q+QdZt2PwnBNO5BDa2NOqrRlrGI1IgGFVPJALuOzJ0DQt5SsyCC4ffDQRCRAqXmO
	b0dFMT98TkQUopHNf9zFPk8vf7LsNhOZAapSVwyAieNsbAMA4xgZ4GaOtD2gNuPIatdk1QaZJFDs7
	c7RttcNU5YgDLYwlxxYCBKdL2et0HhDxwfDzh0xt2sdzn+9p2R3tS6RMPeCTec1mmkBP2lbqbvd86
	FRco3OQGS23Qfj2889wh29ryRdKNjg78/jLctNG2s/PsaShQtwUHdxGlKRdRuQou18NIx1ptR2x82
	dOQUshdTCbOrZHQ4J2yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wap7A-00000003CJy-2jOy;
	Sat, 20 Jun 2026 06:23:36 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wap78-00000003CI2-1V37
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jun 2026 06:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=JSpFgV9vze6NzxWv7sBTl3aOrJeNhaz31em0Ltb/XOg=; b=YjMF5tHqf+RJPNkEaHwlaLfufu
	nx9EM/X128U1AlQFofuBYY6QszUHNmjmlL8S2dgpir2vOWISmPkBy0xmam93Zo/csenHD2kcM1qsC
	wkM+nqxzdA4CiPWa64gEeJoznUhVW4UXF6WuhT9utJa44L9WH+cdxge/uTQvzi6+bEa246QpqjOwU
	kpAT/gzwfCSRh37Tx8D+5J2lH7d8lMYLpA8F3IqcVJcvHmuCCNU/boSbmsLpFAQssKOi/WgYulvHw
	SE1Zeg7WNtwmPKctvyjIgJEliXOZ6L2GGaMZ1yvpyjAlQIdsctk5DNoqMhxq6YiH0GCeBiINeZSbE
	yxCFTMtA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wap75-000000006gB-1STs;
	Sat, 20 Jun 2026 08:23:31 +0200
Date: Sat, 20 Jun 2026 08:23:30 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Zhengyu He <hezhy472013@gmail.com>
Cc: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Wei Fu <wefu@redhat.com>, Cody Kang <cody.kang.hk@outlook.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: add QSPI support for K3
 Pico-ITX
Message-ID: <ajYx4oI7SpNs5aT5@aurel32.net>
Mail-Followup-To: Zhengyu He <hezhy472013@gmail.com>,
	Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Wei Fu <wefu@redhat.com>, Cody Kang <cody.kang.hk@outlook.com>
References: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com>
 <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-2-52bce26e5fd8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-2-52bce26e5fd8@gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_232334_401143_F3EFA3B9 
X-CRM114-Status: GOOD (  10.39  )
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

On 2026-05-21 22:44, Zhengyu He wrote:
> Add K3 QSPI controller node into k3.dtsi, and add related pinmux
> configuration.
> 
> Enable QSPI on Pico-ITX board, and describe the NOR flash which wires
> to it.
> 
> Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
> Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
> ---
> Changes in v2:
> - Add "spacemit,k1-qspi" fallback to the K3 QSPI compatible.
> - Reordered Signed-off-by trailers.
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 58 ++++++++++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 21 ++++++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 17 ++++++++
>  3 files changed, 96 insertions(+)

Thanks for the patchset.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
