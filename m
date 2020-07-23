Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61456C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 17:08:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DB6F20792
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 17:08:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cS2QKC+5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DB6F20792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jHtzWlhP3ZXZIvE1ofngMhZRzGXzYWWSWsZVOBEYDZU=; b=cS2QKC+5nRsbvV74qCdr9wU+l
	4ENFByfj8nJgJtbKhxmW8hPGgMr8yjk9LSSoJMA/ABDDpDIBOkb6lGlsBk8SZCe4s32Te1ympcQ5Z
	yBW+2bCV4xAAHDPYVVBVdWCYTSZPnYT/6orFzdidggSrBazxYcWdHnlKhNC3zT6XoQpLqzv8uWdD4
	uMLEGoRUerVCUSA5SNVQibL1Al85O+D9VHSdf191l7fguhs5T8IRiyhkx6tX08zGQQaKBLHHYKLJr
	iTH8KeJDK47QzAbDkDAukIOy4+i46cAwjoH8kwB7S2Wb92c4gUAogQqmfb2KJP5TArDTlZF8/56lS
	0/7GPcrMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyehW-0002Ty-Q8; Thu, 23 Jul 2020 17:08:10 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyehV-0002TM-0K
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 17:08:09 +0000
Received: by mail-io1-f68.google.com with SMTP id e64so6996066iof.12
 for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2020 10:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2PWZkJpZ4ipb8P8p+Pg9LEmAeqADVPvG7RRrCZ//S+E=;
 b=PoQNpp8G3cQZUQB5hPuwKHvZDDKKu8LrH2NfajwAEdi2VrC6uaG3X23/OKSB0JavjN
 Sv3IjkksHQ9zUccR3kwpYk5XluEGNvzpSlKCl4QU7Geg5N7uHfnqMOxf+9a5x52Qvayg
 ottgZAh3nb3Qc9YkLp8rVNKwoRL2cgY4xWB+Iv+GWIokH9SJjWbQQ5jXmrrisXcqably
 GwVsn3tFXYtBHXZBjL6lSaN9aEPt43L27MmaR4+PbJRbzVx0TIGn5qRyuSQhOLCkWO4U
 /qFFQ5jAOwWga11NbWFCyrxKnR5e7kuM3nAMkitCG4VgTsUa3FpH+Lj5qvZxBOPPotfO
 VCig==
X-Gm-Message-State: AOAM532jFeLNMKvhyNhZgdQrqq+TK9Zt6DZCdtBHgxI+EYqQqogJWAFO
 jPlYClyQPQVBlnzRgbLJDg==
X-Google-Smtp-Source: ABdhPJy+mKukhzCYRjhxLsHsBZnW1R9/7jgyhS48f5gwxsaDSYQ5vRd5zhVrQuLqdvM6icVj9WOxxA==
X-Received: by 2002:a6b:7c08:: with SMTP id m8mr2363635iok.200.1595524087764; 
 Thu, 23 Jul 2020 10:08:07 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id n15sm1524181ioc.15.2020.07.23.10.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 10:08:07 -0700 (PDT)
Received: (nullmailer pid 542912 invoked by uid 1000);
 Thu, 23 Jul 2020 17:08:06 -0000
Date: Thu, 23 Jul 2020 11:08:06 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <anup.patel@wdc.com>
Subject: Re: [PATCH v5 4/4] dt-bindings: timer: Add CLINT bindings
Message-ID: <20200723170806.GA535824@bogus>
References: <20200723142409.47057-1-anup.patel@wdc.com>
 <20200723142409.47057-5-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723142409.47057-5-anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_130809_063963_83F81E5C 
X-CRM114-Status: GOOD (  17.84  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berhing <kernel@esmil.dk>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 07:54:09PM +0530, Anup Patel wrote:
> We add DT bindings documentation for CLINT device.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Tested-by: Emil Renner Berhing <kernel@esmil.dk>
> ---
>  .../bindings/timer/sifive,clint.yaml          | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> new file mode 100644
> index 000000000000..8ad115611860
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/sifive,clint.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive Core Local Interruptor
> +
> +maintainers:
> +  - Palmer Dabbelt <palmer@dabbelt.com>
> +  - Anup Patel <anup.patel@wdc.com>
> +
> +description:
> +  SiFive (and other RISC-V) SOCs include an implementation of the SiFive
> +  Core Local Interruptor (CLINT) for M-mode timer and M-mode inter-processor
> +  interrupts. It directly connects to the timer and inter-processor interrupt
> +  lines of various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local
> +  interrupt controller is the parent interrupt controller for CLINT device.
> +  The clock frequency of CLINT is specified via "timebase-frequency" DT
> +  property of "/cpus" DT node. The "timebase-frequency" DT property is
> +  described in Documentation/devicetree/bindings/riscv/cpus.yaml
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sifive,clint0
> +      - const: sifive,fu540-c000-clint

Wrong order. Most specific goes first.

> +
> +    description:
> +      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
> +      Supported compatible strings are -
> +      "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
> +      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
> +      CLINT v0 IP block with no chip integration tweaks.
> +      Please refer to sifive-blocks-ip-versioning.txt for details
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts-extended:
> +    minItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended

Add:

additionalProperties: false

> +
> +examples:
> +  - |
> +    clint@2000000 {

timer@...

> +      compatible = "sifive,clint0", "sifive,fu540-c000-clint";
> +      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
> +                             &cpu2intc 3 &cpu2intc 7
> +                             &cpu3intc 3 &cpu3intc 7
> +                             &cpu4intc 3 &cpu4intc 7>;
> +       reg = <0x2000000 0x4000000>;

64MB of register space? Doesn't matter much for 64-bit, but would waste 
lots of virtual space (low mem) on 32-bit.

> +    };
> +...
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
