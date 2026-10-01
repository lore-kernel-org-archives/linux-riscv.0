Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3BBCA5FCF
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 16:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSuXibg/NF+r01OvNIxQQTkxxL8uKAjSNjkQriF4hU0=; b=HZOcZyPbb6Ysvt
	Il3yzztOVHKC7VVSEZ1k5q3XGn9wIfTAQW8WUUHw8XW6uSsyKYwRPlrKv7afiM06Ex5b/tcDgt/+T
	L3Zx2MFQ5OxkGAo1tmIh8NTmQNknLptn0skCf2VVkbb7R59lK+f4H+x+QX0LE5otmPy8XuiRshAel
	DJay7Fd5VYpiaT4Yt5dxDlRQ3i0GCXH9r7T/h9pVfHt3c9Bbpw7lj+88qtMQtZ/ZkIWXpS1ctyfUS
	G3PikUm1pb/xvZjz+3BJYd/8MfuHm7rf96Ebzd0GaE2xb6YBowLwcbeH5L400gzGFbgapKqJv1c8L
	I4yiMyjIxxwkFdudSlKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJy1-00000009lu4-1QBM;
	Thu, 01 Oct 2026 16:49:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJxz-00000009ltl-2PDB
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 16:49:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 091166021D;
	Thu,  1 Oct 2026 16:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767851F00898;
	Thu,  1 Oct 2026 16:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790873346;
	bh=GLOsEiOcPOwu3tKOoAo8L8EDZt9SBH1wAKk2F8CTFEo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eOB/kesqHLJRSdE609agTLKKGnMa7Ih0at/KhR2ZNy2nW5EJX/Wk0TwbYy7ukJRC5
	 0wQCqcfOdpMux40JHu73U5qpjVCXcwDmvV38e5w0NVlvuphhwM4GM+2JejXQ+6wiSu
	 O87GeBFD5cTighRCytgl4ZfxsUQZKUkhi4dgLb8xCzKfDH0KRg8vqjiNg31O9ZQEa0
	 XCGDwgAXpRbLm3TWBUL0NM9D9/IZJy0y9VUfXk1tFMyWUsJcYZQyq/QU+ba33OX2R0
	 pMAcJi5Aby3zUAARnI4Q80vzmjJyirB6OzbNn0n1BLtyV0AfgPQYWOnjKxbKXrfDeR
	 Z7NeRTdn+nd0Q==
From: Mark Brown <broonie@kernel.org>
To: Longbin Li <looong.bin@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Han Gao <gaohan@iscas.ac.cn>
Cc: Han Gao <rabenda.cn@gmail.com>, Hangfan Li <lihangfan@iscas.ac.cn>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org
In-Reply-To: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
References: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
Subject: Re: (subset) [PATCH v2 0/4] spi: sophgo: Fix SPI NOR errors and
 clock limits
Message-Id: <179087050674.90966.6118735285003982694.b4-ty@b4>
Date: Thu, 01 Oct 2026 17:01:46 +0100
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yi/iOdB3XkeKJG4NywuSBty4SjiQPj4PbgkDK2mpvFM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqvo788QZjKL23ksoySCouh5gJZmYiqbz6jZtdu
 ozueBDU8qSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCar6O/AAKCRAk1otyXVSH
 0GxxB/9Wup5wcUaF+oupk4Z0bZHrFp+CXB+s6cyynLtA1FATbYaKy9AW9Umn2LTq5tnhzsV9uLh
 PXKst0WcQJswkkRqg0ZCiFtok4Pori0LnaCQvR4ZJ2jUsptfrDskBdbhYQOYkayZw1B99gniw4z
 V5R63ephcglhYWnChADM6EQkMOnCFwU9bre3K+TNplH/0xlh20/4NsN5Tcx/FB40C8eXQiJB3rH
 OozsbkSBDPaMZKhSgFLHRFlVOEuA5iE7VcdRUSeFyWnIVNB7I0etj5+BxElBLXiDPST5z7x5KQG
 9kG2Cgh3FbYn1NcUMk5VzEJBeAOJGt4e0wznLitAauuwqr3S
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Thu, 01 Oct 2026 02:22:49 +0800, Han Gao wrote:
> spi: sophgo: Fix SPI NOR errors and clock limits
> 
> The SG204x SPI NOR driver ignores transfer errors and clock limits.
> Fix both, enable SPI NOR on SRD3-10, and use 12.5 MHz on SRD3-10 and
> SG2042 to match EDK2 and the vendor kernel, respectively.
> 
> Tested on SRD3-12 at 12.5 MHz: both flashes identify correctly, SFDP
> reads succeed, and two full 64 MiB reads per flash match.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/4] spi: sg2044-nor: Return transfer errors
      https://git.kernel.org/broonie/spi/c/53cdc4266b93
[2/4] spi: sg2044-nor: Honor SPI clock limits
      https://git.kernel.org/broonie/spi/c/ed400c241b3c

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
