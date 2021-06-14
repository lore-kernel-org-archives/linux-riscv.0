Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75556C2B9F4
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:35:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C0561153
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40C0561153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FxgxrMBchEblHWXmtT9xvUKSreNJTZvPp79K9+rOPaA=; b=u/4rUx8PSmM0mb
	zLctkZCCCZfXXI/6XbhVK/ubFUfdNrFyUTxYK2yU60ilHaki3uyyDw/BaqBx5OEFWq83CEyzpOBm7
	gS9WzTbg0tRR2r87imx55D7cW6Iy2d2tRFohIhEr7OkrcYL/T8w7GciyIU3oCzcMV1m0Fm58nXDUa
	spaJw7RwjuLCm1k2JOrz1SmBrz9OZ/2LZY/wgoGB2nZn7F2Yr6CyxnBY1MEngGW2vlVkgUSeEQ7At
	EkLDVLrMqx4xDK8PsqCd9HPhHZ0KoOgSFkCGlX0OPj14m6NRimfNQS+TzwNFtfFBMQtE2ZM82Itbr
	cV2V8vD5gvR8lGnbomGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsmkV-00EIYX-V9; Mon, 14 Jun 2021 13:35:32 +0000
Received: from mail-yb1-f181.google.com ([209.85.219.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsmkP-00EIV0-MO
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 13:35:27 +0000
Received: by mail-yb1-f181.google.com with SMTP id p184so15431333yba.11
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jun 2021 06:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xqPPaC0AVXMJ3H5esYJa9y/dYjMnHXQGcgEzhU5z3t8=;
 b=UG/HrtRLM0fhcNimkNz1NG4ePk8jTvq2Wa4dDhbl5S9zOZVd45EM0N31w9tl+P63VU
 7TxbCribIVyMwIYckPAkxbIHcakglCox3IJH7RP13oY1Mkz412y2JVkhnasuUJTONVZA
 ETRYL0DgsH15hn+4KAmPp3ryTBpf3JZWlU8A1ZdbEsaFrLzO0HIV9boKMXRaRgmYF8Gu
 boN6a7XM/sKK5KUFirR47JNC6WKMNFXGY6UK+HB3qnIJPW0x053jP+ut0q9CcKyI1BDz
 bXi3urkhimgV9TQij97TQuv3U04fnzrsXvVRltN2M6l3gw2H5NXepNdP7Yjxisa9zQUn
 kJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xqPPaC0AVXMJ3H5esYJa9y/dYjMnHXQGcgEzhU5z3t8=;
 b=XumZuhXySKwTuewNW1LZXtCk3nkE3dFFKxMhhZqXjCvBE8jSALuaJFGCpUX1gk0MgK
 n6+YdPn4oaO2eQPLBKFjPyTcsJn1/Zj/Xp/Z7iM+ov8WIlIhFXnQ/8ldKlJI61vj3onI
 0u5K7hvA3VJ6p+NkTeF2M+RFOF7D7uCHCWryK7CB2jxBaZZ35LGaswGxsjK9VfO1yps3
 p7H/aQntiFCvMYjJyJJZmtI8JLHqjjwhCjpCwYcjKJX0UZfmVoY/X2eYt7WzTbMMwh6m
 HS8e3ZlbtDmnBLeDvpL9yX8Q22VTc4aiPBtPCZ5u7UeYDEVW61yL+s03UxiVi4uVX4j9
 uo6A==
X-Gm-Message-State: AOAM5305qspGJyNE2r3illA3LmqEQzK4cS35PocBUIyj9xh139RvW/e4
 MC0eq/QTgX3vnDelZaRpemb8/E1lb9umWKIYVsk=
X-Google-Smtp-Source: ABdhPJz3CmO4ZnGWstNHNNqRLhvlWMTKOp0WViJjbD4gJARSVgF3aZiCem4kIuPeaiVTACVQnZRB2c+FEk7jk60E/Ko=
X-Received: by 2002:a25:2e43:: with SMTP id b3mr24811303ybn.152.1623677664281; 
 Mon, 14 Jun 2021 06:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160422.330705-1-anup.patel@wdc.com>
 <20210612160422.330705-10-anup.patel@wdc.com>
In-Reply-To: <20210612160422.330705-10-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Jun 2021 21:34:12 +0800
Message-ID: <CAEUhbmXyBZsLJk=cehz504j1funGwwORKxhbhf-WyVV1Su5ZJw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 09/10] dt-bindings: timer: Add ACLINT MSWI and SSWI
 bindings
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_063525_796903_D322763B 
X-CRM114-Status: GOOD (  20.97  )
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

On Sun, Jun 13, 2021 at 12:08 AM Anup Patel <anup.patel@wdc.com> wrote:
>

The commit title should say "interrupt-controller" instead of "timer"

> We add DT bindings documentation for the ACLINT MSWI and SSWI
> devices found on RISC-V SOCs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  .../riscv,aclint-swi.yaml                     | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> new file mode 100644
> index 000000000000..bed15411c18f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,aclint-swi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V ACLINT Software Interrupt Devices
> +
> +maintainers:
> +  - Anup Patel <anup.patel@wdc.com>
> +
> +description:
> +  RISC-V SOCs include an implementation of the M-level software interrupt
> +  (MSWI) device and the S-level software interrupt (SSWI) device defined
> +  in the RISC-V Advanced Core Local Interruptor (ACLINT) specification.
> +
> +  The ACLINT MSWI (and SSWI) devices are documented in the RISC-V ACLINT

nits: please remove the ( )

> +  specification located at
> +  https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc.
> +
> +  The ACLINT MSWI and SSWI devices directly connect to the M-level and
> +  S-level software interrupt lines of various HARTs (or CPUs) respectively
> +  so the RISC-V per-HART (or per-CPU) local interrupt controller is the
> +  parent interrupt controller for the ACLINT MSWI and SSWI devices.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - riscv,aclint-mswi
> +          - riscv,aclint-sswi
> +
> +    description:
> +      Should be "<vendor>,<chip>-aclint-mswi" and "riscv,aclint-mswi" OR
> +      "<vendor>,<chip>-aclint-sswi" and "riscv,aclint-sswi".
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 0
> +
> +  interrupts-extended:
> +    minItems: 1
> +
> +  interrupt-controller: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +examples:
> +  - |
> +    // Example 1 (RISC-V MSWI device used by Linux RISC-V NoMMU kernel):
> +
> +    interrupt-controller@2000000 {
> +      compatible = "riscv,aclint-mswi";
> +      interrupts-extended = <&cpu1intc 3 &cpu2intc 3 &cpu3intc 3 &cpu4intc 3>;
> +      reg = <0x2000000 0x4000>;
> +      interrupt-controller;
> +      #interrupt-cells = <0>;
> +    };
> +
> +  - |
> +    // Example 2 (RISC-V SSWI device used by Linux RISC-V MMU kernel):
> +
> +    interrupt-controller@2100000 {
> +      compatible = "riscv,aclint-sswi";
> +      interrupts-extended = <&cpu1intc 1 &cpu2intc 1 &cpu3intc 1 &cpu4intc 1>;
> +      reg = <0x2100000 0x4000>;
> +      interrupt-controller;
> +      #interrupt-cells = <0>;
> +    };
> +...

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
