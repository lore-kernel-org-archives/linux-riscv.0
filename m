Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422C4D35666
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 03:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaTTJFMqwt2AnIsnKq78q1bV98LfEyxKXh+U2s79T3I=; b=PCSYc0DkiDkJOj
	+zpUYr3y0byjqstMuH9QiU4UHvlTJde0WXVKlKHJpgaHr4xkmSxYhFNGrLvI8sWuLMBo7QE11/0pY
	0eMkiefi5NJNMMfLMYjFOGqt3TTX2txeyKwMf+zx4TjYKYhBWiKUBcqp5Xb92agEH/B8Wol56syL9
	VQUFFM8kK5QyypyEuxtCZxgY7ZaKASR495hp2jHdXxMCm7MqzBMxOdt0HYS6A40geemyA1EV+H/hY
	fBUiubQ9qz8bZhSjFjeuXLh7h4d4M595MaG6wyY2Id3kALYtVrBndpPz5P7QDDHxg9r+hW9856VWs
	d2flvKEPRC2poOL1mqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvp7-0000000FKro-3RED;
	Wed, 28 Jan 2026 03:02:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvp6-0000000FKr6-2nI6
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 03:02:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F9F460007;
	Wed, 28 Jan 2026 03:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2635C19425;
	Wed, 28 Jan 2026 03:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769569347;
	bh=H9NXgJot6Ofd8DdlL75INUWfELwxu3+FrH0VklUOezc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rk5/BmybWlM47xVlmxM8eKaBG5BmPG8Zym64Sejpg1wuTYn6mFccBTi6agVt02bmo
	 u+YgkbPBfGqCqvDEULJ04NvMD8Vz9i0877TM79w8ihEXVf/iMwUHcFvS25bXFLDKxM
	 0KSyrEMdYg7D+xdjAN28imLlOw6nVwyy5aYysfw0iwxzxxqUD0RvVf9WrFJ5hFprR2
	 mOOmUaZNNk4hQu5l/SAtbmX7wn5fBiv60X4k7AAkpAlX0U9M2Jry2Dx1xaqeh0wBK1
	 Z5tDpU6ThFIlakj2ETw6v6af2NY/ifIFI+D/fcH9vJa9M1p+AGRahLkH0XcJpVItfQ
	 Jq5T4F01Zu5+Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
In-Reply-To: <20260127-incremental-for-i2s-dvier-v2-0-5f66b841f63d@gmail.com>
References: <20260127-incremental-for-i2s-dvier-v2-0-5f66b841f63d@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: sophgo: cv1800b: document DAC overwrite
 handling
Message-Id: <176956934454.1515833.15704162153202007918.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 03:02:24 +0000
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

On Tue, 27 Jan 2026 23:08:18 +0400, Anton D. Stavinskii wrote:
> An incremental patch on top of
> "[PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC"
> adding the explanatory comments as requested.
> https://lore.kernel.org/all/20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com/
> 
> changes:
>  - added description for cv1800b_dac_mute function
>  - fixed "extra change" from previos commit
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: sophgo: cv1800b: document DAC overwrite handling
      commit: a8e3e488293118b8fa5d5e7ca786ca25b954ce12
[2/2] ASoC: sophgo: cv1800b: tidy Kconfig spacing
      commit: 8cf19b19dba8814ccc8b1179dabf28b7f8eefc22

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
