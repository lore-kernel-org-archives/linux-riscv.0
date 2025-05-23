Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E67C3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 05:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLWXPYLBpwLVVGO8n3k7EfILJcKm1roZPS87wJ93GWM=; b=epmNOIvYyphHqs
	7WS5OCcX7TS9EiirVxSVR8LaoIRAwoV8nniIyDkEUoxHtcoVDmyqecchM/NYcpDED5CuVq8UcJ4BT
	CTGYr8F1ffB1bvN4NOmt6bkShK8xxk9TlsdAOY0nrc1ohd8r5N7xx2vVdPdAd+K8C6Po7FeAuE78M
	iapT/FErMrhiSSyuLA/yJzAUu2h4LDZdwyPovhXcV2xrkXWWnFeBZ1zhhAtKo6t07oPSgI4qVlAoF
	ycYjLWq3HBDDoZtv6EAwDUJmukpQkyTRUqcYUmNrMw168DnU/lEP6KsTlHV72M2pM/Y2V7ptdtiDs
	l707TzlD0X5YyP+4BbkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uILGJ-000000033Pe-3i3R;
	Fri, 23 May 2025 05:48:07 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uILGH-000000033O7-3tP2
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:48:07 +0000
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7cadd46ea9aso1262452885a.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747979284; x=1748584084; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=caYsdWfqVwz/d2kN5MK7ULtNmcCIM+sT/9v7bBJrmKE=;
        b=HwQ69u1Xd2NxfUPpQa3EEWxhXmxHThB7AdVnpY4bpO+F8oFewVVqpSwpg3AqQRK8Ct
         YoRSvVmhtmMS3wQGDz0E8gfQf7rY08CIHPDv38drg/veeCfaOmEMaxycDeV4udZoGp5I
         58Sl41y8lDomxpLL93TRYmXQbTVCFuNpi32BPUgBJoXxPKYgpVW4G/D3NNjpVUhVXjIa
         JN5m8Ik+KmievwXBrORW/mxrYrxyat3u1gBRsHB3oWhoJ6s1ddAEulXHa91+mkVn0wjE
         7WDSzBjV/71bF9R6lnhqZjkrUc02D0MCCY9ZhnrfWNwopHQMpeECR5zm56CRLaCaFhjC
         WiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747979284; x=1748584084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caYsdWfqVwz/d2kN5MK7ULtNmcCIM+sT/9v7bBJrmKE=;
        b=ekukB7zLlfhAJHnWK2y+gqWd02BLNKPdGGV6rV9zMqBYoxlVO/Amq+b4a90GvzW8uh
         lshmuSSKwWlD8L0xEPmu6Wpr77gVbjvwi4tUCU3RvJMhuJBW744Qoc2HsHWB/VghLm16
         AbcME1/cZvdb82CWtlabB2dJQgJ2FjXUfpOZuNjDOrDsaKtTe6Um5MTP1sHgYq90+kKq
         beXRyoEVNH78D9U0fXsWYpGu7rRMlEsQ3dD6+kCcKMQ+Yl47ZxpuW2rbjSjcoD8LFvNQ
         NF18HOZHsG7pV5dOaw8yDM6U9u6dTEKiAnzrIv81D9E74DTuo1A3Ov68amfN5cGcJuke
         9tDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTBfTnfZjW8o6YAXa5FKcfunaheZdFHUhk5SsuaekSBXhkwyn7qR1oHUOtWJzr98Jjm24orlePHDsxFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7kT4yL2FY6fOr5gqkCWPzJLRbLXa180OnS+O1tknk1zhxDcd/
	v98DNowKDmyUGH2FE8HmRSgwtnEB2wCUu0cMPbvO59ak4Gwi3HDR32Xu
X-Gm-Gg: ASbGncvLCoNJcUYl/mHGXwHpt3xH+Qy8CjJIEm+RkT/mCz6PBYQG7lISsH66b0xO7Uk
	QOSn00bTVEo47oixoYFSW6u5TE6YCoinq+Pwf+A3PbhoV7QY0SplvxJu0YDpNP7FA8zK5XCy8TT
	naPB6Da3/f4I5HV0xQ0lVVsPJaUmVC4PrOKS78efceUJHpuQstcsuPAb7lUt6vqY6SYfXgXbiUa
	uQ4+GkfuQ/7BK21T9aF3Q+MGg0c3wjfjx00nZe/r245zQtyLGWwT1JACHdpI0LJLWDqSwfyH8O0
	0Kf7nSXepFVxspMbFKgqC2U3LFM=
X-Google-Smtp-Source: AGHT+IFq2e9T1OWjT740aexMVA+sf73Duioa1NgYUy32jH1p104IrQgopYSeyPKtQHmouG7DP/siYA==
X-Received: by 2002:a05:620a:410c:b0:7ce:bd97:f879 with SMTP id af79cd13be357-7cebd97f884mr2418187985a.19.1747979284003;
        Thu, 22 May 2025 22:48:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-494ae3f9891sm110032001cf.21.2025.05.22.22.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:48:03 -0700 (PDT)
Date: Fri, 23 May 2025 13:47:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/4] riscv: dts: sophgo: add reset generator for Sophgo
 CV1800 series SoC
Message-ID: <7zugafwxrt6jvzv4qr5ipyf7alwyjmuwfj6lfekjfjzbfjl5eg@z5q3mknw4bgo>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-4-inochiama@gmail.com>
 <4750f2c6-221f-4b2e-ab9c-31d707404a4e@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4750f2c6-221f-4b2e-ab9c-31d707404a4e@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_224805_967736_09D9CBC6 
X-CRM114-Status: GOOD (  21.01  )
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

On Fri, May 23, 2025 at 01:20:00PM +0800, Junhui Liu wrote:
> Hi Inochi,
> 
> Thanks for your patch. While testing remoteproc with it, I noticed some
> issues that need correction:
> 
> On 2025/2/9 20:29, Inochi Amaoto wrote:
> > Add reset generator node for all CV18XX series SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
> >   arch/riscv/boot/dts/sophgo/cv18xx.dtsi    |  7 ++
> >   2 files changed, 105 insertions(+)
> >   create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-reset.h b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> > new file mode 100644
> > index 000000000000..3d9aa9ec7e90
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> > @@ -0,0 +1,98 @@
> > +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> > +/*
> > + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +#ifndef _SOPHGO_CV18XX_RESET
> > +#define _SOPHGO_CV18XX_RESET
> > +
> > +#define RST_DDR				2
> > +#define RST_H264C			3
> > +#define RST_JPEG			4
> > +#define RST_H265C			5
> > +#define RST_VIPSYS			6
> > +#define RST_TDMA			7
> > +#define RST_TPU				8
> > +#define RST_TPUSYS			9
> > +#define RST_USB				11
> > +#define RST_ETH0			12
> > +#define RST_ETH1			13
> > +#define RST_NAND			14
> > +#define RST_EMMC			15
> > +#define RST_SD0				16
> > +#define RST_SDMA			18
> > +#define RST_I2S0			19
> > +#define RST_I2S1			20
> > +#define RST_I2S2			21
> > +#define RST_I2S3			22
> > +#define RST_UART0			23
> > +#define RST_UART1			24
> > +#define RST_UART2			25
> > +#define RST_UART3			26
> > +#define RST_I2C0			27
> > +#define RST_I2C1			28
> > +#define RST_I2C2			29
> > +#define RST_I2C3			30
> > +#define RST_I2C4			31
> > +#define RST_PWM0			32
> > +#define RST_PWM1			33
> > +#define RST_PWM2			34
> > +#define RST_PWM3			35
> > +#define RST_SPI0			40
> > +#define RST_SPI1			41
> > +#define RST_SPI2			42
> > +#define RST_SPI3			43
> > +#define RST_GPIO0			44
> > +#define RST_GPIO1			45
> > +#define RST_GPIO2			46
> > +#define RST_EFUSE			47
> > +#define RST_WDT				48
> > +#define RST_AHB_ROM			49
> > +#define RST_SPIC			50
> > +#define RST_TEMPSEN			51
> > +#define RST_SARADC			52
> > +#define RST_COMBO_PHY0			58
> > +#define RST_SPI_NAND			61
> > +#define RST_SE				62
> > +#define RST_UART4			74
> > +#define RST_GPIO3			75
> > +#define RST_SYSTEM			76
> > +#define RST_TIMER			77
> > +#define RST_TIMER0			78
> > +#define RST_TIMER1			79
> > +#define RST_TIMER2			80
> > +#define RST_TIMER3			81
> > +#define RST_TIMER4			82
> > +#define RST_TIMER5			83
> > +#define RST_TIMER6			84
> > +#define RST_TIMER7			85
> > +#define RST_WGN0			86
> > +#define RST_WGN1			87
> > +#define RST_WGN2			88
> > +#define RST_KEYSCAN			89
> > +#define RST_AUDDAC			91
> > +#define RST_AUDDAC_APB			92
> > +#define RST_AUDADC			93
> > +#define RST_VCSYS			95
> > +#define RST_ETHPHY			96
> > +#define RST_ETHPHY_APB			97
> > +#define RST_AUDSRC			98
> > +#define RST_VIP_CAM0			99
> > +#define RST_WDT1			100
> > +#define RST_WDT2			101
> > +#define RST_AUTOCLEAR_CPUCORE0		128
> 
> 
> I think here should start from 256.
> 
> > +#define RST_AUTOCLEAR_CPUCORE1		129
> > +#define RST_AUTOCLEAR_CPUCORE2		130
> > +#define RST_AUTOCLEAR_CPUCORE3		131
> > +#define RST_AUTOCLEAR_CPUSYS0		132
> > +#define RST_AUTOCLEAR_CPUSYS1		133
> > +#define RST_AUTOCLEAR_CPUSYS2		134
> > +#define RST_CPUCORE0			160
> 
> And here should start from 288.
> 
> > +#define RST_CPUCORE1			161
> > +#define RST_CPUCORE2			162
> > +#define RST_CPUCORE3			163
> > +#define RST_CPUSYS0			164
> > +#define RST_CPUSYS1			165
> > +#define RST_CPUSYS2			166
> > +

You are right, I will update this patch in the next rc1.
Thanks for testing.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
