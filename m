Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A3AC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 10:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqHA0/m67JwIjwxryiVn8zJfO9xJmHD/tLA9QHKM5kk=; b=emJmWNrpG6hYxK
	TAzkr21jqh7LboKQ7BtQ9AJvjD3oKebDyJcZrm9hSW1SVAFkmHdC2dDV8JHmbg48B512h7QmTGjhD
	OsWyyPuJ17Yi/hVg32HKaJQcgL0uE7bimyK72YQP4zohuyaWTf039Kbz+1wTsfu0857NhOKjAIJC5
	gk8sO9EMKUiOSRc1dHqc3P2W9RLjnCfn53yCTEh8s6q/8LIay3wxcY8tcxgMbQaSCt/NUm7qL4Ow4
	lAF9B3riXFMUfoSpV1MqO60ydeIzN1kYcCvYnfHkNR16NLEsCBLDk40FdBNevs3BO+1gcFnSuOy/s
	XIv23k2b8wU0XuQoO1rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdwH-00CArL-8G; Wed, 27 Jul 2022 10:06:49 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdwD-00CAoC-0r
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 10:06:47 +0000
Received: by mail-yb1-xb34.google.com with SMTP id a82so23863299ybb.12
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 03:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BPThQ8r+ZT9oR0uD4pwUUo7cjt+VO1rD6YsDH+nlihk=;
        b=qbWR7gUpU7e9J+PPmxUdtB5/GmZf5wlrRNm0DOOaKF5DXy89Dr/unc9YC5mc8A1esU
         XFX1MYNO7zaRatC2WSmQfw5Dq+pud9H5xu+XOlqt4DIdpSqcKhdTIdu//7IeLzE09Ccj
         XKb/5o5PNXYfTeog/pJmB4e4yThWzGJN4zH/CSpp/XT5AyJX8oCf5MCIxUgChjt0VT3A
         WSgLFqpYmdqVG6b7hxPnAfECJjDh9a1BNHw1WZ7hCBBUiE0+t7AyazrXL3QHmyp4h5o+
         9QW3R/qYLdVkEdcjKjVtM61T+4WTbamQz6hooXUr0s/TSMkMAPWd0EoOD9leKB5PBS0Y
         33cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BPThQ8r+ZT9oR0uD4pwUUo7cjt+VO1rD6YsDH+nlihk=;
        b=viETqfK4cfyC1ZGM31gzWaIjkBfyw48I5mnRWnI+lKnLPwLZXEqlvAny6i+iAnmLOk
         awceHqRWeKtyYBnEteCxWJSNgL/P00zuOyQM2e+2gwDuKtenxkhW7+nAGhWlm5cmewgA
         6SHaO0Y5AyPd3+TFrl4onZef/Rqqq+jg/nMh/OlVTV9owe9OKg5QpLEmMf730aT/w4/D
         i3LCgpCw67TEsL9u8kgkabtcioIrbYQqD6lYUNGoPhBZae4T+7dkeJrzb89PriqEm+xi
         uPFw20/uGRAKtqL5jCHWyOP6clswEeZxDvxdkEV10xPq3pdC1iSWryG6FGAWzBBw0hya
         LXlw==
X-Gm-Message-State: AJIora+k+Yby8ICxcyo+5At6mpw02K+3ZaN0s3wMIbiyyoX8m93n/Llc
	PO5PZmfYK0m4XPTV5tiyioxTbJgU1OQiXMGQv+3v+ML/dtd4RLtI
X-Google-Smtp-Source: AGRyM1uLyoISGXm0Dw4G+wD70j1DWooC7FmOm76jqB8f5BUN1E/7u6keGf4JjYqcGFuYXQUnjqRSppYhLPKBQ2LLuiM=
X-Received: by 2002:a25:4689:0:b0:671:6d4f:c974 with SMTP id
 t131-20020a254689000000b006716d4fc974mr7048181yba.354.1658916403819; Wed, 27
 Jul 2022 03:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org> <CA+V-a8sTw1qzuTeD2vb7RgDmmNdEP5qEcxXCjrFgkyrBrLrt5Q@mail.gmail.com>
 <e64cc15e-b31e-876d-b3cf-b60d255c495b@linaro.org>
In-Reply-To: <e64cc15e-b31e-876d-b3cf-b60d255c495b@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Jul 2022 11:06:16 +0100
Message-ID: <CA+V-a8u1VW9xaj2KjySyMuegpisLVENO_6uJOpAFZGbKziYLYw@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_030645_409582_9B2AAB66 
X-CRM114-Status: GOOD (  28.69  )
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

Hi Krzysztof,

On Wed, Jul 27, 2022 at 10:54 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/07/2022 11:05, Lad, Prabhakar wrote:
> > Hi Krzysztof,
> >
> > Thank you for the review.
> >
> > On Wed, Jul 27, 2022 at 9:54 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 26/07/2022 20:06, Lad Prabhakar wrote:
> >>> Document Renesas RZ/Five (R9A07G043) SoC and SMARC EVK based on this SoC.
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>> ---
> >>>  .../devicetree/bindings/riscv/renesas.yaml    | 49 +++++++++++++++++++
> >>>  1 file changed, 49 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/riscv/renesas.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/riscv/renesas.yaml b/Documentation/devicetree/bindings/riscv/renesas.yaml
> >>> new file mode 100644
> >>> index 000000000000..f72f8aea6a82
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/riscv/renesas.yaml
> >>> @@ -0,0 +1,49 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/riscv/renesas.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Renesas RZ/Five Platform Device Tree Bindings
> >>> +
> >>> +maintainers:
> >>> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> >>> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>> +
> >>> +# We want to ignore this schema if the board is SMARC EVK based on ARM64 arch
> >>> +select:
> >>> +  not:
> >>> +    properties:
> >>> +      compatible:
> >>> +        contains:
> >>> +          items:
> >>
> >> I think you should rather ignore the RiscV SoCs, not specific board.
> >>
> > You mean to ignore ARM/64 SoCs?
> >
> > Agreed just the below enum, should do the trick.
> >
> >             - enum:
> >                 - renesas,r9a07g043u11
> >                 - renesas,r9a07g043u12
> >                 - renesas,r9a07g044c1
> >                 - renesas,r9a07g044c2
> >                 - renesas,r9a07g044l1
> >                 - renesas,r9a07g044l2
> >                 - renesas,r9a07g054l1
> >                 - renesas,r9a07g054l2
> >
> >
> >>> +            - const: renesas,smarc-evk
> >>> +            - enum:
> >>> +                - renesas,r9a07g043u11
> >>> +                - renesas,r9a07g043u12
> >>> +                - renesas,r9a07g044c1
> >>> +                - renesas,r9a07g044c2
> >>> +                - renesas,r9a07g044l1
> >>> +                - renesas,r9a07g044l2
> >>> +                - renesas,r9a07g054l1
> >>> +                - renesas,r9a07g054l2
> >>> +            - enum:
> >>> +                - renesas,r9a07g043
> >>> +                - renesas,r9a07g044
> >>> +                - renesas,r9a07g054
> >>
> >> Did you actually test that it works and properly matches?
> >>
> > Yes I have run the dtbs_check and dt_binding _check for ARM64 and
> > RISC-V. Do you see any cases where it can fail?
>
>
> Just remove the renesas,smarc-evk2 from
> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts. Do you see the
> error? Not from this schema. The only error you will see is that no
> matching schema was found.
>
I did run the dtbs_check test as per your suggestion (below is the
log) and didn't see "no matching schema error"

prasmi@prasmi:~/work/linux$ git diff
diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
index 121e55282d18..b8129d85515f 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
@@ -11,5 +11,5 @@

 / {
        model = "Renesas SMARC EVK based on r9a07g043u11";
-       compatible = "renesas,smarc-evk", "renesas,r9a07g043u11",
"renesas,r9a07g043";
+       compatible = "renesas,r9a07g043u11", "renesas,r9a07g043";
 };
prasmi@prasmi:~/work/linux$ rm
Documentation/devicetree/bindings/processed-schema.json
arch/arm64/boot/dts/renesas/*.dtb
prasmi@prasmi:~/work/linux$ make ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu- dtbs_check -j6
  LINT    Documentation/devicetree/bindings
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTC     arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb
  DTC     arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb
  DTC     arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb
  DTC     arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb
  DTC     arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb
  CHECK   arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb
  CHECK   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb
  CHECK   arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb
  CHECK   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb
  CHECK   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb
/home/prasmi/work/linux/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb:
flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
    ['micron,mt25qu512a', 'jedec,spi-nor'] is too long
    'micron,mt25qu512a' does not match
'^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
    'micron,mt25qu512a' is not one of ['issi,is25lp016d',
'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f',
'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
    'jedec,spi-nor' was expected
    From schema:
/home/prasmi/work/linux/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb:0:0:
/soc/spi@10060000/flash@0: failed to match any schema with compatible:
['micron,mt25qu512a', 'jedec,spi-nor']
/home/prasmi/work/linux/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb:
pinctrl@11030000: 'interrupt-controller' is a required property
    From schema:
/home/prasmi/work/linux/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
/home/prasmi/work/linux/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb:
pinctrl@11030000: '#interrupt-cells' is a required property
    From schema:
/home/prasmi/work/linux/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
/home/prasmi/work/linux/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb:
pinctrl@11030000: #address-cells: 'anyOf' conditional failed, one must
be fixed:
    [[2]] is not of type 'object'
    From schema:
/home/prasmi/work/linux/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
/home/prasmi/work/linux/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb:
flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
    ['micron,mt25qu512a', 'jedec,spi-nor'] is too long
    'micron,mt25qu512a' does not match
'^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
    'micron,mt25qu512a' is not one of ['issi,is25lp016d',
'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f',
'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
    'jedec,spi-nor' was expected
    From schema:
/home/prasmi/work/linux/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb:0:0:
/soc/spi@10060000/flash@0: failed to match any schema with compatible:
['micron,mt25qu512a', 'jedec,spi-nor']
/home/prasmi/work/linux/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb:
pinctrl@11030000: #address-cells: 'anyOf' conditional failed, one must
be fixed:
    [[2]] is not of type 'object'
    From schema:
/home/prasmi/work/linux/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
/home/prasmi/work/linux/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb:
flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
    ['micron,mt25qu512a', 'jedec,spi-nor'] is too long
    'micron,mt25qu512a' does not match
'^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
    'micron,mt25qu512a' is not one of ['issi,is25lp016d',
'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f',
'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
    'jedec,spi-nor' was expected
    From schema:
/home/prasmi/work/linux/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb:0:0:
/soc/spi@10060000/flash@0: failed to match any schema with compatible:
['micron,mt25qu512a', 'jedec,spi-nor']
/home/prasmi/work/linux/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb:
usbphy-ctrl@11c40000: compatible:0: 'renesas,r9a07g043-usbphy-ctrl' is
not one of ['renesas,r9a07g044-usbphy-ctrl',
'renesas,r9a07g054-usbphy-ctrl']
    From schema:
/home/prasmi/work/linux/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb:0:0:
/soc/usbphy-ctrl@11c40000: failed to match any schema with compatible:
['renesas,r9a07g043-usbphy-ctrl', 'renesas,rzg2l-usbphy-ctrl']
/home/prasmi/work/linux/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb:
pinctrl@11030000: #address-cells: 'anyOf' conditional failed, one must
be fixed:
    [[2]] is not of type 'object'
    From schema:
/home/prasmi/work/linux/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
prasmi@prasmi:~/work/linux$
prasmi@prasmi:~/work/linux$


Note: I am using dtschema version 2022.7.

> I don't think you can use such selects...
>
> Best regards,
> Krzysztof

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
