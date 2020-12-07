Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B9BC433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 15:57:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7167C23731
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 15:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7167C23731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LcA7qazhJn4gk9R/GEOGVbxeoXdjjC2ICLubyxloFq0=; b=LIY8q4iK5PLKBK1PXaEtpN/ye
	WcRcC1TzEIEy8RIFEOCeBhHZP6CG6T7uGKcKwZm5mqQv0TMtuJsSZXMTd+mFcJ9NNRtvD+LyC1PXF
	ZxZu7vwFc9LbNKR8f9sLfsN3TBcc9PrTjFTWf3DabuxcE5xUTcUkUPDJw5NFXs0bHkkPXVUn+FKJN
	Lx7AsO+IgavAAAbNNnR8IuThzUpyG22rNFLG/9ga4ey1AkvCSo0IZOMFsjbtONZv+lA1XipHgzL6O
	ZC7/KUDqDgl7ThLGuEKXekp+KGeDr8yPdTXbkYwsD36sTDHJPaobFtaRYlPxyBPXmmeJtidFz6c5t
	n0owitQMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmIsq-0004jS-0E; Mon, 07 Dec 2020 15:57:04 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmIsn-0004i7-ES
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 15:57:02 +0000
Received: by mail-oi1-f195.google.com with SMTP id d27so8339393oic.0
 for <linux-riscv@lists.infradead.org>; Mon, 07 Dec 2020 07:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hsOMZgEE8UhsWhVv7cu5xwPuYZ+QaDeTUjEEYmQ/L1U=;
 b=t6CT919DRPZiBzkcFpEw5BhiXOIYE36Kd3/SmgHYfi/w+6F7JE5Khauf93jkBFotWt
 N3yuGfWwTX5F3IhXvkaz/K96Lssnw4ax0yr2HCV3oVO5Z+2Nl1eh9xKop3sbd/CRlzEZ
 sCzSCipucd4iY3RNnNd3t/MWCQovQ4Vm1pbM2XOFHLDIIUQKClPjM12FE0zFQBr+voMg
 SPXlfnnhtUZ6qI3kq4Z9qR30H8s7Y4l0X+MILlkUd9Tk6bTjD8V8CkhGNWMZLtaKlHDG
 Si6GSzBJQZUCuOAhnO7ohQwwLguvLjQUhYtgg0G3Zsm8a5D5AvNc1SU6um8WhhjEl6kj
 THhA==
X-Gm-Message-State: AOAM531NoBd/+fxL71DtNIoN9+NebAT/wHPu2oJUa98XKL6weA6PSd+y
 SFfInNNCWvvF8ZuyyZT4oA==
X-Google-Smtp-Source: ABdhPJxkyYm+K3548Xdy2L+VcNfgUPunU99ZP7sfZJcQSS0768YNjewgdMQT8n2W2zo6Ts9jaUMntA==
X-Received: by 2002:aca:5204:: with SMTP id g4mr12939950oib.91.1607356619559; 
 Mon, 07 Dec 2020 07:56:59 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z10sm2704039oom.3.2020.12.07.07.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 07:56:58 -0800 (PST)
Received: (nullmailer pid 350077 invoked by uid 1000);
 Mon, 07 Dec 2020 15:56:57 -0000
Date: Mon, 7 Dec 2020 09:56:57 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Subject: Re: [PATCH v2 4/5] dt-bindings: add bindings for polarfire soc
 system controller
Message-ID: <20201207155657.GB345332@robh.at.kernel.org>
References: <20201201110311.28593-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201110311.28593-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_105701_516108_5A8303E7 
X-CRM114-Status: GOOD (  17.89  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, damien.lemoal@wdc.com, aou@eecs.berkeley.edu,
 lewis.hanly@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, jassisinghbrar@gmail.com, atish.patra@wdc.com,
 anup.patel@wdc.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 cyril.jean@microchip.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 01, 2020 at 11:03:11AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the MSS system controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip,mpfs_sys_controller.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
> new file mode 100644
> index 000000000000..c22fc203b95c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/microchip/microchip,mpfs_sys_controller.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Microchip MPFS system controller
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +properties:
> +  compatible:
> +    const: microchip,polarfire-soc-sys-controller
> +
> +  mbox-names:
> +    maxItems: 1
> +    description: name of the mailbox controller device node

Kind of pointless to have names when there is only one entry. I'd drop, 
but if you do, you need to define what the name is.

> +
> +  mboxes:
> +    maxItems: 1
> +    description: |
> +      phandle and index of the mailbox controller device node. It must be 0 (hardware supports only one channel).

No need to redefine a common property. And the value 0 is outside the 
scope of this binding. That's dependent on the mbox h/w.

> +
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1

These are not needed unless you have child nodes. If you do, then they 
also need to be defined here.

> +
> +required:
> +  - compatible
> +  - mbox-names
> +  - "#address-cells"
> +  - "#size-cells"
> +  - "mboxes"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscontroller: syscontroller {
> +      compatible = "microchip,polarfire-soc-sys-controller";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      mbox-names = "mbox-mpfs";
> +      mboxes = <&mbox 0>;
> +    };
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
