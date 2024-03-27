Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C932EC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 17:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNhggGAV3EMbbEDmm2hRpX8lgkjI6jzwglF6HY/3MSA=; b=FAuBVBb7z/4gvD
	AV8z2O6Iqv1HYMAoKDcxl8sQVgcACZ2xYX+fbloN914YjLSDi3qyhQTEXeO0/J8Y3iQT1AOQWMd0J
	dqyBHzPIz5snUi8zuGZ0t24VA6ahDG+05p2cHPZCb1wceSHljZ4e40ysH32w+B1A8GosUcoerAsEE
	PgiZDuiOPSlr+E8Pzyb9jZJS2MFft8UFE/izLiLmcyfLb8mTnTppuQ4ACad2RGbk2iQTUIJogDu4S
	EJGd/+Ln6oCPyzekcIPN0SrRSJPAQRslf/1dxqLtl0iUN3B9k+nxSl+dELL3MN4iiirRhMt4WJUi6
	Bq7eRPzkvYhvoiHOGzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXXK-0000000AQHq-32Xf;
	Wed, 27 Mar 2024 17:58:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXXG-0000000AQDJ-1xR7
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 17:58:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CAA8461173;
	Wed, 27 Mar 2024 17:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D69C433F1;
	Wed, 27 Mar 2024 17:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711562275;
	bh=wqbcn0ikIUK4mt6Aj/w6cUv86+OQtHDq6oRZyBl/18g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sg3uPchwAu0+XJyWLp74NaDVzYwP6Sha7kCsSnDpZvlc5y6mC59Vny+RkbE/5BDSf
	 yutWspT+aHvxerOkWmdV/ixX0gfY1ufGfl7VPyH1LhKCzyAkckw0U/3h4vpSjjoixV
	 Eyhy4pGLj/KTKDSlP5Ki9XQNiiU+LBWC6p96cBFILnikm5ZgcT3uUGsZzwTU21ZN0P
	 d+zzh3AYV1ber4npKkBcCu9HCUzBqc0JZG/52tOxAqSaYZ10ubM63l6WPcxtitBpRX
	 ytuuj0AsUAYFYbCEaagi0I0RfX1q5PEdqXg7IIq+leov9QAM6btvK1SKOxVaKAlXb4
	 0nr+u2bdHoMsw==
Date: Wed, 27 Mar 2024 12:57:53 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Jamie Gibbons <jamie.gibbons@microchip.com>,
	linux-pci@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Subject: Re: [PATCH v1 4/5] dt-bindings: PCI: microchip: increase number of
 items in ranges property
Message-ID: <171156227276.3707387.1415790916639704737.robh@kernel.org>
References: <20240327-parkway-dodgy-f0fe1fa20892@spud>
 <20240327-debunk-perky-f5514ca332be@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240327-debunk-perky-f5514ca332be@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_105802_929196_B2EB42B4 
X-CRM114-Status: GOOD (  10.54  )
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


On Wed, 27 Mar 2024 12:24:39 +0000, Conor Dooley wrote:
> From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> 
> Increase the number of items in the ranges property to allow up to 3
> ranges. For example a prefetchable range, a non-prefetchable range
> and an IO range, depending on configuration.
> 
> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
