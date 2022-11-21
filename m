Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E834C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 10:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smKSfikR/drM17q2tw8y9ibNvmuL9C6y/ZpnCK4BXh8=; b=W+igfxgXDGwAS8
	icWBzXeTRMlSUMw28/2KOVEtoEPA3IUWl4DVJL9f8H0IdokaRNT3pptovywnxnjnAZtIVyWifnoZd
	EdR+CRPWjeDOuyc7rtwQ4CGW1m+kEyJADkddJcCYfJCHfAf7epR34PRPUSfyGIbOsBX22JEQvujF2
	UlZqEEEONo4EBF1IchDTRqweKc+lA7Hr/341ZIV8P+qb00iDr7/gy/kh0lQJuIwjUbm/QWxfi3UOh
	36tq1Kf+EwJl+JnQmCkcoXYXzEpcXpMEVf1pWbep85oRnCfUNSlG9+a2b7wzqvrGcsmtlD+R+o2Uj
	hVk/j6SpxquivQFg4O7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3hc-00C5xu-3q; Mon, 21 Nov 2022 10:07:00 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3ha-00C5vk-4Y
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 10:06:59 +0000
Received: by mail-lj1-x234.google.com with SMTP id u11so13929464ljk.6
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 02:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MD0eFnpKJSt9a7kOZXqLmHR3GAtqPJd5OPMTOmPwA30=;
        b=vVoPPdxOFaAVpdRcbXYrk8rOd8x25QQwVV1h134MCb3yS1sJz0i0j68YpDZ2gOkJTQ
         pFvVUO0/uPxV649hWr9ifqSk+PBMygXL3vGHSBvaA00qOGlfd3UhDBm2oVMchcFwgZS2
         kh/O2WXzSie5SsPXd5syvldRJmlq2XSRJuhv8UPfHKKhyXjZ4zbc33B821YNb/U7fe1l
         JDo5w7eJ/1J/P8AbAF72NZFL1AClFTyuHJn5p9ZjWUmQpXuAIJmLiNz2anp3bOdT/l4y
         NKifxgTMQwjnXQSHaMJyL/zvKGDr3S7VKOGr7XxLyH69SBFPDRtCdlqQzMVI/PK7VxkN
         5QAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MD0eFnpKJSt9a7kOZXqLmHR3GAtqPJd5OPMTOmPwA30=;
        b=kkT3fIPXFi+Dcl/dOYuQ+lQHASM6qz4fUO6KRo1dqeY5CVgQnVgN86VSCcWu8ggCYs
         R/Ffc6c/mvZyWrAgQ2YuoQtWx+uC3Kyv7xNrSLWBdfeMILxTv58VQ2KQuIdWJifxmuw6
         mlsOKHS9uZgPL3BtOd9IWe0B4BIpocnaBQqtv+wZxk8HoM98N9JfUWEmMPQKEAoFB8uQ
         LQFa0gpHzP/Am7aVMBALgpcFA3P9yJCCPa7vYPd8qfI10W6MtKhTIhovvFvAs7HNk0kQ
         fdnMbgKtG9J4hfKhbj8DgRj1Ytaqd9WRelojha2Y0cRnkgsJ/RkaydZnB6eJpw7wNQkl
         h2NQ==
X-Gm-Message-State: ANoB5plJia1wCLgs/lAr9SKzDK2Pl8/ssKB6BMLxtcU6cY8LgmKcXytE
	0qjy64QA3Ikffho9vlIQP7d7mg==
X-Google-Smtp-Source: AA0mqf6sGd47yvKd+S/EeIhvTzzhdfEJwaWT6j8/BH9tvSSc9JQ5YGQ58u86ZR+VQv3r1DQtDDOUOA==
X-Received: by 2002:a2e:b891:0:b0:277:8df:88a7 with SMTP id r17-20020a2eb891000000b0027708df88a7mr5887159ljp.139.1669025214393;
        Mon, 21 Nov 2022 02:06:54 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s10-20020a05651c048a00b002770e6c620bsm1363368ljc.106.2022.11.21.02.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:06:54 -0800 (PST)
Message-ID: <daefd388-1bb8-448c-f18e-cf253737b3ea@linaro.org>
Date: Mon, 21 Nov 2022 11:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] dt-bindings: interrupt-controller: sifive,plic: add
 OpenC906 compatible
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20221121041757.418645-1-uwu@icenowy.me>
 <20221121041757.418645-4-uwu@icenowy.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121041757.418645-4-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_020658_205492_E4CAA9C9 
X-CRM114-Status: UNSURE (   9.06  )
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

On 21/11/2022 05:17, Icenowy Zheng wrote:
> T-Head OpenC906 is a open-source-licensed fixed-configuration of C906,
> which is now public and able to be integrated.
> 
> Add a compatible for the PLIC shipped as part of OpenC906, which should
> just be ordinary C9xx PLIC.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
