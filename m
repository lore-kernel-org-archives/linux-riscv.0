Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDD5C388F7
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 14:07:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76764206ED
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 14:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1z9vpYSn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPtMBh5U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76764206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTLS3i9W3sBdZ7wNfMIgFQF6mCXhYGtWxgrMSurmMpo=; b=1z9vpYSnvzBIywb7AsQW5fRZrE
	8PbBqqIvaDvxoevQgGMe+ha1yi5ldXzyUeqYk23sq1nGQELs48TF5eJ7GV4h78ShkTZPjM+Gt11Hk
	b18vcjdA30hGsJU6JBforo6Lx9CYN2y4ebqScV1v19MZ+/sOSolWtWGtsvOC4YCGJOZm/YMso4ds+
	+8QciapB4jO+QlR2imso11VLiYWVjucLv6CuIs4AMcvLWIgYxyCBm1sGW6tobu0BbcdEFuLywPCMO
	JcdCq1cSW63yhTUgBoFvy3FJWDQ+Z4xpV0cKbkrxhZTSNi6ytdIW6aXsHD2kEzUEumeTstR3IlG4a
	Yce5VfLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbOrr-00075l-Bi; Sat, 07 Nov 2020 14:06:59 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbOrp-00074W-If
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 14:06:58 +0000
Received: by mail-qv1-xf41.google.com with SMTP id r12so1836556qvq.13
 for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2020 06:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y91JaQF/1kETwdGUyyWD+92BX5/w6nl9g0qOOaKrv4o=;
 b=DPtMBh5USsAkdJ4UT0WA8B7dgWYV3Eb0+NQ83SkAv18daezc9BGw1kjFy0gYppbjOw
 mkFAEDjgsE3Zn+dc/YRxdDlSR8WbbbnUxFYV0uEN7Euvat23gLBBV3K/EZzjARXqCMeW
 9M4NUPDSK/U++GdfprZVEsON23XD05DQzqCLNIZmwKJLXYZwCgKAnf3UKsvhu5gWHFt5
 wXAJsnRvHnyosA7urqf77G7wPHJxh3RsizFNUJIimUpb0Xfs2WXvburmVLF7mKCd/pWB
 ycRSMX/mcDVzE9236k00UQ5Yzy+y5aJIUFptBidCndPLWnJRF3rXer+mwWqxUB0B7Sdq
 Ol0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y91JaQF/1kETwdGUyyWD+92BX5/w6nl9g0qOOaKrv4o=;
 b=HAuNxPbje4CgjKMR1SUEoUylxob+RAOaFoBOb+uKY3Mu7fbV+iUzcKwgkhrCOrzM03
 MBGWzJaPCSt9ZbDYIvH8Y4RCrR4q8gvV/c5Ujwfo+aXT6GjajOKcqhy3P50z1zcIepKv
 rC5NRmLQllW0dIJ+XTAHDPKqoxq3uGxnUh1XTOJA0bA0XtcrvaGCUKywxGnNA5fYhkrv
 RPyWd8zhG6JXVAEx7AL1i+ZzDJvSQwNQ9D5raUkqJGo1Zyc9swvC4kpAQaO9YJQ6ipaH
 0wCkTBJZO1YK0RmEcgPAZeELyYmOIVY0L1aa2le/vETjIOe32ojDjlDwnk5smvDytAsu
 7NuQ==
X-Gm-Message-State: AOAM530V2LxK1taGKlNLBbK2BKwOFCECV9xa2gN35DxLaCC9oKSYVajp
 qV4py1EW4HmtaOmzJSc5FPQ=
X-Google-Smtp-Source: ABdhPJy/8LlBNEyFw668t0iz4qhwviq1iivffqIkYwBoBD1i0JdYLjzPcsMhxiBb07qf/7gcsvmVZw==
X-Received: by 2002:a0c:d6cb:: with SMTP id l11mr6191774qvi.9.1604758012724;
 Sat, 07 Nov 2020 06:06:52 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id t184sm2559968qka.19.2020.11.07.06.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 06:06:52 -0800 (PST)
Subject: Re: [PATCH 24/32] dt-bindings: Document kendryte,k210-fpioa bindings
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-25-damien.lemoal@wdc.com>
From: Sean Anderson <seanga2@gmail.com>
Autocrypt: addr=seanga2@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBFe74PkBCACoLC5Zq2gwrDcCkr+EPGsT14bsxrW07GiYzQhLCgwnPdEpgU95pXltbFhw
 46GfyffABWxHKO2x+3L1S6ZxC5AiKbYXo7lpnTBYjamPWYouz+VJEVjUx9aaSEByBah5kX6a
 lKFZWNbXLAJh+dE1HFaMi3TQXXaInaREc+aO1F7fCa2zNE75ja+6ah8L4TPRFZ2HKQzve0/Y
 GXtoRw97qmnm3U36vKWT/m2AiLF619F4T1mHvlfjyd9hrVwjH5h/2rFyroXVXBZHGA9Aj8eN
 F2si35dWSZlIwXkNu9bXp0/pIu6FD0bI+BEkD5S7aH1G1iAcMFi5Qq2RNa041DfQSDDHABEB
 AAG0K1NlYW4gR2FsbGFnaGVyIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT6JAVcEEwEK
 AEECGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQYR1bzo1I0gPoYCg+6I/stKEQ
 bgUCXT+S2AUJB2TlXwAKCRA+6I/stKEQbhNOB/9ooea0hU9Sgh7PBloU6CgaC5mlqPLB7NTp
 +JkB+nh3Fqhk+qLZwzEynnuDLl6ESpVHIc0Ym1lyF4gT3DsrlGT1h0Gzw7vUwd1+ZfN0CuIx
 Rn861U/dAUjvbtN5kMBqOI4/5ea+0r7MACcIVnKF/wMXBD8eypHsorT2sJTzwZ6DRCNP70C5
 N1ahpqqNmXe0uLdP0pu55JCqhrGw2SinkRMdWyhSxT56uNwIVHGhLTqH7Q4t1N6G1EH626qa
 SvIJsWlNpll6Y3AYLDw2/Spw/hqieS2PQ/Ky3rPZnvJt7/aSNYsKoFGX0yjkH67Uq8Lx0k1L
 w8jpXnbEPQN3A2ZJCbeM
Message-ID: <62d01a24-4395-ce58-dea9-2241180c17ce@gmail.com>
Date: Sat, 7 Nov 2020 09:06:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-25-damien.lemoal@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_090657_658182_6FE2344B 
X-CRM114-Status: GOOD (  22.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/7/20 3:14 AM, Damien Le Moal wrote:
> Document the device tree bindings for the Kendryte K210 SoC Fully
> Programmable IO Array (FPIOA) pinctrl driver in
> Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/pinctrl/kendryte,k210-fpioa.yaml | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml b/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> new file mode 100644
> index 000000000000..8730add88ee0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/kendryte,k210-fpioa.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kendryte K210 FPIOA (Fully Programmable IO Array) Device Tree Bindings
> +
> +maintainers:
> +  - Damien Le Moal <damien.lemoal@wdc.com>
> +
> +description:
> +  The Kendryte K210 SoC Fully Programmable IO Array controller allows assiging
> +  any of 256 possible functions to any of 48 IO pins. Pin function configuration
> +  is performed on a per-pin basis.
> +
> +properties:
> +  compatible:
> +    const: kendryte,k210-fpioa
> +
> +  reg:
> +    description: FPIOA controller register space base address and size
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 2
> +    items:
> +      - description: Controller reference clock source
> +      - description: APB interface clock source
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 2
> +    items:
> +      - const: ref
> +      - const: pclk
> +
> +  resets:
> +    maxItems: 1
> +
> +  kendryte,sysctl:
> +    minItems: 1
> +    maxItems: 1
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      phandle to the system controller node
> +
> +  kendryte,power-offset:
> +    minItems: 1
> +    maxItems: 1
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Offset of the power domain control register of the system controller.
> +      The value should be the macro K210_SYSCTL_POWER_SEL defined in
> +      dt-bindings/mfd/k210-sysctl.h.
> +
> +patternProperties:
> +  '^.*$':
> +    if:
> +      type: object
> +    then:
> +      patternProperties:
> +        "^pinmux$":
> +          $ref: /schemas/pinctrl/pincfg-node.yaml
> +          description:
> +            An array of IO pins alternate functions. The values for each
> +            IO pin is a combination of an IO pin number (0 to 47) with the
> +            desired function for the IO pin. Functions are defined as macros in
> +            dt-bindings/pinctrl/k210-pinctrl.h. The K210_FPIOA(IO pin, function)
> +            is provided to facilitate the combination of IO pin numbers and
> +            functions.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - kendryte,sysctl
> +  - kendryte,power-offset
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/k210-pinctrl.h>
> +    #include <dt-bindings/mfd/k210-sysctl.h>
> +    #include <dt-bindings/clock/k210-sysctl.h>
> +    #include <dt-bindings/reset/k210-sysctl.h>
> +
> +    fpioa: pinmux@502B0000 {
> +      compatible = "kendryte,k210-fpioa";
> +      reg = <0x502B0000 0x100>;
> +      clocks = <&sysclk K210_CLK_FPIOA>;
> +      resets = <&sysrst K210_RST_FPIOA>;
> +      kendryte,sysctl = <&sysctl>;
> +      kendryte,power-offset = <K210_SYSCTL_POWER_SEL>;
> +      pinctrl-0 = <&fpioa_jtag>;
> +      pinctrl-names = "default";
> +
> +      fpioa_jtag: jtag {
> +        pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
> +                 <K210_FPIOA(1, K210_PCF_JTAG_TDI)>,
> +                 <K210_FPIOA(2, K210_PCF_JTAG_TMS)>,
> +                 <K210_FPIOA(3, K210_PCF_JTAG_TDO)>;
> +      };
> +    };
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
