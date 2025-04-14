Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7176C369B2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 16:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uk2p1QrolG5MDzb9TO3Y6zC84IKvqI9mpyvmug7/xYs=; b=vSvk+oya6KXQFb
	YXDWpMdnQoedA0kCAdtqwvGPv5NUAEr+V4CrB7dRKdW8g3zVZdicqCEftvZTITeMKT+saaasWhc4b
	m94TsroCgva1Yx4mMS/yK/rLhDS3mtsUBNQh6zP9KbR68e7wALXmE9wc8vr/6lWTJ5LHZaBnYse4Z
	quVNcTPZvWVMHLlz4DjKDTyMnVCxxI3nLutilD/37H5TkANVRf3BSWoE09p2xlPM3D302zUl5LYTq
	jvpo4oJkURxRzFUKEVDW5Hwov6PGBameDfjNYNuh+9W0G1wLWN/vqjp1trJTXSUdB3HtWTOy7+iF8
	BrQld5VvBWbCD4XmPdXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Msx-00000002p8a-0Yg0;
	Mon, 14 Apr 2025 16:42:15 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Msv-00000002p8B-1tGP
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 16:42:14 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3d589ed2b47so14210175ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 09:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744648932; x=1745253732; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Nkt4V2QTjnSapTTILkS8+oLHV4hk8aXAHawaxgiQGU=;
        b=i3ygcMVM4UxuDkRptgeODf7BRHsfeoi5oF2ItxI5i4Z6IbCq/RFJKT/8ncLvls8ja7
         Wp17BJcg9q6rkUMJVqYmLQ/WetWF4DCiVJjveoG/pSRjzL45qAC9C4CU6cMoIfQB+/Yi
         jFB7LOl0aflOaHudeHcI0hJPaYXTIHKJh7cpISqNv7GcgUvuddVGFwmbqOekGcsVxccg
         vKO2Nn2LEh2P3Zg0alP6cvx4dLExDNQU84moYOexwhn5AFSt4UdghyIUkG7zkxREPmNU
         vl44r25D4AamogMNGpVM6KOWtWd9s7uSDnnoR6TwmykHi6101lKR08twoPUQuECT1Hqq
         LVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744648932; x=1745253732;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Nkt4V2QTjnSapTTILkS8+oLHV4hk8aXAHawaxgiQGU=;
        b=G38yOGQWhe54kv92/TJQplo/Fc3yZ3aaaJ42z+JvT/tOLeFOotLe45wBMHP8dGXCxt
         H4EGliJdkX447V3TF80B3r3cu2cQtE3Bx9HdCe+ouPvXGFl/hX6Yc2V51BWqA6voD6TC
         p2tjxewT6OklqtbpPDU8EXeyEyoXyxIT8wOcXYDZ2YyPbBl/zXDoAqaxRfFuH+GfCVtP
         9OAOKjcS0Tdl04r6kvYjCHgzG0OxxKwR0Oj7hQO+b0qic85fM3+auqw4RD2rjaEVsU+T
         eweUsG1CJQLMhXRIV6Fd9YJ4mehUOLZoIn+wq66nTJSUYTFd+g6N7XviDGFkAcg1ZC27
         AcIw==
X-Forwarded-Encrypted: i=1; AJvYcCU/vbsEyLTjPB/75z1EOfxzotFXYCmDgTeXU6hhEPPOuSrI+Hrk5gLOz49XPV+OTyMLXbzmkhA305N/qw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuTP+sovM/1bXH+JLz9fNUfhmv6qBS/O7VrrfdO3uVblM22jNG
	2tdtezqcX9EMn9gcmsGy9PN0QqFOqPglPoFDhCTW1RMcmkj91IxirinYLl5ip6A=
X-Gm-Gg: ASbGnctqJb//Abz27P7cnjKac8PBGOfiO8PvZNENrjDpVb27G4DDXokRG5PJ2BZH/ld
	eEUGtPjc+rgTqw1LyFdxw8p6K0yveaodbb7ikggY9+LCElCLVGq66HkS/reh+/wHAMhA9KWmRc8
	dUI51P0HMPkqw8OinIn3uK2nERnLPnZWpEywhijyhP8n7/dO8r02HYQNQaSpxbkqe0hMxYmRTZs
	jTjQsO9LoAAiUy+6xev/jmeQNgX+KyoYDBMCK6qSc9Z5tKD9w7YeEsu0xPOPbQCMwYud8G0Vedq
	3Io5lLRifaRtp8+ppETeUZK93lcVjoyk9Sux7BQxoHI6ENtojhYQX+j7KQ==
X-Google-Smtp-Source: AGHT+IHXcv1gAGtPs5um9SWMJJd18WOJ6IiYOGvEA56wWlYHbTbN9OhrdEHa3Nng5MJO18XCSyHZBw==
X-Received: by 2002:a05:6e02:338b:b0:3d5:bdac:c927 with SMTP id e9e14a558f8ab-3d7ec27c9eemr148288925ab.18.1744648932034;
        Mon, 14 Apr 2025 09:42:12 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dba9bb63sm27527735ab.38.2025.04.14.09.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 09:42:11 -0700 (PDT)
Message-ID: <9a51fbfb-cd06-489d-8deb-4323eca496fe@sifive.com>
Date: Mon, 14 Apr 2025 11:42:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] riscv: dts: spacemit: Add pinctrl configurations for
 PWM0-PWM19
To: Inochi Amaoto <inochiama@gmail.com>, Guodong Xu <guodong@riscstar.com>,
 ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org,
 p.zabel@pengutronix.de, drew@pdp7.com, geert+renesas@glider.be,
 heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com,
 unicorn_wang@outlook.com, duje.mihanovic@skole.hr
Cc: elder@riscstar.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-7-guodong@riscstar.com>
 <ujkfb3ajvoebrkvoepztgh3afzw5dq7djefvdddiboo5gxu63x@dlflpzwpv26u>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <ujkfb3ajvoebrkvoepztgh3afzw5dq7djefvdddiboo5gxu63x@dlflpzwpv26u>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_094213_513985_0E990FFF 
X-CRM114-Status: GOOD (  12.11  )
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

Hi Inochi,

On 2025-04-11 5:50 PM, Inochi Amaoto wrote:
> On Fri, Apr 11, 2025 at 09:14:20PM +0800, Guodong Xu wrote:
>> Add pinctrl configurations for PWM0 to PWM19 in the SpacemiT K1
>> device tree source file. Each PWM instance is assigned multiple
>> pinmux configurations corresponding to different GPIOs and
>> function modes.
>>
>> Configurations include:
>> - Mapping GPIOs to appropriate pinctrl nodes for PWM functionality
>> - Specifying bias-pull-up and drive-strength attributes
>>
>> These updates ensure proper pin multiplexing and drive strength
>> settings for PWM signals on the SpacemiT K1 SoC when selected.
>>
>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>> ---
>>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 315 +++++++++++++++++++
>>  1 file changed, 315 insertions(+)
>>
> 
> I think this is too much, I think it is necessary to leave
> already used one.

If your concern is about compiled DTB size, you can use /omit-if-no-ref/ for
each of these nodes, so only the pinmux nodes actually referenced by a
controller are included in the DTB.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
