Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA14C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 20:03:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3686061073
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 20:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3686061073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFpzMR6c7Y0uu/RiW2wGke+1W2bfpWUaU2JBlROA7+I=; b=q2wet5M1EP1CmP
	F4TbmUuq25TmO+kHwtiqbeLu3qVnLY0nmhkHBgKhfGLCakedEZDOOBNhZQ0AQ05hjJCJ1VA1Rad5V
	x9K7IlX8gh5DD5wcqQIbJ8lAuzzpbV2RSx0/6gmLXcz85UQUjzHV/Np1Cb4JkzzIbIiscQhZ1eoLK
	+ZItwJUDR8zamls3fXNp3EAV+25ek1Esf/8rH3sj9G3OLD/bVXZYAV3/YUAByMlIVSHM4IPWUdtyF
	TAeoDK1MarhCgPlyEhrsn73IR5dbctdMAME7F9vVGp6qcDSP+Njsq9NXyvo3kUbmhR+ryAUWc1l2a
	J4WYCQY9qSE5Xhu6BTxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYw51-00427h-BP; Fri, 08 Oct 2021 20:02:55 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYw4y-004275-9v
 for linux-riscv@lists.infradead.org; Fri, 08 Oct 2021 20:02:53 +0000
Received: by mail-oi1-f174.google.com with SMTP id t4so13355139oie.5
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 13:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9nQoap1ULuQK7iVLoWAeKBBSs/JkNcbSL7NwgshzBsI=;
 b=sWV6xsUL2l4zXYa9X1qiTOpPSNtGrQrN0OT5Jaw3I104h35spCOttrWZvUsbtdaBZE
 f2dQwe/BVob38Er1z2s3fXEn0d3M+T9lQPeJyF+fGChozkfjEgHf0JAV/FM22OW2L9Ro
 42J27WlumQpsoEplSfAZIiUoEpqP4TUtYaoJcsvIHWUE113BA6pdn8ErUEkB/upt/PTk
 6KnQBKXl9V5Spv3QuDboWBC4afeKo2aB0qCX0h57vAgncWtcsmxU3pikRaskNS/KbRQg
 SLaNVxWqOG43hL+fh6ZZ/dmDifJo1A0jZtO9u23BiXYRxgbmXxelGqWfsSS6BDbvEP5q
 pXxw==
X-Gm-Message-State: AOAM530WjuxMyNLIn6Lw4AWx7JthoIs6fKJwOH10rfOAl7QcTLhYyxVn
 a5Lvim1NjTqvuBuIFPilig==
X-Google-Smtp-Source: ABdhPJzqK1YBt9O2Wf7HyQiPYRdY2MRV8ungwnGt9QUq/jioAb4R17CLgfe9r5Mc3Vqd8WKz58zv1A==
X-Received: by 2002:a05:6808:14d6:: with SMTP id
 f22mr18407990oiw.132.1633723369981; 
 Fri, 08 Oct 2021 13:02:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l2sm81700otu.23.2021.10.08.13.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 13:02:49 -0700 (PDT)
Received: (nullmailer pid 3230980 invoked by uid 1000);
 Fri, 08 Oct 2021 20:02:48 -0000
Date: Fri, 8 Oct 2021 15:02:48 -0500
From: Rob Herring <robh@kernel.org>
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [RFC PATCH v4 08/10] dt-bindings: timer: Add ACLINT MTIMER
 bindings
Message-ID: <YWCj6CcB29fEQkFI@robh.at.kernel.org>
References: <20211007123632.697666-1-anup.patel@wdc.com>
 <20211007123632.697666-9-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211007123632.697666-9-anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_130252_397507_0E49B3B9 
X-CRM114-Status: GOOD (  21.52  )
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

On Thu, Oct 07, 2021 at 06:06:30PM +0530, Anup Patel wrote:
> We add DT bindings documentation for the ACLINT MTIMER device
> found on RISC-V SOCs.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  .../bindings/timer/riscv,aclint-mtimer.yaml   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> new file mode 100644
> index 000000000000..ebb7e81a5a12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V ACLINT M-level Timer
> +
> +maintainers:
> +  - Anup Patel <anup.patel@wdc.com>
> +
> +description:

You need '|' if you want to maintain the paragraphs.

> +  RISC-V SOCs include an implementation of the M-level timer (MTIMER) defined
> +  in the RISC-V Advanced Core Local Interruptor (ACLINT) specification. The
> +  ACLINT MTIMER device is documented in the RISC-V ACLINT specification found
> +  at https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc.
> +
> +  The ACLINT MTIMER device directly connects to the M-level timer interrupt
> +  lines of various HARTs (or CPUs) so the RISC-V per-HART (or per-CPU) local
> +  interrupt controller is the parent interrupt controller for the ACLINT
> +  MTIMER device.
> +
> +  The clock frequency of ACLINT is specified via "timebase-frequency" DT
> +  property of "/cpus" DT node. The "timebase-frequency" DT property is
> +  described in Documentation/devicetree/bindings/riscv/cpus.yaml
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +         - sifive,fu540-c000-aclint-mtimer
> +      - const: riscv,aclint-mtimer
> +
> +    description:
> +      Should be "<vendor>,<chip>-aclint-mtimer" and "riscv,aclint-mtimer".
> +
> +  reg:
> +    description: |
> +      Specifies base physical address(s) of the MTIME register and MTIMECMPx
> +      registers. The 1st region is the MTIME register base and size. The 2nd
> +      region is the MTIMECMPx registers base and size.
> +    minItems: 2
> +    maxItems: 2

All this can be expressed as:

items:
  - description: The MTIME registers
  - description: The MTIMECMPx registers

'reg' is always the physical address and size, so no need to redefine 
common properties.


> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4095
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +
> +examples:
> +  - |
> +    timer@2004000 {
> +      compatible = "sifive,fu540-c000-aclint-mtimer", "riscv,aclint-mtimer";
> +      reg = <0x200bff8 0x8>,
> +            <0x2004000 0x7ff8>;
> +      interrupts-extended = <&cpu1intc 7>,
> +                            <&cpu2intc 7>,
> +                            <&cpu3intc 7>,
> +                            <&cpu4intc 7>;
> +    };
> +...
> -- 
> 2.25.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
