Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4F3C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 04:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=HV9TAiQdhECLaV89u1qZ5lbLDFSO9i+qmRIUPiea8L4=; b=cEyL2V8vPj3DJQk9TCMLk+hdyf
	jM4MPXxX7QgSWf+fFm0NZdD9NwUGWwevwXp2O2UOWmp4lwlj2rpgtkFQLn8Um0r3UvcVUKxzMQsJY
	iFT8dR25uKF6s1x5MUlbW3Hdihnwl3XXey0HZCIEfzUzmPn/LHvMwvBTfJuddAh+gmeDGhzJk6s0z
	DnPPtNVrGLSMwiOALMBU6t4Xqd22FPr5ofYOPcxQ3zu3XW8/Adhn14INwYelkGLLO7HBqeJ0V5/j/
	+qn2aP03bdeDdKmk2kaF2W1rmd58EOeHRyQ4jiS2domqHHak0Ho+U/bB+PIdvKBgkUh+lu3ol3ra3
	4jeNgc1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPzIm-008Shg-BO; Fri, 04 Mar 2022 04:12:24 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPzIj-008Sh5-Th
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 04:12:23 +0000
Received: by mail-pl1-x632.google.com with SMTP id n15so6684210plf.4
 for <linux-riscv@lists.infradead.org>; Thu, 03 Mar 2022 20:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=jVhPAeQvfccS3InyfAH/VFAxekIO5TliK8fvjkyoplY=;
 b=ftr3cH8qXWFbFsT4bq3I6LWs4JamRi0VDgwKeaxLMfkV+a0sQyUl/mX3oXRSVzVWk7
 6WVzg//gyYFs63l8zoyk9PFYLvwApNTsqhCzvsDD6v6mo4puzhTK0XcRqHIn55QkPT0a
 QMmyBSu9pvD+ln8Eh42shjIcq6/sPdaJQY29svxLYBgQH3cJq95AFBzY28X5/otxJqB+
 vzunfjI6ST1ZDjgoP9IkWNnoPK9EH6XohXcL5b/D6+QDj2iP3UMigL/rEqcWY9KY2smY
 SeuFJWUwL3i+wOUQiIwwhlgxmJEe08urBL45x1QSJlQ0WT+lxevhsd1hC2epltcQrdLj
 vY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=jVhPAeQvfccS3InyfAH/VFAxekIO5TliK8fvjkyoplY=;
 b=hVLfxALtCDc0jxWrkYuquo6VZql+8Wkpd38z1p5JP2y5cM1FUUhSITRB+41Hh2EXMd
 zmo0CnLRr+Ai9wK3Bns6KwKK8lMeJUB+OY9Z/fmEcZ0/6yfqVA6+B/+f7wELx+Lxg4ga
 vC2dVWiXKKbr4JiP+wnN5v2bQTY6zqpA5pXu0uuZWnSWO2+CBajjFZBuFaHr7Eon5RRz
 xe7Gllq18stZ5YiZsTrdkmJ8rrAX8HcZaQ6ygKVFFOwgET48zmoiR5y1n1B5gpNWNhdw
 YkOm91DS1qYqSWMYZZVnvYYiePKbbtFBDRTIQc6XcP5636+HEhbkv3NQKusnPBjcYzz8
 7zMw==
X-Gm-Message-State: AOAM532jg8BN3Fa15Zncha53zdQsafDqSl8X0z/O7Kvgb7ccFcvxe7Ey
 ACWHFpFsg05ieozfjqYd/n9nGmUUD+jN3A==
X-Google-Smtp-Source: ABdhPJyh/bqxk2p19R3L8t5CykBngFNqYXe+ZhPQwN8ZZjvpIfw8l2JFUflj+e7kn8xvdVpOrlGuDA==
X-Received: by 2002:a17:90b:1a8a:b0:1bf:d9c:f206 with SMTP id
 ng10-20020a17090b1a8a00b001bf0d9cf206mr6528144pjb.95.1646367138913; 
 Thu, 03 Mar 2022 20:12:18 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b001bc97c5b255sm3313105pjb.44.2022.03.03.20.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 20:12:18 -0800 (PST)
Date: Thu, 03 Mar 2022 20:12:18 -0800 (PST)
X-Google-Original-Date: Thu, 03 Mar 2022 19:59:03 PST (-0800)
Subject: Re: [PATCH] riscv: dts: k210: fix broken IRQs on hart1
In-Reply-To: <ac991e09-40b1-8fd9-d178-84b48af43a55@wdc.com>
CC: Niklas.Cassel@wdc.com, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien.LeMoal@wdc.com
Message-ID: <mhng-cd1e7d68-785e-4203-a845-de918ca4eebf@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_201222_030551_93E6A865 
X-CRM114-Status: GOOD (  20.35  )
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

On Thu, 03 Mar 2022 09:59:31 PST (-0800), Damien.LeMoal@wdc.com wrote:
> On 2022/03/01 2:44, Niklas Cassel wrote:
>> From: Niklas Cassel <niklas.cassel@wdc.com>
>> 
>> Commit 67d96729a9e7 ("riscv: Update Canaan Kendryte K210 device tree")
>> incorrectly removed two entries from the PLIC interrupt-controller node's
>> interrupts-extended property.
>> 
>> The PLIC driver cannot know the mapping between hart contexts and hart ids,
>> so this information has to be provided by device tree, as specified by the
>> PLIC device tree binding.
>> 
>> The PLIC driver uses the interrupts-extended property, and initializes the
>> hart context registers in the exact same order as provided by the
>> interrupts-extended property.
>> 
>> In other words, if we don't specify the S-mode interrupts, the PLIC driver
>> will simply initialize the hart0 S-mode hart context with the hart1 M-mode
>> configuration. It is therefore essential to specify the S-mode IRQs even
>> though the system itself will only ever be running in M-mode.
>> 
>> Re-add the S-mode interrupts, so that we get working IRQs on hart1 again.
>> 
>> Cc: <stable@vger.kernel.org>
>> Fixes: 67d96729a9e7 ("riscv: Update Canaan Kendryte K210 device tree")
>> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
>> ---
>>  arch/riscv/boot/dts/canaan/k210.dtsi | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
>> index 56f57118c633..44d338514761 100644
>> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
>> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
>> @@ -113,7 +113,8 @@ plic0: interrupt-controller@c000000 {
>>  			compatible = "canaan,k210-plic", "sifive,plic-1.0.0";
>>  			reg = <0xC000000 0x4000000>;
>>  			interrupt-controller;
>> -			interrupts-extended = <&cpu0_intc 11>, <&cpu1_intc 11>;
>> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
>> +					      <&cpu1_intc 11>, <&cpu1_intc 9>;
>>  			riscv,ndev = <65>;
>>  		};
>>  
> 
> Looks good to me.
> 
> Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

Thanks, this is on fixes.

Just FIY: A bunch of WDC email is getting munged on my end.  I wouldn't 
be surprised if it was my fault (my email client is a broken mess), but 
it does seem to be specific to this use case.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
