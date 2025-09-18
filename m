Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CE1CAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 15:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1ZZ0Emb6AxBpZeRP2HhaAaog4T8ErQKWun/QSv2Sv4=; b=fYlbwVJjD9JafW
	Wvlk4N8dSiDG6vXfnMaAeqen6/vH3nDQNca2j1i6elBqjdzw6UvGu6TT1LXLUh55xOEQTnaSbSmyC
	cYhQkFE66fobRd11XOsPmKMHQ7aP+EUQjdbvpk+IsDPqpMLTDbSvLAO+ey5cvmlqZl6VODv8AnmF/
	oyuLeNb+OMVZ9X5UMU/e23n1ML7/vOKLveRK/KPDZUA35ibA6lLPBSU4ms7pW9u/9x1hpAp5clzh2
	eUz2phqeiWo4McNDkjWKk1n2cp6RTu7LXziMNYfjioQqxtplrr/zwu6kPHOxr1h636i2miheJb6/b
	KLawUG0peUKlPtF0A9vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzH1v-00000000XJG-3zRu;
	Thu, 18 Sep 2025 15:58:43 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzH1t-00000000XIJ-34AH
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 15:58:42 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-88432ccd787so71425439f.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758211121; x=1758815921; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RWwPXk3+CMDIY3Ii9TMDH0aQbdb6ssOVOtszqmINL5E=;
        b=M/2HD6QF7gvVsKNoH8hCWbFNRN55wzS2NVm8Qa9sKzdiErHES0nDkGP598xDRd3rOO
         ItyT6nlMBG2f+0BkjEG4L1ujps+/L27PxFFK9OGSwlCAWeeMgqHQIoGJ5CFx57H9BKQw
         KRO4s9iGk0CYoFMfI8HfsAiLjW9HTkr9asagH5p/KLPx9S5Vnp+Wm/vekTsrnehlVUrc
         tLsKT9bCYRXD9fBssLqVIzD/3O7f2YHNRddr8epfcNEtrnbMFUKq+ecTi9Cq961KQ5cJ
         0pIsUIEWmcuYyRHDaEFkv7XNiMC1rOaGQjBTBBaKkTZ5YMmnzf5gxV+ygu6NwrC2i12Z
         mSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758211121; x=1758815921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RWwPXk3+CMDIY3Ii9TMDH0aQbdb6ssOVOtszqmINL5E=;
        b=jbjgHrdiKq6nLikr+pMhPHS7YEInMv12mxdo3Wde6f/kU2XIelE8/KatCqlf9QmUvv
         vS0golAhP+fH1JZUl3eW1PpKiOKJbXMPXBJLWELXFtQ6333O9r1NIm4SkrW74mM/cToR
         GrGHS0TUxDSDnwOv2vJSjzqEVF099xZ943wddMtmrfVhH63tWufHdENQCBSI4kOzpI0c
         U1AiWZbnxUOhLcU9O3/wmIx58SXwffn2M7NDOUPO0WcKfJQMxmH93ZVhAFx3P9E0ry7B
         D1kV7DgB8r3zJQfq63qoyvr8iCR1DIlVyrUYtbUKwz+SDaMPYACrICR3tkSPvTxTst5U
         NmfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMjDL+bnqOt1PEtp8piBadTdAkC/7MqhwLU6AgROaLyk4jbOLgirGdwU2nysUa8a60+x/Koj1ozC6CTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPg8PCO3UChNZKnMvy+HoiHHhdwqBwAXvg/wmGwu1QEALlyaet
	Q9yQcozghJZo5mEIipQkqHPEAg/LYimrYXrqmSz9bVQ91llQx+cshuFy1zcj+jbK5mY=
X-Gm-Gg: ASbGncu9AAxNNBAufKrCQ1t/hlJqLkUgfLXFEmNPDX6R986caHqlHjohEtkwziYk1zh
	usRBuI6m1HxXtFUrQOo3SigIJd7hXtd3pOPP8LPkr0avHxvYU6aQUqvlXgnzyOuz1aGNPXtz30z
	Q6zH6qz7PmoVpdrv7/Lw4yeBcHgFLulrDALmrdg16/WxXcmsiMPYwahPYYqQxbgaugiVZ1XdXu/
	2kvemkpcrv95MazxcQ3xuheVFe+uUgawNJtyR4TqKg5MLpuWerbCw6OJ0uE4EawWNV81HtHdDMu
	B26OocUjYGeDTJ84TANss4C4LGAqBUxfidkbq0auem/shsdpFEEFQcM82zdaRadpskq5OstCJrt
	0N2Rek7WjHdjjM77L3sMfKyPjqLq+owJ+BuSmW/TxM2fke+lx0IM9S8lZjpoW9ozNhnh/jVv6eb
	pwd1Zh4Ne86ni70zCf
X-Google-Smtp-Source: AGHT+IF7L6Nzhpq00zRjUOtUlsvmOyj8YvPWYBfqvWW1/q2pHZGHXZWCIyaJ4bn8yb0d408EYIgLfQ==
X-Received: by 2002:a05:6e02:b48:b0:41f:8265:4100 with SMTP id e9e14a558f8ab-4248199c677mr962075ab.18.1758211113083;
        Thu, 18 Sep 2025 08:58:33 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d3a591637sm1058871173.15.2025.09.18.08.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 08:58:32 -0700 (PDT)
Message-ID: <000a41ee-a099-4944-8ef5-eed768f905cb@riscstar.com>
Date: Thu, 18 Sep 2025 10:58:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] spi: spacemit: introduce SpacemiT K1 SPI controller
 driver
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-3-elder@riscstar.com>
 <20250918124120-GYA1273705@gentoo.org>
 <034cecd3-c168-4c8d-9ad5-10cc1853894b@riscstar.com>
 <20250918143928-GYB1274501@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918143928-GYB1274501@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_085841_777797_F69794F6 
X-CRM114-Status: GOOD (  14.19  )
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

On 9/18/25 9:39 AM, Yixun Lan wrote:
>>>> +	virt = drv_data->ioaddr + SSP_TOP_CTRL;
>>>> +	val = readl(virt);
>>>> +	val |= TOP_TRAIL;	/* Trailing bytes handled by DMA */
>>>> +	writel(val, virt);
>>> I'd prefer to do like this, it's more easy for people to grep..
>>> 	val = readl(drv_data->ioaddr + SSP_TOP_CTRL) | TOP_TRAIL;
>>> 	writel(val, drv_data->ioaddr + SSP_TOP_CTRL);
>> This is an idiom I use to make it very clear that:
>> - The address being read is exactly the same as what's being
>>     written
>> - The value read is being updated with bits/values
>>
>> I find that putting the "| TOP_TRAIL" on the same line as the
>> readl() call obscures things a bit.  Like my eye doesn't notice
>> it as readiliy somehow...
> fair, let's put it into another line
> 
>> Yours is a pure coding style comment.  There are two pieces, and
>> I'd like you to tell me how strongly you feel about them:
>> - Using virt to grab the address being written and read (versus
>>     just using drv_data->ioaddr + SSP_TOP_CTRL twice)
>> - Put the "| TOP_TRAIL" on the same line as the readl() (versus
>>     having that be assigned on a separate line).
>> To me, the second one is more important than the first.
>>
>> Let me know how strongly you feel about these and I'll update
>> my convention througout.
>>
> I'd strongly prefer not to introduce 'virt', so be something like this:
>   	val = readl(drv_data->ioaddr + SSP_TOP_CTRL);
>   	val |= TOP_TRAIL;
>   	writel(val, drv_data->ioaddr + SSP_TOP_CTRL);
> 

OK.  I'll do it this way throughout the driver in the
next version.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
