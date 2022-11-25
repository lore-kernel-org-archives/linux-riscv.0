Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA5FC43217
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 23:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWUZ+LVAzOmBj71RgMJzIbnVj7tlL2rsEo4iWtSpBAI=; b=qulqvROKugwKhg
	AiyaZYh3uNRWGTDa1MTplIbDfnvt9yyTMkHGcCDhnBGOGUyuz1xKuVFKbbsrhd1bO9Qil+wSSNd61
	DbRfXLru/h+qDKKJ2r5IjyG6tOLE3uQdzqMtQMTSo2v4t5A7WNQQkABZJFd8HZMfUIYwV2shjCBHp
	U6WwA+y571/9TZ2tpNm6CLH6LQHJQtmyDc7NV7L8DedhZhCQjR6Am9A9m38Quhmxy3BxoeLhcvS7A
	mpUsVEYdcayMbUJEPOPig6lcR2FpdWvr0wyo2s6dveaYsjqmJ1y21rQNLdKd1nmIj1j06ZUewzqIV
	Q0gea2DCVOqP8w7kYf1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiZn-0030Wq-Jy; Fri, 25 Nov 2022 23:57:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiZj-0030UA-3m
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 23:57:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C84460F21;
	Fri, 25 Nov 2022 23:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4BD1C433D7;
	Fri, 25 Nov 2022 23:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669420661;
	bh=jaLKaGAKU1UL+34Cy5mouKhCDu7jQB71LFKr8lUwsm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gjyk63PFqldQb5NpmQjaLrr5/MhsDXRBGqbl/eZQ6VqzIyeVDH8G9mV4dYkxgrO5j
	 WXjSm/vq0rEgQJWPSu30fHWoRBT44jUW7RMOaNQwnagSDFIOc5H1RnL51hN7nDP+2u
	 W7wCEgdPUYAHu4dxkD2CDZ6z3rrgWQ4sXd4u6gGcvAlwcFm8ZC7aZ4MTlufTmJ2tjf
	 hciw6cpW5Hh/WTNx8xbAKBpFr9vR2BvVIXcX3a7yIDdRmNbsg16o9VuLBZSNDc26tK
	 gWhBvvDWqeSpu3SG7GtleoDvDhGtiWgdegBaoXjHQYIjHciE9nT3dXpJKTx1wChdw7
	 /zUeWxl50kGJw==
Date: Fri, 25 Nov 2022 23:57:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: timer: Add bindings for the RISC-V
 timer device
Message-ID: <Y4FWcOtBHW/n8cjG@spud>
References: <20221125112105.427045-1-apatel@ventanamicro.com>
 <20221125112105.427045-3-apatel@ventanamicro.com>
 <Y4C+kwLdMYkkrm/2@wendy>
 <CAAhSdy2XkW-3NsKiCFhz4MYG3U-=CF1ysN8hxQK0SGaUgAAznA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2XkW-3NsKiCFhz4MYG3U-=CF1ysN8hxQK0SGaUgAAznA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_155743_267506_8053386B 
X-CRM114-Status: GOOD (  33.86  )
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

On Fri, Nov 25, 2022 at 07:18:48PM +0530, Anup Patel wrote:
> On Fri, Nov 25, 2022 at 6:40 PM Conor Dooley <conor.dooley@microchip.com> wrote:
> >
> > Hey Anup,
> >
> > For the future, could you please CC me on all patches in a series that I
> > have previously reviewed?
> 
> Okay.
> 
> >
> > On Fri, Nov 25, 2022 at 04:51:04PM +0530, Anup Patel wrote:
> > > We add DT bindings for a separate RISC-V timer DT node which can
> > > be used to describe implementation specific behaviour (such as
> > > timer interrupt not triggered during non-retentive suspend).
> > >
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > ---
> > >  .../bindings/timer/riscv,timer.yaml           | 52 +++++++++++++++++++
> > >  1 file changed, 52 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/timer/riscv,timer.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/timer/riscv,timer.yaml b/Documentation/devicetree/bindings/timer/riscv,timer.yaml
> > > new file mode 100644
> > > index 000000000000..cf53dfff90bc
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/timer/riscv,timer.yaml
> > > @@ -0,0 +1,52 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/timer/riscv,timer.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: RISC-V timer
> > > +
> > > +maintainers:
> > > +  - Anup Patel <anup@brainfault.org>
> > > +
> > > +description: |+
> > > +  RISC-V platforms always have a RISC-V timer device for the supervisor-mode
> > > +  based on the time CSR defined by the RISC-V privileged specification. The
> > > +  timer interrupts of this device are configured using the RISC-V SBI Time
> > > +  extension or the RISC-V Sstc extension.
> > > +
> > > +  The clock frequency of RISC-V timer device is specified via the
> > > +  "timebase-frequency" DT property of "/cpus" DT node which is described
> > > +  in Documentation/devicetree/bindings/riscv/cpus.yaml
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - riscv,timer
> > > +
> > > +  interrupts-extended:
> > > +    minItems: 1
> > > +    maxItems: 4096   # Should be enough?
> > > +
> > > +  riscv,timer-cant-wake-cpu:
> > > +    type: boolean
> > > +    description:
> > > +      If present, the timer interrupt can't wake up the CPU from
> > > +      suspend/idle state.
> >
> > I'm really not sure about this... I would be inclined to think that if
> > someone does not specify then we should assume that they took the
> > scroogiest view of the spec and so do not get events during suspend.
> >
> > I suppose you could then argue that their DT is wrong & it's their fault
> > though. Plus the existing platforms behave this way & we avoid having to
> > retrofit stuff here.
> 
> Yes, the DT property is defined to keep things working for
> existing platforms.
> 
> IMO, people should always read the DT bindings document at time of
> creating DT for their platform. If there are queries then they can always
> shoot email to the maintainers on LKML.

Aye, I suppose so. For every platform that may exist that this change
hurts, there's likely another one that it fixes a timer for... /shrug

Binding itself looks grand though & we are in lessor of two evils
territory, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for turning around a v3 promptly Anup!
Conor.

> > > +
> > > +additionalProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - interrupts-extended
> > > +
> > > +examples:
> > > +  - |
> > > +    timer {
> > > +      compatible = "riscv,timer";
> > > +      interrupts-extended = <&cpu1intc 5>,
> > > +                            <&cpu2intc 5>,
> > > +                            <&cpu3intc 5>,
> > > +                            <&cpu4intc 5>;
> > > +    };
> > > +...
> > > --
> > > 2.34.1
> > >
> 
> Regards,
> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
