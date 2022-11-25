Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E55C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pklHs/jjubxJ0wN8cqCpgzSieHI6xOS6rw7keQLZhBU=; b=ple+jM77VS960d
	ziShoZqRzxdNhKZICbN/Wmh8bU+fFSIEuHK9kKlDPH/VPf4ZDB1OcCNf2KKjpCgq0g0NhFoCExMDE
	ojs12WOyaNpwwvX8BFIZk7YOhDH3rNBLXArD+1CI+p2P75tgcnPXZx1johw5NAkwwolvOPEwPZXhU
	0UZWtbgV25xF3PWQRqIpAVoPfu41YmW8e94ZhfWxRACeGNjTVB/Sz+KxM5MshDKNw0dlO3gsT3GBN
	4iLF9pmZllqS90i0CjDLgRd1oKlycqQCqnTm+sIn+bU6E4IfqtP63TUgwzcCELpVojOm+15clfzZJ
	nxaPdV7B1LCLmOx8T3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZ4p-00Gn5u-F8; Fri, 25 Nov 2022 13:49:11 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZ4m-00Gn2b-SI
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 13:49:10 +0000
Received: by mail-ej1-x62f.google.com with SMTP id f18so10488765ejz.5
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 05:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=haJ0+Zw47DZVHxADOM5rnvXmfvM6Vo6rvKK2ck9USDw=;
        b=sFFdm5VLwq5bMwcixBi8KzpcffeWlzb8cFahuwLkIMYirXdu9PWyHn5ZG8NZGPiOoA
         eGf+nJ4paoV33Or+npRq89akv5+bRI8dnHCRc0ON/19qKCmjMgECiFzM5oUMkblw64HX
         d8vP5vt+NQLYhYA2WdY3CDR/RgZgkpPUeW6zejf/f5+VJMdJ+tdAv98gk+ebCbffB/8E
         jDDfaa/jqYJP63vpooT6DRkUHYoT2K3lmAddRYm+xAj2z4+lACYH+7iO8+n2KFSV98s8
         jnvTp7h7Y6J1GyAzHuVPUI9LN0DNKiyECaqUeq0Pn5ar/Uxhb9ICrae1zxn4pAPrlnG2
         NQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haJ0+Zw47DZVHxADOM5rnvXmfvM6Vo6rvKK2ck9USDw=;
        b=4TTKMNqSVZHDC1khXff6epukOqhO/Bc944w7122xkaODLkC1RYH4edxTP9FcV0hGSV
         o7csDIqp2+f0kV0GlyijF1BBJL1OHAvaZIf+h/VqSKVPkl2QqkxiEapQvqz88d8tNJQI
         8Ib3LHpoxVg81b2jR23Zor9sJGUTsp4Yhr/bVV/acQYQLhCGuP1zvfKb1AE7JRVFTXEj
         aVe54UW1YmmdEVGIbDy4GqxuU64jMh2whCYG0UhmzhsUBWshHv7G5BzxFAYnbmmRlzEa
         vI0PLQjYR1hn2rAh0xAOr2ZdsB7GPIqVGDGNb69n3kx5pf4MowUSRK5opIfMiolcoFUa
         ykrg==
X-Gm-Message-State: ANoB5pltE6KxHTOChYkxRuOToKU+zCA/IsHYGBhml4aBT+7+T1nAr+tn
	cZp7bS+9/lyZh2YXMXJXTwyoP88SNxjaQvtvWgBeYw==
X-Google-Smtp-Source: AA0mqf4TEIj1Wj5VNktFmonDfC53U8wK+8q62VC+/rbuEe3GSX7/nwkJ7AratjgzcKPA6MzRLmMCtimLoQK6v5EOfvs=
X-Received: by 2002:a17:906:6dd5:b0:78d:a633:b55 with SMTP id
 j21-20020a1709066dd500b0078da6330b55mr33442611ejt.106.1669384141244; Fri, 25
 Nov 2022 05:49:01 -0800 (PST)
MIME-Version: 1.0
References: <20221125112105.427045-1-apatel@ventanamicro.com>
 <20221125112105.427045-3-apatel@ventanamicro.com> <Y4C+kwLdMYkkrm/2@wendy>
In-Reply-To: <Y4C+kwLdMYkkrm/2@wendy>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 25 Nov 2022 19:18:48 +0530
Message-ID: <CAAhSdy2XkW-3NsKiCFhz4MYG3U-=CF1ysN8hxQK0SGaUgAAznA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: timer: Add bindings for the RISC-V
 timer device
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_054908_935190_BC6ABAA2 
X-CRM114-Status: GOOD (  28.29  )
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

On Fri, Nov 25, 2022 at 6:40 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> Hey Anup,
>
> For the future, could you please CC me on all patches in a series that I
> have previously reviewed?

Okay.

>
> On Fri, Nov 25, 2022 at 04:51:04PM +0530, Anup Patel wrote:
> > We add DT bindings for a separate RISC-V timer DT node which can
> > be used to describe implementation specific behaviour (such as
> > timer interrupt not triggered during non-retentive suspend).
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
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
> > +    type: boolean
> > +    description:
> > +      If present, the timer interrupt can't wake up the CPU from
> > +      suspend/idle state.
>
> I'm really not sure about this... I would be inclined to think that if
> someone does not specify then we should assume that they took the
> scroogiest view of the spec and so do not get events during suspend.
>
> I suppose you could then argue that their DT is wrong & it's their fault
> though. Plus the existing platforms behave this way & we avoid having to
> retrofit stuff here.

Yes, the DT property is defined to keep things working for
existing platforms.

IMO, people should always read the DT bindings document at time of
creating DT for their platform. If there are queries then they can always
shoot email to the maintainers on LKML.

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
> > +    };
> > +...
> > --
> > 2.34.1
> >

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
