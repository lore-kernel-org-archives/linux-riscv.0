Return-Path: <SRS0=xmGS=GL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F45C433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jan 2021 02:31:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A983623601
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jan 2021 02:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A983623601
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7B1QPF/NKt411yV5Nw/L3qYnNJnpwUuwIXUytC4BNzw=; b=wF4JjaeDr9SfJqpfQuxGhzbaN
	t60hJxT93aFIb+ZgiCpkE/B+NC7ZlBdLGTdiU0D62jp6q4/tGc6oy9k48E/bV9Mu95+heL1G7tXxq
	mR6ircVbT//ihBueedZaateH8PQ7S/Ra040y3mfB3T8tmq/JKAQ+xXG6Dib+YeOtMlEXR4wItP2eX
	ztihjQfCP4kDVZu7aorsoTPC4hW7ChxNVdlN1m0imE3SSQhPHxt/bGS+FCJdJd2tjh1dFR5XWcUgs
	7qGVdgz3BY9f2UXNZGG8IgtfqWUR70nZ4675nqso8DMFVs0PD1/jo+zzKYwEgOnw6I5p2F+rjHQiw
	2G4ykt/Sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxhYl-0005bH-2y; Fri, 08 Jan 2021 02:31:27 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxhYj-0005ar-71
 for linux-riscv@lists.infradead.org; Fri, 08 Jan 2021 02:31:26 +0000
Received: by mail-il1-f173.google.com with SMTP id 14so7587106ilq.2
 for <linux-riscv@lists.infradead.org>; Thu, 07 Jan 2021 18:31:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GIfcW+WHG8z7SGoqdIufDckI3aByw7oe2X21FXOjtJQ=;
 b=q1bz/wJz1aIbAN+d+egJ9i/nN+QbCf1dlmgYqjRPlj6WRXLa6KL5euIJRiJSXVFnBM
 uHsNHIKME8xeliJqW6Bif5xyMuYvZr87Qv8aDlCu4B2xNFv6Kp1TarkkOjfjs3N/lPK0
 K8XglntFQSgF6Tkv/tvgqmpDWT9aq8c2NcfidN6w+tLc5z3RyF3J+SsA4tNmDXW5vQHs
 /PwU9qx67bXFlzmMQtQuQwJUvuZkPkfstFh7+nUBtMHfZ6TVdEXoGw1Cqt6iJRupCStH
 OZNS07OL0oQrDX2kVCIUUm1ue+m0A7dfbgkAuf57vUNoTt86STFUNNBLBypW3pYL4OvD
 q8Ww==
X-Gm-Message-State: AOAM532V99RFH8Yho7VL69DatDXbcZz2XPtHdakkTurhIOtwT30wZa2y
 q9O4nlqoVDWxZon9sjKI/A==
X-Google-Smtp-Source: ABdhPJyFcS7+aInokqTq8EtfzmBKUMB1ryb+seTpqDPUc43EMh10DSiYgbqHNjvNanGBoF110kVGRA==
X-Received: by 2002:a92:a1da:: with SMTP id b87mr1818408ill.111.1610073083650; 
 Thu, 07 Jan 2021 18:31:23 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m75sm6155114ill.15.2021.01.07.18.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 18:31:22 -0800 (PST)
Received: (nullmailer pid 1754724 invoked by uid 1000);
 Fri, 08 Jan 2021 02:31:21 -0000
Date: Thu, 7 Jan 2021 19:31:21 -0700
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Subject: Re: [PATCH v3 4/5] dt-bindings: add bindings for polarfire soc
 system controller
Message-ID: <20210108023121.GA1750857@robh.at.kernel.org>
References: <20201223163316.29186-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201223163316.29186-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_213125_300653_AB9E7E33 
X-CRM114-Status: GOOD (  16.83  )
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
 daire.mcnamara@microchip.com, jassisinghbrar@gmail.com, j.neuschaefer@gmx.net,
 atish.patra@wdc.com, anup.patel@wdc.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, cyril.jean@microchip.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 23, 2020 at 04:33:16PM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the MSS system controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip,mpfs_sys_controller.yaml        | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
> new file mode 100644
> index 000000000000..60fde1925910
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/microchip/microchip,mpfs_sys_controller.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Microchip PolarFire SoC (MPFS) system controller
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>

'description'?

Perhaps including some info about what this block does and how it is 
accessed.

> +
> +properties:
> +  compatible:
> +    const: microchip,polarfire-soc-sys-controller
> +
> +  mboxes:
> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> +    description: |
> +      phandle and index of the mailbox controller device node.
> +      See: ../mailbox/mailbox.txt for more information.

All this is defined already in the common binding schema, drop.

> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - "mboxes"

Don't need quotes.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscontroller: syscontroller {
> +      compatible = "microchip,polarfire-soc-sys-controller";
> +      mboxes = <&mbox 0>;
> +    };
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
