Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64342CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 18:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Um83afHTG4r05HAt6JyyHmWqSQm0NsjWtgNCf3cORg=; b=w2s6fE8ZRFXmcA
	g01Bn2hPfsrPFzXlLWLLDxCdnvxazlGP/9s/GJBlzwAvWSx16y0jMb8bg76kc7PhRFZ6VrEKPskv6
	W9HBxqpJ8mZlVIJA4jbvIrGsLLFTNay5UVGaAZSoNP1ONm+6T2TNweVD2/XQ0JJbn57brjp5Cu95b
	pg0tDrKDjyLdxT7TPqrBBhCOyfUtImVKH13cPOzTjcBUzJX61MOtgqVSBjLIrfld2qxVsJQ/soLnS
	YORqmUsk3C9KNYNgJayBYLD800YJUBYCBfi+jMVSp5eckEWTAlJPmQsV/VxkwQgwR+n4968QbUjm3
	UVtY1Wk0EOZNO4muicrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuHY-0000000EaMY-40Ij;
	Mon, 20 Oct 2025 18:06:56 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuHU-0000000EaL1-49Wf
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 18:06:54 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-93e8834d80aso107729939f.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 11:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760983612; x=1761588412; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXBtLkkB0DB8TY2tig01PgEU/TWly7nbkJIcjJq9f9I=;
        b=CMOjITnOM8+8R2GuvcFLkEx1Pyd5hRc2JN2/tpe6K9q7OIJJlcMRkHn7sxc9ik62WA
         S1em+HAlLjdBEhbfFOt3Yxt3DOdqeUgpny/qeqhZVLc+G0r+0KKnCVxXvThXvjFVGJfL
         1C9jS7jR/FM7jnn0m99URYqDk9dim0KyZRGUwGSvT0SrgdGozrqDH4Pw/KRI1F239IIq
         /4fRHnmcdSFDrBcZqdOM8bqRl9lK/nTys2c5Ve+8x5ffd6FLoJ+pqu78vcX2WEqbQYdN
         3T8aTFXM7fklzC7MMC462ZusqtX5cYPPzl2N+PRrUCdc7a6meNRtxRoSXkrW2zAug++Y
         QGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983612; x=1761588412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXBtLkkB0DB8TY2tig01PgEU/TWly7nbkJIcjJq9f9I=;
        b=b1T5u1wkp31k2hS++HsUm19UWxXygU6AtxmKySzyfd7zElVXmocuCpMVNV4rAEdxgD
         Dp6S/FWNEH/w/CEMsMEXcgDbJqcr9vMwwFyX7xHFcQz0TwvKeefuCF9ojEriv8UQl1z6
         vu+bYIj9qYNNvBU1TqiN328QihyaOrQ/Yk9nLpekXffvevJQzlS7T5RNfNO78S7wLPuw
         xeNmokkY/11dkwrMxs3Dl4SWpeAgAJqP7dwPa6jYWSLNe4KqIERcZwSQLrgJsuH0LPFi
         y/HuhHAf8VgzyoO3huqBUPLbQfADoRUN/iwAjNvWird8T0ba5p0+XXS3MdjDPq1Drsvs
         qi4g==
X-Forwarded-Encrypted: i=1; AJvYcCWKWgd46hudFDb8Zd4bo5RajG7ZnjKpYNXhgd2m42pXvTC0gHtPJ9gmqMogRu+R3AACN8i495jSD7M2XQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf7HwrTeTQIJ3Ovc5kN8ge7QhgpGbg2XOQ8LQfXyZuaopC5c4m
	p6nSk/I2+GF+oLb05frnHYl84ElLpQBlkSJk9Yq7ADHzDRw81Sa+5BfD/+oCvqmlS9Q=
X-Gm-Gg: ASbGncvV13sj7eQREtEINDywbDTtES/jJkg0UiIYbjKmH1NCbxGieDcHD2sfpTKxFez
	RHD6sze+6mi4c9QucoipatZCCCz4V9HUfeEJfAvjOGXG+I0CY1BI+QlFZi0N5LkhIpVQ/8LwiyM
	HNf82pqadNesoKXNNAwkncOfVzrbSygY/Ci6IjY4mbFxSPIR6+TDVj4m5ba0eMmBxWaS4OIRce9
	fK6lZguuOZNuOy5766CBqrjYBuNasdOLOBSGTzuLXQahtajjdi1AmNeevFVX07yWQKVbSIW3OIq
	QXCJHlr5ETdfXg4HseUNMx3M6gvDv60r9QZuU6G6AEIoknel6oYL6c/X+et3U94xE8HhuAAEctb
	gEX9N9NHz8xbXrjTT+1bMwXwCfSWm8nuwEMZkVzRSe89o40VCj9dAvsMPT7/MROOO8X58ovzTtP
	OicsP1WhsSw0ZJjP9JrARkL6Q7MM3VlJzGdHs7nrlA+dPSKYGyVQ==
X-Google-Smtp-Source: AGHT+IGevb4egGjj6KWxQP35Nq0zUYSUBGNvYU6Luo+078jNAKiHY5b+2d/guD5dVmi2NJ4AhRB7Qg==
X-Received: by 2002:a05:6e02:190c:b0:430:bf84:e941 with SMTP id e9e14a558f8ab-430c51ecf81mr209120355ab.3.1760983612156;
        Mon, 20 Oct 2025 11:06:52 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a961e88csm3172542173.15.2025.10.20.11.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:06:51 -0700 (PDT)
Message-ID: <08d99fcd-4d0c-4d81-a314-7e1a8bfaa64c@riscstar.com>
Date: Mon, 20 Oct 2025 13:06:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
To: Conor Dooley <conor@kernel.org>
Cc: han.xu@nxp.com, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-3-elder@riscstar.com>
 <20251020-utility-remedial-4b4dfc716409@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251020-utility-remedial-4b4dfc716409@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_110653_056488_E44C36AD 
X-CRM114-Status: GOOD (  14.76  )
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

On 10/20/25 12:41 PM, Conor Dooley wrote:
> On Mon, Oct 20, 2025 at 11:51:45AM -0500, Alex Elder wrote:
>> Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.
> 
> Also, you should really explain why this spacemit device is the first
> one to be in what's been an fsl-specific binding for now in the commit
> message.

I'm not sure how much of an explanation you're looking for, but
yes, I agree with you, it stands out that it's the first one, so
I at least should have acknowledged that.  I'll add something
here in the next version.

					-Alex

> pw-bot: changes-requested
> 
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> index 0315a13fe319a..5bbda4bc33350 100644
>> --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> @@ -22,6 +22,7 @@ properties:
>>             - fsl,imx6ul-qspi
>>             - fsl,ls1021a-qspi
>>             - fsl,ls2080a-qspi
>> +          - spacemit,k1-qspi
>>         - items:
>>             - enum:
>>                 - fsl,ls1043a-qspi
>> -- 
>> 2.48.1
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
