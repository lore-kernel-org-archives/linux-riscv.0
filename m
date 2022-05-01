Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD66AC433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 10:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mp9enpkp0HnSbZQ0GC3BUAc3IOxALco+8uYv5uCuSgk=; b=VKFOrTSSznFCsc
	n6WWOCbueohvxYL0xyyHe4BIqLZ0p4C2X4GJbJ3KPdMRl3KPjK1ndXGOERwKeHOHzlK3g0VpvH+D6
	WWa1yk4rIcazd4H6R66gdlbfvyaMVADeut7IGbF9Ub2T7Gf7opv9TXlC3fvSnRzlHm+dxWsiurgQC
	eWJIHtvCOQL1xhdJXlHGs7azMtkq1i7Ol/h956ul0rTMv7gcIC5Vn6GfsXbmD5ZK2SD78Ol9HLFue
	imK7c9E9XWuBUZGE1vc0h4C6DoHfSV2+6TTtCd9YXbx/QMq8PuIBwd8KrwZoM+xpKXsghkL+sh4zd
	yM/W2W+WBfIDY73cKZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl71W-00G4f3-MW; Sun, 01 May 2022 10:41:54 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl71T-00G4dw-Kq
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 10:41:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so7067375wmn.1
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 03:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KkYcIJHTck024cDWMgkYahLoSVBSbqWmLIuloxERXSQ=;
 b=VpvQiZcnIQNb1lS7+RdWxTPcmuzgdf0ZV27F+Ohs3IfRaSLvpM/FRr5vg2fkYGoedz
 hnrX845HpeQ9LBVEkF9PpogCa2sxZRFJ5poIYiXdjS+4+LkZVv5gqc7POgJ4rynoFfb0
 DsM2NrUVDOorG8fWjgJUlGwam2Yzh52PU2noxIPiHBTqvx/WGvQXpfyH27rBF1BzjgLd
 zARe7HgePX/8HGbhXpFP3FoS9xPAbJDMfME6ChpR2UxCJLG3tx2tGV4PEw2pw2wGFvPd
 wAssXQXQoHoLJ4s33823ZrAOdQTbtWMCfyAYceX0car/FGV9AOJAjmPWeBb0/ZGUb83h
 ELVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KkYcIJHTck024cDWMgkYahLoSVBSbqWmLIuloxERXSQ=;
 b=F3vtbDlRBCpJiDSE9tdTwnHY44gryIOa6sebKLHGrc/+WLSUuDhltaB6Bu70M2nyJN
 OTELbD2YVTWxyKLLTQSv7XHhSzNDd0v9EcucOnzS11lZYqY9Ngq01hjgglYwqqUw2IgR
 SdVqwMRMgtoh6fXIvJw3lgkfAMClWeVMwOZeWYG8ktJjCRQrdi1Kwl/ggGnpMKqrzjoe
 A8IIq4JwYiB5JEpDS5o/UnnMKB6ZGj19OQgT70mcpur+NPxy/YNaHEHDlU8fa38sIQGf
 vDv5E6YFJsUxYJUQtwBmnrCEHwbCpOBtRbaD+Z3tXzvNLzlI5X11GTYQNNl/NoVKLTmg
 SA8w==
X-Gm-Message-State: AOAM531NTbi08GgVcc2EI0jhqm1l/SqrqbaNOgUxYxTdN0p4K3LRECvK
 KarMyXVWUEiTLqDRiPCYt5yFkg==
X-Google-Smtp-Source: ABdhPJzGXEeq34Jm4TTaSQAMngCwQK7m1EFzg95Xh1Q4ULqiDjC1RSLvOdcCXm3rj9rePcnvUCbh4g==
X-Received: by 2002:a05:600c:3d8d:b0:394:3377:dfee with SMTP id
 bi13-20020a05600c3d8d00b003943377dfeemr2666293wmb.42.1651401709445; 
 Sun, 01 May 2022 03:41:49 -0700 (PDT)
Received: from [192.168.2.222] ([109.77.36.132])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a05600c1c0200b003942a244ed4sm4786467wms.25.2022.05.01.03.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 03:41:48 -0700 (PDT)
Message-ID: <6477d21c-206a-f062-793a-7dfb801aadd7@conchuod.ie>
Date: Sun, 1 May 2022 11:41:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 4/8] dt-bindings: riscv: microchip: document icicle
 reference design
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, krzk+dt@kernel.org, 
 palmer@dabbelt.com, robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220430130922.3504268-1-mail@conchuod.ie>
 <20220430130922.3504268-5-mail@conchuod.ie>
 <258640cd-01e3-2a9f-b2a5-79b2b6cc4f59@linaro.org>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <258640cd-01e3-2a9f-b2a5-79b2b6cc4f59@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_034151_734644_8CC243C7 
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



On 01/05/2022 09:57, Krzysztof Kozlowski wrote:
> On 30/04/2022 15:09, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Add a compatible for the icicle kit's reference design. This represents
>> the FPGA fabric's contents & is versioned to denote which release of the
>> reference design it applies to.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Conor Dooley <mail@conchuod.ie>
>> ---
>>  .../devicetree/bindings/riscv/microchip.yaml          | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
>> index 3f981e897126..c9d8fcc7a69e 100644
>> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
>> @@ -17,10 +17,13 @@ properties:
>>    $nodename:
>>      const: '/'
>>    compatible:
>> -    items:
>> -      - enum:
>> -          - microchip,mpfs-icicle-kit
>> -      - const: microchip,mpfs
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - microchip,mpfs-icicle-kit
>> +          - const: microchip,mpfs
> 
> Blank line.
> 
>> +      - items:
>> +          - const: microchip,mpfs-icicle-reference-rtlv2203
> 
> Why is this not compatible with microchip,mpfs?

I guess it should be, I'll add it. Thanks.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
