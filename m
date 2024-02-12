Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670EDC4829B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 04:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyC4xQK9DRCvFNrmagPW/x69zaslCNP9qEKSXOS01Sg=; b=U1xT1GsN3t93Le
	3shWYrUmJnYwvapVv5eLQ2f74OlvibK/eqpiA+rDsmlv4dh3F8cp+E50cg8sqTbeNdubzm7jNoyg7
	gQaWff42Tmz/Nc14EKRpLZJV6qMczJEMgGAdA0cG/qKEFEKdIF+zZ7kAKE/UvctgTF7qG5EuMWjla
	uosKNtPh7b0wNQlHdpX0fZKhZj3Qb9hJmKdTtaOu35ayWM6eqwLA25Mqyfxd9gXCqhTU7VQPelHwd
	aslMFRfexxluBbKfDSXxHjsGL6drrez/Bz0abnnX5rwPlQdM/VbkTtcleXSIl3BjT0Z4BJFPrwlE1
	ZjbHetA7ytdM83xnWHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZOIK-00000004KQT-3wt3;
	Mon, 12 Feb 2024 04:51:52 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZOIH-00000004KQ3-3U24
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 04:51:51 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d7393de183so17510075ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Feb 2024 20:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1707713508; x=1708318308; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TN1N5wHd/5s/p1QMyzLjtp6F087WNnhanJgsh/0rH+g=;
        b=OOnaADTe9ptig6eVYt2t+MltOWO4yWweMa8sBgeIq98IvBWJOdvvRnxT7NRdECnLEu
         OMJuft6Y/yZaYIMUsvzP+cyQ+oJpewbj92KfkLvMgmtqYvWHl69Tw4NPagMt/mQlP4nK
         3HQiz8kw4Zzsfe+SY3rIN0qlEopbj+W5BgsqiSw0ITSCN/wJgCH4patRwwdaQLXqyA/O
         vJvgCmhxR3JkmJiSJNbslAGPrKn0aoj45vTuswbEURpYN6YLt1+wWJxB5qNUf8p3rBd+
         /fVRIQQWXdASffSUuhodvCfebnGthGImGIbvWJBk79S6/5LYqduFOOyk/L2mRk0QVgqM
         72Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707713508; x=1708318308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TN1N5wHd/5s/p1QMyzLjtp6F087WNnhanJgsh/0rH+g=;
        b=v8drS97/FSGNhEdzfeGaWxROErxBG0jrMvrUymGopm7R/dj2WNhqVhAp24lquGWy7N
         MTADem0yljO90ctqAuE1Is/fT2oPBlY3OFO7PGmYKAFSxtIV7qcvQHuUmbyuuDLVeWk4
         nFw9tpogTCDL3mSLNIInz8mgK6lQc6QWZ7Ch9oGTWvTyyV1/IYS8guyqXSdPS6nX7x3J
         wdIm3dgst0O9ep3JkFkIm14M+1DaZQYYC+IlPvggog5GCZME8/IfdZMJcdDfuzZbrFcJ
         o6wE8lY84Rx0wA8QCu01pEe6zhJR5v2quCjFAK076Al0uCnEQCM1AV9tflcznW/jRBvv
         znbA==
X-Forwarded-Encrypted: i=1; AJvYcCUOLXzhCalz8tJ4CjMeNtkApn/b98tJaI+UrZX0DS2+n34bSOyme5Qd9/wDVu7h7PLtXhhFHgwtxK7zar/OlootSKAjzqj21hnv4G5O1o8a
X-Gm-Message-State: AOJu0Yw5quLwgWiZpfbOIdnEuuTKPGpH+XpDyn/O9lb0AFeCZB4Gjg97
	M9e1GoFMyT7s5q0pk62sj7xoLP3xk8q1mag1U+ggh8ckI8PhdfnzxhEbK0tHHYc=
X-Google-Smtp-Source: AGHT+IEY75u/xGNwtso6ikxk6UIGByK6eYyNtc4JEQmcS7pJ05+PReKBC2npnp/ZrQdzl+9s0BWt7A==
X-Received: by 2002:a17:902:d4c8:b0:1da:1d05:7a9d with SMTP id o8-20020a170902d4c800b001da1d057a9dmr6074230plg.16.1707713507909;
        Sun, 11 Feb 2024 20:51:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaPIfssrHeVXME5NSMoqDcFAbff4F2+6YsQy+XASCsypNoJZZdJHge7fzlNUi7H3PsNCFUndZbUckz7YHhySgjrUiLVYUNbPBrLxwjOaQccFIxgkFRw3Zg41GRWir8liPg+DvGfitTROQU6FPAq+yTsR4a+Qm8IwSAuenAgEjHqdCJ86Av8CdW4Cy97co/t28+wrRjzQP/W+K/WqosgfJcBV+g2fgiT2ipQmpUXMmot4CvVxOtXNtQWKE0ezI2cYxPJyZ7W902ZAVQMi5/On+PtLhfRTdiJV9b1xCZrVlp4G6mFqm8KPQT9jEJE03awXg2VMQ9KHkO7fig1rccHthlW/rtxFXAmtbG4MNYaGk5xOf6C2yjjWozW3z44Feqs302nDBIh3t+E2frxXIsM1qsrSEaE6F2Qw7jeSNGUixgfnYQUtXszVCVK2ZRTRvwEoDRVK0YHY1tovWkbtPrayC8jBHBuYmAQLlS1O8ZxVc1LhQ+AYJQgKYPiir2Xrm9
Received: from x1 ([2601:1c2:1800:f680:a936:a777:2d19:7ea9])
        by smtp.gmail.com with ESMTPSA id jz8-20020a170903430800b001d8e41b3f95sm5038876plb.51.2024.02.11.20.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 20:51:47 -0800 (PST)
Date: Sun, 11 Feb 2024 20:51:44 -0800
From: Drew Fustini <drew@pdp7.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jason Kridner <jkridner@beagleboard.org>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v8 0/4] RISC-V: Add MMC support for TH1520 boards
Message-ID: <Zcmj4Pbi/1c49dR+@x1>
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
 <20231212-flammable-idiom-660b1d85e20d@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231212-flammable-idiom-660b1d85e20d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_205150_085306_A3605D48 
X-CRM114-Status: GOOD (  14.99  )
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

On Tue, Dec 12, 2023 at 07:13:25PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On Wed, 06 Dec 2023 00:09:20 -0800, Drew Fustini wrote:
> > This series enables the MMC controller in the T-Head TH1520 SoC and
> > enables the eMMC and microSD on both the BeagleV Ahead and the Sipeed
> > LicheePi 4A.
> > 
> > The drivers/mmc/host patches from v6 were applied by Ulf and are already
> > in the linux-next [1][2] as well as the bindings patch [3]. Thus v7 was
> > only a defconfig patch and three device tree patches. This v8 is a
> > followup to change the dwcmshc node names to match the documentation.
> > 
> > [...]
> 
> Applied to riscv-dt-for-next, thanks! The defconfig patch is Palmer's
> to take :)
> 
> [2/4] riscv: dts: thead: Add TH1520 mmc controllers and sdhci clock
>       https://git.kernel.org/conor/c/a77f02e84896
> [3/4] riscv: dts: thead: Enable BeagleV Ahead eMMC and microSD
>       https://git.kernel.org/conor/c/18d92a03b319
> [4/4] riscv: dts: thead: Enable LicheePi 4A eMMC and microSD
>       https://git.kernel.org/conor/c/b6b5028473ce

Hi Palmer,

I don't see this in fixes or for-next. Could you pick it up please?

I've tested that Lichee Pi 4a and Ahead boot okay on 6.8-rc4 once
'CONFIG_MMC_SDHCI_OF_DWCMSHC=y' is set.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
