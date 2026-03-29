Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B30FC97E2
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Mar 2026 18:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4EcpSQMZrHIzZ8OW3TLaWa81TgSnemUTn0INP3tV7eQ=; b=GHXTuHWmqfNFcP
	o79Gn7PUcCh8h+hvelkhwa4TSLY26Tj4Rwj0amHXzdbU752O3GnHVuDfowOqp8zCfodj7+BUC371O
	5ZQ1UWEEUoRnYoSrDBzWCF3vuD0y/tPk1HPwcj+f67BpkImN+dX65p6+fHMGw0sqGvv+4ChCsJu83
	pnWvtAJdYcLXaPMFoRCmZo7XjsfcoBUNIJwKfcu9OPCbDeeoEmpaLdDnwj7rXRuSEe3s+6y3RwGuE
	s+1MwomfF7Mc2VTzkdtnofzdxQEYPuZ1eGtQMSQI/eMI2iv7GQ8AHFr5kheOhB64gKBztH/kx+18C
	tiC+FTl72nqR9n55Befw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6v7Q-0000000AFPj-0p2J;
	Sun, 29 Mar 2026 18:44:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6v7O-0000000AFPa-2AsW
	for linux-riscv@lists.infradead.org;
	Sun, 29 Mar 2026 18:44:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C71C600AC;
	Sun, 29 Mar 2026 18:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC58C116C6;
	Sun, 29 Mar 2026 18:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774809853;
	bh=A7qxJ2hT4DkPy0kLPUOXaYDP7gwmFTJJDSrdzgfZeyk=;
	h=Date:From:To:Cc:Subject:From;
	b=feSHdLXJmSuhFm+2gPkUoqmuFqZtEtZ1cNs7DGLRhBd1YyVq4T0cNPgxLbAxAq42m
	 0fVU1pV9Ulm0vScwTDZkBaqBeaEi3MRKkSCTOKJaS4vPw/3aO8czPOl7gcYH6dN1VL
	 rwRlAThjWqOR55xMvbriGpRB5gZnxT6M5apDM37QnhSS8rJh1v17D51CKBvvUsYF6H
	 S7kNrxThZD5gmUvGskhqHPk1t85eXZKajNDxdvb57OMn1QfC1FtfxiuvErYj0Y/J+T
	 D6ahhsTSAA0VDVUNfLycUzT3Jp+bUFPBU3SzeM7LbJDfi99qsgCDQCqoJjAwv4I0qN
	 RpjZIQXv799lw==
Date: Sun, 29 Mar 2026 11:44:11 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: devicetree@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Jisheng Zhang <jszhang@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Fu Wei <wefu@redhat.com>,
	Robert Mazur <robert.mazur@imgtec.com>
Subject: [GIT PULL] RISC-V T-HEAD Devicetrees for v7.1, part 2
Message-ID: <acly+68IaK1lWE2p@x1>
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

Two minor improvements that weren't ready when I sent the originall pull
request. They have now been tested in next. No problem if it is too late
for this cycle.

Thanks,
Drew

The following changes since commit 9c99a784d9117a192ebf779d4f72ebec435ada97:

  riscv: dts: thead: lichee-pi-4a: enable HDMI (2026-03-14 09:19:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v7.1-p2

for you to fetch changes up to 74ec3d52c0035b662ec295bef2bbffad68446391:

  riscv: dts: thead: beaglev-ahead: enable HDMI output (2026-03-25 09:20:38 -0700)

----------------------------------------------------------------
T-HEAD Devicetrees for 7.1, part 2

Additional updates to T-Head device trees for v7.1:

 - Enable the display pipeline for the TH1520-based BeagleV Ahead board
   by adding the HDMI connector node, connecting it to the HDMI
   controller, and activating the DPU and HDMI nodes.

 - Add coefficients to the TH1520 PVT node as the values in the TH1520
   manual differ from the defaults in the driver.

----------------------------------------------------------------
Icenowy Zheng (1):
      riscv: dts: thead: th1520: add coefficients to the PVT node

Robert Mazur (1):
      riscv: dts: thead: beaglev-ahead: enable HDMI output

 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 25 ++++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  4 ++++
 2 files changed, 29 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
