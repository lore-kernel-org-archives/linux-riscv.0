Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED3AC00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 08:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0gPLKbWn3HLJ6U2qm2QTW8U0U5Oqt2KxgQBRINTU2g=; b=ATgFntjcH2TIYN
	wq8FVy2VF1OEmg7m/3mir+QYysPrw5FmF6fY5Y5rsH4TaLu5kH15X1h+s9aDhZ9DZL70gekSehwRt
	trsk89Tp17YK1k3Tly64dFkG43oKoHBKym5UtqljQ2UsXr4+ELpUCO203YCH8iDKOkSpqwWbo6CEc
	qnY03ba6LmPmTlX7lt8IN1XXe3JUj8w2oMKtz2KMIRNOq//TpRh2PjHAlx2+PVphjAWeIfNpvIpSN
	QAYwvOGe5WuhQWcfLwqmeYOxLKtzLHi63cxYWwy2zKiQQlDj17jb3yCkv4d11vS4YTUDLzH3EbKtw
	3fGwzO7GeoVudz872pnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPf3-002QTd-B0; Fri, 12 Aug 2022 08:04:53 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPb3-002JUD-2s
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 08:00:46 +0000
Received: by mail-lj1-x22a.google.com with SMTP id x25so206505ljm.5
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 01:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Yt5ToDvo7PMHl25yjyIOT+s5XGNpgr8e3m9LDdB/3lk=;
        b=nwoVxkWGoQL3ZHL5C6SLyDcKfVZivZQxMzgGtmJrgdnb0U4Te1pVg1rX7NYo71sCQT
         uiWwCrVnTvzkjWRTzw4u4cvXV1JPhHJWooqDclB2I6sYBSz6lQDfu0fA1uqRD8HQ1TZ4
         Zdj9b4KsLYJ1UvpWgueoOUCTk32Z6HfaUJ2QHEGw0J8f6xpC4N3pdkcs9R91rGhmO6DG
         nMHK4bXXg4tTZL8D5fSLxeKN/ZUGnJeir8urTleIswMnqCF9SDrnHHBvv2ouxXjMGC34
         /K15mlGQCaE92kvwlFdsqaKarjkuCy3yrOiLypr9QtiweOQFSTumdBUqR6ZJB2A8oVTy
         eSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Yt5ToDvo7PMHl25yjyIOT+s5XGNpgr8e3m9LDdB/3lk=;
        b=RS+hTPrtnBghg8MbjzJe98Y97cP82whOaRL9GEyqfUhNTam7JmaPDepeBIStu84f7/
         yngTyvDSmw7IOBNcByOc3JiTxaFaBEdAofuvLyGLLRG3MI02btUdI0kDfic5iw6JL/E3
         ii+5TYhCfP2Gt2okbBjx+tZeKgINQLxBc2tVF5faXdI094zsyp2bOzZQey5208vbX/83
         Yfd3D8tgVU4qW4UjW4qI6zOeBRmYnvbjmMzN3WUVAeKSqlr3zFSaZbNJyDOd0X2xhg0B
         v4x73rAgudWPPHad1BF+WpYSkFAcV3PotGTWDSb6cjFJ+UN1lQgDC9NCGF+iwVUVodPu
         ZoVA==
X-Gm-Message-State: ACgBeo3aLDqc9kjfTh65AfEMVP/Tfr28pGDNgPStSvo1akKfkPOCULe2
	RQ7i5vbICeHgls0GgkeXsBEMIg==
X-Google-Smtp-Source: AA6agR6kAd9H0uR/o1GgiFb11dAb+i11zZN3vQD+qih0eveFm0mSRk24hl87uKD/Ibxwkx+WyEHgqg==
X-Received: by 2002:a2e:b750:0:b0:25e:71da:5baf with SMTP id k16-20020a2eb750000000b0025e71da5bafmr872173ljo.166.1660291243023;
        Fri, 12 Aug 2022 01:00:43 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id z13-20020a05651c11cd00b0025e4fcadc72sm265386ljo.92.2022.08.12.01.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 01:00:42 -0700 (PDT)
Message-ID: <a9dc3a83-faec-71e0-c48e-25e16e18dc29@linaro.org>
Date: Fri, 12 Aug 2022 11:00:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] dt-bindings: PCI: microchip,pcie-host: fix missing
 clocks properties
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Conor Dooley <mail@conchuod.ie>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220811203306.179744-1-mail@conchuod.ie>
 <20220811203306.179744-3-mail@conchuod.ie>
 <99b5bddb-4a09-a3ac-e01b-d0ae624ad2f8@linaro.org>
In-Reply-To: <99b5bddb-4a09-a3ac-e01b-d0ae624ad2f8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_010045_243069_2D25D5A0 
X-CRM114-Status: UNSURE (   7.98  )
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

On 12/08/2022 10:35, Krzysztof Kozlowski wrote:
> On 11/08/2022 23:33, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Upgrading dt-schema to v2022.08 reveals unevaluatedProperties issues
>> that were not previously visible, such as the missing clocks and
>> clock-names properties for PolarFire SoC's PCI controller:

I don't think this part of sentence is worth staying in Git. The schema
is released so obviously everyone should upgrade. In two years will it
matter which version brought unevaluatedProperties to a enforced state?

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
