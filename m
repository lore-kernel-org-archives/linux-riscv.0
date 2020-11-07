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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED0CC388F7
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 14:05:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 170DF206ED
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 14:05:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tMto19B5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUP/px9g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 170DF206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4a6z3jt8LqUrBTfrn0eksQ++/wW7iTtALvB+zgohLM=; b=tMto19B5i6fXCKL+osQ/7wYTON
	NQ5QfL10NBwk5aAK6jC/2erJxFvvIMeumB0ZMwVwjj2tqVm9UhwefBqbAbn0iaFTG4S1Ag7RsRf3U
	VmWFVs7+WsJp5SV82uvvbr3c+iIZHx2DMSGDq18a1BpysutC4Dkb+q9XKaWNebYY0Sw7oGX/9H2ZI
	lA1k/mH2T2vTF+1yQHQfGbG96HJQ0cPPFoO0zIVD3u5jxNOYBDDh4QBPQLZqEU/vgmJEpey6rRlI0
	yHRWxqfvVjaM2mGxJChp/RZtXGB2NB0WOE+nYfAgJ25Y7bTLQfWnHaO6RuzMi6wJ1EMqnJqJmNFpj
	xzZxvFlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbOqb-0006on-Jt; Sat, 07 Nov 2020 14:05:41 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbOqY-0006nL-By
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 14:05:39 +0000
Received: by mail-qt1-x844.google.com with SMTP id h12so2872143qtu.1
 for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2020 06:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=McXJiuNmRUheJhVyGIyG9agTCG5L6Hc8mLIxyaW+pVE=;
 b=YUP/px9gEY4c8O+NQMRkZ4cZtimjnECOSCIbFU6c1LnrsxcsEeQxudlczO5JWc5wjv
 vi/MqP8ODvvaGDLJsm1cHNklngPMWdwPO/QN7Evls2Fp0oiM9Xa1KoX6nHml4mJnvDGV
 Gq3M61JoIGFffjP3pM+wv15stx42ozauZJj917Wi6C6gG760bOEn/Vjb8eD1uPZocbPB
 JYdBpErBOs+ZCZyi14ZJdEySEAwOc8bNanNe4eUfC2i9MCDDMceDYMxVn0x/LYCd1zJY
 mQMErwg9jZpf6NzcBeFOliNf2DJ/k++5V+TqRaI4lklRS0Psw4MSx/Mm6mYW7vbUkpLK
 0R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=McXJiuNmRUheJhVyGIyG9agTCG5L6Hc8mLIxyaW+pVE=;
 b=XuTbMBjAlHCwLvmSZI6MGqcbFUUm2gzEzCshMmVu+Tuk53JlXoQZHkSgK8CjzdHQdy
 vqWypd7WbBhSY0jcsGTbyG175/G/P17CS38qPrTJPmMx1LfGXphJAN3ji44hs6fHSkYI
 qm76Cz75UDVY5bL/kqG3BabWD3r0PtGmne929XhFLGpeKFgD9w2wmaGiCU1MHsSmnpAy
 qZDwDzyh5N1mt/XBeQzmqgrIfZiV+p0zoA3PDKKZQgXHx2JC7v5CvK88gKn0AF1zp5cq
 2oMuTVv0kJ4pOF5RZiWYcFKmglPBc0f4Czd5Dd3VZZCHEmZUPEc61PWtwGdJrc+v+fE9
 uOPA==
X-Gm-Message-State: AOAM530mExwSPyxtnFt2pjiNnOcbK8Jl7zLT6KKjzTskEkzQNjSNQI8g
 33JvOxW4ZIMoh/NCuWwqCgM=
X-Google-Smtp-Source: ABdhPJw5cPadKcMUxFjLnpLviksgG6dYE2tSnVCVynuORVSPyIO6ZyqXoUq2dMzp3h8O/fOwe4V20Q==
X-Received: by 2002:ac8:6b92:: with SMTP id z18mr5873972qts.30.1604757937017; 
 Sat, 07 Nov 2020 06:05:37 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id g9sm2424379qti.86.2020.11.07.06.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 06:05:36 -0800 (PST)
Subject: Re: [PATCH 23/32] dt-binding: Document kendryte,k210-clk bindings
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-24-damien.lemoal@wdc.com>
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
Message-ID: <14940525-40a7-b4fb-0837-853e1236e023@gmail.com>
Date: Sat, 7 Nov 2020 09:05:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-24-damien.lemoal@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_090538_475157_C18366A8 
X-CRM114-Status: GOOD (  18.78  )
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
> Document the device tree bindings of the Kendryte K210 SoC clock driver
> in Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/clock/kendryte,k210-clk.yaml     | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml b/Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml
> new file mode 100644
> index 000000000000..02f5f8a86bc8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/kendryte,k210-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kendryte K210 Clock Device Tree Bindings
> +
> +maintainers:
> +  - Damien Le Moal <damien.lemoal@wdc.com>
> +
> +description: |
> +  Kendryte K210 clock controller driver which support the system controller
> +  subsystem supplied clocks for the various controllers and peripherals within
> +  the SoC.
> +
> +  See also:
> +  - dt-bindings/clock/k210-clk.h
> +
> +properties:
> +  compatible:
> +    const: kendryte,k210-clk
> +
> +  clocks:
> +    maxItems: 1
> +    description: System fixed rate oscillator clock
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/k210-clk.h>
> +
> +    clocks {
> +      in0: oscillator {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <26000000>;
> +      };
> +    };
> +
> +    soc {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      /* ... */
> +
> +      sysctl: system-controller@50440000 {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        compatible = "kendryte,k210-sysctl",
> +                     "syscon", "simple-mfd";
> +        reg = <0x50440000 0x1000>;
> +        /* ... */
> +        sysclk: clock-controller {
> +          #clock-cells = <1>;
> +          compatible = "kendryte,k210-clk";
> +          clocks = <&in0>;
> +        };
> +        /* ... */
> +      };
> +    };
> +
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
