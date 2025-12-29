Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AE8D3B7E5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 10:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9d1v4lKBdHMu43mNodddHMit28l80MDXahxOcl6c9Ck=; b=Q8ilA1QNTTrumz
	Xyt/oX19/ZikD9upje/D+XKvE2YdAq56GtdK7va+5CT3CkWZ/dfcfth3tXHcbdbftZoECo1NgLCNS
	xN/uCTVBY2JTpA7AlPXk32v2qaS+EmAmfiP9QDEhJM1HWyL1zmKKKxrv+N/xcTcuKlHagUH/j8dgJ
	v9OuuquSIadyuo/SuIYOL+fVdHbjGfGZEh8Ig6nCKvy52GnNRVT2ZnTogyKshc8tLHVsXnmqQ8gUb
	bquGOeyAEB9TK/qQGifvUVvBgI3xJwoL5IEe3zg6boEVeLKtw86jDXOB+NFt596NciK+kz4p+ruyY
	Q2TJCv1HfUoTT0NjzUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAGl-00000003YpB-0oGD;
	Mon, 29 Dec 2025 10:14:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAGi-00000003Yok-3PS0
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 10:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767003267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0MeGtttQCSy+HkQ1P/XOLXh/i4l7g+qeOEMBCMGW53s=;
	b=FYrYbNgtcFWGKVxlgzWZnr7SOPBxaHfmDDrXI1+ZrpUXJXyLVTDW5G0mX/Qa2O4hK8T34b
	O7yq/Abbgo8itrM/7XsgqkcWM21qCjET4R4JEcURTU68B2/8hAwrdYrpqwXtngE9XE7W21
	UituaO9eD4U2+VAxcIqk9gt2ipQtVG0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-2A1sLqImPLCATidEsWBpYw-1; Mon, 29 Dec 2025 05:14:25 -0500
X-MC-Unique: 2A1sLqImPLCATidEsWBpYw-1
X-Mimecast-MFC-AGG-ID: 2A1sLqImPLCATidEsWBpYw_1767003264
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-430fcb6b2ebso5199954f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 02:14:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767003264; x=1767608064;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MeGtttQCSy+HkQ1P/XOLXh/i4l7g+qeOEMBCMGW53s=;
        b=quMICS0vYZ7WdB0ZW0YQqbyh82ePMgwbwZWCsiX8l+Ujm38jgMEi4fNsG3Lst4idGl
         hNZcVF5c/RiEPYKObgpQOKlyW/Frls8Xd6jTeoN4AbAPoRlbPdM+uveM/pGRXC3yMlW8
         cfCr9ElutXAkMqjdva6tFMYWkAbWHkAuJn6qTT38bsf2NTawV1X1zNUbLJJk7hlm6rKz
         xa00Btk2Y+l/NrDdRCYwqGyWy9W7EccpQ67v1UxWCUw0M2NbiPyRK3Etdd77ymvR3mWJ
         2BxqYk2DAo8FFlmW9a9DA3rFgzqoNvOQHd6nEQa+QL4fIz4LAVljPwsNo5KJM6xPThJ5
         YbcA==
X-Forwarded-Encrypted: i=1; AJvYcCVeTTvWg+u7NAh4QMK+QG7agURkWZ6SLGIlkBsz09uDnW1GLXjQkLhg/ZfusioBBsZFHxdRZ81P9M8oAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEcUi5pSK6nwzoN6zwJHj70SMdtui/MVv5y4H7qhLEoNFP/5hk
	EvR3dC+rALg4fm30sYRjbSUvKX/FsNKAsM5gufMRyUD3BAcWvgZtnaV1zZbaqL8bIb50juhALcw
	uTfi5cS3mi5fbtC+jx/nBStxyPJk3Gd+PkHEWzq4/812hOj6AyKy3IkIu4II1WPNKMucP8Q==
X-Gm-Gg: AY/fxX71NNszgjgQmn6zzXNe6GKo/3sk4N8IVfgOnncWeNX/DQaEE+RAembUDdUYFEK
	QoAQxdd7iT3TDJo5mXoDcSEl95gdYPpEfhEb5VLJmBXQYCEftmrKK2tUvi1kwn/vq6nhbZugVTq
	TggzewuzA08xLPdDKGveQorqUBGc71K0rCMezXjuIuj3QR+Eg9a/jup6zgAeajF3h32EzDqM0Vx
	Qx6u8H6fTGHdgSaeSXWJrsRsGXyC+FqJB1CeDhxN6GwAClLVMyN0mhjlwQMiin78AvH/6WK7fyD
	N8EiE7T8iMfEVtRxXUSeg/tM4lWFLNeTmdaz5d/1jbXyIUWAcwrBRzK7SSGE5kRIVSOTHJOlqz0
	FbOYTXqWVURr2vu5d29ZOgJnRgooHAxwchSTLq/YwX253KUlS7IA7oLlAWl03SSMUcXdy
X-Received: by 2002:a05:6000:2583:b0:431:53:1f49 with SMTP id ffacd0b85a97d-4324e4f69d4mr29072894f8f.41.1767003264188;
        Mon, 29 Dec 2025 02:14:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaUX+P/aYJXLzomp8EeNsbkaHr1ZMGK/ODEhPXEZsAY+UeUvgAFBACIto/Ps2yRmhT3bcm8A==
X-Received: by 2002:a05:6000:2583:b0:431:53:1f49 with SMTP id ffacd0b85a97d-4324e4f69d4mr29072878f8f.41.1767003263793;
        Mon, 29 Dec 2025 02:14:23 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm58270346f8f.2.2025.12.29.02.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:14:22 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Chukun Pan <amadeus@jmu.edu.cn>, michael.opdenacker@rootcommit.com
Cc: dan.carpenter@linaro.org, dlan@gentoo.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Chukun Pan
 <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add MMC support on BPI-F3 and
 OrangePi RV2
In-Reply-To: <20251224150003.1232791-1-amadeus@jmu.edu.cn>
References: <20251215-k1-boards-add-mmc-v1-2-d68dc87d4aab@rootcommit.com>
 <20251224150003.1232791-1-amadeus@jmu.edu.cn>
Date: Mon, 29 Dec 2025 11:14:21 +0100
Message-ID: <87zf71fvcy.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p0vf0Aoh9E-k55tzErsXhI2ZwIUbw9ZikL0NzH5f6Gw_1767003264
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_021428_945244_8FF48565 
X-CRM114-Status: GOOD (  12.89  )
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

Chukun Pan <amadeus@jmu.edu.cn> writes:

> Hi,
>
>> +&sdhci0 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&mmc1_cfg>;
>
> It would be better to arrange them in alphabetical order.
> (Place pinctrl below no-sdio)
>
>> +	bus-width = <4>;
>> +	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
>
> It seems that "cap-sd-highspeed" is missing?
>
>> +	cd-inverted;
>> +	no-sdio;
>> +	status = "okay";
>> +};
>
>> +			sdhci0: mmc@d4280000 {
>
> An immature idea. Would naming nodes this way be better?
>
> sdmmc: mmc@d4280000
>  sdio: mmc@d4280800
>  emmc: mmc@d4281000
>
> This seems to fit the description here better:
> https://bianbu-linux.spacemit.com/en/device/peripheral_driver/SDHC/#dts-configuration
>

I initially thought something similar but it's not accurate. Because as
explained in the doc that you referred:

* slot1 supports SD/SDIO (1/4 bit)
* slot2 supports SDIO/eMMC (1/4 bit)
* slot3 supports only eMMC (1/4/8 bit)

Which means that only slot3 is limited to eMMC.

So even when a typical configuration is what you mentioned (and what I saw
in most of the existing designs), slots 1 and 2 won't always be SD and SDIO.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
