Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE73CCD1AB
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 04:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zy0CYs26GEMvdPsAFwwOa06UKTmNbmSuRA3P4x6SWJQ=; b=HBGcTyP1Uajb73
	ueUpoA3THpI78nIjE9RX9nXAS/RGSFata97FqKIZfAqON9/sIOwRRh+Gbj5Pt6QIvohpXxj395CDP
	5jrro/6d87m9N8ljpnc6/xNtmiS9UMP4LD0uzHhtGcrNom7XwzLe4W8ZL7Tce4vRLbxXrQz6QGSPN
	AoAZX10KDRxyxm7ukutREsRxz7zdxfMwt6bpJmRlZuPkNyVzMv1LlSZm+A/LaocFs3Y9x36yj9CEh
	iF7wsyG20TN6yEEPHzoJBBs48RimB3awncTdk4bdLLINV0lVaRzlXb2S+Hx/z/2kBW6vWCYBRk284
	H1eSw9IT6E/9utSvBdpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQYG-00000001R8X-0i0r;
	Wed, 22 Oct 2025 04:34:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQYD-00000001R8B-47iN
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 04:34:19 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-290d14e5c9aso60568045ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 21:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761107657; x=1761712457; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ppwCPMx8V2Sf6deae1nCYy7pnPOnc4IDjA11Y0/2goo=;
        b=WPcd7nhSoqW+cCWvAloLN+jb+mMotRM217hM2dg1murfxUbNkPglIR5roucePPfMhv
         j63//86ccoD7k6Nh78Qc8iMBX7S86lhvcF8AYcVRjM54GsVr1EuFnsb+7wg6L1koTiJq
         PUw8z1+28vcuQqeSuRA8V9fuKtlw00WomSNZ+btWP1uH1sSKHl9lnOlJ/+0O63xt/1zM
         C2TAz6ZZivhzP3UvcuQbm+HiBZuxMmi+gDE2FR4p9Jo5488fcZCMt/5pXOp+cgF/ZVAI
         xP74eFPxAquw8fXC56v3PMR5bgklTjYEJLK99Hg8G5m2pXERII/+FL8Yn9z2BBENb4PU
         zJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107657; x=1761712457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ppwCPMx8V2Sf6deae1nCYy7pnPOnc4IDjA11Y0/2goo=;
        b=hqkg1ssrP15YKFgjFLyYqihd9YZFU1OuO7f2hsEgi+cSagvNGX2yToKLwXxf67ICdw
         mAefFzzMWnNNQ7YOkabtdS9LdlZHxAEyFWalKUnThSaRnOdMIDjI+ATk5qq7jr4gknCk
         vs+w6GWt78VGrNGqIbU1qkWpAbHv5RRLP4UhAT1vz034JntFLu3QoBOs9MXmicgdOk9K
         1W6RZ2pcKZZpp2R+bfsIHqbp0Ik9E6hqNiq7TfS32RTELLuRO6BSbmG+voKOIloe5lVm
         rendlxK0oSlVA2xGoeARjQ1ZlIwJZgoFkkRiCsRjH+5qT8BSenyxK2hQbz4xXpcVl+hT
         pFtw==
X-Forwarded-Encrypted: i=1; AJvYcCXfz4j6fpD4E0ikpik+r9+I5+frUs9NawAHeYcFC9fo2C6iYsEmXq4FKH9e1Wjz8Xk37PeuXcYb6Dt4/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeyytybqCyxOr1YxKW/ABEedU4DfZXivYZV7Jqu1vYgKtSBibM
	0p00YXWELYN1UrLJYxOaxi+UBMg5N/WGf2qXDCJFwt3fcWYoZq6dPPf+ScGdlMMU2jI=
X-Gm-Gg: ASbGncthHB8CeSuE13bDASq9Sym8J1xVgyudO96Uco+uacr9yO7kWYNcOshmj6Gc+wy
	zkewulHZE7W6Cmfw8qccgUgid/5BCmmfvSa39WSMbR2Jl71vtvgHgwk5813G0HLjThP+RdoGRmP
	qhLrIfSLSWuEboSmkzUlCSbRqeNf3UCncL/i1s71g9KjpSSQLOeJPrg6E5RqXxQHD+zpZTwwhTy
	22mzm42lDnuZ1K1tEwA89RVezsrR+IoMvBZqEF0b3R3ySfgBq3/3UoBp13iI2bgfv5/9sXnoi7I
	qA94O7MpVPQsJCzdMFIQK7HqChBR9J0jSTTJ+Tk0Qq6o4nIKErF9nvejGRleU1lIhEuG3cdJ6pH
	im4YTU/hz8ifORGzp2Cg1LPMnVWMIRXQ3oBS6THunR6tgvkarsF7TwYnkzZdIad2313Cm6uDc6Q
	bFWTS1ynBVWnMe
X-Google-Smtp-Source: AGHT+IGRbL8alcY98vwlpMmB68/E/fiZ8vvTYnBqywFldOw2mBZIi0C45CU+Ljv9QC55tUOEBjim+g==
X-Received: by 2002:a17:903:1d1:b0:290:2a14:2ed5 with SMTP id d9443c01a7336-290c9c89fd2mr213302675ad.4.1761107657244;
        Tue, 21 Oct 2025 21:34:17 -0700 (PDT)
Received: from [10.211.55.5] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fe4cdsm126257025ad.97.2025.10.21.21.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 21:34:16 -0700 (PDT)
Message-ID: <ba01b2a5-a04b-4a6a-9257-09f38f2ba5ef@riscstar.com>
Date: Tue, 21 Oct 2025 23:34:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
To: Conor Dooley <conor@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: han.xu@nxp.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlan@gentoo.org, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-3-elder@riscstar.com>
 <20251020-blinked-primary-2b69cf37e9fe@spud>
 <b28d71c4-d632-4ee5-8c4b-270649fca882@riscstar.com>
 <710c36f2-3551-4738-a965-f1564416348c@sirena.org.uk>
 <20251020-florist-campus-a397bf94d129@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251020-florist-campus-a397bf94d129@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_213418_051518_47EB5426 
X-CRM114-Status: GOOD (  15.76  )
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

On 10/20/25 1:39 PM, Conor Dooley wrote:
> On Mon, Oct 20, 2025 at 07:26:17PM +0100, Mark Brown wrote:
>> On Mon, Oct 20, 2025 at 01:06:46PM -0500, Alex Elder wrote:
>>> On 10/20/25 12:39 PM, Conor Dooley wrote:
>>
>>>>> +          - spacemit,k1-qspi
>>
>>>> Are the newly added resets mandatory for the spacemit platform?
>>
>>> This is interesting.  I never even tried it without specifying them.
>>
>>> I just tried it, and at least on my system QSPI functioned without
>>> defining these resets.  I will ask SpacemiT about this.  If they are
>>> not needed I will omit the first patch (which added optional resets),
>>> and won't use them.
>>
>> It might be safer to describe them, otherwise things are vulnerable to
>> issues like the bootloader not leaving things in a predictable state.
> 
> Yeah, if a linux driver requires that a bootloader set up a clock or
> de-assert a reset etc, then the binding should mark them required since,
> as you say, a bootloader change might do away with that de-assertion.
> Additionally, the stage doing that de-assertion etc could be U-Boot
> or barebox, which import devicetrees from Linux, so making sure that
> the resets are present has that benefit too.

OK, so the resets property (added in patch 1) will stay.  It will
be defined such that it is an optional property, and only when the
compatible string includes "spacemit,k1-qspi".

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
