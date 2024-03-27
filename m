Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7221BC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 17:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rQ92QsS1SIySc0lZgZPx1MePV5hPx6lfBKeOQfO8i0=; b=VCwN5nsb1ARJZk
	BbF4QaQKBLdq7g0rGbVnN8ZcBA1Zn2DehcZtJytK2cTPCJvqaPr0+leU0vqX3T1AG+qKxvoc93c0S
	NSSyaQG+MK1xWAhLoX6J6qX3nBTUEMIjcr6Jgd8RpKB9AtI0am6qFuhWWZi/LzdG01y/4wYiTF0S0
	Qmnr2VaSV5iRNpHC9Lv0KikLEoCDGUTSf5XjVu6vOSJxgFNDqsuPTu8dtCv7OthPr8fppEu367vOJ
	6w8Tw3DiuChvAGr+a8hBRjE5wJMDg9nZoDtZhlnTjsDG/8xGDcu8yUwKpBcz4HwS/0+UYe1/6aO8z
	NFAfe7l5GkwulvGopKhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXVc-0000000APad-0CUC;
	Wed, 27 Mar 2024 17:56:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXVY-0000000APZI-2tFw
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 17:56:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0AC2DCE25FD;
	Wed, 27 Mar 2024 17:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25EE3C433F1;
	Wed, 27 Mar 2024 17:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711562174;
	bh=CARL3VpskHXs1C8+zISBJy2R8u90IIDk7xSKp4/PB1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXRuPs6t0bSxHm22O6CNo4Kkp5D2JX3AjcxLSZ3kXyhEyi2UIsEmVFRTOhvpPRJ/7
	 fMifnYGT6ixKL6DBXsG0U2PJ4Hj/UO2OOa6DPA/PcFsWKaBhGl4HhWXjcG+X7IoWiy
	 yug3xt4/SqtnFsyzeJ3wM20n2mmj3ShbaIXs56YW/VaunkK2S6kfEsIpfgnvPI11zf
	 cgDJm1UrhuC0xNgmZeSTTXCEGUKKMjMOhHY4B/Hjc6muQYzGM8/xNViTMW/aoikhZX
	 liRX9UQur/rgHgHbECqiz232O331J34x5ppTuEgZ2oJmQq+0LNCQV+24WViVoJdyCm
	 9ySP9hnevpMLg==
Date: Wed, 27 Mar 2024 12:56:12 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Jamie Gibbons <jamie.gibbons@microchip.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v1 1/5] dt-bindings: riscv: microchip: document
 beaglev-fire
Message-ID: <171156217116.3705201.6521563645353809470.robh@kernel.org>
References: <20240327-parkway-dodgy-f0fe1fa20892@spud>
 <20240327-camper-brownnose-6392076d8699@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240327-camper-brownnose-6392076d8699@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_105617_277909_42D39989 
X-CRM114-Status: UNSURE (   8.38  )
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


On Wed, 27 Mar 2024 12:24:36 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The BeagleV Fire is a BeagleBone Black form-factor board with a
> PolarFire SoC.
> 
> Link: https://www.beagleboard.org/boards/beaglev-fire
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
