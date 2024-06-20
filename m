Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50CDC27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R62mcd3iwtWjQWXtf5UKTeqjdNvhkmM2K+YDzRc7RhU=; b=uPdzx2c+8C4lEQ
	q7B6qjLPzE7IqDNSCUN+IGuzTpgCoVsGHoLMMOvBY7Nv77YiKRvGc2WOARznQXVQ4JXZkmkNaWvM9
	X2iDUkBWx9jHkXF6Gen5jREhgEH24BWd0UzSLUarbvOLb5KvsJahCftW+M7qs9Xbb/ns8D5hlRF47
	iaJXBS+ftJ19hxQ41FdxAAmjZFId8L6MG3TRoOYfJRon0lLUHnEkSEwZaSppc69nrhz5H2RFQZoOt
	YftVaAjah8bRjxNM1Tel4aY4lmZtTJcWkI/FWW1WDuhxcZno/LGqWVzrsK0L7YbYTKajEijIyF5fV
	XZ0UdGY5kMbxKY7opf0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIjB-00000005Qbz-2AHA;
	Thu, 20 Jun 2024 14:25:29 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIj8-00000005Qat-0DWH
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 14:25:27 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dff36345041so962652276.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 07:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718893525; x=1719498325; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SQMNm/Wgloa85H/6Ml/z+UyGgCgN9Pm78Q6nwvCTYt0=;
        b=z8p0H5uVpQUYQrb4R7+XBcpylPombLLZQriE9oO811j6xVbJ1eEHY5cZM+IIsfY1w0
         9o80LzACwMo57DCg5//1TyYSPRLfNnUrvXAe/nzZteWfsQlXL1HbCR60cYDK2bRp+mc/
         GuTU4l0Ogi4mAFeNpE/rBQGlnG5d8JJkvaJTzR8OJux175ASAsAQg5xZ8fAgkYGZ/0v+
         XEjUYagHFw3YtKZ7M1A+Es0J9TezbMlVqkJdp4JThpL8SUzxP4Hd6/X4vt0S2jkPZHYU
         n/DwPweoHicjE2lzzkQhEfnKPtulA3V5tawTMxq1UVR1EQ6g4y/GVKwqzc5jsc08fnS4
         Erfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718893525; x=1719498325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQMNm/Wgloa85H/6Ml/z+UyGgCgN9Pm78Q6nwvCTYt0=;
        b=Ww1En7Rc4XM2T9ncs3fC+reM2xopYLhYOlCLFZBocNBklPRWnqIIdmFqT/bmPq7KUF
         0PWKKgnyOrUB8kUb9HZwa3L/cdUleWbaM4L1ZwE2xzzTvYV+Sp6mjQ2LZduXj3/B0cPo
         F95SfMxUVT4URwcDT3uBhtkPlkGvIIydmEw2UbDnTGjukZjZVZGDaJd3+1q9Loc84mOa
         tSzb2wzErjL/NTH1skpUUAYxVbD71l933s7aNGXI8plMI5Ywtu7RqqGtgPJjkkJVCU4x
         4IzsSbZaAHMpE2B4UMAqD+/YSCyRIxJDl/Um3OABZMtCt7FY8baFhtXYZV5Tc40z5uBh
         Na+g==
X-Forwarded-Encrypted: i=1; AJvYcCWX/Sz93JCaL9m0S0g6djMubtflm//rnyIfzC1shSGOHq7LVwDYdKehhj4LpZzo4yM/EWjwCKRzlR1FoQGT3+TmZ5fgiH3hIV+hnA5uE3Df
X-Gm-Message-State: AOJu0YxGU2b4rVn3fX3VVRfSieJfTHyR7CGQRzAKMRal7xcFWfy6+4i3
	Wuuo+oq/WTSeq6dgn6+PWp/YXPliPZXVCDYyH1Kzh31gn+4ZZffW7Vs8QoIzcTaQMEasEsk6MND
	YqJAcj9CfCVsiNGM5NQkD6q0bd7fIw0ofRiW/Ag==
X-Google-Smtp-Source: AGHT+IHR7fpKdExIeayYO8J71ywzwR+4VpYOIFbdfii6VoqwkxcVhItB0QotOZnRgehcLXlgkNKGKaigbbl58w+Xms0=
X-Received: by 2002:a25:8188:0:b0:dfb:1ea:23ee with SMTP id
 3f1490d57ef6-e02be17b1bamr6168497276.37.1718893524724; Thu, 20 Jun 2024
 07:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240612-brigade-shell-1f626e7e592f@spud> <20240612-dense-resample-563f07c30185@spud>
 <CAPDyKFozcUPuMooDHVSBZomHTGKzseVf9F=YBY_uQejh9o3x7g@mail.gmail.com> <20240620-sabbath-ambulance-b8764fb386e9@spud>
In-Reply-To: <20240620-sabbath-ambulance-b8764fb386e9@spud>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 20 Jun 2024 16:24:49 +0200
Message-ID: <CAPDyKFre12rqqwar8sfoWyc6duS3psp4OT=W5ToG9r_EdqH89w@mail.gmail.com>
Subject: Re: [RFC v1 1/3] mmc: mmc_spi: allow for spi controllers incapable of
 getting as low as 400k
To: Conor Dooley <conor@kernel.org>
Cc: linux-mmc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	cyril.jean@microchip.com, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_072526_301699_621BCFD5 
X-CRM114-Status: GOOD (  16.98  )
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

On Thu, 20 Jun 2024 at 16:12, Conor Dooley <conor@kernel.org> wrote:
>
> On Thu, Jun 20, 2024 at 02:50:15PM +0200, Ulf Hansson wrote:
> > On Wed, 12 Jun 2024 at 17:48, Conor Dooley <conor@kernel.org> wrote:
> > >
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > Some controllers may not be able to reach a bus clock as low as 400 KHz
> > > due to a lack of sufficient divisors. In these cases, the SD card slot
> > > becomes non-functional as Linux continuously attempts to set the bus
> > > clock to 400 KHz. If the controller is incapable of getting that low,
> > > set its minimum frequency instead. While this may eliminate some SD
> > > cards, it allows those capable of operating at the controller's minimum
> > > frequency to be used.
> > >
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Looks reasonable to me. I assume you intend to send a non-RFC for
> > this, that I can pick up?
>
> I do intend doing that. How soon depends on whether or not you are
> willing to take it on its own, or require it to come in a series with
> the spi driver changes.

I can pick it separately, if that makes sense to you.

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
