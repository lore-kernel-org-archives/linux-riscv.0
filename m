Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099E6C64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 10:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNWYL0BcMNl2YOxA8sAvZ+uEYQTICQaSWXF3wqLMIM8=; b=QGKAi9cCgG35Li
	FXfUc3JvEQlgwJkDX/h8er9+dNyjUHj90+5oU9KYwJ6CsiUeltFtttHlbmeQpgi9iBDRxt0V/8c8s
	vm8Jj+7cL2NlywcBcrgS+j0Dnalf+pF8B33eZFZHeNRXPpVzeEy5+xWu4WTQh2t6qCpqfpK31n7KZ
	XpGOTDyCBk1OdUkVVNlioIAVR1XSkY9MR8puT8Y/T0PaxYQm7NGKlZmS4t3eVVqoeMXnZqxR7t/VN
	BB4nMOQ2cfw33XaP4ekPDFFSbNRInnLGafWmOlgGp0/BEbE1QdZCCQTuNhb+G6ZG0xIC+GGQtWHaB
	sDc13uUW5pPQljEtyEvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxhR-00CqS4-Q0; Tue, 28 Feb 2023 10:59:13 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxgM-00CpqA-Tb
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 10:58:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id p26so6085070wmc.4
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 02:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677581881;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u6A2Sc2TLWOMEQ5y9qjHmMZKsT1Mi1qRqi+sfSjfpO0=;
        b=QqHiXL8xz6P0TwObJgri1HUKQUaS8QRVLWP1zU/kcdZdLcOZfuS5LDo0CS5erblAss
         i3mypQ/t5If0PlKVO61jzWGlWmhg5iEbWbVAJTt3c/96K1HPpgFdTgkGsdah4LuMTPwD
         fnCX9JgcR1J9JaLiR8LQCOAqmX0u0Hh/hRjIgiK5GzJp9UlARoRRiba8GJvtAuACohiF
         XCvoPuYjEyVDUWaHz3N/HSDzhCIf0MpsRIZzq9mUHo9ch8t7+BCyvKtKV3vDwWCdAWjW
         hm3QDZr1IgJXPvCyKzLVDXISQaIKaeMJgoaCP4/OgQK0T5wviBJNNPhoAI7f1FICoZbm
         ZqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677581881;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u6A2Sc2TLWOMEQ5y9qjHmMZKsT1Mi1qRqi+sfSjfpO0=;
        b=EDwG20waZRC21tvzICOTgOYxmBrBkfLNx4iIeoAj7KjR4V0/vi6ptedHsyqC6erNKq
         zNcP/Vmx42yWnFnk6C64H7RHO1pID60VKL1zd8t+zZsVp6LaRj87I9c93TcsxP9qOSMj
         i+LYiVpWBBzZLgwqrcKQpmFNxSzQQAHrEAbOtphZh4UkOazjJqGrGDp//yS/fUYKdI/z
         +TY7K/gQPJZstDrlz/pMEzmDA88Vnk3OJvQwPDvusZD+9kbZjJEx+rKitfxYMx0WgitU
         9L+YMNRt5eMC9NSw4WabeRFuZ/QIDxubhICyx9R3wM76yDQFyZF62qF3TSpu5GHhG3oZ
         Ypzg==
X-Gm-Message-State: AO0yUKUal+ZS+0h1rz2ElUdm0zNuoIGkqWVkRiKAFF0gZIipPOBtSqd5
	VxcM1ruFglhQ4e/SZVVL3P2/qw==
X-Google-Smtp-Source: AK7set9aj//n9rmdyGmH3/dOQnO4mTtlCGyI8o1O6rY/P5ntjM8Tk+WDegjEDx/5j8Gn/DHp/NQNyQ==
X-Received: by 2002:a05:600c:4d20:b0:3eb:2e66:8 with SMTP id u32-20020a05600c4d2000b003eb2e660008mr1731362wmp.35.1677581881467;
        Tue, 28 Feb 2023 02:58:01 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id fl16-20020a05600c0b9000b003e1f6e18c95sm16244493wmb.21.2023.02.28.02.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 02:58:01 -0800 (PST)
Message-ID: <545c23f3-1d68-2bff-89d9-584e3ca31044@linaro.org>
Date: Tue, 28 Feb 2023 11:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] drivers: watchdog: Add StarFive Watchdog driver
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
 <20230220081926.267695-3-xingyu.wu@starfivetech.com>
 <CAJM55Z823iqUqD8enM0qJ_MA3Tw94Mn0mq71fbLT1Qjo2s2J3g@mail.gmail.com>
 <0ffb02d2-0bbd-fd0d-b0f6-cb5605570050@starfivetech.com>
 <CAJM55Z_hRpUYueZ-XuWUx1NfAsL9E+-4ry9TYeRWM_bKXvym-g@mail.gmail.com>
 <Y/3coFvMWOLaaY9p@wendy>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y/3coFvMWOLaaY9p@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_025807_026690_D5A6884E 
X-CRM114-Status: GOOD (  13.22  )
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

On 28/02/2023 11:51, Conor Dooley wrote:
> On Tue, Feb 28, 2023 at 11:36:49AM +0100, Emil Renner Berthing wrote:
>> On Tue, 28 Feb 2023 at 10:44, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>>> On 2023/2/26 22:14, Emil Renner Berthing wrote:
>>>> On Mon, 20 Feb 2023 at 09:21, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
> 
>>> So the dt-bingdings need to rename, and which one could be better,
>>> 'starfive,jh71x0-wdt.yaml' or 'starfive,jh-wdt.yaml'?
>>
>> Sure, starfive,jh71x0-wdt.yaml sounds good to me.
> 
> I feel like a common comment I see from the dt folks is to not put
> wildcards in filenames & just pick the first compatible.
> I could very well be wrong on that front though...

First compatible is a bit better, unless you are sure this will cover
all such compatibles now and in the future. For many bindings the
family/wildcards were fine in filename.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
