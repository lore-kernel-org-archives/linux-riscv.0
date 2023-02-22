Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982B5C6379F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 09:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bf7pDZ/supkQLsG+ReOcSPE2LNnMSR06lMTCFCpsyuU=; b=enYe2grHRNKjG/
	Y0n4AnywTtqrbRXfIdxufHOEIcGW6bXci846vhoTcb2qHkEp/srWYlHJMqUGSVkUhChxlQU2p/TUB
	26okZO69gulgalI6neamDxeIt9Y1MuD1w3vfTWWOaEI6VronTpK/gFx1yGhv1vXDn/lDIPv/gzEsq
	S4CKjMZ58u2cmPREt+b2nEbYVcB2ibbNCFE/U0Jf0bCJpj77lw65SVOO7Ezq6XonDSNmWFDDDH0Ql
	d8Lc7ur6Bku5wkzdfNDTzrOiBPRcCgq4WeFooov2WXhVgaLANDok5jxm2OG7lJufBPF2HYgWYZrpH
	AI5CUArAkDYxgAsOq0xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlBn-00BMIF-Dh; Wed, 22 Feb 2023 09:13:27 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlBl-00BMG6-AG
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 09:13:26 +0000
Received: by mail-wr1-x436.google.com with SMTP id 6so6582982wrb.11
        for <linux-riscv@lists.infradead.org>; Wed, 22 Feb 2023 01:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zkY3+fA5exA5Ft5hxJp+6msoshzayibJtkPbdEoBQjA=;
        b=iX1FgI4n78XMb3xWIvCi6aaiDmyMYym3I/GjFQMirsg6gjzLdzXb0gScQs9JQb7LXj
         ZSzMvaSkGIBawDHrdVHCUg/e9P79wolm2spyoNWR8kFDawL4RkOVJzIHEEX/WFSWdf/M
         eKEZ/zN+U2JIv+FAjLhVJYN6DtguRSH0DhEwoOk8ZarsZWBjTXacFHggHFNsuDekx8JS
         xbHflz5Vh0obbQZNAyCUM1zzVB8rajon/nqu5nuK81LMh8kI9OMjoyIhHuyfhFjoVGgq
         FaDN+KCKCw78nDJFR+L6guVXQxltuIjAUKA4O3oO7z9LK1h/nrVk9b2GVaWJ0U0FBIHJ
         Bggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zkY3+fA5exA5Ft5hxJp+6msoshzayibJtkPbdEoBQjA=;
        b=oWuR0cpGv4iiANC7EfAqs2LXhoRdid2LHctPkKoUTnLRDNOcVNy/8WQrY7rT/y1zlT
         SyyhjPNJRBZTKISHHY+3yU6uscDVy3QS2rCYQ44OtPqbe+zME4i79pKK4c/CVblZOolR
         GFUEmWQ5xLlayfCblbWxJFuB0+xtjJjGYN2q5Q53JyvK9oiuDqjS1Zm1ypplMOnDdCur
         a4DpSldzkTVV/SpGKpTrdFL5x1S0sqtilwSrFKOsQnRrKVBvQPs/+4J/buCaNeG4zwwR
         piYdhuQ/q25q8LWz5Hq2ql7UHFU4XJgv87ZkfFj+QEvtbSJyiAFaZBtPoAHZ/nmy4XAp
         basQ==
X-Gm-Message-State: AO0yUKX0RFUhZIQEbwvO8PY4F5YUJhGvgyF8jejQ1wKPB3vcvuMFDdE4
	puIWnO1YhCCi8VqZAst0xbjPbw==
X-Google-Smtp-Source: AK7set9NdN0jgccs0XCvI84qLhB/QtaTW7Q1bVfwm/0xYU+1PLcj/iDaoh0n6AnhTu7COH1UYeqHIw==
X-Received: by 2002:adf:f70b:0:b0:2c6:67c9:860a with SMTP id r11-20020adff70b000000b002c667c9860amr7122152wrp.44.1677057201532;
        Wed, 22 Feb 2023 01:13:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x4-20020adfdd84000000b002c556a4f1casm6329920wrl.42.2023.02.22.01.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 01:13:21 -0800 (PST)
Message-ID: <e4c2b711-7953-821b-4281-04e4b40154ea@linaro.org>
Date: Wed, 22 Feb 2023 10:13:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 09/19] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-10-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221024645.127922-10-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_011325_402939_DDCAFE1F 
X-CRM114-Status: GOOD (  10.37  )
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

On 21/02/2023 03:46, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add bindings for the system clock and reset generator (SYSCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

I don't know what is happening here as neither this nor other patchset
explains anything. Please stop writing what you do in the patches, but
explain why. What is easy to get.

(...)


> +
> +#define JH7110_SYSCLK_PLL0_OUT			190
> +#define JH7110_SYSCLK_PLL1_OUT			191
> +#define JH7110_SYSCLK_PLL2_OUT			192

NAK. Do not add incorrect bindings just to remove it THE SAME TIME.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
