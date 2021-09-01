Return-Path: <SRS0=l+05=NX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70678C432BE
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 01:32:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 181C26108B
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 01:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 181C26108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+UHBCtINcDTEMn+DgHnnlzIUWEL4Mryt4Qp6ld97DA=; b=p4UBgcYgIOBJz1
	zVvqZdCp475UD169jMRu1NC0UMmp2pv3mHjA1du+zLYoB+F9T0WNDZJnbAi8Hag/11vv8EA+0+zCv
	E7ysDtsm3xOKEjrS52zPxDdXv/ruhl+FPCmMCsJeIkpvr17Jt3LilIoMrLJCVOpNPT/nchY3P63yU
	13sUp5N0YwEcbcJ3d9IOoB16dxsNkftaVGAovkRt12LgKgti9uuzniQ/9xFY2kgWiDgltlNx1jXeT
	8SpQfqCNQV2sBTs6DhbitgfF0J2j7hrHzKEkj6YZcyoRv1UXJ4FPS6ZVq8NURDWKs5KYxjo9afsEP
	qE4e6Y6FuoOA0JGUTAuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLF6f-003VSV-6f; Wed, 01 Sep 2021 01:32:01 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLF6a-003VRp-Dq
 for linux-riscv@lists.infradead.org; Wed, 01 Sep 2021 01:32:00 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 a20-20020a0568300b9400b0051b8ca82dfcso1613671otv.3
 for <linux-riscv@lists.infradead.org>; Tue, 31 Aug 2021 18:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8Lw5wEyGLhFKN1QsSuNkTilRQwhSnI+fgJb5cuuXVMA=;
 b=CqnA7xVYqOFQVDF9kFdBB+gnYVGuqfz07+OnObOg8vcKCG5RW6B2l0jyNExaTcPXVI
 Sj818v0Qa/pl3PPjEFLBrWh4m0KZzbbxv/jGUwm29sDSp4SzETxKjQ0nuEW+BNwOpWOV
 fSc4B2haC/8wGjoh1+NLr/0eoKCwtfwvZ0cAyQc2/iBgJktCc78HbvAz0/oSr1VaZVgP
 kIum34uzunLj/qxdMqGnvjVhxtEdv+vXeIE+xMN01ET/zItjIwaw+5CTkt5TAvevH2LU
 Ex2hCOvsMPyYN/BVws85IGPhRgwOGEK4xMdvJchkwNdG/2LuizLoFvRN96ssgAW3F6AF
 755g==
X-Gm-Message-State: AOAM530obUQe66A6PT8X/A+y9Y9qkqUxR108EP46cnd8k/23v8W9rntp
 eNCakUyV143B1Ks/0R24tQ==
X-Google-Smtp-Source: ABdhPJyjvKiaj7dwS+oiz1y+frWjK2mfZjwgC5T3Qjj7iYAC0upO1xYLYbObjJYp8+UT7d10Mod7gw==
X-Received: by 2002:a05:6830:1355:: with SMTP id
 r21mr26477741otq.11.1630459914307; 
 Tue, 31 Aug 2021 18:31:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f5sm4039042oij.6.2021.08.31.18.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 18:31:53 -0700 (PDT)
Received: (nullmailer pid 1000001 invoked by uid 1000);
 Wed, 01 Sep 2021 01:31:52 -0000
Date: Tue, 31 Aug 2021 20:31:52 -0500
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
Subject: Re: [RFC PATCH v3 09/11] dt-bindings: timer: Add ACLINT MTIMER
 bindings
Message-ID: <YS7YCLy2bc3g4avj@robh.at.kernel.org>
References: <20210830041729.237252-1-anup.patel@wdc.com>
 <20210830041729.237252-10-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210830041729.237252-10-anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_183156_514021_C234F6E2 
X-CRM114-Status: GOOD (  23.33  )
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

On Mon, Aug 30, 2021 at 09:47:27AM +0530, Anup Patel wrote:
> We add DT bindings documentation for the ACLINT MTIMER device
> found on RISC-V SOCs.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  .../bindings/timer/riscv,aclint-mtimer.yaml   | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> new file mode 100644
> index 000000000000..b0b2ee6c761c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> @@ -0,0 +1,70 @@
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
> +    enum:
> +      - riscv,aclint-mtimer
> +
> +    description:
> +      Should be "riscv,aclint-mtimer" or "<vendor>,<chip>-aclint-mtimer".

Again, should be AND.

> +
> +  reg:
> +    description: |
> +      Specifies base physical address(s) of the MTIME register and MTIMECMPx
> +      registers. The 1st region is the MTIME register base and size. The 2nd
> +      region is the MTIMECMPx registers base and size.
> +    minItems: 2
> +    maxItems: 2
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4095
> +
> +  mtimer,no-64bit-mmio:
> +    type: boolean
> +    description: If present, the timer does not support 64-bit MMIO accesses
> +      for both MTIME and MTIMECMP registers.

This should be implied by the compatible.

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
> +    timer@2000000 {
> +      compatible = "riscv,aclint-mtimer";
> +      reg = <0x2000000 0x8>,
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
