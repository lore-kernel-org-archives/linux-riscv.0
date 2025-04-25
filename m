Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E7DC369D3
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 19:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1j1vH3hfq9Fh3ist5mt+qijFJK+u/atXdNQqj90mm0w=; b=M6zkVHWVwHiq7U
	7bJcb8ohbP3O1ZM1+75syvzcjUCo2TISJqMYO7RI9iu7ycFF/W7BRdGKvIVRv6+zvwHWRaJcy2yb2
	sZjwoGcX3bpvyQIpZFogNpWA1M4md0SpqHzTI9pd45Lpt1Es/eJMbDzbbDGbQKvTj5M+hApRYLoPd
	HZRssrgWjG29MaiLi+Ne5+YoGUh0muVAwzOt0HuOIZnPX0eijd7iCzeChjVl2NePlr4RCmEPvS4QR
	MIfbO/sbusvEX3k5QA8+Va2A4UqFjvIi3RL2YgJzOZCEyE6KwMk+YsPmfa3n14ERAIFa25E7ZB9Mz
	h3G0D3FjGhYtosnKS9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OSu-00000000cTF-3LDm;
	Fri, 25 Apr 2025 19:12:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OQu-00000000c52-0Vko
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 19:09:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7BFE0A4D475;
	Fri, 25 Apr 2025 19:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15A8C4CEE4;
	Fri, 25 Apr 2025 19:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745608195;
	bh=ZwjGs58fIGmmPZzgrAaZeb8UcZDv+QdIHiBKPllDCsw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ISyIsbyZaYi/x7N0b5j9Aw0ZpEeJri7HmLK2FOLnlE3M5t/E+2wnd+fCpHrusVfDD
	 iZExre0JRBFngC1WiakfeOPjjahWJlWuPZE/aT+dKg+kOVUayozatDAhGK2JdN7RN4
	 Gl0dZtJvRCQXi9d8Fb+fWVSDyaZvcTtFNAA5wUGCC9uCoHBTeaoBsDoqdx7Ijh1JLo
	 g/hbIRtVhIwG3bUeuRgPvVKtnCI2w0uTbyVuDwAxqXyb9YaBxYWCqaKqAqzcjOrmhw
	 q5nyswMGCCv1lPltP1nVnQC4RprI6fHDbYUFYQ/T8QJ4tRitQkHiwc1YV4+Td9BOJS
	 3Tyfer/QBSrJw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Inochi Amaoto <inochiama@gmail.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org
In-Reply-To: <20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com>
References: <20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com>
Subject: Re: (subset) [PATCH v4 0/2] Add basic SPI support for SG2042 SoC
Message-Id: <174560819152.249436.5095077877581819518.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 20:09:51 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_120956_227276_B6FEB675 
X-CRM114-Status: GOOD (  11.76  )
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

On Mon, 07 Apr 2025 14:35:11 +0800, Zixian Zeng wrote:
> Implemented basic SPI support for SG2042 SoC[1] using
> the upstreamed Synopsys DW-SPI IP.
> 
> This is tested on milkv-pioneer board on bus level. Using
> driver/spi/spidev.c for creating virtual /dev/spidevX.Y and
> tools/spi/spidev_test for testing functionality.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: dt-bindings: snps,dw-apb-ssi: Add compatible for SOPHGO SG2042 SoC
      commit: 0889c4d28ad79b55ee8cf3c818e9d86203ace8f0

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
