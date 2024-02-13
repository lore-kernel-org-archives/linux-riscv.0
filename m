Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C669AC4829D
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 03:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YREeTfSSUpYFQx4lVF/m3QmFW6wnjUy7LlmbLpKzdT0=; b=2wfeiZA92Wdn1l
	BdIOh2WscQMe0eYIh5IEMwuAyGbQz734RDl0xgGqSg6iAxwqkouax5ZoLfgA5E3Aml5pYB+1Dqyhb
	H8YXeKAQ1I7i/Q3OQOcNn31k9xGZheKAH3dNiFjLqLClds8aVOgu3Ed7zZuKBrVpNfS22Uj8pTr9c
	PJCSAy8wKaNZUM9mwcR32C6/moPcJSttv6Kc37KI7vFDOY1SfEZg4piMtuqWk1k1BUgvW3yISpGnz
	+8TOv8Q5w7w0vpu0WlRLAkVw4OI3Xlzq2gsYoTYSEV2FrUtcLJgjqSSPPWpK5O+672/OygI4ZAy2n
	rU7zxu9pOHNw9vptK92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZjQE-00000007qSL-2sSb;
	Tue, 13 Feb 2024 03:25:26 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZjQC-00000007qRy-1E6m
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 03:25:25 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-42c754ddbdbso12079261cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 19:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707794722; x=1708399522; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=if1pmLTRVcuqiS5WFrEFaB+wVVF4073IHWC80dtkSxU=;
        b=eachIbwIGGDSPotEedDZWC+oT1UmUMjSY6X8hNGjt/g6G13rpqrqcNcrSuMfmZeSfF
         XS9O2LCFEw/bl/ABLzVC9CYWhacnHt9AnXIsXrRckA3vWnqnXAJJSd84E6c2+O9JJzFw
         uBPZ5YAwAFYTRwKFLUUPvLgk63aI7Cn1eh09DCQszM0RodZhSKhutUGAXfIGNKOO6nQY
         jnLpcE9Nh3BDsn8nYE+M0uqq8j0YlNZkFFCswdQ9r9utyEH56hgGIRywEt6EDBzA90J4
         RrA58dQjOd0yn35XtkU8nkftlLsoHEdr2AwYY4mCN9hafOjVxaa2Bz3eIyl2oUOEpVSP
         PezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707794722; x=1708399522;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=if1pmLTRVcuqiS5WFrEFaB+wVVF4073IHWC80dtkSxU=;
        b=wIO0UPD0AIXiqn3O6BjwDiKUZj9JRb6++71gmT4LOK+3u47U4DrAJ8q2GnVedS7KMq
         mgqk+0hXgaq7v+y+HMIbJZCIY4WNRsDhi00KYAzRcSKDtBMudNHVGmNPnP3C6dv/3oUV
         0xH2W1wz/qcmHqN7jI0YSsviQEcyFDLCdTql7UrTTtyeIT+Gu+4Zc4u27/bBHnayXUMx
         tuisJlKrN194xZOV+eRZhzTJbQ0Dztvd8LJsfnlBCumcHc6kKcIHX+CAr3Mp7G+dMBs/
         bVpLi2rtfOXRugCtcnokqk9pu1+/p5HdypeDw2o8gkU/BqEmtVdZ6yLF8EI2YFE6a/kc
         JHRA==
X-Gm-Message-State: AOJu0YzJEHvi+4ahkPzbpXTHcRlMQoCaeHDR8ll2LxOVqGxMPopePdIW
	Rt0EoceE2dSbofBdFOqWv0AXdqPpVq9AsWf/T9VY/ihliLUMpVo9SBS4fdJ/46s=
X-Google-Smtp-Source: AGHT+IE75L1rBHzIjR4WwTBVySu0DX1wyH/fN/xoGrEKXFF0KM/tu6CQv7/Kk/HiIQ0UN/hmyZvvFg==
X-Received: by 2002:ac8:5f53:0:b0:42c:3c54:6f20 with SMTP id y19-20020ac85f53000000b0042c3c546f20mr13275386qta.10.1707794722333;
        Mon, 12 Feb 2024 19:25:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXBGqZV4wDvnXDxxc2cMc1N1ZZswMYG/Wbwxt7v1ZN/KLBlfkAF7pU/O5lCiyWAeGtDH1OAtyC2ZhnHUPSq62pEkGZGzXRVK8oa8SzX/sv7Bj4xKlTEXbsia2AYBrvzdPtgWXFDmygyqzZPDcQ6IgeG+8Yhyv0ICa9nxQbbDmiJ5aV83xX+sKR/ysHCcA==
Received: from [100.64.0.1] ([170.85.8.192])
        by smtp.gmail.com with ESMTPSA id p20-20020a05622a00d400b0042c72e4074esm753096qtw.56.2024.02.12.19.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 19:25:21 -0800 (PST)
Message-ID: <ca69d83d-90e9-4401-bac2-1782cd4e2318@sifive.com>
Date: Mon, 12 Feb 2024 21:25:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes 2/2] riscv: Save/restore envcfg CSR during CPU
 suspend
Content-Language: en-US
To: Stefan O'Rear <sorear@fastmail.com>,
 Andrew Jones <ajones@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@kernel.org
References: <20240212022642.1968739-1-samuel.holland@sifive.com>
 <20240212022642.1968739-2-samuel.holland@sifive.com>
 <f1d370c1-a7d8-4240-a15a-a55616f5b4a6@app.fastmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <f1d370c1-a7d8-4240-a15a-a55616f5b4a6@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_192524_406840_C39AEE9E 
X-CRM114-Status: GOOD (  12.65  )
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

Hi Stefan,

On 2024-02-12 7:21 AM, Stefan O'Rear wrote:
> On Sun, Feb 11, 2024, at 9:26 PM, Samuel Holland wrote:
>> The value of the [ms]envcfg CSR is lost when entering a nonretentive
>> idle state, so the CSR must be rewritten when resuming the CPU.
>>
>> Because the [ms]envcfg CSR is part of the base RISC-V privileged ISA
>> specification, it cannot be detected from the ISA string. However, most
>> existing hardware is too old to implement this CSR. As a result, it must
>> be probed at runtime.
>>
>> Extend the logic for the Zicsr ISA extension to probe for the presence
>> of specific CSRs. Since the CSR number is encoded as an immediate value
>> within the csrr instruction, a switch case is necessary for any CSR that
>> must be probed this way. Use the exception table to handle the illegal
>> instruction exception raised when the CSR is not implemented.
> 
> We support non-conforming extensions, so we can't assume that if an
> implementation does not provide the Ss1p12 extension which defines senvcfg,
> the corresponding CSR number will not be used for other purposes.

Yes, you're right, I'll do this for v2. Though this does prevent us from
supporting hardware which implements senvcfg but not all of the rest of Ss1p12
(e.g. Ss1p11 + Zicboz).

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
