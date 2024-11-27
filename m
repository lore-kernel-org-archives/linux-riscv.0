Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180E7D609D3
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 11:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GX8HnXWm4bJaj9kUpbwSMr661f0tRd92s4EZ8DIKDA0=; b=uI9we5zyEW2bEX2F+MzdJRJQYv
	AaL5VzgYOsKS/UXDpleWrn40TcEAhWL1YC3BFoMxvyiIMCl86qtkWTdB0DOmnGnXgRwm+Kx/WGhgE
	R/XeMfM1dUiDTliS3oVp2FEaYfgWtWFtfwzz7WwICyAG5sV0gNiC8VDyueqxkaxKgKWjJIab9Nx78
	iFcQXN/Uf4awPtbKi351tQ1SZSyfrCxDDQAoXCXzlTMDJAM3FY8sv1PQJgypD4vF9/vhU6x7bBoep
	0n++W3a/VUy7GJvPa0vbvjmjf55gy07ydVcNOCQkV30Gqt0TR36GPvxK7xPERj/911gT+FyCOoJU/
	UhuA74+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFup-0000000CxOJ-0yzk;
	Wed, 27 Nov 2024 11:09:03 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFmw-0000000Cvox-1nfD
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 11:00:56 +0000
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8BC313F8D9
	for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1732705250;
	bh=mosoAglVY1ZAnOADGv13gAKCAWy+sADEeedgXWjhMxc=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=J02qb997v9EGqDoniySy98e6DkuMm4oa2mFVU0SNCFaLFmtrGKXrL2RlPTnqIhsze
	 b4HraWCH9b7FoKBY7rDgPxh8w9GWCM7FckTDzOQ+djuSRso7kEt2ytSddSwUy+HBAU
	 6cpJEP3osFZHvTk0eSPqTrUpcVQL2xFKURAzjytoZXQk4km/Y9Kcot/p2Gzkd8UbIo
	 wTYFEk6AKAazuAnEgOlDN3nXFxGQSoqZQQ7nfsu9/2KLOZDYcrnDGTfDulsh7T9G1F
	 qNiLUpYUalnhcH5Xa8F9Qto7kNA0hK29Ue8mDij5EI+QC2EDaI3Goqzr3nW+yV2Hkd
	 3bNjhjUQVBSHg==
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-29683b5db79so4281794fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 03:00:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705249; x=1733310049;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mosoAglVY1ZAnOADGv13gAKCAWy+sADEeedgXWjhMxc=;
        b=Z6AaV0hXn/15H5EBRqgaR7KfA0/K0BwPUpI42hno4+VhWV35e+Bj/BlpcHozLSYn7u
         nwvGmUaGefgnAQh4NrbuVTGWmqSGpz2IH0okLFhRg1h4IVXrabz/DfkGWVLNSNs9VK3b
         +iIjyC/JjQuMVCeExMdPFfNhvkKP+jtYyInil/OgIJAISt5Gm5WG8iTbc38FbY+P5vQW
         yAKEs8QiltGMI0MYD7cizR1zuOI3AvM6HAK1SnsunzRF3P1f3W5JOLB9doPC7312URq6
         YxhmbxMcF0Oesucbnx9RpOjDDYbCQ3V2eOHYt3k5EqfQSCmSMTT7ysPBEAWd7itRuKHV
         N0ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUQFjWgYlwSTEKfxtQOhlkHRzIfa/uDRnUGUhr2hbCEg0msfrx9MKLh9sGVLBo3eCCP2b2XAz/54+dzOA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgxg1pbKLtH5SuCFVSxt/dj9dnymeqsVvcmL7TPidf5iZyY1T4
	T0lXTEQH4U+5UpUsAOMR7yNkMnch9sER9NlTOmcMnEPh0iJB9rg6CV/bap7lCkzi+dOxiw92JVP
	JeArqrKvgn2+rkKVKQBkSGLF8WTFWdurDG3P2Ju2ov1PVWyOpJOV7wfynHRxIQiqEfGVU2zURMO
	mBdngGb1xUET0hpBm5XBjHfm0tdlegkS93O1z4v34Yv8B2RY0s3Zax2y4G
X-Gm-Gg: ASbGnct8b5HPCUVT2/5pnq13vxpsdMJI5xwkhRjgfyhtO27SHD/H8IXADyGdtP8/TdI
	+sdZqPK6vEuhIdKP3hgwUIu3nhRncdcbKzp1y2HyrpYRnB+GCjUlqtIAJEKbG
X-Received: by 2002:a05:6870:3308:b0:296:dd1d:ce73 with SMTP id 586e51a60fabf-29dc3a8f3e4mr2061149fac.0.1732705249260;
        Wed, 27 Nov 2024 03:00:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0o2pIMw1ikbScyW4yH5U5LfEBQrUJgeVFSfiFp9KhIwhipamnH7e5phDxfaZSX86lSGZprFcwCS4lHwkMaRM=
X-Received: by 2002:a05:6870:3308:b0:296:dd1d:ce73 with SMTP id
 586e51a60fabf-29dc3a8f3e4mr2061084fac.0.1732705248834; Wed, 27 Nov 2024
 03:00:48 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Nov 2024 03:00:48 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241126075740.17419-1-e@freeshell.de>
References: <20241126075740.17419-1-e@freeshell.de>
Mime-Version: 1.0
Date: Wed, 27 Nov 2024 03:00:48 -0800
Message-ID: <CAJM55Z9wWCaS+FxZ=Gg_RfXXafNEJZC1zHZoPWQ2Y9QYDf9OyA@mail.gmail.com>
Subject: Re: [PATCH v5 0/1] riscv: dts: starfive: jh7110-milkv-mars: enable
 usb0 host function
To: E Shattow <e@freeshell.de>, Jisheng Zhang <jszhang@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_030054_847512_65A384F9 
X-CRM114-Status: GOOD (  21.37  )
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

E Shattow wrote:
> Enable host mode JH7110 on-chip USB for Milk-V Mars by setting host mode
> and connect vbus pinctrl.
>
> This functionality depends on setting the USB over-current register to
> disable at bootloader phase, for example U-Boot:
> https://patchwork.ozlabs.org/project/uboot/patch/20241012031328.4268-6-minda.chen@starfivetech.com/

Hi E,

Ideally the JH7110 pinctrl driver would be updated, so Linux can do this itself
and doesn't need to rely on u-boot doing it. I already asked for this here:

https://lore.kernel.org/all/CAJM55Z-+Cxdebcn4MLXfQdOVhx4c2SQ+zMH8cjn-Yq35xO8g0A@mail.gmail.com/

>
> If the over-current register is not prepared for us then the result is no
> change in functional outcome with this patch applied; there is an error
> visible to the user and this additional usb configuration fails (same as
> it is now). On Milk-V Mars with four USB-A ports this applies to one of the
> ports and the remaining three VL805-connected ports via PCIe are not changed.

Thanks for the patches. I don't quite understand when you write "no change in
functional outcome with this patch applied". The USB-C port is already
configured as a peripheral, and I just tried setting up an ethernet gadget on
my VF2 running 6.12 and that works quite well. Does it not work on the Milk-V
Mars board? If it does then these patches would break that functionality.

Here is the script I used for that:
https://paste.c-net.org/BravoLonely

At the very least you'll need to explain in the commit message itself why
changing the USB-C port from peripheral mode to host mode is OK. But ideally
maybe you could make it work in OTG mode, so userspace can choose how they want
to use the port. The same goes for the PINE64 board too.

/Emil

>
> Changes since v4:
>  - Rebase on latest master
>
> Changes since v3:
>  - Rebase on linux-next/master
>  - use tabs for code indent
>
> Changes since v2:
>  - Rebase on 6.12
>
> E Shattow (1):
>   riscv: dts: starfive: jh7110-milkv-mars: enable usb0 host function
>
>  .../boot/dts/starfive/jh7110-milkv-mars.dts    | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> --
> 2.45.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
