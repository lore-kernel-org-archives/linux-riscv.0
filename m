Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78314C388F7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:46:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F11BD2074F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:46:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iS1jmERJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTRhYkXQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F11BD2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MvJ1nwXqo7k91hJVZgrsOabuu+snnfNsHvUeA9Cunno=; b=iS1jmERJIO3NodDr+5AwNV/tg
	J35yYOhWgp8ZxvKameayDM04dT9s2HMX89u5Fyb6QNIPI3JkFS9fFzpfdK3GyAiiG0EcO2lsLdKlW
	BBi1QOUr0hXwRJp/jX2/B4f4ZYuG5B5jRFPHhBPtCBn61z8jPH1NszLz1JSHH6cxY0MoFf3mwpn+z
	bkbGwGg5OP5QghRUUfiQEF9S1ma/pnsZ5A0iWBEivA1WkZKLwC8yJLT9yKqcGes85rLXREpu4IM2t
	l2BJGtdBGf7Zof9iB4ynt8hOJ427DgJKzBCZiDCsAWR5h5LKQrSHP89nCWPduzmxxhPrLJFc9jyyQ
	pQr4IYa2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc9Mk-00051T-Op; Mon, 09 Nov 2020 15:45:58 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc9Mi-00050o-Ed
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 15:45:57 +0000
Received: by mail-qk1-x743.google.com with SMTP id y197so8293977qkb.7
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 07:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t6Yf+sMEnysuGEtJE0jXIIPWFzhinCXEIJNIE/9Krlo=;
 b=nTRhYkXQPj6oCvt1hed4gVi7ed4AknoSL14YilIkiHoS+Wf9C+yczRy5PyOx+mFioK
 I4rXsr/TbC7Qx75VFlui34JHSK7J1OhBvjQJ1VZ42ha81oUTIjHb+OL1nGQpyATOTLuN
 oe+kHPjU3Mbv8Z6002FDOyypRqcCZVDLSv3nN9ETKSb4k/v1KQbTRwMLmVWj/cuPKoY+
 YJQBGE5sxRm2RKgT/I0deO2IPVnzw1lChvYCN44gfVfEgx/TCn7MY6Ofggpmm+GNszIh
 4FIAE6smy5yCip2R4FqbD6aMiFLFUaCoXVB5MAwU17UzxKYhEMfIVVxIvIANYk/kJRuf
 /Gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=t6Yf+sMEnysuGEtJE0jXIIPWFzhinCXEIJNIE/9Krlo=;
 b=KJlEqd9378hiEXWo/NOAnFe8Nd+oMmRT+Ict6tFvbWkdbW0eEqWhDyLhb1nB5cAlQw
 gV79IfTWG+e2OA19DPktsSLUHNRXybf81r+8T0xD2gzrIags4TllQLiFj+KHJ+o99G5y
 9gZeqdQ29pIKrjL9niD1x5qkMxnVQlVJlqfYvlXZ1+yhuH/VZj6MiR1+EdDkQvMF+ZKC
 pgo/SknuNfCNua8YBr8f8wu6R4/+gL8jwbx8zKpYMhpS/4V5Ck1/9P6mxh6D+PlFXjn6
 gf0lWUPrvvwvgwcklTEpea6wit14g7uZVZMfumsaCzRGQfnVkNkKMhSk3JxRCd4o3nHp
 1t9A==
X-Gm-Message-State: AOAM531R2mCWvmCO7s+A01t5fODy8/xlLYQuZJLVjh+Li+tSrU/g3NoW
 COiOkx8Qtz9hrtEtlx+6C5Q=
X-Google-Smtp-Source: ABdhPJxzTXnRRctFaCp0/SBDiD/D/14kREbi+rLR78C2+JEyF9IlirjH6mVXxOTjvltL7NJOyY92RA==
X-Received: by 2002:a37:d08:: with SMTP id 8mr6717554qkn.306.1604936754965;
 Mon, 09 Nov 2020 07:45:54 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id z1sm5854162qtz.46.2020.11.09.07.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 07:45:54 -0800 (PST)
Subject: Re: [PATCH 24/32] dt-bindings: Document kendryte,k210-fpioa bindings
To: Rob Herring <robh@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-25-damien.lemoal@wdc.com>
 <20201109153625.GB1330401@bogus>
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
Message-ID: <04b266c7-bba9-d847-a526-f64f76c11a50@gmail.com>
Date: Mon, 9 Nov 2020 10:45:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109153625.GB1330401@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_104556_553159_B51982DB 
X-CRM114-Status: GOOD (  24.20  )
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/9/20 10:36 AM, Rob Herring wrote:
> On Sat, Nov 07, 2020 at 05:14:12PM +0900, Damien Le Moal wrote:
>> Document the device tree bindings for the Kendryte K210 SoC Fully
>> Programmable IO Array (FPIOA) pinctrl driver in
>> Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>  .../bindings/pinctrl/kendryte,k210-fpioa.yaml | 106 ++++++++++++++++++
>>  1 file changed, 106 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml b/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
>> new file mode 100644
>> index 000000000000..8730add88ee0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
>> @@ -0,0 +1,106 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/kendryte,k210-fpioa.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Kendryte K210 FPIOA (Fully Programmable IO Array) Device Tree Bindings
>> +
>> +maintainers:
>> +  - Damien Le Moal <damien.lemoal@wdc.com>
>> +
>> +description:
>> +  The Kendryte K210 SoC Fully Programmable IO Array controller allows assiging
>> +  any of 256 possible functions to any of 48 IO pins. Pin function configuration
>> +  is performed on a per-pin basis.
>> +
>> +properties:
>> +  compatible:
>> +    const: kendryte,k210-fpioa
>> +
>> +  reg:
>> +    description: FPIOA controller register space base address and size
>> +
>> +  clocks:
>> +    minItems: 2
>> +    maxItems: 2
> 
> Can drop these. Implied by 'items' length.
> 
>> +    items:
>> +      - description: Controller reference clock source
>> +      - description: APB interface clock source
>> +
>> +  clock-names:
>> +    minItems: 2
>> +    maxItems: 2
>> +    items:
>> +      - const: ref
>> +      - const: pclk
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  kendryte,sysctl:
>> +    minItems: 1
>> +    maxItems: 1
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: |
>> +      phandle to the system controller node
>> +
>> +  kendryte,power-offset:
>> +    minItems: 1
>> +    maxItems: 1
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Offset of the power domain control register of the system controller.
> 
> Sounds like you should be using power-domains binding.

This is for pin power domains. E.g. pins 0-5 can be set to 1V8 or 3V3 logic levels.

--Sean

> 
>> +      The value should be the macro K210_SYSCTL_POWER_SEL defined in
>> +      dt-bindings/mfd/k210-sysctl.h.
>> +
>> +patternProperties:
>> +  '^.*$':
>> +    if:
>> +      type: object
>> +    then:
> 
> This is a hack for existing bindings. Use '-pins$' for the node names.
> 
>> +      patternProperties:
>> +        "^pinmux$":
> 
> Not really a pattern.
> 
>> +          $ref: /schemas/pinctrl/pincfg-node.yaml
> 
> This is at the wrong level. Goes up 1 level.
> 
>> +          description:
>> +            An array of IO pins alternate functions. The values for each
>> +            IO pin is a combination of an IO pin number (0 to 47) with the
>> +            desired function for the IO pin. Functions are defined as macros in
>> +            dt-bindings/pinctrl/k210-pinctrl.h. The K210_FPIOA(IO pin, function)
>> +            is provided to facilitate the combination of IO pin numbers and
>> +            functions.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - resets
>> +  - kendryte,sysctl
>> +  - kendryte,power-offset
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/pinctrl/k210-pinctrl.h>
>> +    #include <dt-bindings/mfd/k210-sysctl.h>
>> +    #include <dt-bindings/clock/k210-sysctl.h>
>> +    #include <dt-bindings/reset/k210-sysctl.h>
>> +
>> +    fpioa: pinmux@502B0000 {
>> +      compatible = "kendryte,k210-fpioa";
>> +      reg = <0x502B0000 0x100>;
>> +      clocks = <&sysclk K210_CLK_FPIOA>;
>> +      resets = <&sysrst K210_RST_FPIOA>;
>> +      kendryte,sysctl = <&sysctl>;
>> +      kendryte,power-offset = <K210_SYSCTL_POWER_SEL>;
>> +      pinctrl-0 = <&fpioa_jtag>;
>> +      pinctrl-names = "default";
>> +
>> +      fpioa_jtag: jtag {
>> +        pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
>> +                 <K210_FPIOA(1, K210_PCF_JTAG_TDI)>,
>> +                 <K210_FPIOA(2, K210_PCF_JTAG_TMS)>,
>> +                 <K210_FPIOA(3, K210_PCF_JTAG_TDO)>;
>> +      };
>> +    };
>> -- 
>> 2.28.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
