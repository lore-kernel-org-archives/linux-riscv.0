Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89ECC25B75
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 20:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=AiFrejqVJN481Ozj0Q3Dcqv7ztPDWOYUZuEr9+MNYmA=; b=BVvgYUwOyu+qXI
	c+FahqrTYRJKbxTPhywY79A3m55GUunENTs3QNoirNBNR7MQxADlE0FaNcTEhfRTl3poP1/Aj+/Wx
	klDSPuaKYIV04vIxwLIwuCeNgUsMAYfmeW/qTbTJ/Te13HmhykvrkJX6CGSJXjdcbGOTvQqS9Hk2+
	aCIqc2FZ47X5fRN8Oh6bB2KtMcFmB2uh6yVXTIfK9uCkmmQqor2KwZRHpPpYNDOgk9T1emtO/dl21
	kqwLQHY3mFXOmFvrtgwbl0zYrPwDjLD0YsVYsIsEYKul3cQ//COp/f0oyyOdCp2f/tl8kIBLdu5Fl
	+/wAxXF3u04nny8sHD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9WKJ-000000012ZV-2uFp;
	Tue, 21 May 2024 20:43:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9WKG-000000012Yn-16s2
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 20:43:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2001761792;
	Tue, 21 May 2024 20:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834E9C2BD11;
	Tue, 21 May 2024 20:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716324188;
	bh=u0/sWcPwXuz9mgx00NMaeZhDHXqwGJKGbChwT6UjuG4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Li6hJMQbTrMgHsg42pYS8smfFsSbtFfS9jgMyV9jthdaRQnxkJn434yZjyLek+Aeh
	 uA4w8YkD2zsjydT71t3hxPM8joM4bSLO0P783vytA3+yvJ6LE4cCq/qYTqcYJRTiKj
	 FWlD+RipLYy/nfIMomXqoCUqdcwkxKBQkVSr2lr4NHA/NH5A2VgfpIdevXE/lyWpZR
	 xPCBr9P/uNlmR1aV4mnV6WwC20ULoQzcCkKT4D4nr0ysBsvYE7YMvTA7DJwgRUvQ6k
	 LIaSXIsplmceTaUMeVY2FvhtjixK9xm95WZWuMCynMyV56nP6EwVeJpbv2rDlL/40F
	 Y3PHOmHg8dyjg==
Date: Tue, 21 May 2024 15:43:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v16 19/22] dt-bindings: PCI: Add StarFive JH7110 PCIe
 controller
Message-ID: <20240521204306.GA48525@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328091835.14797-20-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_134312_509761_31B2C628 
X-CRM114-Status: UNSURE (   6.10  )
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

On Thu, Mar 28, 2024 at 05:18:32PM +0800, Minda Chen wrote:
> Add StarFive JH7110 SoC PCIe controller dt-bindings. JH7110 using PLDA
> XpressRICH PCIe host controller IP.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

This really should have a Signed-off-by or an Acked-by from Kevin.

> +PCIE DRIVER FOR STARFIVE JH71x0
> +M:	Kevin Xie <kevin.xie@starfivetech.com>
> +L:	linux-pci@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
