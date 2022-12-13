Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1D3C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 06:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2cFcPHztCLczFfzq+050Y1//p89ezUn/3zetHYDaKc0=; b=uAt/FHIta8ndHWy1jm/y+NeNw1
	qodC5bouWKARucP0aIeWUYj+ldAMkAFMZZzuxV7mzgDVHFDJeH8KNzcjNiZVF9tRNj/GzUM2kbXer
	fnXkVm8BQILDbz12PFLSK/11USB3LO4lpkkOrGHPI7gNBVs5NBY7psc+0fMjkyJ9GaRxLhzU5nK6h
	/rMwHzGoubfB7przUIEq1FcoDkVAdqRQpxfSZQvZCeNncUJIvqE7H4Ck0Z485wSHB6kN1Eqvzdsdk
	Ly0NqVNUkYy00bYip42pstSbKt0zMrYaSVtVikx37H0r6kcd8jwD2DQOJSm4NRPt2IlGNHOZJ/17L
	6BvIsucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4yeT-00BL3E-NW; Tue, 13 Dec 2022 06:20:29 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4yeP-00BKxM-S4
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 06:20:27 +0000
Received: by mail-pj1-x1032.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso593610pjb.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 22:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUnbUUVS0h/mM0988pdGwtUuS3v9jL1KTBuUyaSkBbw=;
        b=u+K9pqPXQm1OLclKfh/f+jAACZuriI9DS302u/QoWvSK0hgykIrXle7ycpEFoBj3Mh
         XSxbWTD1OvTmmDX6pYTS6LJIAHzYoXCtFeCnQ/W09MqrWntC6MZQQmxgfR351s3pQVY7
         yFqb1Y9sT9dqmNhMaV7QSvrUSlRKk8Hy9mNg1M58SG9sUe3cyI227HkU6FTrXvRRuqGO
         5VOXIA1JvEkXVkT4t/0tRqzb1NNmK37qgMY9oynQAY1GL2hjpmBjt/iRYU1bzFRcqCit
         Dx/p323CFqny+IBii7FVV+j1k0xNEipVh2j7q551/7aR0OOoja4tIQfDX66NHKqZhVGf
         dfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUnbUUVS0h/mM0988pdGwtUuS3v9jL1KTBuUyaSkBbw=;
        b=IoDgUDeAPxRAyb9FcPeZfBJ/RoYsatPeRcWMHxcCvQvDWZwY1P6Yd9t1BBqeP8mHm3
         X0h1WmscIzbQ/g2RSmTDxtdeQxIhZ7H5WXvaNawoov6yg0G9SBvYdkWR8IkBz0Urvplc
         +LnQSqGDjGavIoQh3MvYI5tOK+VXeaMEX5/IeVe8joWqQzO3yW0O96WALVOuR4hMFbLt
         Qoy6iyz1bYE0ewRj0klbH0SHZuJr6BtgvcUoapZzBphe/76ZEcuSqjQHHnxjv40B/ap4
         CpAtF57XuKxPU+lri6kCGGeXSiwoiGuBnWnGElG8OK4piz1W8zb9bEWtZbBHpt/Q9NjP
         rjuw==
X-Gm-Message-State: ANoB5plaX02Y7U/wMYLNS0nJfbM6g1Stz78PorNdl7O4BtwtHvpFHtX6
	jZKYEJLoEk3nr72KxCm2lBRFTg==
X-Google-Smtp-Source: AA0mqf7bVgfbDIYIbr/XijD9jkgKneRGDgZWhsg0CLJra6QeIPNjc0LBfAlwb2WU4VfMjVyfu3Bx1w==
X-Received: by 2002:a17:90a:6985:b0:21e:dec6:fc38 with SMTP id s5-20020a17090a698500b0021edec6fc38mr15334064pjj.46.1670912421935;
        Mon, 12 Dec 2022 22:20:21 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id w15-20020a17090a4f4f00b00218fb3bec27sm6317514pjl.56.2022.12.12.22.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 22:20:21 -0800 (PST)
Date: Mon, 12 Dec 2022 22:20:21 -0800 (PST)
X-Google-Original-Date: Mon, 12 Dec 2022 22:20:11 PST (-0800)
Subject: RE: [PATCH 0/6] crypto: starfive: Add driver for cryptographic engine
In-Reply-To: <a0bd9060bab348eba1044cd911653bd7@EXMBX068.cuchost.com>
CC: krzysztof.kozlowski@linaro.org, herbert@gondor.apana.org.au, davem@davemloft.net,
  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-crypto@vger.kernel.org,
  devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jiajie.ho@starfivetech.com
Message-ID: <mhng-181c038e-a986-4dac-9745-9405d6814c84@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_222026_126777_9629F351 
X-CRM114-Status: GOOD (  14.30  )
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

On Thu, 08 Dec 2022 01:35:10 PST (-0800), jiajie.ho@starfivetech.com wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Thursday, December 8, 2022 5:28 PM
>> To: JiaJie Ho <jiajie.ho@starfivetech.com>; Herbert Xu
>> <herbert@gondor.apana.org.au>; David S . Miller <davem@davemloft.net>;
>> Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>
>> Cc: linux-crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
>> Subject: Re: [PATCH 0/6] crypto: starfive: Add driver for cryptographic engine
>> 
>> On 08/12/2022 10:09, JiaJie Ho wrote:
>> >
>> > Hi Herbert/David,
>> >
>> > Could you please help to review and provide comments on this patch series?
>> > Thank you in advance.
>> 
>> You received some comments so the expectation is to send a v2.
>> 
> 
> Sure, I'll do that then.

Not sure if I missed it, but I can't find a v2.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
