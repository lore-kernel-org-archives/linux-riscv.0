Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABEDC83F12
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 06:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNU3o+uxYNd2rK20BPygn0Nw+h88QdMePZ3nqevnRkE=; b=vb9DFOnJsLECX9
	hZFku/oNL/MhcLSjWMM5VZ2kCrktdXALlVr31RQhoBDtReGyUWwPRKTbG7P0WvSksWHlXZIa3eTrk
	/LXytKZSSELOcCd8XYlsVVYY3sDn76QzApT0wTY6NESiBoHfa2QQoU4cJ9uOt6xrC5CtzsIwPYEWq
	+FSKm1kRwHNIpnRJV3PUZwkbwX8fLxhzMSyci7GMx5fgl2aUlAqcCqnj7VX6ljdvownqat/MvfMVX
	FBGLaHEdc2Cch6kb+S6YivmtoxSSUzXSVr44WqeuLxr9qnS4BXIGse8ZEBQN2NL98RmPJrR7qgN3R
	VOCv5pJ5ZAodXiSqGB7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaW5J-0090Nh-26;
	Mon, 28 Aug 2023 06:50:49 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaW5F-0090MU-2t
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 06:50:47 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99c353a395cso360345266b.2
        for <linux-riscv@lists.infradead.org>; Sun, 27 Aug 2023 23:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693205443; x=1693810243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rpIeeMqt1NLo0grI9YIWzRKrep1/kjmHHkzp8+x9//g=;
        b=W6uJ30dKG/Das5v/TNC5c17ulSdSZNoQ1q/3ouSW50L/psreaDvU7HhTVYreF5mrtb
         KDgpQVg6Esk3wLMRW1yvwAurQ/XS83OIUhrfbQqnm8zEciKRaSAXL35NGOz/KYSaLOCp
         0BzT6ztFDB7b4LqBXP0PpcJg0MZgd5ya1rqz1c6MxcU9wjegY0lPYvCF1MzFSLMVQIlu
         vuOQ9Xg0oHLt53r/uKZlc8njQi7wt+59M9bXxJtBlKq/2l21doKx26kBRTphlgYlp0jv
         aFD7KjNyUzjYRdLHqFlbbTszP1Te+0HIhexT/RJtkW3dWtyjNvySVrPli8OuU9VdNTJE
         Clyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693205443; x=1693810243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rpIeeMqt1NLo0grI9YIWzRKrep1/kjmHHkzp8+x9//g=;
        b=KuoGhf5xZ4mzSajIlIS0cy1skfJvs0w1oqbSU3+E5+65v5ZpgDRNlzPM4Wrk5OP6ED
         Ue8kEspkkMYPd9hGaQ9ZZ07BfaTCkCX6mJOzgOlkhbyrihgxpgcfyUlBWghrXTvrpMmb
         y7p9sJxpJUJ4iRz93f/NDDkD8URgjXyKewYtosH3eSz3bbfcKxXpeiL28fyLRW518MrF
         M4pYMyYQ8gAz29gLbkMDGiqEq46809/AtyKl9yHi2Sw/twIqepvUzgubG4U/P3O3bYkK
         sFPtN2szU3nsSRCOKgsh+ZJkdEtTZ0N/jQoQ9T2jPSUAWB2+aSnt3d5Rf71fJ+5YDcq7
         RO0g==
X-Gm-Message-State: AOJu0Ywk1vEJshRXK9qUjfA89H4B3Q6/HYPo3FKEgfNp8XKNPWH2AxaI
	mVZFyS7cz4whm3+SJmK78AzFfg==
X-Google-Smtp-Source: AGHT+IGurpQrZEy3X49gFow8zRA9SDTeDSsML8wtlTFlqUUBzEZvwp2Q6sQ+S6iZn45VltI8g5Hoag==
X-Received: by 2002:a17:906:cc0e:b0:9a5:852f:10bd with SMTP id ml14-20020a170906cc0e00b009a5852f10bdmr4500123ejb.62.1693205443354;
        Sun, 27 Aug 2023 23:50:43 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906059100b0098963eb0c3dsm4263545ejn.26.2023.08.27.23.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 23:50:42 -0700 (PDT)
Message-ID: <d3c9e032-e20f-97e1-2d08-9bd87691d43c@linaro.org>
Date: Mon, 28 Aug 2023 08:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add PMU event node
To: Inochi Amaoto <inochiama@outlook.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko@sntech.de>, Wei Fu <wefu@redhat.com>,
 Pei Chen <cp0613@linux.alibaba.com>,
 Wenhan Chen <chenwenhan.cwh@alibaba-inc.com>, Guo Ren <guoren@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230828-cupid-muck-130c4ef218f6@wendy>
 <IA1PR20MB49533ABEA8426D21C00311F8BBE0A@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <IA1PR20MB49533ABEA8426D21C00311F8BBE0A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_235045_984510_337CAD2E 
X-CRM114-Status: GOOD (  13.14  )
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

On 28/08/2023 08:41, Inochi Amaoto wrote:
>> On Mon, Aug 28, 2023 at 12:30:22PM +0800, Inochi Amaoto wrote:
>>> D1 has several pmu events supported by opensbi.
>>> These events can be used by perf for profiling.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>>> Link: https://dl.linux-sunxi.org/D1/Xuantie_C906_R1S0_User_Manual.pdf
>>> Link: https://github.com/T-head-Semi/openc906/blob/main/C906_RTL_FACTORY/gen_rtl/pmu/rtl/aq_hpcp_top.v#L657
>>> ---
>>> changed from v3:
>>> 1. remove wrong event mapping of 0x0000a
>>> 2. add reference url of c906 events implementation (D1 only support events
>>> described in R1S0 user manual, but event mapping is the same)
>>
>> Why'd you drop my ack? There's nothing here that'd invalidate it AFAICT.
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> Thanks,
>> Conor.
> 
> Sorry for this, I am not sure whether to preserve the ack.
> Thank you for your ack again, and I will reserve this if no big change
> happens.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
