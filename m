Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8345CC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 11:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pXwzcMTLG8s915nYuvrii3imSXj3+5OXH8LOkkdQJpk=; b=Vy0D+Yz7d2DAvP
	6/KJTT16/7oAxgGCv3WwM7Q+o9yPiV4VeWLPqsQ5pzKPi+lgeSRH+FHqX5wxwyDrvTZvpwtQx4BXa
	NZ77IOHTLUB5v9+jhAJwd7wUl3x5nV7TCU1I/aPbVCUnV7vAuhWk7T282bveavE1nRI6pdxWMc1RE
	mFZ1l3XDXL72KCFGx4q5DhijYjdj5eXf3ejrW5Atssf/rmB+uctEOJ/eWAiZaPlqln5FgIKkEb31x
	Tnqrs5nwZTskkzam0W2vhLVItQxbhBfWD2V25oeMgmbRj+MuCo5dklqU8tS9bAknVYKq/hrn0ledG
	i3pdegNbmN0+vbthfxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV9uJ-00GB4t-8Y; Thu, 23 Feb 2023 11:37:03 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV9uG-00GB3Z-9t
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 11:37:01 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 4F13C3200903;
	Thu, 23 Feb 2023 06:36:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 23 Feb 2023 06:36:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1677152214; x=1677238614; bh=T8PK2cQRLY5A4FxRWK8i+aaat
	tnc3laKSanQcycFaLk=; b=d/Brj8CoyOxr+FX8rjApAyHLj8+0+L5/R+SFdsgHl
	YNU/mVw/fZAbKmb6HOzQWEXlYO0O/siHHu90N9nna5M7Dh23Y/UWWIoVolKCCTQf
	gQ0+WFr+bbJuMAlllLbygp2Ha5tspYQ3+o5sLSqo/vt8DpcPUjb8GjoDqOgYhUa7
	s26FcE9GflBxxraMzH/MnAWUc4Faqwpina4odmEJZJSPmnecDY3j/BeH88dyOYxA
	k25rpqeQH+Lhi0mL3dv9E2JodaprQyX/gQEhCmbTryFkw+9/oSb9fuK4WEFhpMj/
	5u0yxBbdeGq9xvrPJ4gtgTrmTs9hJsiLGJg4n+gbL0f9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1677152214; x=1677238614; bh=T8PK2cQRLY5A4FxRWK8i+aaattnc3laKSan
	QcycFaLk=; b=K4CuWUtFqoffTZpcwTRNJph6ugM/Wlx2m9JxCmfh/EJc+pP2b0a
	H37hoMSzVu6TC23e6sD7KZOhFR5+xVb14xZcXtDgW/bBn7iNh0Yc8r8iCz8SVOm4
	QGIGZculzBn0kr/ujNwu3LxVMxN+YB+rZp4boOkQh05VZm9BTx40J109BqsFsgKY
	hIJTZVZtHjCpJzh2WT5FHzeWHD0kPW5tXrDtttPmxr6pybBMqwUR/cPFj4IXdYuC
	XNeX9Nx313DO9Vj7jHgcWX4OudYbOw8CxVWjowalRH57mXj0BPPtaeWGzVrZtcv5
	Ik6WAy6++wQKjdypKrEpNaGVLmbFNr/HcZg==
X-ME-Sender: <xms:1U_3Y-VwM6tOAt27z_ZWQ4aaIhYaB8PkJEjHvCVWupIv0zsM-2fl4g>
    <xme:1U_3Y6nrZg1JNb983p5QOdW7XUjWlOcTkm-mrZnjECeT384QxYQoRAF6jI2tJ74ac
    tX8J4HdB_a-t_Gt87c>
X-ME-Received: <xmr:1U_3YyaFuPEjnNRrvCgR2_zbyOO8fM3D1bqYWcTextYAsRBYfcTvfVs3WUpGNOSh7hKWLK6oLMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekuddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
    ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:1U_3Y1VBHKtdGY1xhPJnBF6tJ66MM-ANNNtkzETAnFuwJsjvQp1-gg>
    <xmx:1U_3Y4nzWWpI-snQ807urQ_E8PuPUTyuTs1BHQX-n6T7ezi-uh94mw>
    <xmx:1U_3Y6djTOrM1OBan_sRPcnI2zL3mnty-jwsphOCqSbR-3y52XXBIA>
    <xmx:1k_3YyeubhykCZ8ltxSt1YHSxkIp3PYJSO_4UV-_WL84Y4vZKNfjGw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 06:36:50 -0500 (EST)
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
Subject: [PATCH v2 0/5] Use dma_default_coherent for devicetree default coherency
Date: Thu, 23 Feb 2023 11:36:39 +0000
Message-Id: <20230223113644.23356-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_033700_756613_DDC1B0ED 
X-CRM114-Status: GOOD (  10.34  )
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
---
v2:
  - Add PATCH 1 to help with backporting
  - Use Kconfig option to set dma_default_coherent 

Jiaxun Yang (5):
  of: address: Fix default coherency for MIPS
  dma-mapping: Provide a fallback dma_default_coherent
  dma-mapping: Provide CONFIG_ARCH_DMA_DEFAULT_COHERENT
  riscv: Select ARCH_DMA_DEFAULT_COHERENT
  of: address: Always use dma_default_coherent for default coherency

 arch/powerpc/Kconfig        | 1 -
 arch/riscv/Kconfig          | 2 +-
 drivers/of/Kconfig          | 4 ----
 drivers/of/address.c        | 2 +-
 include/linux/dma-map-ops.h | 1 +
 kernel/dma/Kconfig          | 3 +++
 kernel/dma/mapping.c        | 6 +++++-
 7 files changed, 11 insertions(+), 8 deletions(-)

-- 
2.37.1 (Apple Git-137.1)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
