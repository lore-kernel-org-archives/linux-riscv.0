Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29149CD6E55
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 00:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=45hACDchWy8Rx5Wdf6vlGBRtBYrA6txZzcRx2WVqqHY=; b=ZBy8rI4lubZmxQ
	r4FAuGXFJZmWwdri/iPhpbT5AOBbX+zj3ybce4D+aRTjux42mCemL9iuI+BMUJaY1E0LE5B25qw2C
	TBVAlSKu5wGOQgQ1WKgldg+tHO8o4Qmqzkunvb8hR4YSSbn7DndwRW6pM+VQgYqKKa3IvO1Xlr1Cq
	FBHbuikDmznGgAiSXQyVLqkDTfLVUuiE7rHjAr2lhHLZVLVJy9NbK2HTwhNaEEVek7ITIL2qStEMw
	1ct7N0KLknkpyolFY8/3bY3vY8PrOmAIlGJGl3Odkdy8Nwo9OKlyH6NkRAgeNa59m5Extlk7vvauj
	NcEVKmtOQn0AI1p8Vfzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUD7V-0000000C6x7-2ZyD;
	Tue, 02 Jun 2026 00:36:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUD7U-0000000C6x0-1d7G
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 00:36:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B61606001A;
	Tue,  2 Jun 2026 00:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D0C1F00893;
	Tue,  2 Jun 2026 00:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780360595;
	bh=y/dxwY1WEpokhgJ5nQvecX7jCg2OKT5h+ULfFFtw4ik=;
	h=Date:From:To:Cc:Subject;
	b=XSqJrRZFQ/lNGszqIDOMOixI2WwSTbcm41JHgyLifD/Vya7Yp+5wPVG3yZx4Dd0D7
	 zufZFqc4R/rIFT2AmPjqXBsj4AVAinOA5DVgzTnzfttuXAgR+Pl3spCMKkSPiTDeFo
	 nFv7eldwT+0qsNkSc4c4VBiz4tx9SN1XyBPWb2PeXm62KJYfXcDPBXIB7ZnnCs9I7M
	 x+MXNKCvlNe7EiwMJJlyF6+/fX9CuL+KQ1FYGZ74kXoac1VxxsT8jLDLd/eGDM+ieq
	 Q0PcgoO7bN1gRwFI7vEwQZ7hwmlBSAf+NQ6hTAOWv7SIvxfEzTMKqZJrophHqYHcKk
	 Ph0oLOY9uxBig==
Date: Mon, 1 Jun 2026 17:36:33 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	MoeLeak <i@leak.moe>,
	Thomas Gerner <thomas.gerner@muenchen-mail.de>
Subject: [GIT PULL] RISC-V T-HEAD devicetree changes for v7.2
Message-ID: <ah4lkWh2eD6l7W7n@x1>
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v7.2

for you to fetch changes up to 3a5791956edbfa84d7256224167941931cbc46e7:

  riscv: dts: thead: Enable wifi on the BeagleV-Ahead (2026-05-25 01:36:56 -0700)

----------------------------------------------------------------
T-HEAD Devicetrees for 7.2

Enable wifi on two TH1520 boards: BeagleV Ahead and Lichee Pi 4a.

The BeagleV Ahead board uses an AP6203BM WiFi module connected to SDIO1.
The Lichee Pi 4A has an RTL8723DS WiFi module also connected to SDIO1.
The module reset line is driven through a PCA9557 GPIO expander on the
I2C1 bus.

----------------------------------------------------------------
MoeLeak (2):
      riscv: dts: thead: Add TH1520 I2C1 controller
      riscv: dts: thead: Enable WiFi on Lichee Pi 4A

Thomas Gerner (1):
      riscv: dts: thead: Enable wifi on the BeagleV-Ahead

 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 48 ++++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  | 47 +++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 11 +++++
 3 files changed, 106 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
