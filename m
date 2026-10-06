Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02D6CA5FF1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPq2whh8ZFlB57QZOyqfdpuZa04iqUG3ra6Xw5DSV50=; b=GQ4xh7bN+r/DHD
	aBo9uMSUSg32EzKBj2Ahp9XxOpPcOwg80SAMPhFcK7nyL9OAYkmYQ+V8VpgZHmx7W9DYtIUuvKbH0
	vL2GaVkBAiaMgWbNdW/d0bwA232NoPI2abbPyh72GEuUWBmhU2G7z+M/+GIyO/Z3jyvvvS/zOJTp8
	FV4dSackdiREs9CU0sjgcMLpADdxmwZrcVvHbbbeH5TDgqikeALVIAIxPMtxrGDcQAPunsvMJg/k7
	+DKgeReRPaZ6M2L5xSrCRKNdyFzuU/2hb5T6Z4u4EV8J8/Yqh6oHDzq93WuTnNPMrgRXWLhk6RieQ
	hO5LG39kcuxD6jKng22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOp9-0000000298h-2Gi6;
	Wed, 07 Oct 2026 10:24:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOp8-0000000298Z-0pBy
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 10:24:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 91C7E40382;
	Wed,  7 Oct 2026 10:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BC51F0089B;
	Wed,  7 Oct 2026 10:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368673;
	bh=zdYe2D6chXvlDaJVb5tlwXlpbruGgP4j/PB8i82Kf8M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FtGVkbSqcEuCz/NHSSjSZ8f4oljiHsENsgz/teZk2RuyfYA9m/XWOiBKFSTyphI/f
	 PpSX7iYcRQZL6P8CMB6UEX4sP9hQXT0TmmCPGYbF3PH0eOGftylGJp8FNSDEevKuqp
	 THuGRpWjl+ylAo1GJFCZgRXNxe+OzVvyQyxQSmw3Kdul8UMA+eTzCL30T2sr7WwdHw
	 Vup3yv6M+NFlnRyv8ALfpLGOj6ANg43432txqou5R5RqC5r7Av9HVgo1C0QUfy8WCu
	 anWIw0bJJGKDoou8oqX0qKQsd2OMNRBCGBI4qgq/A3ZpTdm6p+wW9r1vKmP72ST22u
	 NG8gzmGQsJ7eg==
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
Message-Id: <179130039767.150114.10264955140068414892.b4-ty@b4>
Date: Tue, 06 Oct 2026 17:26:37 +0200
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tYpBL8cG5ilEl+roYSBzSHLf8sKpg443uZP/TQBz75Q=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGrGHdiiq/TUIgTxS5iCu9BoDZ8udLu6sPh/nK+Kq2r2A2+Lm
 4kBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqxh3YAAoJECTWi3JdVIfQy0kH/R1J
 WcuREDBp3ez1gOETtIH2PrnUwQBavArxeY5NbfzhLWRM3IPODrTlxZY7HXNU4e5vM9zA6dSVi03
 MN8Yap6QGDBkILAxZaXkfeZuP1LuWKq0YdLBUWGxf2lsCy0Uk4qunc6VXekXp4WWhPGWUJrEA3n
 3HzwZv3JfQA1umUDNuVz3fKm/3ZXy1gGgUqfHX0FdtuWQXV3PQ5x8SOx+9YTOTpF/egMbRI325N
 fQkAEs3Mwl6r94Y61avf6asGyefV4+qU/iUeIs7+gqetzhdiOrgIqoduWzppBZaRfUgpnu+izWb
 e6mZQI9PqI2Qn9w+zSkqqe1e393ocpDjYkLAKWw=
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

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/4] spi: sg2044-nor: Return transfer errors
      https://git.kernel.org/broonie/spi/c/e130c54fbb60
[2/4] spi: sg2044-nor: Honor SPI clock limits
      https://git.kernel.org/broonie/spi/c/61d44a2c07b2

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
