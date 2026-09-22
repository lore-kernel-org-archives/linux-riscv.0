Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EEBC982FA
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVrxfrD/8C4/Rsom9o1wD1JwlFBKobwD+V/K05akJyY=; b=N15pCNHS7IKYg+
	jp8jgQQrq+FnmnYBYsOq2C2sc9pENTHA31yEmw5OgGfeXRX/2gcPm3h6FVKyN+FU3c3ucnxL34nh1
	QeBQXyIjBbf8oRJCXszPMjkjOSUhApL/gmdLn4oO0kVH7nO9ppl/ktclI5JHIphfWdpJ5imUtYUCt
	aNndmOIRvdBg1GGIdIBz41iYDfIazFb4pwrdHdjLG0qMqbSLwRDNi9K8i1eaD7b8G+mHx1IZsgmRR
	vl7T2FhhoYCc3zxQnbodAnKw2dhmfty6BXscQNT57u73oENWNf7D/iHSvJ+OZSpkWp59V5XL+cN0C
	Qpg/aKi03fLNOx2mnWrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uwG-00000004VlS-0wwF;
	Tue, 22 Sep 2026 07:29:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uwF-00000004Vl6-04yp
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 07:29:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 74E9B600CB;
	Tue, 22 Sep 2026 07:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90ADA1F000FF;
	Tue, 22 Sep 2026 07:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790062154;
	bh=mrmWGHtOctOdZhqNCNIpUiwnnfhpa2OZaFb59cUmK9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lj4h3NN4HFuNhjBGJO0IUmHXJZIe5Dwhvi97k38gWPKQSn/ezGBj34b/irhN3gLyM
	 R+MVwWQbTuaDMbfD/9Tv0V4fXth90C054y8BTYzdhlR7/RTx+MAVweAMY2SFULTfU5
	 vOaNN1ca3ug9IQPXoQF2R3R5BDZhS6IjaildgQKbhJmJRH8piTcYDKcvFd56o63bt0
	 Fd33nMEWjwknaW/qe5bHXq1hJvAdooBxTzs/LeZsbNI/LKuywyQrV9o4gTe7V3hveB
	 29EJmCcsssT9aD+DDYYFyx2RQx3LBe3r5BaobDEo4pShlkyrGVMOXogtDkgeS1OW3A
	 w8AOLNMJCLE3g==
Date: Tue, 22 Sep 2026 07:29:10 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for
 OrangePi
Message-ID: <20260922072910-GKB353745@kernel.org>
References: <20260921124206-GKI297024@kernel.org>
 <20260922065001.1888961-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260922065001.1888961-1-amadeus@jmu.edu.cn>
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

Hi Chukun,

On 14:50 Tue 22 Sep     , Chukun Pan wrote:
> Hi,
> 
> > Could you point me where the u-boot patching the MAC address?
> > I'm not fully aware of this problem..
> 
> This is handled by U-Boot's fdt_fixup_ethernet() function:
> https://github.com/u-boot/u-boot/blob/main/boot/fdt_support.c#L639
> 
> do_bootm_linux()
>         |
> boot_prep_linux()
>         |
> image_setup_linux()
>         |
> image_setup_libfdt()
>         |
> fdt_fixup_ethernet()
> 
So checked the code, it's not a direct problem of /alias, but due to the
env variable provided to override the mac address, see

https://github.com/u-boot/u-boot/blob/main/boot/fdt_support.c#L698
	tmp = env_get(mac);
	if (!tmp)
		continue;

In this case, I don't think it's necessary to drop the ethernet alias,
I mean it's totally fine if there is uboot ethaddr env and it wins

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
