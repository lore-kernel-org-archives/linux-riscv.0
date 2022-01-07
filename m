Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228FAC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 09:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHU5GTbF2+2edm+i87qqmizdVvhdPN0NtpgtH/3oXyE=; b=3zL1ml7/tFNlTG
	BiZwKDVZgM0qLncthYt2BGYYIToddFWymMX3f93zEr5HB2ZjU+cgn+dskkGSjF0ODLbHVM6KbfPNa
	hkWkOmgFFfrtecCuFBhFZ/rtaB8J8djw23zKwOK5WJWgryRV3C6mTwoZeAb6YHXGtsnwtccrSH6Iz
	lHAW0xitGk61ABXYUciQbIoibUJJWYaYpOX/amBTYCyD8ntbuSJUwM3UcV0ypNm5LXRmBsBZ2nHhi
	tkBfTeFWxbZc5JoSmd9hlPSWxz2fOTUxp0oKMiCXgiMoD6tKnv96cfEjvlr2hJO11YQ2m2IVPrk9E
	IGAwgZk0SCgOiotztnyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5lbH-0034Wv-RZ; Fri, 07 Jan 2022 09:31:55 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5lb5-0034To-Nz
 for linux-riscv@lists.infradead.org; Fri, 07 Jan 2022 09:31:46 +0000
Received: by mail-ed1-x536.google.com with SMTP id j6so19729942edw.12
 for <linux-riscv@lists.infradead.org>; Fri, 07 Jan 2022 01:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TezwQvy/GrVo/VcXl6Kmghnct9UHJH58seMMxyEI02A=;
 b=w2V+iJUefGp3KlCNcBsEDN8BorejU5hp+6CahknIVFUn1oU3ZtxwjYoPDxNPziGlUz
 a0NH22cY2sthTfr8gRtlzr68GQu94z9Vv96M1sr/BVNCzMP7KwH1oLc7Y7uPIprMBJGp
 jTor+uLGWD9ND97HWJEqboKIKTNtxd8Zvqy6BGjuUSvq1G+ejn9P6ls5DRx/e8AnqPY1
 oaAsTxnPIOOhhcMRfiaCuwrI7HEMhNpBw6z8s5N4t1kc9kc1BvoA7/mW0OOcWAqSy0qI
 cnNGy3ahX/tVMOrHF3dRzQQbbFBVtWLE/ojZIbe0r6fp77jLr7sD41Ov5rETXekX5g/5
 kEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TezwQvy/GrVo/VcXl6Kmghnct9UHJH58seMMxyEI02A=;
 b=X+vr95MZB9RRle46j5CPz+3YlDKQoxkEm1e/WaNRteQlmHU9nYzlCJ6uTTawXpPuHO
 09ePIZ2PZeN1LkPvQzVdgrSLKjoag2MKj038t+Ogk+4pT53WOSa6bc1DeMP+DCyrb3UI
 q/11rVk+ecms/BF8YJXevi5GzzLb6V41bwwWu5APdzRm5CZChOSbliA+iNbLwZCb5Hel
 t9JJ0M2RwuTXsv96P+rDhspWG8sve7Qbl+vQOUGZ5ya8sQ0OulrYnmFP811+Esx/9jmo
 Ju9yifyOSgRlfDCgT9ULmujWtpwSN6jv6cmyEIcclc5f/fhmy47WDvLyoNL3/30kzcdm
 lvQg==
X-Gm-Message-State: AOAM533zVUelYd2SCd5mvBiIJCCYHAD8gymDrDNu7JsrVcUcyWl2VKwh
 Pc3lXZhuFSRAVL5/Engc6oMx0SqeaMfoNY0ZER6FLQ==
X-Google-Smtp-Source: ABdhPJy6Pd5StasJd8Vr9TrAn4EyS2U33Mwnkud6vbrw4HpmRdCGAwwGrmolTePbriBG/I8s4Z7aITOOhf8mDSkaceA=
X-Received: by 2002:a17:907:386:: with SMTP id
 ss6mr6976366ejb.101.1641547901133; 
 Fri, 07 Jan 2022 01:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20220107031905.2406176-1-robh@kernel.org>
In-Reply-To: <20220107031905.2406176-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Jan 2022 10:31:30 +0100
Message-ID: <CAMRc=MdmOMfyyiguowrU52BvoxMr8u3sLQfzCiY_Rqs=qUsX-Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop required 'interrupt-parent'
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee.jones@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Michal Simek <michal.simek@xilinx.com>, Suman Anna <s-anna@ti.com>, 
 - <patches@opensource.cirrus.com>, John Crispin <john@phrozen.org>, 
 Hauke Mehrtens <hauke@hauke-m.de>,
 Kumar Gogada <bharat.kumar.gogada@xilinx.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, 
 netdev <netdev@vger.kernel.org>, linux-pci@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_013143_887387_7BC1FB7D 
X-CRM114-Status: GOOD (  14.81  )
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

On Fri, Jan 7, 2022 at 4:19 AM Rob Herring <robh@kernel.org> wrote:
>
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
> --
> 2.32.0
>

For GPIO:

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
