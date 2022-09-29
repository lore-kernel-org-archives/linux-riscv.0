Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABBBC43219
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 14:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+eceVrr89nsxj/mU7DNR0or5OGlTHcUabwza37XVA9Y=; b=G1kwVaBxDaTewn
	QPYHyjmHZ8YSstYFTgM3t1wikIxVw5EsJwIsPahe74IiBxTgHEoAJFKdwKniedxJikS+3L92MZDhr
	RLUvm2lcvs25dlnzRzJll+QVBJxwDkm90LladRIM+neYa0yPzSzVSDSMzrUBWzRNK3EoDYSrdS0jj
	XcrEufGPCYkOckQ55g3AOd9rIqhRCzZXQaLWW/cWUg678FsifAgqvFHugZFs5SeSKwMKAra55FIZJ
	ZNdz1Jc+WuVSf3GBLcp9xRc2id1fahmADXTadlWR26X+Xb4WCpTYkICuysuCnpWx1s8nEmEZeshYB
	VT2wi5z2rdwo6EhRm4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odudD-003ava-HK; Thu, 29 Sep 2022 14:35:19 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odudA-003arl-JM
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 14:35:18 +0000
Received: by mail-lf1-x12b.google.com with SMTP id z4so2556170lft.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Sep 2022 07:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=t34inL3mEURDjRNQxEKzvsxMIvG4RSh3GAtajTmRDPU=;
        b=YcWoA+b4WVs6MgkrxS21s1E18uylPZ6PSZ5jBiXNFCJXsMtKFeSe7TAehG+BiEvDAt
         tNm7tQYIU0iXAlWwSHvBwVa0zpTr7WfWQmHzodN4CF+7EWZ2hftPhJmJfjBxBFznZI9Y
         ZJf187D5qbb9H1deblpblToW6mdmEs4cuHgCCNXe6up/f2A4NCle9391cPiGRjdgRl4Y
         199RCAOgDoyAfY0IlHQ+4Bmzn+AydJ+Pa8FbMZbrsGTdsrZjaHZ4PtRFpXsA1sQ31kk0
         Ed2KbzdKjMHfitMT31tqIrj023lUxkHNrbq3BpCulX6GGQrwC8Al+ST45b3TIi3c6Sv1
         ae4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=t34inL3mEURDjRNQxEKzvsxMIvG4RSh3GAtajTmRDPU=;
        b=fo22TLIK2UwI1PBC9qzxNUy3LPYHySHqBUbh4Suu2OREbcxVzhBv9jZxl2H5izqKE4
         fT5dy6zFaIyjh6vsMjye/3TKta6Vecpm7Iu9/DsvDuRk2beMww+PLNXgNu+GLMfV/oAT
         yhBaQ1mrwRyp6gqSan1LfUsPjm/ZY5Yl/a0VybP7Y5uUKQjkkthbWkCBxae3sjLQFcXo
         GBBs+V+fnp8feaah9a3L+q1O13eualIWZrQ3J+PcMY67TRBOfGvWn+cND2dTbqIj0L3H
         czEjhjCM/p06Qe5fU4S9/+l64H9IH+xTShAcwQomGFUDyk/c/MgDe6OpaNrqgAdqWuW0
         uyCQ==
X-Gm-Message-State: ACrzQf0UYbo07CKux1We6CNkYv6PvDrx0TzkEuSVK9h7quMkaupPODM2
	8PtKsINDc6HJAIU0LDdf00tMfQ==
X-Google-Smtp-Source: AMsMyM6sdgTc5l/UsvqieH0nuKd6/kKfyFul3V7NmZ/KWsVg97bSXv9GJgkmAyeB/HeNIKQbq9MEVg==
X-Received: by 2002:a05:6512:3c9f:b0:49d:d486:96d7 with SMTP id h31-20020a0565123c9f00b0049dd48696d7mr1578346lfv.596.1664462113700;
        Thu, 29 Sep 2022 07:35:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o14-20020a2e944e000000b00268cfcf841asm725961ljh.56.2022.09.29.07.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 07:35:13 -0700 (PDT)
Message-ID: <4f39cfed-9ca2-93e0-6410-fc395376fe6b@linaro.org>
Date: Thu, 29 Sep 2022 16:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 03/30] dt-bindings: interrupt-controller: Add StarFive
 JH7110 plic
Content-Language: en-US
To: Hal Feng <hal.feng@linux.starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929143225.17907-4-hal.feng@linux.starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929143225.17907-4-hal.feng@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_073516_665126_F3110C25 
X-CRM114-Status: UNSURE (   7.61  )
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

On 29/09/2022 16:31, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add compatible string for StarFive JH7110 plic.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
