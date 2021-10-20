Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46439C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 11:27:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB3AD611EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 11:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB3AD611EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uq1h7vZJ16DErtBfFSMMAaOa+xyHRglxFrVP+V8dZjA=; b=O828EYdr9EFbtN
	cv+cyv/94ib32+DKQH9LunHO0ul3nLA0frLVwVq6+73AJoUJPJygo2t+gyKFCTBPgcXDkvREeRYWi
	MXv6T2lJsODsg2abfr1EYHjwLQu9ZUxtKEjXx5XwkPG/DJMTm8u8A+uYxkwi3fis7DlmIqfUKJ3A8
	AZPU5TLcnnDRsO45Kx8enwQ4T+ZHgISoItcbp4pETdD4BlPdVflNN0vBbHleJuAV6QAySUMxdESrw
	nw0DE5JY2lZJo/uvEdX74R6KYQVl9SIsAoGkI1LSsLRLulJDyN22hzw7ch6zDaH3bCVhKW1MlRzzb
	hSUqHtYxbuHMo5KYsMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md9kp-004IGr-0y; Wed, 20 Oct 2021 11:27:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md9kl-004IFq-QZ
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 11:27:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 l38-20020a05600c1d2600b0030d80c3667aso9376115wms.5
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 04:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2AklsK9+LMtL2zZX38Ceie+zGJ7WCnCZ1oClrdPbxi4=;
 b=w9VWvwKddci/py1jnUMvLafuRneR27szt5RGP+LrJZwedjYW86gCYIWjtbZYNu7sdL
 /wA3c5ot88XM2CixfqLreORum0+JpoCwrY38sp8RkFw2WX4hCLV17S22A4QQiMOGoNQw
 8EO7b1+K396TADKKX6glkFwzhhAvBtWGfK4X92VwFNPBrglBd2jnTMMvR491OVqOcYwx
 8+H2h1iaoIqf9uyMvW1GBC/eC27+ictr2CdwRku/QtQcGk+/ZEQb3cAvDwolYAm9Xq6M
 Uqwp0M2xsn+0eAjcauL4MihOAn2TWW/Ww1FF1RfB8r9OBYtehW4i3ZckuQwzNQ5hEuys
 yd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2AklsK9+LMtL2zZX38Ceie+zGJ7WCnCZ1oClrdPbxi4=;
 b=Gs+lX9JBIkyIrX7rwrCfaH8VapxCFPbokVNfGjEIULnhUXgU3AJQ8XbLY1EWOrBgnN
 qO8/EktNTQDHsVpXIEiP5qCKUgh13yRfOT9gIb+ZOcS9HoYDXSQYdlQss5RgQXMXPBld
 cANfQmDoQrqYeAWa4aMZZEqkmPRTZfioirtfs3qfacDzKbVyPWYmPDWYcRZd4cQONMgO
 Bbp6M340RjSI1nHFNTc5R/4KK06tT8sr4H1rjPAizLmPf9cPhQeobVHJ9W2TEdU1qw3g
 ryKYCC0FjbTdWfGEoo49HHzOvOicE2e8JGCw1KBfHl94Zlc6qIBFCYTn9ng73Ph/5MCC
 Yasw==
X-Gm-Message-State: AOAM533GljJqazBpu7yz08S4cKhJT2o/e5Gc5k+jUXvHT2BaykkKoCho
 y0Otu5FyldhjkUlPw7SLB5QPvrtOCtfzuLVULARaBYGWapc=
X-Google-Smtp-Source: ABdhPJwQW/QqmolpZfOc8Kz+YzIDyEkVHrGRhiztf5HZNU7ntT1W7DjFz+IsntW//lduScMXZQ9CpBsTz9U1gh3/SIA=
X-Received: by 2002:a7b:c742:: with SMTP id w2mr13062017wmk.61.1634729244322; 
 Wed, 20 Oct 2021 04:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 20 Oct 2021 16:57:12 +0530
Message-ID: <CAAhSdy22y3gWM0Y9x7m84CdmtHKo7VsDC4+ZDY7+mhkJ9HcYyA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211020_042727_972854_6F4FECCC 
X-CRM114-Status: GOOD (  27.20  )
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

On Wed, Oct 20, 2021 at 3:06 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> The CLINT in the T-HEAD 9xx CPUs is similar to the SiFive CLINT but does
> not support 64bit mmio access to the MTIMER device.
>
> OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
> restriction and the "sifive,cling0" compatible string. An OpenSBI
> patch suggested to use "reg-io-width = <4>;" as the reg-io-width property
> is generally used in the devicetree schema for such a condition.
>
> As the design is not SiFive based it is preferable to apply a compatible
> string identifying T-HEAD instead.
>
> Add a new yaml file describing the T-HEAD CLINT.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> @Palmer, @Anup
> I copied you as maintainers from sifive,clint.yaml. Please, indicate if
> this should be changed.
>
> For the prior discussion see:
> https://lore.kernel.org/all/20211015100941.17621-1-heinrich.schuchardt@canonical.com/
> https://lore.kernel.org/all/20211015120735.27972-1-heinrich.schuchardt@canonical.com/
>
> A release candidate of the ACLINT specification is available at
> https://github.com/riscv/riscv-aclint/releases

T-HEAD supporting only 32bit accesses to MTIME and MTIMECMP
registers are totally allowed. The RISC-V privileged specification does
not enforce RV64 platforms to support 64bit accesses to MTIME and
MTIMECMP registers. Also, the ACLINT specification only states
that MTIME and MTIMECMP registers are 64-bit wide but it does
not enforce platforms to support 64-bit accesses.

Here are some discussions from tech-aia mailing list:
https://lists.riscv.org/g/tech-aia/message/115
https://lists.riscv.org/g/tech-aia/message/119
https://lists.riscv.org/g/tech-aia/message/120

In other words, the T-HEAD CLINT (MTIMER+MSWI) is compliant
with the RISC-V ACLINT specification.

I think we should add implementation specific compatible strings
for Allwinner D1 in the ACLINT MTIMER and ACLINT MSWI
DT bindings.

How about including the following two compatible strings in
ACLINT DT bindings ?
allwinner,sun20i-d1-aclint-mtimer
allwinner,sun20i-d1-aclint-mswi

Regards,
Anup

> ---
>  .../bindings/timer/thead,clint.yaml           | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/thead,clint.yaml
>
> diff --git a/Documentation/devicetree/bindings/timer/thead,clint.yaml b/Documentation/devicetree/bindings/timer/thead,clint.yaml
> new file mode 100644
> index 000000000000..02463fb2043a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/thead,clint.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/thead,clint.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive Core Local Interruptor
> +
> +maintainers:
> +  - Palmer Dabbelt <palmer@dabbelt.com>
> +  - Anup Patel <anup.patel@wdc.com>
> +
> +description:
> +  T-HEAD (and other RISC-V) SOCs include an implementation of the T-HEAD
> +  Core Local Interruptor (CLINT) for M-mode timer and M-mode inter-processor
> +  interrupts. It directly connects to the timer and inter-processor interrupt
> +  lines of various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local
> +  interrupt controller is the parent interrupt controller for CLINT device.
> +  The clock frequency of the CLINT is specified via "timebase-frequency" DT
> +  property of "/cpus" DT node. The "timebase-frequency" DT property is
> +  described in Documentation/devicetree/bindings/riscv/cpus.yaml
> +
> +properties:
> +  compatible:
> +    items:
> +      - const:
> +          - allwinner,sun20i-d1-clint
> +      - const:
> +          - thead,clint0
> +
> +    description:
> +      Should be "<vendor>,<chip>-clint" and "thead,clint<version>" for
> +      the T-HEAD derived CLINTs.
> +      Supported compatible strings are -
> +      "allwinner,sun20i-d1-clint" for the CLINT in the Allwinner D1 SoC
> +      and "thead,clint0" for the T-HEAD IP block with no chip
> +      integration tweaks.
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
> +      compatible = "allwinner,sun20i-d1-clint", "thead,clint0";
> +      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
> +                             &cpu2intc 3 &cpu2intc 7
> +                             &cpu3intc 3 &cpu3intc 7
> +                             &cpu4intc 3 &cpu4intc 7>;
> +       reg = <0x2000000 0x10000>;
> +    };
> +...
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
