Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDA9ECE577
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ao5AdNxJjd7Jvs/c0vSdczCNaItZZE828Tf35CtTGLY=; b=qm0LLvMI6o7jepbQFn9SlvYwyp
	7ooJfHmU+tjiT7JIsTKA81CIXgfjQvKrOZ/IUUbxL8g1Cn/GsM5FBTLDriVyKYyUdiZjj7ZEcVJlo
	jNeZPqvYzCvdKCssiaraSzFgug+ZlG3JFa6CXBRsXskDTe6oeBQNZNifBbBVmdwYjdblcAvqyBQxG
	TLxXfCnuMj2aSzv9c0fclgN23gNCtaMckHFPia54O+lXIdEupG9pMNRCwb01z9IaBsTuHsfggd/Ln
	UDLQJCBdhYqIzgVi/njhrx1e48hVw2uWY9a2cpoZADU4JimKFCPrnEs6WaaRzKRv564VE4dmW9jxj
	BVzRiYbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sni1e-00000002n73-1VW9;
	Mon, 09 Sep 2024 17:18:06 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sni0c-00000002mx5-1rCX;
	Mon, 09 Sep 2024 17:17:04 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2068acc8a4fso43325405ad.1;
        Mon, 09 Sep 2024 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725902221; x=1726507021; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hauHXk0UHvL9WIL9OJwYkRJrxeJ42bwu7guvi9wUyZ0=;
        b=KLa2pGfuZ1Hk//Pf7UfpIArFwIYyBkRIz0za8Uv5+d01Un+7xjVsplxp4N6VRupRFG
         Q3p145NDbx8SIT4s5jQTLXqrGWyqXpFXPn4Vvwf2KBVb6jpJyjqdhiYR5dVX0FdXlsEs
         uznF2bxz4iAHm3LTKrftxjPAnJDVW7Hw6BWHNJrsuI6lwTrUCdGRvaV3gA7QR7dZvO1W
         7RQ3x8sLm06Uj7TlkQ4YoOcSR8S7LIqKDbfZcVieBJ5alzdWV+5+RXyyJJIQcc57y9KY
         AcIeGC8xGhwXF2Wvtx0w8v7XSnoXDLRKdnKvBcHZeR2W4XoudYQk7uYDaT1b5PFPlsXe
         I9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725902221; x=1726507021;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hauHXk0UHvL9WIL9OJwYkRJrxeJ42bwu7guvi9wUyZ0=;
        b=MdDAhxnX7a2ShpHowAHZju0lLEVxX5E4GWvr6NnjbUlCbu1ooib4x7xDt0CZZ3THJo
         eTKMCmDtHFXLIG4lRb7Y4vxF27mL30SnA94KmvoxdYiAm821yoN+sF3h6z/VyRrzhjq0
         0xo2cugID1oMpg23usM4kTcaclfRwsYy8e+dqznau3jfF+8e2F9zEGjCMuW5aJB0U9u2
         4znEWLS4aJS/P8sN0qcIyVRDHLOtypmRM7IRSjXY/nNrLg+XMvuWwvyixXBJLdud4+FX
         uyB4YX7Hq8BkFT0MQadCKtFiIXyuy+kqBr3POAlGGMNKLSHPb39+ghjxkZr3zIwP/3DI
         l+DA==
X-Forwarded-Encrypted: i=1; AJvYcCV3lawLuGsouZAKlozq5nyB8PBJSyBELFKXM4Id8OgekGNMIj6n9gI0ov8KLEJit7wGpuvgcdUL26SCc67K9Nuv@lists.infradead.org, AJvYcCW0I8YMKm2JPLzquajcSVm9AXIsgUdQxxu84BQ5f7hz+9vsGCOUS6/SvmvqHv9U07pOGiNsDst5Mputk5g=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh+LP8WYtpVwmPlAkd/yErP7WoHDncvKEwmR18ON2A5aYp6AK4
	2iCynBBn4pat0ic+Oujw8rvHvI/ft9pEZyHICtaJgaPtSFHHVjxu
X-Google-Smtp-Source: AGHT+IHnNeEvODa1Qt6cj+F9ZMmq0nJBVXi/m6bl9hffcSzJHoVbOj9/wfPZtg6NqY9graxO1THDuw==
X-Received: by 2002:a17:903:120d:b0:205:866d:174f with SMTP id d9443c01a7336-207070002e8mr83668675ad.44.1725902220449;
        Mon, 09 Sep 2024 10:17:00 -0700 (PDT)
Received: from ?IPV6:2601:1c2:c184:dc00:6c38:4539:e063:d0ba? ([2601:1c2:c184:dc00:6c38:4539:e063:d0ba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f31729sm36233705ad.261.2024.09.09.10.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 10:16:59 -0700 (PDT)
Message-ID: <08466bb0-4306-4941-97e1-e62ba07d8ea2@gmail.com>
Date: Mon, 9 Sep 2024 10:16:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sam Edwards <cfsworks@gmail.com>
Subject: Re: [PATCH v6 3/3] riscv: dts: allwinner: d1: Add thermal sensor
To: bigunclemax@gmail.com
References: <20231217210629.131486-4-bigunclemax@gmail.com>
Content-Language: en-US
In-Reply-To: <20231217210629.131486-4-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_101702_519519_0160DCB2 
X-CRM114-Status: UNSURE (   6.44  )
X-CRM114-Notice: Please train this message.
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
Cc: rafael@kernel.org, tiny.windzz@gmail.com, contact@jookia.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, samuel@sholland.org, daniel.lezcano@linaro.org, jernej.skrabec@gmail.com, anarsoul@gmail.com, wens@csie.org, rui.zhang@intel.com, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, linux-pm@vger.kernel.org, andre.przywara@arm.com, robh+dt@kernel.org, mkl@pengutronix.de, paul.walmsley@sifive.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, lukasz.luba@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Maksim,

Apologies if I have failed to find a v7 of this patch in my searching, 
but I'm seeing that patch #3 here was never applied, so Linux still does 
not enable the thermal sensor in these chips. I just thought I'd give 
you a heads-up in case you weren't aware. :)

Thanks for all your hard work,
Sam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
