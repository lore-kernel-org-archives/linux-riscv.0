Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257D4CAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 14:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXVciInN0TuzZ2wgDg5FiWy7aJpcpzf+MKHp09/w9Xk=; b=Z4TyAYGKCxpGHq
	tG7faLLbYd8KIGkZCfmE9OaDPWwvLmfky6xme9IUllWN/uuCoV2kFQOI+mqpdMFbGW/E7aOIg3qQu
	QMlamCVJ/oxA+Sgg2ZVJwVX6rxFdqyOySGNJhYtyrEcjrCZGEwBnxB7oD4CCMcsMrmBrIkVSp6GBp
	3fk45XN6S9L3f/8KGz6L2q1zNOPat5WM7Trnt/HafV1C/ebrDR3y6zS4p4DEKazATjJ1G5gSbH4HA
	bPrWzq1fKZmF2lK36uiZqOXgPDDbWDj9yslqoV0RlqaQaIo8EYiX2rTcVQjbmR2FFNquJlG/iK8Jv
	mit7b00pjhn2w/ICDO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFV2-000000006lI-12mo;
	Thu, 18 Sep 2025 14:20:40 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFV0-000000006kV-0Jc0
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 14:20:39 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-88762f20125so100952839f.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 07:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758205237; x=1758810037; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGUyDQ28gbrezc/y2GGrwAvmT1nNgBRAv5nk0GUCrzs=;
        b=X0tQholL/fmcpHFMGOL0BXhOZnwBCOWFG+nQDB+qt2TfILnrFIo9RQ7zlaAKSHyVf7
         FoWhXVwJOBglML5/SGuqxj/mPJCR+XhYhSnIJyUU/M6ocn5Zamc9aQ55XGPEdrp+OQMd
         e7fDsU52i2ZZ3MS+ZYCHasBgUqHx2BPqZ0MAHZkECAPtPio7I11k0oRyywR00bRDvmzV
         bOt4JvFuGsYMG5rNkMHGcyybqGy9RLyn73RjQXWoeqtu29a1Kq0J20q8Lw4bfoBzRIvo
         5cefQNDQTxG1KepQbnVmCu4UWMR3GkM3AZ7YTSf9c5De87ty+/LCbIw25TGfQ7EIXMa2
         CszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758205237; x=1758810037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CGUyDQ28gbrezc/y2GGrwAvmT1nNgBRAv5nk0GUCrzs=;
        b=d/+6h69LI5YStzF+hPiOIbsiiTl569kZHMEZqeHO+SPJgOKj6TmyFN36BMiM5zk2dI
         lnF03K0x1CdcWgYgiZQNb5IkboQYZGsYSDhiJjbVgAQBEaRv41CGlBY1DqZ6DCooDqIe
         jo8hgbICgSBqMM84jzRYiO9iTkon+JbO7QOO9k4IR7KJYu/8+v1JZRljtzkGP8MfLSHR
         kkRCLUjgClTtvQbkqseIFUJoGHsHDXZK2cdOluXTh1S8IGdMOooXmC4eAEJLhfuXKA5g
         wXx6931+YrQk3xK6xhMXWDK+/HqpLhPtBFVTXH5fs1moht824JFhxiKCvXE382xXCW15
         ba7g==
X-Forwarded-Encrypted: i=1; AJvYcCWzO5Kc80vLo88/gz8jjLDMXs01tIxadnPuNeGxL4s4kKyUHE3Kida3wOgLjD2ed0evwN23OIa0aK3dZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTq2Y2bYiLgadVGY6CYguZ8AqK2Sqdw8m15miu38PLpinz2Vbo
	xcHUE8Xg76IQFfuK+9dHkwpWWvN1iklzavznieXd/efnoKAwwE9SZOYvcFAapP4WQ+0=
X-Gm-Gg: ASbGncu2LFBFUsWSWf8N6v2VMajybK3MECWuk46xXxaJPuwBmE4WP0MoVpvchhIC2xS
	txDVmcukADhfSmgG0q+SQ67g6cO6xQtNCDlOQeV03n8iHckPzY07A4T62Lu64ZPUdR2DSsI4e6m
	cfdAlQ+AFpRhs58aQ/KQB0EYnNJsah3UTi3/qhqIFiQko7gXDyFgo59gNzhGcW1B1UB2l5ydpem
	HAS2qBm8hlaAI2zFADRcUFt82LeYXMQ2QvETVGA6E15PsS0VdEHDCPoI7dTSivVy36cLHNahY6g
	NJxsNxF60FQ03LtQWlMxYwAsSM2R3eLquzJZdQ77jF6DSNpy2LC38LXnoDU9vWpW0nh00s42N+9
	894RHPuym8EJKgRFnOignRbaMrzCD0xpxqtOrOD24J1C2cppq/GLhEJHy04FuFzrEbLAs83LEMQ
	FLki7fdA==
X-Google-Smtp-Source: AGHT+IFYve4EQ3dvEX4MzZuxtP/eJg9hkH/7xZ8/C/iLPdxKPkoWIGurBe2rCvRfKygvBsgv23fk9g==
X-Received: by 2002:a92:cda2:0:b0:424:6c1:a778 with SMTP id e9e14a558f8ab-4241a52851fmr78183445ab.20.1758205237057;
        Thu, 18 Sep 2025 07:20:37 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244afaa351sm10679535ab.29.2025.09.18.07.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 07:20:35 -0700 (PDT)
Message-ID: <0053c0ca-340f-46fd-adb1-6af6928717ee@riscstar.com>
Date: Thu, 18 Sep 2025 09:20:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: define a SPI controller node
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-4-elder@riscstar.com>
 <20250918133209-GYB1273705@gentoo.org>
 <5956e320-7cbb-4d9a-95a7-720cfa6b9654@riscstar.com>
 <20250918140633-GYA1274501@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918140633-GYA1274501@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_072038_121636_EF94D434 
X-CRM114-Status: GOOD (  11.87  )
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

On 9/18/25 9:06 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 08:51 Thu 18 Sep     , Alex Elder wrote:
>> On 9/18/25 8:32 AM, Yixun Lan wrote:
>>>> +			spi3: spi@d401c000 {
>>>> +				compatible = "spacemit,k1-spi";
>>>> +				reg = <0x0 0xd401c000 0x0 0x30>;
>>>> +				#address-cells = <1>;
>>>> +				#size-cells = <0>;
>>>> +				clocks = <&syscon_apbc CLK_SSP3>,
>>>> +					 <&syscon_apbc CLK_SSP3_BUS>;
>>> ..
>>>> +				clock-names = "core",
>>>> +					      "bus";
>>> can you simply put them together in one line? it's kind of tedious to split..
>>
>> Sure I can do that.  I've seen it both ways.
>>
> right, it's merely a coding style I want to enforce, to make it slightly consistent
> 
>>>> +				resets = <&syscon_apbc RESET_SSP3>;
>>>> +				interrupts-extended = <&plic 55>;
>>> why use interrupts-extended?
>>
>> Because it specifies both the controller and interrupt number
>> explicitly.  Why *not* use interrupts-extended?
>>
> It's just unnecessary, the SPI node will fall back to find parent node's interrupt
> which already specific as &plic, brings no benefits

The benefit it brings is that I don't have to search backward to
see what the interrupt controller is.  I realize it's redundant
but I do prefer interrupts-extended over just interrupts.

					-Alex

> 
>>>> +				spacemit,k1-ssp-id = <3>;
>>>> +				dmas = <&pdma 20>,
>>>> +				       <&pdma 19>;
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
