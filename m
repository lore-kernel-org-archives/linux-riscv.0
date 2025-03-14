Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63C1C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 00:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=14qyNckX3GWCLsTkYl+Z1Bgx1WZ6EVIGVjVqMUafiK0=; b=aobLseeVWa+Lq0
	dGKPcLwUdpVX0Y9yj3v4W4dMDxaKEWh6R70wyhTXl5qZpM64WQXvCIudWaJshFpwowFj9WOFVHJze
	HhVBFDPdq/Sd8NRabNYIdqRMKiBalk29Zdbwu6GULDGPk4MafebCP6NX+ID6BC66omkQcBfRWx7t5
	tcrZhno8dBwvirW6bPvs2g9HAe7KNnJViK9MGa86EGZ3YrTkaBTg5FvzooFhNVo8bPCjkqCFJqOcH
	2Tox8orkQ2mvYA7w+VLM1X+CbCkUp5LnwT1A8dyeaVludx4EOWVsdn0TyFcvu1DpD6Swq/kXHzoIC
	fX2BbWpzgiGxcyCbBiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tstJk-0000000CqFZ-0MCP;
	Fri, 14 Mar 2025 00:54:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tstJh-0000000CqFD-0V8q
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 00:54:26 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-225a28a511eso29184065ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 17:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741913664; x=1742518464; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UmlUQi/jXNfdANS2v7/yKDDCGx9y7VIZYSFeIy2bFvk=;
        b=T2YBfFsah6U8toDNrC5uenqm7sVnfHVsNC5w/2grtzQDOBUhq9g93Y6Fz6Q3L3i6aa
         La0kDs7IGqexQA8Ot4s/tbBvqxwfbXD+yuG4au+xkH5ODmx+Ey7hRQVq5F4UUdcs6CPm
         8rU2jEOiZUmGnZo/EQ2u6nwoWJt77keIuktpVGM0Vm+RuVVZQQPnslXei7tq5mNKquyI
         1DF5Fe5nIL++oYxKGszkwZm9TUrNn9VD2N0zJA0WLNRVGSGH14uIthwhMhpDkY1SoOZ3
         CMw+So459Fe2zTLSThYFM+mYhiCopvKAi93UwxfC45tyCD2Tyc3bWqF54znIngMup3i3
         GUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741913664; x=1742518464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmlUQi/jXNfdANS2v7/yKDDCGx9y7VIZYSFeIy2bFvk=;
        b=ldm0RYjYQMKxBf6aXy1uaBQV5Z40MqZuw5G+GnKT2RaxWrzkhr+jTnB4sQ/IAiTz4Z
         q3ShaJ6qbnxuFhUTnjcJQzZmgiY2guBbL/jLpRiibPeTspMfzLxdH1woBM9bkRIyYZjO
         Jqm5GX9GRYMS2E8XyebJczKcBD16CyfNS4ek1DWC7HVfiHR/NtNXn0BtND5myrmUvj0D
         KLc86W/82CjWvg51MT33aLqFvT3mlKFyPxnpRaINYFkqAmFFH/t69wqiWiqF/RrZBP0Y
         9FU/GuQYdOwddzbuY44TNk9nVpQEc6Dqkt1/5QH8pnQw9TZDVl2dNHu1ZvHe5qfMk41Q
         9NIA==
X-Forwarded-Encrypted: i=1; AJvYcCWab1TKb8PixA9tovv9GOyTr4Fi01kvPRrpf01y/6/wJyvSZ3SVMUY+H5OPQ25oPzYD70wiuLHgtQtMeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAhFrTnwPaNYibOt1u15+G5RkiQfv4ss3fthzcQjL+4EeYu189
	dP3GNBsMuNcskR7KaEOffQ8jDlC62lDUXzfVM+MXhm/rTKxzM8AK
X-Gm-Gg: ASbGncv7ImBVlBUMaRTHFXc3PycjBH86kvAgP9ayc6IXyN/CfM2uG2REWEohfAX9ibu
	plKhQ1LIAVjDgFAQaRIT8+iAcOIvb1tMx76pvbfNWr0nNlcpSpDx0FQkI545Eyva+6gauOKMlqc
	gxUXWufnZXriQwY1WYv2D8Xd8/TQjlMSZ2J/OVv2IV/LUiZjk3CTaDMwTdzKB1AGmlgim+xTnff
	TxOPxI7Xj7RVapLHDw+WsGXxEPuNpQJKWXjglYmfdInhX6ncUA2BLVYuNCgSrtsUozwEVVPBpco
	Lh0UsyAXifBZUsNR2BS2bq65BSZtT7lhj6kKNbcM7w==
X-Google-Smtp-Source: AGHT+IH0Swi1/WNTSoqeJPbcXP7ZXkJSO8ITb6Auxw31i7YlapXfDM5K9EjPsYO0yRUETWHGvbC6qQ==
X-Received: by 2002:a17:902:ebc8:b0:224:c46:d14b with SMTP id d9443c01a7336-225e0b2f418mr7120275ad.52.1741913663119;
        Thu, 13 Mar 2025 17:54:23 -0700 (PDT)
Received: from localhost ([2a0f:7803:fac4:6bd5::1])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-225c6bd4de5sm19856935ad.230.2025.03.13.17.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 17:54:22 -0700 (PDT)
Date: Fri, 14 Mar 2025 08:54:20 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Inochi Amaoto <inochiama@outlook.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com, dlan@gentoo.org
Subject: Re: [PATCH v3 0/2] (no cover subject)
Message-ID: <x4mmgsllwusayvrtoq2yhgkpo5wk2hqb3xex3dzqve2xwggouk@6se57braliw4>
References: <20250313-sfg-spi-v3-0-e686427314b2@gmail.com>
 <PN0PR01MB10393B82EB1038F184FD18894FED22@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PN0PR01MB10393B82EB1038F184FD18894FED22@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_175425_163289_5E9F2AFF 
X-CRM114-Status: GOOD (  26.12  )
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

On 25/03/14 08:11AM, Chen Wang wrote:
> Hi, Zixian,
> 
> First, it looks like you forgot to write a subject line for your email.
> 
> On 2025/3/13 21:11, Zixian Zeng wrote:
> > This is tested on milkv-pioneer board. Using driver/spi/spidev.c
> > for creating /dev/spidevX.Y and tools/spi/spidev_test for testing
> > functionality.
> Second, why is there no description of what was changed in the patch set?
> Maybe it was missed.
> 
I was intended to avoid duplication with commit msg, but it seems unnecessary.
I will try to write a better cover letter next time. Thanks for your review.
> Introduction to testing can be used as supplementary information, but it
> should not be the main body of this email.
> 
> > Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> > ---
> > Changes in v3:
> > - disable the spi status on sg2042-milkv-pioneer board
> Not "disable", should be "Remove", and please capitalize the first letter of
> the sentences.
> > - create dt-binding of compatible property
> > - replace the general compatible property with SoC-specific in dts
> Another relatively important change is about the clock, which you seem to
> have missed.
My mistake, I will add it in the next version.
> > - Link to v2: https://lore.kernel.org/r/20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com
> > 
> > Changes in v2:
> > - rebase v1 to sophgo/master(github.com/sophgo/linux.git).
> > - order properties in device node.
> > - remove unevaluated properties `clock-frequency`.
> > - set default status to disable.
> > - Link to v1: https://lore.kernel.org/r/20250228-sfg-spi-v1-1-b989aed94911@gmail.com
> > 
> > ---
> > Zixian Zeng (2):
> >        spi: dt-bindings: snps,dw-apb-ssi: Add compatible for SOPHGO SG2042 SoC
> >        riscv: sophgo: dts: Add spi controller for SG2042
> > 
> >   .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml   |  4 ++++
> >   arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 26 ++++++++++++++++++++++
> >   2 files changed, 30 insertions(+)
> > ---
> > base-commit: aa5ee7180ec41bb77c3e327e95d119f2294babea
> > change-id: 20250228-sfg-spi-e3f2aeca09ab
> > 
> > Best regards,
> 
> BTW, I suggest you wait until 6.15-rc1 comes out before submitting the next
> version, because I have already sent a PR to Arnd for Sophgo DTS.
> 
Sure, I will keep an eye on the release.
> Regards,
> 
> Chen
> 
Best regards,
Zixian Zeng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
