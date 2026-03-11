Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F8AFD0629
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 07:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+LuNRuNNZh/lwW/u2GSzI1jVduRwjLMuNqeWjRzjy8=; b=ijKSH3OGStkptw
	7wqXxeHN3bjFF1X/esr7y7CJHiLeIKgtphD7ZlNyC3n53vwLdTd9sm/iTNM6hm5zHykdPk09wJEvY
	ULWR7EyefXg3/LJRSmuMP3lxHrHsEOhP/uJ/AAwrZQbalkVGDZks44CAlRKzpMNtFe/nQpuHkBNVH
	EIFz/g4zayrtY4VfqZPXm6pBbc2Q30Hk+6ybZLUZoXCWiUYxZNK2/ayV6xHplQXT9bH4KE8Vgd2RX
	C7KxPI2s7g5AFrQp0RRmPlZerlScGm0vEGGcnENMBVsj2gGUgC8N9HaqySs5ddHs6VkKAXoR0KhMy
	iC21f6t9kMaw1TrPA10g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DYy-0000000AxoK-3DKE;
	Wed, 11 Mar 2026 07:01:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DYw-0000000AxnQ-1NJD
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 07:00:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66F304082C;
	Wed, 11 Mar 2026 07:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C41C4CEF7;
	Wed, 11 Mar 2026 07:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773212457;
	bh=ldYxWyiCUErDf/diI7OR5Y7gAgKmC1R5YPOLvmXtAPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EU67Hbs01r/pkU5O/Py6ad23GAhy+ZGGwxpxur2UEUhrVBOwMLY80JR2kPoyWbomh
	 IusC09HffaQCgVwusSeDqeBqUmRiF3bO2foESPYjXHx2FJ/KVf4ZDNFIwxfv3vaiAP
	 JZSDG2anFJbi4SAxCEOPT0wKXq2dkA1Z5YTmXQCmLK5yw1EcD6YUHbyrtTaKJNd1vV
	 TQxqal+GVFlWX1met5HtXaEqmSQxarp5EkfUY1FxGiifxW5QPMywYMh2P318181SpI
	 28x2X0jhjrZ3+bLixTPLRVGeLwfIhjCrl0dOc26g8xE0u+U3mDTX+OYSxLkFrGMRNp
	 Rw2LYDFjd3vKA==
Date: Wed, 11 Mar 2026 08:00:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Valentina.FernandezAlanis@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Richard Cochran <richardcochran@gmail.com>, 
	Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Vineeth Karumanchi <vineeth.karumanchi@amd.com>, 
	Abin Joseph <abin.joseph@amd.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Ryan.Wanner@microchip.com
Subject: Re: [PATCH net-next v3 03/10] dt-bindings: net: cdns,macb: replace
 cdns,refclk-ext with cdns,refclk-source
Message-ID: <20260311-horned-dexterous-caribou-3a46fb@quoll>
References: <20260310-moneyless-dispense-7bce14b16388@spud>
 <20260310-sneak-handclap-c150d8f1236b@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310-sneak-handclap-c150d8f1236b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_000058_408866_CA07BFE2 
X-CRM114-Status: GOOD (  19.88  )
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

On Tue, Mar 10, 2026 at 05:17:10PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Ryan added cdns,refclk-ext with the intent of decoupling the source of
> the reference clock on sama7g5 (and related platforms) from the
> compatible. Unfortunately, the default for sama7g5-emac is an external
> reference clock, so this property had no effect there, so that
> compatibility with older devicetrees is preserved.
> Replace cdns,refclk-ext with one that supports both default states and
> therefore is usable for sama7g5-emac.
> 
> For now, limit it to only the platforms that have USRIO controlled
> reference clock selection, but this could be generalised in the future.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/net/cdns,macb.yaml    | 39 ++++++++++++++++---
>  1 file changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> index cb14c35ba9969..a492357570edd 100644
> --- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
> +++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> @@ -120,12 +120,14 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> -  cdns,refclk-ext:
> -    type: boolean

This is already an implemented ABI, so you cannot drop it even if some
devices works fine on default. Instead please deprecate it and keep
drivers backwards compatible for whoever is using it.

> +  cdns,refclk-source:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - internal
> +      - external
>      description:
> -      This selects if the REFCLK for RMII is provided by an external source.
> -      For RGMII mode this selects if the 125MHz REF clock is provided by an external
> -      source.
> +      Select whether or not the refclk for RGMII or RMII is provided by an
> +      internal or external source. The default is device specific.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
