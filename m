Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D04EFD213
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 19:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVVmuOYkNBfGKITY9obe0c4L2ragBoePlLWW3Vf6eQo=; b=bd1W6lRQjlCfUN
	9mflIvPJ9gE1j7Njh01Hhfe+1iTUL5iVc3GX3CqjCnrqZf+W2poocjOg7YHg/P0c560Ct9oX2dsG9
	b2rXOkaMeZGX4S/sbdUfYeHhtsMi7Gqg4L9d9jlXkdulvrRuuRjvXsoTczc+lucfqsdAiLiWkoupQ
	OqLNEzm4bgRYh+KXp4c/KTGpd3WzUhGyDIdgom1KwaDYz7NUDVUvSwxvMMBVUnea62NQfZqj90ie+
	zRUdCVndeRU39j/UeJ1TttQHKvaSULxH2cjEHIrB1brSNfdWeX1OzTVTnxVykMV7rdyNWzZ70g4jo
	mVZXATgB4dBiLJioZmHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKEH-00000004lhi-1Nxb;
	Wed, 25 Feb 2026 19:07:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKEF-00000004lha-3fOL
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 19:07:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E7F1360054;
	Wed, 25 Feb 2026 19:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63176C19421;
	Wed, 25 Feb 2026 19:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046442;
	bh=UGnc2yVLBjOJ5bDB3H1khNOj/8vIce5Y8Yoi+iCQMyU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lecPiPqchaN4Uyd5EMQC1EphznXv7RUrLbFWfSCDaTnuy5bNKLVw1euxrNWZo4fo0
	 pUDN8xo5d2A8fSuTZbtzcMyPFD7T4RWlWof1fKeQ1c7MX6LomD8sC8i+XErZtS0Gzz
	 1ded8xGVpVNFE2hf8czTOQ7cTGQ4RnWgZzlVwagBJex1vyv8xdYFzTSI28WH3yaJyU
	 SrpRS+vNekkwchbXAGGZHOelOZp2sqmGV2SwewmJVk9x2HLyWfrsxoOjW8POnpOKXE
	 4URsYbQYDQaf2roED1HX+Q1VGvSkS6Ek+J0hgsgv3lcu7xX5+1NUoAuMrAGyeO6lOG
	 7JDifDqd+SMwQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
References: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
Subject: Re: (subset) [PATCH v4 0/3] regulator: spacemit-p1: Support board
 power tree via DT properties
Message-Id: <177204643911.168523.3724548692200647978.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:07:19 +0000
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

On Fri, 06 Feb 2026 10:32:01 +0800, Guodong Xu wrote:
> The patch (Patch 1 in v1 and v2) fixing hardware voltage constraints was
> applied to regulator.git for-next, so is no longer part of this series.
> 
> Patch 1, 2 and 3 (previously 2-4) enable flexible power tree
> configurations for the SpacemiT P1 PMIC. Hardcoded supply assumptions
> are replaced with explicit devicetree properties. PMIC supply connections
> are board-design decisions. Moving this to DT allows supporting varied
> topologies without driver modifications.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] dt-bindings: mfd: spacemit,p1: Add individual regulator supply properties
      commit: 82ffa9610ba39d3628a9bec968ddc68fe2fe6612
[2/3] regulator: spacemit-p1: Update supply names
      commit: fbb4c52ccdcb4a612d2b7f800aa57090eeee16d7

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
