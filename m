Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD71DCD3440
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 18:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=geVsXOSTwLuY9fkmxFTdG2vUw46B1qclbrMJNQoG4+8=; b=oCiVoQ+vz4ulrc
	+nXCL7bUjl/I6loWcuAIyL8gy2U0Mh/UaU835fhF23cw7eUlQGmw4uIqm1E78L3vDVuypv6v4ie0n
	Ksz/ir+Iv3Z9JvrlnT1XVnX5HrYJFkH6ae98/VTiqfCN6FVZu/GHKAqfUvjepXSxKfFDJVqCDcK/1
	67hNkYWGcehTfwWTPAnATNdf4iBAnJZDEx+cgzJ5kU8lFeBe5RQQnAyq5sGoxOVXmhu7xckkA0FnR
	iybdQQ1P0DxIODBXDNJ1jFqCtztw/zclDCz864vp5q8rnCwOUM6JZ2RbfxrJNLDdECadstBgalXdy
	b5PbidPBlGwZk/sXKfsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJG1m-00000009ON7-0M02;
	Wed, 12 Nov 2025 18:57:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJG1k-00000009OMz-2Zcg
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 18:57:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 884FD601AF;
	Wed, 12 Nov 2025 18:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458CAC16AAE;
	Wed, 12 Nov 2025 18:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762973797;
	bh=wnhEjBehMvH+VcTKME6K3P5TFtwHDoZ1sl5SUn95RW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=srnaOMbMhtXpMh0YneM2DfkFDH+Lx13tpS+EcJAmlFp2fwuGJGV9FS5Avhee2oZVG
	 0H2MW4ubKyxNwMZizzrkoecvpHnFVhcd1dvIVqkkaO5AFBG4Iu0eKCdA8rPrgmisln
	 br6RKTVOKvo2yCfUBK4a9mTUKimw7R0RrBPUZl++Na3MPo/LWSOevAWtAlQ1ws60IC
	 0ZeoyoGmZbDGpgQderwSS9ILifWnuQMhFRy6hlmT1GdasuSYWtGu+d1jkr5BQOJ98a
	 nwj6RcQleIQ0vVazB4LcROCnt47uek29cKIhfdiscP6X5FqNvAJuh45/KT9QKzagMC
	 l+dRBGK6Kaqqg==
From: Conor Dooley <conor@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org,
	dlan@gentoo.org,
	pjw@kernel.org,
	Alex Elder <elder@riscstar.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Frank.li@nxp.com,
	p.zabel@pengutronix.de,
	guodong@riscstar.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	apatel@ventanamicro.com,
	joel@jms.id.au,
	geert+renesas@glider.be,
	cyy@cyyself.name,
	heylenay@4d2.org,
	fustini@kernel.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/9] spi: enable the SpacemiT K1 SoC QSPI
Date: Wed, 12 Nov 2025 18:56:13 +0000
Message-ID: <20251112-approve-cartload-5a3f3d017c2d@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=667; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=QYu7vucndkkkm6zIRBflLJq+QN7l+LYv149tZnZO9JA=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkiN3zNru+5vrOwp/Rz57QPF0siN74LWmjWFmwkmrJlT WXT0jO7O0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRxncM/504dq80vna35Mah qosqqxYf60yNrpxfZs84sf6GrdT7BccYGa6wCbqpJJyfnZ0nOVHhGMfynQ7/ZfOmzTxl+GeiyLY ZiWwA
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

On Mon, 27 Oct 2025 08:29:58 -0500, Alex Elder wrote:
> This series adds support for the SpacemiT K1 SoC QSPI.  This IP is
> generally compatible with the Freescale QSPI driver, requiring three
> minor changes to enable it to be supported.  The changes are:
>   - Adding support for optional resets
>   - Having the clock *not* be disabled when changing its rate
>   - Allowing the size of storage blocks written to flash chips
>     to be set to something different from the AHB buffer size
> 
> [...]

Applied to riscv-config-for-next, thanks!

[9/9] riscv: defconfig: enable SPI_FSL_QUADSPI as a module
      (no commit info)

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
