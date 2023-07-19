Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6E6EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 10:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBH+9S6+3SyRpiUAISARdXFDnxh98Y+Iigk4vptR1hY=; b=mHktATBrMhbei/
	FtNI+MlqcS7DfCbrRIHqR2mtUTmJxHzfhvPFXl4ESz9xLpgxu+4gbLzr1EbBbYSbM/H54qZDszvMZ
	gh6qj1Cclefy3fRsf4mHILhkfoDbiDw+pOiNi3mns8tGOop+5fzRhXGq/tbqZdYq8yk1Ljy2SR6sJ
	kklMZodBbqKJ3oJu2qBxI/mlrYTjFyZWJ0jzvQGd53NEPV9XPiCFy3i+fwQ91HpsdVWRMTTo78o3u
	S42NOl6g/n3LrhSaR7Djs3dR1udll72rQiLgVB6hRUWs+5jg00s41TdmJkA5DFAx0pW4gJjGwPYId
	mawuJS4cCQrAZYFP/1Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4rM-006qKh-1Q;
	Wed, 19 Jul 2023 10:56:44 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4rJ-006qGh-2A
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 10:56:43 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51e344efd75so1448527a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 03:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689764199; x=1692356199;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0cb3uJKvOt8I5jmhbZsvlqVNSIoteu3SKnCcD96px/Q=;
        b=RRfaLI7MLZQZSoqDtZvBm0x8SmP9gMXxNavOUPcBWUSCXzw/PEIJdLgWjxGAB29uYK
         0oJEtpZog0gAnag+9XxZvXjJB2mZTl6uZMXBkOwscERdcquWRhPom4plOqskCWGBi1f7
         Nb+RXexS29zn7rr2zJSUuHpEJVWL/CIUPryAdMc6pBelMNlB10wC5fYbt6WyoUMl8uXF
         gclttPhgn+GE84qw6LOcv4fA0aDGFt/7KK5zv0DgjRLEyvJdQ63vp5DkKwhmlvSOBjoQ
         H+j62SVP9u5+ho7R/xtr+qTDmD9A3SG41iZTzt6EPpmHgw/bMtB3aGvi1dqLRD6xMly2
         sohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689764199; x=1692356199;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0cb3uJKvOt8I5jmhbZsvlqVNSIoteu3SKnCcD96px/Q=;
        b=BHRrcCJ8YbZ4cH5cq5u/woBjQ6GUlMs01oaV8Iln/CDFUpeZclyuVNdqjDTGCIgnfc
         +flAlGXWQyZX2OjAQ//dEJJ44qqQjPoQ0eIqRIcO9MrNbMxM6suRyAeNS+20OVPFraJ/
         6J7My6EXp0+ut8sHqhphFy5APh2KoP9bANlf4QA6yhTUjRzVEcssU1WaOAB4gAmvhvcc
         9k2ktUm3avJrkSgvSLyjbLJCxS6Xag8xhpSYvSqn+DL5GBXML3R9VFfOccpZb00wEYqv
         Ono1y15XCECkuYQa6kfkXPx99J+1uS3toQqhf7D/HXmFSqmXrP+sx4pDNJNqTegU+HKX
         Uc4w==
X-Gm-Message-State: ABy/qLYfnboy4WVkChnK+EfkMHhccmrEBsfFowkDQ4bimOIHvwIxqX9x
	3qx9mSCLVfYvGDkiq66ht4Jb8w==
X-Google-Smtp-Source: APBJJlGQ3ePNgBtFehdx88Nyu/l+QC7MVDygtSlJZdbG1gOoT3v8ggTbM5uC2DFHqNgNaZbRUyNFUg==
X-Received: by 2002:a05:6402:654:b0:521:ad49:8493 with SMTP id u20-20020a056402065400b00521ad498493mr2196390edx.6.1689764198806;
        Wed, 19 Jul 2023 03:56:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id d15-20020a50fe8f000000b0051df6c2bb7asm2520009edt.38.2023.07.19.03.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 03:56:38 -0700 (PDT)
Message-ID: <d08ff946-5b9c-8887-0445-e49a0c76618b@linaro.org>
Date: Wed, 19 Jul 2023 12:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 7/9] dt-bindings: PCI: Add StarFive JH7110 PCIe
 controller
Content-Language: en-US
To: Minda Chen <minda.chen@starfivetech.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mason Huo <mason.huo@starfivetech.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Kevin Xie <kevin.xie@starfivetech.com>
References: <20230719102057.22329-1-minda.chen@starfivetech.com>
 <20230719102057.22329-8-minda.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719102057.22329-8-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_035641_732726_C3EEE767 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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

On 19/07/2023 12:20, Minda Chen wrote:
> Add StarFive JH7110 SoC PCIe controller dt-bindings.
> JH7110 using PLDA XpressRICH PCIe host controller IP.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---


...

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#interrupt-cells"
> +  - interrupts
> +  - interrupt-map-mask
> +  - interrupt-map
> +  - clocks
> +  - resets
> +  - starfive,stg-syscon
> +  - msi-controller
> +  - reset-gpios

Same concern as previous binding patch.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
