Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E03C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 03:55:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DC0A20792
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 03:55:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FTOglyLq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="srkmkvhD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DC0A20792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q5gyMa6ARx5/IR61mxj5F5Xj1qn6OYHtEciSk2Zrs0Y=; b=FTOglyLqROvc9XxABv6ahMvSa
	g5ghiMGrIAd0C/ffKNb3UUTz5xNLpQ/a0ckMJ2bt1TduiTrqVxSWT/AgJpbJBU1VqoonuFGcHyWvp
	J8Fv+cZk4mQVx3e1rB6whpKR/5KcgHQ+I1XiyaGqAEdgXAeHU6Igm7gYtyfhK0cBMiYcXzJBUx+os
	74mmwZdVT/zJqf3Nt8iGiIqGmy2KTOlyGfkwmNHv2Lece4zzOGqGJK5a5NjkSSJ7diI1mzzXNMw9l
	3G2N6iJZQ7CIaiS5ZWTYW6I4UIKtllyqqiYmGKhxUpGOb8zb5XgKx7mcFSSDDqheRWc3LjpG56Bhq
	ocRUqjivg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy5r8-0007rV-LI; Wed, 22 Jul 2020 03:55:46 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy5r6-0007r3-CQ
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 03:55:45 +0000
Received: by mail-wr1-x444.google.com with SMTP id r12so444242wrj.13
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 20:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AFC4e1lyE7ts6QLvqBb4PFiSTT9NQBcFvnLiz1+hr48=;
 b=srkmkvhDKIkC7xQ+Erl9q+ptkCX3zSzRoCdUCdYWrtYxQgtdnbMIebHVIlnrXMuECG
 SlRnahF0UnWTSTGwaOSTKHTlLgKzRoMS0IW5PLwk/089WiaVhC7HDzMEs3HeK6eRkrE0
 ATmz2QKDy/y/DlIo+2cwk3NtTspyqAwzk7fP+H1sKOpzTaKI5x/kdGVgh0GHGQ9wZTdU
 wAp87P7cDy9vH2Dz8YnBjmaA4+fff3ouquN8cIASp9+HDaaGgv1Xv2Bb5Mm16InXgdJ+
 qMObXjMx+gTN/PngzgaIdoYF6LTreTu6hcGLIuU97b5KBh8+HWF/4R3FztO8TKb+hE0H
 SKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AFC4e1lyE7ts6QLvqBb4PFiSTT9NQBcFvnLiz1+hr48=;
 b=sbFT7pTibuMGQ5ulCv++spgazmOdEn8DBm54Sm6dlHir2uN4nzm9EyHTJKtmZ/tq/m
 OVoMWGLP8LZYp3dCfbHo6tn0IFX6KDZyu8ZQlZAJqka93PJvc5voJwxbbUNgXR/vNZwh
 6KRuIR5tqLqGUU3O6Q7JSgPsb060BHhqKAeTXiPiOh7C01nn2WPo77kKFCVNvEaVqZ/T
 qSuqTkoy74Vc2tsYWyk+qFESsX6Ry23dk5Giyqa5uQlCOCTU3IKGoRlsqm70jZ4V4VOK
 5aIGBpglWXP6YO8uejEsFZh7iro/n0ICwd7z7VFK0GDpqJiKlJ8ZHc46eGX/tAYmH8Uq
 Rulg==
X-Gm-Message-State: AOAM533WOY02C+6O2jTzlLFNGYQM0fCyArIFvC05fa9ciOm8mb2u/N2D
 +R1SfnEIg+YanLOd4XCrJ5DcuHfcXhsT+BTdPYrl6A==
X-Google-Smtp-Source: ABdhPJwviiRhh8Ew5FwFPWSNY3nE65EKkh19UnrCdWqhsEpXCx9HCf/vqo6H6vcfqlvdohr7KotRJueK95xx91UgOUU=
X-Received: by 2002:adf:f247:: with SMTP id b7mr13963465wrp.128.1595390143363; 
 Tue, 21 Jul 2020 20:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200717075101.263332-1-anup.patel@wdc.com>
 <20200717075101.263332-5-anup.patel@wdc.com>
 <CAOnJCULcffij3-d-TsQixj5TZdatBdUcC-y73L=W-+5h41ytKQ@mail.gmail.com>
 <CAAhSdy1cbKA9iwBPYMX5xaYFe_BxnB2Sm_ftHPPDq+96SeKbnA@mail.gmail.com>
 <b2d7b1d6-db33-7b40-9511-95de991e9ad6@gmail.com>
In-Reply-To: <b2d7b1d6-db33-7b40-9511-95de991e9ad6@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 22 Jul 2020 09:25:31 +0530
Message-ID: <CAAhSdy1Dx+oP0guRGvCFa61gL93R+pcQDYLdMpo+LaOjA5tvBQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] dt-bindings: timer: Add CLINT bindings
To: Sean Anderson <seanga2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_235544_475822_B02843C8 
X-CRM114-Status: GOOD (  22.35  )
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
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2020 at 5:48 PM Sean Anderson <seanga2@gmail.com> wrote:
>
> On 7/20/20 9:15 PM, Atish Patra wrote:
> > On Fri, Jul 17, 2020 at 12:52 AM Anup Patel <anup.patel@wdc.com> wrote:
> >>
> >> We add DT bindings documentation for CLINT device.
> >>
> >> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> >> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> >> Tested-by: Emil Renner Berhing <kernel@esmil.dk>
> >> ---
> >>  .../bindings/timer/sifive,clint.yaml          | 58 +++++++++++++++++++
> >>  1 file changed, 58 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> >> new file mode 100644
> >> index 000000000000..8ad115611860
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> >> @@ -0,0 +1,58 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/timer/sifive,clint.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: SiFive Core Local Interruptor
> >> +
> >> +maintainers:
> >> +  - Palmer Dabbelt <palmer@dabbelt.com>
> >> +  - Anup Patel <anup.patel@wdc.com>
> >> +
> >> +description:
> >> +  SiFive (and other RISC-V) SOCs include an implementation of the SiFive
> >> +  Core Local Interruptor (CLINT) for M-mode timer and M-mode inter-processor
> >> +  interrupts. It directly connects to the timer and inter-processor interrupt
> >> +  lines of various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local
> >> +  interrupt controller is the parent interrupt controller for CLINT device.
> >> +  The clock frequency of CLINT is specified via "timebase-frequency" DT
> >> +  property of "/cpus" DT node. The "timebase-frequency" DT property is
> >> +  described in Documentation/devicetree/bindings/riscv/cpus.yaml
> >> +
> >> +properties:
> >> +  compatible:
> >> +    items:
> >> +      - const: sifive,clint0
> >> +      - const: sifive,fu540-c000-clint
> >> +
> >> +    description:
> >> +      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
> >> +      Supported compatible strings are -
> >> +      "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
> >> +      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
> >> +      CLINT v0 IP block with no chip integration tweaks.
> >> +      Please refer to sifive-blocks-ip-versioning.txt for details
> >> +
> >
> > As the DT binding suggests that the clint device should be named as "sifive,**",
> > I think we should change the DT property in kendryte dts as well.
>
> The kendryte device is based on Rocket Chip, not any SiFive IP/device.
> If anything, the general binding should be "chipsalliance,clint" and the
> specific bindings should be "sifive,clint" and "kendryte,clint" (or
> "canaan,clint").

AFAIK, Palmer clearly mentioned in previous discussion that CLINT
spec is still owned by SiFive. No matter who implements CLINT device
in their SOC, we will need one compatible string to represent the
spec version (i.e. "sifive,clint0") and another compatible representing
specific implementation (for kendryte this can be "kendryte,k210-clint").

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
