Return-Path: <SRS0=Swg1=CX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4CCC43461
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 18:00:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B683C20757
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 18:00:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dfE3o9z/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B683C20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/nJ28qxkslgi3UrrKOxrso+Fsl6aiFYMS2dUT8bheUo=; b=dfE3o9z/sr5ayPPoGk29xSW1v
	O1MoBgkTyMMdQEb/1n0F2NDp0jU8QLI9CqLKZyAWaZ7+nIvm3xfBttkr9vge0OHgiAYIiY/S6IvuA
	iShJG3a1gTGS0yqynn+kvJm01eIzvlGTLPiBJ+qm0adFFKDz1Iac530JMcPxzVIeKmUh9+boWZXAc
	9LTowLQmFRsgga9UCzJkwIDnAG/WszTZXTOTQdprEy28jI+sf1s7BwLSIxbni9GEU+4zDOXU/X67+
	t/xR11y4clAqGssOSx0vghBgJ3ZIr8n8/tzZ0ryZNjL6vvAdU+sgfk8+oq9pEchznaX2Dxl5+SzmD
	VZfyOgSwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHslq-00085r-N3; Mon, 14 Sep 2020 18:00:06 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHslo-000858-GS
 for linux-riscv@lists.infradead.org; Mon, 14 Sep 2020 18:00:05 +0000
Received: by mail-io1-f65.google.com with SMTP id h4so1072011ioe.5
 for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2020 11:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gzNN3HZZcC4xGOcBJqGS3DjMEJgqFY3enUUKhW0YfKM=;
 b=doPNVLXLWIo+0KTeAlDvNXjhoueYon9LeXSzbX5DHG3LNDF0++GNJdWucRDj2ZsU5t
 pscvF3crJyrhLj6Z2ZgbmFBpDLJO0yXjf9gIy3ASSjAJv6jQVA7a/BZowinXSE+zhubA
 ouCf35RI6B0p+ORCmAE/WF0K8Oid/AhHXqz9puh5gYmjpoUhvaHH33FvokfP+WzZNZKw
 0U6H9/xAENgAU6rbCrAgVZKIX7unkKXFGY9kMOydZzqyYd9o8s8oNQXNvL+HJV5lWsQ+
 meQ2WUj8UJ9R0tDIfUKYvDYpqIX2b93az99ajudxWyU5G6cVQj2elAfkaHh9wWw4y1ZN
 TcQw==
X-Gm-Message-State: AOAM530+GWB3b/F5y2WmJ2Qvcub4hxyC0T+aVWqq5z/wS3oXV31DClbt
 PmzsCXWxpDCiumDjk1ewpA==
X-Google-Smtp-Source: ABdhPJy1fWF8jAS3tfIaj/ZZ32fOJcUmIOzJdJiLdBMrivkmifvH6f13QOTpJlSIyKsE8qAV9BgQBg==
X-Received: by 2002:a6b:8f10:: with SMTP id r16mr12351915iod.165.1600106403423; 
 Mon, 14 Sep 2020 11:00:03 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id l10sm1015753ilm.75.2020.09.14.11.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 11:00:02 -0700 (PDT)
Received: (nullmailer pid 4145728 invoked by uid 1000);
 Mon, 14 Sep 2020 18:00:00 -0000
Date: Mon, 14 Sep 2020 12:00:00 -0600
From: Rob Herring <robh@kernel.org>
To: Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [RESEND PATCH v2 1/1] dt-bindings: riscv: sifive-l2-cache:
 convert bindings to json-schema
Message-ID: <20200914180000.GA4136408@bogus>
References: <1598633743-1023-1-git-send-email-sagar.kadam@sifive.com>
 <1598633743-1023-2-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598633743-1023-2-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_140004_573489_6900D263 
X-CRM114-Status: GOOD (  25.76  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, yash.shah@sifive.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 10:25:43PM +0530, Sagar Kadam wrote:
> Convert the device tree bindings for the SiFive's FU540-C000 SoC's L2 Cache
> controller to YAML format.
> 
> Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
> ---
>  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 51 ------------
>  .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 92 ++++++++++++++++++++++
>  2 files changed, 92 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> deleted file mode 100644
> index 73d8f19..0000000
> --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -SiFive L2 Cache Controller
> ---------------------------
> -The SiFive Level 2 Cache Controller is used to provide access to fast copies
> -of memory for masters in a Core Complex. The Level 2 Cache Controller also
> -acts as directory-based coherency manager.
> -All the properties in ePAPR/DeviceTree specification applies for this platform
> -
> -Required Properties:
> ---------------------
> -- compatible: Should be "sifive,fu540-c000-ccache" and "cache"
> -
> -- cache-block-size: Specifies the block size in bytes of the cache.
> -  Should be 64
> -
> -- cache-level: Should be set to 2 for a level 2 cache
> -
> -- cache-sets: Specifies the number of associativity sets of the cache.
> -  Should be 1024
> -
> -- cache-size: Specifies the size in bytes of the cache. Should be 2097152
> -
> -- cache-unified: Specifies the cache is a unified cache
> -
> -- interrupts: Must contain 3 entries (DirError, DataError and DataFail signals)
> -
> -- reg: Physical base address and size of L2 cache controller registers map
> -
> -Optional Properties:
> ---------------------
> -- next-level-cache: phandle to the next level cache if present.
> -
> -- memory-region: reference to the reserved-memory for the L2 Loosely Integrated
> -  Memory region. The reserved memory node should be defined as per the bindings
> -  in reserved-memory.txt
> -
> -
> -Example:
> -
> -	cache-controller@2010000 {
> -		compatible = "sifive,fu540-c000-ccache", "cache";
> -		cache-block-size = <64>;
> -		cache-level = <2>;
> -		cache-sets = <1024>;
> -		cache-size = <2097152>;
> -		cache-unified;
> -		interrupt-parent = <&plic0>;
> -		interrupts = <1 2 3>;
> -		reg = <0x0 0x2010000 0x0 0x1000>;
> -		next-level-cache = <&L25 &L40 &L36>;
> -		memory-region = <&l2_lim>;
> -	};
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> new file mode 100644
> index 0000000..e14c8c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (C) 2020 SiFive, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/sifive-l2-cache.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive L2 Cache Controller
> +
> +maintainers:
> +  - Sagar Kadam <sagar.kadam@sifive.com>
> +  - Yash Shah <yash.shah@sifive.com>
> +  - Paul Walmsley  <paul.walmsley@sifive.com>
> +
> +description:
> +  The SiFive Level 2 Cache Controller is used to provide access to fast copies
> +  of memory for masters in a Core Complex. The Level 2 Cache Controller also
> +  acts as directory-based coherency manager.
> +  All the properties in ePAPR/DeviceTree specification applies for this platform.
> +
> +allOf:
> +  - $ref: /schemas/cache-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +     - enum:
> +        - sifive,fu540-c000-ccache
> +    description: |
> +      Should have "sifive,<soc>-cache" and "cache".

That's not what the schema describes or the example has (the 'cache' 
fallback).

> +
> +  cache-block-size:
> +    const: 64
> +
> +  cache-level:
> +    const: 2
> +
> +  cache-sets:
> +    const: 1024
> +
> +  cache-size:
> +    const: 2097152
> +
> +  cache-unified: true
> +
> +  interrupts:
> +    description: |
> +      Must contain entries for DirError, DataError and DataFail signals.
> +    minItems: 1

The old doc said must have 3 entries.

> +    maxItems: 3
> +
> +  reg:
> +    maxItems: 1
> +    description: address of cache controller's registers.

Drop this.

> +
> +

One blank line please.

> +  next-level-cache:
> +    description: |
> +      Phandle to the next level cache if present.

No need to re-describe common properties unless you have something 
unique to this device to say. Just:

'next-level-cache: true'

> +
> +  memory-region:
> +    description: |
> +      The reference to the reserved-memory for the L2 Loosely Integrated memory region.
> +      The reserved memory node should be defined as per the bindings in reserved-memory.txt.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - cache-block-size
> +  - cache-level
> +  - cache-sets
> +  - cache-size
> +  - cache-unified
> +  - interrupts
> +  - reg
> +
> +examples:
> +  - |
> +    cache-controller@2010000 {
> +        compatible = "sifive,fu540-c000-ccache";
> +        cache-block-size = <64>;
> +        cache-level = <2>;
> +        cache-sets = <1024>;
> +        cache-size = <2097152>;
> +        cache-unified;
> +        reg = <0x2010000 0x1000>;
> +        interrupt-parent = <&plic0>;
> +        interrupts = <1 2 3>;
> +        next-level-cache = <&L25>;
> +        memory-region = <&l2_lim>;
> +    };
> -- 
> 2.7.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
