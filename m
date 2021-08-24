Return-Path: <SRS0=qQBT=NP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F40C4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 19:05:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF75D61368
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 19:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF75D61368
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tr8MWOEV1S/Eh03BR/E6T77IbJCEHiE327nE0q6CvwY=; b=qGldjT5cRDIXycbYUN3Oe4iwHh
	OGFXsH3j8AHpyRYw8b0KmOENrTaJlrKcy4t21aQjfuo+oMrWGgRP3QhdWuke3T/XaADpGq4Q0uIZ0
	eB/o8r3jSamx00qXi8lVWbKyYXdbTyg5KGbqrKkMk/SjMpPY3G7qDpluuKMRHFd4dJrefBSMuZgAZ
	4vk6BoqkXYZIzlePg++Hj2g1rmib600oChfzqCqARzX1z7e8b7LgPO1JdwvMGlnmzO8B8Ukvw74U+
	iqJmU4Ton2YGr6LetvR0dXcArLwBZ6I6Tx0w+mSxiEAwHkNsQ5VYe/h9jBKQ0aAY9vj9oT23gkZat
	jqrxvYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIbjV-004TB7-EU; Tue, 24 Aug 2021 19:05:13 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIbjP-004T8P-Hk
 for linux-riscv@lists.infradead.org; Tue, 24 Aug 2021 19:05:11 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3EFBF4079F
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 19:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629831906;
 bh=imZyE0myVr/4RzrKTOaKGpxnnbHBTwOKB1lVbc5Dymc=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=cnhpg2ZWLmCR8OrIBiLeomleHCwq0FuLx4YSn3qHatIVc6m4dOUfP4p2H6+3N4ZJS
 i2x/gTxtls6I5xA0fGmcBJ9p+DYinTX9PUm0i16dcj8dJiQrfF1Ts+//SINmSjzfBt
 KT4jfK95B/y97STDk5igWpsciJQbCVGtAtA9sIotBgz3TS8kwe554Em4+ugRvBmY1z
 U/fvyBwzyQMfHV6fmPPnHkA1kdp8biNhZHNUqE0b1l/VdC6xHslPxovJQg5kCru1Pe
 mzQc0B9PAhpKevEFkdwR92jWj+62KaBD45Le8PgqRcq8yr9ZBMpPMpexndmB/ALh87
 dwDzrFuwczZqw==
Received: by mail-wm1-f69.google.com with SMTP id
 j33-20020a05600c48a100b002e879427915so908483wmp.5
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 12:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=imZyE0myVr/4RzrKTOaKGpxnnbHBTwOKB1lVbc5Dymc=;
 b=FRUEwVo8WuKkSs2ffJb2dEDicuNnVXegJCzElsIA6UmxsDES1rI5CL4CtIHU3h7UNT
 V7OxhqYtPHTNC3xyvyAC760H6KFwNVV4i29jeiEaNw4rTL+aKxK80lEizM2d3ce/3p+A
 TEPvl2PVvt50gJduxHaSMtpBtHSvtEvBIYJIcKApQqtRjs8+cp7YRBvmF4YT5huNaZRY
 WL5rRjYdKg/EGP74r8vIP8dpUyCnrmG1yhCHQCcRUyVtJZgNQcLd3UiMcwHzOguLbzO7
 ighf2sTzQfPODo2NHiCgy0mHb35EJnQodh2ST+IA8TaOUSeqoOnFfKjQUDbJsLpaVJuJ
 9dEQ==
X-Gm-Message-State: AOAM533qBsJKTGZyF3iwR/fdBjVOrWpShqqtrZi1eCn8jRkW0DuyR4vW
 RoFfCctcLEE8FKkezx3yFINjM9fVdAV+/y3QED+qlaQ0P8wuxMJQtmADeg/uUCka9K2elA4i6M7
 bsi/sfAqTb1c483YgL/Yxq4dCeFKeHTsQvnZNp+wewf3HfA==
X-Received: by 2002:a1c:7413:: with SMTP id p19mr5591057wmc.30.1629831904683; 
 Tue, 24 Aug 2021 12:05:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJza/ERSPVmnyN7SqaIwhIMDqCYelq2Xjc/rr4UPcc2KdmL1ksd3r2LvJdQvXH7L1vDQ5Ur3vw==
X-Received: by 2002:a1c:7413:: with SMTP id p19mr5591045wmc.30.1629831904577; 
 Tue, 24 Aug 2021 12:05:04 -0700 (PDT)
Received: from [192.168.0.103] ([79.98.113.188])
 by smtp.gmail.com with ESMTPSA id n14sm14742395wrr.28.2021.08.24.12.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 12:05:04 -0700 (PDT)
Subject: Re: [PATCH 4/6] riscv: microchip: mpfs: fix board compatible
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Atish Patra <atish.patra@wdc.com>, Yash Shah <yash.shah@sifive.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, Linux MMC List
 <linux-mmc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
 <20210819154436.117798-4-krzysztof.kozlowski@canonical.com>
 <CAMuHMdX8dBiYadAN8OQpds_bMbLReJy+u6apGe=RZzfEE=BJbw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <c9c9d21f-e820-de1e-b5a6-cd6054dda3ec@canonical.com>
Date: Tue, 24 Aug 2021 21:05:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX8dBiYadAN8OQpds_bMbLReJy+u6apGe=RZzfEE=BJbw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_120507_782222_6521E5CD 
X-CRM114-Status: GOOD (  21.89  )
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

On 24/08/2021 17:29, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Thu, Aug 19, 2021 at 5:45 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> According to bindings, the compatible must include microchip,mpfs.  This
>> fixes dtbs_check warning:
>>
>>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: /: compatible: ['microchip,mpfs-icicle-kit'] is too short
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Thanks for your patch!
> 
>> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>> @@ -10,7 +10,7 @@
>>
>>  / {
>>         model = "Microchip PolarFire-SoC Icicle Kit";
>> -       compatible = "microchip,mpfs-icicle-kit";
>> +       compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
> 
> I have the same change in my local tree, but didn't get to submit it
> yet, so this part is fine ;-)
> 
>>
>>         chosen {
>>                 stdout-path = &serial0;
>> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> index b9819570a7d1..cb54da0cc3c4 100644
>> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> @@ -7,7 +7,7 @@ / {
>>         #address-cells = <2>;
>>         #size-cells = <2>;
>>         model = "Microchip MPFS Icicle Kit";
>> -       compatible = "microchip,mpfs-icicle-kit";
>> +       compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
> 
> As this file is the SoC .dtsi, not the board DTS for the full
> Icicle Kit, the compatible value should be just "microchip,mpfs"
> (to be augmented by the board DTS).
> And "model" should be "Microchip PolarFire SoC".


Sounds good, I'll fix it in v2.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
