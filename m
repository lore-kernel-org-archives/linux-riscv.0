Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC6BC10F1B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 09:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fpwXXxMiRu41mvpoXtx4xaBT6ap5SzSrbsxhWRYxvQ0=; b=R1Xc7+ggDobF+t
	wCThxHYUiyzv8gvvhR9pqTAjaZ1FtVTVSURNzB2vgalPRgaoDP2Zom4+IEhWuqhASW3mlkYKitgF7
	yY+IaQsABtkPBU/EiOriPsX3ZRKEsIsZqZ2nLWkeLHYLqvl4BozjNE9aBbov3wwgoFO7//NM+HmbN
	ZFnZtAYnuy+I9QfiSpcbM6tpREnpKmrYWDwgwVr2wDlYCCKh5d7rVvIKFhdcPL9Ba1UWdBgkBL3bV
	Glh5fvU060Pl1AjVJGm86XZ8g1Q1gElJ4+yAcJwZSSVRWSqJVfhpI9YBNv90L2YqMqX0gtkAZnN4J
	I/bzVKXXG2JZx1leHxng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA6dC-00BtAU-Af; Tue, 27 Dec 2022 09:52:22 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA6d7-00Bt6f-UO
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 09:52:19 +0000
Received: by mail-lf1-x12d.google.com with SMTP id cf42so18959158lfb.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Dec 2022 01:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Wr97SYXbDVVyZVbytiLskD6+gchYHrxEC/WA01J5dA=;
        b=N5zZrCr5jGWU0PNc0ktwf74ghaOf/jNfXrUuqPOk+v+DzhKUAHoLFwcsXrzodnL7tQ
         cDBWqu7QlrbeuQSLhZ/0Z15Iao0JiSE7o1hMQu/NhQ+SEzCsifT0jWRx5BdChTBOTZIo
         wofxIhUW5v/oNhN8KsChmIEgqyGy8qQkGeJlQjrOPsh2UqlTI1z9drSb/cOQK8qrSB6Q
         oKQ56CBniGkDwLbMoMBOr85emDqhm6tRjKEvNz48rz0kYZPWe4S0WOeHLQp+rnfNto18
         m8OyyFJ3u9dvOfiLugeoZo2liVpuBQ/bOn2zY5aiBCdz/oP3ZjSdTU4ub3m7zx84Wmpw
         uyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Wr97SYXbDVVyZVbytiLskD6+gchYHrxEC/WA01J5dA=;
        b=f7OfSFW2jnaM+Wqi2F+n/E1lsOSjOuVJ5l5+H0xIJNQ695utyFYllXk5NpZj11EfK1
         3cdWiviGVrjkfNxW+bA+FEVUFAqMvMZBgB8ecI5PmZ52raKS98Tvs2C/ZpYxBhIYS8HI
         lhBCKnrLx54V9x4hUZ+AzN/YvR0Nr7/XgyMTW4IVnalMh8OVM2ye1aUOH9cm8rWmmy1Y
         dXX42hMlWn9wKeKjrCKZz+JNAAuYTlET3MAeNMxxnUrReGCJG9557VcNGOR/Gt2y5eZM
         93gan0RUo/myDBJDqcvgDYqZZg4YiBoJOyFSweRMvvw9UiTDgYMM2xK3c+IAp44R89Cf
         +hZg==
X-Gm-Message-State: AFqh2kpseM+EGi6efWm8AhlebUG9z07BDn8jCTaX3nOvEHSX3mAwL5cA
	tLmGE480ph5o37dU5j5Cyqt/hw==
X-Google-Smtp-Source: AMrXdXv0e2ffNVRfwokE/9RQbPQsXbBIx/hqMsDpgLFJrwc+icn7OJe/v3aXVR/9FghthYK1ObYaKA==
X-Received: by 2002:a05:6512:15a7:b0:4ae:8476:2df with SMTP id bp39-20020a05651215a700b004ae847602dfmr8295564lfb.10.1672134734752;
        Tue, 27 Dec 2022 01:52:14 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h13-20020a05651211cd00b004a2511b8224sm2144989lfr.103.2022.12.27.01.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 01:52:14 -0800 (PST)
Message-ID: <c296cf6b-6c50-205d-d5f5-6095c0a6c523@linaro.org>
Date: Tue, 27 Dec 2022 10:52:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/9] dt-bindings: net: motorcomm: add support for
 Motorcomm YT8531
Content-Language: en-US
To: yanhong wang <yanhong.wang@starfivetech.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
 <20221216070632.11444-6-yanhong.wang@starfivetech.com>
 <994718d8-f3ee-af5e-bda7-f913f66597ce@linaro.org>
 <134a2ead-e272-c32e-b14f-a9e98c8924ac@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <134a2ead-e272-c32e-b14f-a9e98c8924ac@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_015218_363886_69C783B7 
X-CRM114-Status: UNSURE (   9.20  )
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

On 27/12/2022 10:38, yanhong wang wrote:
>>
>> This must be false. After referencing ethernet-phy this should be
>> unevaluatedProperties: false.
>>
>>
> 
> Thanks. Parts of this patch exist already, after discussion unanimity was achieved,
> i will remove the parts of YT8531 in the next version.

I don't understand what does it mean. You sent duplicated patch? If so,
please do not... you waste reviewers time.

Anyway this entire patch does not meet criteria for submission at all,
so please start over from example-schema.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
