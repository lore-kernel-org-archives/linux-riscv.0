Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435DFC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 13:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w9FxjbV7Oc6Ki3dvrn7TyOgtXV3RrJoOcXX8OoHA1O0=; b=1bqNqHdaOPl1MK
	XqPX2nj9o6EiDAS/mJQEUMp3RMEG8FGsmt2RfWTGG6brk0o/k2xgBucrG+tU0doOG+cN5VQC+fWcv
	0r3oB9LJMDkLeEyUDRSpJcY9xWWSKZ+WfyV4+EBxAA936DrM/6hsIv89dB7p/En3CoegS2TLh+KSl
	QFfJKn3DNQB493WBQi3bx77gv3YagRGonhPMezdLkQatVQSpM4sumTtGNpsgyyyph7417DfeMlQ1a
	ePzCm2Z7c6DQEyImHbtx5/0bOtzy7x3It6HpAYJvmU5uEbHboLHGym98v/k7N3Lry70OppC4dfv2K
	i8ni0qiKqTt4cZBu2fhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUpJK-00CXk2-7b; Wed, 22 Feb 2023 13:37:30 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUpJE-00CXgQ-8B
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 13:37:26 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 406245C012E;
	Wed, 22 Feb 2023 08:37:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 22 Feb 2023 08:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1677073038; x=1677159438; bh=q47+CVQ8qOOPo855ergJq8EIk
	+6dfpBuSgP6iPw22CI=; b=opYVZpd/XF5J/eKbesKxrOtpEWftP+G4hLgGtKgtj
	HcHnwYNu3YC+k5hIC72K73quoO2l+1p2KNmN59U9pvIKFkSTlnTWBag/LesrY5vz
	7t7ryjM71pbSRV/Gwu/ziBpPeDKyHBYiQk0cO/TTfVS8YZmUjdJoBsRk7Cet/mFm
	/A6n/f1UZMcCjk3gs4Ogc8HQ5FPHQRSqjNiuS1O6narB35j+xKdJaZx56JMO/Wag
	3x8fSeNTYJBvMLRv61fl6S9CBTYBxW/+bupn8V1o6C444CQ65lVkK7ecZ0qJoqV2
	lYvSLd/knUOqT+PVxmBaMBNQgAWencw2CuNka3r6K5auQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1677073038; x=1677159438; bh=q47+CVQ8qOOPo855ergJq8EIk+6dfpBuSgP
	6iPw22CI=; b=t8Al4EAn4K1+5pIsWvTQP1KCpr07Sn43gwo4L43VhWY97zwuk/Y
	O3rUzQTuOC+s5SMyzu67kTYKJvlgB+6MMUe3G5yf4KNwoY1LyLwRXBOWDdjkJKRm
	1GpY728Zav4aHK1cZ1xIwYgfNidOeapqPW5MYCI3y83MnmS+P1hbQmomDD7M/xQg
	6I/7vDIiNJAUsxyGEsZZwHoE0+91xVM+N1RFKPh/oBV+p3iZr+Jczd2g4Kr56whN
	LGuVfh84frqQLfIhvUWfgh9IAYfBUXWiIsYS5bKH2hGMZAPPcIhJLkmg/PmNI9Dp
	nsUQohL2uuN51ZGPDldHETle9i/6XD6JQGA==
X-ME-Sender: <xms:jRr2Y4gEYHl6JEtJG7gMX2DKvChE_vQTHW6C0yq62jrSOn94aSPfig>
    <xme:jRr2YxA6SlfPH4XT4o_Ql2G3JPJyzq36Jf-bXiiHGQZ99fVhnX-JCVZuqPcwduTGo
    Pdfn9xeHJ-Y8sod_Pw>
X-ME-Received: <xmr:jRr2YwFx5TgFJYPPMo9ZG1Z_o7OPKHCfhBWUVJ39YBPdeVA_l6SStMimWG9J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
    ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:jRr2Y5RvB610Is-2kxRvdGjpcxp0QlhByDehDQrwerFEtQBIyshGZw>
    <xmx:jRr2Y1w-Hct9lqqbRUyed-Zshsfgt96p1vlT5K3dD_ARspZ1h9uz5w>
    <xmx:jRr2Y37RMIcOFVluOV1zM6OmfPjsxzwhxGt50H225TPnN3JCi4U3KQ>
    <xmx:jhr2Y74_tiDsOk4So97qWM7it4ZmSEOZlJNx8Y8r9EiByIh_2IbJ0A>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 08:37:15 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	tsbogend@alpha.franken.de,
	mpe@ellerman.id.au,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	robh+dt@kernel.org,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	linux-riscv@lists.infradead.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/3] Use dma_default_coherent for devicetree default coherency
Date: Wed, 22 Feb 2023 13:37:09 +0000
Message-Id: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_053724_384209_B1FD0F74 
X-CRM114-Status: GOOD (  10.15  )
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

Hi all,

This series split out second half of my previous series
"[PATCH 0/4] MIPS DMA coherence fixes".

It intends to use dma_default_coherent to determine the default coherency of
devicetree probed devices instead of hardcoding it with Kconfig options.

For some MIPS systems, dma_default_coherent is determined with either
bootloader or hardware registers in platform initilization code, and devicetree
does not explicility specify the coherency of the device, so we need the ability
to change the default coherency of devicetree probed devices.

For other platforms that supports noncoherent, dma_default_coherent is a fixed
value set by arch code. It's defaulted to false for most archs except RISC-V.

Thanks
- Jiaxun


Jiaxun Yang (3):
  dma-mapping: Provide a fallback dma_default_coherent
  riscv: Set dma_default_coherent to true
  of: address: Use dma_default_coherent to determine default coherency

 arch/powerpc/Kconfig        | 1 -
 arch/riscv/Kconfig          | 1 -
 arch/riscv/kernel/setup.c   | 3 +++
 drivers/of/Kconfig          | 4 ----
 drivers/of/address.c        | 2 +-
 include/linux/dma-map-ops.h | 1 +
 kernel/dma/mapping.c        | 4 ++++
 7 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.37.1 (Apple Git-137.1)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
