Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB50FC47088
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIBcRJYoeCPicdI0VMQ8SQADG6zrHQhkWaX5A4ITw+I=; b=KH3iAHha+yXRY7
	9aM1HNFO6Wxo7aTVMIb9Qi7OboT+otMc10Y7k+zr7ZvSxX/8A7eKMPT8cHGYwkK3zAyqDYg6pstr2
	O95ZbJVaxkQzsbd84mritR7dbD9wcAozU4kyVksfa613l0J/0y576UvcKewwsasczUlgjnX+851qe
	Zx9ps+XIG6HBgzNae1kmxh7f/YfRmeyxJvdFcWu4ejveF884DE16Ax2w249Uze5UeR8AjUIsVGjec
	dcroQRH0+BMRjrxzVJaxjo5NH3UiG1wmprpmKLaJ88vGbEVY8BI1tkmZX7xn9206a5r/H+0FhUWqA
	8ARUSAhyaFbWRc3sqjIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0mGb-008VID-G8; Thu, 01 Dec 2022 16:18:29 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0mGZ-008VGF-5P
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 16:18:28 +0000
Received: by mail-lf1-x131.google.com with SMTP id c1so3236225lfi.7
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 08:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8cY6vY+thlkCsq8gkvaJsPRCyrqqjPYljRJ5t7fEBhY=;
        b=jfbqHyeZzr8xPua9HCdHjoXzpBxC7ALd4kWIH5iTniEhGsyfEjibgdBA8R4ffEqr3V
         DInsg2LBqcoFqTYPg94zQW5MfzlnPd0KCKnj7wQlulFM+yStYvy1kkax8IbGNaQqDXwj
         UKQMOiZ4Bg5DylqDInXJxiS9nISr/iLti0B+d4nJWyobSe+VzLb2PJEnWVFp5ZM5IHkH
         bJHZVHtORznZg8knhE33yfZ/poItxg9WPJImuC0F8HNgq3/Zst2Wf9J6z1C75UepInHW
         9t894/JigyjJzfyv+x3m+inY93IkFT5U2IF0/jnEc/3Zuf+Eiknt6n7scRXOkFqxNP0U
         17AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8cY6vY+thlkCsq8gkvaJsPRCyrqqjPYljRJ5t7fEBhY=;
        b=HMhvLOY3HjiyZ01RbbVX3zdmCWNOr6KY2gd0oasLzgBltroGpXihlwCowdSA4tOVk7
         VUGAVkmN/ZVoscPt/LEd4Dw6p7t0g1m0TwhjXDFP2vMbj5M8X41U7QwwyS95uaTWvkN0
         FjVE19IYHGHrDZJi3Wgi0c1siEO5GK17VLHvNS+LH3rxBs+wez6IZovdIZ93mo7DOMWj
         fIT+65Alh2IIHz21wD/I6t9/jY+qyGH3UuzS7A96/fORwyWrnYPCZtYgPqOGVCqi+IME
         +5SlqZsILixg6nVDFSJjXDBJRB+Kg7VIjW0iUv5khjugGOChvLdAFh64+pUMO7TqFTPF
         7JTA==
X-Gm-Message-State: ANoB5pmB7UIzqpPHAoeta8tvQa8GryN2FxiTTZs4oAstz4ZbI+Y7pS23
	5VRwHC5hPiDW/wyfB2MtBRvjjA==
X-Google-Smtp-Source: AA0mqf7qGU2jrUUfqNQ9zX7/puSmTFzU4/4K8uEfeV/EPQlWMS86NXUROJC3c9SDMfwfMHDNZvG25w==
X-Received: by 2002:ac2:4d95:0:b0:4a2:3d03:d951 with SMTP id g21-20020ac24d95000000b004a23d03d951mr16321829lfe.387.1669911503607;
        Thu, 01 Dec 2022 08:18:23 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p9-20020a2e7409000000b002770a9ed61bsm408768ljc.66.2022.12.01.08.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 08:18:21 -0800 (PST)
Message-ID: <277f9665-e691-b0ad-e6ef-e11acddc2006@linaro.org>
Date: Thu, 1 Dec 2022 17:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 1/7] dt-bindings: net: snps,dwmac: Add compatible
 string for dwmac-5.20 version.
Content-Language: en-US
To: Yanhong Wang <yanhong.wang@starfivetech.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-2-yanhong.wang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221201090242.2381-2-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_081827_234660_B9F1EE11 
X-CRM114-Status: UNSURE (   5.96  )
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

On 01/12/2022 10:02, Yanhong Wang wrote:
> Add dwmac-5.20 version to snps.dwmac.yaml

Drop full stop from subject and add it here instead.

> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>

Two people contributed this one single line?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
