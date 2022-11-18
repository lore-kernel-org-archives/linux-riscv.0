Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51531C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 13:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X73bOkNPMuZ1ZnuVRlP/55NCQGHJjhhk1XS/sjQ/Scc=; b=Cshk8X9+Hnhs1G
	PzRGbRV7D9YIbP8MiyX6Rm+4EDlZc5+O8nt3io/Gaix2puncysWFZRzVUxKbGag745iFEYRCwcnde
	0kykrPrepsQw7Vn2PtpXTVTIduKMG4qCanEq5pIooh4QyUykvg1p8kOfn7PReykfLLCTFdK7JMKHs
	pGxyBCz/0pNTniuV1pEvZN00nnlBegeZfA/KRV5rbV6j5nP4tujhZ5h3Y0l790JR/pQ0mXfVfJ8h8
	M8jlCj7R7ZszEoQtUletjtp6fty5FZvulxjyNEbXItIbaXA82sh7YN6JKqpKKJ74BvmB/5rZ5xc3b
	cXOQhDqAVGbMu7XLZ+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow1By-0044TZ-D8; Fri, 18 Nov 2022 13:14:02 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow1Bv-0044SO-Gv
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 13:14:00 +0000
Received: by mail-lf1-x136.google.com with SMTP id s8so8139371lfc.8
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 05:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/mC7g00gLN2qAMlY7fOURh7m2CYVc3PZUkw88havBT0=;
        b=KUfK0birxVBcDUOBbE0GJqnRaBPKLSm+SxEy9mV65Idlfe+gcbMO4qUSlfx9puhdTS
         zhTCV8yeu7coT9jsq8qymHCvanzzFG5KEdDLyrJikxS6fRnjg6KnMM99CGMvBaEylIKl
         OGlOwrAe0du0GT4UWEU+RHH3MPsgp6zBP4QjtzxCm9eLuIPbeMbXT9Ff5qV1Rsq4Dcct
         uxpiiQbyT+bUlRqfLd2JTjkkaL35QovXHguOEIz4KpV4C3vm9+Mdz3C+Ten8ZTRy66vf
         qXiac6ILU5reQZKFFFs6FsCYEKmaabSKzCydfuV73sy0ue0mibGAgR+kZVYIRq4HSTK4
         hDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/mC7g00gLN2qAMlY7fOURh7m2CYVc3PZUkw88havBT0=;
        b=iQyBtZtERdujT/uK2SJa7yaeHIAX9S4jlTIssnAWGMyIgxI8Xcrige/HCQCF1QzdqK
         kKzVTrSTWmG5b7LR7dhoiEcAoBGOUEKMiu4a6CbPaK2LJBQQjtnWMUgXKnEnNiK1pmmZ
         l78FQDT+BY38IhYIgYWrzIKWbTtSM/FyEOJSO9NmZFsZKp04Y/qrNB5bPZS8MnmvZlnr
         uOWO1Cw7qkUKwMgad/VcwANGOJt7R3P6yF66O36D+Hmp/xK6fd7w3xXxcGtgh5zTU5w2
         JW9SDPUr1fKY+3wt1SXQEwc6YUBYEyRB8FkUyZ/mFATKaCS5t5dU6hBj990fHpnaeUI7
         Fdcw==
X-Gm-Message-State: ANoB5pkNKcbo0nUS7ElfAmM6wGopfmTE4rvw5gS3fkBrvlnS/6CvMu0X
	/rhRITP4QhwubzMT37fRHoZqQB1xdO2YZyJS
X-Google-Smtp-Source: AA0mqf78HbKGQTDOE4+BiDimvNgdVBquA9KsjqNs1WBwaWJLdYE6jZKT54YGJ6xe8zDTOOCYp1M5xg==
X-Received: by 2002:a19:4918:0:b0:4b3:a78b:2e7d with SMTP id w24-20020a194918000000b004b3a78b2e7dmr2359952lfa.363.1668777235606;
        Fri, 18 Nov 2022 05:13:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g23-20020a2ea4b7000000b0026dce0a5ca9sm649802ljm.70.2022.11.18.05.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 05:13:54 -0800 (PST)
Message-ID: <1707d9f6-47bf-c611-7484-7bcabe3c872b@linaro.org>
Date: Fri, 18 Nov 2022 14:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/8] dt-bindings: riscv: Add StarFive JH7110 SoC and
 VisionFive2 board
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ben Dooks <ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-2-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118011714.70877-2-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_051359_593936_1564247F 
X-CRM114-Status: UNSURE (   8.25  )
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

On 18/11/2022 02:17, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add device tree bindings for the StarFive JH7110 RISC-V SoC [1]
> and the VisionFive2 board [2] equipped with it.
> 
> [1]: https://doc-en.rvspace.org/Doc_Center/jh7110.html

As Conor said, I think Links are preferred. With that:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
