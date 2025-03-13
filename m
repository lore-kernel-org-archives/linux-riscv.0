Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBB6C282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tP3PvXZNogKrFhzo+AqufEKpTfmg7FsANlV06jn93oo=; b=ir21mT3hCxdPL7
	A29MfSsqF1Eo1MOaF6ddRW4CNinRvTDTLvyRxer1S4LE/gYv0Yo/e0A4H+dVxwZUTIj6tpe2DJKlu
	qqsRzX7BdhBbH3/grcFvfWAC7hYKqM+6H7WqJRohVK3waGMtqTA0jYv4vPhniZtkGNprVawJn9V1O
	/3vMwp7TiYUN4um52oc8JRGe7lR6hmIpP6YFvT38kcGFwnRzU5MzJaVyomf92Cv8N/nhUOzcur3nv
	k5aROLO4T/wKye3Bf0Y08gzvJ+lZoKr8b+mVMMf/JIRHgb253h4ZuSAcR8qltTrvQPcs7GAdLcmoW
	fA9hmXQudNlC5c2HsgWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdmu-0000000AWi8-3sDX;
	Thu, 13 Mar 2025 08:19:33 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdms-0000000AWhm-3Pfb
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 08:19:32 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22409077c06so17488025ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 01:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1741853970; x=1742458770; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWEt0i+2shFRFdfbZiPgVihU5WzfabKYy6Z4Ak51Ze4=;
        b=n58/tHf1pj4Lu67Qih9CcGzB/KVKhdT0cWik7gQXOAIU2mexSonULwdqBaLCV3eapu
         5UzLcrQBL31raJZp34VnFbMRqRLaW8bkw2c1GTSgkSW04gm7/X+TA+xnDXqI6E9JinLg
         7mRuOWYVpCjGaIqrbDbm+DAQqHfJ5BgYcEyRDA3pIrFKdFebphqbNV7PNBD2IZ1MM9oC
         oZqRR5Npd8NrNG2c5cXiJkePLByoUAxSJpTVQa16vM4/jveQjp2DZQOGxl4bGFjmsrwS
         H0jg6jyT4hsCBmmvRQW11gY/947ym95g8j80mD618JuapmBbgd7N4igFslyEe+Rb/eE7
         gtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741853970; x=1742458770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWEt0i+2shFRFdfbZiPgVihU5WzfabKYy6Z4Ak51Ze4=;
        b=e6ykADMNkCsb7kgW1O2yWehYD6o5MsyCpynrRRBqWinuSOqk23X8VbZSf39ARP4b+Y
         6zZXu5OS3jGHrvMRw9cYJIXAH68iBi4dSXbgY6x2PNXy4KlpDpU7RPQyj9QxMeuyfd+b
         yCL/4HjXkO0IMbc/rfxPluoBz0IcDP/5Jb+r7MU7qPT17E3ydMoFEvUZXR7QmLnRDT/+
         k1fAla0RKiuk+N7cV8bhz0d+XUSojV3Xi4PoY90f6t/9yn8HomHrrWnx0FcEIdJWAk1A
         n78s/EoJ6C0NoKwuU9aWG2zocCW4ZkGNdgpHzfx4S6DPjI47H9S286aR1rg4RjlhyTIW
         WKsw==
X-Forwarded-Encrypted: i=1; AJvYcCUoMleWSOU1I2tJg9FcAACK/PoS1WDuTR+hYv3pZEP8Ad4WXWUZp5qx58SDaNZ3WWx0s/hnYVTm6ge4oA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzANOrlI8JP16sWBNs0ZCQQ5N9DncblIaSyeHAw+Fr6Mb31PAH8
	a5ucFHN2Zm+FRoNCkAYN8t/7OS3kwtxC5Mxu1dx3mbz4xEXa0XfOY9oh460qd08=
X-Gm-Gg: ASbGncvS3tUuoIiKr0JjvVPxZ3RxP8zyxYmnlglCrNZ7rM+CXHEblJPAZaVFdNg/Wy+
	U2Ij2fR9Tya3dB5eyd+oCEVYqV5fpNG5CcWIypPx2TWsF+dqV2J9Wirr0ARBrBerSn0cFY1GjHN
	mjXfma2AOv/mwM4UbOcktOXPrRj0n8ouYU8VVChDkTRwMVClIzSnIiUwpD4xVO1tQr81M4qEFYu
	UoEcdhXGqPAvGNxvhfT9rr8873JbR8+3auKXimowtcWlLOdqMLC11mwTXoxh1noXb0GjK2jRq00
	8U7/OLbV521xVISfjP3mEDUgpQ==
X-Google-Smtp-Source: AGHT+IGvY/QZ39O2R90TZNOtRAufIJfxJ4YdpteHqgXktgzR2lShse5uenWthjfQWslvwJsLPVd98A==
X-Received: by 2002:a17:902:ec92:b0:220:e9ef:ec98 with SMTP id d9443c01a7336-22428896a74mr388719455ad.19.1741853969936;
        Thu, 13 Mar 2025 01:19:29 -0700 (PDT)
Received: from x1 ([97.115.231.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd3c59sm7843595ad.218.2025.03.13.01.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 01:19:29 -0700 (PDT)
Date: Thu, 13 Mar 2025 01:19:27 -0700
From: Drew Fustini <drew@pdp7.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>, guoren@kernel.org,
	wefu@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	m.szyprowski@samsung.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 0/5] TH1520 SoC: Add AON firmware & power-domain
 support
Message-ID: <Z9KVD1GKGKPwMR+9@x1>
References: <CGME20250311172030eucas1p12dda42760f751174e774b8d1a3d3f4cd@eucas1p1.samsung.com>
 <20250311171900.1549916-1-m.wilczynski@samsung.com>
 <CAPDyKFqeaq5xVNA=0CpMWSt_78qXJsY6+mpE1CSmLrVMQazAjg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFqeaq5xVNA=0CpMWSt_78qXJsY6+mpE1CSmLrVMQazAjg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_011930_868713_3634E5B3 
X-CRM114-Status: GOOD (  16.35  )
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

On Wed, Mar 12, 2025 at 02:40:05PM +0100, Ulf Hansson wrote:
> On Tue, 11 Mar 2025 at 18:20, Michal Wilczynski
> <m.wilczynski@samsung.com> wrote:
> >
> > This patch series introduces and documents power management (PM) support and
> > the AON firmware driver for the T-Head TH1520 SoC, as used on the LicheePi 4A
> > board. While part of a larger effort to enable the Imagination BXM-4-64 GPU
> > upstream, these patches can merge independently.
> >
> > Bigger series cover letter:
> > https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/
> >
> > This series is versioned to maintain continuity with the bigger patchset it is
> > a subseries of. Please find below a changelog for the AON & power-domain:
> 
> I can pick up patch1 -> patch4 via my pmdomain tree, assuming I can
> get an ack from some of the thead-SoC maintainers.
> 
> Patch5 is probably better to be routed through the SoC maintainers
> tree, but let me know if you prefer me to take this one too.
> 
> Kind regards
> Uffe

Conor - would you be able to take the arch/riscv/Kconfig.socs patch?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
