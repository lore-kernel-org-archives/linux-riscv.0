Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566C4CD342C
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 01:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZwQ1yOAWJRdOxqleFV0RECoXiGjAxndMB6q+eXFe7ps=; b=ywQx+NQ7U+hRm2
	yzTQuSs7Yc0MboJUN/vAkhNRUg3mcu28ZCJvImvoSoL5NpSSQOMByjI18B5+mvZac422ummma1lG8
	0CYbrscfYzMKrZ91rND55knrLWfByJ/k8RIhjSQHThPoxJuYmbRFU9bDzhD8l1l+SttSWNSytxBKR
	6wMWISSZPpmIL4eABaILPGwuAWpoP46AFJd7/p5a5Ej0E9CiisyKVU5Juz9Zoo65ZgkOpEpk0KZt8
	F8i0fLfzL2aaEzVQcuJJsMucXavtydMDe1U4pR7nzJh6/tLB0q6Gwts6fYxwcWh1dDJtD8axSk2y1
	yYxmSuXGed/n/GHr0kNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4Ht-0000000Emjp-31Wl;
	Tue, 05 May 2026 01:09:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4Hr-0000000EmiF-1Ec8
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 01:09:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7369C4029A;
	Tue,  5 May 2026 01:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7EDC2BCB8;
	Tue,  5 May 2026 01:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943362;
	bh=nImo5ObXpWvU5qmCvtxUSoYcaKKF8ZKzQ/NntiTwEN4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QWaBBOE8+ol4FXKcJ76nymFji0n4gpdl1o8FAADvWpJX0V0ByZ17RnE6traPPa7Vp
	 2+gsIxSoVkZaVPWeEXtO3VGdiTsMQFx57iyyoHzHaFhzbGTqk1UJq/GaG650qF8tnZ
	 hb4ONSaVyGpYniAsuC9uWjYYXrwKbSnf3M8D9sYzW95jag9CthhDiBiAPJpo7qn0FO
	 Mx7Kiqd2Kyc+Ld1LPsD/Xsxrh3msJcYSYvAuZAgoOavl6EHsgWzBJGI8nqPuX8Hlb8
	 yK0VImm7SjBYK4yWgGW96z03KeakMztzmfX+rjfLreagew+PkmjYC6XQCtZiTl6lbT
	 eW2GJm558e25g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>, 
 Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260429-k1-i2s-fix-v2-1-8d67835aaddc@linux.spacemit.com>
References: <20260429-k1-i2s-fix-v2-1-8d67835aaddc@linux.spacemit.com>
Subject: Re: [PATCH v2] ASoC: spacemit: fix RX DMA params not set when TX
 is running
Message-Id: <177789977513.458539.3948395874655836368.b4-ty@b4>
Date: Mon, 04 May 2026 22:02:55 +0900
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nImo5ObXpWvU5qmCvtxUSoYcaKKF8ZKzQ/NntiTwEN4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+UM/TkHidV6dIxc25HjU7MFgUg9136xCHKLp3
 Li5Zwd0PeiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDPwAKCRAk1otyXVSH
 0HNJB/0bxhuwGjLhVB3xyCWT6U8VsQxY/EwjI8SDhh8J/ZWdjUvh7CZuzM3Zl9FMSc1I4p8k7Fk
 qTcXCPLSdCflxHVjGezzpqxqEeG+kZKnBaUy1K9iJvoyqW1O36ZY1De5HJGDRkZRMpeCK4d5Pjr
 M4TbpRaPREaYmNLUuP0QEw9jm2x+d08OFOeaHzS9RA9U6aaDbXDPnNJLIuGEEmr76/G0OQRVv2v
 vesOxbpObzKcmQnxwMqNzKjDCNR6Mo8Z9J8WLAo1EMnsE2077VhYVcQd2lJUmAXoATySVIDECcz
 muj5DFtODqcEynvOSy0pUhb19gAznZxSpbELdb5CQwpcaEMl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_180923_358508_B113AC4A 
X-CRM114-Status: UNSURE (   8.83  )
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

On Wed, 29 Apr 2026 17:00:50 +0800, Troy Mitchell wrote:
> ASoC: spacemit: fix RX DMA params not set when TX is running

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: spacemit: fix RX DMA params not set when TX is running
      https://git.kernel.org/broonie/sound/c/ec0611868f2f

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
