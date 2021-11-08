Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1CDC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 21:21:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 110E661052
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 21:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 110E661052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEacjDabvGIKLCeawUh6J+IcM9prH04viZSFNyzsaCY=; b=jbK2lZ5wsHN9jm
	SanIth6SHJyPa1Q0QlsU8C6sKk8poPogkNh8GsY5iqVkLILqv2TLMAEjCjFkpv7WCPObjIQwpT+7i
	bTnUBOsNRAeozDD9e7spZEoxXV0GkOddnCvXZyBeAhJYvpsfCiW9067KYafFDKe2BvTJ+MkUMMDs7
	hk8pH0ZkKvzkVEI9/pjWAOOZU/qniT8KJGDFVmpHpI2W8bAwRyyYD1Xi5rmG756Ds+3W6RPl7oCNs
	rOjN1OPa6fnK/xV4TlWU8M12S4qhtNIhc5LzsN0PkM03RF7q5u6oYDGVEyNcKRb/qlPelRxE1XQ9N
	MtBufPVCAOjPNkOoq6ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkC4X-00HTTu-LL; Mon, 08 Nov 2021 21:20:57 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkC4V-00HTTD-7p
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 21:20:56 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 15A0B3F1E9
 for <linux-riscv@lists.infradead.org>; Mon,  8 Nov 2021 21:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636406454;
 bh=YogfxXVLG0bgwIYjZVCScA3ZPj2arr94hp6aXYuCGUk=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=jcJJIvASduvTJyCify2i0FqezFOAAVJARlnuDPyKce53hWi3HeO3ykaTOpprPulpr
 ixZVH1liJA/H5HSnVBAbov3codAKJBE5FQJweGUSw8jlmqT275cjiQePf9zJrsp+Hh
 sJP4ZFZojeb22/JK4VU37SliHBKma5bjlCqUcbsoOrs7MB7aZ7Pj696YVYQhn3SIWm
 cqDBr2SkKIF+eGwOCt9vlGdmQQ7BK+0wd0xeySwH6Z912q4fcYc8n5FWElJGwBKYlu
 2/FEgAqiyXG4lxKcG3+MB75m4stkyY8l4H3MYOWUcq/akzRrRhMy9pBDzSk09uSxAW
 3Uy2oT2gpYgNw==
Received: by mail-lf1-f70.google.com with SMTP id
 bq29-20020a056512151d00b003ffce2467adso6987989lfb.3
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 13:20:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YogfxXVLG0bgwIYjZVCScA3ZPj2arr94hp6aXYuCGUk=;
 b=cXoS7DBhSm1oyKKdq6mAllyozOtwgnvYqtYh92ZkcIxhJZPQSDE+sNvmY830cR1HG7
 dMShKDjVjmYTCxJbg1SBzoFcpyw+NgOXgSqxhDXMpCiVtZ/sIAhrYFqMiNW8QVgiSiJ6
 6Y2D+7VSwpYOWh2jzn4Yqy6iMxw07xWbNKPAMpKA4v4JKsMmZYvE5h/C6ZL1BKrd51NA
 EOpMWjUpKC5d49bMLgGS0QKJjZ/yXqd0KZr5jvunedxmEnHrJvpBqXSPufE9x7ilsHdp
 QX6D/3jSMxjSs0UfD9BftoK0tOpvr3tMyaBqYDT3j8+yvhzEyywfi20VCvNsYTArwtBT
 6QLg==
X-Gm-Message-State: AOAM533Z/J1//F/xgmQ1kGQim5+uZGyXEQWGConD3G6g5WOaJDFv0szW
 zFbSpyf7+prWIfVKIaMCxaLZvmMxuRxa1mjiSiOkZEwEt5g6HRxiEDYbnRwjYrGF7UUtunoRkzZ
 Bb9DWjp+0jYNOuXVYqjf5wKEmsn0EJnxuwmbO+f6QQVI8BA==
X-Received: by 2002:a05:6512:152a:: with SMTP id
 bq42mr2090123lfb.109.1636406453480; 
 Mon, 08 Nov 2021 13:20:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGaKWNwUoPiLxpzGIDpV6UffO82CncD15TYE1AU5AiV5f3zoXZgGywJ7u5NVSzJMJoy3rnJA==
X-Received: by 2002:a05:6512:152a:: with SMTP id
 bq42mr2090089lfb.109.1636406453316; 
 Mon, 08 Nov 2021 13:20:53 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 i12sm1930457lfb.234.2021.11.08.13.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 13:20:52 -0800 (PST)
Message-ID: <0a2e06af-9aa4-a5a2-f20a-332bdfc69448@canonical.com>
Date: Mon, 8 Nov 2021 22:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 08/13] dt-bindings: soc/microchip: add bindings for mpfs
 system services
Content-Language: en-US
To: conor.dooley@microchip.com, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, robh+dt@kernel.org, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, broonie@kernel.org,
 gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, atish.patra@wdc.com,
 ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: geert@linux-m68k.org, bin.meng@windriver.com
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-9-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-9-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_132055_445941_0C901A14 
X-CRM114-Status: GOOD (  16.70  )
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

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the services provided by the system
> controller directly on the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip,mpfs-generic-service.yaml       | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml
> new file mode 100644
> index 000000000000..f89d3a74c059
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/microchip/microchip,mpfs-generic-service.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Microchip MPFS system services
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +properties:
> +  compatible:
> +    const: microchip,mpfs-generic-service
> +
> +  syscontroller:
> +    maxItems: 1
> +    description: name of the system controller device node

Same comment as for rng patch.

> +
> +required:
> +  - compatible
> +  - "syscontroller"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sysserv: sysserv {
> +        compatible = "microchip,mpfs-generic-service";
> +        syscontroller = <&syscontroller>;
> +    };
> 


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
