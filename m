Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FBBCA1017
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 02:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tCa1rW+pMD+JE58wYexOa+pUhHFEk4nAm4FeNN6G9f8=; b=iVMzPCl7XmFDF9
	dHmigH3Sya5GCalGvuMX7gt8I5lMxbFEahEB6Qor+deXRi3mk/UdXV0KVRBAQdHVr04rLyhebyD9i
	ee4I71tzY6vdO3GlyNvHBlEdts29si0Cmk29wANbwgRnBXYw/bocuN41gVapbhq1V2v3MaoccYelE
	afKgWyq4WO4tlwZZxAeFyYui2MFXi6Qk9tjVIFM8rYSUFig2N0CHUtUIpR1+FCel8rQmUPxk/PAhQ
	HpC4TaCnyrrsBbQzGYaAkcF6lYgWxqjbhORmGEZONgDgDxaZ/CWHkuCNkl7TcECPBaQPGKsM9SAmv
	Ofqfw3sMYoGAyCmFcCOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzSQ-00000008I71-1F2e;
	Thu, 04 Sep 2025 02:12:14 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utyDQ-000000081TR-0ekU
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 00:52:41 +0000
Received: from ofsar (unknown [116.232.18.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2567C335D31;
	Thu, 04 Sep 2025 00:52:32 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: uart: remove sec_uart1 device node
Date: Thu,  4 Sep 2025 08:52:24 +0800
Message-ID: <175694709379.32917.16100695238119707451.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902-02-k1-uart-clock-v2-1-f146918d44f6@gentoo.org>
References: <20250902-02-k1-uart-clock-v2-1-f146918d44f6@gentoo.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_175240_220094_79B4B52B 
X-CRM114-Status: UNSURE (   7.22  )
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


On Tue, 02 Sep 2025 20:26:58 +0800, Yixun Lan wrote:
> sec_uart1 is not available from Linux, and no clock is implemented in
> CCF framework, thus 'make dtbs_check' will pop up this warning message:
> 
>   serial@f0612000: 'clock-names' is a required property
> 
> Removing the node from device tree to silence the DT check warning.
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: uart: remove sec_uart1 device node
      https://github.com/spacemit-com/linux/commit/0f084b221e2c5ba16eca85b3d2497f9486bd0329

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
