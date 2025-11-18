Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F24CCEE346
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYE+AC5Ny1vDtnBSt1pVUQXFps2qSHCQMsx6KEtV6j4=; b=S+Xi0HrdXmJRle
	E0X86tHesvueyjygIewIsYNbJDNFV5aVJMycfpXRbCW/HXID/9vdC/38IUsmyuI4q6ngRNO1ZhfVl
	BYUr4dkpZWH8V3Cb6UeUicgFRU0pEMILGJ5PHkHdxbeFsPtzVMKeHEjRXD4Q5VkMNEOxxqJifSyKV
	I2+lWzuQV2lXw/gX5Qs32XfdNF08+IxWH4HkQfm86Ugl03xfzxMjrMLJR3auTKygpNNxGqbrHijC6
	e/A3fp8FghJyPysxPwZNp6c4orIInckt2GMmbtD46zm0GCmtDyyWYtlhPqz1kGbLSiXxJzy/H6nyL
	gQZGDvP9Zh8JXnCVGPLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPZa-00000000rpO-3skz;
	Tue, 18 Nov 2025 17:32:58 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPZZ-00000000roZ-0pVJ
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 17:32:58 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-4349044be0eso25549435ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Nov 2025 09:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763487176; x=1764091976; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ec5izO6qQ1oFETz1h93VLus1xZ8qz7zlXuLKIwfS2RQ=;
        b=KNJfv8Dwh3mv1jHoYeJ1REBmy7CtlampTUZsZkCfhbxribXCOvwmTxaj2xxjWKlFMZ
         Sn2vqFGPz6JsArlfBdwH6Ex8T+XNi/B14zuwnx+JORGbj4rwZE9w7Yq/MA3Vp7uFQiUC
         Y/0H57/ZatTh/xqmW7KWNuZUrhkrHRQUdsPT4rm0ovJxglpPXwp0Xh0fn6odUT1pmNx7
         ry7di2vXR8+1FlR7wam92RalZNXEAjTV4a1ipSCHl9SxKwVUVKwcUb2m0O0eh/RQ+tfN
         JQKbRDKpZAsTL9y32w+MP18j64t8AMb3qxD/5T+PrOyv1d3LuoW6f/Rz8HYNziE8XcXG
         ThVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487176; x=1764091976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ec5izO6qQ1oFETz1h93VLus1xZ8qz7zlXuLKIwfS2RQ=;
        b=uYg+uuceHCUe3lkp9ruT1be0y/BD9NTRHyXTPjqtESyhe2WpzQ1YBaPTygBi7kSDTw
         pSBYSHgNFJzejCuKt+MR+LAnsSUBUbEweRTZqaZj1Dtdx1sovEhv5NHhS//JAZZQ7Cul
         yESb8gA1sjbPWbbiROHnClKKyhv1aKHAb1zC1rRMq3WHeG4s6O/OCR5PP7ZvVe3D3+yU
         xc4wqgOrI2MyHVu/f3IeRTC+qpgCSjW5B50hmsKwsc50JpNNdltf4tg/d+Es6eVQcXEc
         nwC3mJ8nky0HGazpuAG49VulgbwA2+yc7J3EhAxXEix2EKPzWUznwtirr7iSdGiLiThk
         hU6w==
X-Forwarded-Encrypted: i=1; AJvYcCUHw38a7ZpXjgE+e+Qzn/IrPH1JTIT4jzV5krzjxa7qPOn+pfXWgcbsriR6p7KQpea8MLSROJLVFN+Ftw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlcGSQpXf73tyzMA4g37OG5rXYANp5V92vuvjz2Pd+jffVDvAW
	V/EilppSrn+I0LwNE9XIXSdFddVu6+atEwtlawyJpMfEq+NQk3SNy0qtqa7znsNiRUc=
X-Gm-Gg: ASbGnctQDBbEnhERZ29bRTHYxFZznAoKihArDyoZOQ+Dy/mexohItJShyk3dLVOtB+l
	Bp/Wr0ELDEaVjdIxMmyfX6IsabL09mkLTQ4/H+Y0FCA4Uk0K5pHXxrXIgylFZGOYIv9edoT/deO
	bPgHbchdLyp5Hggb1x0ojAkVvYaW/YvkIQfJ0BufsR1l8XnMxNdWwQ5NZ6W0E68W5CV/JCnuXCJ
	mIVX/zQFMta7WabKLBF+FT/CXMDOsM4XG/qElL1P7K3tLAhUif/hWsWe9RTYUd1TT8aYZoPWdHJ
	colbcZj1TU39rxArKRWlP6qVivRJW/O9rG8CC8rnMNctPwbYbMZPjfmvMwFyfhdBskHdCnj0lrP
	cj0+Qnnf74mAHlznsMexnoxrtkvyoqyyoIe9lQaX0E3gGSCgtXv00ygRTVh28N31i/a6yTUTFYA
	k7Pimz/hhwIx/UKdgaEFqrbp2Y5x/2Pu/jAC9VHOunlGI5Uerfag==
X-Google-Smtp-Source: AGHT+IEZShSd2XdlTL6LQuL0eb9ZcN2CQs/Oju6iDycMXlqVGOaJYIbCBR4ngQaAmXBLuKdLttDx0g==
X-Received: by 2002:a92:c213:0:b0:434:a7c1:6b91 with SMTP id e9e14a558f8ab-434a7c16c2emr61797275ab.18.1763487176112;
        Tue, 18 Nov 2025 09:32:56 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43483990056sm82570475ab.19.2025.11.18.09.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 09:32:55 -0800 (PST)
Message-ID: <1c43aa3d-a5e6-4260-9079-fdc2e05c533c@riscstar.com>
Date: Tue, 18 Nov 2025 11:32:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] mfd: simple-mfd-i2c: add default value
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_093257_245869_AA1F796E 
X-CRM114-Status: GOOD (  14.02  )
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

On 11/18/25 12:08 AM, Troy Mitchell wrote:
> The default value of the P1 sub-device depends on the value
> of P1, so P1 should have a default value here.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>   drivers/mfd/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6cec1858947bf7ab5ee78beb730c95dabcb43a98..b0f109b3acc40b074e4d0178e123437495853496 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1260,6 +1260,7 @@ config MFD_SPACEMIT_P1
>   	depends on I2C
>   	select I2C_K1
>   	select MFD_SIMPLE_MFD_I2C
> +	default ARCH_SPACEMIT
>   	help
>   	  This option supports the I2C-based SpacemiT P1 PMIC, which
>   	  contains regulators, a power switch, GPIOs, an RTC, and more.
> 

I agree with Emil on making this be default m if possible.

Acked-by: Alex Elder <elder@riscstar.com>

Thank you for these fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
