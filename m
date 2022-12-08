Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15072C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyP+X5QTOePQ0jQLxeOjWcV4K22fOo/98nHv7uH8Ofg=; b=CTR6o0zCmA5GRN
	+dOdFlLRz8Wj+LHP4/jss6mqT8UhEZVQuns36AZ2EA+jXgBWyX6GsXWrarUpXAIs+bjOCbkUVP2k2
	ZWeQFxPvaKVvIH4pIA5pfU5SPxIGX6uIBLJvJ4Ad/STFEyB23DO7WWzjEf2y/qbh2hWzK+gtsv8T8
	u/URhmXeWey0aozwAlXgJu6LDtnrMEeifuok4v58jF4TdIfcW7jRNd1Uk3gQnGz4wRx1SzNw1nBDz
	DmNILoSyeO3Jj6Ksp6OXoX/+miK9nEU7qbt5KVRDb1k5T4PNdrrVP6kV79CIJPMuKOCUYJYWUHqeA
	lepedeF7gSAHI40FBerQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DOb-00B4Iy-N7; Thu, 08 Dec 2022 09:40:49 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DCO-00As7L-PN
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 09:28:14 +0000
Received: by mail-lf1-x12a.google.com with SMTP id d6so1123137lfs.10
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 01:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jvonNZ8hzOsUtXfMS5jsK8oAXaTdy0VRFUTiOadKcQc=;
        b=h0SV4jEnf3LUyPMrtB7fSs0oyXBjNYnC+wPkJTrEpAUXeX5sXQrly2h9pmV/BaIy6R
         wtqelKyna1vNSa6KpgOzVcTBveTYzc2S67lbmsqmihry8Rub1uAALhMl94mCc+8wYSRJ
         TGMPDgtWtHtj+W7XZmvrbtxNjfh3A6iZ3Js7OJm47H9nJGn70bbwRnzdForlH+YFf6vZ
         uMGjvfiNmEKFuHLplsEo4aYd310onrCycBoGJB2C0dzRwqMPSWFQOLNyKPxj3A/tnnJa
         bwBNmh/BRjTXp6nA+hctAfSA6i37FFHqmeT1ZdXh+9ukwlTZwr1T+PdKCqQfXNMV9fF1
         uCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvonNZ8hzOsUtXfMS5jsK8oAXaTdy0VRFUTiOadKcQc=;
        b=e6hBWRykhuC9xI1+RIzLR9X6oRrMJ5og7M4PHlZAzZ37bn77F6PZFBx6pL5LJQhtTi
         KV0VtX5S4SKYGP0kEDfJPzz8SgvWlbwLo6XyKlLZBqHmDQWQRRPRNbqgAK8oLSB7D288
         X5qrVCsPsO5vWzDdVmmCdnYa5KiduClQAASjbzHPbVm/YPke4Z0FE5bR/JzNuYiDKxl3
         WnT+a+Z4HyC9yLODwmcSutrdN5kouD+c76MsQlDKfMKbMhkLdzvyk2XOFQ9JK/kzADP1
         N4kIQ2BbCMdcemAA7JnAn1b7CvWjGIy8wvoAITtzTjiTloLILKIJhS/duRy0NczDfKFN
         RXUQ==
X-Gm-Message-State: ANoB5plNDZIk7TYfgoJQiQBk8VApuf/3Tx48W+VDdL78AbMimq4nkyU6
	hukfSXzKInh2iQPRruhIxQHFmw==
X-Google-Smtp-Source: AA0mqf7TNvjfjrF7HrYj9ZQKhyCHR8PdEUqzTgbholw8jlR+OE7FkmeYXQJ4FF00PhAzDPAROjzt2Q==
X-Received: by 2002:a19:760b:0:b0:4b5:67d8:e3c2 with SMTP id c11-20020a19760b000000b004b567d8e3c2mr6935849lff.166.1670491688911;
        Thu, 08 Dec 2022 01:28:08 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b24-20020ac25638000000b004b57bbaef87sm532100lff.224.2022.12.08.01.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 01:28:08 -0800 (PST)
Message-ID: <9c7066e4-fa3f-3dda-b939-04dfdaf73242@linaro.org>
Date: Thu, 8 Dec 2022 10:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/6] crypto: starfive: Add driver for cryptographic engine
Content-Language: en-US
To: JiaJie Ho <jiajie.ho@starfivetech.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <e1e9f1d19982493b89ae63f51e00a3bb@EXMBX068.cuchost.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e1e9f1d19982493b89ae63f51e00a3bb@EXMBX068.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_012812_906807_B1F89EA1 
X-CRM114-Status: GOOD (  11.85  )
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

On 08/12/2022 10:09, JiaJie Ho wrote:
>>
>> The driver has been tested with crypto selftest and additional test.
>>
>> This patch series depends on the following patches:
>> https://patchwork.kernel.org/project/linux-
>> riscv/cover/20221118010627.70576-1-hal.feng@starfivetech.com/
>> https://patchwork.kernel.org/project/linux-
>> riscv/cover/20221118011714.70877-1-hal.feng@starfivetech.com/
>>
>> Jia Jie Ho (6):
>>   crypto: starfive - Add StarFive crypto engine support
>>   crypto: starfive - Add hash and HMAC support
>>   crypto: starfive - Add AES skcipher and aead support
>>   crypto: starfive - Add Public Key algo support
>>   dt-bindings: crypto: Add bindings for Starfive crypto driver
>>   riscv: dts: starfive: Add crypto and DMA node for VisionFive 2
>>
> 
> Hi Herbert/David,
> 
> Could you please help to review and provide comments on this patch series?
> Thank you in advance.

You received some comments so the expectation is to send a v2.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
