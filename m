Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19557C87FDA
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 02:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJtOkciE9wV9vMInS8EbPRXiiDqR4ks50dsMQsB2v7o=; b=mZP4iMVTQUYncw
	HaMyuohGnTRUvj9fz3a3EmmQ+gtsJqBaC3dHstNt6WRTh/Nk3+uZo+OH51ZYiZNSMfeVqstIfCWuN
	X3cZLGLVv4RGUD8vjd8nLU7hLh2UkMZo6+MKojkruIC/vFQDenJyfIAPy5QgC01S/wdMlOJh7QaGK
	/1BDPkr8NqqR78fXYkRktfGFWNQqquQn+MMYaWVjJdlpjCZ0zSpfg6d0FL7xXUKmTJoV4323gtXgt
	86vgxxm5BM2r5rKMPKfZmVqHUtKb48O9tehTPtE4i8+BniVFOK5TTC+R01Y+IrzwY7cUIFgIU9AEr
	ByeKZuN5N1MOTcceFk8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulICM-00000006KcJ-3C4r;
	Mon, 11 Aug 2025 02:23:42 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulICI-00000006Kbb-2yMl
	for linux-riscv@lists.infradead.org;
	Mon, 11 Aug 2025 02:23:40 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id ABE3D2599D;
	Mon, 11 Aug 2025 04:23:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JdiyJLpcUReS; Mon, 11 Aug 2025 04:23:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754879014; bh=vKwdokCSbfarr3tfiBIQ+v8PuIYAWoLWZBdsuWHTjX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ue3W1p/0pXOBeNfkPwdtHjYymOU+XmuRgfcVr/kEmzNY9uYvjLpBkoWLmrYNehL8u
	 C2xey/68hv5zZCRvqPya6MwxSJ2qCQSrRbpcANklFrS6KSk/bSiecCc1eb3GrS2fNL
	 vEATL2MyhuptYyHpIBQB5kayIsU0+pvKd7b6WhUpzQlu0zYoGDTXIxKn5DzgkT0jxq
	 fbLmYYwxKGUCLX6X1vJXHWZQMN8DPXvNwK8bz9K8NpsxwPl+8QC9Q+76wCoUYqe4uv
	 f6U2hglawgZn0mkLxRJcTcGOTS66gDsmHUhg/C+TghkKXK1btEXZiQeo0E0e/OsxTY
	 M/VBEsJDPb1eg==
Date: Mon, 11 Aug 2025 02:23:14 +0000
From: Yao Zi <ziyao@disroot.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] reset: thead: Scope TH1520 reset driver to VO subsystem
Message-ID: <aJlUErajSRZJexYa@pie>
References: <CGME20250810211419eucas1p173e5fefcfaae437d8b5531d1406ff6a6@eucas1p1.samsung.com>
 <20250810-fix_reset_2-v1-1-b0d1900ba578@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250810-fix_reset_2-v1-1-b0d1900ba578@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_192339_287489_88C4C964 
X-CRM114-Status: GOOD (  27.24  )
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 10, 2025 at 11:14:19PM +0200, Michal Wilczynski wrote:
> The reset controller driver for the TH1520 was using the generic
> compatible string "thead,th1520-reset". However, the current
> implementation only manages the resets for the Video Output (VO)
> subsystem.
> 
> Using a generic compatible is incorrect as it implies control over all
> reset units on the SoC. This could lead to conflicts if support for
> other reset controllers on the TH1520 is added in the future like AP.
> 
> To ensure correctness and prevent future issues, this patch renames the
> compatible string to "thead,th1520-reset-vo". The device tree bindings,
> the th1520.dtsi file, and the driver itself are updated to use this new,
> more specific compatible. The device tree node label is also renamed
> from 'rst' to 'rst_vo' for clarity.
> 
> Fixes: 30e7573babdc ("dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller")
> Reported-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml | 6 +++---
>  arch/riscv/boot/dts/thead/th1520.dtsi                           | 6 +++---
>  drivers/reset/reset-th1520.c                                    | 2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> index f2e91d0add7a60e12973c216bb5a989857c3c47c..f84c5ae8bc3569cb1d4e8f07999888ea26e175d0 100644
> --- a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> @@ -16,7 +16,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> -      - thead,th1520-reset
> +      - thead,th1520-reset-vo

I think we should mark thead,th1520-reset as deprecated instead of
removing it completely, to demonstrate the ABI problem and make the
situation clear.

>    reg:
>      maxItems: 1
> @@ -36,8 +36,8 @@ examples:
>      soc {
>        #address-cells = <2>;
>        #size-cells = <2>;
> -      rst: reset-controller@ffef528000 {
> -        compatible = "thead,th1520-reset";
> +      rst_vo: reset-controller@ffef528000 {
> +        compatible = "thead,th1520-reset-vo";
>          reg = <0xff 0xef528000 0x0 0x1000>;
>          #reset-cells = <1>;
>        };
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 42724bf7e90e08fac326c464d0f080e3bd2cd59b..9cc2f1adf489ac432b2f3fbb06b655490d9e14b3 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -235,7 +235,7 @@ aon: aon {
>  		compatible = "thead,th1520-aon";
>  		mboxes = <&mbox_910t 1>;
>  		mbox-names = "aon";
> -		resets = <&rst TH1520_RESET_ID_GPU_CLKGEN>;
> +		resets = <&rst_vo TH1520_RESET_ID_GPU_CLKGEN>;
>  		reset-names = "gpu-clkgen";
>  		#power-domain-cells = <1>;
>  	};
> @@ -500,8 +500,8 @@ clk: clock-controller@ffef010000 {
>  			#clock-cells = <1>;
>  		};
>  
> -		rst: reset-controller@ffef528000 {
> -			compatible = "thead,th1520-reset";
> +		rst_vo: reset-controller@ffef528000 {
> +			compatible = "thead,th1520-reset-vo";
>  			reg = <0xff 0xef528000 0x0 0x4f>;
>  			#reset-cells = <1>;
>  		};
> diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
> index 7874f0693e1b427a094a68f2b6d783985e789bf8..05ed11972774618df4512b7c9f9f12e71455e48b 100644
> --- a/drivers/reset/reset-th1520.c
> +++ b/drivers/reset/reset-th1520.c
> @@ -116,7 +116,7 @@ static int th1520_reset_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id th1520_reset_match[] = {
> -	{ .compatible = "thead,th1520-reset" },
> +	{ .compatible = "thead,th1520-reset-vo" },

And this change actually breaks compatibility with older devicetrees.
thead,th1520-reset has been part of the ABI, and we should keep the
compatible string to maintain the compatibility.

With these two changes, I think the changes could be seperated into
different patches, one for the dt-binding, one for the driver, and one
for the devicetree, which could make their scope more clear.

Thanks,
Yao Zi

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, th1520_reset_match);
> 
> ---
> base-commit: 561c80369df0733ba0574882a1635287b20f9de2
> change-id: 20250810-fix_reset_2-a618d7426534
> 
> Best regards,
> -- 
> Michal Wilczynski <m.wilczynski@samsung.com>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
