Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470E9C43602
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 10:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i11eRaBWwk7VRVFycNROh8M9i3BC5ywh9fknf/kaTQo=; b=SPLtDnjNYt0sYc
	DwX57tVdbNb1gxiO9FryeuMSET3tQwXJIiWfpFeFUZFDB0ksdUMzUVl1ZTkvom2ntOxH6YhLokkEE
	VOpijGq+7ubkfKZGA+NCVt0GfZa2T0+3hx8xdIyJVkThHQz5GazuKq6UlawKWMioyvs8f/y45HHKU
	eElVlsyCQf3uzPAFK7CROnpvVZmxux6XnehM29FEhev6S+LpGJ5RS8pA/2a4c9Tj9W+9tz3UE90lW
	6rtQylV4MRCR888rE4sTs/0KiqJqW4GMiw3YbhlQzOM6o8RfzRWKzrYnk1wIwjJ7TeY4c3QPFnfBC
	5pXHnT5ZzYk9e0/fpVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3Tn-0000000End2-0Gkq;
	Tue, 07 Jul 2026 10:56:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3Tk-0000000EncY-3EZT
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 10:56:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BE49618A6;
	Tue,  7 Jul 2026 10:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC531F000E9;
	Tue,  7 Jul 2026 10:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783421799;
	bh=HlQHk4Tx7tHsYHXnfZWzQb7mDrScjAeO0+K90dIpLek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UNYyDyjnm3qVRvq7KqL6v/ExtKS8+AXsBomw2Xit4eO97aY+OJq/g1zNuGj3I/nku
	 Hy2krPzWLY7lcaI/xGZqslPu8jg9mjXtY3I3/WQJ/bX/ibf6jYfdGoaYt9mhO9jH72
	 8BYFvapowIXApXj1Agw/v+GmSdu8kFV6i16waZJppsDXFw0KQ0OnY0a2NKirgRwYhn
	 uzhkDm1jq7sqi+SvSI2ie5z0obarh9WxUxoYT78nLU8ZqRw/7nB/WvKhWL2vxXJZpX
	 rwAkQrpoGN1FIo8vBKM5Qcc9yDOjnDeHWPiLuY8eKHIGeNGQTSZSZZyXcyEG1XpPzu
	 +h23g4UlHd/Sw==
Date: Tue, 7 Jul 2026 10:56:36 +0000
From: Yixun Lan <dlan@kernel.org>
To: Zhengyu He <hezhy472013@gmail.com>
Cc: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Wei Fu <wefu@redhat.com>, Cody Kang <cody.kang.hk@outlook.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: add QSPI support for K3
 Pico-ITX
Message-ID: <20260707105636-GKH35811@kernel.org>
References: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com>
 <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-2-52bce26e5fd8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-2-52bce26e5fd8@gmail.com>
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

Hi Zhengyu,

since I'm requesting some changes, so along with the title, suggest
riscv: dts: spacemit: k3: Add QSPI support for Pico-ITX board

On 22:44 Thu 21 May     , Zhengyu He wrote:
> Add K3 QSPI controller node into k3.dtsi, and add related pinmux
> configuration.
It's obvious..
> 
> Enable QSPI on Pico-ITX board, and describe the NOR flash which wires
> to it.
> 
How about combine above and simplify
Enable QSPI with proper pinmux on Pico-ITX board, and describe the NOR flash
 which wires to it.

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
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b89c1521e664..e90e17895bb2 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -200,6 +200,64 @@ phy0: phy@1 {
>  	};
>  };
>  
> +&pinctrl {
> +	qspi-cfg {
as you've already defined te label, which make it possible to reduce one indention

&qspi_cfg {
 ..
}

> +		qspi-pins {
> +			power-source = <1800>;
> +		};
> +
> +		qspi-cs0-pins {
> +			power-source = <1800>;
> +		};
> +	};
> +};
> +

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
