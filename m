Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E6ACD98DA
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 16:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wNsvhZjEQxcs69/xGFZwx4acZ/mA+D42zvJ5Y65beY0=; b=Xvm3qRwzrsE5Bw
	kEKUKhjMXg+XBHT/aq0ZyrTeYP9t0w7Bt5w+sJmeKn0v9TJwK/shPmEkff/6CLOwEnGJ9Xdhnn4Ns
	PbhiYy/hqZSArFEHl0MjnBUxEcOT4itL8AsQYZLdi3wBlVgQ1ibLi8G+KgLQOUxB2zddgBcwOky92
	5IMyRWl4SxczSF8McjY8eD0+gTR5ecSWE2MvvtJvos5lTtnwN3JxonrFHoP2alUPb6nCTzhNPBx7B
	BI3bANwfBLqpcJY1NSOwHgckjUIK6mbcqaN7UW9rsCxPsOgE6mTlr0+KmqV0JnRnK4iMYpvHEY3iz
	w39bgbvdkpG0RKaqLH2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAYN-0000000EboY-0Mpc;
	Mon, 15 Jun 2026 16:52:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAYM-0000000EboP-1HUI
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 16:52:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 09244407C0;
	Mon, 15 Jun 2026 16:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36891F000E9;
	Mon, 15 Jun 2026 16:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781542369;
	bh=bP7ChGpxyRiB4mXS8hZE8VD5rxmZWWniItxxswm0PHs=;
	h=Date:From:To:Cc:Subject;
	b=KwGSJco2JrXS5nmKp/vYZ6UBePAxCoh9RM/GIDUTjIQDSVoGBYCBl0ZfQ2C+U0ms0
	 Ui4pJ5i2XGzvaxH7JFknkWgltRkFvgdnpKfVYg7GuSwVsSqXe0LK3opKn643KBU6tq
	 yPrG/HhYAWu39qNJD4MI1mXa9wwIkOsYT2rxIRZa3DCW4/c0114YhbWjTEZUPLW8QE
	 ilSNay3WC5OicEXnWXeBXIXPZvVs2UF+v3tAfnukUriyrCbxKMKknTdYyVorUN4GmT
	 WwnEOTB/mRQmNLOFvMdFQ+4Vim3JALauH5lG8xxcDDtPV56zSB1eRSGzPrrA3e2q3P
	 Vt0tDabgB47fA==
Date: Mon, 15 Jun 2026 09:52:46 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V defconfig changes for v7.2
Message-ID: <ajAt3ml9pMIMTLTq@x1>
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

Hi, this is a late pull request so no problem if it misses this window.
It is just a single patch for the WiFi driver on the TH1520-based LPi4a.

I recently setup new branches for riscv defconfig patches and they have
been added to linux-next. I talked with Conor and this seemed like a
good way to pull in defconfig patches that RISC-V SoCs need without
adding more to the plate of the arch maintainer (Paul).

Thanks,
Drew

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git@github.com:tenstorrent/linux.git riscv-config-for-v7.2

for you to fetch changes up to fb266bbe9aef17d547db468a1a7187b59ed33e9a:

  riscv: defconfig: thead: enable PCA953X GPIO driver (2026-06-08 11:31:26 -0700)

----------------------------------------------------------------
RISC-V defconfig changes for 7.2

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
