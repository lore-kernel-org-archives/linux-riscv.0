Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEEFC32796
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6reDfiy3j7GxFJUKe43Jy2L+an5clxMywoZUxPLBEo=; b=kn4QElJTd6BhrA
	Q+ub5VJbixWfCKe7cUehp/IjcSrN4mNMKuma6C4qij2CagLSYRsT/E13mQLw6+AmG+lhibRBHJ4ZX
	euvxvdt98W4xDdbtebi6qnrTG6dHXB3S6u5dKadhpidivvqn6OWL8lvw/v+3MIxu1phWDLzO0Y+fn
	PnZ+HVpJcAkpIiiDlUNcOAwrOh0BVUhH00ttGO1BUAZ6hTViZQydCXAGvCA4lgOcQoKED8PymTYxt
	/3bNi1CHxK361TKfZVhPAEm286+hZCYvgfz+kylcLiqKlE3J2IxzPzgSmD+yYZLv+L3Pi+A80dboY
	9U+N6v7o1reSBLde/BJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqPf-00DEoB-Ro; Wed, 24 Aug 2022 13:27:19 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqPd-00DEma-Mc
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 13:27:18 +0000
Received: by mail-lf1-x132.google.com with SMTP id l8so6468221lfc.12
        for <linux-riscv@lists.infradead.org>; Wed, 24 Aug 2022 06:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=c45lYX8RXqinZK4YfOxUYn7I1dL1A9tsyXH/7KdT7zo=;
        b=j17KyB8x4HHjQgrh7HEBJuDHYBcdyG5IYrfjIAfF29/vOt5ceX5mYiEN9Lhr26iEHT
         uguDoQY5k75hXyfRORn/LIoIIZXgnfjsRkknswONFXYgOB6hu46c6q1jCnKRxMozx+U8
         IwKzb8fz1FtUJ3u86SjBVR7KbiYwf8HBMfLUmwVCJ/UuLhWIKFo4Pdl6hhFe/FfHb6id
         K2GtQCOpwdX/IHCXHISI4qDW0RlADt+S/e7StA3OHH++Kzi3UWW0QFVE0vImgiKB0Nm1
         QLkXkED2ft0zCWwkSHcqsPk5AtknEvFaxsj74ToimQwyfjoBNeAZhSssV2mdV5JY0KkE
         N+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=c45lYX8RXqinZK4YfOxUYn7I1dL1A9tsyXH/7KdT7zo=;
        b=WuyktuKHeY9EAYZWqWKAkALh14J9e3FtoSxQODqLQvXjYu/b5ki3sxlU2xQMW2gWWc
         dNTDfyVUa1J7vcym4ufGjzeIEFstaTXPe03fWDOsPemOvPqa0sdRyw5e4Fm6scYXH4Mu
         m1E6ML1XXZ1E9CnQy0oMsKEy0FcHSa/aeggOfnMaksHFfr+gUHOHyJ1zS41csfn5nRvB
         dbPhIbdcH12iuT++x/3frCi83mkHAr57XQMikoKdVi7QKR5jEEc0dgbHbK69LLNEFehY
         Luz2t58X4z4c3y7b7fLAb2KlR6ZPtCkdQxKx8qZInKqeff2pUBMTBIXYubfSLkbyk8Zg
         ZpYg==
X-Gm-Message-State: ACgBeo3flkXFcp9ngdsI+7YwcMK6OwliaWJkmDkcfEbDG5T1p1gMqLty
	fMr7JmJ3hPnlEEww0q1BDyA+0A==
X-Google-Smtp-Source: AA6agR5+dvoQAGR9/rB/GV9HncXOGxbKuFJefiohubaUP2MqmRN7gCj3f7ww8Mwsdzj3XsY8oLCoKg==
X-Received: by 2002:ac2:4465:0:b0:493:b4:c4ac with SMTP id y5-20020ac24465000000b0049300b4c4acmr1848654lfl.446.1661347636057;
        Wed, 24 Aug 2022 06:27:16 -0700 (PDT)
Received: from [10.243.4.185] (107-129-159-217.sta.estpak.ee. [217.159.129.107])
        by smtp.gmail.com with ESMTPSA id z13-20020a056512376d00b0049288e0bd61sm3028871lft.58.2022.08.24.06.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 06:27:15 -0700 (PDT)
Message-ID: <a9125027-a23a-ef58-cede-0b1d019f362c@linaro.org>
Date: Wed, 24 Aug 2022 16:27:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 2/5] dt-bindings: clk: document PolarFire SoC fabric
 clocks
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Hugh Breslin <hugh.breslin@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220824093342.187844-1-conor.dooley@microchip.com>
 <20220824093342.187844-3-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824093342.187844-3-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_062717_794008_B76CFDB1 
X-CRM114-Status: UNSURE (   7.98  )
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

On 24/08/2022 12:33, Conor Dooley wrote:
> On PolarFire SoC there are 4 PLL/DLL blocks, located in each of the
> ordinal corners of the chip, which our documentation refers to as
> "Clock Conditioning Circuitry". PolarFire SoC is an FPGA, these are
> highly configurable & many of the input clocks are optional.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
