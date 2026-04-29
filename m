Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3A0FF8864
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 04:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wYat+9jyES3zPFO/nU4AoGX2nOlqBzwQvd0E+kkz9tg=; b=uSIOHUhapBWkRx
	XZthwQLBEwqZHQ7gY+phlRpX3u/8r5GRF7I7Gey/wlweaOSr9XhC/sSPsJHZpx5AsN9yinnf6LtA2
	nLUB9nVajhPmbapOJgBuIVr5AS6uKOSLLfzcmHwuUFJd4CjZN4fd+/4xxFqVo4dom4iGKWGRFZQk1
	4pr9BkLUlAxal7BFJkHBih+Ru3QyCBzO/iPWa8oO1vkihQwClKRZKEzi+YUsX4fQtzSYY7Z7dmk0d
	+H1qssZMkOOENnAE5CICTI1l/R7pWcXuq3CCTg2fRpFkWjaKAyQZ/wUEUXeuFCL4tPJ7QMTRO9WyV
	t6PPX3jzcCbU/HgOA8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwPc-00000002vOo-1yzO;
	Wed, 29 Apr 2026 04:20:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwPa-00000002vNu-2Pot
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 04:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C195B40DDB;
	Wed, 29 Apr 2026 04:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C08FC2BCB4;
	Wed, 29 Apr 2026 04:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777436433;
	bh=x3w6FaLWJ59do+8E7V5wI/XYBwr9jdmDBJqLxGxgp/g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WWkM5xmk4snhYtVCxVxuqp/1ufDyP2swk0YAh0lkvnvrq9HNQqIvN337FQfcrGENz
	 EGiALEORkkDuXGP5/QLGEdf+6mpR4Ki3UNR/tDm2irPcF/WUeULMvkSWPXW8IJMm4g
	 wvJtyDdNcOQ9bqauWjC0VJJB/Rn/0j3tSSkGWzEDrF5+zPevKyW9G2IeVHFTLuFcnt
	 3t6XgedTyn6nEZIh2ip/uz+cuDE/+fCazVcdJ1+AVkRw1fXOSeG3BhsCOjNeHdNYZn
	 uYxNjbS7MgacplQNBNi9JrEEgUgGRd1HRKpI36MrDs3YNcMcNagujFFzesoJ+hyUEY
	 oQBW3oWVCf1Kg==
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Cyril Jean <cyril.jean@microchip.com>, 
 Valentina.FernandezAlanis@microchip.com, linux-riscv@lists.infradead.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260428-surfboard-unhearing-96776be0495d@spud>
References: <20260428-surfboard-unhearing-96776be0495d@spud>
Subject: Re: [PATCH v2 0/2] microchip core-qspi cleanup
Message-Id: <177742876220.363516.73601840697698170.b4-ty@b4>
Date: Wed, 29 Apr 2026 11:12:42 +0900
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406; i=broonie@kernel.org;
 h=from:subject:message-id; bh=x3w6FaLWJ59do+8E7V5wI/XYBwr9jdmDBJqLxGxgp/g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8YcOsbmCPHp3xpu/qKTKRWLDPe8yJuYwpHEe5
 WnkCb/RKPeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafGHDgAKCRAk1otyXVSH
 0GBRB/9ubkwyYmEIi80fmz723UTgCwHlKID9G4+AW6S1WI4ua0OYgk0PJf2itdjF4yJW5LE1kt8
 yZCS0LZa05MyXwANWlsAC2w13GvM5BFDSJiQyKT3/1F5PIv9XlB8+L/GxDYXzXgPWACkvY1goTi
 6aXXT9qQDr+5p4kWOBiMEr38sHqjb2jTnouXKYZr/4sAO5H9BALfH5oxE4qg2QmC3LxhnziA4+O
 WXgeeDd9K4VQQ+xo3BgEL2nGM/gVZvASRGUoLsGBo/QK27hrE2mqG6hJowWj6NVzKds9MCeJtyN
 IW3fywLQYvtnBeY4YMnW9yIJ15vy5cUKWoLBQO9vmr7QJgZU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_212034_639552_6959070D 
X-CRM114-Status: UNSURE (   9.64  )
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

On Tue, 28 Apr 2026 19:11:10 +0100, Conor Dooley wrote:
> microchip core-qspi cleanup
> 
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey Mark,
> 
> Here's the other two changes, that didn't conflict with the fixes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/2] spi: microchip-core-qspi: report device on which timeout occured instead of which controller
      https://git.kernel.org/broonie/spi/c/4cf8806a637e
[2/2] spi: microchip-core-qspi: remove an unused define
      https://git.kernel.org/broonie/spi/c/9c69bc6057a2

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
