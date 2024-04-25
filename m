Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8268C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 16:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXX6cjxsFrMPGIKLhSoPapKWyEuTcUOirEJA0m32/zg=; b=l15kEpzH0pLkGf
	5oGIQfMKfcRLeCbcSbsdhTb6XhV0VYbQf3vKMiGq/6JLpo7iBKYXpL5zGkaTfot/IsPc+ilz2EpI6
	ifDcdWL4hmUjuYHw+q7h/DYXwR/1QlhsBHeNaVw/4nYpso3PvJRMMdQduEVNoMKxn0tgPkSymKVQG
	kXWPNtfwPasjiqXW4T1yIHJjQJiRhOJDEQLTJRGKI703kN6jVlR3rlhaopknH1lJdISCGO8RtgqXd
	rdy+Soef0l+oTdH5LpZC+SNTHd8BTyT3yamWtmVKJEQDVWaxNO6GcdDFRqhm6A93mor21QOP4STH5
	SqqSz2dkw9vvdSEYm7GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s026x-00000009PaJ-1LfT;
	Thu, 25 Apr 2024 16:38:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s026u-00000009PZM-1vJH
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 16:38:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8A14BCE19B1;
	Thu, 25 Apr 2024 16:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB88C113CC;
	Thu, 25 Apr 2024 16:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714063089;
	bh=Hr42VLVkDSczruHp17DxXitKoNznJEPjrm7oGuJmEA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OlKxe4EIHto/OHkpLtJHEIlErhfZL/nM6DCLpK/HCQdsvhJzEQRKyrcivpIL3EjeA
	 oZstCNFKKheT830H7KGKTXNqWAppl/AMr9Uo2aT4MlQhJA7nFF8HnirqJ1ujKrZOoa
	 UvSWrND5rG+r6S0LteWJn/KRd+ZTTmnrF5bt7wVBTABymal1tSoHv6sIOXVg1p/Io7
	 bMh4kO1cY/rVEnfO+teZ4qau2dIXfx1vxygOS6YI3ZYIzDgI4Fjs9eI10z4iv1Yq8+
	 VMarle5m3SnA6eN0tRlMz4t28OHNqpDAAU9TtiHZMVh35s6S/A1MK1VlniO5Bsq2Mg
	 jaKz6iwm6x0JA==
From: Conor Dooley <conor@kernel.org>
To: jszhang@kernel.org,
	guoren@kernel.org,
	wefu@redhat.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	miquel.raynal@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: Re: (subset) [PATCH 0/4] Add I2C support on TH1520
Date: Thu, 25 Apr 2024 17:37:36 +0100
Message-ID: <20240425-amplify-fedora-7a632dfddf62@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=801; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=bJxc87ZNEk362nkKg2nRaOFgtTkAl1SGbkD4frpyflQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlabedYs18IXejeeysgQ2bLY72N9iyXeqdyt/zSM3JPY bD8ufFJRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZiMpuRoSn+UliF38sVDzZL 3ztTf/TZvclJqvszzzyN0jpkr370/xRGho8GOf5Gz2bJO6xgybG9KrBnvYB1Q39Q7Y7ZTTf+BH1 N4gcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_093812_717904_00BF0FDF 
X-CRM114-Status: GOOD (  12.26  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 25 Apr 2024 10:21:31 +0200, Thomas Bonnefille wrote:
> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> and a default configuration for the BeagleV-Ahead. It appears that the
> TH1520 I2C is already supported in the upstream kernel through the
> Synopsis Designware I2C adapter driver.
> As there is no clock driver for this board as of today, this patch
> series uses a fixed-clock named i2c_ic_clk.
> There is also no pinctrl driver yet so pinmux must be handled manually
> for now.
> It also fixes the order of the nodes in the device tree to comply with
> device-tree coding-style.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[2/4] riscv: boot: dts: thead: Fix node ordering in TH1520 device tree
      (no commit info)

I removed the "boot:" so b4 is probably confused.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
