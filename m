Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44034D20686
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 23:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NB+uIE5GYpQdwCQBt+bG4M7zKDo5IQ2hha57hsEepTE=; b=20IlGZmD9IlyWm
	aR+1e3U+tYAeK1jWWDK8BZI4XA+/hYmTWQsYSfN7vwtrmo8Ajrs8w+Ke3UFzyhyPaiFAuKWLFUSLZ
	f9wYMTinhmNAqyZgm4r4b7cFlmM6F7WG52C9QRwv/a60rNdBEmTvC6K0keXDPezB+Z0Nh37ZyJuWY
	x8iZvC8AExT1fclhZVWidNtGN+dbFFzyIh2tIZ7NLfMQxBJpWkkZ1zU6oN8XS5gQCmv/yXcSgf2vV
	40dXLulMEfqEvttlfwnQ1jcMNZZ1at0OfO3K9hn+lkP/E54vdgSwqvY8dWfKwa9YwzNKxXUQ6zw/F
	j7Jrz7sOrujwG2MC27xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0qkN-00000009tHm-3Ol9;
	Tue, 15 Oct 2024 23:14:35 +0000
Received: from mail-oa1-x44.google.com ([2001:4860:4864:20::44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0qkK-00000009tHN-1Cb5
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 23:14:34 +0000
Received: by mail-oa1-x44.google.com with SMTP id 586e51a60fabf-2884910c846so2843184fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 16:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729034071; x=1729638871; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a40c0dRP4QAt5OMalDM+OzWwPLNS5aBFNSHZTU61OvQ=;
        b=mDcvFfzz84KgbVKODM36Dn7r2opcE9U8G+hy4wJW0Zm1VP08X67LWFe8m0EdQcQdzU
         8Irpbb1Bxssdh27MjRZZqx3XR1+CfQ01d3DZZ/a4pe34tCTq+ZVWV/EEFrBCavTSQaB9
         wmDoIt0pmVqsps5RDMnkl+SzbRtXyxhDEtPsfZupbBu4pnx74O2cY7ubCVV/8kAoKIW3
         LcCvL3k0cR11dH5GQRsgWDvrurHuD57KwUA4kjGGZNy9pO06saDoTqsXyUKiVrj8D8mt
         7W6koCw+PBuhShQAa5ftOhMyQhwf/YmN27MyqfwbS7T6eySgWc/fIgXi8jOeehZSJ8wO
         K15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729034071; x=1729638871;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a40c0dRP4QAt5OMalDM+OzWwPLNS5aBFNSHZTU61OvQ=;
        b=OqsWYF4PxlBMXTGK4qa82hsDaVaML7PMShkZjq8luyUiNftNZ9IW3nxkYd27xkWO4K
         Q+iRt6FfQZBrvYjkmPHn+4uz+4a3pGTOl8OzYg+l+YGY44q+pmVYq+9M3q3JFd/hA7+Y
         +t/zRS6I2l4ufVN18gIbwp3NReKCgCg+NfBN/58oa4gHoNs/pbW+zrKMEPDDDNZVKcKS
         O4GRzAW+Fj66jcUVH4oztpwUshPEWYLk1i27HmgaFxZaVWO8O9U+8OO1U8AHT9seX+Ww
         EtvjF+9ERdUmzZhI0kspsQ62DC1sS9Qx+SkTjJJbgA1+sksM/JHxLH2kTBIZorjmFBmu
         Oi0A==
X-Gm-Message-State: AOJu0YymbIUbwi07g7iIxHBbQ2MJCgIgThEFefLz/puT417PpJhMZlji
	znP4TrdwOOgOFzjy2RaWf2RRiozxXu1ns8NZO/p+k4paMpZsXghVN2zhWHiTX+0=
X-Google-Smtp-Source: AGHT+IHNlTuRpKyeCtWEZlsUbxvzEehXIl6EErApjPAepLYlHOvauOTDI561VloKg9k2Xc4tF9TEow==
X-Received: by 2002:a05:6870:b253:b0:277:e5a5:3362 with SMTP id 586e51a60fabf-2886df68271mr12434294fac.30.1729034070828;
        Tue, 15 Oct 2024 16:14:30 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71801832e71sm313670a34.37.2024.10.15.16.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 16:14:30 -0700 (PDT)
Message-ID: <f1c1af8c-18e0-433d-a61c-90080919378f@sifive.com>
Date: Tue, 15 Oct 2024 18:14:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: mailbox: Add thead,th1520-mailbox
 bindings
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, drew@pdp7.com,
 guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 m.szyprowski@samsung.com
References: <20241014123314.1231517-1-m.wilczynski@samsung.com>
 <CGME20241014123411eucas1p1f93d64ac9db9a6f77982500d4a0157f7@eucas1p1.samsung.com>
 <20241014123314.1231517-3-m.wilczynski@samsung.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20241014123314.1231517-3-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_161432_397114_937603E3 
X-CRM114-Status: GOOD (  22.17  )
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

Hi Michal,

On 2024-10-14 7:33 AM, Michal Wilczynski wrote:
> Add bindings for the mailbox controller. This work is based on the vendor
> kernel. [1]
> 
> Link: https://github.com/revyos/thead-kernel.git [1]
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/mailbox/thead,th1520-mbox.yaml   | 80 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
> new file mode 100644
> index 000000000000..12507c426691
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/thead,th1520-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-head TH1520 Mailbox Controller
> +
> +description:
> +  The T-head mailbox controller enables communication and coordination between
> +  cores within the SoC by passing messages (e.g., data, status, and control)
> +  through mailbox channels. It also allows one core to signal another processor
> +  using interrupts via the Interrupt Controller Unit (ICU).
> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +properties:
> +  compatible:
> +    const: thead,th1520-mbox
> +
> +  reg:
> +    items:
> +      - description: Mailbox local base address
> +      - description: Remote ICU 0 base address
> +      - description: Remote ICU 1 base address
> +      - description: Remote ICU 2 base address

From the SoC documentation, it looks like these are four different instances of
the same IP block, each containing 4 unidirectional mailbox channels and an
interrupt output. So these should be four separate nodes, no? The C910 would
receive on channels 1-3 of instance 0, and send on channel 0 of instances 1-3.

> +
> +  reg-names:
> +    items:
> +      - const: local
> +      - const: remote-icu0
> +      - const: remote-icu1
> +      - const: remote-icu2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#mbox-cells':
> +    const: 2
> +    description: |
> +      Specifies the number of cells needed to encode the mailbox specifier.
> +      The mailbox specifier consists of two cells:
> +        - Destination CPU ID.
> +        - Type, which can be one of the following:
> +            - 0:
> +                - TX & RX channels share the same channel.
> +                - Equipped with 7 info registers to facilitate data sharing.
> +                - Supports IRQ for signaling.
> +            - 1:
> +                - TX & RX operate as doorbell channels.
> +                - Does not have dedicated info registers.
> +                - Lacks ACK support.

It appears that these types are not describing hardware, but the protocol used
by the Linux driver to glue two unidirectional hardware channels together to
make a virtual bidirectional channel. This is really the responsibility of the
mailbox client to know what protocol it needs, not the devicetree.

Regards,
Samuel

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - '#mbox-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      mailbox@ffffc38000 {
> +        compatible = "thead,th1520-mbox";
> +        reg = <0xff 0xffc38000 0x0 0x4000>,
> +              <0xff 0xffc44000 0x0 0x1000>,
> +              <0xff 0xffc4c000 0x0 0x1000>,
> +              <0xff 0xffc54000 0x0 0x1000>;
> +        reg-names = "local", "remote-icu0", "remote-icu1", "remote-icu2";
> +        interrupts = <28>;
> +        #mbox-cells = <2>;
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0655c6ba5435..7401c7cb6533 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19951,6 +19951,7 @@ L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  T:	git https://github.com/pdp7/linux.git
>  F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> +F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
>  F:	arch/riscv/boot/dts/thead/
>  F:	drivers/clk/thead/clk-th1520-ap.c
>  F:	drivers/mailbox/mailbox-th1520.c


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
