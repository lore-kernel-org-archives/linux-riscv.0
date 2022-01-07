Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6278C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RPN3R4SacgVBCcPnASelVdCg4rro5MNvXrUr71OfeVk=; b=bAHrts912cVU+8oNMj58SLEQp0
	lq3mEyC1sY3idUBERzn0ra62mlkI2AoADZ2sgtwAFXRnBmH3HmD6s1Cly0MCZrNofQlK4mMGUtF8D
	kbExIRcWwfZNvkfxSOOht3ioqgCqWvIS1kNWewronnzeU61flYZbubgF8lA6UjD9K65FZXSSADBHE
	RcxPokwLt+ENGzDWkY1VeEsa2DVnFor7/PO1Xd6MyL1ddhMkLR/AbvrAjXlfG5Ev3bYu0efuZp/1J
	idSyMNjuJj/30U8PSxOAGcfRt2O20FyURS6e1+E6EvE0q5zbmneJ1T+Y54+fuPPFyaI0aHQeJ9hr+
	1ADkq8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5qDK-004BJm-74; Fri, 07 Jan 2022 14:27:30 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5qD7-004BFl-IL; Fri, 07 Jan 2022 14:27:20 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 207EQahw093477;
 Fri, 7 Jan 2022 08:26:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641565596;
 bh=bbpnL2bqMN5H6aNKxgvIvY9vGPdi1O8RpGftvud1Gx8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=OBKsSOCXPMflYsrV1dtvfOQBQCM+dt8F3FowNuexaOIHWQXksqzPVDy0tCsNmKU2B
 Cyo5sTcLNQCSGiL5++OUNoVs8GVUsnWwKJ7+dasTTs1eDbEXRaAXQ9VRVkgekvWx+v
 LsAhce0fL/LqhXDcbeLszNQkVccx71MkVTOsZPw8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 207EQZXO115620
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 Jan 2022 08:26:35 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 7
 Jan 2022 08:26:35 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 7 Jan 2022 08:26:35 -0600
Received: from [10.249.36.164] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 207EQZKj097440;
 Fri, 7 Jan 2022 08:26:35 -0600
Subject: Re: [PATCH] dt-bindings: Drop required 'interrupt-parent'
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Nobuhiro Iwamatsu
 <nobuhiro1.iwamatsu@toshiba.co.jp>, Jassi Brar <jassisinghbrar@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Lee Jones <lee.jones@linaro.org>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michal Simek <michal.simek@xilinx.com>,
 - <patches@opensource.cirrus.com>, John Crispin <john@phrozen.org>,
 Hauke Mehrtens <hauke@hauke-m.de>, Kumar
 Gogada <bharat.kumar.gogada@xilinx.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <netdev@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Nagalla,
 Hari" <hnagalla@ti.com>
References: <20220107031905.2406176-1-robh@kernel.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <cf75f1ee-8424-b6b2-f873-beea4676a29f@ti.com>
Date: Fri, 7 Jan 2022 08:26:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107031905.2406176-1-robh@kernel.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_062717_752124_7CE6C15F 
X-CRM114-Status: GOOD (  17.63  )
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

Hi Rob,

On 1/6/22 9:19 PM, Rob Herring wrote:
> 'interrupt-parent' is never required as it can be in a parent node or a
> parent node itself can be an interrupt provider. Where exactly it lives is
> outside the scope of a binding schema.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/gpio/toshiba,gpio-visconti.yaml  | 1 -
>  .../devicetree/bindings/mailbox/ti,omap-mailbox.yaml     | 9 ---------
>  Documentation/devicetree/bindings/mfd/cirrus,madera.yaml | 1 -
>  .../devicetree/bindings/net/lantiq,etop-xway.yaml        | 1 -
>  .../devicetree/bindings/net/lantiq,xrx200-net.yaml       | 1 -
>  .../devicetree/bindings/pci/sifive,fu740-pcie.yaml       | 1 -
>  .../devicetree/bindings/pci/xilinx-versal-cpm.yaml       | 1 -
>  7 files changed, 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> index 9ad470e01953..b085450b527f 100644
> --- a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> +++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> @@ -43,7 +43,6 @@ required:
>    - gpio-controller
>    - interrupt-controller
>    - "#interrupt-cells"
> -  - interrupt-parent
>  
>  additionalProperties: false
>  
> diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> index e864d798168d..d433e496ec6e 100644
> --- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> @@ -175,15 +175,6 @@ required:
>    - ti,mbox-num-fifos
>  
>  allOf:
> -  - if:
> -      properties:
> -        compatible:
> -          enum:
> -            - ti,am654-mailbox
> -    then:
> -      required:
> -        - interrupt-parent
> -

There are multiple interrupt controllers on TI K3 devices, and we need this
property to be defined _specifically_ to point to the relevant interrupt router
parent node.

While what you state in general is true, I cannot have a node not define this on
K3 devices, and end up using the wrong interrupt parent (GIC
interrupt-controller). That's why the conditional compatible check.

regards
Suman

>    - if:
>        properties:
>          compatible:
> diff --git a/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml b/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
> index 499c62c04daa..5dce62a7eff2 100644
> --- a/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
> +++ b/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
> @@ -221,7 +221,6 @@ required:
>    - '#gpio-cells'
>    - interrupt-controller
>    - '#interrupt-cells'
> -  - interrupt-parent
>    - interrupts
>    - AVDD-supply
>    - DBVDD1-supply
> diff --git a/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml b/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml
> index 437502c5ca96..3ce9f9a16baf 100644
> --- a/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml
> +++ b/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml
> @@ -46,7 +46,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupt-parent
>    - interrupts
>    - interrupt-names
>    - lantiq,tx-burst-length
> diff --git a/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml
> index 7bc074a42369..5bc1a21ca579 100644
> --- a/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml
> +++ b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml
> @@ -38,7 +38,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupt-parent
>    - interrupts
>    - interrupt-names
>    - "#address-cells"
> diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> index 2b9d1d6fc661..72c78f4ec269 100644
> --- a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> @@ -61,7 +61,6 @@ required:
>    - num-lanes
>    - interrupts
>    - interrupt-names
> -  - interrupt-parent
>    - interrupt-map-mask
>    - interrupt-map
>    - clock-names
> diff --git a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
> index a2bbc0eb7220..32f4641085bc 100644
> --- a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
> +++ b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
> @@ -55,7 +55,6 @@ required:
>    - reg-names
>    - "#interrupt-cells"
>    - interrupts
> -  - interrupt-parent
>    - interrupt-map
>    - interrupt-map-mask
>    - bus-range
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
