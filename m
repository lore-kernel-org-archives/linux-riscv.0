Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A18C28B30
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 00:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cR/ZOWgNBbaxHeMikHepMhDJpAqHIxChJLROHUzKiBE=; b=JSnYTWkpu++ihr
	PxT60BD8PjYfCxv4Kf6tEc0u6lUfwgCfeqfv9cGoz3u5gDu2C3TLpDcJZxYYXDkk9eFm92oG6Ot/h
	I4t1TUKzZ0XV7ZdN0bX+TsESANleNHafr7LbtKrzejO7dbCI+e5aguMh7tGWJKavzFJYZvSMtP00K
	sD31Xmi95lsAhyNVAzxz5RdIsAzx0B3Q2ihOxhgTLSRAl4G0ECpPLrNRPgIvkUA5OudiJlawO2VCt
	6KAHMKA7J1lyLG+H7PEVFi70MWvmrSGCCivpyRIwXPVak2AH05axe3GnX+jTAa24qYBVoAXDHkAJO
	SAPEW0Aluc4EpWDQOGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvPtl-0000000DVu9-3VnJ;
	Fri, 21 Mar 2025 00:06:05 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvPtg-0000000DVt6-1FY9
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 00:06:04 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-85ad83ba141so177464139f.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 17:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742515559; x=1743120359; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n4TfadqjZ0j6MqAFYL1jRZZ+rK1DG5WpxhhztW2TPnw=;
        b=BHxBqGmoz+tDb2ww4qrqM957X03k3Yp0erwsI8ZCIcKHfbU0sTzT5oHqPkR7ZAEwKM
         4qOdIePPQw75tiafvy7SIfPKB2riY8tyHUxdGAfWSiDAjjHQuaMeTDlSgFbhUShQFg/u
         iKDJqzn1S/L07vIUvbvmKzWkfD+fDKZ3NTr06HuRRk6lXT9K0wrPQwy6BbDjHmb7rkbg
         RFBrH+MFxxN0NXChz8dQuP0U/cJXS8Z4Gyl6PZ4eNyfcdkkLFaEc4VEYyCM2Gde+ACFu
         WSE8WHY8uaKdJLthYqOGf69mje8aaoVromGWBcWkZn409LiJUGThjLVp/d/R7UFiRnWD
         XWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742515559; x=1743120359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n4TfadqjZ0j6MqAFYL1jRZZ+rK1DG5WpxhhztW2TPnw=;
        b=UAU1SlRv2y/djrxz64r4Mse6ejEKcHjFAj177Ml2oFmWycfXO/oHNuNdBVrNH7Vx7/
         RZ1SBPyXxKsZMArMrg4ydPtF6v7m8aC5500G3gFW5VAQdd0qOnJOsvYziCLdDPwMpKXX
         berRudOGm9j8FBFfuMgPpn29t+7LErc7M9VV9G5sWuIr2Jg8QQq8alDT1hn/bXgmyit4
         GR4cO2wLShLcLpdHgAciByFXpulOtmljpUm5dThRuECQwHYiq3k7AxwQg+ypz50LhegG
         TN7xHP4i36PBwoyicilXDZe99IOLwm1KyK9Q6Fus6xJv52GuBTvy6AYnlzF5qgCP9gKz
         Ybhw==
X-Forwarded-Encrypted: i=1; AJvYcCVzBA9S42eN/1xgUn0xw50IeBEl207eNtN5wRSCN4Rp+Ku8IPauI2PN+sK0sAlrMo8ILUsxhmHFkd3obQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl7aaBxo66fFjjSc12nSIsmGZyAK4UAXBoqoG+hiFplmkEcf17
	QmvXEuyVMTKu/Ex72Uv+xHpLzAK6ky+4qiKz4rvTsXR9IP/UW4/LNQ1rjFFpt1c=
X-Gm-Gg: ASbGncuAeAwxIJbppd5+ThgOVKVMcVx2a9zKa4qfgKmwmFTLXLyeZRh7jZ2X67v4rSV
	Ew3p2eV/1AZdQpL7cLIUt5p0voSDq0lmyfzCo6gHuJWPe4Kvr4gMboTFkJO9hbAQLozh12tYh4t
	r08N5DvMWnROsJz6ZGjL7gPp3SvB/oRO6yaz++47hL6CPCnP3c698fgxeOmIrOujY5kvZL6xQjb
	0BTV2d/TDdtB3pg0b0N97A7MAAjqD8Ap7PDet+2hkHzdn1cEYsYhWg7SEaQ61JzSixAKmM1tqGV
	JjDCG7BwtcJuUxv2F5KezE/kpIFuBrjB5JX3vK2/uaRLqfzxGyLPZri0NG5YivKuPYwvJGNWIkw
	X+Isk0mkXa6x8QoIqcLki2eGv8t7U
X-Google-Smtp-Source: AGHT+IGzFnEpgZCQdgtfV3+fVi3PtzjOuuJwDIrbNxEcjYjLjI8xkEowRotMUucCu+Yti4QqnIOtrA==
X-Received: by 2002:a05:6602:3f08:b0:85d:a5d3:618c with SMTP id ca18e2360f4ac-85e2cb59310mr109252739f.11.1742515559239;
        Thu, 20 Mar 2025 17:05:59 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbeb21b0sm167895173.115.2025.03.20.17.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 17:05:58 -0700 (PDT)
Message-ID: <fe26de4f-5593-4f34-a752-5fb051972c31@riscstar.com>
Date: Thu, 20 Mar 2025 19:05:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: spacemit: add K1 reset support
To: Yixun Lan <dlan@gentoo.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250320194449.510569-1-elder@riscstar.com>
 <20250320232128-GYA10498@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250320232128-GYA10498@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_170600_571491_D04114F3 
X-CRM114-Status: GOOD (  21.01  )
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

On 3/20/25 6:21 PM, Yixun Lan wrote:
> Hi Alex:
> 
> Thanks for sending this patch series
> 
> Can you also CC spacemit mailing list: spacemit@lists.linux.dev
> it should be handled automaticlly in next 6.15-rc1 version as the
> MAINTAINERS file updated
> https://web.git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=4a0c4e723c94

Sorry about that.  I will copy it on my next version.

Are you asking me to RESEND this series with that addition?

					-Alex

> On 14:44 Thu 20 Mar     , Alex Elder wrote:
>> This series adds reset controller support for the SpacemiT K1 SoC.
>> It is based on Linux v6.14-rc1.
>>
>> It is built upon the clock controller driver that Haylen Chu
>> currently has out for review (currently at v5):
>>    https://lore.kernel.org/lkml/20250306175750.22480-2-heylenay@4d2.org/
>>
>> It also depends on two commits that will land in v6.15: 5728c92ae1123
>> ("mfd: syscon: Restore device_node_to_regmap() for non-syscon nodes")
>> and 7ff4faba63571 ("pinctrl: spacemit: enable config option").
>>
> you can use b4 to handle patch dependency, and currently you may got
> linux.riscv.bot complaint, but may fix later
> https://github.com/linux-riscv/github-ci/issues/24
> 
>> The first patch adds three more system controller CCU nodes to those
>> implemented by the SpacemiT K1.  The second updates the existing clock
>> driver with a structure used for OF match data, allowing both clocks
>> and resets to be specified.  The third provides code that implements
>> reset functionality.  The fourth defines groups of reset controls
>> implemented by the CCUs that have alraady been defined.  The fifth
>> makes it possible for a CCU to be defined with resets but no clocks.
>> The sixth defines three new CCUs which define only resets.  And the
>> last patch defines these additional syscon nodes in "k1.dtsi".
>>
>> All of these patches are available here:
>>    https://github.com/riscstar/linux/tree/outgoing/reset-v1
>>
>> 					-Alex
>>
>> Alex Elder (7):
>>    dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
>>    clk: spacemit: define struct k1_ccu_data
>>    clk: spacemit: add reset controller support
>>    clk: spacemit: define existing syscon resets
>>    clk: spacemit: make clocks optional
>>    clk: spacemit: define new syscons with only resets
>>    riscv: dts: spacemit: add reset support for the K1 SoC
>>
>>   .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
>>   arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
>>   drivers/clk/spacemit/ccu-k1.c                 | 393 +++++++++++++++++-
>>   include/dt-bindings/clock/spacemit,k1-ccu.h   | 134 ++++++
>>   4 files changed, 539 insertions(+), 19 deletions(-)
>>
>> -- 
>> 2.43.0
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
