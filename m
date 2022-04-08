Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642E6C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBC4xHwZ4fAOGlB3XxvTh9kDznLIsLYD0xz4LPTsYss=; b=go89O28LwCz6Ts
	LtxpKNNRBFP1t+IGftIggQpr0ok6lIoFoq6qnyWY6m4d3zRkWyQ9/0SLOIC4VxAMonXMb7jyuHcZf
	Y/CA91MhtaThdMustXrvOUYs0T1JtxfsMeoJKyXwDQMmSjR7ll6bJ4t50B7rsIkC2KAVEMiKDpFZ8
	McOnSw/O9n7SvmQpMkRxKV/wMjkQgvJIuZ4R1pdIPI/dbl3mRkJZIIqQcxBim0+alVg16nkk6qR8k
	fHuCBVyvKP6EDzCe+KUi6AJaTKV79zzGRRxxLZYIUx3VBVq44wOx+2qFoqyAXuxC0k+xiYRmjU9cV
	A0AA6Xl9Pwdpp8mAvx6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncqYZ-000I0f-Vu; Fri, 08 Apr 2022 15:29:52 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncqYJ-000HtS-7G
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 15:29:36 +0000
Received: by mail-wr1-x435.google.com with SMTP id z1so13462796wrg.4
 for <linux-riscv@lists.infradead.org>; Fri, 08 Apr 2022 08:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ifY6DMbLg1SCliDlEYY8vn7YQNz7rwzE6gWMsXWpwWQ=;
 b=f+pyN4QcTJS1ikUlp6zjJcPGoEm4rBGxHM19/nqQZbVxnOqEcOk2tnU1AWTctJfUBJ
 fv/a+ioFkF8LckXVZPc4njJ05ACyEe7V2pw8eBC9HuIGeKsEUjJtdKrcOq5XKn/Nedgy
 MHpAJG7Ww/lDRZHMBeJj3zDtNFQrJjDPZv2aki1LdrTy1FIF3azC8RVqVNXxL/yCBmMX
 AUV/MQTx+o96TemNGq3MEXkq+vSI2R841mjlTLWdta3s3sw1pNv/75mudQVfVyEGZyBa
 0F+N0emulepgjY3lCG0t36N9cFBgVe/dxYBjr8T5HozlaUYA0BJKml00E+I5AQk+aWOM
 RGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ifY6DMbLg1SCliDlEYY8vn7YQNz7rwzE6gWMsXWpwWQ=;
 b=mn3NL0btKhgqis4+rmKwsna5v06j3ZCQQpUZsKA5tsfcLYpy/FJvD2M56y9IrZpvvs
 KwCDoJ8F+uLG3lFYATGFbMEue7B+p1fuIlQLAn70chbjBV6OWhBwJ4txqazvWzzbPECa
 dWyO9zPTbHyyP9lpJCiL1RlL4sP60IEd0IOMaErureZkOhq2jSJr71oYPE4vb4E74bzc
 TGTaazw1dx0MfEkaRpPVS9tzNivY0p2hnmAcho5paAfvdX0cVZWL6QcoCy7ekZdVZnCL
 E3yAoe29o+v03FvS9sD/aHx+ch8p0mtrAoswqAsK7Q0fweU2a1f52g7XcWqAQ2v5PH1N
 ADWQ==
X-Gm-Message-State: AOAM530oZ6RgA3IlDA3JG/s7Fe5Ocva6V/+imW2KX/szvPUkqdqoHL/5
 GHTJbzj1Td6QvqEi04pw/lEjUQ==
X-Google-Smtp-Source: ABdhPJze7wG69pOLr7bONpv65bzq93TZexBOiF5c8eNlAqorPQ/UAQk7C54nPkcIOHDXC/mmjbKaaw==
X-Received: by 2002:a05:6000:1848:b0:204:e92:5af6 with SMTP id
 c8-20020a056000184800b002040e925af6mr14917867wri.180.1649431770416; 
 Fri, 08 Apr 2022 08:29:30 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.209.28])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c1d8e00b0038dbb5ecc8asm10965530wms.2.2022.04.08.08.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 08:29:29 -0700 (PDT)
Message-ID: <cc11d576-3670-ff0a-e0a1-e92780a04c2a@conchuod.ie>
Date: Fri, 8 Apr 2022 16:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 0/7] Add rtc refclk support for PolarFire SoC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 palmer@rivosinc.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 robh+dt@kernel.org, krzk+dt@kernel.org
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
 <1fa15b36-7a84-e0ac-2c56-d6a2bec566ff@linaro.org>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <1fa15b36-7a84-e0ac-2c56-d6a2bec566ff@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_082935_526334_8F067074 
X-CRM114-Status: GOOD (  17.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 08/04/2022 15:57, Krzysztof Kozlowski wrote:
> On 08/04/2022 16:36, Conor Dooley wrote:
>> Hey,
>> As I mentioned in my fixes for 5.18 [0], found out that the reference
>> clock for the rtc is actually missing from the clock driver (and the
>> dt binding).
>>
>> Currently the mpfs clock driver uses a reference clock called the
>> "msspll", set in the device tree, as the parent for the cpu/axi/ahb
>> (config) clocks. The frequency of the msspll is determined by the FPGA
>> bitstream & the bootloader configures the clock to match the bitstream.
>> The real reference is provided by a 100 or 125 MHz off chip oscillator.
>>
>> However, the msspll clock is not actually the parent of all clocks on
>> the system - the reference clock for the rtc/mtimer actually has the
>> off chip oscillator as its parent.
>>
>> This series enables reading the rate of the msspll clock, converts
>> the refclock in the device tree to the external reference & adds
>> the missing rtc reference clock.
>>
>> I assume it is okay not to add fixes tags for the rtc dt binding?
>> Since the clock was previously missing, the binding is wrong, but
>> idk if that qualifies as a fix?
> 
> Usually ABI breakage, even if accepted, should be be tagged as fix
> because it is clearly then a break of other peoples' trees...
> 

That means either a) do something messy in the clock driver or b) mark
the whole series as fixes (and roll it into [0]).

The second option seems far more sensible to me, do you agree?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
