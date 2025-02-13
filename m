Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59982C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 23:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRmH3Sq5t33ySRZTWYKMuo+uZS6dg2N5IGPsTnl3YRE=; b=QpFc+8RmCZ14Cw
	dbzRrC3rhmJV32f4ZBXkQYUkJN0ZM6J82RILS63NoVpi4i3TW9AKYATHFm4eBpLKkLUzBZCL30Bor
	u9h8jR/wnG23MFiknpBmRfOHbmILHdWdjeyj+R4JSfl3L7qACCTPkBaezOPpYkgB/dRO6tS7NLzbD
	Q2T516nOnDNSXdyYQxb/OPGvcEtraAuU0oWS7NhYzri8ndxbQYn2RFQbcSECo946A0Lnu1mViEJ/k
	ZBYWhiXv2eq6oakcLuw/QaAN0LBwwB5lsxDeVpzn8/qieWWSPbbCmSlW1vJPpkhflMQ7gsbatBlT3
	g2qHflU4jbsepEeZ2GTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiipc-0000000CyYG-0Kjs;
	Thu, 13 Feb 2025 23:41:20 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihif-0000000CpK6-2L5b
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 22:30:06 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c05bb6dab7so151248385a.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 14:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739485804; x=1740090604; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ShXovPaITATOcaXepBbTHEqdpsA8xygI7qSwseEtmVA=;
        b=Ua4hf+0LWzAKlNl5U1NSbPDGSS+/+VxBGuK8zGR/ItPVNES2G2BodUtTcb/kvxV540
         xxA9IjIdGGtDdVYGFG1sdERFuXliifc0wiPg+sA5X+HgxT33g4sRLgovX3glivJjvViY
         uvabD0ysSidutw9dOu9fWl9hBP0wMEe2MNGdL/OvQaqQFjf50cJj+NH9nUyzYi/neHBN
         /DGNMzmZLqa+YoLWyWgL/1Ax3TB2OR+Ee89zaE5sY2+kTeV7XKvWxG6pMb93T4RpiGkY
         Wkx9pGNGZ5ciyGldOiJzevuGWrKXOP8LNGQUjZG3bgmwsAWrJhaVdGp4PV7Eq55WyBhr
         yywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739485804; x=1740090604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShXovPaITATOcaXepBbTHEqdpsA8xygI7qSwseEtmVA=;
        b=ls4uDfwvAI1otvw0DEF7MOdOyHw25nIO7KdV/47lk3kqvt/VzGdSERsHlFG2LXrNf/
         Dv0KMaAuegigDO+/WWkfkaFlOYZfF1T7GKrgQyRlaLxi+Ly8dzlSYx3y5SP4LtTdBc4f
         opJB00CwAp7KLXOhKBzdIaGFOlu4M66+XEulaAB1n+0kxPx3lIA1W+PeY34BmTmm2kHd
         Z5Pf5VJ/wVfL0O6VvbD7q8O51ZikeuDzo+WuQ/2JZ3LM5jY+Fu11HuTABwaetpseW66e
         OwIxMqelKwGi9vokiFmGS3HffK/L8hyocl+JlxEbTLy3w1NIz+xv3QpbUAiVIyYsFz8W
         yKEA==
X-Forwarded-Encrypted: i=1; AJvYcCWukmw5ji4uNj1jcA4xJ6NYp86epe/5nJlQW65glzUWRLRpUH7KNd7tzjucsO7ZSjXhTPf6pGHx3U/YmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfMkuNOn1AI77OEq1mp8OzRUOtEc2BnBir2nNckKNDY1mszUOU
	ouNEdvEZYYO67deH3n1BDlMvmenDAEGMUzsTBSIShKgMrgc3Z7Kb
X-Gm-Gg: ASbGncundFJRQ029Dn6AMfd12H87ceJzk2dsW0UeW1TiemI1Y3PNtbriLRsV2vMNmSp
	08BoDotkGn7KmQGGeijpLNJwDWxUrzuVkYnO78EnyF1CU4w+1EznAJYyxh4EyY47GLg56myyuOg
	JNkRiWZj8eoWj65tmBnbfmAzQ0zbyJ1/R1SG2+GYM5nT1Ka9b9n8skMHYtn1Blkf2QYDDnEacsQ
	3eFSKdgMb7Na9d5sm8ITDiVeXriUJpe0fuhrpElAmO4h39OBflgrHD4rDr2o19kT5s=
X-Google-Smtp-Source: AGHT+IG45Dds1F1x6ndc483I9NQk+Amp3qv08smVydJSJhtH7qqr6jURVIBwtKjriGlCosvlZ5CFfA==
X-Received: by 2002:a05:620a:6841:b0:7c0:78ec:1ece with SMTP id af79cd13be357-7c07a9acc99mr761190585a.7.1739485804152;
        Thu, 13 Feb 2025 14:30:04 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07c6088ccsm139655885a.33.2025.02.13.14.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:30:03 -0800 (PST)
Date: Fri, 14 Feb 2025 06:29:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, alexandre.belloni@bootlin.com, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, unicorn_wang@outlook.com, 
	inochiama@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, dlan@gentoo.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v11 1/3] dt-bindings: rtc: sophgo: add RTC support for
 Sophgo CV1800 series SoC
Message-ID: <afskjc2sltch5vqlegrliq32bpoejmzgko6vovfgj33sx6aqla@omeqr7mr77za>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
 <20250213215655.2311793-2-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250213215655.2311793-2-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_143005_617228_2C9BA98B 
X-CRM114-Status: GOOD (  17.55  )
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

On Thu, Feb 13, 2025 at 10:56:45PM +0100, Alexander Sverdlin wrote:
> From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> 
> Add RTC devicetree binding for Sophgo CV1800 SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  .../bindings/rtc/sophgo,cv1800-rtc.yaml       | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
> new file mode 100644
> index 000000000000..b36b51a69166
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/sophgo,cv1800-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Real Time Clock of the Sophgo CV1800 SoC
> +
> +description:
> +  Real Time Clock (RTC) is an independently powered module
> +  within the chip, which includes a 32KHz oscillator and a
> +  Power On Reset/POR submodule. It can be used for time display
> +  and timed alarm generation. In addition, the hardware state
> +  machine provides triggering and timing control for chip
> +  power on, off, and reset.
> +
> +maintainers:
> +  - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +

> +properties:
> +  compatible:
> +    const: sophgo,cv1800-rtc

Now I prefer cv1800b to cv1800, using wildcard to provide base
compatible is not a good idea. This old design should be changed.

Otherwise, it looks good to me. With the compatible change:

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
