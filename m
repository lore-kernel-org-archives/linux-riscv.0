Return-Path: <SRS0=jwAp=BD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A246DC433E5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 02:56:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 549A8206C1
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 02:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ipmUfBd/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="nXoaNHWH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 549A8206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0knK+i+UhjAZBIW3kVVNnql4ke4IwrGZxgDqa6gyU6I=; b=ipmUfBd/Wm3LGNxJFX1rv5Aww
	vOcqaFqAdd300nbqy/VhNNRYl+Ds0/I/C6kW+uE0c6TG1RvQdd7TXNzJ4NaP9JCxK06YErnXZYSqj
	Ls6oxuwbZFwPbX0Ncb2Gj9N0i6ckAfmD70L3GiOxhW/WURM8u21sOLR72z5Ylcf8/Lv8+eJA4SmIn
	R4/vZSM8llNNTYKZL4NGPvOR5BSf3kTzFwvXaH7zfAPmoW3L8R8gOlzxS35P80bMTHN4GUrSmW+wH
	aXu/a6zKWlgnM/BLj5k9FZT3V+fuN0+5t1t4q2TnnQUhhQSBMWrIITLv/93mQ5HRpNzT8h7n7Gy3r
	Jz8TRSqpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jynsg-0005U1-IY; Fri, 24 Jul 2020 02:56:18 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jynsb-0005TU-St
 for linux-riscv@lists.infradead.org; Fri, 24 Jul 2020 02:56:15 +0000
Received: by mail-wm1-x344.google.com with SMTP id 184so6937504wmb.0
 for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2020 19:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CtmtjWywAWpjYkCnJwgMZyShNjYxCaF8KfigHWMZhhU=;
 b=nXoaNHWHDTCezdp5CpduMelSEcFsS/xXZFFJj7yT6pEpVyCUFKyrt3fvZXfzn5uZ0w
 YxhvKfAzaEEun8oxMcPODKbWEFiIWpJv5uUZuAEG3yBf0SXH8Dj4NOJRrwrrNdq3h+UM
 1pU8M69WeKOtqWcfh6H0UlM3+c8AcDiqRPGMcXGiu6JrYVimRr+oO4GfDp8ovLKAtpE1
 eplbQPmszATGctckqs6k2WKrOK8XU9bUbWbKz1LcU5bhzpBNcrQcm2dweXduv2HTtG99
 9+30OR+DxqdvdP5t1In8yZQwgzngwx0aYZPzwb3t3OMSdhZO6ELLnbrOQWmRflw3s1jn
 6Glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CtmtjWywAWpjYkCnJwgMZyShNjYxCaF8KfigHWMZhhU=;
 b=hjA+5P5QGny13LVbrt+SGrFCReQCZrfMiCAGmkssKyY/Efy2mx1tz6e86+odT5z/Tz
 cmEPHBeUflCTgWs9Pu8sR/87Iw7TzJNpkUrYwheq/D6Zj0xcGZ6dC6QgP2uH8vdA/Y/D
 JLMrdBsQ0J4Bg++mx9qdbIh4qns9GniYfOlIIUxVyl8yJiHTdQT1f/OTRya80tJtonds
 TyQRmhlpdRa7H0jmRmycitSyphxX3BNGUiwKkGx7RDGtmTLM7R479rAkYRI2GRaBReLY
 Oev+Y3ip0WY4uBcIW4STxz2KQNGMJVcEj2r8/Cp145t9xkZnv2pVE56OhQ9ozsW18d7F
 D44A==
X-Gm-Message-State: AOAM533LgZ3UlwfECUYOtkQ5R53dZXDZkJ0AlC87oBVAaASdJeMlipkA
 177Ig91cZxtQNvV2ENmjcTIEJhDMGTQgigQnHOgf7w==
X-Google-Smtp-Source: ABdhPJz7gHCgz3xS846jQtIQ7O74yrODpOHmRg9I3TY6YB258gHiQKrSSldHgTJt52Oo44AJgBXEEL5aWfj/KoNhfJg=
X-Received: by 2002:a05:600c:2154:: with SMTP id
 v20mr7119713wml.185.1595559370601; 
 Thu, 23 Jul 2020 19:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200723142409.47057-1-anup.patel@wdc.com>
 <20200723142409.47057-5-anup.patel@wdc.com>
 <20200723170806.GA535824@bogus>
In-Reply-To: <20200723170806.GA535824@bogus>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Jul 2020 08:25:58 +0530
Message-ID: <CAAhSdy0tvy65zYSqeSAq781gRA4P0v5Suad+PidNFgPYLd+U1w@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] dt-bindings: timer: Add CLINT bindings
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_225613_945268_CBF1B435 
X-CRM114-Status: GOOD (  21.23  )
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
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Emil Renner Berhing <kernel@esmil.dk>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 10:38 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Jul 23, 2020 at 07:54:09PM +0530, Anup Patel wrote:
> > We add DT bindings documentation for CLINT device.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > Tested-by: Emil Renner Berhing <kernel@esmil.dk>
> > ---
> >  .../bindings/timer/sifive,clint.yaml          | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > new file mode 100644
> > index 000000000000..8ad115611860
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/timer/sifive,clint.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SiFive Core Local Interruptor
> > +
> > +maintainers:
> > +  - Palmer Dabbelt <palmer@dabbelt.com>
> > +  - Anup Patel <anup.patel@wdc.com>
> > +
> > +description:
> > +  SiFive (and other RISC-V) SOCs include an implementation of the SiFive
> > +  Core Local Interruptor (CLINT) for M-mode timer and M-mode inter-processor
> > +  interrupts. It directly connects to the timer and inter-processor interrupt
> > +  lines of various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local
> > +  interrupt controller is the parent interrupt controller for CLINT device.
> > +  The clock frequency of CLINT is specified via "timebase-frequency" DT
> > +  property of "/cpus" DT node. The "timebase-frequency" DT property is
> > +  described in Documentation/devicetree/bindings/riscv/cpus.yaml
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: sifive,clint0
> > +      - const: sifive,fu540-c000-clint
>
> Wrong order. Most specific goes first.

Okay, will update.

>
> > +
> > +    description:
> > +      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
> > +      Supported compatible strings are -
> > +      "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
> > +      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
> > +      CLINT v0 IP block with no chip integration tweaks.
> > +      Please refer to sifive-blocks-ip-versioning.txt for details
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts-extended:
> > +    minItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts-extended
>
> Add:
>
> additionalProperties: false

Okay, will add.

>
> > +
> > +examples:
> > +  - |
> > +    clint@2000000 {
>
> timer@...

Okay, will rename.

>
> > +      compatible = "sifive,clint0", "sifive,fu540-c000-clint";
> > +      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
> > +                             &cpu2intc 3 &cpu2intc 7
> > +                             &cpu3intc 3 &cpu3intc 7
> > +                             &cpu4intc 3 &cpu4intc 7>;
> > +       reg = <0x2000000 0x4000000>;
>
> 64MB of register space? Doesn't matter much for 64-bit, but would waste
> lots of virtual space (low mem) on 32-bit.

This is a typo. The register space size is 64KB not 64MB. I will update.

>
> > +    };
> > +...
> > --
> > 2.25.1
> >

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
