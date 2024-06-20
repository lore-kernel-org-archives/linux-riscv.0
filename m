Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A12AC27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 16:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2zaNeA5z8+cCB8fKdaafsExqDIOVT3yNz35fzg6C/s=; b=4qhvR5Js/XMGr0
	iw0j8flhx55B1UJmnxsgV8mtJU3EgskPmdBDZbQeJ1ycEUyTmG7er68DY+sgyJLUQ/guF3oow7X9x
	Fur21MsBbBpWeLLisV2AvB1HWMTba9mfDjYXyrRZ/yCV5RDcs0Nr9EHYttjWYbPfyKym0oPnWFCyg
	oYIXAw1z59A51D8OZE9cGz6DQlLx7TZjGcx2fJ4IBpWKOAptnODasKoIF01p5C+V2S5fdQ4gqLNlc
	EmJ+7nHvdyXkVcJ2Kiaun9wtZXet7pIMx1i5HVghwhO1P5jz4Hi2rXf+xC+83/UBD/WAY6/T+95jz
	1SMPoEQuzIp1KQgS4fjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKf3-00000005rHc-35z0;
	Thu, 20 Jun 2024 16:29:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKf0-00000005rFv-1lBi
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 16:29:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D589621F4;
	Thu, 20 Jun 2024 16:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16970C2BD10;
	Thu, 20 Jun 2024 16:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718900956;
	bh=BrICMMZrS8m6MYe0kQ4cVRc55ARLzaghyayTnAQ5YTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tfRWGxIYwv7J5fGI6mps0kORlWb0ron2PdO3PjRczD4G/Y4pAX+qMDDlzHuead6Rf
	 5jAD0/cIlrJEByacZSSW93LFqUBkoDOjBef0kR0hKHegJcoEREXpWDfrik5/EuvrSn
	 A7zH4b572BPnpHCutK77CIgPTNSyRv7nDlEiH3jshxrlZyfz4MjKDkJiy/pOkFNwYm
	 QCNf0IMYU70IXg8D6ABA3AApRAgichtlf817CcTHMEK4DWew6s1cOGmDlHnZxTHah+
	 7BBA+bGOoJYioXZwVoofX8K7N4RxxewpcxU3LhG5yPloMJNDK8UTCOWm75uMINa8Cq
	 5Hsiul3plJ+Wg==
Date: Fri, 21 Jun 2024 00:15:12 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: adrian.hunter@intel.com, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	guoren@kernel.org, inochiama@outlook.com,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com, tingzhu.wang@sophgo.com,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2042 support
Message-ID: <ZnRVkPy5akurmi_D@xhacker>
References: <cover.1718697954.git.unicorn_wang@outlook.com>
 <dcc060c3ada7a56eda02b586c16c47f0a0905c61.1718697954.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dcc060c3ada7a56eda02b586c16c47f0a0905c61.1718697954.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_092918_613139_07E93E9C 
X-CRM114-Status: GOOD (  16.58  )
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

On Tue, Jun 18, 2024 at 04:38:30PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> SG2042 use Synopsys dwcnshc IP for SD/eMMC controllers.
> 
> SG2042 defines 3 clocks for SD/eMMC controllers.
> - AXI_EMMC/AXI_SD for aclk/hclk(Bus interface clocks in DWC_mshc)
>   and blck(Core Base Clock in DWC_mshc), these 3 clocks share one
>   source, so reuse existing "core".

No, this seems not correct. This should be the "bus" clk, and your above
sentence "aclk/hclk(Bus interface clocks in DWC_mshc)" implies this clk is
for bus

> - 100K_EMMC/100K_SD for cqetmclk(Timer clocks in DWC_mshc), so reuse
>   existing "timer" which was added for rockchip specified.
> - EMMC_100M/SD_100M for cclk(Card clocks in DWC_mshc), add new "card".

I think this is "core" clk, no? Plz check which internal clks' clock
source is the so called EMMC_100M/SD_100M.

> 
> Adding example for sg2042.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../bindings/mmc/snps,dwcmshc-sdhci.yaml      | 69 +++++++++++++------
>  1 file changed, 49 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index 4d3031d9965f..b53f20733f79 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -21,6 +21,7 @@ properties:
>        - snps,dwcmshc-sdhci
>        - sophgo,cv1800b-dwcmshc
>        - sophgo,sg2002-dwcmshc
> +      - sophgo,sg2042-dwcmshc
>        - thead,th1520-dwcmshc
>  
>    reg:
> @@ -29,25 +30,6 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> -  clocks:
> -    minItems: 1
> -    items:
> -      - description: core clock
> -      - description: bus clock for optional
> -      - description: axi clock for rockchip specified
> -      - description: block clock for rockchip specified
> -      - description: timer clock for rockchip specified
> -
> -
> -  clock-names:
> -    minItems: 1
> -    items:
> -      - const: core
> -      - const: bus
> -      - const: axi
> -      - const: block
> -      - const: timer
> -
>    resets:
>      maxItems: 5
>  
> @@ -63,6 +45,43 @@ properties:
>      description: Specify the number of delay for tx sampling.
>      $ref: /schemas/types.yaml#/definitions/uint8
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: sophgo,sg2042-dwcmshc
> +then:
> +  properties:
> +    clocks:
> +      items:
> +        - description: core clock
> +        - description: timer clock
> +        - description: card clock
> +
> +    clock-names:
> +      items:
> +        - const: core
> +        - const: timer
> +        - const: card
> +else:
> +  properties:
> +    clocks:
> +      minItems: 1
> +      items:
> +        - description: core clock
> +        - description: bus clock for optional
> +        - description: axi clock for rockchip specified
> +        - description: block clock for rockchip specified
> +        - description: timer clock for rockchip specified
> +
> +    clock-names:
> +      minItems: 1
> +      items:
> +        - const: core
> +        - const: bus
> +        - const: axi
> +        - const: block
> +        - const: timer
>  
>  required:
>    - compatible
> @@ -96,5 +115,15 @@ examples:
>        #address-cells = <1>;
>        #size-cells = <0>;
>      };
> -
> +  - |
> +    mmc@bb0000 {
> +      compatible = "sophgo,sg2042-dwcmshc";
> +      reg = <0xcc000 0x1000>;
> +      interrupts = <0 25 0x4>;
> +      clocks = <&cru 17>, <&cru 18>, <&cru 19>;
> +      clock-names = "core", "timer", "card";
> +      bus-width = <8>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +    };
>  ...
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
