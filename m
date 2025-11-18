Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C644CEE342
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSeU0FBK0Q/gInKTg09+EBMHvpcIaUXNw11ikgGsBa8=; b=sW5Ss88vgiPBcu
	9K9x4+775oruxHjHkUteGIxdah9GWM7z+S5sonfqnfl7fsfTapT2W70Vv72r8wmAn+hW/2yxZ9W0Q
	QnLVqcp7mfWAM88yzNfjjO98aPDeHQJy9xUFvJ6+k7hmPCmvL/o0BikiRMCv28Tr19+UnOVkTkuwi
	E0AhXZoaEmSf7JyWynP5PXAjB+lZiprZT5wyZx0TQyym9dG1lODmkV7PFOBTqII1b6BPHhzw2VbGb
	UC72D2CiRFfNnzT+Z6q/FmHALNoWgOjoWiDvqGX1YccIKntTOcvsyBlDmfvHZrRw7Un+GEPeb6cmf
	0OlJ+aGsGe03O9SiGHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPZW-00000000rnn-1Elj;
	Tue, 18 Nov 2025 17:32:54 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPZT-00000000rmg-1eE0
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 17:32:52 +0000
Received: by mail-il1-x142.google.com with SMTP id e9e14a558f8ab-4335726d0f2so21189095ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Nov 2025 09:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763487170; x=1764091970; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qi2g01Pl4HghpEkqiXiXs3PDN1XWinc+i2ynrpZ9eb8=;
        b=JfsqibXu9/ZWZvE9BM/NNo5ptIdAQu+Dw+FtB9BEiecnpEaX/pVGF/hdLw5ekJSItP
         3eVpcfwCxjps7LonCx4JMv2tovEN3PxwDALhZIiu5DJkkWcECvtd/ysacoQxQpk6Yyph
         cYC92iZS8HIuGrUamZkl9mUqgqKCkV/yXvWtr656WAcxtwY7T1jtfsZOzOK6J6DYMj0U
         hi8F+Nn/GxxsPracaZifxu6DlNPnGKMN9y1bVeFCc/8Yg4l5IlVbdv/cVbagOukX32o3
         E4l85oYQ31vJc/0c4zWFAQunMm+3A6JtTAny9ca8IwXofk906Uqab8HIYzlREugqqyzP
         KfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487170; x=1764091970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qi2g01Pl4HghpEkqiXiXs3PDN1XWinc+i2ynrpZ9eb8=;
        b=TLZ5XStfk9B/l0GD1PcTqgoCJ5YNBwQUYvk36Q87Yi/Ulus8YfXpThYix+uHa2lzTw
         v7tI/n4YabGJ3xVmYelZ4yKQ0ePdSRP6oXsdMuK04rc4LTkIA4dRCmciCIdYOVCBwPWK
         DxO3lUwz6t0n6VwdfEBQR6kvFzUGw/eJeZ67gAL1oBwkMeQilvDSyNU3hnirWQkE+Ihd
         IOMxwmIebGc34lG45AdtvDtL1SeQE4DQxZ8NETaD8tjyz4WT0kGmmg2hPtpZ06qyMawk
         cK/I5+EZkrL2RIZasEd7eIPuVowgawHEGDZrdXluYCP31KBXY7KrdjzGwdW6JQXvSd6l
         JEnw==
X-Forwarded-Encrypted: i=1; AJvYcCV3OBtMKpXIBfs37CVjRIwy8/1DcxPk5he9dU8DXG28kxWhdLyxikqqXWvU41YiSqgYxbM/p0xteMwvqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrZv0QElSQJC+C066luL/+zWS5N7GAwpGdGq7WFTQ2jMpRx/Ze
	bzraowbVMb8J3mkOSC5JP81jJvSpSvV8KGaVHCOeh4L6/KrFztN/4/hwnXFiMAtOqMM=
X-Gm-Gg: ASbGncvKothu9hhoaJAoYvdlMg+vUbbfMtXbvOVzUA7iuGa4LVGlx8hhGlSOK0KLfK/
	kO7/OpxCD/sVYTbzVEALp+2DGqS4O0/QR7km48bIC8aDrZO9qkksmOTsotcvsSa3MpIOo7o0BhU
	t5qmsUSAGvTbnKz/6KUxxXJYmDR1aieaIBDbtBHAmA2wMYXyMqLDaBTemaKaI1rvpKBax/ASB0M
	/Qb7YZTt7sYdw10+C1S+/C7Ty71ZhNtGnNvaeFlRpq2DjTUscQSQqPGvnWnEx2X2EvcMkukgqDf
	+3irZCrR62ZPBDVZY/x4NJDjaAOtISP/uDgNO6mYWEst+U4BH9rp4Y6ae/Pgq3DsdpcXkO92p2S
	UAKyIxfY/YEI531ycYKsBAEyBa6LWum4e9IC5Bel+Fs9xr766fMwyOtoJ1YrF0D2tI67jOBdBCH
	nZfxzTH/As2R3JrIr4gHHTf43nEw1KqFzZDowtGBbOr8KzciDA5g==
X-Google-Smtp-Source: AGHT+IEvjf8wjHz1IDZuMlpDmRvZ1PR2gWcJIHsR0vG4NMPKURJNCf3jErqqY7OwlQvDOA+3W4E9nA==
X-Received: by 2002:a05:6e02:156f:b0:434:74a6:4907 with SMTP id e9e14a558f8ab-4348c94e271mr229950765ab.30.1763487170478;
        Tue, 18 Nov 2025 09:32:50 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43483990056sm82570475ab.19.2025.11.18.09.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 09:32:49 -0800 (PST)
Message-ID: <4e8ef549-9c31-480a-a88b-5704f9e12bec@riscstar.com>
Date: Tue, 18 Nov 2025 11:32:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-2-8839c5ac5db3@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-2-8839c5ac5db3@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_093251_441475_C62B27CE 
X-CRM114-Status: GOOD (  18.44  )
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
> RTC_DRV_SPACEMIT_P1 is a subdevice of P1 and should depend on
> MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
> does not always respect the parent's dependencies, so 'depends on'
> is the safer and more correct choice.

In particular, it looks like it doesn't depend on I2C...

> Additionally, the default value depends on MFD_SPACEMIT_P1 rather
> than ARCH_SPACEMIT.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v3:
> - modify commit message
> - change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
> - Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-3-49688f30bae8@linux.spacemit.com/
> ---
>   drivers/rtc/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 2933c41c77c88e60df721fe65b9c8afb995ae51e..b392e6d096ed077e841a2e68b70d8b80d9ad1cde 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -409,8 +409,8 @@ config RTC_DRV_MAX77686
>   config RTC_DRV_SPACEMIT_P1
>   	tristate "SpacemiT P1 RTC"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	select MFD_SPACEMIT_P1
> -	default ARCH_SPACEMIT
> +	depends on MFD_SPACEMIT_P1
> +	default MFD_SPACEMIT_P1

If possible, this should maybe be:

	default m if MFD_SPACEMIT_P1

In any case, this looks like an improvement.

Acked-by: Alex Elder <elder@riscstar.com>

>   	help
>   	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>   	  This driver can also be built as a module, which will be called
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
