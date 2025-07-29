Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB7AC83F17
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 01:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SogRf0UOUSlrhHt/8IlrSliwaOkeH81vRiYz5whOqPI=; b=dUK6rRI/TnWV80
	7rF6rcaJj0eo9C2Xjt/UT8iNjn0A83nVMr3IWQFoXJtaf44vuTOO22mgtgbeHA8dWl9w7tVdhSFck
	yZvsGlRiIcUof2YipKax3xsX377FfN+GXnrKJpSMI1vjJFWoqvAR233eb3Dr/y0+UtzbTJppLcGef
	mugb64NlQPEjK6qmS2IzRql9t2b2JIdCuntdrU+9Titk+4g7VxbyqLc1j3D3vdBTaw+dxxD6IOf5E
	R6HaMjX1BeX6ABro1hhqo0Ks22BdBcrwoY6cPAId8eeVx2ERYdydOsbPlL3VUXAOV+wqKJD9yxnm3
	DKQsXv4a6okHbLm+Ez5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugZNf-0000000FiiR-1WU5;
	Tue, 29 Jul 2025 01:43:51 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugZLP-0000000FiUa-13si
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 01:41:32 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4A82325D07;
	Tue, 29 Jul 2025 03:41:23 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ckl6WRtZjqNd; Tue, 29 Jul 2025 03:41:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753753282; bh=7jL0NE4cF4xqYnGuVecwCuQthPBG5AwQZhJM7XTG5Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B9KloKMhlJyyRh81m9m/G3F+TnYK+unb5HmSIcZYXv9skznThsPV7h/WJffNlxaJj
	 GgelXZd6oZyPw3DHn2h5K07c7MdBLXmnkcXFhOCDK/lbxmgM2JtehkiPcayyUeZLPA
	 CxOt4PLcDLpw7MfjzJ569Yu1jHgXTqSh42zh47HsACMyiVQg/6sJJZnjh1TTSjYhfZ
	 AFWr+MskYiXsSrZT2kLjXuenqSzj67q532Gvy79Xvk/YwuvxoUDyTLwAXRg6ZCfZEk
	 KOov8Z0BmgN26+ZXXUU1EY2M2Go+57hXmXtLODAkruVnsjzMIf4llmKPDmKGsCh0Pb
	 Sn3Y0xyX8GMMw==
Date: Tue, 29 Jul 2025 01:41:01 +0000
From: Yao Zi <ziyao@disroot.org>
To: Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <aIgmrQ7afSO5sjB_@pie>
References: <20250729-dwc3_generic-v7-0-5c791bba826f@linux.dev>
 <20250729-dwc3_generic-v7-1-5c791bba826f@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250729-dwc3_generic-v7-1-5c791bba826f@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_184131_702087_53FDEA00 
X-CRM114-Status: GOOD (  13.18  )
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

On Tue, Jul 29, 2025 at 12:33:55AM +0800, Ze Huang wrote:
> Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
> in the SpacemiT K1 SoC. The controller is based on the Synopsys
> DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
> DRD mode.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Ze Huang <huang.ze@linux.dev>
> ---
>  .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 124 +++++++++++++++++++++
>  1 file changed, 124 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..7007e2bd42016ae0e50c4007e75d26bada34d983
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> @@ -0,0 +1,124 @@

...

> +  resets:
> +    items:
> +      - description: USB3.0 AHB reset
> +      - description: USB3.0 VCC reset
> +      - description: USB3.0 PHY reset
> +      - description: PCIE0 global reset (for combo phy)

Why should the USB driver takes care of the PCIe stuff? This sounds
strange to me.

> +  reset-names:
> +    items:
> +      - const: ahb
> +      - const: vcc
> +      - const: phy
> +      - const: pcie0

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
