Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4771BC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 19:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnyRkitw7v0KCn3Vb5Xqlrjl6dspg40egeI0Gr6FiTA=; b=3YTu0gr7ODoYcY
	FymPGa9Qdpu1H6FdLDpoFG8LTyJF4uXjvR58zTIgDCPIXyrSthIksv59rLn9TIaBoklJpIp/WlApi
	omHd6xaoyRXsFXeGK9sK3SK+xCvC68oUgP6y369rgPIIgI6e2mROEcrNdXQ99CIJdYQp6/Vvqj3Ye
	74DqvF7rte0qEr1LMj/kDB+KiPNnsJEXmCTWNgsPXoaNqoWw0xNblltXBahZ8VHAtgUEaAnww/C9F
	2eMnZzHoCobHA9aKRkIRBVuLLiCKaMIt4czNs0kKjw9Nv1w1LvlIvSUiqRQH403XV1alur7FE96Zv
	YD6eRPGXD5azPzMKLIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppDku-006HQy-2D;
	Wed, 19 Apr 2023 19:46:16 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppDks-006HQG-0K
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 19:46:15 +0000
Received: by mail-ej1-x632.google.com with SMTP id c9so1225805ejz.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 12:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681933567; x=1684525567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xnojFPy5RTEqRDct+HdyhHqsL+VmjmztLl0PLEw/hhE=;
        b=G4zRGoAv5Q40HURFW1PVwlBZ9n4aW/FztTLI1kq2TGWD8hxZfrOWbxWWdGVK/M43P8
         thq3OUWBRBj96Lr3teS+Ff5xZyY1Upc6N3MZyR1pS/b55gPjOTpzakRwYlsNC3/yq5EA
         RHo/wLpe4p3E9hnHIrrZJ4aRvFGhR5cgf5YQE0CpeMYCXkOuQr1I6cHAHt4JiKxOaK0R
         R10vbzugJdEKL2z+VRQizWV+1wvzOVAn4iNB775qbJ8nthn+Y3q573B4hYsk4mugUdYi
         ZkEBAymhzRybR+EZQwBQ1WCXGtAEB3maTu2+mJ/HP3KmXpk+UmnjzfschH8xAYRfyaCa
         CkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681933567; x=1684525567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xnojFPy5RTEqRDct+HdyhHqsL+VmjmztLl0PLEw/hhE=;
        b=URgRS7V6BgQiemXJKxO6sSI2SidKFD8ow4vsQjdxKdJezcV+k0nbcY0mCk1rH3w0Jj
         kE4s+MD7WbxTlUu4Eed/Tp+3OCCnVPpvF1krYstRTssv5tvQT0P5b8uTZR+N6RyyBR38
         u6TF4iN3ubw22AAMo+AmyjbaQZ2sKkYDbNzpkIHtTKEhiXus1OKf7TuCkln6GmnSG2gL
         oQ2MTDkrNnq0J2FWUjtwMWVTNVYTqYAlwVEFXE9zGX9gVJg8O0lO5yW9q0o0X26XQ2yB
         LbriNwJkQM8WpziF46jybVCBatBTNd7ueE+9bnwT5kszfpxxOphivcf98nMKrrf/D1XM
         CShQ==
X-Gm-Message-State: AAQBX9fRsgPVIjIOuryIvgMU5hecFEgn5qtgAJkCIfPKi/MiAYacVbFc
	Ey8J9vM1AzO3J57I5NMKNsFOfY3xZ5DO46dzCiGnMQ==
X-Google-Smtp-Source: AKy350a48tYBtw6AgdUuQuyA2+jKVWfuCW1oUOTTZQ6v9GJcRr/W2CyIfEVv6HZSYkFNR7wDckiLUg==
X-Received: by 2002:a17:906:71c5:b0:94e:e5fe:b54f with SMTP id i5-20020a17090671c500b0094ee5feb54fmr18322784ejk.23.1681933567148;
        Wed, 19 Apr 2023 12:46:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:976c:1d6c:6ed0:8935? ([2a02:810d:15c0:828:976c:1d6c:6ed0:8935])
        by smtp.gmail.com with ESMTPSA id s24-20020a170906779800b0094edbe5c7ddsm8366821ejm.38.2023.04.19.12.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 12:46:06 -0700 (PDT)
Message-ID: <689e05e5-5c1f-9417-b2be-988c6a6d4c5a@linaro.org>
Date: Wed, 19 Apr 2023 21:46:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
Content-Language: en-US
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Walker Chen <walker.chen@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
 <20230419035646.43702-2-changhuang.liang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230419035646.43702-2-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_124614_157212_83EA04F6 
X-CRM114-Status: UNSURE (   9.66  )
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

On 19/04/2023 05:56, Changhuang Liang wrote:
> Add AON PMU for StarFive JH7110 SoC, it can be used to turn on/off DPHY
> rx/tx power switch, and it don't need the properties of reg and
> interrupts.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../bindings/power/starfive,jh7110-pmu.yaml       | 15 +++++++++++++--
>  include/dt-bindings/power/starfive,jh7110-pmu.h   |  3 +++

I have impression I just reviewed your v2... Apply the comments,
reviews/acks etc from that email.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
