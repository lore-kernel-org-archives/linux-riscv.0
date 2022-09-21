Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F337AECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 10:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+NbI3Uvhpeww3g/uh4l6bNV9COqwC+kgk6/D5+cVD3o=; b=S1U4bcXYsC3Xk7
	5yeMixmiYHHu9RfXppE8a3/Ng+N3hWnef65pwjxkxr+FnRx4wA0Fq/kFtwLroKHtlTo9yl3DJeQ3w
	quPjTjegxbdJ+GrFyUn85qJJZ1ma0mXGWi5n5XDn3g9ld8bPbct8EcYADJTnb3p6f0V4oeSRm1NlJ
	LFN5Ls0ji+x45c6Pd4YvyJYaArcLy4j5EoBVNtarjbRcc+1s/5ayrYmEqL1ODC07q721/9MtEt+BH
	f3tUqjBFVZt6XsJD30sBb6nV+IPR5gsjnFxVhZLIJJBOaqB9DASldtSAe/kqkYlQHp/QnNOh/JHLx
	RecE7Xx/ufKkf629+7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawng-00Ampv-Nj; Wed, 21 Sep 2022 10:17:52 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawnT-00AmlF-CY
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 10:17:41 +0000
Received: by mail-lf1-x12b.google.com with SMTP id o2so8361341lfc.10
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 03:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yzjx6E9igsuTXnzRNP3+K/9v8BB+rrIrI9XXW0kAwts=;
        b=N3jo3aH8q00MNnQwdAGWJul1Hg8tzQq8aTnbigvxcRhGj7gFPgLKkbgDiLdQRfPd58
         iF3CKoXL0ngKYxKjZFQIRaxxQzLFI+FSihQtBzKsxDkinM96LdTl6A3TOQTOOFk4nT/y
         RfsalRLJPWoZOUORCbMo4+TShCiXW7Jk6dSKwe10RrV9eJM8tr3ZDzr9DAu1R7eUuvk9
         YkWj0AvdIFK2rwI+zO1xDGMJE7v4WoHuJUTBYYksWNulOW14rcKFrSPXt/zY/92zjImr
         x7FU5Ny2wAxyZT7p7XqdkjOL27WxQt0qcgcQ7xFiiSLF6EoOOsJcOWnPrG1rlJqKzVG6
         Mbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yzjx6E9igsuTXnzRNP3+K/9v8BB+rrIrI9XXW0kAwts=;
        b=UzujpV+x4irXnXUfGOQiM6HFVpZwcqa1Tbbmq17blqnTulNJDjK1p794zbiz2UKhec
         r6Lcl3gZwpkGi1wl/55p0kV2evSKhySvjOgmLiIbZo11KAl0ueoKWBiuSeks6+8IIEdQ
         lTIW9RtWcQBgGkqGsoNLMWXKxFCwr/G/2+mGwXpyxM6PipG32nQMYGjb77u0XWNrGETw
         hNcic04ohaaNLvC9i25tjGhIqnAtqnVuI+Zu4q3gcIMqSKURP5gcRA5F1okB80EZ3Vvf
         V/1YlBmiHiE5C7e7pTquy33tHkzy3Pof2GFdC/CQBjtrlvCsQbzVOtOJP3f/7GOwdr6i
         E+bQ==
X-Gm-Message-State: ACrzQf3m0UprICRyf2BAuBAeKcnd1X2bMjmtaRZAojElZb6UJpHHYinK
	tTdGZHsAseVfAQYj50uZH5LLww==
X-Google-Smtp-Source: AMsMyM7cHVHULWLnULj9mK8sInlgIqpR3q7VVoVLlsSAKejKuWD0ZCRo9zwghPn7eLFT6gBaZ17SKg==
X-Received: by 2002:a05:6512:110c:b0:49f:99f0:5a3a with SMTP id l12-20020a056512110c00b0049f99f05a3amr5913755lfg.384.1663755455262;
        Wed, 21 Sep 2022 03:17:35 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m26-20020a05651202fa00b0048b3a92a2dbsm362277lfq.215.2022.09.21.03.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 03:17:34 -0700 (PDT)
Message-ID: <b49de03c-2d88-ad81-7bdb-a33e6841481e@linaro.org>
Date: Wed, 21 Sep 2022 12:17:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Similar SoCs with different CPUs and interrupt bindings
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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
 <df9ff0bd-ad0e-4b5b-859d-dd913628edc8@linaro.org>
 <567e9e6c-e34c-4ded-9622-9ad8387dd24b@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <567e9e6c-e34c-4ded-9622-9ad8387dd24b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_031739_490212_56239098 
X-CRM114-Status: GOOD (  12.59  )
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

On 21/09/2022 12:14, Robin Murphy wrote:
>> +#define SOC_PERIPHERAL_IRQ_NUMBER(na)  (na + 32)
>> +#define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI nr SOC_PERIPHERAL_IRQ_NUMBER(na)
>>   / {
>>          compatible = "renesas,r9a07g043";
>>          #address-cells = <2>;
>> @@ -128,7 +130,7 @@ ssi1: ssi@1004a000 {
>>                          compatible = "renesas,r9a07g043-ssi",
>>                                       "renesas,rz-ssi";
>>                          reg = <0 0x1004a000 0 0x400>;
>> -                       interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
>> +                       interrupts = <SOC_PERIPHERAL_IRQ(330, IRQ_TYPE_LEVEL_HIGH)>,
>>
>>
>>
>> Or any other method like that....
> 
> Which will generate the text:
> 
> 	"interrupts = <GIC_SPI 330 (IRQ_TYPE_LEVEL_HIGH + 32)>,"
> 
> (give or take some whitespace)
> 
> CPP supports constant expressions in #if and #elif directives, but 
> macros are purely literal text replacement. It might technically be 
> achievable with some insane CPP metaprogramming, but for all practical 
> purposes this is a non-starter unless dtc itself grows the ability to 
> process arithmetic expressions.

Except I put it into flags, not to IRQ number, it works, so I am not
sure why do you call it non-starter?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
