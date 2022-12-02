Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3C4C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 10:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xw4kpY0H+lCcV/ayvORt+sfzspAsRp7JlimYrYbGvvg=; b=TgDN/vP8076G3B
	03rTeDfvos0vLaAuCOgeWaq5oDD94Yin3+cB32ogS1PEKrJLdZKwpdUIZPt+Bho7g5rcQGOUwawtT
	01uEnT3Sn0KShQdMHrLB24WUYkOxJ9mfN/QIcjzh3fK6Zuam2OIKdGFItNpnub+EoOMv9ifXbQUcm
	SAforeIVXhWqzD8jzi5AV7iGXoHZb/9/mmSuMrAetL5MN29/z9SLKM/V6ioSg9bagu3BfQGafJLAz
	n2envjN9sCb8Bdd4WgNpDVKCHlY6E+48waticxkCocVbGYuN1kudws/s4/9Q7NYAkph1IHCSgXOOh
	VRSSC6VXp/nHDRXPRuvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13fF-00Fkcd-UB; Fri, 02 Dec 2022 10:53:05 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13fC-00FkZw-G8
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 10:53:04 +0000
Received: by mail-lj1-x233.google.com with SMTP id b9so4993485ljr.5
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 02:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ozG/UpJ3bPaswuvxlA6GlaGwfzIvrdrSod17QPiF3RU=;
        b=VnRfxu9nNzzswT8wEXi/i183yZLJRDzC4A1K/Fiw/h2bpk3Sw8aOKG7jTN62zP4qJk
         orl6/lzBhRZ9GCycb806ntQgMFusHnDXYp8YNnYu72LcScqY0/ycnzDJfmarUJA35rjd
         o+UsA3ICCh89hAioEY5k7YQ8dAQsy4Oocqs46VFNEZNBdCDtz1BDMJtte9QpYpXEScRS
         rpvuuHQ47yCpXaboEhGzSEt3xZIHgXUlhslFK1jy2sNWUiFUyOew8e0Emwq59QKG236Y
         VkNClbkGA0sP43zbSRdGjkEPyAYIv+5+N/fpuUA25N+1UaGQUGDFPDv7m2ASEymVG/Z/
         YScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozG/UpJ3bPaswuvxlA6GlaGwfzIvrdrSod17QPiF3RU=;
        b=fZyZw4V/Y+mgtztDsNUgp0xLUh7OtfsDP+Uq1vGYxBUZv32XGiBbzQE5Dl4f4J/w0f
         Sc4/RUQnLrQRg6hKfKu3kD5Awixd43Z8S/DDEceUe3e11ZKGO8XygD+sEIbBXP3OTuGt
         oLOt+kt2fhjVrq/IH+tTI389ZIVv1SRgHeb6yjnA7D2cA2pGRcIFMIWZG6RXMUiQaVM5
         iEFkKFJ4uY42jhBy1dQ5IrHICZ0/uyxmm4f8hQJMcQ755sqUMyq2ncftAUt0dL4TI8FZ
         NQtthwQ17nky0waoYamSWTlRZQT9Gp9xW6BrPoKBCOaaVQD98UQoUsEN1u9Pfydmr4fL
         ek5g==
X-Gm-Message-State: ANoB5pkDpKQpnOzaS+BeqgM8EpAQnPNbLDokGbueC3e+XV7r0ccd2Snw
	9KhDRDZOKVYF0hbjw+aJPTLm/A==
X-Google-Smtp-Source: AA0mqf5UDZibFF2eJbCdKm3k1Hn0SM83w0I9K8FzTMHa2/oIUf03uj7BBCTGwnQAjufz6lEHSgSo5w==
X-Received: by 2002:a2e:a263:0:b0:276:be89:5616 with SMTP id k3-20020a2ea263000000b00276be895616mr15253849ljm.347.1669978380884;
        Fri, 02 Dec 2022 02:53:00 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u8-20020a05651c130800b0026fb5525ee4sm588660lja.116.2022.12.02.02.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:53:00 -0800 (PST)
Message-ID: <624cba7f-1be9-7100-91d7-f9232c855d9f@linaro.org>
Date: Fri, 2 Dec 2022 11:52:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 3/7] dt-bindings: net: Add bindings for StarFive dwmac
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Peter Geis <pgwipeout@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, "David S . Miller" <davem@davemloft.net>,
 devicetree@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-4-yanhong.wang@starfivetech.com>
 <166990139276.476262.15116409959152660279.robh@kernel.org>
 <Y4jaQ4snp6x1oU6k@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y4jaQ4snp6x1oU6k@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_025302_582141_73E955D0 
X-CRM114-Status: GOOD (  19.69  )
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

On 01/12/2022 17:45, Conor Dooley wrote:
> Hey Yanhong,
> 
> On Thu, Dec 01, 2022 at 07:36:29AM -0600, Rob Herring wrote:
>>
>> On Thu, 01 Dec 2022 17:02:38 +0800, Yanhong Wang wrote:
>>> Add bindings for the StarFive dwmac module on the StarFive RISC-V SoCs.
>>>
>>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>>> ---
>>>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>>>  .../bindings/net/starfive,dwmac-plat.yaml     | 106 ++++++++++++++++++
>>>  MAINTAINERS                                   |   5 +
>>>  3 files changed, 112 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>> ./Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml:30:16: [warning] wrong indentation: expected 14 but found 15 (indentation)
>>
>> dtschema/dtc warnings/errors:
>> ./Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml: $id: relative path/filename doesn't match actual path or filename
>> 	expected: http://devicetree.org/schemas/net/starfive,dwmac-plat.yaml#
>> Documentation/devicetree/bindings/net/starfive,dwmac-plat.example.dts:21:18: fatal error: dt-bindings/clock/starfive-jh7110.h: No such file or directory
>>    21 |         #include <dt-bindings/clock/starfive-jh7110.h>
> 
> Perhaps, rather than putting a long list of "prerequisite-patch-id" in
> your cover letters etc, you drop the need for headers from your bindings
> entirely? Otherwise, you need to wait for the clock bindings to be applied
> before any of your other peripherals etc can have drivers/bindings upstream.
> 
> AFAIU, and Rob/Krzk please correct me, the example in a dt-binding
> really is an *example* and there's no requirement for it to match the
> jh7110 dts exactly. Because of that you can drop the header & just do
> something like `clocks = <&clk 7>, <&clk 77>;` etc and the example is
> still valid. Same goes for all of the other driver patchsets for new
> StarFive stuff, like the pmu or crypto, that also have dt-bindings.
> 
> The only person who has to worry then about dependencies is me when I
> apply the .dts patches :)

It's nice when example looks good and matching final DTS, but that's not
a requirement. Pretty often clocks/resets/domains are mocked for the
example.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
