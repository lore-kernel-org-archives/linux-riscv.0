Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B627CCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 12:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fFLMcQHtGL29IJ7ECAMawLP6kyi6LPUxE9JZ+bOye4U=; b=XDiii1TGkm39BW
	jW/V0Hep2lF5unn9EfJ3tgwGrvTxG3NYUjdr1dUNrZoh+Yfmr1Wdkh9SEO+mvIJ1dVpiOHisk7hao
	Qu+b/fp5zBbCOvBMwAx3okbsLd0GbN1V1cPlAxkC6+XX2JDh6WoSjxDOTi81mswKENL3lU96wvQbp
	+UAFvoiq2E7yhdg6+VU86PwhfHhwurZ0ij3dEApFH52tLYOqSpgQ7fvNdz1LPout7HJK6lZOtxVTv
	065JFDj+8W4vFb5Kl0RswDxVgho/1Phv2evmFqeMG/7QNHlh6reMBf7jjOsyzFH+BlJ0mh77T+4Xo
	fSreeX3PPaseayEmw1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiaD-0000000Ftm5-0gBK;
	Tue, 28 Oct 2025 12:13:49 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiaA-0000000Ftlc-2kIP
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 12:13:48 +0000
Received: by mail-il1-x141.google.com with SMTP id e9e14a558f8ab-430ca4647c7so24755355ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 05:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761653625; x=1762258425; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=khwU93CFPe3QSgLFIeava2HVYo78KABRwFXaYkzJCAk=;
        b=AJ6W101LDg8zw8DHukKdhk3Jg3eIuHi/0JVWmlE0Dh/9kskpRJjH4UO35txPXSgH97
         Kccg0Z7SaB97rckUJclVk0GgAtsr2xyQVZbYeE7ItiqPiAtLColv/csoYTE2AC++DOa1
         Aq2z6t78WTVq6gg3z7FJUZed4T0C3KkClIttqbOfR+qeRiw0KM7vnn/h4TtwVDgahk6I
         xo/u+FbuP1KCBYmFRPL3+LsfJVzE83Qq454zxyhI4y8KIyH5TIsKtohPBMvAcZNtDrQp
         BW4a5mAU9JY6BA6M5AY+tCC3f4d+UDUPY/LsH5pdEiMQUK06m++HW3QD9nR2q3ttZpi1
         lahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761653625; x=1762258425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khwU93CFPe3QSgLFIeava2HVYo78KABRwFXaYkzJCAk=;
        b=o/+lQ7U/FGtsgtrpBHeNg/ZPevPIsNcgLDJfppyXgZqxopHY/GrxKFsNks2EgpYwa7
         pBsAIG+kD8mpxtCEDqpZ5pOBCa5nB0GIdw5ivreP4OS42T4r1vCU3U0AqaGBLzqOGfD9
         wDoucaX5wlzAB7Kg8H+9r5JMsmxw97RHtoeSnNg12J+Q68NcoBo0eRGBfLwP9cjXVa5Q
         k5gEgKaOgqAklfg6FWERPL9j13IZm2PgD6G0vv2hB/W7ON+Se7y2MBT3UuEAaGv9rAle
         zZnAq4+/pYrVdn6cmJE3hSBrhLsZ4BUZUX5jAVaLtmdm/tdD7BZNbdIz5u8/CffifL8n
         n45g==
X-Forwarded-Encrypted: i=1; AJvYcCVAgCnbxLCy/EbR68MPE5SYvXmRkAW6SWkK7STTgFJPgo//tUyHGpRnLUi80UUcLe2UigfcZSnn3fKJSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YweviHysRBpHhYkygvPnc53ORGYgJRb3vAaNOoKl2TIeH7tOK/O
	R0F60tAdpWrAgNcomgL0eQz6WZr3M7/TLDJ2Ozf3JDvaj+SkteJQQPlGGXN9p7Sy+JE=
X-Gm-Gg: ASbGnctz+Vfhv1rigPGyvtwww+VAPM4R4l25Nmad6MxsW9APdXfsDhX2LXJ1G1QcmN6
	n72JJ3f93rNWmGmT/hknHjprKrQwc4Z2zfVd58sk6CLoTSTkc1aJEDRqWS3MC1PzAkl2e2JFH3Z
	My19DDlvzwbUfiGlUMxxqHXokrq/aEgu+Pb2wXoefqT27wKSH928cF5S7X2MOBFfxuOmRjkkM0g
	XkmzVDTFhUwg2qp1+5SSq67PhGsTvO+RCOTTNc5diIfUQdTZzZg/zgU+S20E22HkqmKcTRNKYtx
	eAJIQEqadgk10I2aTt+VCPbJlOEKBkAqqt0Dws/eigi2mJz7/KZnRUH/0/XAYUu8CqLkg/h8Qcy
	nwUDS+2ZvKFCJOcTdDDfgetTPbF0CDAvRHMeBIcp/U9tE0S123UNbyoTVc8vS0jeHhpsb1GL7Ku
	2PWbOKlCC5wvi03dWN7aEUjhh4KLs++7TanNz3BOIo
X-Google-Smtp-Source: AGHT+IFFKmfRm7wHQRo/Azl9/WRSsx5DMAL5YyC5rW7dp5KofBMFZhyFfl0BPEsUUmZluzy0ORJ7BQ==
X-Received: by 2002:a05:6e02:18c5:b0:42f:9eb7:759b with SMTP id e9e14a558f8ab-4320f7a8a05mr41476835ab.28.1761653625563;
        Tue, 28 Oct 2025 05:13:45 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-431f6898adfsm42280895ab.31.2025.10.28.05.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 05:13:45 -0700 (PDT)
Message-ID: <71ee4a10-70a7-49e1-919a-0b47af4780fa@riscstar.com>
Date: Tue, 28 Oct 2025 07:13:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] spi: support the SpacemiT K1 SPI controller
To: Mark Brown <broonie@kernel.org>
Cc: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251027125504.297033-1-elder@riscstar.com>
 <e4dd3db6-d554-4fd3-a674-60f2ff6e5475@sirena.org.uk>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <e4dd3db6-d554-4fd3-a674-60f2ff6e5475@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_051346_826618_43AA50C0 
X-CRM114-Status: GOOD (  10.11  )
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

On 10/27/25 9:40 AM, Mark Brown wrote:
> On Mon, Oct 27, 2025 at 07:55:00AM -0500, Alex Elder wrote:
> 
>> Between version 5 and version 6:
>>    - Rebase only
>>
>> Here is version 5 of this series:
>>    https://lore.kernel.org/lkml/20251013123309.2252042-1-elder@riscstar.com/
>>
>> Between version 4 and version 5:
>>    - Added Yixun's Reviewed-by tag on patch 3
>>
> 
> Please stop doing all these resends, this is just making things noisy
> and pushing you further down the review queue.  You should not resend to
> collect tags, and you should leave a reasonable time for review.

OK, no more.	-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
