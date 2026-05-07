Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07783CD343F
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 19:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hem6piUucRN3DU1ZDNjS8lO1a7A63yRX90aDPe9eozU=; b=xu+Y45CLVzh0VH
	VpP0hMl1MxyDhj2hCAsN7gs3ibKAfpyC4hPDi2MqEeWadRxX/tLvyOVLKF++FIZC4jVlT/Uw+BcUF
	5tSI6ofMzHs6WtNZ0jqyXSQUz+scAXAyjjovf2lCEwq47uI3MJWZKGtxmQWk7i2q3D7GwgH5HTUQ3
	FprlwO2lVr3Sh/XnxJipT+clpxtGFsTXLVhFb0pPJnozY/GVJ7oVdDPRtok1L9RtVDn/z0kOWdXrN
	2IbIMarq0bhCtC1K+vJE+10yaIJwMVTHKMffSzl8rzQZNubhnathGXnGh65fB49wKhb5cZdb5tTtm
	5q9P18dIEQIGtvKPGmBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL47A-00000004fbO-1TrX;
	Thu, 07 May 2026 19:10:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL478-00000004fan-0RB1
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 19:10:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E8AC4065E;
	Thu,  7 May 2026 19:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10866C2BCB2;
	Thu,  7 May 2026 19:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778181025;
	bh=92a47Yrm0EFCck+SA8MtVTLouVrXOvrFH0ZlXbIjit8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4DKPYLmJ/jQ7aliCUbzhR1JVZz0l5rcfAXa/RsvG9Vd3hO6HNV6eOFqYyqx7NNkE
	 InypQbEUJPkOeu/Ls3p56nDrHiCMX5qUFVavSMAxkZ767pgSnG8vk1K1gK838IIjUg
	 gy7Z/O8GezNjsS10VZAwyJXF/6/6bpR26G9VsPzFRwwvhbMwo7J8TBOzlh1jzrskIw
	 AiMg3DPmNQwippJdQ0PaKwQUo73ZyJeNgPRgubQA0Ggz+n32YG5LM44IfGh9yIyDYS
	 fgogalTyZsKSebJDe0p4rFK3Q9bXXuGJvKsNcuCKur+ePGF5q2MD3k/YED708PdPkD
	 a7MD6ORoL3z7A==
Date: Thu, 7 May 2026 14:10:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@gentoo.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, Alex Elder <elder@riscstar.com>,
	linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Yixun Lan <dlan@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	spacemit@lists.linux.dev, Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for
 msi handle check
Message-ID: <177818102236.2282368.7598186704669849987.robh@kernel.org>
References: <20260502101319.2364052-1-inochiama@gmail.com>
 <20260502101319.2364052-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260502101319.2364052-4-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_121026_162885_3E75E7C3 
X-CRM114-Status: UNSURE (   9.48  )
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


On Sat, 02 May 2026 18:13:16 +0800, Inochi Amaoto wrote:
> The IMSIC device on RISC-V based system does not require ID
> remapping for MSI. So this device only needs "msi-parent"
> property for IMSIC-based SoC, and the "msi-map" is not a
> necessary property.
> 
> Add new condition for msi handling on IMSIC based SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
