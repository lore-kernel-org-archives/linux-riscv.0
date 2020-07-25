Return-Path: <SRS0=Z8g5=BE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786D1C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:05:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44BBD2065F
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:05:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0jASdiOK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="WEHHTg4b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44BBD2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4gg9QYbpBfqMZkzv19IG86IJUMm/mQy8fs4VE41zGzw=; b=0jASdiOK+kCxY18/uzfkI+SYG
	OYTnIpMSIiNxT6U7WkfWF2Gf6BJwBBIso5CY3H6lX4AdpqNN/MToBd/OHp1dGpV5ER5J74p45bw1+
	ZGS3tyP2BWsb/t4P9PImg6sXUQtQ27IK+k1kYJ3hmVYVV1uL8vnzJgOPTt6BAGBhptki00qPNWBNH
	Us3+sB70U8vd8kzft4mN8dVxPsJAMKST9nabxoOKaPx8sKRe0fOxFIfIITSRm/ltXyFtufrc76huN
	61DZCzNp95iguZuDMOrSD+xGl8l3aYYrUreoMKhgj1/FgMTH9WOlHxYRnqQbsFNAYyqqPDcDeAZ3G
	bui6hZETw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzCMa-0004sv-Kr; Sat, 25 Jul 2020 05:04:48 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzCMX-0004sN-Qb
 for linux-riscv@lists.infradead.org; Sat, 25 Jul 2020 05:04:46 +0000
Received: by mail-wm1-x343.google.com with SMTP id t142so3524709wmt.4
 for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2020 22:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d0dV2iws6uddsenYWAYMkWA+zVZMQ5+yYDWKXhWbbSQ=;
 b=WEHHTg4beksBQ7vroTRmltI3g6curLkD166WwiL4Dxtfln8Ff3lGwkRIlGZuHvbSKu
 O5MNgM0tt+tB3+BsHpVnC9DCPAyDf1Vcqo7jzAtq64Nicz5DoPTqvSGbJ35TIantjMCM
 VuVttfjZ2WA6fzPWni1AP8D9p6+iKM8fhPtiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d0dV2iws6uddsenYWAYMkWA+zVZMQ5+yYDWKXhWbbSQ=;
 b=HzXnMKbNO1I1zAktjmW2YLI8nUFMmvdyJIt16B1dIPH6o8ZVziKFEge7d8Hgk2VI+0
 jQ4rT8uRR7qgsJu636WP9WsQPKIl1eFjMCTpA3L9RmQaVZ1T6Z3NO4Ybb2nYyNuNtKa/
 VJ7VCvSjzew3OxQJ4eQKHtncwpMzmGAGBx1e5dOnejrJgTuEFBn9idrXyWfFTn4CSynA
 73GrsJPiT4UMb5zdB8Zikun5YbAxbt6DO8DAflrczTiXgYyFlhQp10U2YxCw4HZGnFlF
 xSdmnSz10qLf0WWJbtCn0VYkDnTrasUgiMJKmJQNair4wA9gw+3K+ahmN3E/8n2OPf3t
 Zsbg==
X-Gm-Message-State: AOAM531691ag0s255QWFd4E32VdN6h/243yqasaVmm3JPpMlZ9LEJ3cE
 512dnBRv+wCCED7MR3zcugaRF99umItQjNPxgcoT
X-Google-Smtp-Source: ABdhPJwowXforkH2kxs2VccCNf7vTEQdsTB93/wdFK6X6NUSYQbseWUxeAD3SlVT3geAqA1PlMFz5w+a7ix4YVgalLE=
X-Received: by 2002:a05:600c:2f88:: with SMTP id
 t8mr11403103wmn.186.1595653482851; 
 Fri, 24 Jul 2020 22:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200724071822.126758-1-anup.patel@wdc.com>
 <20200724071822.126758-5-anup.patel@wdc.com>
In-Reply-To: <20200724071822.126758-5-anup.patel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 24 Jul 2020 22:04:31 -0700
Message-ID: <CAOnJCU+Hb5bvp19wOXOWD+3DQi7UG+E+k5TCheaZWHBWL153Gg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] dt-bindings: timer: Add CLINT bindings
To: Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_010445_932656_F3470CBB 
X-CRM114-Status: GOOD (  18.53  )
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

On Fri, Jul 24, 2020 at 12:19 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add DT bindings documentation for CLINT device.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Tested-by: Emil Renner Berhing <kernel@esmil.dk>
> ---
>  .../bindings/timer/sifive,clint.yaml          | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> new file mode 100644
> index 000000000000..2a0e9cd9fbcf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -0,0 +1,60 @@
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
> +      - const: sifive,fu540-c000-clint
> +      - const: sifive,clint0
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
> +      compatible = "sifive,fu540-c000-clint", "sifive,clint0";
> +      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
> +                             &cpu2intc 3 &cpu2intc 7
> +                             &cpu3intc 3 &cpu3intc 7
> +                             &cpu4intc 3 &cpu4intc 7>;
> +       reg = <0x2000000 0x10000>;
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


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
