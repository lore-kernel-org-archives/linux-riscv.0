Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76122D132B5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 12:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4ncL55giWTFVvtDegQtZXHbnptaBjyMUuCwV2ecD3E=; b=dRsO/Rljlc3YID
	fOjknJScPTfiDIIRBNA1aJoslImhBK0Q71MXp1Hnr0qKNlxpxjq+YMaY6ccDZkOw4EeeT2MRsZ3sE
	2eGcySVs6vTTom693ZE+LYMNoIogxk6yc9VAEnwv82YE3SBuaw0A7GkRfITkA1JpAekofASeh3hh5
	D8YwUbJubU2bd5aC8Rixb+TziPN7DN+cJoc2W5Mu1YwoHne/jukAIRd9+CSZZOCjQ/+Vq4HdGBoKF
	ciFfJllLjGwJwt5a88h8dlo+9B4P25i3/yzbzF9bc1SZ0nEAI2pZnz237Ir6bepfmEktygHoXHRg3
	Gzfpx62rwByQPUutyr5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7w7K-0000000DgnN-2xeF;
	Mon, 04 Nov 2024 12:23:34 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7w7I-0000000DgmP-2kNo
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 12:23:34 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-20ca388d242so39553765ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 04:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730723011; x=1731327811; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fiCZNrw+g0MfYd+wHoshXkkg40DDzaFGOl5IzkgDf8E=;
        b=XWReHGoYei0062vHr5fPdRmzkGgacWdOdhm50HVZl+Vn4qc9KQKS6btZKRknIQqRj1
         J4qi29zEtIwa0dGuf2rWEZqvdaUXlMFHarrMFTefc4toym7TefJ7AAa7D4ekDhUGJAI/
         INLiawGhzwL14GfQEp4GVJq1OxAX8jWruJ9+ucft4q1KvBQ62WLmlE5MGfgPpCAx7L7B
         aAjuMMEA46dj4OGEImWJ3V9mqinGkbR6ps6yn8FvBeE1dcHG7J/7nyei3tblkU//FfUy
         2LgtnzTqXpVk6KpqoCFswoHUjGY6IOiVgsVZe9QHSd7Zmp5940Pc1NtHBuEwMEB6u0fg
         6IPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730723011; x=1731327811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fiCZNrw+g0MfYd+wHoshXkkg40DDzaFGOl5IzkgDf8E=;
        b=UPwg7Xcr9zQfYZVGN7um6FFccuTitf+IkXipOR7s/cQfd6HAdVpU2ElWl/8ymIYeYO
         gN7KwJJJUvhXfqI3EN5+xpsXS1Kxqb0jZWeKTMTtnYZOTFBhv1A2O6h/9v61yHZHV1YL
         6XEW/u8SgDMj1On/AT011yrljsgOLyQwHJe28egWTFSSbJSRJha+ijGl1fuPkPf1djp2
         +M4iNeKIfsTz+4ky5PW8ikRU2EMidXkzQSc1SsGCS8cxbHx/qSFJG5bGbVy73exmA4Fb
         ahLWz+fZ1zxaCXl4p11udeTdEcE5Z2nOavGng2SC1ay7fCYLt6Jbtnd9/q0WEMptC12w
         d24Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRws9u/lFrlnLzPjGdL48mPZ+uvt+FLl/7AMTjboFXiT3byPR8p/TL8dIZ2odXw3p7STV8ZjJj+RaTVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyctY8AlY/h0Q1vmv2EdC+yag8XXnnu0GceMyEwcahKhLMG1eDs
	DG8w+Lbd6dE5m7A+dZL2Oalu3Xf2bAF+Fz8D012WmW+fXP/0ldYB
X-Google-Smtp-Source: AGHT+IHLvWMCkXJUq+FJuMDRusJubVpqKeDmaeSEQmUKm01US5Q5+wIpwJg+l9Cfx8xC6auYaOIr6A==
X-Received: by 2002:a17:903:2343:b0:210:e75e:4649 with SMTP id d9443c01a7336-2111af3fbfbmr177573405ad.17.1730723010690;
        Mon, 04 Nov 2024 04:23:30 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d3c3esm59811605ad.245.2024.11.04.04.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 04:23:30 -0800 (PST)
Message-ID: <edfaccd7-ac96-47fc-a174-912c8aaf0f5e@gmail.com>
Date: Mon, 4 Nov 2024 20:23:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] riscv: spacemit: add i2c support to K1 SoC
To: Andi Shyti <andi.shyti@kernel.org>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <stpzkggfwseaqy6kbppiog4xfbpq4r2jwix2nvredbmmjqzbsi@wkllt4jlingv>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <stpzkggfwseaqy6kbppiog4xfbpq4r2jwix2nvredbmmjqzbsi@wkllt4jlingv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_042332_731601_6C36B38C 
X-CRM114-Status: GOOD (  15.12  )
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

On 2024/10/31 19:43, Andi Shyti wrote:
> Hi Tony,
> 
> On Mon, Oct 28, 2024 at 01:32:18PM +0800, Troy Mitchell wrote:
>> Hi all,
>>
>> This patch implements I2C driver for the SpacemiT K1 SoC,
>> providing basic support for I2C read/write communication which
>> compatible with standard I2C bus specifications.
>>
>> In this version, the driver defaults to use fast-speed-mode and
>> interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.
>>
>> The docs of I2C can be found here, in chapter 16.1 I2C [1]
>>
>> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
>>
>> Troy Mitchell (2):
>>   dt-bindings: i2c: spacemit: add support for K1 SoC
>>   i2c: spacemit: add support for SpacemiT K1 SoC
> 
> As Krzysztof has asked, please do provide the changelog, it's
> important to track the progress of your series.
I saw a compilation warning sent to me by the robot, and I've
fixed the warning. Should I resend V2 with the changelog
what I miss or send V3?

Thank for your response.
> 
> Thanks,
> Andi
> 
>>  .../bindings/i2c/spacemit,k1-i2c.yaml         |  51 ++
>>  drivers/i2c/busses/Kconfig                    |  18 +
>>  drivers/i2c/busses/Makefile                   |   1 +
>>  drivers/i2c/busses/i2c-k1.c                   | 658 ++++++++++++++++++
>>  4 files changed, 728 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>  create mode 100644 drivers/i2c/busses/i2c-k1.c
>>
>> -- 
>> 2.34.1
>>

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
