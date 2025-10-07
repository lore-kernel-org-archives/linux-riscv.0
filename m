Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAC8CAC5B8
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 03:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LsIFJqBILTDw5ju0GYfy6KnBZbYYpSnSw99yO+Fhxs8=; b=FFApnlouiCzLYK
	9vtDVvHm0c9Vk4NUbi883PbraAxnoakTUtfs6GGmtvlLOoEJ9uK1pR0Yh0z5sQDOwVMbXPPQf3Q21
	y9c6oJEVqTaVXdYUawkAqJ5zSRYj54HLyyc4VmOmkXEvFJvu/x5tIQ5dVs85V/473SfnxXQf5CDXy
	v5CAvrgsKY981SVATyYEbS6XSX7Skr2hpPeEorwSJj7A5GkFrQbTRsU9AzJK74WyXVd+LoXHyC4Ku
	620WI95F/uUY4Fm6rGue7mluHpJmlyJMs3/3drtVnP9sjeukQZi2L/k3wB2eUqhMzlQoDxXPoNT8h
	kWwaN9s/hv4kcSIjilTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5xwC-00000001BtT-1x79;
	Tue, 07 Oct 2025 03:00:28 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5xwB-00000001Bt8-0IQp
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 03:00:28 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-6353ff1a78dso5419131d50.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Oct 2025 20:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1759806026; x=1760410826; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rh3JimG/CE0+qqNKzktY8zBG1UkDVFkdOnHFQNnTyw8=;
        b=IDU7ChYFGRUrB9oY+Kh+xpo8MrN+n3arwliJIiMoj88WWcjEN2MhcS7OaYE4apSTA8
         7Sc/BT64VRUmMwKne6103tVslbfB1sVIN0D4QHyVmEEe37OUh7qC2sT/kGPArkuD3bt8
         tJyZ+CEk2kvZubHRgGbf5FrhjgxY5b2p/GubTD6N7wELbTPFYyMRzpWupaVX48/TKUVT
         s9H7QPHKVAdOwnbYdxHbvDhzNw1hkG5g6jGtdBrsggx/LwYbnOrWwI6jL75FtH+sLdTr
         XYb8/pmtF4UxQQQW7Guph4bcGAWgpSzSIdb5u0j3bFAaIVyr3PwIkJJhpiZxuFiQCmYw
         Wulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759806026; x=1760410826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rh3JimG/CE0+qqNKzktY8zBG1UkDVFkdOnHFQNnTyw8=;
        b=MSiJ6Q+XzEuP5SqNKfx/4SGyRh/fAK8odoQ+lXrvhG9eSZOSj+Dw4mnF+l5IZKX6ZY
         cD1biEjR9NoqJi+7OI8pXZBpc12iTIyfoVgeOlct4UlwtHVOeKdUeI5u29TdbFQd6tnc
         XXCsGnLyKAk0eRMJ5AXAD0zKEkgpXm3Um673ENtGoeXaUJRcvEX+TQCqwATZ40IrRw2t
         GeeyBEATpXpsqFc3EoWXNu8QTQQFp5xd481LR8PFjzTf6FXuzB37mSVZsszNnmwDmKCg
         j/yQhydRTiTT3l0Q+yA89mDPOKp4UAXCFf01KbT8V4XJo1iOrlFcFVeqIoLttvlZjWcX
         kwig==
X-Forwarded-Encrypted: i=1; AJvYcCVYanZW+D2lR9HI2Hvui5c010wPg42qKS1rGtlyjzf9qJcUBOcT1f6ohPUtnq5BVOCAV3EwbESDbmWwTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwp3j4GOM5+T/toeHDlOiY3Vurh1oNf2G397l/lYBPUbSl8jz0
	CjSjTMLsABdlAt2OgG5PI3OwbzA5kylySbIaT8jti7tZvHGH+xdkbRWaYGGqHmGYOVWlaGFWsSw
	ls/hh+pxryGbYEeAKX1S4TqWJF0ZjJwtiJ+N3z/+Rpw==
X-Gm-Gg: ASbGnctPLp1C12tbuzQCIzfhp7MWWXHCvN1RUgdMTtL2iN/pOcYHDl11aXBNFBqVsqS
	U6eyMzp09raQdkn50JQ6O/3CWnU9mkcwgO0JIdtvqKKYlTp8cGYusaBi5yXvijDKwf97qlBPQR2
	TrzOzylwY1/RYV9ho3ByTwDZlwgzxfqtzF2WlbetMZtHRfVTx4mGrYl6N85gzoVcNnwD3F0FsrC
	6modYN/nid95wN7sW0i/eul0MEDjMM=
X-Google-Smtp-Source: AGHT+IFpDeFYpJdIwoVLGKv3fyPFV65e4Lo6dOLiNHuo0GiL2CcLB0AMN4rustNbq6B28NgtaFZYGIh1Plud38WHyM4=
X-Received: by 2002:a53:bb89:0:b0:636:1f40:2f5a with SMTP id
 956f58d0204a3-63b9a0f0326mr13414591d50.44.1759806025867; Mon, 06 Oct 2025
 20:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com> <CAM3sHeA2HUpcFJ7LOw1XfjJjLA+A5KsnqFoHe03bv1wHJ_zoMA@mail.gmail.com>
In-Reply-To: <CAM3sHeA2HUpcFJ7LOw1XfjJjLA+A5KsnqFoHe03bv1wHJ_zoMA@mail.gmail.com>
From: Joel Stanley <jms@oss.tenstorrent.com>
Date: Tue, 7 Oct 2025 13:30:09 +1030
X-Gm-Features: AS18NWDkCe_iVrENrFktcYB8dLpg514o3M98A_0nmkuNLzig91F_L4PMhgS3hjQ
Message-ID: <CAM3sHeDPN2AVQHL9VnO-Fk=6Vt6Cs6Cv3qTvb1Mtxif2hNseDA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] RISC-V: Add support for Tenstorrent Blackhole SoC
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>, 
	Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>, 
	Anirudh Srinivasan <asrinivasan@tenstorrent.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Drew Fustini <dfustini@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_200027_109873_5CBBCD87 
X-CRM114-Status: GOOD (  12.03  )
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

On Tue, 7 Oct 2025 at 11:32, Joel Stanley <jms@tenstorrent.com> wrote:
>
> On Tue, 7 Oct 2025 at 07:51, Drew Fustini <fustini@kernel.org> wrote:
> >
> > Enable support for the Tenstorrent Blackhole SoC in the Blackhole P100
> > and P150 PCIe cards [1]. The Blackhole SoC contains four RISC-V CPU
> > tiles consisting of 4x SiFive X280 cores. Each tile is capable of
> > running an instance of Linux.
>
> Nice work Drew!
>
> for the series:
>
> Reviewed-by: Joel Stanley <joel@oss@tenstorrent.com>

I got my email address wrong in three different ways. I meant to say:

Reviewed-by: Joel Stanley <jms@oss.tenstorrent.com>

I tested it on hardware with v6.17 too:

[    0.000000] Booting Linux on hartid 3
[    0.000000] Linux version
6.17.0-tt-defconfig-jms-00062-g5874d2146391 (jms@donnager-debian)
(riscv64-unknown-linux-gnu-gcc (g5a43bcc73) 16.0.0 20250923
(experimental), GNU ld (GNU Binutils) 2.45.50.20250912) #76 SMP Tue
Oct  7 12:54:40 ACDT 2025
[    0.000000] Machine model: Tenstorrent Blackhole SoC PCIe card

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
