Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8F2D2502E
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Jan 2026 19:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWJ3TKm+C1amEaI+vHRIi0KlptLtTVshEPCkYQizrfI=; b=06EHnr8NaaK9pv
	9+XPQ5PSDx5AF2UMeQbXVc0osh8GjYGzCDafop10/NOaYPqMD5TjT8nQ5EL5I1h7Xt/Bvv4ikRR7C
	6fT3mEUPQHloz9V7O4yAB0nWaYWGx3jNXgJbHvBfewi5G1qa0CL+MYpuS2LNvIZ4hp2EeSas7UX2E
	GMnaWuLg7x82+1A66uL2L932L0gIdQhA8piFokVFwipRakI+aisO6QJEcmZXT/TzgUZyGEm+GYaW4
	vaFvjVJMH1uOHTZIn//wQPT37tlUh5z77TNcrE5XkBwnjbLW9jP3bxfG1wNWBaL7FB52FkKaGsx+7
	M3fzCyLYf1eFirC48fdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf1Xl-00000004SWR-12Kg;
	Sun, 11 Jan 2026 19:56:10 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf1Xg-00000004SW1-340H
	for linux-riscv@lists.infradead.org;
	Sun, 11 Jan 2026 19:56:08 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8ba0d6c68a8so674229285a.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 Jan 2026 11:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768161362; x=1768766162; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOUBhbeaXMEYonUlyi3dh9viIlCbuv3hV4saX11FjGc=;
        b=uLVu5WY0myFoNQW5Q6tL6fkpWBYPNQ5JTbm7+ODlxQBpQVQpJJYpY4lDDmWVvx+AOK
         9pV3jRhvBbicoKc4UhoWdKPXTbJJEXWaQ6B+MajiXPg6pahMTrKIncd6D190NQUwYZ17
         SAOXG/dBQaezDiS/aqJCxECirHAvpNOkGund+iqoYUESn1zBi/+OW9k1jGVpxG9FAXbJ
         kQePwxjgXZCS5GMwU0RFp72lSCcoGaQlBgSaQeH6jf9u++sckD6am3E1CLC3tG9kViuP
         6XIAJaJxAFfitCV6gcAos9yuLLi1162Em6dO0u+nM1ZGfQ2jAwQoP1VyRlrf8OVGyIa8
         xlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768161362; x=1768766162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOUBhbeaXMEYonUlyi3dh9viIlCbuv3hV4saX11FjGc=;
        b=pS8oHLTZDgkZXKVxPh8gl647ZfsO6LySqcmKtcnVLF3OO/n4dfCH67pBDRj/xo4/wr
         U2kHLvRGnWNDM9xVKRlDrBLaidZVLdbhQi57nM8kjKgjbaoLq2uTCyVYpO9LBAoB4HwH
         hkNXnrYGXmjFQd3m9zcLAfh+4xT58zPMwdirA2yDd8xIDmpVNHIvqmlOTVOXbMZ3YRcp
         6kSgNvzvKgpm4qAso+9cI9Bg+k9OZFksRzfFsq2JS8bd3KpHlJar0h0E8vsLB5t/J3hc
         zhc3//3yPqgAXKXDEjDfFsk6CrHHWfT3uAJvs2AHOkO+kToZLn9dZkCrI73/MbeUX83B
         rbMA==
X-Forwarded-Encrypted: i=1; AJvYcCUa+WM0utm2yn0PbnrrnZl1VHjaV4eIr1LSeGTiIfScgrCrp7uiQNPJgQ2zLBQiyJvypSdcQyKiEjFZ4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE3mLcxAXfPhYqbY+hSSeQiJflzJY2LSqYYpSa/HKe0PlF7QwK
	mE0UmRD2bkeQ9uk1CW2GRhBETMdRYQ/Ff9pYyiet5z02HynQCDz2R2z2p1VzNNEKZZE=
X-Gm-Gg: AY/fxX646NAry3fsNt/HcrW6UuUM+/RujCX6S4iGvoIYhvWhvYq97Kpfig/zm0E1uIe
	9PQwo+uGvdFKvnlZLI+rJ6K9S5D8RtR538F039F8dC2Yd1jt9v+Sl6llORlpYbp8OaABm8JlrHm
	EQEV0ZySNXMQJlFzGaEukyKlnJ0yIrkL5YIuJQaxRRNgK1gf2phgOWrqh/xp80pq1gEXUsNO4SP
	69FwGQk/co1U1KzSf/25ibWb9glwT952Oo//wk3u3BdbDxjNkvSFteRvLUitoJp5IImYEv2BJ8i
	YqA6V9OwabMgAJ5+qRZle6xRK8TjMxPxsLvg0YeYCDuPJVx1V7JuE6X3ckhKOyQqytxNuUUmR0x
	MlIoKwVaXEF+jV4LWEuAesI1zPLCvgzGuPZ58dU713LBue3Zay78hXmagUMZVHkyQncJccbz8y7
	PUZTn/bMu5e+L88xhbZoepd7uDGCF8NOiOuGmiXcHB2iDek9ippE0tmBIEKtkRx69h
X-Google-Smtp-Source: AGHT+IE59tdTZ/GflUoGe/9DlksdMPcDRktcTk1R3UIHBonEpxYes8KI9f6r/aWCmNZietl2oAn6tQ==
X-Received: by 2002:a05:620a:290c:b0:8b2:ef70:64e9 with SMTP id af79cd13be357-8c38940915emr2288627285a.51.1768161362565;
        Sun, 11 Jan 2026 11:56:02 -0800 (PST)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4b90c3sm1395290085a.19.2026.01.11.11.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 11:56:02 -0800 (PST)
Message-ID: <a383dbc8-5d14-4654-933d-5dfa73a23b12@riscstar.com>
Date: Sun, 11 Jan 2026 13:55:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
 <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
 <20251230005142d1bfc6f7@mail.local>
 <6ca28183-1687-4ddc-8b3c-5e5be4255561@riscstar.com>
 <20260109223627b566d2b0@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260109223627b566d2b0@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_115605_077156_4783E569 
X-CRM114-Status: GOOD (  18.82  )
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

On 1/9/26 4:36 PM, Alexandre Belloni wrote:
>> The purpose is to make the driver a module (not built-in)
>> when "defconfig" is used (without the need for any Kconfig
>> fragments to unselect things).
>>
>>
>> In arch/riscv/configs/defconfig, we have this:
>>      CONFIG_ARCH_SPACEMIT=y
>>
>> In drivers/mfd/Kconfig b/drivers/mfd/Kconfig, we have this
>> (added by patch 2 in this series):
>>      config MFD_SPACEMIT_P1
>> 	default m if ARCH_SPACEMIT
>>
>> So when using defconfig (alone), MFD_SPACEMIT_P1 is set to m,
>> to benefit non-SpacemiT RISC-V platforms.
>>
>> This patch is trying to do the same thing for the RTC,
>> i.e. having RTC_DRV_SPACEMIT_P1 be defined as a module
>> by default.
>>
>> I think you understand.
> I'm sorry, I must be dumb but I don't understand. The current behaviour

I think I'm the dumb one.  I think I finally understand your
point.

> is that when MFD_SPACEMIT_P1 is m, then the default value for
> RTC_DRV_SPACEMIT_P1 will be m. Since patch 2 makes it exactly that way
> (MFD_SPACEMIT_P set to m), I don't get why it is necessary to mess with
> the default of RTC_DRV_SPACEMIT_P1.

Your point is that patch has no real effect, at least not
on the scenario I was talking about.

I.e., I was saying this mattered for using defconfig alone.
But, as you point out, using defconfig alone gives us:

   ARCH_SPACMIT=y	(in defconfig)
   MFD_SPACEMIT_P1=m	(from patch 2)

And then, *without* this patch:
   RTC_DRV_SPACEMIT_P1=MFD_SPACEMIT_P1
meaning
   RTC_DRV_SPACEMIT_P1=m

And therefore there's no need for this patch to set the
default to m rather than MFD_SPACEMIT_P1.


> The current default behaviour of RTC_DRV_SPACEMIT_P1 seems to be the
> correct one and the proper fix is then patch 2.

Yes, now I understand.  I'm sorry about my confusion.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
