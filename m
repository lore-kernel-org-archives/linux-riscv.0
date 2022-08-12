Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AEBC00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 07:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GapveNBGfFJaYKQjeNGaqUvictzZF1vRuoBkKdpuAkU=; b=ZCl4qTsrQkVBzM
	NRbAgRqq3vbyf6AEUzod09WOmG1NLufG5MKEv7kJkKJt4NUuTeT+HzwoWISvkV8d7qcwvBegT8Tk3
	AedaVKleHE7bqYFDdN3BgkGF8kB3+RsDqA5OL64cyVwbYVgVVQSoSvZyfAN45MImoZpERmjTHSmlN
	UflnQ5c3ndLeoxHdL/C5AsCeJK+od60YZHg4cOG9e4/QUID1T2Ni2/+ALI/DOTyiVBc0i9GWbh22W
	7tFR0LL5BMqSZwzogPgoNgs+wBcZU1UPVbJVD3Hu7MNz0AaiSRGBXspxXwmJr3TU01oBrUdYW8iQb
	iZ5pTlEE41f4RJm/eU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPC6-001S8m-5K; Fri, 12 Aug 2022 07:34:58 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPC2-001S3K-0q
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 07:34:57 +0000
Received: by mail-lj1-x22d.google.com with SMTP id bx38so136519ljb.10
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 00:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=/0za9YUjlCWR21SNkhMiDN3IDAZyQAT6AQCAzmrddpE=;
        b=VVrjuOUNW/QU9Hyq7AfSOklgFQwWn6UP6bxTIRkljjoWCpC8QQLG9DC0P/t1Oll7mL
         kzTOzeEaUrvcGu/3YoXWafwJlEUumZAELskM1pAYKtQsFAW3CQQv8Utl6uLjJ933ATii
         e4V/vTszQiTuYATPbenDeaWd1TKFpa7GP1ra0QgapKOW6gSjw+q/J9jdAErQczA1KCvt
         /z7jVeVK/iMdP6S/ct64eiKm/cWReCD6aBvTUozAb1KMH4e0QudMAxz2XxFMW9Uvkcp8
         rUKrS+g9jTpKaoP7rgYriKkkMlUHUFz3ivGkmqmgO8YHeZf7fvPqVEwkIRJclCqm9VzK
         8CDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=/0za9YUjlCWR21SNkhMiDN3IDAZyQAT6AQCAzmrddpE=;
        b=04VSZJ0rp2LcFRfS5mILMwM0l5Bhi4UYdTGqRIEM9jZ9nTRAn0jBAFSG6hFzox3VS+
         /0NNpNTI28HJtaQFZM1MTRhOAz/SFZAyXABemwqavYEcSi2q2vQpGPUae4VKqDeTqQ4y
         LKfJ8XJSlzy2UxlB+OwE40uQr92gzZE8EtvNy4/EZWVkfr7WaYTQp9Jbmkf49Ta1+M/1
         yxN2l+RhA1sbvJ7/eK1keHG8rwtol7DD1WNFX0AsSarVs3xHmdcaCzmA3dmPBTcr67vb
         19tTelPOVN8aEQkBmc6N66pdckoFcW73uBrsjpTWtNWMBkcVWbs4rohTa03A6MTcPGx+
         n16Q==
X-Gm-Message-State: ACgBeo0GYc38+31I4TM29Iu1pyi2Hkp/Jvgk3Dl1nffY8atDMll03cm0
	Bh+3CZ2Y9IhsnhfLudjXP9Ldtg==
X-Google-Smtp-Source: AA6agR6znqORoYJxRfGm+Kmi2onxatlXLgKKjqviuP7ROeF5zZKHdK1k0rlZjV8xnPXrXDRmjs5bWQ==
X-Received: by 2002:a2e:3515:0:b0:25e:7139:345f with SMTP id z21-20020a2e3515000000b0025e7139345fmr773042ljz.129.1660289691141;
        Fri, 12 Aug 2022 00:34:51 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025e4a8a8038sm258775ljc.88.2022.08.12.00.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 00:34:50 -0700 (PDT)
Message-ID: <f636ad9d-5e9c-f703-221a-3c09f31ed105@linaro.org>
Date: Fri, 12 Aug 2022 10:34:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/4] dt-bindings: PCI: fu740-pci: fix missing clock-names
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220811203306.179744-1-mail@conchuod.ie>
 <20220811203306.179744-2-mail@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220811203306.179744-2-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_003454_096162_379706DF 
X-CRM114-Status: GOOD (  12.97  )
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

On 11/08/2022 23:33, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The commit in the fixes tag removed the clock-names property from the

Instead:
The commit b92225b034c0 ("dt-bindings: PCI: designware: Fix
'unevaluatedProperties' warnings")....

> SiFive FU740 PCI Controller dt-binding,

No, it did not do it... At least I cannot see it. Where is the removal
exactly in that patch? The commit removed clock-names from required, not
from properties.

 but it was already in the dts
> for the FU740. dtbs_check was not able to pick up on this at the time
> but v2022.08 of dt-schema now can:
> 
> arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: pcie@e00000000: Unevaluated properties are not allowed ('clock-names' was unexpected)
>         From schema: linux/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> 
> The Linux driver does not use this property, but outside of the kernel
> this property may have users. Re-add the property and its "clocks"
> dependency.
> 


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
