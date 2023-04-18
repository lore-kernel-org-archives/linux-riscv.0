Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2097C6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 12:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmS1klz56oy0Z8/g8CybWBo1Or9IZhR8G0vH3WtmlYg=; b=ImOsJOKODTWEi0
	cpCv6prRKnDhdhfaxwrN1MufzrM2X1Isff4XT/4Bw/J3ChVkvd1aL4iJZk6WwIdv2KkaKOzi63Xk9
	lYuJcFhbqBIEY3GgfvoXSMPBL9ssvhiGL8jP3hLTWFKqpMn6ElxPyxlRSQicw2udmmZFKfL+lDlvE
	ojlxFnS0XA/bpqwjg2gWVRkofpjRIHwJA+nV5Y8zvkLGEscWEFxGwgnLmV2e4UPwgXDlMwBJxIm+y
	6ur+Dh9iMHlKd9/CAFXMCoHNhKe5ndzcp9aNxKRB/C9cWH3zGVq+628HppMuu7/htcjfVLBKEx/3R
	zxWv5LGb5j4neZOAuqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pokM8-0026KX-10;
	Tue, 18 Apr 2023 12:22:44 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pokM6-0026IM-0O
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 12:22:43 +0000
Received: by mail-ej1-x62e.google.com with SMTP id dx24so28640124ejb.11
        for <linux-riscv@lists.infradead.org>; Tue, 18 Apr 2023 05:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681820558; x=1684412558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9NCi64XGNvnIcRoPfYbsVQEhFpTLdIc0VlKvzW5v7qU=;
        b=maFFAOMtTbJViPc8gHoncMZVt1U2Au3ypnEeegMeWLUYOz6jdNkKS7yJLBivFHX7J+
         jeU/saqkWGkaad+b3a/AkjcMbAsLUZNS+KdH5D6U92eyJMJ/oeHuW9kyfBN4dYvlR6dg
         tyJ0Xsiax7fTOTj2z5GhwpsK/PY8T5SvFWA0JIaKYVoVrj+hE2izgsjeVWS4sope6xdO
         Vl9l3xhodT7SzE+rpu4QOMchQwMFpLLw+ZTXH8vUdwS5eMjzBTHwvmkTqKGMJR4hSYAF
         /HCx5yMn6FXudnjiaHZz4m4/Kd4oEFC8yPXzZSW9tQgp6iBj79h0aGxj2ERsNK8TepBO
         iy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681820558; x=1684412558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9NCi64XGNvnIcRoPfYbsVQEhFpTLdIc0VlKvzW5v7qU=;
        b=bTK2hOy21CoiP9qu0i1CeTwnn+OSs1odHwIZ0dEMkxYjAGwgU0Dhpw7tJOYpMlhM2l
         R3EyfSgwXsUTHWovpVHm/HJbjV+INWThSg/hxx2Jp8lHsj0jax2I+AeFVvCAzYZscFj1
         J3X3qtLbREpU0RsJN9ZfzOOYVVx6tIr9+7jSqwLWDPMjL+6ZRRXAQq8sNr78FM0mxOQN
         WiM4mUr83jHEHLnt94k+PllzO+u6FJow/Af1nht1iOUbI/pmM6TcPNBSWPYkGPKU26VS
         2CfCn9OIEwsGR5hIEnfRS4OrSWIaG6RgGO6XSxcoEyh+87IZ6b0RGBBQ836a9i+nz76Y
         d7wA==
X-Gm-Message-State: AAQBX9dOjPikDE2Z5oNcKzlkHmP9b/i+mBVeexAHOsVKFzB+qy6PkWi0
	5N4efTBpPyZCTGSHHPtXsrUHdg==
X-Google-Smtp-Source: AKy350b1rlGbHV/ZqnW3dz26WRMbmKf54LQJWDdP80OW6WaojgFD3laTViuXV1OQzbIbItrUdqokLA==
X-Received: by 2002:a17:906:82c5:b0:94b:88c6:9282 with SMTP id a5-20020a17090682c500b0094b88c69282mr12465494ejy.22.1681820558103;
        Tue, 18 Apr 2023 05:22:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77? ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id rx22-20020a1709068e1600b0094f968ecc97sm2278664ejc.13.2023.04.18.05.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 05:22:37 -0700 (PDT)
Message-ID: <c79e7d05-0b62-40e6-0864-35b2821c69e7@linaro.org>
Date: Tue, 18 Apr 2023 14:22:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 0/7] Add JH7110 USB and USB PHY driver support
To: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Mason Huo <mason.huo@starfivetech.com>
References: <20230406015216.27034-1-minda.chen@starfivetech.com>
 <517670ca-ba2e-811e-3eb2-7f38011c9690@linaro.org>
 <985d0a57-1fc8-5725-4d3a-33dcc5d49d67@starfivetech.com>
 <5953bc83-9609-6d12-7e9b-ca5202151fb3@linaro.org>
 <a75ed45c-55c4-ff94-86f9-313ec79720ac@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a75ed45c-55c4-ff94-86f9-313ec79720ac@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_052242_155410_20850861 
X-CRM114-Status: GOOD (  10.19  )
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

On 18/04/2023 13:12, Minda Chen wrote:
>>>>>
>>>>>
>>>>> base-commit: 0ec57cfa721fbd36b4c4c0d9ccc5d78a78f7fa35
>>>>> prerequisite-patch-id: 24a6e3442ed1f5454ffb4a514cfd768436a87090
>>>>> prerequisite-patch-id: 55390537360f25c8b9cbfdc30b73ade004f436f7
>>>>
>>>> fatal: bad object 55390537360f25c8b9cbfdc30b73ade004f436f7
>>>>
>>>> What commits do you reference? How are they helpful?
>>>>
>>> I use "git format-patch --base=(commit) to generate patchset.
>>> Maybe I set the wrong base commit.
>>
>> How are they helpful if these are private commits?
>>> Best regards,
>> Krzysztof
>>
> base-commit is not private commits. 
> I should set base commit 197b6b60ae7bc51dd0814953c562833143b292aa. This is 6.3-rc4 commit.
> But I set 0ec57cfa721fbd36b4c4c0d9ccc5d78a78f7fa35. This is 6.3-rc4's previous commit.

You missed the point. I am not talking about base commit. I am talking
about your prerequisites, which are useless. What can we do with such SHA?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
