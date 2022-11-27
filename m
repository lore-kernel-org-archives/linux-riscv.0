Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69545C43217
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 17:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNGSOeWwu6vZAVIb9xVp+yvBqDdh2Y0HfDzXdjBC/bk=; b=tC6Z10ogaKGOKb
	bUXVd9oF/RN0KLJf909U4rBFTrhAufXw9JpYj1Ma0IgPrpZv+9wwlEdn9RNxqz7WhGmOqKE29jJ4C
	nv5jb2OVz3ALvuQX1LEq3vFdvIL9b5q9LvkBSEUfVlUa1PzOobEyIgov074Gcm9BSS1/StrcH+LSt
	QZG4PK1tFF+ZOjSRsejO4WDk1523zXmCdSVm90H5ge8+k9yWFn8ziiPWSl1f+yPEpaz09uujzBup5
	/6X/C5GnG03MEmQIvFXhiM2g8X3FVTJOzo7a9f12E4QfmAWsFnqG1u6Ol3isvBoRO3W+vYzpRYCRm
	B+V68YNYRtnXozj+oiRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLTk-00CesV-Gy; Sun, 27 Nov 2022 17:30:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLTh-00Cer4-RT
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 17:30:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2CCD360E0B;
	Sun, 27 Nov 2022 17:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0810BC433C1;
	Sun, 27 Nov 2022 17:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669570204;
	bh=HmQF8mfTp92YXxlx5z8dXvAr+KpT38AMBrKC7yplp+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Et+gGNvDUFOGo7vlvdBfdLRwWGnLPVq3NDrDiqbnh2tLuQeYphrPDbuC+9xv3n2vN
	 mXZSpSId0MICo8fzVFZu7fhtmtj+p+xXFM+zRKnsq1+ExZFxdpBcZCFbdgFksL3/D8
	 CpiTsRWKx6APlFaE7vJ16sBunA45PMONSo8dGOwcxs4YhxQj5ifTBMYGqeFbhEesEu
	 EXhfHH41sOaS4iBvJHfJ/LLAlAybPz/3BDOWdsIQu26CGtfQazuOQfu5+fFxRgbvDP
	 Rao+gtrFlTsCIUOMo7zRVPLAh/kRne33M10bynQOxVee0QBgBKD3PNyBx3NaTgGPqp
	 WouETvMDf1Umg==
Date: Sun, 27 Nov 2022 17:29:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 5/9] dt-bindings: riscv: Add bouffalolab bl808 board
 compatibles
Message-ID: <Y4Oel9j+MY0iSJ0A@spud>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-6-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221127132448.4034-6-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_093005_948592_3415B1F5 
X-CRM114-Status: GOOD (  16.81  )
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

On Sun, Nov 27, 2022 at 09:24:44PM +0800, Jisheng Zhang wrote:
> Several SoMs and boards are available that feature the Bouffalolab
> bl808 SoC. Document the compatible strings.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/riscv/bouffalolab.yaml           | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/bouffalolab.yaml b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> new file mode 100644
> index 000000000000..91ca9dbdc798
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/bouffalolab.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bouffalo Lab Technology SoC-based boards
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +description:
> +  Bouffalo Lab Technology SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: Sipeed M1s SoM:
                                      ^
Drop these :s in the descriptions to placate Rob's bot :)

> +        items:
> +          - const: sipeed,m1s
> +          - const: bouffalolab,bl808
> +
> +      - description: Carrier boards for the Sipeed M1s SoM:
> +        items:
> +          - enum:
> +              - sipeed,m1s-dock

Do we need the enum when there's only one? I assume you're future
proofing against adding more carriers?

Otherwise than those two bits:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +          - const: sipeed,m1s
> +          - const: bouffalolab,bl808
> +
> +additionalProperties: true
> +
> +...
> -- 
> 2.38.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
