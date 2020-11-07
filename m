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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E8AC388F7
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 14:07:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64807206ED
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 14:07:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I6GiwVqR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvbE4rS6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64807206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K93Hd47CAWHyTCnn2fOypiHscK4A9h3ev6XrZvSzASA=; b=I6GiwVqReiDFLXgfjdofTBsdrJ
	/FN1kKdnyEQvmmytpwULDeAzTs1X7y7CkenxbdwONG20Rwy34HgefnPvb3suX9zsYtLcYMSe2e+KG
	vw5STEW1Xx2qT44Ix/HJP1JlL/8Z6LN1UqLrwpqa5L74j3Lb46XDYhz5K1q3U+73R5o5zDskyHCQG
	fq3CG2a17NyXmuWWO1q8bPHk7K+BiROej5EFSkrz1HM+VSmjnZ/hUtSyz+GWjH7zeBwvi+mZsK4jh
	nTSkMFC/3duOK05JKmOOAhWfqAEyxHkdknE9we86wBq6zwft79UzKlUKZ2EVmXzq7ULZmBcHZxjH/
	Kzr//V7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbOs3-00078l-4j; Sat, 07 Nov 2020 14:07:11 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbOs0-00077S-K9
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 14:07:09 +0000
Received: by mail-qv1-xf41.google.com with SMTP id r12so1836749qvq.13
 for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2020 06:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zKB3lPGWxBL2tP2yoSCPfZH1/fL4oEaD+x4JT1cAitc=;
 b=GvbE4rS6hdLnccBvenC6mkNNZyeG9nPJPltPAGuQiVCBNDeAoTxt6nnVHK/NRq6+f2
 2Zi422zgUgcHnk8gchYtUyY4qdfyKB76d0jbmCMTiAIksEreGl4iJbne2D+NQk5RNW0r
 7MZxLiHYSyYowe/QEApVF6qxwm43arfPX/Ici/jEWfrRjIrADSgqyRgq77WUojUdSziT
 FzFyYII5XBKrpSi9TlulQPPJJp97mxSGhIuH3nWrwvKvvzQzAETyTy0Sll3T/1kFB0eo
 dTrCSJEiJchZsmPkCOcNNAeFegu51eSuYxOc+plhvysGgfLsG4jumomc818tszgAi6/z
 a3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zKB3lPGWxBL2tP2yoSCPfZH1/fL4oEaD+x4JT1cAitc=;
 b=m5kJP5vZXqsJ9dqGjJ/L6kAB8IholFZ56i9TfPJoi2DjtzH7+NUtRCdq0NIRRkfTmc
 lVeZOM36tBeimeIYMlny17W02qGRViAxYdX135Xjp9Kfs1jKqVnSc2EmPKbbG2/zXTVA
 NcbK6uw92WGHy6QpeWIoAZC3tzY4KwCqzKPEKwGEapigtzkyaRfQUJzsQNaNJnz9X7cd
 VWNfT8oIZb2FZm+1Z7/0/GbDOZHSGzlrAAfnLlqENvuFRedGzFzxZi7bQMLT35L0RBK9
 IEYjpRjStCj5LdIZoKOoN8RQTCHcrb/e9k6EhaZtM55oNTd38kd5KSaGLiyH6lDfN8WN
 eh7Q==
X-Gm-Message-State: AOAM532tRHO4p83ND0T8fb9c9+zn8oy9CZFKIMOt5bQ7cI1Kmw5z6+of
 dkipEhO1zDZNLZXfySw0cVg=
X-Google-Smtp-Source: ABdhPJx4ic66oyZsOa3eGQaRgTAbe1052WlMHm2rDsfiwbC/4I2NWKXpxlJXNQQtpT9yE9uEzU4Xpw==
X-Received: by 2002:a05:6214:174f:: with SMTP id
 dc15mr6062408qvb.26.1604758027246; 
 Sat, 07 Nov 2020 06:07:07 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id 8sm2669070qkb.98.2020.11.07.06.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 06:07:06 -0800 (PST)
Subject: Re: [PATCH 25/32] dt-bindings: Document kendryte,k210-rst bindings
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-26-damien.lemoal@wdc.com>
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
Message-ID: <b37c9b72-dc96-6ae9-a94e-457a96a1809c@gmail.com>
Date: Sat, 7 Nov 2020 09:07:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-26-damien.lemoal@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_090708_699853_FB105A9F 
X-CRM114-Status: GOOD (  19.16  )
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
> Document the device tree bindings for the Kendryte K210 SoC reset
> controller driver in
> Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/reset/kendryte,k210-rst.yaml     | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml b/Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml
> new file mode 100644
> index 000000000000..bdd0bf37bdfb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/kendryte,k210-rst.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kendryte K210 Reset Controller Device Tree Bindings
> +
> +maintainers:
> +  - Damien Le Moal <damien.lemoal@wdc.com>
> +
> +description: |
> +  Kendryte K210 reset controller driver which support the system controller
> +  subsystem supplied reset registers for the various peripherals within
> +  the SoC.
> +
> +  See also:
> +  - dt-bindings/reset/k210-rst.h
> +
> +properties:
> +  compatible:
> +    allOf:
> +      - items:
> +        - const: kendryte,k210-rst
> +        - const: syscon-reset
> +
> +  regmap:
> +    maxItems: 1
> +    description: phandle of the system controller (sysctl) node
> +
> +  offset:
> +    maxItems: 1
> +    description: peripheral reset register offset in the system controller
> +      controller register map
> +
> +  mask:
> +    maxItems: 1
> +    description: bit-mask indicating valid reset bits in the reset register
> +
> +  assert-high:
> +    maxItems: 1
> +    description: bit value to write when asserting a reset
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - '#reset-cells'
> +  - compatible
> +  - regmap
> +  - offset
> +  - mask
> +  - assert-high
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/mfd/k210-sysctl.h>
> +    #include <dt-bindings/reset/k210-rst.h>
> +
> +    sysctl: system-controller@50440000 {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      compatible = "kendryte,k210-sysctl",
> +                   "syscon", "simple-mfd";
> +      reg = <0x50440000 0x1000>;
> +      /* ... */
> +      sysrst: reset-controller {
> +        compatible = "kendryte,k210-rst",
> +                      "syscon-reset";
> +        #reset-cells = <1>;
> +        regmap = <&sysctl>;
> +        offset = <K210_SYSCTL_PERI_RESET>;
> +        mask = <0x27FFFFFF>;
> +        assert-high = <1>;
> +      };
> +    };
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
