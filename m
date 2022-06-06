Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB399C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 08:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NrHudWLGpox1YE0SLVWXbazFLteGGKRAdBLbwaNtsE8=; b=zHKzB+g5viqrxc
	iMe4lZpki0XFbqyL51p31FlyuGHvOrRqDPx2aoY7OTKtNJWa1o0GL3Qy/hy+0KzWJf9Tb1mL82mn6
	NnESNgllBvmYVAptV8vssZTuMKcTviOX8TzdSyb1Nqy/t9WlZiD4+dHz90nLXH5YDfwtMauEyVCmY
	vYPtOQjRCrHoR9kan18TOGHFgjAlyikp/QMnbJX8bk7XV2otRNQWxQ0prDZQ0E+/LVcfsrzBHtj0H
	WN9X1HCy+NFZKBe7ZZBaUdigqBcBcB+ZD95L14oBqzPgjIgcTTlnaofhXPtjs4xibLu35ofstwnw0
	/34d6XrP58YgUghHr2VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny7lr-0003MH-2N; Mon, 06 Jun 2022 08:07:31 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny7ln-0003LZ-PG
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 08:07:29 +0000
Received: by mail-ej1-x632.google.com with SMTP id y19so27368779ejq.6
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jun 2022 01:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TGWju0tIPkfnzyMNfYLOgyyDjvrvrvL8dK2m1zYPwnE=;
        b=dCCpRntKyQvzI3ixIO+EwDNQgCHC0bUE0MZzhV4q8NYiQ+Uhc/H5mZjI9F7GVI8wTq
         aG9Cvs7j40Z9zWIKBIzm7Jz06BTcVCzcPHUWrKHz9hkqvLrkjmOFRuoXPNt0Uk99MG5t
         yT8LzuAicyJyq78tRX6rUjgDTnWaFLEKJGE2ZPCCYw1WReweGp2bV3vknEMThMfjnjUT
         RUC0KDphWSdc3BFJNlNp58vmxCwzIuiwSSP7QmJTt+LKJYzmkCbEwevpOZ1QMgTUcfLY
         9VqlwD/nbhGWxnhvq6D7D0cdRWIYCkU3YkznntCgh3qBMqqiC8MaahiF4c6NhdU/kPNq
         Enaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TGWju0tIPkfnzyMNfYLOgyyDjvrvrvL8dK2m1zYPwnE=;
        b=sw7TlSi88gOVKZwGfTtP9fL2fJ7tcOHPYPxbeJ/TpeIDYjJn4Xr15Y9DypTUfvf4lp
         k+4nS5Hp4usPmIbeZ0MRTOPr/hlqnJWNSAcnapruo2QGKWMJTDc025iadfsVktyWlRFS
         rpQljuXLYo1cYfySbgcUhkmZJgyQZnPyYaKG4Qd2B+GbCuy7l3Kxd+RBT4mlAz9JBcjr
         cNXdytTnhxmFMIVgTyaJ2ZFzvMdEJ682Rwl1STQRBrtnxzgLLq7yrwiszsqsMgq+95l0
         GwS1GG+qiQnYlVZiT3X2W2/lD9BYROP4Ca5IlrrX1IS8tWZ5uwyVN5pFBvav9d7q5yXQ
         6FhA==
X-Gm-Message-State: AOAM530NAJoeaWCFjnGYWiwwVEyNRJAOqJv0Gbw/UO9Adpt6pSM/9nsj
	I0QEOkz4jY1r624eOsZN2uYkeg==
X-Google-Smtp-Source: ABdhPJzbdodYa0NEHEGhpxHxSru/eoKMvM57JCkkhJ0mxJARezlwyh/UOZNTcO7zaYhj4H3gI0/IkA==
X-Received: by 2002:a17:906:dc8b:b0:6fe:920b:61ff with SMTP id cs11-20020a170906dc8b00b006fe920b61ffmr20325733ejc.565.1654502843972;
        Mon, 06 Jun 2022 01:07:23 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e2-20020a1709062d4200b006fec2097d53sm5990274eji.118.2022.06.06.01.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 01:07:23 -0700 (PDT)
Message-ID: <ba71d707-1d5c-7b31-3819-aec60b2c7365@linaro.org>
Date: Mon, 6 Jun 2022 10:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 6/6] riscv: dts: sifive: "fix" pmic watchdog node name
Content-Language: en-US
To: mail@conchuod.ie, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>,
 Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
 Atul Khare <atulkhare@rivosinc.com>
References: <20220605133300.376161-1-mail@conchuod.ie>
 <20220605133300.376161-7-mail@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220605133300.376161-7-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_010727_881941_D5C26962 
X-CRM114-Status: GOOD (  10.65  )
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

On 05/06/2022 15:33, mail@conchuod.ie wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> After converting the pmic watchdog binding to yaml, dtbs_check complains
> that the node name doesn't match the binding. "Fix" it.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
