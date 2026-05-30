Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960A4CD5BD0
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 22:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dp2rjT0jRJ88wN+J+CAXo6sADFlcCq+hM9EKoh5ti70=; b=od6YljrYqAXaTH
	VGRM93ZeBoeksxHapjQA4G8YlXwOHRA3Hx7PcK4tGSbQoZqGVp/zMlWX3hYIOnEEq1wRYOBUrJVl3
	yd3zFpMFQJAw2EHRQR/fTjdkSSYX0hw35GV7vuFNc3c9KvucFaiKoii1IvDD3VRn5oQY6J14RrTMR
	6N/Fzpphp1nl2hQ8DtecarkjaG1/oXPpN4YfE4S1O01mUrVZuSptuf+Dsw3qy1rHsffxIRiKP/MQa
	admHJgss9hgCP7R8g5X2gRPNajCFQuMKl7iOymkh5Z62SW/iO7Fbs0vn6YNLNU6ZQ1s+pckHoh+pr
	Wl3CvBuvUAd0zhlT2HUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTRle-000000095NS-35U1;
	Sat, 30 May 2026 22:02:54 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTRlc-000000095N6-2Eje
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 22:02:53 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-36b8e1760ccso1718721a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 30 May 2026 15:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780178571; x=1780783371; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jULRM7QTG3bd40X4f9y14bjufv7DH+YwiBBgZzfKYuo=;
        b=YBqepKIotbgscHanUlEapNHFBL68LPVAm7BHzTbv7p1n17O+K6/SFWLUIScsg5OpV+
         iQtnGIhKowYzuGs+wYCnhRFXk69PKZ9nrw7KB3zpjkermpRdQ2K3y7SR7MC1u0deDpWq
         Kw0HycBvCYgnmMn6Vobn/XdycOtGA0na794KpDNo+6UjjBczlB0g1DwBfzNtFeKvPMKW
         C9L0ztV1+vHM8VYs3rbvnEBi3ioYjvYr8zOSAB6mu82oWJJKunw7PvyF1zGcH5byDSFo
         kNgGMssWHg+Zzpzq2HqeCezlS21b11E74jwyxKQhGUBfik4rK2QA7zZcejxbLrOWqoQl
         sBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780178571; x=1780783371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jULRM7QTG3bd40X4f9y14bjufv7DH+YwiBBgZzfKYuo=;
        b=IRBgb6tmMJZXWzGSF2hRU34F+/CIG32qguBJRhADSWOoBfiwMFMVbyLaeGJy9EbtL9
         acYCnIPsHWjsevwudRR+p8wEJD9WruTVi7037LQU58/UtnG30tTuVSMNFJgiy+p7GQir
         8rYhvbH+iZW50C8USvnXMiG/4dRPzxjg9ID4WvH90HrzvnxBQ5MHIadxi26uoCjaodSS
         zVk1CTtFgJnrH6Xc0Vs6HvvslvdibbzcatyOdJ9Z8eD7E5ys2oCk1s9hVVVXkXXlgaH5
         2fPgNgl9WCqyQ/OeSwjcNSXj38OgJECQRfxh8b9BEnCqrfzv773PAYXUNnKL0C2Pxydi
         bxGg==
X-Forwarded-Encrypted: i=1; AFNElJ+jhboIExYMzF3wxvsTzXKCdCAOl8g6NscNm5HPWJ5iknjg2afJeiC6pct/1AdN99FuP+ck4cEmBGpmTw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyomnyh2mrE1CI52gnv7bH/xmBBJiS5CowNYN9u7KnducyNYflt
	zxG331nAC5iYeA0IMw4dKBCfrJg2pE40JkJb+KWi5tSZ4xtXfu0SCfzd
X-Gm-Gg: Acq92OHq0PmJxQrGEbfCITNhQH/fpCEaOunJ388/s3bWV8NmzPi82VvS067fnnVb5P8
	g99ZqphBkbuE84pw5VoJjd2/my/RuDm7H4JSfrNNiGwIoE4vLWLNvsDMVRGo7fe7qKWJfPp+R7C
	XCsSX2cwzOBftIXYtV8ju+EJDVMzWqR4K07Ksexlv5rZbuaBmF2x+i2YWkqE6qw/0W8ii/FZkCW
	McHCW0Zd9J6YS6ROBc+JpISRKXrZX9EkzJL1YR+3+TvATAgt/SaOPHrXwKPT2BmzoNvtXVg/8il
	kp909C9XLm7g7BvHZ4rjTa+aEBepto3l9LJV3Ps3LBzSs//VNxuOBCj9ZE38wVG+pTnTMumq/Ig
	Ksfx1yCN6AIQVYjob+ISMOitP1NJa6l5PQkWqKzRfRmCgFjF3/yHBlk0UsJY0lPxjANI1UPhdw/
	EuBIJwa3+ZoSCT3IfGhU6rEssLD3bygWxPxg==
X-Received: by 2002:a05:6a00:8cb:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-8422543dc0bmr4619329b3a.27.1780178571566;
        Sat, 30 May 2026 15:02:51 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214ce54b8sm5485197b3a.48.2026.05.30.15.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:02:51 -0700 (PDT)
Date: Sun, 31 May 2026 06:02:38 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, tglx@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com, 
	unicorn_wang@outlook.com, inochiama@gmail.com, daniel.lezcano@linaro.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	dlan@kernel.org, chao.wei@sophgo.com, anup@brainfault.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, hanguidong02@gmail.com, 
	michael.opdenacker@rootcommit.com
Subject: Re: [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board support
Message-ID: <ahteTfYC5QMlpjF2@inochi.infowork>
References: <20260530173347.33533-1-josh.milas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_150252_573828_8EAA9789 
X-CRM114-Status: GOOD (  22.14  )
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

On Sat, May 30, 2026 at 01:33:42PM -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking,
> and read I2C slave devices over i2c4.
> 
> ---
> 
> v5
> - Fixes spaces at beginning of line in &usb node of DTS
> 
> v4: https://lore.kernel.org/sophgo/20260328173450.219664-2-josh.milas@gmail.com/
> - Rebased to latest sophogo/for-next
> - Added usb node to arm64 and riscv DTS
> - Removed sg200x link in commit messages
> - Added missing change to v3 and removed link from v2
> 
> v3: https://lore.kernel.org/sophgo/20251029001052.36774-1-josh.milas@gmail.com/
> - Added sg2000 interrupt controller and timer to documentation
> - Added sg2000.dtsi for RISCV and moved DTS over to use it
> - remove devices from DTS's to match what is available in the
>   default pinmux config. spi0-2, i2c0-3, uart1-4
> - Added i2c4 and spi3 aliases
> - Removed milkv,duo-s from sophgo,cv1812h in documentation
> 
> v2: https://lore.kernel.org/sophgo/20251011014811.28521-1-josh.milas@gmail.com/
> - Made new entry in docs to avoid DTC error
> - "Milk-V DuoS" -> "Milk-V Duo S"
> - Sorting of aliases
> - Added uart*, emmc, mdio, gmac0, i2c*, spi*, dmac, saradc
>   to device tree matching what is available on the pinout
> - Removal of 'no-mmc' and 'no-sdio' for sdhci0 as it works without
> - Added riscv device tree
> 
> v1: https://lore.kernel.org/sophgo/20250927173619.89768-1-josh.milas@gmail.com/
> 
> Link: https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/ [1]
> 
> Joshua Milas (5):
>   dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
>   arm64: dts: sophgo: add initial Milk-V Duo S board support
>   dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
>   riscv64: dts: sophgo: add SG2000 dtsi
>   riscv64: dts: sophgo: add initial Milk-V Duo S board support
> 
>  .../sifive,plic-1.0.0.yaml                    |  1 +
>  .../bindings/soc/sophgo/sophgo.yaml           |  4 +
>  .../bindings/timer/sifive,clint.yaml          |  1 +
>  arch/arm64/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/sg2000.dtsi        | 53 ++++++++++++
>  8 files changed, 231 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi
> 
> 
> base-commit: 9aa6068586a9b4cd34cf04f8dee72a7283ab4ae4
> -- 
> 2.53.0
> 

You resend drop all the tags, always send a new version with
all tags applied in this case.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
