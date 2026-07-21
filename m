Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB19C4452B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 16:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XnsSuXW1qa7tW2u5Dp8bKB3y+yte3WW4kRqkteNhhco=; b=vGp7ywvrAxhZn+
	iJLTHuzNQj22xXSV01IZ6dWhnGmkSkpNbtyL0BF0RGaRpWxslHwzPWpJBOzXsFd2M7nDorvDeB3nt
	Q15bWAVvzvdbLjRmm+Z/2uHaXxBFHM92o+4SwNxW1PSp+wpfVwr6r3uR5+2NgIotYydzBCSoYFkO1
	JLDrnyrvPPzC6S46NfbPj47BSyYaRMgym09Tkns/qUkSGKtA4dSFZV7x0vyPG55ogzGzKb6WtOE9y
	SvneZ5UsA3yeuhRvCjgPqYxWKmuLfEEY/T3NF/wunrXpaTtS722ZUCRIln+8HrwO1bBjHiWuZFINw
	eHA3TJZew7HUUYjYQgAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDCs-00000009sIl-2bST;
	Tue, 21 Jul 2026 16:20:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDCs-00000009sIb-1P6K
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 16:20:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B7E643A0E;
	Tue, 21 Jul 2026 16:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D121F000E9;
	Tue, 21 Jul 2026 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784650833;
	bh=aVk7UBu/o6xF4f2qHRc2ya+W/TOdLCBo++HYfTuftnI=;
	h=Date:From:To:Cc:Subject;
	b=B1u/YUKH69zLlxbeEOv5Is9YO79Ruq+QPwwEU9m66KqGjWAvEbFVvOPkZWI3r780U
	 bLNX2c6C6opyEJ9QA9eVx+9uLNlNOIhiF8WE2sXADQZ+SbOoyi5/+2I2/4BUe8cd2C
	 XmN7i/TVHw44aiUMRVeWG0fyhHCVhCoUfL178tOGazKoXHf1q+AdyuXt318zNWeBrN
	 Y7p9s8Hbul/YkxzTQ5MLbxl+MnIcBeOjvbBMqjAwySdNcRIp3Th86fB1i4MqmH0HMG
	 45sZYUrSY+A9pJOVx1xbKzWULl2vjBz5IQUxr7BraxAMzXegF2w/iTUOEtRAh+MbOk
	 PvGd6NXAcdALw==
Date: Tue, 21 Jul 2026 09:20:31 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V defconfig changes for v7.3
Message-ID: <al+cTw/+z7xoJXxp@x1>
MIME-Version: 1.0
Content-Disposition: inline
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

Hi, I created my riscv-confg branches to shepard defconfig patches
related to the riscv platforms that I maintain. The branches are in
linux-next. For 7.3, there is just a single patch for the WiFi driver on
the TH1520-based LPi4a.

Thanks,
Drew

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/riscv-config-for-v7.3

for you to fetch changes up to 020e209272bee0b8add8cba21125e4744f034b26:

  riscv: defconfig: thead: enable PCA953X GPIO driver (2026-07-20 22:05:33 -0700)

----------------------------------------------------------------
RISC-V defconfig changes for 7.3

Enable PCA953X GPIO driver to properly probe Wifi pwrseq driver on
the Sipeed Lichee Pi 4a board which is based on the T-HEAD TH1520 SoC.

----------------------------------------------------------------
Marek Szyprowski (1):
      riscv: defconfig: thead: enable PCA953X GPIO driver

 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
