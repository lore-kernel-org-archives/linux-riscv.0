Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBDA606A329
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 07:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c/BWB50T;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T7pEuLPO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BjGxWnlWFGrlHOvi7nlEgptMUlHaXgoW1TmC5lw99j0=; b=c/BWB50TT/CX3LjivSlIQm6PEA
	KL7f80gqG978Xl6TFAND9z/ru+LAt182ijKNcy0SZAa0HxcUKCUkk601lR+ZXD3k076rfbQUlxGUG
	ZEXaC6lGXyABBcgYbN2clmSfNRz3iv8rEDWcO6qF9XSAX2dzAHm+06TPx7iYDqAs66/nOvLspBjMG
	+NCVSEyR9L7z69bxbvzYw+euT/7tp4C9SRhbYe+UtnMEqfR6zLbdz5R8K6wHecYdgcTm7eMLzJQ2I
	58VAJmQnIv21+hT6euOBtTfFjwbcTADz3LBwgpYuz/kYV0ckUfyADspEsa54+c9pU2xlhSUIDuLql
	kQQdXuCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS8bR-0000000FZhY-3GsN;
	Sat, 14 Nov 2026 07:55:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS8bP-0000000FZhS-4A59
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 07:55:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BC7C6128C;
	Sat, 14 Nov 2026 07:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3880D1F000C4;
	Sat, 14 Nov 2026 07:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794642910;
	bh=/X07HvNvN9a0K7HnKUe3Hh8QkXFl/G+Ctimt4KzzNgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T7pEuLPOWQlHnxzyLzOgjIKCgJIReSb0pfN7H1yI2wsTFQtAIf6uOoeotRo9+Cjjz
	 xKCYhyDBq3KrF3DcN+Vv1DH04iqWMdO3LAPAgsHStKvElhmve9JQnlON8/hKr96oS6
	 e3CGelKDeSE90Idzk4HSV37u6z+vAMBi9tjZXBLWDq8E3gMewa8cHOiM7Ie8I5xiC6
	 ++pKjpMxb1tuJsLkiZgIIxP4ruPwFNJHp2EfzrwziphWgXXfxAfb+h8OYTgW8cn08D
	 F9NYBjRY0taVD2sp0loe3r4A7hb3tid4LSWnzBOuP5XqNopA2AkpXy9U+XfuGJwcwz
	 E/w9/DUWA+u7w==
Date: Sat, 14 Nov 2026 07:55:06 +0000
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
Message-ID: <20261114075506-GKB100523@kernel.org>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
 <20261109033348.361452-1-sandie.cao@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261109033348.361452-1-sandie.cao@deepcomputing.io>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sandie,

On 11:33 Mon 09 Nov     , Sandie Cao wrote:
> Add the device tree node SDHCI-0 controller for onboard Micro SD card slot.
> 
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index bcd533484a73..051046fe90b2 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -177,6 +177,28 @@ &combophy {
>  	status = "okay";
>  };
>  
..
> +/*
> + * Onboard SD card slot:
> + * Please insert or remove the SD card while the device is powered off.
> + * It works as a boot media. so set it to non-removable.
> + */
Is there any public schematic available for FML13V05? I guess there is
no CD pin (Card Detect pin)? as no "cd-gpios" property seen here

The above comment isn't really useful or even correct, I'd suggest
drop it.

> +&sdhci0 {
> +	pinctrl-names = "default","uhs";
> +	pinctrl-0 = <&mmc1_cfg>;
> +	pinctrl-1 = <&mmc1_uhs_cfg>;
> +	bus-width = <4>;
..
> +	non-removable;
"no-removable" property usually used for emmc chip soldered on board,
 so there is no way it can be physically removed.. check 
Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml

For cases that no CD pin (or no GPIO CD pin) designed for SD card from
hardware schematic perspective, using "broken-cd" is a more proper way,
it will fallback to use poll mechanism to detect the card, please check

> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	vqmmc-supply = <&aldo1>;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_0_cfg>;
> -- 
> 2.43.0

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
