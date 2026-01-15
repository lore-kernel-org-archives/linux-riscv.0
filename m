Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7B8D46638
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 23:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+QX412nBRs0mgvlxQCKY3ydyLGY/Il+KgUb2OdsaKk=; b=fCTDtAy/P2N0WG
	wjTlMpPL5myNqylwfpdR+Kk9NCHd0qMpMmWtCjfVMvKhzJKZNUULydKz61BAc/iR5OUPzGxpL7owD
	h7rEcBGRVJe24Tcz0ljO/roeMhbyPyqBgDdtTWMn9aEOx3U18DDjgKOdHQHuz6PoL+/scDtdFVlUH
	DqAy3VAdnOrLEUoq2FzE6tHQPxZ5MH09kyFrV30SN8GlWpMHCrwbkb7zkPZw1t2Yd0jPcQcv0QEhR
	X16IOo8QrsJduCzp6sI77BP+YcXum0ALERbGmh76q2Iv82YfWms/uAjBc/KdhNznGlUEHX57QXv37
	c3S9tfjogOnOm9LfBZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWm1-0000000DJp1-1wUR;
	Thu, 15 Jan 2026 23:29:05 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWlu-0000000DJof-2KMy
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 23:29:04 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-121bf277922so1952302c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 15:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768519737; x=1769124537; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EE4G2+Ee4dVjEHE+oRCN2fxuWRapI0YlnZyPBEUQyIc=;
        b=Lw2pT6b2EC+KOiKjlJR/Uov0Rx0KIts8l1DYHBEw6nW72NNk05o74BnYOF3R/XOAGM
         bzlAKJ071yMHAfV4PQx4YYeUBWJg0s4pzxULaIovvOJcDUAxsZAJm1j+JaSk388mfVqo
         +V50dRU9yaGOX13qbwrwTEbD0WITvxH7Ad006GbmCN47iYuuNeQn3YRRUAoZ4B3vZA/g
         E8AGAvX/29QqILe7mDpBjv5eLXMronWCS4fN9wHEv2E7BSvx5aLqimtcVFbvwWAAJ/2x
         eAxpHuvYCnwpDjQRdbfc0FDhHG5OIXSnBky4txD+qrGFWRVeoSVALEoPiN7w9PfEXQhI
         asPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768519737; x=1769124537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EE4G2+Ee4dVjEHE+oRCN2fxuWRapI0YlnZyPBEUQyIc=;
        b=nNiurFsTCC3TE8BkwXgTuI/FYvny+hXfwCX6288IOLL/PHKfbFZeXo2ansxYioF110
         sTGR4K6+E8dlrdwypHqPDcTRfEv+0e19lS5NXMbsvfubdXyNnuXgEsuZXQyRuroVxqEc
         QazH1o+Odb1c2QLSjtfCKSsZVXAYTUn8ziyR5ilfFacrD4IxMc4vJjHq83+nTn946CyU
         Rm/AA0gSuPvjEkKSMBm6oDSA+Xikoc4MpGR8j0wI5/QLjY7vcmF89Z1ymLhX0Xzoo7NI
         T+uGjxfDTKWGxM8+OiwUYEFvInW3ewURjahV+PjkVGlIHOisHyHSU/wr4L9t88mEgimx
         Howw==
X-Forwarded-Encrypted: i=1; AJvYcCV9zz7ZkGcXWEQQ4x90CcBNiKjhD4cj4VV1qzxsNmuZZN7jTt8YemnaLXxwiFB6/CrQHlP4wM+uPw6ObA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYi9JFK+ewkdF1zwaTL9kQdSVaYipIVGuFujfdQt5e9yJXqcmk
	mSSv6lLpdvHVcDU6UJ5qA1xxKkpeZj0vcSn3Tvnyv+CvpAN0VnldFVdR
X-Gm-Gg: AY/fxX6fJM13K97D/bof5fDlqHu9P4juz8BfQmG1E/o1t3lgNG9GAfi5s9jzKF8/h6W
	Wlg7muAya+tZoZb7/zS7xPcfdh4VkMbTgR/jN+3q2p/3DfB6jCVXlYqT4X1OX7lsynS4Cb1C0D6
	x14WpliYtd1baLbMhmky3w87bWfzauFHNSjEyOWzhTwwa+epXIx31NK+pqBNG8VUcFYmXLxG9TP
	gu73qanuhIWKOtPAuOsPj+mr0lWFX8ojIW7VJmFqwC+OXM2YYDy+FiLXC3jsQ/H0Q2IldJn8l/H
	WoPKpVr3QZsPC6bpJxzBKLNvmuvp9DWi5dyNO57TGuHemZu+vNggN2wyz260kdDvBOpOK5IC6uF
	jvJJMfHk/ihfrSKa3k4xyWgLAjUFSq7M7gAWvTpl+W2cysVMq7JGumUNoVB7CljBd++Lvb/6y9t
	4nKRVvvE9qbg==
X-Received: by 2002:a05:7022:628c:b0:11d:f440:b757 with SMTP id a92af1059eb24-1244b35ad1emr888785c88.26.1768519737468;
        Thu, 15 Jan 2026 15:28:57 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac5842csm1005165c88.1.2026.01.15.15.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:28:57 -0800 (PST)
Date: Fri, 16 Jan 2026 07:28:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
	Ze Huang <huangze@whut.edu.cn>, "Anton D . Stavinskii" <stavinsky@gmail.com>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 0/3] riscv: sophgo: allow DMA multiplexer set channel
 number for DMA controller
Message-ID: <aWl3_1g1Fw_50Blo@inochi.infowork>
References: <20251214224601.598358-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251214224601.598358-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_152900_934149_C9B54A33 
X-CRM114-Status: GOOD (  16.14  )
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

On Mon, Dec 15, 2025 at 06:45:57AM +0800, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which
> means that the dma multiplexer needs to know the channel number.
> 
> Change the DMA phandle args parsing logic so it can use handshake
> number as channel number if necessary.
> 
> Change from v1:
> 1. rebase to v6.19-rc1
> 2. patch 1: remove a comment placed in wrong place.
> 3. patch 2: fix typo in comments.
> 4. patch 2: initialize chan as NULL in dw_axi_dma_of_xlate.
> 
> Inochi Amaoto (3):
>   dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
>   dmaengine: dw-axi-dmac: Add support for CV1800B DMA
>   riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
>     number for DMA controller
> 
>  .../bindings/dma/snps,dw-axi-dmac.yaml        |  1 +
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  2 +-
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 26 ++++++++++++++++---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
>  4 files changed, 25 insertions(+), 5 deletions(-)
> 
> --
> 2.52.0
> 

Hi, Vinod

Would you have any suggestion on this patch? Or this is OK to merge?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
