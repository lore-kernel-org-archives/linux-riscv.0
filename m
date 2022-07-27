Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB2DC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 13:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbiMm9oMrpvG525RyOWL8D/nEHszMmclSM6eLmo0T60=; b=3W9tVvekBezJgb
	VMn3iyRbsTHcyEkDP17mS05eCPclfxTfgSPC7ev0Ve9sJMlvrhmPeE2rdo7H6Tac8yXamZZUZzCx8
	buIG/XLI+r/yX3bsdWfx6XFqM4WJ0DF/oAifEOzpG+jhFCVW4GMAC34M9NHCJ8m0RRwbMidmOgtC0
	Np9X33WhHh6O8r6eM9tUBpkDDvFMLIHfBI/ZnbEiYAuMVrjNDNgFsRnXWnJdYF4hyGLfSKIrEZr52
	vi+71DIyV39GOW8jzUpWpBp5GAAB5IvULfcQJdP7Bre9S0dKx+R2c0Y2bkLwEETQEBM6pcwyu7zlD
	+kqn7/pF0HlP/gocJOXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGhBz-00E5R0-Lx; Wed, 27 Jul 2022 13:35:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGhBw-00E5NB-DU
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 13:35:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v13so16432623wru.12
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 06:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zJ2FnNxSmRb8UAb7jQjWYnnmc/G8CPHlMLuAUf0V/qc=;
        b=DnfSbIpPDdWocXmDLhFZP7gWezV+jOdviMPh+U4M6rSMhuaus/7BlhrkPdwj9F/jxA
         tE5H+DH16mFRIwWNTBj6ps6cZhh4sPX2O6W1BGtYWIcX3TvqOS2yPOCq2G7iarUqv0Xy
         e48w/+U3ejTJurqNiHTmLtEf7rf8khREuJ/JGQ6uqWwJbyfiJ3adhCUuNtCcTye2MpZO
         2cwWEqBSPFFY4VgNNg/HobJvUpYqJ/wlvovJBt93Hbf7twN5kZ+br+R+UOTAyfpmP3gi
         1GVBfb6ra8mXDiiuzzjuYYxlwSCb7sKBFxX8FyW6OdSFJdDOZc7wGVEXHv0xlgCKWruz
         Oq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zJ2FnNxSmRb8UAb7jQjWYnnmc/G8CPHlMLuAUf0V/qc=;
        b=J6CEaiUcnjZYJXaXE7wcRP5uO5u5+CgXpOIh6DEpdsIzzm/rz/pK4o0CY3oijJ+Vrs
         EMu8qkf25GrnUtrugoX6FNsgPrm6r5euN8NmIUSkMWwfGbp9cj7GrHS+WOu6X2yi6RNl
         /kbpQ9CQEJw+MUxSvDsS/Ot091LoWCbj/crxREJOhc+0ri1tn61qFdVG2f7+XR9fYXi7
         A4E3i3+Ia3c3AFd6AM8cN6+ilnmsEGMpxOQTswMM2tGGslfKo5wVefxJHpyGAXPZQHB8
         VTHFI+efM3onWbUEaX6SpqAmpSfEnq8hOc/7oujUOxmhFz330YMvX8tZSJe4qE6dcAka
         jRhA==
X-Gm-Message-State: AJIora/KEWIe0SNzdnd7QVSKgMbxi+5B64eaQf6NZmscIBxiHOOtHeW3
	hPt0QQw6FVb4TYxyXRK3vdrVNJ9+3SW3MipQ9xhcGg==
X-Google-Smtp-Source: AGRyM1uyWvpBoCBAvdlcKemv1yDPMEKUOaEXPjRCz1bUp2JNGpOumHFvwFUDXv3ojXs9fOEbhyIG5mqjIKcpAsbAlfM=
X-Received: by 2002:a05:600c:4fd5:b0:3a3:4664:6d55 with SMTP id
 o21-20020a05600c4fd500b003a346646d55mr3260914wmq.73.1658928909315; Wed, 27
 Jul 2022 06:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220727114302.302201-1-apatel@ventanamicro.com>
 <20220727114302.302201-2-apatel@ventanamicro.com> <372e37bf-ac90-c371-ad9e-b9c18e1cc059@linaro.org>
 <CAK9=C2WjU+2cD7UZbja3TT++KCdRyWroT=50dw=fzi5mX30rcw@mail.gmail.com> <7a0477a0-9f0f-87d6-4070-30321745f4cc@linaro.org>
In-Reply-To: <7a0477a0-9f0f-87d6-4070-30321745f4cc@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 27 Jul 2022 19:04:57 +0530
Message-ID: <CAAhSdy20p5bkVanKGkGyArn94hWJhwncztnX7U+4WkN9-v7NsA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: Add optional DT property riscv,timer-can-wake-cpu
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_063512_483492_119BC875 
X-CRM114-Status: GOOD (  26.18  )
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

On Wed, Jul 27, 2022 at 6:05 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/07/2022 14:21, Anup Patel wrote:
> > On Wed, Jul 27, 2022 at 5:37 PM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 27/07/2022 13:43, Anup Patel wrote:
> >>> We add an optional DT property riscv,timer-can-wake-cpu which if present
> >>> in CPU DT node then CPU timer is always powered-on and never loses context.
> >>>
> >>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> >>> index d632ac76532e..b60b64b4113a 100644
> >>> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> >>> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> >>> @@ -78,6 +78,12 @@ properties:
> >>>        - rv64imac
> >>>        - rv64imafdc
> >>>
> >>> +  riscv,timer-can-wake-cpu:
> >>> +    type: boolean
> >>> +    description:
> >>> +      If present, the timer interrupt can wake up the CPU from
> >>> +      suspend/idle state.
> >>
> >> Isn't this a property of a timer, not CPU? IOW, your timer node should
> >> have "wakeup-source" property.
> >
> > Historically (since the early days), we never had a timer node in the
> > RISC-V world.
> >
> >>
> >> Now that's actual problem: why the RISC-V timer is bound to "riscv"
> >> compatible, not to dedicated timer node? How is it related to actual CPU
> >> (not SoC)?
> >
> > The RISC-V timer is always present on all RISC-V platforms because
>
> Timer is always present also on ARMv8 (and ARMv7) yet it has its node.
>
> > the "time" CSR is defined by RISC-V privileged specification. The method
> > to program per-CPU timer events in either using SBI call or Sstc CSRs.
>
> Timer is still not part of CPU. Otherwise you are claiming here that CPU
> can wakeup CPU...

The clocksource (i.e. "time" register) is part of the CPU but it is an
alias/copy
of a free running system counter whereas clockevent devices (i.e. "mtimecmp"
or "stimecmp" registers) are tightly coupled-with/part-of-the CPU.

Some of the CPU suspend/idle states may or may not preserve state of
timer registers so we might not get a timer interrupt to wake up the cpu
from idle state.

>
> >
> > Since, there is no dedicated timer node, we use CPU compatible string
> > for probing the per-CPU timer.
>
> Next time you add a properties:
> riscv,saata-can-wake-cpu
> riscv,usb-can-wake-cpu
> riscv,interrupt-controller-can-wake-cpu
>
> and so on and keep explaining that "historically" you did not define
> separate nodes, so thus must be in CPU node.

This is a one-of-case with RISC-V DeviceTree where we are living with
the fact that there is no timer DT node. If we add a timer DT node now
then we have to deal with compatibility for existing platforms.

>
> You need to properly reflect hardware in the DTS instead of such hacks.
>
> Best regards,
> Krzysztof

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
