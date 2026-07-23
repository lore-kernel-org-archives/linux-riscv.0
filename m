Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92337C531F9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 00:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkShjaCZRDiEDmue1ZS1H0OH9XBZ5GN80zQGWyAzelU=; b=4iIQN3H3/Cqe3r
	CA56/LTqthNHPfWwT3EIXulIRSfBR0fJkmUvqa9Ig99FGQAjadEloM1nFDrb7GcfpK3tlOIY/ZwIj
	M3NxS+YU7DEMokjc45hGXOcSLfjbZY21G5D6iokScO+Zh7Nd00Be0+ooA3we+5li8D8Cb8kmUNyoO
	STlQKYEtBs1AS6MeV1J8JXkkyQAkPPlc+8qpMagbMdbG4nOChSXIPhwZ2sm6BuBWGgs6n9hobkfUi
	T7sNhHQ+UwHiFtmj/Aq34R7vGxbsTKG8zU2eu7Y07FV5Z2zl8E45LYEFeeeTq4LLgv95mS0S+u2NZ
	7eOwKi1i9psV7/AaXzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4FD-0000000FJSk-0nYn;
	Fri, 24 Jul 2026 00:58:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4FB-0000000FJSB-2e9s
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 00:58:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B01C5600AA;
	Fri, 24 Jul 2026 00:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3401D1F000E9;
	Fri, 24 Jul 2026 00:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784854708;
	bh=bcXw+uIE6W+aK5mxlbiXr2hjN6fRQj7fOTAKPEDEydk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ckOaAxvH6ImfAeVxHn6JpB+5j75OsgTrQXC9NZPpACvjgH/VnkuhHoC9WCh0I8f4d
	 mcGwbbnlNNHPRRYqQnVZT0r+jcFph/AIZo4rekx7j2Locr8S6hfNkXq1Imgq2sAOT/
	 lTxcMq59AksRdH4uboHxVVmIJAFouMbhWny/rxdlpj8s1TkTPIxADoRzev+XDPzoHA
	 rL7SIZESSH9QCcXzUtT6KJEztHwQhyuBnM2IhQCl6us47dyvletaqpHalo1TwCxFQr
	 NAHiA64bw2vmCqKmzu+f6nRKoUF2059A8Y6zgTZtE9ViVZSccks/w3QLqrp5Gr1pPp
	 uIOHMHZL+RsWA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>, 
 Jinmei Wei <weijinmei@linux.spacemit.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
References: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
Subject: Re: (subset) [PATCH 0/3] SpacemiT K3: fix I2S DT integration and
 add controller nodes
Message-Id: <178482894045.53486.14996255355571230454.b4-ty@b4>
Date: Thu, 23 Jul 2026 18:49:00 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1675; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Z+DZXaVMkBJvppVuH05mkoVURmyRDBb0qJxSdWYGHJY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYriwtHQzGPiVMTAq4TXVnYB8E272P0kdF5zON
 4Tl55YNbL2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamK4sAAKCRAk1otyXVSH
 0HOSB/4wOzhGtKviF7czKKjFRLfpx+au1bP8poyRbExsvd5h6bZJq2xNP3571T+7iiG46UQxo5T
 dzdaugQrRvZhQMUJQZ2frnSvmqUAcoeuwvb25RzOweTxG0mSNclXE26WC/aZa8pJ0KilZx3riwg
 ODiLabcKo2O3ZfP3uvGn0C8l/ItUne4sZXY8MMeUh4peYqogTGNA3sgrBWuF4mDDLLKnl70KMhn
 pe+1hMKvvIuzfPG0gHoE0kEqKwX/qphYu5BklY8VIw7NF8LfYV/jqswOGjdAirndJTvJavTFyA9
 jIT8f4prAy8zPq4yjYauRhb7URUZLc6ShG5aZO87+12KJg0C
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

On Tue, 21 Jul 2026 19:35:54 -0700, Troy Mitchell wrote:
> SpacemiT K3: fix I2S DT integration and add controller nodes
> 
> The SpacemiT K3 SoC has six SSPA-based I2S controllers (i2s0-i2s5).
> This series fixes two bugs that prevented writing a correct DT for any
> of them and adds all six nodes.
> 
> Patch 1 fixes the ASoC driver's clock lookup names. The driver was
> requesting "sspa_bus" and "sspa" but the published binding specifies
> "bus" and "func", causing probe failures on any conformant DT node.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: spacemit: rename clock inputs to match binding
      https://git.kernel.org/broonie/sound/c/4c69d04958ec
[2/3] dt-bindings: sound: spacemit,k1-i2s: allow 6 clocks for K3 i2s1
      https://git.kernel.org/broonie/sound/c/ec926b3bcb49

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
