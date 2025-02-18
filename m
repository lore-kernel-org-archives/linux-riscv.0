Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6E6C021A9
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUGOONBZYylNQq9qvHFZdoHHqRYZQTMDMqdgjwNsKGw=; b=vqxTAs6rF712ro
	LH2WIOWqfnjHIMTGjhiHyDu6fxvOEKHo2TQP7Vvt8dHWYxP9b2J+E41HcNtiAt49E7ejqdFPp1KRN
	9q+njvwnNliKXMVjr8LOj+GYW7I02H80W0H5aLUS+WrSiiH8E+keF0ko2l7A0ZqF+wvxE0J/w09KA
	Q08yByOsDcdwhfArXtq4GkeoY0yn6cw2i2blPj5xTbrh6CNaqwONLznd368MnKiBmD2frDwSBZ9PB
	APxKtzhd8uLedRG9KrEjNwQftPnGAP2PNXOgYcWmFSNLvxj9laBH5UpObg8hOCZafVeFZH199mqEz
	ea+fzFbJRz68B5QztzuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJK5-00000007Mhz-34jD;
	Tue, 18 Feb 2025 08:51:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJHq-00000007MG4-3NVX
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 08:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739868541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f0PPk91R2OjqODZtBQUNypPkAhjqPhzDO0Zl4X5trlM=;
	b=bcIJIZGN7wtXsC5Lpyoid4ja17u/jqeQCs+MPowIyZHK8r6XF7riNwIU45fBe5FmqMVngB
	cuXSS2mfCjlO9Bme+Ad+Mh7NOy9GIV1v5b9K//6a33XYwrY+viOXAJePql6F8en2hbH1BX
	F8+Xjb8Y3dLWxTTs8IL0iWhHuFeTs/0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-WitA_pnCOPiLGUByQ3h6pw-1; Tue, 18 Feb 2025 03:47:18 -0500
X-MC-Unique: WitA_pnCOPiLGUByQ3h6pw-1
X-Mimecast-MFC-AGG-ID: WitA_pnCOPiLGUByQ3h6pw_1739868437
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38f2ef5f0dbso1832839f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2025 00:47:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739868437; x=1740473237;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f0PPk91R2OjqODZtBQUNypPkAhjqPhzDO0Zl4X5trlM=;
        b=HNYLuWRESP29kRjSs4CDw2A2t+A53c79PiGS/HMYa0RMp7ECyyfmKjvO3XhMQSD6vX
         Vn9veREXgAnWF7ozYIvGrXsJFZtC8DsGbw3bvvvLDQdp9aT9wCAxiV8IN/nv5UO8Zbhj
         tIPCqgBalzjX0TmcGmyF5N8rk2vlgswcGey8vlLIvruSMneqvJ5hNiDGHcS85qThWsui
         2AxzqD3iG2YA7eHPWe3nbcGUJIO4+fmC2hNeXCZFQA8CsQEKqHRUN1Q5xssepgxsgS09
         U/PQSraBWX6RMiT5Dh5inye+lXqToHKNu0j5qu6qhc0yFxbSqLdOl4G5n4FrGPFs+FuP
         YYcg==
X-Forwarded-Encrypted: i=1; AJvYcCXXf8fVUwNo0ffNL4LPJ9f97So3TRojwvcWlB8V9xtqfb+MSah2C3GqSPN02G14An0NkGU6ABthopbcMg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3f9qzWdqisDiExw/bd7bUsmvSdCwJBoDgHXo2DBCYPr+uo0LH
	ApkN5kqgtda05guWP60rvauXo4LDmVb4PtJ6O1uv1KP+6fCNwLPsz0xoDTvn50jC6Zpj5i+LuIA
	tfmYgagKr2z24ci00B9bCWAV6vFum1u/YJqgiyW6G0LsFvenGSLQZv3diTxit23InrQ==
X-Gm-Gg: ASbGncs96+Qg44J86KN4fDZy71YYmDsRHKCl3qkLNfAfo5p+lRK0MJ/ZaTsS9lVNysx
	8v0be45YBrb36OEZpO+xqNyfGYEi9s36sDM6HaLCK+VMw4gIoJ/smjPZOWLiV23Nlk2qQq45ORJ
	M/woOsKHhWbs+ZFUz5XICmXigFCq5+sNYJvHCQZkqnxR163T4fpwayslNF1wIoy3heFGX5DDhgi
	WaMCAmJHRcoN2qVhsxZoiSZUC+UQLx+pe86plfT5zrEuPqp5vVJ1NP5hE16y1pt1bgCbbN9mInn
	4tUpDbXWT+ZxC9XHDg2Nn//eJeWFBTMg3ch8UFgmq9/jcs2nnZb8P1xaQz8OsqA=
X-Received: by 2002:a5d:6ac1:0:b0:38f:229a:b48 with SMTP id ffacd0b85a97d-38f33f34e0fmr10212223f8f.32.1739868437043;
        Tue, 18 Feb 2025 00:47:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSbylPudXx7pB2i6xYLZO/0No55k7fxSLecS40C+YqWkkI3E7XGgL5gcPSu1DOJPV7vKQsoQ==
X-Received: by 2002:a5d:6ac1:0:b0:38f:229a:b48 with SMTP id ffacd0b85a97d-38f33f34e0fmr10212191f8f.32.1739868436746;
        Tue, 18 Feb 2025 00:47:16 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398a8007easm36991295e9.21.2025.02.18.00.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:47:15 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>
Cc: Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, Alex
 Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
In-Reply-To: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
Date: Tue, 18 Feb 2025 09:47:14 +0100
Message-ID: <874j0rr65p.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uU--4CUHh_sfmLqAGl1AeUDt6fS2t2pCSyA8qD_MfjM_1739868437
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_004902_905925_2BCF19A3 
X-CRM114-Status: GOOD (  12.46  )
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

Yixun Lan <dlan@gentoo.org> writes:

> Pinctrl is an essential driver for SpacemiT's SoC,
> The uart driver requires it, same as sd card driver,
> so let's enable it by default for this SoC.
>
> The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> 'make defconfig' to select kernel configuration options.
> This result in a broken uart driver where fail at probe()
> stage due to no pins found.
>
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Reported-by: Alex Elder <elder@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
> when using make defconfig, thus fail to initilize uart driver which requst
> pins during probe stage.
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
