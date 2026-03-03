Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDEFEDEBE6
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 19:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mazua0uD3UfVwXx63PkgyHuGnI3r0lxATujY70HRIMk=; b=wOY/5Y6Jjj0h1m
	XQv7QC0QL22gzjvZVILxV+FbHVuFiyNY915dPrwfUYgMgZamDgiPrNohtFHfLPtrTZWT3b3GNKWp2
	XI9nkat7Cy56oGN6EjjozNgAYBfx/LK7dH64kx1G5pWZgOF6t4LvyQanFpszMMMthdOYKgk7K5BDq
	0pswMnLAmubTq2dmUUDeI7R2lbCombnfPxQx48yxUAUhBXpk5zPdt4DnYFSiK0cli7xS0pT58A28D
	n4vmhc9Rf8uT380fyzyCqPAeST+/gnxx/2/nTn27+AdvTUVD7l+Vo9nBRnVHZ4BDRtInRgUkmllgK
	a/JtVsjVXecdr1a/2bsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVHg-0000000FmGc-0cRg;
	Tue, 03 Mar 2026 19:19:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVHd-0000000FmFy-3BmD
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 19:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 097EC439CC;
	Tue,  3 Mar 2026 19:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0D4C116C6;
	Tue,  3 Mar 2026 19:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772565592;
	bh=k0xMJMjHgddl5JPdpo4UCcyWrL6834EIgLwIJ5goCUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BrT8/m4WGbeQdQj6/Ca6gMAe5+VGadJqQuDgdGyiMx4Lsf0Vnm7L7fu0cxY+bnqmQ
	 VjgB42x0sj34cPZ2NhzFF6UdkiNO1r+3PWWglXqRUKihMCR46l/6Ro495eyUtuo00T
	 +icak+2Ar9vMiHPSNhfzA0oBPWl4umh++VZ+HGtnstQCqF4clV8BVuVSvfM7kTl8J/
	 lT+Hh2a1f9nE4rqIj+pdUaUlbxTgBvvnCxoniaS9WjuLqlW5LbBvxeIf3nGbo0HqQH
	 MXTUqJraJd4h8U5F3Qs6iXTvXbxGRnsjZ+uoSsuxUN3F54mEzM5kVatiqW2Pfb8e8M
	 Kpv1URpUTnVLA==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260303-deceiver-rack-82f2b89eac40@spud>
References: <20260303-deceiver-rack-82f2b89eac40@spud>
Subject: Re: [PATCH 1/2] spi: dt-bindings: mpfs-spi: permit resets
Message-Id: <177256559083.591579.3406513766690686799.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 19:19:50 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-6ac23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_111953_821073_515A1B2C 
X-CRM114-Status: GOOD (  12.98  )
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

On Tue, 03 Mar 2026 16:41:50 +0000, Conor Dooley wrote:
> CoreSPI, CoreQSPI and the hardened versions of them on mpfs and
> pic64gx have a reset pin. For the first two, usually this is wired to
> a common fabric reset not managed by software and for the latter two
> the platform firmware takes them out of reset on first-party boards
> (or those using modified versions of the vendor firmware), but not all
> boards may take this approach. Permit providing a reset in devicetree
> for Linux, or other devicetree-consuming software, to use.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: dt-bindings: mpfs-spi: permit resets
      commit: f5d09914d473059e4e851c6a3bfa9f0e848c63e4
[2/2] spi: dt-bindings: mpfs-spi: remove clock-names
      commit: 96f06d055ca03d1dfb5830fd07ff6eadbd66264c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
