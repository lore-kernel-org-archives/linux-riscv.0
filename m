Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39925EB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 15:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=KWO+OPiIBrhSeCj/MJ+NU/w6e/1oLS30aZNr5Z5Nyko=; b=FSjhCXB1a6aQlLJbpCA0ZeYOZx
	lZ8cZ/SZtZYbRFJ7MMIcVIi9JmJ1I5SLBtb2iWT8gJRSJM77d944+g0hbMaMTVY8f8bAMRUnLUutE
	XdwnVOvF0PoHiWMk06q9tDqM2qkQgDl06HNC/6c7XNkgGQlS3B1ruOeFaPE9Zf0wLEio3h6TGoQHC
	LSqcVfkU+lLXOSsZZO9IzzIyNNBGDVW+mWThclrbAVtE8hszclZTFA2vYNiRUPb9MPTzNcc8HZpgQ
	dRiABAvVVeZkqDaa7gHY0svDa9Y1rcRgykHRxfZf8fPdC6SSYm5YDO1Bq1ey7TnAD/e9aL9FmR3vP
	WJ81WhKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBd1V-00Bdeb-0F;
	Tue, 20 Jun 2023 15:12:01 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBd1S-00BddC-0j
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 15:11:59 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-54fbcfe65caso3899225a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 08:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687273914; x=1689865914;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jC79vjT7xWBWYwpmn3ijy9z9IhPAYMHw/8W0EeFVGaw=;
        b=BzKmhpRkLYFk7XoNXWHZJydftqANKyk4OlRLd2vmhtSI5qkc2qvVFUGXgDPUGt40/v
         tfuTeiawSjGrfBiE0XQBOtdeZlS9xcjgyaQDyT8g+J/CxYuclr1PDmX1thDghbeL5LDJ
         y6PO4wKtguMr5md4Jmk1BawdpdYNOvOFnkve1WpGU+xWW0nRXpTseB59GOPBREBi7VSY
         q7+qykTE2aTbV6Dt/nTds1XrFA1OcQhcMoYWXnR8J+t1sdrONLe5A4ZzBAgXnCWKy7T3
         MU0VYFddnIThHCmwSDLY2QWtYksPnA4OCpzyf4PMSJQhbpRO5FH5E4+Zj6ajdetpXaWb
         6iRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687273914; x=1689865914;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC79vjT7xWBWYwpmn3ijy9z9IhPAYMHw/8W0EeFVGaw=;
        b=DZZvCzwR5mOwTJxPdEuDaNEETLkY+cPLTiZh+Oa9zHZvozWOHR/bowGZ8Z9z+FQbGr
         Hn+f1e0ze5w6B+RrRtypGcZ3WwITODaKMHuvzRyn9XAM2o/6vkmOerpL8e13Bp0Cdi0X
         mM1xMoQkAUCMJZFvKabLsYOeMv7ooe7gi9Fbd5fbyAiujm42UHNtyLC4xIe1EKBPyp3h
         Tr7B02ml/EqCtYVjyptmrBSkFy1LcYk9iVwgdvdjM/nvktkAgC1uu/BLTg/DMcHCBqDG
         ComUdLUcHtUcdd9iAaHi1Q8bSdz1mp5yU3URJosnmSoJeU340fj8D+BnnIGcDoJ3Iyaw
         dI4Q==
X-Gm-Message-State: AC+VfDyeMXhwXnfWb3An0EXcI9PPFfcuUW8a7qGYVuF82Rc04lvvecDF
	iM8Q7se+1t7Qz+7C3mRmq5BeoblW1o9HPiZ5vvM=
X-Google-Smtp-Source: ACHHUZ7l/EoB0VO41Wjl+A0w3lizRN+7kVWzUoibQj5OSxIR3WVVskQEocT1A6TzjTPZFcHZewlj0w==
X-Received: by 2002:a17:902:d506:b0:1b6:6c32:59b3 with SMTP id b6-20020a170902d50600b001b66c3259b3mr6377963plg.19.1687273913969;
        Tue, 20 Jun 2023 08:11:53 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902c1d200b001a80ad9c599sm1727671plc.294.2023.06.20.08.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:11:53 -0700 (PDT)
Date: Tue, 20 Jun 2023 08:11:53 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 08:11:12 PDT (-0700)
Subject: Re: [PATCH] riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE
In-Reply-To: <20230525-palm-sponge-982d6591a791@wendy>
CC: jiajie.ho@starfivetech.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-7f97aa16-4b17-4028-b750-3173451644a8@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_081158_477232_8CC1DA22 
X-CRM114-Status: GOOD (  15.69  )
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

On Wed, 24 May 2023 23:23:12 PDT (-0700), Conor Dooley wrote:
> On Thu, May 25, 2023 at 02:18:36PM +0800, Jia Jie Ho wrote:
>> Selects ARM_AMBA platform support for StarFive SoCs required by spi and
>> crypto dma engine.
>
> Thanks for sending this.
> @Palmer, this depends on another commit not to introduce a build
> breakage. I'll assign it to myself on patchwork and grab it when it is
> okay to take.
>
> Cheers,
> Conor.
>
>> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
>> ---
>>  arch/riscv/Kconfig.socs | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> index 1cf69f958f10..381cd46e6373 100644
>> --- a/arch/riscv/Kconfig.socs
>> +++ b/arch/riscv/Kconfig.socs
>> @@ -29,6 +29,7 @@ config SOC_STARFIVE
>>  	bool "StarFive SoCs"
>>  	select PINCTRL
>>  	select RESET_CONTROLLER
>> +	select ARM_AMBA
>>  	help
>>  	  This enables support for StarFive SoC platform hardware.
>>  
>> -- 
>> 2.25.1
>> 

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
