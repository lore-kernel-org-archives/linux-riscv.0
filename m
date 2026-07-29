Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96983C53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 01:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ebev783sEeFk6kG/BpF6OM8kpviqu2vqgOc03QuMYPw=; b=x4Dmrq4tleCRLk
	CzxrKiihYgc5S1cmT/hmFvPnSZetkuhcncDzFOJBobUoK/8/RWnFy9S3T0Jv/uLeStUx5jb2WHbpk
	TmpVJu61vZ1oNB2M40Dt15c7RK2zak3GoBhEv4TSgDFeTzkBgwuU57DKIlOpxox6f9mGLAxNgpGO7
	MhwdgVv8vjP+L8rqdpf41kSBH9GBeGXiVNM7xNjjyPtjvBYlw9V+MAdmiVxGoRS/j7t5+jxdUsG9y
	2MOOL8kVjLKgV9k4BsuTG2oyBM9FjG3TgN3CU/Sgeq4uP7nUy9PcRl2e04g0Zeo8mLSWuYVoFM3hf
	vDNhRsTnVQnj4WtCwj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotWO-00000006e2H-46kG;
	Wed, 29 Jul 2026 01:55:49 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotWK-00000006e0i-29Xd
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 01:55:46 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso335233a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 18:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785290144; x=1785894944; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WgpbITyz5r54kEwZv0NwNpMih07miMaqmNgkn1d9m1M=;
        b=T4SfcCCHLj6p+nibKAkJJsmFY6le+dwY+wgQpXbIGzrQk1NtkU4Ta5ZagF1D2xeB1y
         S3xjJsn02pauRutD7b5l80G3tuyKG64BM7TO14C1dTG6It2TZ6oHfl1kDEN8FH6m5wTJ
         ceAjA1otTjiGafUd7xr/H+W90LTNVhCcn07rsyv5WMPz41YKWKwupUu/K4vgXrhxvNT0
         EQtkYdasIE1RqaSELQsBoFJkzW6pw/K0/yBZ8tbdZlEXNvX0dTOaTuu7bZcYPm2NrXQb
         adi69TXC/0TdHmxq2Hn3aQpPMuYI2+XJhWh6DMXAlSc+GDo4GfXKP5bpJu9nVutMSEEt
         ed9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785290144; x=1785894944;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WgpbITyz5r54kEwZv0NwNpMih07miMaqmNgkn1d9m1M=;
        b=c2hSTRcPgAJafgBGO3vpgW7OJDpooMsG2jbnz9vJuOWhzWh0FYQmeYGFQhoQMTkB6M
         biSgakXv+TmZnmWVziotRW/TbTCWklHqynl+jF/NUHbBtS5LplQ8jITMCiTc8uin7WMs
         UdEYmZdItpPXiH5o0YXI82nxu6QPkXziTIPIECb45wkzX50JwzhUsXLAnFG7rbEst0Wd
         udjIrenzPTUOfj1bfP9C8AcIltdvJvKkGsjn6li77WKX8dEyoFEZRCHGLJIEaqjeKDrn
         +GFOQRPlb4JETFrFjGLzJs5ybaz/BF02swjOHZ57yVGA0kHLAxaM93fZHLiFJaZLNubH
         HUAg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4a1OWn15emCtKiLsmePXgvnORvkWdfTKRiASPEtJIE2gHXFSzS2Ijte1AoxxrxFpFVC9TtnYUFZ/R2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsbDqgyg3XP+K9LaId56hN7/BBOjt/vceClaXlQ9u1lgHgE+tk
	k4VlYCjFKVhg1ADcNMC3KGp6BbqAer3el6s15Zu5kWIry9YAcYdik3vU
X-Gm-Gg: AR+sD13wbuOcSmOC3sFtdkZf7cBw+5m09rWBOjLCC8i0kCh5Pnswk4rfNI5Pj/jPNbW
	hs0jq3J7gc2APBxrRgCHjPPw5Yfb3t8G70GZvTF2pjgC0MEcnPEr0UCjhvKZNa48HML8ctgOR1H
	X6fFoOA0EI6mzwDJguAEPsTWdpr1ZZ7KXjdFeUAzf8tF6mJlHYilPlvJb9l/QQOb9ludiarox8u
	/0aRZLyUeLO+/6HViSHePTShDYB63dHO2gxyLFQug7zDjgTDJ6fvGJ/EG8FndW+Ge+aJRmRWXKe
	6DoX9zXqQwJkOHEM55oEkhCQPClR3Qkp+8j6lvUeVnJ2vTiCsy6WO6vDvWWSDq5p9jS7G8f6brg
	dB6aZYmvmkpE0ln/kU5IieHjjdIxoIMQJhCc+xSzFjc9ofylB+Cvh4TtvgvKOjVY6PFuLSpQQrD
	EkPPR6q+q8/kP67rh9tdjWbHUyoVl6KUESBGPh5NgVri4GwsY+KidKdaaEycw=
X-Received: by 2002:a17:90b:1644:b0:38d:adae:4866 with SMTP id 98e67ed59e1d1-38f6a3dc276mr5144331a91.21.1785290143640;
        Tue, 28 Jul 2026 18:55:43 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642fbf74sm2022334a91.17.2026.07.28.18.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:55:43 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v6 0/2] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Wed, 29 Jul 2026 09:54:58 +0800
Message-ID: <178529008848.164571.1132515193531771269.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260511063818.463877-1-inochiama@gmail.com>
References: <20260511063818.463877-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_185544_818400_64E1C71A 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

On Mon, 11 May 2026 14:38:15 +0800, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which
> means that the dma multiplexer needs to know the channel number.
> 
> Change the DMA phandle args parsing logic so it can use handshake
> number as channel number if necessary.
> 
> [...]

Applied to dt/riscv, thanks!

[2/2] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
      https://github.com/sophgo/linux/commit/3c698b64db0145fb5edc3f19e4170b41b4508281

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
