Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3780ACE79D0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 11:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3cC/GvgTmxQOdnyGyVyBXMzuShfBIzaK+pGy9D5Y1Y=; b=LGiA5SrUZRGwrP
	YIsqNfV2T1DHqZTNobEuDTmA521CFaF5RQIDkALpCltBukpvJNtRvUUDJ3lbGf6eFukHpgWs2NFP5
	SUF7sx+03TOT/BFI1eQlcew3eSKRi63oCTTtbYT2uudymmO3iaUzwvQNAq/bqTPRFxbyUG/fR8ijW
	/xn24A/XM/o2LrAOtNQvOknP3BMju19Nn8ebRwIzlPbA5h1Sw0m8y326bqVakip1c2y68Iysbfc6O
	EjrSCG+oMtOV1gXrwihvj0qhyPU40c84rl6jyPOBJuPTZGOCinEntdEVNnEvi1HFOLiAOTJlY74l9
	j8k2hT6ZfvRjftd24mYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qivpx-002wcP-2H;
	Wed, 20 Sep 2023 11:57:45 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qivpu-002wZQ-1I
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 11:57:43 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bff776fe0bso64469541fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 04:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695211057; x=1695815857; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w1DviYvLqEA/sZL5Xm7Eug1cL8OIq39bt8izdUeklRY=;
        b=LxA4tAOAazxSmfnJEmvmq3eSMigiZ9shHJ+VbrWJhlmx0X4Xashd9DvMVWEHpbkRZN
         xOYNRZ+TpaVbefah8M7fON/rRHoLwsq3na6vipWrv7BFfH95zq3vAGx9yxESR2yainUJ
         06jvk0wBaws1udl7hvmoRRV39lTeudkopwG75k/v3tsZwzynu5uSLsuen1H/0iiXnyLg
         PhC562VEU2rYyo7HcrR2ClJkcz+XgxOIzIvB0NTe2hkrai0TgnUUBEyQcr107wKxFH/O
         XrNefam/dPboofghrkOf5PEsOEbLuOlPSJO1qsO5JQYOUWuJRuN84QHZSzGDMqqE6EC6
         HJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695211057; x=1695815857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1DviYvLqEA/sZL5Xm7Eug1cL8OIq39bt8izdUeklRY=;
        b=TkDdfflPbhdPZ9Fe8JmYkU/cGlEXWS6Ugy3fV0qRQOQH6KLnNop4xKpmOFY4a2RkD/
         y62blfCiyBgJTVhjb1SlhcgJ23zTmo/v1wG114KwUEalOATKg6GSuS2dVswIRXwlVeHb
         YSOpVpQOfuhqvJqtclCw3KjEELTzX0TicwPsQU4MJ/BNVs6P1P2XTzMfW1sbJVEGVrqR
         Hfimi8tbOT9V+aSpLBGtdCJC+N7AH7MalS5Xcpshj9r7uNGSh9cMmXUX3Tbq/0Lk6Fs1
         g9ODgHCsKXkNGNh6Y+h8J6zm2FN2C1U+vkwc1Owd0Iu+K+P965XWuhsk3FjEvOEiIjzw
         OqnA==
X-Gm-Message-State: AOJu0Yyu6bB4EFD0yovN0JP4SO2fjhx01ESiv0y11jFNmQx5CLq4FKC0
	f39zMeQdJF6nFjwwEC8m3fb8oA==
X-Google-Smtp-Source: AGHT+IHi2kpY9k3ikgCwNoko87/nzsnTiOCoDw3bl/xpeTq0iM230cVrxJbvaiXRPxFgp6S5vX6VBw==
X-Received: by 2002:a2e:2c12:0:b0:2bd:1f83:8d4 with SMTP id s18-20020a2e2c12000000b002bd1f8308d4mr2147021ljs.22.1695211057552;
        Wed, 20 Sep 2023 04:57:37 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id u1-20020a1709064ac100b009934855d8f1sm9177212ejt.34.2023.09.20.04.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 04:57:37 -0700 (PDT)
Message-ID: <0b84ef92-f6b7-f3bc-fd51-8f61cbc91ff8@linaro.org>
Date: Wed, 20 Sep 2023 13:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
Content-Language: en-US
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com, conor@kernel.org, devicetree@vger.kernel.org,
 emil.renner.berthing@canonical.com, guoren@kernel.org, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org, xiaoguang.xing@sophgo.com
Cc: Inochi Amaoto <inochiama@outlook.com>, Chen Wang <wangchen20@iscas.ac.cn>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <55865e1ce40d2017f047d3a9e1a9ee30043b271f.1695189879.git.wangchen20@iscas.ac.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <55865e1ce40d2017f047d3a9e1a9ee30043b271f.1695189879.git.wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_045742_441709_D6CBAC30 
X-CRM114-Status: UNSURE (   8.60  )
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

On 20/09/2023 08:39, Chen Wang wrote:
> From: Inochi Amaoto <inochiama@outlook.com>
> 
> Add two new compatible string formatted like `C9xx-clint-xxx` to identify
> the timer and ipi device separately, and do not allow c900-clint as the

Why?

You received comment about it, so please provide proper explanation in
the commit msg.

Same device does not get two different compatibles.

You also did not respond to my comments, so you basically ignored it and
send the same.

NAK

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
