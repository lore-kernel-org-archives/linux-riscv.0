Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0EBD1951A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 22:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRSjoRJPk+t3XRxHqwRzzu3VvHYfkbdtib99omDtrhk=; b=q/sA69UBJQsGI8
	9++NxeH5pPMsq21bp6X66M7FEMc8fHlNknsly0oe2jXjBLTwJcI2dgHaqqcQPHqDFIasK5YN0ehfO
	Sjpnh65cloFwfHcX3LeiLLwMypa33h7egAcwLL+O526AspHNmw7oxiyoCSoqkCdFnWf46K0mUpQRC
	BTEq1rTXazvMsfkM3P3x2J6xYiNsOa6TojYyh8F7JHydGrr/PwX7kSZeG1zsppst+jrIg3uTP5ClW
	q03N6MOj7eXT2ssD+bzcMZMeZGUx1hjbqz93yHxq4cXufXUnrHFd79dodJrpAQYRPbQGdrEkaZlTR
	fHBUU2NPoxiIbr5O7rKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkUmy-0000000DIZ0-1jPR;
	Mon, 26 Jan 2026 22:10:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkUmw-0000000DIYu-14GT
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 22:10:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 495F960129;
	Mon, 26 Jan 2026 22:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64C9C116C6;
	Mon, 26 Jan 2026 22:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769465425;
	bh=e+VY0YiRm9WdQtrKQ6RfFsmWCSJBN/5QaCkWJ9Ungeo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YTzAxIhk/pSa4n+8h0Gf3q+yExDMsiza3pkly3tahdJJHRSJd35Q5TYaFXlAM1CXY
	 OTjU8wgz9qT5K9cWqLgJ1uUQNdbe/RBLE+AYBFRGmhBCFqwBgkqyrpidQYaxLofW1y
	 +wTgXTx6PDWZSYkHsp95py0UlAMwejEaEAu0pLKb3LKbXAoJjd3GUZ9cWXKlqCXziO
	 ih2kDfXP5UKpLS7HjiyjaZxADKmMSPpZ6+XK17taEH0M61guoBpIxs3MBvs4FLv50l
	 qYi4Xjvb4ocp2Py7dmdxfCAG61NW+6ENPQVpTjNm8NL1DW2XlMYkZe02S6Zmarpk3X
	 vfJDnvk8MylJw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
Subject: Re: (subset) [PATCH 0/4] regulator: spacemit-p1: Fix voltage
 ranges and support board power tree
Message-Id: <176946542165.977042.9433935491443420344.b4-ty@kernel.org>
Date: Mon, 26 Jan 2026 22:10:21 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-47773
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

On Thu, 22 Jan 2026 17:43:41 +0800, Guodong Xu wrote:
> This series fixes hardware voltage constraints and enables flexible power
> tree configurations for the SpacemiT P1 PMIC.
> 
> Patch 1, n_voltages is corrected to match hardware register widths, as the
> previous values prevented regulators from reaching higher operational
> voltages (e.g., 3.3V on LDOs).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/4] regulator: spacemit-p1: Fix n_voltages for BUCK and LDO regulators
      commit: 41399c5d476156635c9a58de870d39318e22fa09

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
