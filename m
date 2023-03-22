Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE3AC6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 17:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fLWOARJpMgya0WCv7Qv7GwRy3Ogk/qfXvhcf1en00U=; b=2c68SiRwVdBUXZ
	brnwka0Gb53ALb3IbGw/Dq5f8m5qdA4fYYSNB6h6PedKndciNi/MKKJWmY8ECuj60SwOiRLcWuJgu
	UcaVBLLW0S6I8EuFiD48HsaEtn1SExhUbCwkxJTXHu1i2xkK7bz+Xbh6vNLLeJ/mWZU1egkXNK9ET
	I557a3HRWdwYmPtRfvCVD6Xh54y/LMaUBFEWaEL0au4PFBotLCT6WgEroUwyIokg9rebgKJ4pmhic
	81vzfXCSyqWzi7jCxmsZZjaY3QljR7KCv3MfXG+42Vy/bvJqy3kkULz4cNw/b2bE219IDs7J2tmxU
	1uZfgPhOBmZM0yK12O1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2V1-00Gtvm-0q;
	Wed, 22 Mar 2023 17:43:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2Uv-00Gts6-0x
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 17:43:44 +0000
Received: by mail-ed1-x534.google.com with SMTP id r11so76195380edd.5
        for <linux-riscv@lists.infradead.org>; Wed, 22 Mar 2023 10:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679507016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bz0GFwOBw4FSvdCteGZo11Dbw1t8O4+71KL8pO8s3Fw=;
        b=OHOI8Z/2mnCkG1BpVa4vIPM872lkUsqnVFmvtNoXvprqmK453DF3RoKxCCkBTFmeLG
         lLGk+LcT+GomsR5UIY53XrwQwOolIPtrnVFv7t9YVjzlxnRG4kY/TNHLD/wPpSfaokiY
         Orxpz9nzQc3haBs0ggypW+juXJ663D0kdfN2LmYI6H2FUxycUsiN+663lEdkAxYQ519N
         0k0z4yPhkn2rbgzYAfUEpeIgfYjMYVHdjf3ia/niqQLKHepo3AGDUfRCd+NWfgGanzy1
         Vx7xyC68Azr7wFQqeAhCQhZJncHO5CsPpuS/bcYpWqyKyRJk8b3kPZyAaRaqxZgojD4j
         ipXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679507016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bz0GFwOBw4FSvdCteGZo11Dbw1t8O4+71KL8pO8s3Fw=;
        b=pRypejmd1CU6RIjg9RZ4bcXQ7CpZtco4Zwtb7qHMxu8rcle8BDBVgYp0t9VPw9tNmR
         ojOvlfyv7xdxYifSXm/dSyHm+pNh3rCpwRLsIHWYa7QEsCOnbzRfIaW81AB1igSbE53g
         WrY5Q7qSBMiX3bNGEay1lM0oFXPbBEMhB2GZ+i0nP9q7OByN7CEpreFdzFEQcp7CPSho
         N0Mf3ap+h4lN0pctaXjGXT66yVjAw4AcFzpYUhPrEH2CB3xvxFRcaET+TF1c6Gjicz1T
         faNQv8aGDDMHSag/kJA3uVcMJpM0TeKaYbkfqIGpaJywyDtAz6xbH54ysT5GG7kqu8uE
         NFww==
X-Gm-Message-State: AO0yUKXP5eW2IVue9itiQaA0EazCdqlow4ofjOVrq7zhajTnPI0wMnxR
	qRd/6aN7rONPbh//lVWdvaszqA==
X-Google-Smtp-Source: AK7set+nkmtoqjYEzZaku0D/7qQI5HO9as0edhrib1GD9nZDSZ9uxRhZ1jH+E0y8NuK4755/15GYjw==
X-Received: by 2002:a17:907:7050:b0:932:b7ce:27b4 with SMTP id ws16-20020a170907705000b00932b7ce27b4mr7503749ejb.27.1679507016059;
        Wed, 22 Mar 2023 10:43:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id bu6-20020a170906a14600b00933c52c2a0esm4959743ejb.173.2023.03.22.10.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:43:35 -0700 (PDT)
Message-ID: <af57ecdb-5f06-9a5c-30d2-0bfd71c798cd@linaro.org>
Date: Wed, 22 Mar 2023 18:43:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: mailbox: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michal Simek <michal.simek@xilinx.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230322173449.3970718-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322173449.3970718-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_104341_399880_F7F013C4 
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

On 22/03/2023 18:34, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
