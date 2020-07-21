Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52C9C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 11:40:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B160E208E4
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 11:40:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aaHxRRmx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="aomBaqjh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B160E208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=071YV3A+GeHZhN/1JCAyoznRc0fFP1iUHTxlJwLtMEo=; b=aaHxRRmxWwvoUKnf+Bi8wf0P7
	1xKvrmoBXVIdbv8JVnyf5oZdtMS+qwUDLvvbIl4D6+Ax68i694oVxi8Ll4MP2y/pDnkhJialhsWJl
	0EUHvLt6Cu1G3SlAP4lOYuxPbc6edDu+pUkmTWvY0c2VOO4GWc6VdYadu2r/5Z+Fp5bRXXE5TCQwl
	Y0jtY1y1F8n76CgeThFAUxuM2KKz/kW+5PxNDr+BzfjcpaAGtHOJdvgAppcDQ+/7KmFVtE0yUCl0y
	UI0Tx/J3JXFUoGmymdP8fsrNrCcrOE1iTGX3zD2X+R8fqGA6jFg6Jrp3FFnyUjCP3y6xqt7u3c/0t
	Rw21xzkZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxqco-0004Uo-9O; Tue, 21 Jul 2020 11:39:58 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxqcl-0004Te-26
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 11:39:56 +0000
Received: by mail-wm1-x342.google.com with SMTP id g75so2476181wme.5
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 04:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0J627pM80T7+XlutPkaKlOVr/z1gAAVKrENSM8VXItA=;
 b=aomBaqjhstgNyLO0iG3oISEZgsZDk7I+CDVjJSDyjcwaHIcVOM0K5+HMK231PboQEK
 A2/ll23OKsSMzr4PBzWM/DbQPDdAXv8woUbnirpcylvahf9sCXpntRikrd5FDy6LQZ2B
 SmTb9NoSOXZFwQaGSGnrM85rIzJ/RYWvzWs9TqfX4QDozPArJJYYN0fR+XV8WYEazdak
 fqfgAyk+tRfLhx++g8eDu4I6cSvQqVY7/E7HpFo2iRa2PN0jocZFSwPjXCv94ELTWkDr
 ll6e0eO5qV6cSOnljZYyuajsWMjDhHTcfa6BE6Fz+nVCFLQK3gnfas6LdEJB9o1fiMwF
 ZjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0J627pM80T7+XlutPkaKlOVr/z1gAAVKrENSM8VXItA=;
 b=CtprZ5SXIqqvb22E0ZWmNHjEUCdnIoTQaQ8VhtsWcPXduf0fRkUWQ2N8sxNtiZBVN6
 UsMXHTFcOv7v7mccRCQzqDsu5DsLIT8PeVDtwqXKr6pMbzmgbSZqBbu39ASNPy5oZp6d
 fIi6LLUjq2ehqR3H/I93V4QLlf3+vjgvvjnbuqRrtFN5gmZ5wE2ZU6/a5i9DJT0EvU5i
 5fnmK01WYxsDmdblImbx1MRw+ahrHTaLbjP+20AmQW9FoCmpn8Z8Way4VwcsmQCsIsru
 AnPM8VyiJVZd0C++rT1rmrPJjGpqge0sZ+IJSo5YhuUYzhwoqWiNnwKugMnR8xcVHK7R
 iqDg==
X-Gm-Message-State: AOAM530MGYos38EzT1GxVtKKATjBrhJEaExwAhXVv/h1o0BchQFsVHBz
 Xi8YR+vdAXNzZerbfcJIJiA9CGELSg0K4o1DQSuYdQ==
X-Google-Smtp-Source: ABdhPJynaPKpbU6Sa4qfZHuvA4C6P4PN6EGPDdcoeLrQHPieARti1aWDcQP+/gphRMVoWP2V8oJ4kkwKrU/hwUWo/t4=
X-Received: by 2002:a1c:2d91:: with SMTP id t139mr3589796wmt.3.1595331593814; 
 Tue, 21 Jul 2020 04:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200717075101.263332-1-anup.patel@wdc.com>
 <20200717075101.263332-5-anup.patel@wdc.com>
 <CAOnJCULcffij3-d-TsQixj5TZdatBdUcC-y73L=W-+5h41ytKQ@mail.gmail.com>
In-Reply-To: <CAOnJCULcffij3-d-TsQixj5TZdatBdUcC-y73L=W-+5h41ytKQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 21 Jul 2020 17:09:41 +0530
Message-ID: <CAAhSdy1cbKA9iwBPYMX5xaYFe_BxnB2Sm_ftHPPDq+96SeKbnA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] dt-bindings: timer: Add CLINT bindings
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_073955_874466_108E463F 
X-CRM114-Status: GOOD (  24.28  )
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
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2020 at 6:45 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Fri, Jul 17, 2020 at 12:52 AM Anup Patel <anup.patel@wdc.com> wrote:
> >
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
> > +
> > +    description:
> > +      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
> > +      Supported compatible strings are -
> > +      "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
> > +      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
> > +      CLINT v0 IP block with no chip integration tweaks.
> > +      Please refer to sifive-blocks-ip-versioning.txt for details
> > +
>
> As the DT binding suggests that the clint device should be named as "sifive,**",
> I think we should change the DT property in kendryte dts as well.

Okay, I will do it as a separate patch.

>
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
> > +
> > +examples:
> > +  - |
> > +    clint@2000000 {
> > +      compatible = "sifive,clint0", "sifive,fu540-c000-clint";
> > +      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
> > +                             &cpu2intc 3 &cpu2intc 7
> > +                             &cpu3intc 3 &cpu3intc 7
> > +                             &cpu4intc 3 &cpu4intc 7>;
> > +       reg = <0x2000000 0x4000000>;
> > +    };
> > +...
> > --
> > 2.25.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> Otherwise,
>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
>
> --
> Regards,
> Atish

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
