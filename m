Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D72BCF2567
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 07:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEehrbGcrxSw4l+ZVoaMM4T+yFleiwf+cjNs1Xa3cZs=; b=BY6B3oZWGxUdrs
	48X1BgYcEGs9Vth/jvvtLKGFAdC210P5R9YiaYgA4ZCziovtS5zfMXVEYfbQxbPh+D1KSUlf5dlPL
	TFXa/ce0+6ocRUWUbjH9n3SYJ1RZeyQSjyxNYPdc1CSNbyvAHb+h6YrNRfLbu/4LowFtPTzlpWGfC
	oWeU3FW3boEIuDqlaO8ZaDn+fC7CKWnL/wQMnl8dxJwM//RekC6LrSYKh4QQr1wNQS8cdMT7Od8CC
	uBRk1SpB7lAVf+5jlCzGtvPJfwr31Zsxn3Es0nlmrEbXM+OytRzuJodd0x7Ioy+JS2gp4cWR37L3L
	sLB/LcNsMgGeZW3S+bfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcFM-00000002fcZ-1EK1;
	Wed, 19 Nov 2025 07:04:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcFJ-00000002fbB-20Lo
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 07:04:55 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A6FA13FB7A
	for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 07:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763535887;
	bh=HCDUZaE5+206zSZomo9Fg7tLxJqm77Cnmdl1n2fzVyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=GcRXAWZBNAoqWN7k+UCNiWYLLvnBZCP3HvXHD2mbjyyyp0UdETHFkh/gS3OYAtdxI
	 wCdP0EjXu4+q3CPnl+h5YbxoRXzQw24tB8xZqM+6X2rTrwqypdVSdhH7sN55s6tyUN
	 U4+S6g0ABTePz9+Msai/Veg4NmIKsBfbwPGjY0gSyFLnvoFmwd53KDT717T2RESvuT
	 xIhd7StmIEL9aP5D4aqRcWYasbDzZIQKOnEQjnn5nlX3HwaqNHHKJOx6tos6L1K5aJ
	 833Xay3hbE8L+UVpEVwmXrwNock+ecak3EHk5yhQVPWjP6C8oIWyasEijPpdE+K8MR
	 aniHZgNHiRuWhsKvMQ8x6Z3micz/aZXorOzoWZtlKZ312uk1SH88nGOUpW8dAJlkrh
	 yMLhwAXQJTbw4FyzsbTOIeiZD3fbfLdJUGRsluRRHmNRJcpeWCd9bVaz7mes8It6rO
	 GrqytzgpHg7/ydkl0OOiZGq8ujCNQ2bFJ9ZDmQUh0AJqtucSaqEMrYJdDvvopzCjQq
	 tCoMnHYoFx1AHWg+gGZCgT+fW4/K6PwV3sl+N0v/ppzHw8UvVX9rCi7J/d1225Ohid
	 j/a2K06OGkDkYASwpCB3PZ097O/N+wa3xQZN0ObT110UAkh/Y/qS+DoJpCXpq/eWlk
	 EuRtJIya+zUlEXqB0Q6Kl6LE=
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-429cdb0706aso4880443f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Nov 2025 23:04:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763535885; x=1764140685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCDUZaE5+206zSZomo9Fg7tLxJqm77Cnmdl1n2fzVyI=;
        b=gHhvfM7oXSGaaXq2Nw17Lg/5EJNr1osrfnLUcAMVg05EHRXkh56FGpYZNfDOMe7n9P
         LDZKauR/ZHv4LBYj/FThhYWWPJua6tvr/y09Wyt3PrZ6c4iud1/kXqSHSutzJfl6KAcp
         7PpGv07ueBZoLt9C40mvvLE3uzS8CRlE/hwlAiiOzu5cv+eh+pYtu9Q0nKpRu+ch8J8S
         WesDjKDvdGmJvJDEVLpx5EUh7iM5bobD1r+N38/ZTr3WACnj7ZCQXaE5RDqDbB+4dpyT
         mBUx0sMVo8vHOo0hU/GNF/YMU8OVFxCcFEq3VVDUrSqpLUg9V6kD5IPvCYHiYjaz8Ua7
         tgoA==
X-Forwarded-Encrypted: i=1; AJvYcCVks199zHaKusCBjeCC4VSwMkvTgvUtIpAVnLtyC8qnJKGUFpOHNH3h+Yk8K7p55XJQoyQl9hHhKNZDkw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1ynYUIxfruwU0Wpje+Mj3OZqij25E057ZwjeO1oO36hAXO8DG
	kFT1YGLXNWaEZ/IOniIyZc/CkN+TrOaSa7eq6WYIr2l41VdiDMzaxymeUZlSKh6vqk10dng78yC
	gme+6pxFGsSjyGvibpP8n0or/vohlwe99T2rMZQp96KLA8464KNxm9AJlUvIfESvRPCF4dwNEth
	LqfCda2WoB/w==
X-Gm-Gg: ASbGncs4RTENTM1LTsOyboI0Delu4mpx8v1/1DuPawfuLpSr6Yq6S8MS+4+YfLOAZpw
	xoAjZRZA1AE285al7evriOxkL/sVyo8jyFHe2QfPKPGpfNNBQsSHJmmipk7euxOqabhT92rkn9n
	paQutsKBI3VwWY8STX/YoKVRvArOmqjkU9sQUEAv/eNVq0irsuR1U8TaF2k0kiOFDxd8LeVEKC0
	xe/VSkiDVvl1a7qO1utfv8maOnu/LzkXJTMjBXE/J1HQRjXpfOCV0y3xahoazeujssKqgqDd8yJ
	qF3lymIO3vAd1P+GnMPFZTq60zD8ap7YI3BNBci3lkzdpdq4KXdFxBTbSnoTpG+mmGzWfJfpjRO
	tSauPvT5yWXtn7bO6kLAcAqFQ70FHb5ls1eSkfHvHV+qGHnE88XPOgdhX+oJtxFM5elq6OL0RX9
	mkhRPKVY8=
X-Received: by 2002:a5d:64c5:0:b0:42b:47da:c316 with SMTP id ffacd0b85a97d-42b5934afdfmr17476423f8f.26.1763535884671;
        Tue, 18 Nov 2025 23:04:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqVppj0kaC1T4AK8/+ki8hXQuFnAQjHrtuYAj2Vyhso+rWSDHbQHj+3SMP9d2Ef4b6qHHLeA==
X-Received: by 2002:a5d:64c5:0:b0:42b:47da:c316 with SMTP id ffacd0b85a97d-42b5934afdfmr17476387f8f.26.1763535884152;
        Tue, 18 Nov 2025 23:04:44 -0800 (PST)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85cc0sm37190082f8f.17.2025.11.18.23.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 23:04:43 -0800 (PST)
Message-ID: <1f96a267-f5c6-498e-a2c4-7a47a73ea7e7@canonical.com>
Date: Wed, 19 Nov 2025 08:04:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
To: Conor Dooley <conor@kernel.org>, Hal Feng <hal.feng@starfivetech.com>
Cc: E Shattow <e@freeshell.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Bjorn Helgaas <bhelgaas@google.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com>
 <ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <CAJM55Z9KyNK1n4i9FxbLor4HTQKqK8WKA2svjPVvKXihw_E+sg@mail.gmail.com>
 <4a55301a-ef7e-4b47-8151-621cfba36ddd@freeshell.de>
 <CAJM55Z-bRdNmnRZ7wi3PMOkzGYrxQEGk+7F67Pdu4WXwKmTjCQ@mail.gmail.com>
 <ZQ2PR01MB13075CDDEFC2F03C837E1B31E6C92@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <b33919e9-e100-4629-92cb-d1ec3dd756a7@freeshell.de>
 <ZQ2PR01MB1307DADE17FFEFCE70C3F391E6D62@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <20251118-throwing-marina-14a87d65465a@spud>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251118-throwing-marina-14a87d65465a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_230453_939885_25AD5708 
X-CRM114-Status: GOOD (  28.13  )
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

On 11/19/25 00:10, Conor Dooley wrote:
> On Tue, Nov 18, 2025 at 02:12:58AM +0000, Hal Feng wrote:
>>> All,
>>>
>>> I repeat that the suggestion was made months ago (by Hal) to split out the
>>> OPP tables per-board from the period of time when I was complaining about
>>> 1.5GHz JH-7110 operation pushing TDP into over-temperature thermal limit
>>> on Milk-V Mars CM SoM.
>>>
>>> Whether or not JH7110S is a new compatible should follow precedence in
>>> Linux development. JH-7110S is evidently the same tape-out as JH-7110 and
>>> however you deal with that in Linux is the appropriate way to deal with that
>>> here. Selection of OPP table for correct operation will be determined by
>>> bootloader, where, it is demonstrated by patch series sent to U-Boot
>>> upstream to be selected ** per-board ** based on EEPROM content as if it
>>> was any other JH-7110 board deciding dts based on EEPROM content. Given
>>> that it is the same tape-out I do not find a valid justification for a new
>>> compatible in the stack of adjacent software besides going along with some
>>> kind of marketing-driven answer about whether or not this is a new SoC.
>>>
>>> What I care about now is that the VisionFive 2 Lite series is in good enough
>>> shape and there's a possibility to act on this months-old suggestion to split out
>>> the OPP tables which as we have confirmed the JH7110S is the same SoC as
>>> JH7110 it makes a lot of sense to do.
>>>
>>> How is it supposed to work for binned silicon in Linux?
>>
>> Hi, Conor,  Emil,
>>
>> What do you think about this? Hope to hear from you.
> 
> Can someone just give me a yes/no question out of this thread? I'm not
> really immediately sure what's being asked of me. What exactly do you
> want to do with the opp-tables? "Split out" isn't super clear. Does that
> mean into board files? I am guessing it does, since you're saying that a
> particular board cannot support the 1.5 GHz mode. It's not unusual
> though to use delete node for unsupported opp-table entries, could that
> be done instead?
> 
> FWIW, this weekend is -rc7, so I won't be applying any new material
> after that.
> 

There was agreement that the JH7110 and JH7110S need different operating 
points. This is realized via the different includes for the VisionFive 2 
Lite boards and the other boards.

Support for the new compatible string "starfive,jh7110s" used by the 
VisionFive 2 Lite is already implemented in OpenSBI where it is needed 
for platform support (specifically reboot). It is also used in tag 
next-20251119 in drivers/cpufreq/cpufreq-dt-platdev.c. There is no 
technical need to role this back.

The changes in OpenSBI and the cpu frequency driver could have been 
avoided by using

compatible = "starfive,visionfive-2-lite-emmc", "starfive,jh7110s", 
"starfive,jh7110"

to indicate that JH7110s is just a variety of JH7110. This also would 
match the best practice example in Documentation/devicetree/usage-model.rst:

     compatible = "ti,omap3-beagleboard", "ti,omap3450", "ti,omap3";

I guess we could add that third compatible value in a later patch.

As U-Boot uses the Linux device-trees too, I have built U-Boot with the 
updated device-trees and had no problem to boot all supported JH7110 and 
JH7110S devices including the StarFive VisionFive 2 Lite.

A bootph-pre-ram property for booting from SD-card that was already 
missing before the series can be added via a separate patch.

I think we should go ahead as is.

Best regards

Heinrich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
