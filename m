Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A0CC388F9
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 14:03:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B512A206ED
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 14:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LBAVvs3t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfTKL2HN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B512A206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnaJFj7T+nVX+PYoamPLn8rzNbpntP+IKk702Ue+uzY=; b=LBAVvs3t46sD8ih2UkWl6dP75I
	oTwddaarY08mvUjFyXnWSX93IOcx/D9y6EoLDGjCv9fMz7V78U8miOb4UEpQEyILEObC01Su6veZl
	VYL8vHCgJb7mfWXLeDxBGyNrhISU77PrgikhIq4SN06Lhfel49JSFTiKs4ymS3zxUBA/wGs6cJujj
	pf36b/65FcHXoPOXKCZn3xJIakdynw18W7IMNTyM0UuWwQW/Da5Yk7+mfd08omWyBKdijy+wPpDm0
	cFh17hBW8ZWl9Kyjpji+44CdyJ3fSFvOdAZ2vSICIO5UCANNusgAh3cP+nFgL+bGU8fzpm5nAx2t1
	/ZC1+GiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbOoD-0006M6-0b; Sat, 07 Nov 2020 14:03:13 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbOo9-0006Kr-Va
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 14:03:10 +0000
Received: by mail-qv1-xf44.google.com with SMTP id ed14so1845060qvb.4
 for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2020 06:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8E0Y2gz0Cx03JNF6tn6/f94ykdO43Amm9xSOcaF5JQs=;
 b=WfTKL2HNtkzosF+Kk0Qh7Ek/HWatLw9vB4ZtcCu/W/cxFHFaHbJO/MUudBw4HE1AbL
 GHZT//XL7c8R/tAB+q9dpfsx5ykoyYcx9IV6PxOGpVKBkMYfgrWBP2jffurCtiucHpJo
 egFR9RWMcaBUgd5MKglRpd+nc4WfmGPv+Kypi2A6ypxydMV52jzH3kAtyEPuwqCdvACf
 is1itg5mhf0Q/ds+sJfL/zHwqIgpJkgnVwHJkZKoJ/EbsxLScyJk7qDxwuGamXt2K14Q
 4AUJ0TmbS1mBGOs6FYgEKrDzV7bRgLtz6TFdqZo3ATLJ9E70FPSnusPxNcp4OureBRzZ
 XPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8E0Y2gz0Cx03JNF6tn6/f94ykdO43Amm9xSOcaF5JQs=;
 b=hETJTxycBO4f/aIrX/d4YMSZlx8x+sofNLi0JaWzewDw8W+QpcW0eDcQSIjUGJHFRz
 NuxhTFU9Iq4QEOQdiNiwso8gfaF/lONZ0f35lqJQ05TVmYmN2IgmsXRr1kSslNaE2M6E
 KfhUZDcE3KyZ7kC7vKfwOdZftlC1YCPHVLJFNnehb/cO9PQ1HaGUVbknEqrB8Nku+1tt
 lFgT9lLgqiqKVZzTM2D1Jb3HRNuiGPonzbVdqf4miyAMo+sAlHSgfiIlBbr8yJY5pavo
 TyltxK3ABQwm34SZvJP/hH+dC0/lHWwe3b82vn3dbvKl+7KBOh4U+/O1jScTIKEINkbd
 GKNA==
X-Gm-Message-State: AOAM531NKQJ0/k2pi4wtMBpkxCG6AzsCq0/mLS51OCv5wstaiA96H0NH
 R8+jlftKum9f30/14+sed6o=
X-Google-Smtp-Source: ABdhPJwbqcHjLXg5tx4/MH3uPMpVg2VJ5PVO3qVyhchEoYN+MIOaW4mW1lbhofasTce1kPelAKETDw==
X-Received: by 2002:ad4:45d2:: with SMTP id v18mr6056079qvt.45.1604757788415; 
 Sat, 07 Nov 2020 06:03:08 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id z125sm2590613qke.54.2020.11.07.06.03.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 06:03:07 -0800 (PST)
Subject: Re: [PATCH 21/32] dt-bindings: Add Kendryte and Canaan vendor prefix
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-22-damien.lemoal@wdc.com>
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
Message-ID: <6fcfabd4-210a-c947-6151-4f8f3b3a9e25@gmail.com>
Date: Sat, 7 Nov 2020 09:03:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-22-damien.lemoal@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_090310_131805_6DC9EBB4 
X-CRM114-Status: GOOD (  15.77  )
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
> Update Documentation/devicetree/bindings/vendor-prefixes.yaml to include
> "Kendryte" and "canaan" as a vendor prefix for "Canaan Inc."
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 2735be1a8470..f53d4d8e7f2a 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -179,6 +179,8 @@ patternProperties:
>      description: CALAO Systems SAS
>    "^calxeda,.*":
>      description: Calxeda
> +  "^canaan,.*":
> +    description: Canaan, Inc.
>    "^caninos,.*":
>      description: Caninos Loucos Program
>    "^capella,.*":
> @@ -537,6 +539,8 @@ patternProperties:
>      description: Ka-Ro electronics GmbH
>    "^keithkoep,.*":
>      description: Keith & Koep GmbH
> +  "^kendryte,.*":
> +    description: Canaan, Inc.
>    "^keymile,.*":
>      description: Keymile GmbH
>    "^khadas,.*":
> 

So AFAIK Canaan is the company, and Kendryte is the brand. However, I
was unaware of this when I did my initial porting work. So all the
compatible strings like "kendryte,k210-foo" should really be
"canaan,kendryte-k210-foo". These _should_ all get fixed in the device
tree, but no one has done it yet.

--Sean

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
