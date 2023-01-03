Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8E3C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 12:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWelHeBVWhVhAP1AayGO8usNN0GhO/E7tISJz5n0suY=; b=WC5S5j65Q8AfAb
	mMbhva59Vw0dwSw6uOIEmV3FinyEHnFOXBhDY5d0fJlrkFAc4FG4mdMRLjqmqvJ7XOF1XJzuEMOG9
	oXKGkARHogLj8UOMBHrs9ehiyzXYtfgcegpgVmsnYeWCcz2kFcu3J+EY/td1+Kjgl1/LMq4LI8GOa
	3mjA6KdaGEwicDzBljXc4KB3vWIyEOIBio0iWumZjGXssADVetf7dFmpySSylHR92GgqbdUOyk2Wu
	iHuP1dBs/DI7uk2omZvqK1ZNMHbkeMVDhOM+pW5sK1B1Sjkoy7XlTFQxzKj0JnWXmyMdK5kw6H046
	0acZ7SL+V9lncklv7ZfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCg3l-0018g6-TM; Tue, 03 Jan 2023 12:06:26 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfSr-000xnr-KE
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 11:28:19 +0000
Received: by mail-lf1-x129.google.com with SMTP id m6so34872748lfj.11
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 03:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kE4qqRxLpxxCedBuUJYA+jounttnp3G/CGQUAy2owUc=;
        b=Ill95URu0ok8mTKcTGS2lBtZw4eZqXOgHuXYKVuUbo61K1thYXNo+Ruh9Glym7puZ0
         zX+XPzU9HkF5NtDV9G9rXGtsfzmAOJikoXWin/OvNxtIq8uqfGhYmtrAPSEAsiU7V1Y5
         oLVnULMbddELmoYJH5P78lCIHYZt6Xd4d5rGEnQ+jRQhTspmocjmECdaqb2f976PdL2z
         TzHa+su9MOIZrwYWj4CqUurmPyIyctOCVXkevmsCzEw1W+ZEN/+9kvMz0UXZ0GelNyM3
         ylERXrH6lkJrnMQzYqxWIvb8GHGOvWjgDwWntvVljGUDLd3hptx9gakn71TA3mAo2Yrd
         L9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kE4qqRxLpxxCedBuUJYA+jounttnp3G/CGQUAy2owUc=;
        b=UABMHOkQjd2ez4V2jUYQo3YkkRdFQGRKcprsC1nrsUSHgLwLt13AO1l7uUiTo8liis
         rG9eyh0VMLqej83mauV7u1fqo8qrR2ZqToEv0eYqug559CuyxGzFgbrzRLLOMWb/ZtJx
         Q5+FUsuCot8mVrBE2wj3GAluy6wjhXq/dJouHaij7krNDo2RgJmu5L6wv72RKFDKNwUa
         SiNcZszOZkKGJ07h17AYLysjP+kAb036z7TSaCgQhNy9dHXmMlOegnYcPFilvVRX/Ejn
         pZ6fSq4dt0chZiWfMrh0XeRz9RwPY1akNETAMNQXE6FjkNl7LRUk3+M7SP8SZMn3ISgJ
         16Bg==
X-Gm-Message-State: AFqh2kr4BoM4aOJtQLSJsXTXoGX5ijvrk1ZX8NmPZgB6VuUXRStDOr/k
	/jeBNCcSPbhyUNUxW4+6nIleIQ==
X-Google-Smtp-Source: AMrXdXvivJCiSvdg7M62GVqjA581ZqA/tb1WZnOzpgmcCBvtTZ9QkS3notudi/QiV+FIM4Pn1tKE8Q==
X-Received: by 2002:a05:6512:3601:b0:4b7:13b:259d with SMTP id f1-20020a056512360100b004b7013b259dmr10839992lfs.48.1672745293524;
        Tue, 03 Jan 2023 03:28:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o10-20020ac24e8a000000b004b4fefacd89sm4798236lfr.139.2023.01.03.03.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 03:28:13 -0800 (PST)
Message-ID: <30423568-df03-1d72-81fe-3a4b33214e5c@linaro.org>
Date: Tue, 3 Jan 2023 12:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 3/4] dt-bindings: panel: Introduce dual-link LVDS
 panel
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Matthias Brugger <matthias.bgg@gmail.com>, Guo Ren <guoren@kernel.org>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Linux RISC-V List <linux-riscv@lists.infradead.org>,
 Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
 Linux Mediatek List <linux-mediatek@lists.infradead.org>,
 Linux C-SKY Arch List <linux-csky@vger.kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jai Luthra <j-luthra@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-4-a-bhatia1@ti.com>
 <85837957-f6d2-4722-7693-98c6cf932096@linaro.org>
 <32d66fb7-6c63-0985-222f-0bd3c36c165d@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <32d66fb7-6c63-0985-222f-0bd3c36c165d@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_032817_755332_AA75EACA 
X-CRM114-Status: GOOD (  19.68  )
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

On 03/01/2023 12:02, Aradhya Bhatia wrote:
> But this is throwing an error. I am confused what else could be done.
> Can you please suggest what might be a more accurate check here?
> 
>>
>>> +              required:
>>> +                - dual-lvds-odd-pixels
>>> +        then:
>>> +          properties:
>>> +            port@1:
>>> +              properties:
>>> +                dual-lvds-even-pixels: true
>>> +                dual-lvds-odd-pixels: false
>>
>> Why do you need this? Your oneOf before already solves it.
> 
> I agree with your comment here. It makes sense to only have
> 
> 	dual-lvds-even-pixels: true
> 
> and have the oneOf condition take care of the other. But, I just tested
> this and it was unable to pick-up this intentionally-added error.
> 
> I added 'dual-lvds-odd-pixels' property to both the nodes, and
> dt_binding_check passes successfully (which it should have not.)
> 
> Instead, if I only keep this,
> 
> 	dual-lvds-odd-pixels: false
> 
> then the dt_binding_check detects the error as it should.
> 
> Regardless, I am curious why the first method doesn't work. Will try to
> explore more on that.

The check for presence of properties is only against required:, but you
added there properties. Like this:

https://elixir.bootlin.com/linux/v5.17-rc2/source/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml#L155


Other way is to drop your both oneOf and entire allOf from ports and use:

oneOf:
  - properties:
      ports:
        $ref: /schemas/graph.yaml#/properties/ports
        properties:
          port@0:
            required:
              - dual-lvds-odd-pixels
          port@1:
            required:
              - dual-lvds-even-pixels
  - properties:
      ports:
        $ref: /schemas/graph.yaml#/properties/ports
        properties:
          port@1:
            required:
              - dual-lvds-odd-pixels
          port@0:
            required:
              - dual-lvds-even-pixels


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
