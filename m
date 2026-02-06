Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB03EE6B59
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 20:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+vODS98KnprP34D/NKcN+yoeOPEuBNGGAeMXPwBce4=; b=S7dUPRnOvCZiGg
	yK5M8NDi4MMeNuoYs+BQJOD4/O3yx8y0cCfOskF3IZ8PVT2+3o9FAtcKfmOIAJjr/dlKH4+gd1Ttm
	+v6Sfp4LX4R1sphNxLJzGd0NnnFrRfnoovLbVQgEX/opCTRzurfz8Ge6n6h+2YvraY/iqQFsTgLxH
	8PNnmk9gyZ1ZOTXW4fqEZP0oipAExhlrZRXjKtI92kKIH6ht+T1Wd0CWEmCmY6Wqra1BnVm26A1RF
	Sg+lfnCqKAdVt9M2/qXEDvWDsIslOus4W2E58uxi7kbp3Hv+IRoPxKkhsDZ18aSNbI1eB6fUBd5Qb
	oH7oBeqFsQUV5IbmwJ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSRm-0000000BnlD-2ltp;
	Fri, 06 Feb 2026 20:28:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSRl-0000000Bnl2-2dPP
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 20:28:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A79FE600CB;
	Fri,  6 Feb 2026 20:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77B9C116C6;
	Fri,  6 Feb 2026 20:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770409736;
	bh=IWMNQ0nvchF9bSXAiZh461lavyZch99AB7QvnoZmVzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jgTW6vSeAwtpx8xYVrWFvpJODPjzC0s4jufNPVRGoVAMO6f4VSxK/+UkYy1Atz64g
	 FWiIZIvBJCrITM59J1fDc2FBiidJ5uHi+ehqy7HFtMCqnBvD9vF5NFDvRUQou8/lzJ
	 9HJEytq14PmcKm2cRb0tLwszq+yqYcCe48QuFG8p1jhG2AQYs1Mpr4O5kNFXHhVD0M
	 xhiBlI1JvRd1r2uypLydKdWgCbUDy+0HqMRPOrOvPYhI2GS8xjFKapcrLq1wbEKIh4
	 l+0jNxu+ceyTpRMcBnRYT6+sq1hj89yzMw3QGZw1pDaWK1TbVNTquguFj/ZHVDfsc8
	 ZcsL3EtmMn8dw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: microchip: add can resets to mpfs
Date: Fri,  6 Feb 2026 20:28:44 +0000
Message-ID: <20260206-reoccupy-debrief-88ea7343b1f2@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260128-nacho-craziness-45a3e575ba7c@spud>
References: <20260128-nacho-craziness-45a3e575ba7c@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=589; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=yJCyab6NNWshX7GEu++YjDOhK33LES0wRUPrdusBBJo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJltfn+3tap4VdzwvXyA+9N9x5s9c/ay/ZylwWRdmpVZb mXkv0mpo5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABOJkWX4H+T1KETmh2bOX02N +sMHJKy870TmC/NvWfShZu/2R0+8+BkZHldbvS7z++Ly7nzgScYjz39Oyam79LYkSbdc9O7S+yc u8wEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

On Wed, 28 Jan 2026 20:50:33 +0000, Conor Dooley wrote:
> The can IP on PolarFire SoC requires the use of the blocks reset
> during normal operation, and the property is therefore required by the
> binding, causing a warning on the m100pfsevp board where it is default
> enabled:
> mpfs-m100pfsevp.dtb: can@2010c000 (microchip,mpfs-can): 'resets' is a required property
> Add the reset to both can nodes.
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[1/1] riscv: dts: microchip: add can resets to mpfs
      https://git.kernel.org/conor/c/ff4b6bf7eef4

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
