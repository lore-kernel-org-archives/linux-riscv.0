Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3200EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 07:57:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9AAD610A3
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 07:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9AAD610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cyWFxgEwjVnGU5V8v8/s/4qWYgloyrd2Mj+fpGRoFhQ=; b=F0KisWwG6LxDJWCdLjc49zWArn
	dkykiMBdUY5rOh3WCNksSXxH8Ica1d3tRgmD5zuYI3P6IaR3AGuFhk5DdI93t08IAC1as/0QW736a
	zaci7F5ggcygz4r7cEEXG/q5KfYA3Z/6surZnsac7JXXGdTrAagSQLFayvJXzkedk5dj77e7QNpql
	vaAgELJpJVV21vsAIV/sWAK/I6mp64qp6KedGHQHraOK7EAMe26N0qj+fTIM0XRZy+0sb0kDnqKDf
	ofX+bSGnN70DsFH2Qr7TTimtUF/42Jjb8Ea/RA3Ivzd762yHs02J1OpKR8Re58+QEk+Ro2+bVmpU4
	LGHpAWHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNsSP-0061ad-9t; Wed, 08 Sep 2021 07:57:21 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNs94-005wIG-4J
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 07:37:24 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0B9B43F338
 for <linux-riscv@lists.infradead.org>; Wed,  8 Sep 2021 07:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631086640;
 bh=Xl/DB/qd7Mt2jtRMD1Jrfz+4cyEFuk2xdMOwq0sPa0o=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=k2SvPHyUay0h4FfzNwRZc2WPlL4yQuzerysIENL4xL3GEhwqDsGd5BJEU5avvUFWa
 GwVkv/cDE1PweLwAqmwrC8TKd+dOOScsULLihu70n7sVO3Q8+qEfrDtwROHtsp90Qo
 umL+3b/G+VAvCkgtmTLHKNb0ErxZaZHZ8SyRlzVOknAt/P+jKqdc21lYOLK8CE2fOQ
 Y29VkM884dqyCDKTXVUICnxWjQjVyp4lKXJbebk7pieMRKBjO3piYmmDwIkwS5qiFk
 98ATDyCvTJ/MZvESZRDZb0ETT4TnOz7q8QwEqOCVclcs8mT+L7kWURKn6twoXYo+sK
 Tknh6bCkcWpLw==
Received: by mail-wm1-f69.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so593289wmc.9
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 00:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xl/DB/qd7Mt2jtRMD1Jrfz+4cyEFuk2xdMOwq0sPa0o=;
 b=MvAnQPW/gFN5SxdzQxlx9SN2HOMSk3o6M4UAUmq8cOINt4hxHU7Xn1ld3Y78I89geN
 P4OrVIwqxnbmV/3wrcz03cYNq5lIzOiaaCqOe1TB+ED+74soFr4SwzrcN45mLN2CcF4d
 YysRf2LX5p3zpkF98zziDR3nuMeWYgnGEnqN34b/csyp+ePDvrnwBYhQhBxlIdCC+44W
 chGGI88sbjYnzspJYFKDuEp/dFv7k3QSn2JC/8lUEkOqDq50pm7PhsZ7nomL5rsPUhiI
 BCW+0pAi/aEg1wIgTyxVrwjMQqoiv3DPhv+8QxTvNvmINeYGIrf42ziML3KnD6aeASX7
 mWqA==
X-Gm-Message-State: AOAM531kVjeoRiDluFUhJOlkkV5o3CmFish1j6BP/vj1yS3lfsbAECV8
 E7v2HqtQkWDJfwRIhCkKwu3O+i0GGKLff7e7GDyBQIP98nUaoZGPfFHwP52YkM37VeyBHLeelzr
 u9aMRR/r1iPHYtJ9HS2l6gRseHFBV5LVpLS+jm1KCHPu3Wg==
X-Received: by 2002:a7b:c850:: with SMTP id c16mr2134068wml.22.1631086639205; 
 Wed, 08 Sep 2021 00:37:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxT/gY/L6a1d5mGa18rZxRFI+AF2+c6swdpOKQ0gxBamkjIAd+eDg9BV8WN4geyHZLXCOsag==
X-Received: by 2002:a7b:c850:: with SMTP id c16mr2134042wml.22.1631086639049; 
 Wed, 08 Sep 2021 00:37:19 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.217])
 by smtp.gmail.com with ESMTPSA id s12sm1285746wru.41.2021.09.08.00.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 00:37:18 -0700 (PDT)
Subject: Re: [PATCH 2/6] dt-bindings: mmc: cdns: match MPFS MMC/SDHCI
 controller
To: Conor.Dooley@microchip.com, robh@kernel.org
Cc: atish.patra@wdc.com, ulf.hansson@linaro.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, geert+renesas@glider.be,
 yash.shah@sifive.com, yamada.masahiro@socionext.com, piotrs@cadence.com,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
 <20210819154436.117798-2-krzysztof.kozlowski@canonical.com>
 <YSUDTSuNlsOmu/G+@robh.at.kernel.org>
 <9423ddab-4635-ea15-7a9d-dbcf1bc215dc@canonical.com>
 <CAL_JsqKU4opYerjxXTnAuouLc5-GQQKnPX+qZEMBuzYV-inmJw@mail.gmail.com>
 <b607f187-5eee-6afa-f50a-c6532acf19e5@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <c9855c99-1240-b0a3-4a5c-9f16cee7fe6e@canonical.com>
Date: Wed, 8 Sep 2021 09:37:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b607f187-5eee-6afa-f50a-c6532acf19e5@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_003722_478450_FBD24EA6 
X-CRM114-Status: GOOD (  16.37  )
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

On 06/09/2021 10:38, Conor.Dooley@microchip.com wrote:
> On 30/08/2021 16:09, Rob Herring wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Tue, Aug 24, 2021 at 2:02 PM Krzysztof Kozlowski
>> <krzysztof.kozlowski@canonical.com> wrote:
>>> On 24/08/2021 16:33, Rob Herring wrote:
>>>> On Thu, Aug 19, 2021 at 05:44:32PM +0200, Krzysztof Kozlowski wrote:
>>>>> The Microchip MPFS Icicle Kit uses Cadence SD/SDIO/eMMC Host Controller
>>>>> without any additional vendor compatible:
>>>> I think the lack of vendor compatible is the error here. Experience has
>>>> shown that vendor specific compatibles are needed for licensed IP.
>>>>
>>> In such case this could be:
>>> 1. a specific "microchip,mpfs250t-sd4hc", which
>>> seems to be on MPFS Icicle Kit:
>>> https://www.digikey.co.uk/en/product-highlight/m/microchip-technology/mpfs-icicle-kit-es--polarfire-soc-fpga-icicle-kit
>>>
>>> 2. or a generic "microchip,mpfs-sd4hc"
>>>
>>> Any hints here?
>> Best for a Microchip person to answer, but sure there's some existing
>> compatible strings for other blocks on this chip to follow the same
>> pattern.
>>
>> Rob
> 
> #2 would be ideal since the controller doesn't change across the part 
> range, the 250t bit in the part name just covers the size/configuration 
> of the FPGA.


Thanks! I'll go with the microchip,mpfs-sd4hc.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
