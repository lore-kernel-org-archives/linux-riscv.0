Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB581C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 05:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wa/dVcXo5xaFu/DrcDY0s+wFP7Htp7ZoZ4xosPdL8Ys=; b=LIjvEpYBt9Zaiw
	6rY/ooJRMBOH0TzYFF/ATp3tFGJecQbb2eiQMyTzBfZwuPn2Tg9mv9F0MpuOUk00FWda2giQRvrC0
	1dB7mQLXL9E5RROuLyHJmLHmy+YMBU/bRMFLOQr86q9dPxyMeCfyqcnubOfBu+3sO1THX9aQ9uJ75
	oSRTkj0yW/nlb0oFKoQz4SRm4k7xY8phBc9/pFIgt1qxDSNOmxCCjStr8vNxq0dCQqoN7Gbri33tA
	Qu+jbOGrbsV3XMBMKOCvbvwd+6XNg5yZfjIY47cfElkmehbrtbC9NsU6eIwMwlhf2XTYgVCgEledt
	BpFyl6uvscXcXxJI7M/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0cZM-0053AF-74; Thu, 01 Dec 2022 05:57:12 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0cZJ-005355-9q
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 05:57:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id m19so939503edj.8
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 21:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HDYDeayhp4F4jLRjy3U5o4B4dnh5i5WiJ3M1AeVO0Es=;
        b=Tsm30sLRx+XONDFQARwXuUPZLtEfeqP8NxElshdDEZhXiD0xnAutmZsWAGl6A1IDKo
         6liGNzk55cc05ZHG2S0v6q7RZlfXS3Zo/r/nOsSmpxIj5enr0gIYcMx9EALve1jwytbu
         xjXGjZFIF8Q5HgGwsh+1izmOkwfOVccj0ZLwJ9CeECteokWqMCJLmdDnBxx0SWP2FrBh
         3+3VVjSQXA3s1fTi6j1bzDRJXe2Xs2Rm2k6EUMZQ1JkDoVvkRMvs3TqNy9+TwydqAV/m
         0GpLpOafoCdyOP6MsswvykBJr1Xivm25ntJdANH+w5TZxfesJEBNOLe1/PM77qHQggca
         fNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDYDeayhp4F4jLRjy3U5o4B4dnh5i5WiJ3M1AeVO0Es=;
        b=mIQDCVgmtucqDpSdr0++PrG0YAOCBwEyfDv2qAGrS+eJWodD6ZzXKoyTbCeVI58Qqy
         rwbUEiL9qC0mezAYSANHNKkmp7SKKVKRfCXjRyI2xpo5RKt2wD8AgqUYJHsJAK3Ek0tF
         J3b0IoW08ShAVTq6IKouta5ZuGYjuhowZmo8VEShKsW1wlip77RKloYtqYCCw77vMiUl
         ttlMfVblY6Dwpxabdpq7yKrBKyVVOHjS5m8lOjDSYSMAsNphu6kSOzzqfs2Egxx1sDcZ
         YIsdcMY7iJBApgq/kCBOSpH1LssWxX/+U/s2G9gDJD5MfjfbFICOO7MXtWQAxbqMxeDp
         IXCw==
X-Gm-Message-State: ANoB5pn569BMic8XxuSuYWzzmT51fazNfsO5sTuXB+rhgYBksmucAXeQ
	0L6rEB5rTs9L4UE1C+YTpVJyvW4smUnF7Jq8obyYBg==
X-Google-Smtp-Source: AA0mqf5yTOFMssM36FFBLw2deA1PNPuz933yy4B9ZSG+g2Nf/G5qN0Wdnw8m33OYFpJQ/FEjf2buhlV2tlQWr7vOWpE=
X-Received: by 2002:a05:6402:d78:b0:46b:a177:9d84 with SMTP id
 ec56-20020a0564020d7800b0046ba1779d84mr7265836edb.134.1669874218518; Wed, 30
 Nov 2022 21:56:58 -0800 (PST)
MIME-Version: 1.0
References: <20221129140313.886192-1-apatel@ventanamicro.com>
 <20221129140313.886192-3-apatel@ventanamicro.com> <174d93be-bedf-bf8c-4a66-284931a997b3@sholland.org>
In-Reply-To: <174d93be-bedf-bf8c-4a66-284931a997b3@sholland.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 1 Dec 2022 11:26:47 +0530
Message-ID: <CAAhSdy1zSdqk5B-DBv5puEutT9+5s86QRw4UpjbgkLsiXGurCQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: timer: Add bindings for the RISC-V
 timer device
To: Samuel Holland <samuel@sholland.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Conor Dooley <conor.dooley@microchip.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_215709_375217_1025F8FA 
X-CRM114-Status: GOOD (  27.71  )
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

On Wed, Nov 30, 2022 at 10:15 AM Samuel Holland <samuel@sholland.org> wrote:
>
> On 11/29/22 08:03, Anup Patel wrote:
> > We add DT bindings for a separate RISC-V timer DT node which can
> > be used to describe implementation specific behaviour (such as
> > timer interrupt not triggered during non-retentive suspend).
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../bindings/timer/riscv,timer.yaml           | 52 +++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/riscv,timer.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/timer/riscv,timer.yaml b/Documentation/devicetree/bindings/timer/riscv,timer.yaml
> > new file mode 100644
> > index 000000000000..cf53dfff90bc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/timer/riscv,timer.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/timer/riscv,timer.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V timer
> > +
> > +maintainers:
> > +  - Anup Patel <anup@brainfault.org>
> > +
> > +description: |+
> > +  RISC-V platforms always have a RISC-V timer device for the supervisor-mode
> > +  based on the time CSR defined by the RISC-V privileged specification. The
> > +  timer interrupts of this device are configured using the RISC-V SBI Time
> > +  extension or the RISC-V Sstc extension.
> > +
> > +  The clock frequency of RISC-V timer device is specified via the
> > +  "timebase-frequency" DT property of "/cpus" DT node which is described
> > +  in Documentation/devicetree/bindings/riscv/cpus.yaml
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - riscv,timer
> > +
> > +  interrupts-extended:
> > +    minItems: 1
> > +    maxItems: 4096   # Should be enough?
> > +
> > +  riscv,timer-cant-wake-cpu:
>
> I don't want to derail getting this merged, but if you do end up sending
> another version, could you please spell out the word "cannot" here and
> in the code? The missing apostrophe makes this jarring (and an entirely
> different word).

Okay, I will update.

>
> > +    type: boolean
> > +    description:
> > +      If present, the timer interrupt can't wake up the CPU from
> > +      suspend/idle state.
>
> And in that case I would also suggest clarifying this as "one or more
> suspend/idle states", since the limitation does not apply to all idle
> states. At least it should never apply to the architectural WFI state;
> for the SBI idle state binding, it only applies to those with the
> "local-timer-stop" property.

Okay, I will update.

>
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - interrupts-extended
> > +
> > +examples:
> > +  - |
> > +    timer {
> > +      compatible = "riscv,timer";
> > +      interrupts-extended = <&cpu1intc 5>,
> > +                            <&cpu2intc 5>,
> > +                            <&cpu3intc 5>,
> > +                            <&cpu4intc 5>;
>
> The CLINT and PLIC bindings also include the M-mode interrupts. Should
> we do the same here?

The RISC-V timer uses SBI time extension or RISC-V Sstc extension hence
it is only for S-mode software. In other words, the RISC-V timer is a S-mode
only timer.

The M-mode software is supposed to have its own platform specific MMIO
based timer.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
