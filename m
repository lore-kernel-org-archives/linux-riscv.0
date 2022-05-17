Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E417C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 15:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=pjm4etrwPsMD1qTsYCsddIUBiZqQdVl5qC1Dsl7gpFA=; b=Q9rta1lEFIG0uGfOzJYhoKbU3J
	hYWBpwLNxURIvEQT75nY9BQBWUcqf0+V7x9z5annz7RJO6ATylmoeEzj0CW//Ew5GG0wMz2DYDXK8
	Tt+jplkhbiqQEmuLikHA6QWHGfsOIdxTbtZCYmpdVe5uGicmfPX26ukkD1WayM5rHjIFx8IY0SM57
	JE7Tq2UEWDJV52Jw8nXBLxBHTllueZJzXDTvjAoMrrRw+JmQh4KBm+OtGXu2etrb+7r1R7hwCt4BW
	x7avsOMRgYoAxdsiN6w/X8lT2uRpu4p43rHAznFwnTU4jGrsiiuxAfKwLxMx/tAGKYgsoPbNzNtv6
	XwS4jkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqzVj-00Elur-5C; Tue, 17 May 2022 15:53:23 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqzVg-00Eltu-6i
 for linux-riscv@lists.infradead.org; Tue, 17 May 2022 15:53:21 +0000
Received: by mail-pj1-x1034.google.com with SMTP id gg20so7713052pjb.1
 for <linux-riscv@lists.infradead.org>; Tue, 17 May 2022 08:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Hs0EGDgiC/nheHQjay4f7d4Madw5Vg5K/0RTksKnNSc=;
 b=viw4C9/ootWzvMXVM/iHkeQImM8GisZFZ0TUqXoBE9zK6OjPuTxbFKVlQLtZ4bF4KA
 C8PaogOzBoJCm44PVbijfogy8HSlLmI0WQCKGNuy7tUYLvL3gYICpoII0EeHCI/ethJ0
 HI1kYg+HH4gDRhwwjv/j03aKITL6+IUfisvTAMjthrpeqX7YCWniPtAnOiORvreozlbv
 4IY/wSFj3HJ9G0alg8ssJpSx6WHPzMY7+m+YvPXHTHoiC2ACHuFLAzpA5LbBgTBgjGrF
 sM3Cn9HZTj+gGHGKEM9XO+34k/eeOVT/WRX3FRkWcVs44PbpX0Ehm0z8ieU+wKZ7UeGO
 VMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Hs0EGDgiC/nheHQjay4f7d4Madw5Vg5K/0RTksKnNSc=;
 b=04uw0CUCC79Y9FXMFCxuamuUnfSBGCYhltYswULXtWmIrWGtZJHGFNxVFWX5GfgBOZ
 Vk9OeX/kG1VxzOLxkCGn23sON3zKxrTIAOP/YvHrFWUM1h61T9lveumdfMaECUVcKNTd
 ZKLZnhK1tzxp4vBOS2ryjaKHIhu/JHlWrhBNlqt0rW35DY2SW9yduvg71gDZp3OgNfnB
 NExnXgVlXQXmjHdHPwZfuO8WFo3gWuDzaCfUCWCYFk4qCAr/vVFCvRI2Xatjdrx4wyux
 CVIjIfvZpRhFvOSwz2z48cQzYFGaV9vpYChH4/EKvrkVVNPN+0mG1GkIJ9REnuII3mq4
 4Xng==
X-Gm-Message-State: AOAM530JqtjXMhRbQwrdPEvUGGqfYM9GX6RgZsWFPPG8omNlt9Q3TsZp
 RkYnDrm8rA1iNrutd1at/5fmhQ==
X-Google-Smtp-Source: ABdhPJyCnhFvvuk6ZClBb8fG7LYd4wXxtM1aHKMyOUTynr2YG2isxqa1mMxyv/2NdJpo4oXMmj9yKg==
X-Received: by 2002:a17:902:d4ce:b0:15e:8d66:d20d with SMTP id
 o14-20020a170902d4ce00b0015e8d66d20dmr22875474plg.70.1652802798296; 
 Tue, 17 May 2022 08:53:18 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 cq24-20020a17090af99800b001df1f7c5941sm1875114pjb.16.2022.05.17.08.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 08:53:17 -0700 (PDT)
Date: Tue, 17 May 2022 08:53:17 -0700 (PDT)
X-Google-Original-Date: Tue, 17 May 2022 08:53:15 PDT (-0700)
Subject: Re: [PATCH] riscv: dts: microchip: fix gpio1 reg property typo
In-Reply-To: <0f9398aa-ab7d-44e4-033a-e13bf57f88d2@linaro.org>
CC: conor.paxton@microchip.com, conor.dooley@microchip.com,
 lewis.hanly@microchip.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: krzysztof.kozlowski@linaro.org
Message-ID: <mhng-3ddeb279-a369-4eef-b74f-5a4597852519@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_085320_483057_38431F5C 
X-CRM114-Status: GOOD (  13.65  )
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

On Tue, 17 May 2022 07:51:32 PDT (-0700), krzysztof.kozlowski@linaro.org wrote:
> On 17/05/2022 12:40, Conor Paxton wrote:
>> Fix reg address typo in the gpio1 stanza.
>>
>> Signed-off-by: Conor Paxton <conor.paxton@microchip.com>
>> ---
>>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
>
> Pressed send to fast...
>
> Please add Fixes tag, unless fixed commit SHA is not considered stable.

Conor might be asleep, and as it's late in the cycle I figured I'd just 
chime in directly.  This LGTM, I usually add fixes myself if there 
aren't any.  Unless there's any objections to

Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")

I'll put this on fixes.

Thanks!


>
>
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
