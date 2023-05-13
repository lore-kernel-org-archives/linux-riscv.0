Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7B0C77B7D
	for <linux-riscv@archiver.kernel.org>; Sat, 13 May 2023 17:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4D3DJLrYz6Tb+bY7qO8ZfEVpPAOpW1/uUEdpUJ8O7CI=; b=IzQf32OAgR+1CY
	psLSuzSA/sr9F/wWmhW8YJ+7F3hDeXKrl7aox7nuSXtSej5l91KvZcQAvKX4fMT9mKeQH1+gRRhcm
	0GlbiJlMe9qtS9SgA+Xjrmd6gv7mp4pETenus3A1tX7HF84MjSosMJ+sd2AiznZ+o2hxFtvY3Gzfl
	LFY4FX1SyvEQlv5qq2S7r6/HjgMOtt26zUxwlw+cXWwc3wKigzvPpRlc/pE5s5ThB/OOOEIzl4NS1
	keG0pLZhQSHBg+jnbk5aVMwSGnjj73CIqhG6sxpO2/RY75E4SWDrJqtUSHVqlKlq1JX4jpA5Jg53U
	zmTAb5Yh9R5llO8qPEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxtJy-00FVXy-05;
	Sat, 13 May 2023 17:46:18 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxtJv-00FVXV-1z
	for linux-riscv@lists.infradead.org;
	Sat, 13 May 2023 17:46:16 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-966400ee79aso1600402866b.0
        for <linux-riscv@lists.infradead.org>; Sat, 13 May 2023 10:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683999974; x=1686591974;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlaCg6wfPVvnZ5zFHR3mfRbKkdzjOgynrPmd7hA07U8=;
        b=ig/HK4fEcXBK96boSX0/M8jkFBIOid55UCOrLxO4HhT72Zk2uGgFQRZnb5JZAv1Z93
         zqOjGQEIJ/YBGEPM42deEpvHm+m/ftLEMqvCuLNCsYInZQD1O0u00Vg/eSYAgfgXB3ox
         9BSuQm2KrFDbgOaJzyS2N5BEe0JTbjM+IUmNX+c1m5Tsu6gDA4DKjrRxqfZQmkMEcBIn
         /TUu/bKFK4hv7Aoy7bbUwleD4aS8/4OVojSPlZ6WOpEr1/2jvPlfyDNXrBnA9JevK/7X
         oZAF89ccgg0mdKUTlCfOUCtIWsVxbieZdtefLXLyYiJI2/Ul8mNzyHRgjeomcTpO/3UH
         9ROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683999974; x=1686591974;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlaCg6wfPVvnZ5zFHR3mfRbKkdzjOgynrPmd7hA07U8=;
        b=iAsw1G52wx1URHwu9kVw6c3CI1YTFhCGe+7n0v6GcJGzMMlTdXGXJ79Y9KSwm6K++p
         bGNHbFJhEBgieLayUo6rV250TpWY2b1vz7vw9WEJfMu0rVwNA+nmbVnP0dOhJCsPP5oQ
         9SWZeLKfmO3bRyR75a3umc077vw6uA9+d/szXDB4skric291gdCBIJbusOfY0BYfksvM
         mgXc0vCK8o6aS7Z8nPQzi53+xnDn2YOv8JWMueJoj2IL0uOvqgHRdJbdProB/fPIHW9Z
         RwLp/JSi8wvdb3eC2Twq3+pLm0Tng7C+tGFXYn4IVS5adDEcUQtA8FmQsYl2jKKbrxtl
         S24g==
X-Gm-Message-State: AC+VfDzUDDBXAlqjUZwOBxw4NmpzFvN5fMGSaL0Asq/VeShBPrvxyVdo
	uncnDKqbrWB7YX2fKx03k01RrQ==
X-Google-Smtp-Source: ACHHUZ7cZcDysVWiOyMFCNt3fRkH7D+BryidKSYVMnqXBR5crck8TeH4LEA5GDhoMCX9hjUnw6crbA==
X-Received: by 2002:a17:907:9724:b0:96a:1260:dbf5 with SMTP id jg36-20020a170907972400b0096a1260dbf5mr13488851ejc.45.1683999974290;
        Sat, 13 May 2023 10:46:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bc2d:23f8:43c2:2aed? ([2a02:810d:15c0:828:bc2d:23f8:43c2:2aed])
        by smtp.gmail.com with ESMTPSA id bz1-20020a1709070aa100b0094f109a5b3asm7087468ejc.135.2023.05.13.10.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 10:46:13 -0700 (PDT)
Message-ID: <db145619-3f00-a9fe-df0f-9a1948cb7623@linaro.org>
Date: Sat, 13 May 2023 19:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 1/6] dt-bindings: riscv: clarify what an unversioned
 extension means
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
References: <20230508-hypnotic-phobia-99598439d828@spud>
 <20230508-decibel-fender-532248c8f8ed@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508-decibel-fender-532248c8f8ed@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_104615_675447_FBDC67F1 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 08/05/2023 20:16, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> C'est la vie, the spec folks reserve the ability to make incompatible
> changes between major versions of an extension. Their idea of backwards
> compatibility appears driven by the hardware perspective - it's
> backwards compatible if a later version is a subset of the existing
> extension. IOW, if you supported `x` in vN, you still support `x` in
> vN+1.
> However in software terms, code that was built for the vN's `x`
> extension may not work with the new definition.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
