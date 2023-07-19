Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334A7EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gTT1b1JUnTH8QPUjlfdBhRzZBIKonU25MkpmsoyTnPA=; b=X1g6t8ANikbhqc
	GtzI/tmA8QM+WpO9UwljDfjUNfmn+PYHvSEZE73XYSKX0S5VSWb29CtdDUV0v73tuH7z7g4fFPEuq
	HgYGKVQOUrs79c42zi/umwuMLPpAPobAo0HVCX8XNicABQvWT6iX8Yogr4snOt21bgFaod0Ch5Nak
	QRi+diBBfvVW02Cvtckd6d7BcRobrYjLajLYMoA0CiCWWFl0EWKuXv5RpslLE6PA0u6pqtqweoYzl
	Q3V9xk3RZAwJCE/HjwDTVfNN5orZjPuOfSbMk+HH6iZA83SzC5e6e3/LWo++0J2ycrApZ7Qdjn/su
	znKu3JFHPCHVUTwZqX3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM887-007ibM-1r;
	Wed, 19 Jul 2023 14:26:15 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM882-007iZu-05
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 14:26:12 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fba74870abso11508261e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 07:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689776768; x=1692368768;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QYVunoFchPUC0OBXPo1j3FS+mazfA++aFluGXeilBDk=;
        b=ex9mlEDgIOJBoi8ZE5Gy9YUPQeUCRyk2JVGKFSKdodeYs/N/NtWwXC/vlNh6FO8dg5
         bT3XYgM30DXywlczVpCpuAXqh9u50yEYN81xkpDJSOW1dN4WyP4QVNlfZbqa5FJy6Ic5
         oaDAu4pTTv96rjmWvUDMCi2lwTXB7s+iciRxaCcQWQAOYr+FGa+2MxvtZh6qQz2CGuEL
         mDtJXY8o3skprV1mr7EbaM9fWdRyhSrhDExbBw6OKs1PoKBNZHdh0QXQMoyz2859AWZA
         Z2eDNNUeVJF4j5j98YSMGCm8kcMqiXqbDRZ61NbqWm4+JOIxpJPgNXCvf/GtdZoS2gM4
         uVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776768; x=1692368768;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYVunoFchPUC0OBXPo1j3FS+mazfA++aFluGXeilBDk=;
        b=jV2SDPyxQ/I4/A4ek2P65RV1rkeHbEggHj+kVk5Q1LYPSFC8kYzj8I9Ca38TivXGPd
         kAQ67TtGchHBtQwXQor7KunSAEBVm6Y6aJiR2OM9imL9k2+MqKWdRhlesKbAcZ3/p1kn
         Vo7oZKs3nLruDupXIKfCHXkYtMVU7ah33RCWexWtWfQ1PhtSWI5h0+F2DUXAwFr18OnV
         gHHBz+eVonw282GlocT2G6bZ9Arna4IH+OdiCs2cHG6+au73BRlatkMFX5Zdl8XdUXia
         4Gz6/gR4eSYXfpBQfwHxWv5XXQKyet2gVKl4QgLvDYWKqiJu4kncJYoWq7cFYP5S4GLB
         MGUg==
X-Gm-Message-State: ABy/qLZyTpIzfAHqicJGCIXwK9Vl0xVeqXrZSfCp1fYGCIuE46WqHZuL
	bpl6XyvEMwaMBSXEbcMcGE0AkQ==
X-Google-Smtp-Source: APBJJlGi3BabRvugk7R6rQS2y8EhvImMu4QFhIo/YCnkmRrehmGmgHtJngmJ6AEMC2RjxVfWsQOH5g==
X-Received: by 2002:a19:914a:0:b0:4fb:89e2:fc27 with SMTP id y10-20020a19914a000000b004fb89e2fc27mr5864lfj.54.1689776768042;
        Wed, 19 Jul 2023 07:26:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id c15-20020aa7df0f000000b005219de74217sm2741339edy.43.2023.07.19.07.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 07:26:07 -0700 (PDT)
Message-ID: <6c5b594f-96af-8b7a-558c-0ce244634057@linaro.org>
Date: Wed, 19 Jul 2023 16:26:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] Documentation/process: maintainer-soc: add clean
 platforms profile
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: dsterba@suse.cz
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Nishanth Menon <nm@ti.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
 <20230714084725.27847-2-krzysztof.kozlowski@linaro.org>
 <20230714135914.GI20457@twin.jikos.cz>
 <4963b85c-c0ff-92a1-e5d6-ca76f1882f93@linaro.org>
Content-Language: en-US
In-Reply-To: <4963b85c-c0ff-92a1-e5d6-ca76f1882f93@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_072610_095217_5F0BE108 
X-CRM114-Status: GOOD (  11.44  )
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

On 17/07/2023 09:51, Krzysztof Kozlowski wrote:
> On 14/07/2023 15:59, David Sterba wrote:
>> On Fri, Jul 14, 2023 at 10:47:24AM +0200, Krzysztof Kozlowski wrote:
>>> +Overview
>>> +--------
>>> +
>>> +SoC platforms or subarchitectures follow all the rules from
>>> +Documentation/process/maintainer-soc.rst.  However platforms referencing this
>>
>> Just a drive by comment, references to highly relevant documents should
>> be clickable, so :doc:`Documentation/process/maintainer-soc` , with
>> exceptions like if the document has been referenced already.
> 
> Is it needed though? The link is anyway detected by sphinx.

And it does not work:

maintainer-soc-clean-dts.rst:10: WARNING: unknown document:
Documentation/process/maintainer-soc

I also tried:
maintainer-soc-clean-dts.rst:10: WARNING: unknown document:
Documentation/process/maintainer-soc.rst


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
