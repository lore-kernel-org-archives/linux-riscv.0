Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE38C76196
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 06:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4pMGsJHymjJHHfBXE5QIhd3KVoW3SSkfTqgxpJlRRE=; b=TcmbKirbnRlSRl
	CONOrSGxcO0UKAnoALlcrQWK63gLkSCHXXqI55JQ7J4KCmK3KLFQ5uW2OKZwVIRdLLOd9eH7rtjsx
	8sGC5pOCvk7OpybrdfkF+RI9niVta+IgQZy/7muAyyw713pA4lF7Je/Zl3FSt9DHYAxBTNiAfk6Uk
	HnK3Ncz6PBgYqEXlhpKQlxEKtDFYgaB+Ebj2pMCsllcX/0+QzV+Cxk8m1r8wwzV7bzGfWeaE+W57L
	WXpHHG0rMjKdjnSKg4ceXWRE1g5S/1dYopvMixd4LyaViRzF9lv880gYnbX8M8cESEvSiGvWcIoT9
	/XH4u/CowPUDh/KnjN3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe9AX-008F39-2A;
	Mon, 20 Mar 2023 06:38:57 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe9AU-008F2P-2E
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 06:38:55 +0000
Received: by mail-ed1-x52a.google.com with SMTP id x3so42423331edb.10
        for <linux-riscv@lists.infradead.org>; Sun, 19 Mar 2023 23:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679294333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aL001ady4NA4/hsn4xZG1v6Zr6XG/l61DgNleMsf6i8=;
        b=OJAFgmI8/InvLBl0H5GobooZ6YXV9wZLYH90nbnlVGtt4s3AkYiORKceYX+YwHrDDZ
         VEp7fhZ7AyVWCU29ZVQBQrZyzIhRnM9ZLVYY7MO8ZBRhOWmqrR+Aj8od2AVHqNJnqQRG
         z1UXbLHDbarDcDtFd3RZQKUHTQyT+umQ9LI7odgCv0iXxJ+TgI5Iv6S6KGb58ZTilNbT
         UqChP8OQXci0UX5vnmX2HDG9jtVLX1x+/SMRvEfhHS/XoCAPKhEJ2K0Wj7x+rs7nkOSJ
         9oFGvS8ea5TLwRmOg016dkzmFlk+diHLpl5sZd7Tt/rKlXkhfR3ZNcI+eaVVfOGW5vmV
         5XvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679294333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aL001ady4NA4/hsn4xZG1v6Zr6XG/l61DgNleMsf6i8=;
        b=1S12GWsL1BjJ192yFnEazvUI92QNh1VDBZeEi1uk0Dt6wuLd9J2XC5vrg6pIkrCy+j
         lqIhL5pz9SdeSo+fne5s+R8kTKb/LBM8l23BF+BLvG2Y7jeRtH5EG198smuCN20vPBGh
         XXLINr+nRAZorK6mS0odn5Agy+NsuN4J8/kOz6jxp4iAFMJ+8utew+BLoVKvGUcYT7O0
         /nMjusdganybDzBAEMC1nF28OEOsE4mVLY7aN2jgKDlWOsBAlzUlJsa0/3ENcM7rDOMV
         90lpPYYvsopeg/nO2tua2bxgp0Ygmr62iyNKR7zI5o5oQ+V/nOZgka9FFOplqhDiptRu
         C79w==
X-Gm-Message-State: AO0yUKUe9Ggaevr29ZIgEqsuCamdcmjP9M+4MHV+UZlQCylXuR3PefF/
	cLBbBhyM4Sl3wj4yqsXzyFWzYw==
X-Google-Smtp-Source: AK7set/ZY0jx52sr1B3qF/Hpsv16SzPgkWnQ2bQGAUShEUbpOMmPcYjIMDF8J7VRk3bDNNkFO3R7Vw==
X-Received: by 2002:a17:907:7294:b0:935:20d8:c3c with SMTP id dt20-20020a170907729400b0093520d80c3cmr1391024ejc.61.1679294333377;
        Sun, 19 Mar 2023 23:38:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4428:8354:afb6:2992? ([2a02:810d:15c0:828:4428:8354:afb6:2992])
        by smtp.gmail.com with ESMTPSA id jx3-20020a170907760300b00930876176e2sm4009892ejc.29.2023.03.19.23.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 23:38:51 -0700 (PDT)
Message-ID: <ccebb1c9-bbf3-8998-6611-8c0046a6e3d6@linaro.org>
Date: Mon, 20 Mar 2023 07:38:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RESEND v6 1/2] dt-bindings: soc: starfive: Add StarFive syscon
 doc
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
References: <20230315055813.94740-1-william.qiu@starfivetech.com>
 <20230315055813.94740-2-william.qiu@starfivetech.com>
 <9dfc752b-7ae9-5e45-e9e2-50b87dabbca6@linaro.org>
 <adcbc5a7-23e7-9396-a67b-776653e14b8d@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <adcbc5a7-23e7-9396-a67b-776653e14b8d@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_233854_727291_90E7A616 
X-CRM114-Status: UNSURE (   7.89  )
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

On 20/03/2023 07:00, William Qiu wrote:
>>
> Originally, I only wanted to add a base module, and the binding of other modules
> was added as incremental updates by other related colleagues. So now I need to
> add the complete binding, right?

Binding should be complete.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
