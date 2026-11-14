Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D604606A327
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 07:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WNfNZ7DX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Autf3p2T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QrRJ1XRx9QTMisDiPx09AJ9PLwB69eVgSdvgnYwGmXs=; b=WNfNZ7DX4d1G90q6VA0h/AfhGZ
	Q2n4xUsFMTuJbsS+CpM9sRY3UlZ9vK0jMtN6Rnej2TI6t3Yxs/ZnLGQXvI7vZwT8hqGseXs7YY3r3
	QXbnBdrjSIidkoWLzPlfQTyhHTNzt0t1UJGoVWEvG5wWchZUjYoRcpsDkMfrbizLCjWhApgDWRsiZ
	vrgnXF68DcCPC+Ar0u1L4YmWVkQIc4m0zagHtq1gJS1GKYPCyLEgC6hOHW7ZmYt1MandnbN0xki1R
	/17B+H8UYD7KqnFCG7K7IcYZ/n5B34UOrPHDzdu/Wl5f9mcyElwWiWo4O3pWpcwnJOcwH3HyPBVNq
	f5zTpVvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS8DW-0000000FYzg-11Lt;
	Sat, 14 Nov 2026 07:30:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS8DU-0000000FYza-1121
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 07:30:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE6CF40812;
	Sat, 14 Nov 2026 07:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9FE1F000C4;
	Sat, 14 Nov 2026 07:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794641427;
	bh=RtlrGzw8VmtDYwdiBvn4lTn2fL67N+5GJzUI4/4Jq2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Autf3p2TMGSLZAPTTzmL0aw0g86IZzBrFMJbM+IcPxPrd+SrNlN+5LX6Tx+RIWFea
	 6JUHDTHsglYHSFmDwwVVw5b1/lY6MRD2tnVg7qfWJaqtjeeqkGUDeCf+FeoOIePEBT
	 VK6H+a5/B0+ixtGJTs2prCqtlBLPN5EWTUXU/Os6Lo6dy0fzod674PpRNONBJp4u0S
	 8rtvGHUjV9t4g6u+eCaTGdcW0jGNElRaSVkFM98iPcXDpk54Z7eZdxoh2sH728ssT4
	 yxdN5tAWH72MEWT1HCU0IwPQAuXhixXc4iPwqkBWAVbDHAi+eBq3Cbzj8EpCxhac5S
	 jgzzY4m6tYGxA==
Date: Sat, 14 Nov 2026 07:30:25 +0000
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add USB controller and USB phy support
Message-ID: <20261114073025-GKA100523@kernel.org>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
 <20261109033310.361435-1-sandie.cao@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261109033310.361435-1-sandie.cao@deepcomputing.io>
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
> Add USB device node (b, c, d) to DeepComputing FML13V05 board.
..
> USB A works on otg mode, it isn't configured currently.
Drop it, not really useful to mention there, irrelevant to this patch.

Currently, No USB A port support is merged in mainline code.
FYI, Chunyan submitted a patch for adding peripheral support of USB A.
https://lore.kernel.org/all/20261105103125.2727341-1-chunyan.zhang@linux.spacemit.com/


> - 4 USB-C Ports
      ~~~~~ USB Type-C? less confusing
>      - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
>      - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
>      - Port 3 & 4: USB 3.2 Gen 1

For "Port X" here, is it a naming from FML13V05's schematic?
would be great to mention which specific USB 3.0 controller (Port B, C, D)
 of the SoC it connect to..

> 
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index e061233c15a3..bcd533484a73 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -172,8 +172,58 @@ dldo7: dldo7 {
>  	};
>  };
>  
> +&combophy {
> +	spacemit,apmu = <&syscon_apmu 0x17>;
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_0_cfg>;
>  	status = "okay";
>  };
> +
> +&usb2_host {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	hub@1 {
> +		compatible = "usb5e3,608";
> +		reg = <1>;
> +	};
> +};
> +
> +&usb2_phy {
> +	status = "okay";
> +};
> +
> +&usb3b_u2phy {
> +	status = "okay";
> +};
> +
> +&usb3b {
> +	phys = <&usb3b_u2phy>, <&combophy 2 PHY_TYPE_USB3>;
> +	phy-names = "usb2-phy", "usb3-phy";
> +	status = "okay";
> +};
> +
> +&usb3c_u2phy {
> +	status = "okay";
> +};
> +
> +&usb3c {
> +	phys = <&usb3c_u2phy>, <&combophy 3 PHY_TYPE_USB3>;
> +	phy-names = "usb2-phy", "usb3-phy";
> +	status = "okay";
> +};
> +
> +&usb3d_u2phy {
> +	status = "okay";
> +};
> +
> +&usb3d {
> +	phys = <&usb3d_u2phy>, <&combophy 4 PHY_TYPE_USB3>;
> +	phy-names = "usb2-phy", "usb3-phy";
> +	status = "okay";
> +};
> -- 
> 2.43.0

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
