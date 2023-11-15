Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC79C072A2
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIp4T+5MIZMmDs5s/kH8ytf8vj19uJ2wOh14OnhpzxE=; b=dj6Q0JTiRQHHp5
	SBXzI8p7ulDp6Imb+rPxk/pCUUp09dKf8NkvsAg50TQr9nU6hWjBsiPP6wdQlCHVMV4np97Me3BXn
	Vw5K+rr3Odr2bgzjnajQOuIZIDLJXz2lhWgRaEYoYycc6SCXl/hXNYOqlEsoFpUuTbvXcUYVRkvGg
	mGlU5TMbiGrW4oZ1AypROWymCnxUU8fXvDnZs4GSG7s/K967F0FWu4pZtOtT6tY7JBCYVXeQlulhy
	MWkR1Hm4reXPFPhnPh7jABF6uxTCVzmgFtgz21SSx3aKFYHh+PG8Qv28BFGirZQpT6uteJ4FjIp4k
	zqUTnBTzANreFu+rW69g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3IO8-001HVZ-2x;
	Wed, 15 Nov 2023 16:05:12 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3IO4-001HT7-2d
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 16:05:10 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-66d24ccc6f2so9116556d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Nov 2023 08:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700064306; x=1700669106; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MejHG9v78thYt1KCbL5Bhup5VOWpNmj9HgzD1QZtMTA=;
        b=MKA2Nn/TixDcM7/6r892qN1rsRfcwvuMiGrXQYi3KpLFXBgkNnL7jTuLnhyTqIDAj6
         tYeItaz8tFT4vGRcZtEUldjBD6+9USsAUaA1YffKehkQANv9Mq59SdcCNhX6G6TYAqVY
         6+qZt50xTFSr+fa/sFx9M4RdkbIk/ARhEz1wo/QkB6oo4MnCq9ODhskk4hVwAWqpsb6q
         2lYLkvg8S5MkadbmWloU0aU/hyu7A3BDe2XqL9XNCF/ISUxoeg4PIUk1H57+V0RopwpL
         qIMbuLkV5sBEuc3JZzgwL27RE7fVd7GCRXXwYsCLTpha+0DHuDRGGzb6pVSmotiUNR06
         DqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700064306; x=1700669106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MejHG9v78thYt1KCbL5Bhup5VOWpNmj9HgzD1QZtMTA=;
        b=k/BbsrXe98iG9SbqKviJgySlYvTEKvXAwE5Ongnae+0MJrLfkYUCaez/Lk34FSP4In
         QCnaz8jF8AAnvqHB1f49xVbKgluMsb40f/DAMeCtpdV9//+V2r8IAAt/xU7F83D5Jnqc
         j7/h5UuPaP8/O6q4VFrMZUZOXpxa1E96MoxMMDejybjenquPGHg0z5tQhnbemobR2J3d
         NAwv9ezOau0LGbHIkyJ96NmOuZltR7mlsMlFZySwP9n6XJPtS8pTSvtx0ikD1dlNoj9x
         J6Qu87PR8rVr11SaPtbPfMbVweatjgXSMksKg8K7kFH068vCftSNoMCPp3zQbVKj2oxA
         35iw==
X-Gm-Message-State: AOJu0YwOOHhE0ZmFsCESNSQgQwk0ppRNHrkIrQY0Wf01yZPkJz6e9WNd
	SUVghM6ZlqU7CCUPQcf6ePStnw==
X-Google-Smtp-Source: AGHT+IEcj6XcTZ0mNvYbPmKaVsfiFpIwuHA7OmpjgBlO36wsG12GpSde51/jSBEJuULlMiocskZovg==
X-Received: by 2002:a05:6214:1706:b0:66d:6a92:16c2 with SMTP id db6-20020a056214170600b0066d6a9216c2mr10015972qvb.8.1700064306362;
        Wed, 15 Nov 2023 08:05:06 -0800 (PST)
Received: from x1 ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id k9-20020a05621414e900b00671ab3da5d0sm617138qvw.105.2023.11.15.08.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 08:05:06 -0800 (PST)
Date: Wed, 15 Nov 2023 11:05:04 -0500
From: Drew Fustini <dfustini@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 0/7] RISC-V: Add MMC support for TH1520 boards
Message-ID: <ZVTsMIHc50hkQ2fe@x1>
References: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
 <CAPDyKFooGiv6fj+X9c4KXaBjvsTTRaHSrxinQYirTWXmX1Ht5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFooGiv6fj+X9c4KXaBjvsTTRaHSrxinQYirTWXmX1Ht5Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_080508_854621_59F98718 
X-CRM114-Status: GOOD (  18.68  )
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

On Wed, Nov 15, 2023 at 04:51:30PM +0100, Ulf Hansson wrote:
> On Tue, 14 Nov 2023 at 22:08, Drew Fustini <dfustini@baylibre.com> wrote:
> >
> > This series adds support for the MMC controller in the T-Head TH1520
> > SoC, and it enables the eMMC and microSD slot on both the BeagleV
> > Ahead and the Sipeed LicheePi 4A.
> >
> > I tested on top of v6.6 with riscv defconfig. I was able to boot the
> > Ahead [1] and LPi4a [2] from eMMC. This patch series also exists as a
> > git branch [3].
> >
> > Note: I have only tested eMMC and microSD. I have not yet configured
> > or tested the mmc controller used for SDIO WiFi yet.
> >
> > References:
> > [1] https://gist.github.com/pdp7/881342620ec1509685f23a387e2fc8d7
> > [2] https://gist.github.com/pdp7/97017ad88d83fccac18eba69bff817b7
> > [3] https://github.com/pdp7/linux/tree/b4/th1520-mmc
> >
> > Changes in PATCH v6:
> > - set the mmc nodes to disabled in the th1520.dtsi
> 
> Patch 1 -> 3 , applied for next, thanks!
> 
> Kind regards
> Uffe

Thank you!

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
