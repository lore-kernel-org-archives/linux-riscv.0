Return-Path: <SRS0=WjcT=PM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327CBC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 05:05:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFF0E60F21
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 05:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFF0E60F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNCNHFPkbrQNWceuAGdzKgxXkK202KvhqvFDKGbbQU8=; b=TWg2zCeSU8l+PW
	8S7kxd7jRXuzTRgwF0RRBQ1g2u+iCfVtt6SLrfY7xDWzB9I7GVohsVLquvb5qTH769C+ZYQVsmGUf
	q/B8OZlidFxDPz8gntC9tALb1ZuJeUJ/1mi0YRHkUPPfuoBC1/M6GZBzwRgVQ4FRF5jzqGy+q/Y4i
	6O18i7DNMEFss3KeCHJHLuRHga2TSAzKya3TV5xBG7wUw5Jnj9wBNflm5Ksa84zNwyYLd8FQUhikp
	9yrxgP2tAVDrUbeBvhhd3H1JsTDEnZVeMCIpDAFgwO51EAX4FL3xKsFtmlVmBfW5nR6DM+i9b11Ib
	LcrKuwY5AHfO7+EX2oLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meVgr-00DhND-PU; Sun, 24 Oct 2021 05:05:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meVgo-00DhMK-0D; Sun, 24 Oct 2021 05:04:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B25760F93;
 Sun, 24 Oct 2021 05:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635051897;
 bh=XPjRlyX01tPN+GDrTIw56jlzqIOPkkWonyHeLOcnpE0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cfLAqPB70XnUy0FGTSdeWBIV9kMPxVkHx/Yfx2sPpurdkhorzqOQojtrEaAsm8PB9
 xvm90JuGxOk8W5KvEQuQ6MJW3ujW2Ytvrov07fESirWI2iClc4Z2ox3UNwJPmz38x2
 uROogCBlpIb3G4PBOguDNgG2TSqd6OBI4/CAXR4KG+tJO+WTt3SP3gr17WL4a6iHcu
 RW2XznDpySWROLXVpUimxXPvqPF/Qj7XuIT8xix4NT+aRwG6+xxnLxk8G7NG+ERE+g
 TLeKzIOPS/F0cWyb/mvlkA+AHSfUAV7ej1bf593imVwyN34tRywOJ3uAxTElC10RtW
 sutrPq2PlDsWg==
Received: by mail-ua1-f41.google.com with SMTP id q13so15625680uaq.2;
 Sat, 23 Oct 2021 22:04:57 -0700 (PDT)
X-Gm-Message-State: AOAM530vpN9yJK7ug40PpNxGXok09Qn7/s1St3xQcn74SASuGeRUF73w
 Fp0i2APiZTq2PMAM1DRvujFbBDSs934CYxjSZsY=
X-Google-Smtp-Source: ABdhPJw1CJYlZm9uEwdRySScVK62eInO9uZQTLTlhSFUVGULNnIKZAhTOYkg9gev9SXm9l8KZSKnKJg8beINwFI0BQ0=
X-Received: by 2002:a05:6102:c4d:: with SMTP id
 y13mr9426070vss.33.1635051896426; 
 Sat, 23 Oct 2021 22:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
 <YXMriYWcOcgJSpKj@robh.at.kernel.org>
 <6d642c10-27b1-72bd-a38e-f966ae8831f0@canonical.com>
In-Reply-To: <6d642c10-27b1-72bd-a38e-f966ae8831f0@canonical.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 24 Oct 2021 13:04:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSzXwLmFskhGb2dAqAtOA7Ok_O66NCoDSh1h-bWAqdoDA@mail.gmail.com>
Message-ID: <CAJF2gTSzXwLmFskhGb2dAqAtOA7Ok_O66NCoDSh1h-bWAqdoDA@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: T-HEAD CLINT
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Rob Herring <robh@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Guo Ren <guoren@linux.alibaba.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Xiang W <wxjstz@126.com>, 
 Samuel Holland <samuel@sholland.org>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Anup Patel <anup.patel@wdc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 OpenSBI <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_220458_116083_9D3A09F0 
X-CRM114-Status: GOOD (  35.79  )
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

On Sat, Oct 23, 2021 at 8:03 AM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
>
>
> On 10/22/21 23:22, Rob Herring wrote:
> > On Wed, Oct 20, 2021 at 11:36:03AM +0200, Heinrich Schuchardt wrote:
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
> >
> > T-HEAD uses the same versioning as SiFive? If you use version numbers in
> > compatible strings, the numbering needs to be documented and correlate
> > back to the h/w design. See [1]. IP release numbers for FPGA IP for
> > example. What it should not be is the binding author making up 0, 1, 2,
> > etc. versions.
>
> The only publicly available information on the IP block is:
>
> https://github.com/T-head-Semi/openc906/blob/main/doc/%E7%8E%84%E9%93%81C906%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C.pdf
>
> Page 3 has a version number for the whole document. Chapter 9 does not
> have any version number for the CLINT. So should we simply call the
> block "thead,clint" without any version number?
>
> @Guo: do you have more information accessible?
We didn't define the version of "thead,clint", and it belonged to the
CPU implementation version. We usually use "thead,clint0" at first,
and update it to "thead,clintX" when we update it.

>
> Best regards
>
> Heinrich
>
> >
> > Rob
> >
> > [1] Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> >
>
> --
> opensbi mailing list
> opensbi@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
