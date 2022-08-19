Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD38BC32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 14:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhBzoRAcnIHVjCcSyxO6oYDj171Bxeo9bgsRx48SwDg=; b=flpE1xmlqNON3G
	nEi/8J6h+JfyyPBkr4nD7pnpcPcvCL1lLr8BFgEq9FVwiMG71MxbwQkunRVSw7FGaPMxmMLRxYHgU
	DG6OpyIncoYDk1Sa1qfGmCnYQln3mtqLlciepM5EgI++w+ZF/4+W1kUwsNDf5zu9zWbSUSIVqXX+z
	k6pbzGZa6nOUkyj/XYx2i47ZpBiHDhihZCTd3UMJPO5NXMTS/T5My41CDhCYtniUb3A0pn+UCcV+B
	IcN0UUjrx6Uh/cM43AlyY13eJhBC7nERLFg3+/ESpT0QH7kO1aaQjYMCPdTkVMjuFJ2NAoSGfE/oT
	BK1wNQc273RpmREUPQlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP35m-009Xve-CA; Fri, 19 Aug 2022 14:35:22 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP35i-009XsY-PL
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 14:35:20 +0000
Received: by mail-lf1-x134.google.com with SMTP id e15so6429785lfs.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 07:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=SeHZ27XNszROnXvDUYzNdYyTiRb4BIM2jQzW5MqSyEc=;
        b=fbb2z35hagDVu/Vg+G7F5H05F7hWxuAt0ZwmlDzFzuM4i1aO4sFlU2Y00/zuyo7/5T
         8FlxQNdqmf3CE1KeZC3pwOhWFEibAmKmjH+OF9IkzzlGmMVM2bLySkK0Jyjz+90FiV4R
         db6WpvpkhZxEFJb2lhcNXg10wOC1Yg6bv+kseazCF2v3BFGbeoJDa5GEL17uqf5zHoVV
         WJFEt1ZOzRgc/MAQDMj72DDJc5KYg9GUStNnZwVF2dAdnNX6Vg/8VDTK16kSO+l5kBl3
         zSPhOzBx7G3NlCNRMTUmOOPxL++gXO14fdgr/yxsuQBLSTaOUrq/8Sr38zi8/kFOCdO3
         jCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SeHZ27XNszROnXvDUYzNdYyTiRb4BIM2jQzW5MqSyEc=;
        b=GPJA+UlWug7TTcARylUUEh1LqOtOyOXzLQ0qjBndtvbDbMVpZKWodxYIEy/JNYvMTv
         +3eIh4HDdTKhlyHQTrZNzfsFYnmZI+c+A/lDvpRj0dVi3zP/rL93IyvgdIGjt3+Te33v
         Hu3kE1EOEQ6ixiaPJIXxflCAYC14InYYsvm2zJ0HDwx5GI30KBPlv3n8CMQsePKoXnfX
         XUp8IkMKzaB7jUBotGMGMmYlLLq3YI3Ez27BX7xKkYxS721d8uxaQ3f67DbCKzAxRkX3
         WnPyTeRy8gXkeRRetKB/dAd2HyBbrfU3wFy/0OiTA7t9SF6eTzulgYUaXanA2sLneVTC
         lJwQ==
X-Gm-Message-State: ACgBeo1VNZ/JfLmY8PclKuGn2VFEkLfMng8KO8Zh53/3AAtUHnTom5PX
	lQiq32PeBW9mxRayGNTVv9ANvw==
X-Google-Smtp-Source: AA6agR7Zi6Ib+jSmmdNrH2FE8pP3qnIypeXUxNqJmIpV/7jD9ZnC1uDf4dVnk9URUxLDS2lqc7BDHA==
X-Received: by 2002:a05:6512:1193:b0:492:7e33:870 with SMTP id g19-20020a056512119300b004927e330870mr2642782lfr.37.1660919714599;
        Fri, 19 Aug 2022 07:35:14 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id s25-20020a05651c049900b00261c241d4a1sm35245ljc.59.2022.08.19.07.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 07:35:14 -0700 (PDT)
Message-ID: <200e3faf-e377-9fab-7cb2-bbea07be00cf@linaro.org>
Date: Fri, 19 Aug 2022 17:35:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/6] riscv: dts: microchip: add the mpfs' fabric clock
 control
Content-Language: en-US
To: Conor.Dooley@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 Daire.McNamara@microchip.com
Cc: paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-7-conor.dooley@microchip.com>
 <3df8d4bd-3d38-cecd-6589-ccc1be01b886@linaro.org>
 <3ffba600-bda9-8ffa-a435-9a6f94e072b8@microchip.com>
 <f3d8be5c-737b-8c71-9926-a4036c797769@linaro.org>
 <19ca2ca1-c678-c669-4214-e92416e37191@microchip.com>
 <138af26e-8e36-63a0-d3a0-5af866318839@linaro.org>
 <f8496006-7487-7b7e-1a53-ec38492dfe70@microchip.com>
 <4e12e8c3-2170-eaab-d910-f674bcc93f79@linaro.org>
 <560e80df-4819-1062-50ee-eb1d1d19bae1@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <560e80df-4819-1062-50ee-eb1d1d19bae1@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_073519_091258_A0F474B4 
X-CRM114-Status: GOOD (  17.64  )
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

On 19/08/2022 17:32, Conor.Dooley@microchip.com wrote:
>> The clock names should not really matter, so if you have conflict of
>> names among multiple controllers, I think driver should embed unit
>> address in the name (as fallback of clock-output-name) and the binding
>> should not enforce specific pattern.
> 
> Not sure if you just passed over it, but I agree:
>>> Truncated base address I suppose would be a meaningful thing
>>> to fall back to afterwards.

Yeah, indeed, you mentioned it.

> 
> But if the names aren't an ABI, then either there's not much point in
> having the regex at all for clock-output-names or failing the check for
> it does not matter. I'll have a think over the weekend about what
> exactly to do, but I think the driver side of this is clear to me now &
> what not to do in the binding is too.

Yes.

> 
>> I can easily imagine a real hardware board design with
>> "sexy_duck_ccc_pll1_out3" clock names. :)
> 
> If Alestorm made a board with our FPGA, I could see that..
> I'd buy the t-shirt too!
> 


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
