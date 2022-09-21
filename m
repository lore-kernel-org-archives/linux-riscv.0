Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D043C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/FYL2yXOoxNKjhIWaDXL+8Vn9a+oJURYCuBd9z5VPEk=; b=H2J9c5sx7a1plL
	tpl30PxGvljN787FKg5uejRBUAX+VG0UNEllo0W2A6IYemDR92zkBV2yGr5UjeRsg/l7VJ/E/HJn8
	SYyodYzwckBOcBZIYkkuAKh3TJ6chPbaWu8bB/aVJp/AjY+iheUcYTU7VKBCJVeoP1Ze7wEvjwL3e
	Rd1k9ID/wdsgoxnFw9vQyWxkscS1PW1nnjQXXKdzyRztUgtM9f+SyZ6U68xYA1ZC64lJ2iapqm5Q4
	YlONFl6TYukRFwVkM63w31FPRuKz6+pOLnKzgUgKvMue6gM1gEa0mZI7/oVR9xvzNGmxuLD/VYqap
	mIlRWIII6QKOzF067U+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaw84-00ARl8-J8; Wed, 21 Sep 2022 09:34:52 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavzc-00ANwA-L5
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 09:26:10 +0000
Received: by mail-lf1-x12f.google.com with SMTP id f14so8197752lfg.5
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ezjLW8T0NnEvujrr+yzCxs0Deq1uyAkeS9ezzI+wOlY=;
        b=sK8YpVlFRQHVPWV/D2oTHdullgr0ojORZlODvaC0y5qrYolxrJNQN/VcgFepuYOOVF
         9XzaSs1eBp+6XfFjMH6CwjqjriUOtPTSLtxtMMa10Dm5gawSXBO9YrS87Z7N6dqz83QU
         +mvP6MZm4VjD11quHXnPwd8Nl+sO/IDL7PGb+fFM2Q9kPA2QOZzSP0v4ju1W63rvSsK9
         1jHqXNDT1fSn//4eN12bTKbuxMH96XAzatxgylqGStavXz3AC/RRamnSr/f/x3XsmasM
         +A7Mj5TpRHkH67k+fMl3obmniN/ViMfReMVR0tjwXBcq5Ss63imtx9fsfkyKPZaQ+O80
         UjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ezjLW8T0NnEvujrr+yzCxs0Deq1uyAkeS9ezzI+wOlY=;
        b=zXYDsGYqEb7XG+FvV4PVSUZBAVjbXG0uNDutMNcYyxDUKArC+DVnJ1oUzB7Rnjk0Yj
         2x3cmqHxCkTspTGV37dPSNHeSbwEriu6KNYCBnImYK+kRSlGrbwpPK4t2kLXqYXKQ9Mh
         kENfEwswH2XRnw5Yq9JEJQm4sh2SnxSD0oGCgfW/OP03QwYyBNOFoFC78TjI3sD2mJH5
         Jp/9WA9vswKL1KwFEhYVRepa6eKoFZGqFg3JBnc//u264A2F7ts0ROZJl7pEbfWVsIuo
         dn9lRz3dZGabcu/dTW1hWRzygZJIXKjsSEMOS62p1SvGmEeta+PcVI643bHFMqG9lv0B
         7j+w==
X-Gm-Message-State: ACrzQf1RTguDyqp+Zm213v4WPO7HR3pFGimrWRjBAZ+kOTBDp4cs9Akq
	eRymtW7V+stXoRtyFTNLXJ2yCA==
X-Google-Smtp-Source: AMsMyM4q9W7PZ0FNmBge0OKP6Vy5oQjiloIoQojkEylWDKl/E9ETnWbWzbw58onHa6PBPZqj2juazA==
X-Received: by 2002:a05:6512:15a0:b0:49b:1eba:89d4 with SMTP id bp32-20020a05651215a000b0049b1eba89d4mr9070467lfb.188.1663752364597;
        Wed, 21 Sep 2022 02:26:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o16-20020a05651205d000b00492aefd73a5sm353258lfo.132.2022.09.21.02.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 02:26:03 -0700 (PDT)
Message-ID: <df9ff0bd-ad0e-4b5b-859d-dd913628edc8@linaro.org>
Date: Wed, 21 Sep 2022 11:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Similar SoCs with different CPUs and interrupt bindings
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Samuel Holland <samuel@sholland.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Atish Patra <atishp@atishpatra.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
References: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
 <b0f2e13a-ff5d-5bfc-6dda-ca39bb57803e@linaro.org>
 <CA+V-a8t3ukpa1PNz=5fP+BTjWkFJmwDo_EJJYjO9YctF2=K1Vg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CA+V-a8t3ukpa1PNz=5fP+BTjWkFJmwDo_EJJYjO9YctF2=K1Vg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_022608_862589_7BDFA86A 
X-CRM114-Status: GOOD (  15.33  )
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

On 21/09/2022 11:20, Lad, Prabhakar wrote:
>>
>> What do you mean? Macros support string concatenation and simple
>> arithmetic like adding numbers. I just tested it.
>>
> I did try the below:
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> index 689aa4ba416b..0f923c276cd3 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> @@ -8,6 +8,8 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/r9a07g043-cpg.h>
> 
> +#define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI nr na
> +
>  / {
>      compatible = "renesas,r9a07g043";
>      #address-cells = <2>;
> @@ -128,7 +130,7 @@ ssi1: ssi@1004a000 {
>              compatible = "renesas,r9a07g043-ssi",
>                       "renesas,rz-ssi";
>              reg = <0 0x1004a000 0 0x400>;
> -            interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> +            interrupts = <SOC_PERIPHERAL_IRQ(330, IRQ_TYPE_LEVEL_HIGH)>,
>                       <GIC_SPI 331 IRQ_TYPE_EDGE_RISING>,
>                       <GIC_SPI 332 IRQ_TYPE_EDGE_RISING>,
>                       <GIC_SPI 333 IRQ_TYPE_EDGE_RISING>;
> 
> This worked as expected, but couldn't get the arithmetic operation
> working. Could you please provide an example?

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index ff6aab388eb7..0ecca775fa3f 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -8,6 +8,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/r9a07g043-cpg.h>
 
+#define SOC_PERIPHERAL_IRQ_NUMBER(na)  (na + 32)
+#define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI nr SOC_PERIPHERAL_IRQ_NUMBER(na)
 / {
        compatible = "renesas,r9a07g043";
        #address-cells = <2>;
@@ -128,7 +130,7 @@ ssi1: ssi@1004a000 {
                        compatible = "renesas,r9a07g043-ssi",
                                     "renesas,rz-ssi";
                        reg = <0 0x1004a000 0 0x400>;
-                       interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                       interrupts = <SOC_PERIPHERAL_IRQ(330, IRQ_TYPE_LEVEL_HIGH)>,



Or any other method like that....

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
