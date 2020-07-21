Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DFBC433E6
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 01:16:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B8FC20658
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 01:16:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FFfvw76y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="Ce5+x++x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B8FC20658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ovtmC7NvWQ/dIrQmU+VVRgi9HGfBTxHc3xbmqg3xsLE=; b=FFfvw76yDnGHZ5qm6QwnYz1N0
	G609boB3wdSTfI12jDFyTACKmxAs/CEVlJqLnD7oM+wVCmV6dgZX7vyMWobnQJN1KkvW3dHYO970S
	sDRRVg8bQBjk8lf0GFwDdzDVNE3v4+TlDN328G2K+BbABLBWX8bjyQAKEr/5DI4CJbae1b7i5cDE2
	qwWQC7HCkTiREXR+uRiufb5tsbsAHTPuoH+kwu7VuO8n8i2DsaBR8UOQiPliw6bhHdTKsWTBKqq++
	ubizfCLXxqSya130coMvaj/a1HGDhrcFOvB59kl4JvDsc7mj/8GmyYBhRCamkK7zJAjYkrowZ+g95
	lYFgDCFgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxgsl-0002Dn-Sh; Tue, 21 Jul 2020 01:15:47 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxgsj-0002DF-3A
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 01:15:46 +0000
Received: by mail-wm1-x341.google.com with SMTP id f139so1210035wmf.5
 for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2020 18:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0m1PBDlf1LPTxPG0j6MS17W+ARPO8tVxYxjfZxGbckE=;
 b=Ce5+x++xkvWmQy5tV2ek8r7BcQsw1cnHjnq9IuBBj4ctIMLrk93iuc98LxUYPCK4Og
 jXE88z4QZFv4Ix7/4u8SyV5QyNcB5lOUWBtoMAEp9hnwWYnqxtvg2AUoepjjXtt6EOru
 t89VHWNOMR1jUPfsemv6niF42JiAx3scOvcV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0m1PBDlf1LPTxPG0j6MS17W+ARPO8tVxYxjfZxGbckE=;
 b=HvfFJEQb4zdIlks/irm/8D6R5wTfGximqw4M06Bjf9vJpIxYtlq5TYNBMSNcRTeQog
 Zd9EModtt9LptUJLMeUnOLaLkegnyODpx0TJjl5n3fTcizT93lMcbILEhfH8Qw1vXFtq
 BKW2eB+rHNUeMDQe0iTgNeCycqD3J/yWUSdjFITa5Xr2TVBj4jGApsiCSs56/k2RD8jT
 REg7LMX5GiplKbAPiZDGp9mXrTYypP9lFWeapOlYT6Ukuau+Win7zUzX3rRgOqFC2qwt
 6OKDmaepnmG3pNsKLf69sPQLxOa/gE09S81ww+e8AKAboSRx90JSe9xPZ4k/oQtHH+ej
 GTNA==
X-Gm-Message-State: AOAM531R3KDZkoos1nS8asNWIjb6BvW+JI+1U3rA3J2Cy7iD1kIhlHwv
 5Eocyu18VgB+I/jlZYNhA7AsX96WcPQH9lbCim9Q
X-Google-Smtp-Source: ABdhPJzWQtySB01DNvPHDj45pwAGcvZh8S0h0KZzv1pnkzbL6e2npAV+4EXFSbg2gu+eHmxZCvo2HTCuKpZ05HmE5mI=
X-Received: by 2002:a1c:2095:: with SMTP id g143mr1620823wmg.78.1595294143811; 
 Mon, 20 Jul 2020 18:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200717075101.263332-1-anup.patel@wdc.com>
 <20200717075101.263332-5-anup.patel@wdc.com>
In-Reply-To: <20200717075101.263332-5-anup.patel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 20 Jul 2020 18:15:32 -0700
Message-ID: <CAOnJCULcffij3-d-TsQixj5TZdatBdUcC-y73L=W-+5h41ytKQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] dt-bindings: timer: Add CLINT bindings
To: Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_211545_209472_D158D45E 
X-CRM114-Status: GOOD (  19.62  )
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
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 17, 2020 at 12:52 AM Anup Patel <anup.patel@wdc.com> wrote:
>
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
> +
> +    description:
> +      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
> +      Supported compatible strings are -
> +      "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
> +      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
> +      CLINT v0 IP block with no chip integration tweaks.
> +      Please refer to sifive-blocks-ip-versioning.txt for details
> +

As the DT binding suggests that the clint device should be named as "sifive,**",
I think we should change the DT property in kendryte dts as well.

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
> +
> +examples:
> +  - |
> +    clint@2000000 {
> +      compatible = "sifive,clint0", "sifive,fu540-c000-clint";
> +      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
> +                             &cpu2intc 3 &cpu2intc 7
> +                             &cpu3intc 3 &cpu3intc 7
> +                             &cpu4intc 3 &cpu4intc 7>;
> +       reg = <0x2000000 0x4000000>;
> +    };
> +...
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Otherwise,

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
