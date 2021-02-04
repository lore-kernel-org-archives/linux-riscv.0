Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776B0C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 23:46:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AE2160231
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 23:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AE2160231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xtB3S7yhQRyuZK8P2MAkSYQIMvercthuV66/Q9DTVIg=; b=RA9PQ033ZQM+OsSxRH9L9EvfH
	udkYQLzFC4Kv67IZUMRD3e93p7HNbXP9xHnC5PU/wMGZe3dEJ8PqPm89ikfrsu5r9GjWLJbDc5cED
	hiwZLqyzFkJcHMoNLuMWRqID4lYJazbC2jHnkq3oImKNkYKUHuhdu6oWJU7Szn2foQZD+j10OSIKy
	zRAJZssMlHmN+UKbnueJYo1lzY07OeWvXcEKmefc63RBuqLDCBA7NHHe2g92amKpGFY8+2yRbVxSR
	iYQzNW/fpxsOKe3lz3/ndckmiFeCGtPEQnhmRail9bRtR4v3NgpHAaQ9VppFhso7eYRgb8sEMEA1A
	bvO7tj+ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7oK7-0005eG-Na; Thu, 04 Feb 2021 23:46:07 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7oK5-0005dU-Tj
 for linux-riscv@lists.infradead.org; Thu, 04 Feb 2021 23:46:06 +0000
Received: by mail-oi1-f172.google.com with SMTP id k142so5634696oib.7
 for <linux-riscv@lists.infradead.org>; Thu, 04 Feb 2021 15:46:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g7jFG92ASthp+evhIahL/xKZsqMPsPWAyoVCv0dj7og=;
 b=jUrnleazbCWey3J2drsZ2z+maKGK5IwKrEwWY3A0+AFA4Z4icDW5FcWUWoH5CyVERv
 QR7B0lUH8ZiKrVVOiL0yYiuxyaMnNp1wwgbNNk3UShKAqdPBDc4YvMkDU8rHl3GrHa6c
 hpijXuV6IrITkKDAjuSeC177rYXpIhln1Yp7v666/PgklQnd9QDfHemXX7xHt7HEUb1x
 6T2UMO5iC3bT682vbHwT+wNec44sE8V6W053FoYm4YEQj7ltqMEyj4glfe9L3B1iQyMm
 EEa7KW/Xt0dkIBWIhbA+pcm3skRRbeL4VmaEMAFT98hmKPmhkZ2n2oT/AzDoItWwonbe
 o8wA==
X-Gm-Message-State: AOAM530j59ZajL5vp62ExFDkFdP9T2kBmJiWlUn2blA/u0qD4IX29sqz
 7VvgR5xPh2K6w7pJZS6dcg==
X-Google-Smtp-Source: ABdhPJwhEt9yOyZ3hMkN+ACMqSZTNrLPw7G//0mtXqokJ5WcDyPQmisi3rnvnthBty/J3sk8NAXGrg==
X-Received: by 2002:aca:3746:: with SMTP id e67mr1281028oia.81.1612482363134; 
 Thu, 04 Feb 2021 15:46:03 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w7sm1439057oor.27.2021.02.04.15.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 15:46:02 -0800 (PST)
Received: (nullmailer pid 1347243 invoked by uid 1000);
 Thu, 04 Feb 2021 23:46:01 -0000
Date: Thu, 4 Feb 2021 17:46:01 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v15 02/16] dt-bindings: add Canaan boards compatible
 strings
Message-ID: <20210204234601.GA1340444@robh.at.kernel.org>
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
 <20210203125913.390949-3-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203125913.390949-3-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_184605_985178_A25836E1 
X-CRM114-Status: GOOD (  16.70  )
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
Cc: devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Sean Anderson <seanga2@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 03, 2021 at 09:58:59PM +0900, Damien Le Moal wrote:
> Introduce the file riscv/canaan.yaml to document compatible strings
> related to the Canaan Kendryte K210 SoC. The compatible string
> "canaan,kendryte-k210" used to indicate the use of this SoC to the
> early SoC init code is added. This new file also defines the compatible
> strings of all supported boards based on this SoC.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
>  .../devicetree/bindings/riscv/canaan.yaml     | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/canaan.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
> new file mode 100644
> index 000000000000..f8f3f286bd55
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/canaan.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/canaan.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan SoC-based boards
> +
> +maintainers:
> +  - Damien Le Moal <damien.lemoal@wdc.com>
> +
> +description:
> +  Canaan Kendryte K210 SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: sipeed,maix-bit
> +          - const: sipeed,maix-bitm
> +          - const: canaan,kendryte-k210
> +
> +      - items:
> +          - const: sipeed,maix-go
> +          - const: canaan,kendryte-k210
> +
> +      - items:
> +          - const: sipeed,maix-dock-m1
> +          - const: sipeed,maix-dock-m1w
> +          - const: canaan,kendryte-k210
> +
> +      - items:
> +          - const: sipeed,maixduino
> +          - const: canaan,kendryte-k210
> +
> +      - items:
> +          - const: canaan,kendryte-kd233
> +          - const: canaan,kendryte-k210

You could combine all the 2 entry cases. Some boards do this form though 
to add a description on each one. Either way,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +      - items:
> +          - const: canaan,kendryte-k210
> +
> +additionalProperties: true
> +
> +...
> -- 
> 2.29.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
