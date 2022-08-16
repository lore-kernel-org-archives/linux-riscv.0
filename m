Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964CEC2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 09:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FD3ko/c7jdj/QDprWKSDRSj3werEP8gH29BsBTrt71U=; b=ryESlL67TDpHYk
	cdoM4L8omfdxR0DL8BkOb/a9OStpHu7VazuiyYSEWvZSKd9zTsGemRN05jq4CZIeNAnUVjcKso1tU
	EVOBOvbkxbGi8W7Z/zGdGbgu9x1cM1N6Y3IqSE6VBQDwE11I4qOR0ps6LawrXkUzefyLvqzf7FyAU
	zfTcqkZW5iGgH/8FKewnuX3L406EKvAyOPma2VBHLysz+E2AE4v2GKh5+hTXwWae6vLB9/WRJhdwM
	fDKxPop2v7UvVx1tCNmtW/euMM/zGxJ3yxJFfiPlL9qYmYFmhQL/0DQAIYk/ZJpnmD2pdIKt68rUu
	+7pgeh9L90vBqJH02/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsTQ-00HCeB-MN; Tue, 16 Aug 2022 09:02:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsTN-00HCR3-Qc
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 09:02:55 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oNsTH-0002ls-7s; Tue, 16 Aug 2022 11:02:47 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 04/12] dt-bindings: riscv: Add Allwinner D1 board compatibles
Date: Tue, 16 Aug 2022 11:02:46 +0200
Message-ID: <5849253.UjTJXf6HLC@diego>
In-Reply-To: <1f84e925-1a0f-6100-c444-a8157e14ab5a@linaro.org>
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-5-samuel@sholland.org> <1f84e925-1a0f-6100-c444-a8157e14ab5a@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_020253_904947_408CB6DD 
X-CRM114-Status: GOOD (  17.12  )
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

Am Dienstag, 16. August 2022, 09:39:38 CEST schrieb Krzysztof Kozlowski:
> On 15/08/2022 08:08, Samuel Holland wrote:
> > Several SoMs and boards are available that feature the Allwinner D1 SoC.
> > Document their compatible strings.
> > 
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > ---
> > 
> >  .../devicetree/bindings/riscv/sunxi.yaml      | 64 +++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/sunxi.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/sunxi.yaml b/Documentation/devicetree/bindings/riscv/sunxi.yaml
> > new file mode 100644
> > index 000000000000..564a89499894
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/sunxi.yaml
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/sunxi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner RISC-V SoC-based boards
> > +
> > +maintainers:
> > +  - Chen-Yu Tsai <wens@csie.org>
> > +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> > +  - Samuel Holland <samuel@sholland.org>
> > +
> > +description:
> > +  Allwinner RISC-V SoC-based boards
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - description: Dongshan Nezha STU SoM
> > +        items:
> > +          - const: 100ask,dongshan-nezha-stu
> > +          - const: allwinner,sun20i-d1
> > +
> > +      - description: D1 Nezha board
> > +        items:
> > +          - const: allwinner,d1-nezha
> 
> You grow the list unnecessary. Several entries should be an enum, unless
> platform maintainer insists on such approach for all Allwinner Riscv
> platforms. Just be aware it will grow...

Having the binding document provide value to mere mortals and not only
the automated tools is plus for me :-) . So obviously personally I like
the current style more. But yeah, it's mainly a matter of preference :-) .



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
