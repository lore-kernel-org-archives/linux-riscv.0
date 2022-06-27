Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121CDC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 21:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krDguYGuaV5wFXXOlzx6kd2H7xubSv+1v6HKcYNgR8I=; b=q2YLgibMDCROPq
	iO5wHws5B4Grsy5vSmIl9LC2PFtVKYSAyd8Uq6Bexe1wBjJQzv0O518dtphyZ1swrIuu/M29u1Nlk
	7dkUB/ECPP7ssLdIkkwhomPUe50xY/Ht9Dl8wLbXnPXulvXUxkWLjMhjUMBGqAkV9HhaEq8dagECM
	RWR4P77CnQuekwAF7XOwYX7hpADUHUxn45N81cBlvy1BOThdrRFynkqPHwFFuiy4eXuWXR/Paq8W5
	bF5kMAUldiW5ztFgKW/ucp6MWdjnmybkhXNoqRkTXZfG1BGADNLGfkqFaTT3FU+twDBnH3hY9pGhh
	7dythEW25bevt4JrE5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5w2u-002sVx-W8; Mon, 27 Jun 2022 21:13:25 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5w2r-002sUN-BL
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 21:13:23 +0000
Received: by mail-lj1-x234.google.com with SMTP id a39so11349412ljq.11
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 14:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Apd1Cl8iWlr7VPj1iuOe666SC1Q2pQo9qEBUCr9vf6Q=;
        b=ilyEOtv07N3ArdjBB7bMKwAqjb/e0wlxydgdur1zOwDRqzH4IPqX2FlQxVaGAXw6Kc
         Gc0VmznO21rzcUs44XvprgCJ41kZL5S9X1gx6kQ+guwTI6uiSc4zItEWOnsDW3kNAVlF
         sfGw15jYmTuWW1FxW/Lb57dg0O1NF3p/fPa5o15TUnzZIQmB98u2AvQRL0iesgljp0tc
         xc9//5AKa4Iw3dQz5Ksx+KmaP7act61c7ia75qFkgn5dlsfLCparb572EaPCLMdTHnjX
         0Dp5EEprtNhtw/ZXAV6oYcWZi6HDJptcetDIzhKexpPO7ZBBmv8UMK0X2PqLjPdeMC7b
         JSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Apd1Cl8iWlr7VPj1iuOe666SC1Q2pQo9qEBUCr9vf6Q=;
        b=x0nIfzDPK4qp5xhU5/Zoko4QpFb/8J8FW0KKCyxSpnQe8zL8w2T7bqj081dswSQHnP
         IFXXz35DC6X9HgyxBlSOfkliVdbtspA5V0/sam4RNa0mJIL2ccYmlqsmDYLm+HBC+jSS
         qPAhRAY5/C3B7G756aCeEeAnmc0hsoOfQbaz37aO2CWj7USGNXrdp8hRnJUfTtv1Z8FP
         y4cYf6vZnNO2tDB+guUNyvZhX3XvUotFwZPAbBQIvlmXrLf+KrC3Mm0UpM49x8RSVyqx
         oCKlPevLgGYMMfrCyg90z45cJCaXp0EGqaNXe06Ppro/vTLSC6bFUJfy0Uoz7VaeJEZR
         F65A==
X-Gm-Message-State: AJIora+ZQNPD+VPOmONPUTpx+IZpytQ3GDfxHD2xy1mk+tk60y32iHUB
	wtN+1H+PPhOhi9qItednEwU=
X-Google-Smtp-Source: AGRyM1t9VxFwTJAlhP264dX7IvF0c94LGOWuU36vJO57G/WRfCPD7iXEUNRYkA0yEtu/rvZ1Rje57Q==
X-Received: by 2002:a2e:9191:0:b0:25a:8858:f60d with SMTP id f17-20020a2e9191000000b0025a8858f60dmr7495670ljg.423.1656364397334;
        Mon, 27 Jun 2022 14:13:17 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id z9-20020a2eb529000000b0025bc79181b4sm358400ljm.36.2022.06.27.14.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 14:13:16 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:13:14 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <mail@conchuod.ie>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Heng Sia <jee.heng.sia@intel.com>,
	Jose Abreu <joabreu@synopsys.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 06/16] dt-bindings: timer: add Canaan k210 to Synopsys
 DesignWare timer
Message-ID: <20220627211314.dc2hempelyl5ayjg@mobilestation>
References: <20220627194003.2395484-1-mail@conchuod.ie>
 <20220627194003.2395484-7-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220627194003.2395484-7-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_141321_430175_6871153A 
X-CRM114-Status: GOOD (  23.64  )
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

On Mon, Jun 27, 2022 at 08:39:54PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan k210 apparently has a Sysnopsys Designware timer but
> according to the documentation & devicetree it has 2 interrupts rather
> than the standard one. Add a custom compatible that supports the 2
> interrupt configuration and falls back to the standard binding (which
> is currently the one in use in the devicetree entry).
> 

> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58

Firstly, it's page 51 in the framework of the document pages
enumeration.

Judging by the comment in the document above and what the HW reference
manual says regarding the IRQ signals, what you really have on K210 is
the DW APB Timer IP-cores each configured with two embedded timers.
It's done by the IP-core synthesize parameter NUM_TIMERS={1..8}, which
in your case equals to 2. A similar situation is on our SoC and, for
instance, here:

arch/arm/boot/dts/berlin2q.dtsi
arch/arm/boot/dts/berlin2.dtsi
arch/arm/boot/dts/berlin2cd.dtsi
(Though the Berlin2 APB Timer have been configured with 8 timers.)

So the correct modification would be:
1. Split up the nodes into two ones with one IRQ per each node.
2. Make sure I was right by testing the new dts out.
3. Update the DT-node only and leave the DT-bindings as is.

-Sergey

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/timer/snps,dw-apb-timer.yaml     | 28 +++++++++++++++----
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> index d33c9205a909..9a76acc7a66f 100644
> --- a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> @@ -12,6 +12,9 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - const: canaan,k210-apb-timer
> +          - const: snps,dw-apb-timer
>        - const: snps,dw-apb-timer
>        - enum:
>            - snps,dw-apb-timer-sp
> @@ -21,9 +24,6 @@ properties:
>    reg:
>      maxItems: 1
>  
> -  interrupts:
> -    maxItems: 1
> -
>    resets:
>      maxItems: 1
>  
> @@ -41,7 +41,23 @@ properties:
>  
>    clock-frequency: true
>  
> -additionalProperties: false
> +unevaluatedProperties: false
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: canaan,k210-apb-timer
> +
> +then:
> +  properties:
> +    interrupts:
> +      maxItems: 2
> +
> +else:
> +  properties:
> +    interrupts:
> +      maxItems: 1
>  
>  required:
>    - compatible
> @@ -60,8 +76,8 @@ oneOf:
>  examples:
>    - |
>      timer@ffe00000 {
> -      compatible = "snps,dw-apb-timer";
> -      interrupts = <0 170 4>;
> +      compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
> +      interrupts = <0 170 4>, <0 170 4>;
>        reg = <0xffe00000 0x1000>;
>        clocks = <&timer_clk>, <&timer_pclk>;
>        clock-names = "timer", "pclk";
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
