Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AE5C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 14:08:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A8FB6138D
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 14:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A8FB6138D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6axvUJx8J8BAyX2JiOA5xfktsEU0wVubB7RPkTs3sI0=; b=G+11WGmrriP7dE
	IOip9OfbEkf3PbVQUrAYkYI/hmx8rQJdKoK5zErF8PEdtzlOZa0JVxfrPl7cr86yGoCQGgnSyMLCz
	v7CAwjMBIgyXWLJOSorHlaLJ3jnniirNNzwVj4xyPlRVYasSuc10b1Ls+lOBckFoyKaKEtwV1nLiO
	h746V2hHMHOSWziq8JQhNuHRiaD7Ea2urhFi69SnwFAnTrhGtAFZ9HOaCvLm2fbrEvYn8HukUrtyx
	ywpN6EhZ6lkDj4ah2Y+zrHFMnsTIwlExLos8wM0CVoIVQcOX93+CW24EaL9C3fewWaHwuJK44NMQX
	O9e+woGIUJCl3OtXzJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdCGG-004i8h-Dd; Wed, 20 Oct 2021 14:08:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCGC-004i72-UV
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 14:08:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id g2so19312654wme.4
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 07:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ew06yjwuliIkbH6lYJuA6F3w8EOg5w8OXaKOIf4p+0=;
 b=dYzD0fRH4jtNN6BDEwu4AtXap65tErzCKeK+JahsozMz+Gz7z/0dkg2kSDBnmkzWJo
 +h+pWoUMTgFG1ZGlHkVGiG1pU/ng0FLfAw3yDdlJr/QI9fSdnCTll9rOoypG9xGei06z
 RG5U2yJOlxmLEuxDBJv8rjqhlMXKuFatv4ci8G1QlIc8DbnOZTamYnOM0ct38gCn/gxq
 C1TrIUvlou7GSiBL+7T8lYCjdL1e0NNa1onNUKTKS4Sw/y7Ks+Qcgzx3XEZ4ZVPe3LRA
 bY55JyGrce0tTi6m/940eOEfT2o9WDcSiwq5IgYp6fYQtn8dzQ1kbAZ/TacHR1p5wVZF
 W8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ew06yjwuliIkbH6lYJuA6F3w8EOg5w8OXaKOIf4p+0=;
 b=G0eeo7FJVqVxMci9jZ6GH8tQdKpiQ5ppqqiHqBa8kc2B4OSFNJ8a0nPeGAyWRnV/OR
 7UPsHE78tr9pP06eKNWi1OUJljpdD4Xj4HNFMKsbV8UGg3scotInGqek01ePIbAwX1Tz
 zHvWtPp/QQvtaaT86OCPO6ptQQMBXy5ILj5Zub1bZkhSB+nFDELWaLHYVXiFfOl3bgzL
 cQEbdxcLJzKEntXV1VNFWn7RXBi+0fyx+/nD8RCy5h0nec94f16zA9Fai73KWpXyZu4m
 5TKAMg/PnPT+YjJk1VwIXYHiVhVcW4FmHz8nIt402p59SsHEn6UiXChh35qkrmELXxMe
 6p0w==
X-Gm-Message-State: AOAM533No/nkZW1QCPFTZaMZNpmADJ3ZAi2rLhopxWunxshmOiyF1T+R
 z5pTYPqlTBiLBemf2FSGS0+MJa8Hvhv18yVU2mNflA==
X-Google-Smtp-Source: ABdhPJxIyLijxawg/APdOZtRPzFc4QSUBbZztjX9BXaiP9TruZK6ibE/eptNytqlQah/QvtmhsxR3xQFNnhUW6bzZFM=
X-Received: by 2002:a05:6000:1acc:: with SMTP id
 i12mr51637732wry.249.1634738883425; 
 Wed, 20 Oct 2021 07:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
 <CAAhSdy22y3gWM0Y9x7m84CdmtHKo7VsDC4+ZDY7+mhkJ9HcYyA@mail.gmail.com>
 <ff1fdb31-d739-ee85-9ce0-8386065e297f@canonical.com>
In-Reply-To: <ff1fdb31-d739-ee85-9ce0-8386065e297f@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 20 Oct 2021 19:37:51 +0530
Message-ID: <CAAhSdy1sTuEbjGM+XLF_Vg6=e91E31Yvh7js-h4c+Ru89DQJsw@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: T-HEAD CLINT
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Guo Ren <guoren@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 Xiang W <wxjstz@126.com>, 
 Samuel Holland <samuel@sholland.org>, Atish Patra <atish.patra@wdc.com>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 OpenSBI <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_070805_058798_C232027C 
X-CRM114-Status: GOOD (  40.40  )
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

On Wed, Oct 20, 2021 at 5:12 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 10/20/21 13:27, Anup Patel wrote:
> > On Wed, Oct 20, 2021 at 3:06 PM Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> >>
> >> The CLINT in the T-HEAD 9xx CPUs is similar to the SiFive CLINT but does
> >> not support 64bit mmio access to the MTIMER device.
> >>
> >> OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
> >> restriction and the "sifive,cling0" compatible string. An OpenSBI
> >> patch suggested to use "reg-io-width = <4>;" as the reg-io-width property
> >> is generally used in the devicetree schema for such a condition.
> >>
> >> As the design is not SiFive based it is preferable to apply a compatible
> >> string identifying T-HEAD instead.
> >>
> >> Add a new yaml file describing the T-HEAD CLINT.
> >>
> >> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> >> ---
> >> @Palmer, @Anup
> >> I copied you as maintainers from sifive,clint.yaml. Please, indicate if
> >> this should be changed.
> >>
> >> For the prior discussion see:
> >> https://lore.kernel.org/all/20211015100941.17621-1-heinrich.schuchardt@canonical.com/
> >> https://lore.kernel.org/all/20211015120735.27972-1-heinrich.schuchardt@canonical.com/
> >>
> >> A release candidate of the ACLINT specification is available at
> >> https://github.com/riscv/riscv-aclint/releases
> >
> > T-HEAD supporting only 32bit accesses to MTIME and MTIMECMP
> > registers are totally allowed. The RISC-V privileged specification does
> > not enforce RV64 platforms to support 64bit accesses to MTIME and
> > MTIMECMP registers. Also, the ACLINT specification only states
> > that MTIME and MTIMECMP registers are 64-bit wide but it does
> > not enforce platforms to support 64-bit accesses.
> >
> > Here are some discussions from tech-aia mailing list:
> > https://lists.riscv.org/g/tech-aia/message/115
> > https://lists.riscv.org/g/tech-aia/message/119
> > https://lists.riscv.org/g/tech-aia/message/120
> >
> > In other words, the T-HEAD CLINT (MTIMER+MSWI) is compliant
> > with the RISC-V ACLINT specification.
> >
> > I think we should add implementation specific compatible strings
> > for Allwinner D1 in the ACLINT MTIMER and ACLINT MSWI
> > DT bindings.
> >
> > How about including the following two compatible strings in
> > ACLINT DT bindings ?
> > allwinner,sun20i-d1-aclint-mtimer
> > allwinner,sun20i-d1-aclint-mswi
>
> If the Allwinner CLINT is sufficiently compliant, this makes sense to me.
>
> Will there be a new round of
> [RFC PATCH v4 08/10] dt-bindings: timer: Add ACLINT MTIMER bindings
> https://lore.kernel.org/all/20211007123632.697666-9-anup.patel@wdc.com/
> were you could add the Allwinner device? Or is that series already merged?

The Linux ACLINT series is not merged yet so there will be another patch
revision as we get more review comments. I am hoping for more reviews.

>
> Should the riscv,aclint-mtimer.yaml file mention that there are
> different access sizes and either state per compatibility string what
> that size is or provide a parameter for that purpose?

Should we just say that "some of the MTIMER implementations support
only 32-bit accesses so this information can be derived from implementation
specific compatible strings" ?

Regards,
Anup

>
> Best regards
>
> Heinrich
>
> >
> > Regards,
> > Anup
> >
> >> ---
> >>   .../bindings/timer/thead,clint.yaml           | 62 +++++++++++++++++++
> >>   1 file changed, 62 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/timer/thead,clint.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/timer/thead,clint.yaml b/Documentation/devicetree/bindings/timer/thead,clint.yaml
> >> new file mode 100644
> >> index 000000000000..02463fb2043a
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/timer/thead,clint.yaml
> >> @@ -0,0 +1,62 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/timer/thead,clint.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: SiFive Core Local Interruptor
> >> +
> >> +maintainers:
> >> +  - Palmer Dabbelt <palmer@dabbelt.com>
> >> +  - Anup Patel <anup.patel@wdc.com>
> >> +
> >> +description:
> >> +  T-HEAD (and other RISC-V) SOCs include an implementation of the T-HEAD
> >> +  Core Local Interruptor (CLINT) for M-mode timer and M-mode inter-processor
> >> +  interrupts. It directly connects to the timer and inter-processor interrupt
> >> +  lines of various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local
> >> +  interrupt controller is the parent interrupt controller for CLINT device.
> >> +  The clock frequency of the CLINT is specified via "timebase-frequency" DT
> >> +  property of "/cpus" DT node. The "timebase-frequency" DT property is
> >> +  described in Documentation/devicetree/bindings/riscv/cpus.yaml
> >> +
> >> +properties:
> >> +  compatible:
> >> +    items:
> >> +      - const:
> >> +          - allwinner,sun20i-d1-clint
> >> +      - const:
> >> +          - thead,clint0
> >> +
> >> +    description:
> >> +      Should be "<vendor>,<chip>-clint" and "thead,clint<version>" for
> >> +      the T-HEAD derived CLINTs.
> >> +      Supported compatible strings are -
> >> +      "allwinner,sun20i-d1-clint" for the CLINT in the Allwinner D1 SoC
> >> +      and "thead,clint0" for the T-HEAD IP block with no chip
> >> +      integration tweaks.
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts-extended:
> >> +    minItems: 1
> >> +
> >> +additionalProperties: false
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - interrupts-extended
> >> +
> >> +examples:
> >> +  - |
> >> +    timer@2000000 {
> >> +      compatible = "allwinner,sun20i-d1-clint", "thead,clint0";
> >> +      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
> >> +                             &cpu2intc 3 &cpu2intc 7
> >> +                             &cpu3intc 3 &cpu3intc 7
> >> +                             &cpu4intc 3 &cpu4intc 7>;
> >> +       reg = <0x2000000 0x10000>;
> >> +    };
> >> +...
> >> --
> >> 2.32.0
> >>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
