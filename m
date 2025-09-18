Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7A9CAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 16:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=roZAPr4xHa/5mCgZAEEckRC1GSZ6TmqvoFqiEGnkSjc=; b=lkTfRDVaj0N8N2ocIxXbI4Fspl
	4lmZnTsPRjO2IgHyavza1ZqJE+9MUOvftFS0nSpiVjG5c/+UyCu1f8UKNXw3uFVXRkd3UZuG+urxK
	5n8yFl5XNCliBqd639zKTSEdN5U3VnEx70DGo79/K4RhbXG2s4wDMgRStyUlRqZPD4gRlHPUCXJiK
	h9baOlDw2UcwI8HfZJZFVTOIQB+0OoeDARZtfFHX/TpCLZsmZCjIrGSEeEx/mPLkJha8OlBs4BE52
	lLmgL++y4jv9HdPUbRmbCOK2eK3x7p4gvww48ZDO4lgeLRv6CAPUtWYczgHhOnb2nftYC+h3LgD3H
	fdTHsZow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHN2-00000000b9f-42th;
	Thu, 18 Sep 2025 16:20:32 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHMz-00000000b8R-3cZO
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 16:20:31 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 1F35DEC02F1;
	Thu, 18 Sep 2025 12:20:29 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 18 Sep 2025 12:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758212429;
	 x=1758298829; bh=tmGWVjr/plBDzfvbAKhx6iARmpyl4UPvOj4rfEO7kFM=; b=
	FV+l2ayH/eDb0mQLXR69ETsvV1qwsAmKxzDJgbyGHaqHvcbnmgMlVcLbFTDMofpw
	ON0sGpEUQqJAHVzhmTVaPn2yuU0xkFrCyvg4RRZP7vVFkytGO0EDPKli3Mz/9M7h
	madQpnZ1cA3vlmu3NCA2QPYawD+8voKPb49ORqItcyJEdHMVztgyv41fqe21BKqO
	hgAIifuWgDM1hVgC66Cjiap766hU/oXcPuxxwFTXJ3LRR42eEUYSKfWwv9lqx3kt
	lQAYbvLZ+Rmo9mIBv/NfnASAa56gk0GgzB64SCIMHp7V3RpsU0Ya2/K0VPbEc2ed
	ioS46Q/Poj6u2i1jZbiABA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758212429; x=
	1758298829; bh=tmGWVjr/plBDzfvbAKhx6iARmpyl4UPvOj4rfEO7kFM=; b=g
	xIg8TDw+wGDwdhNseeH8YQdZA4S5R0gePYw95PhCD4jHuWNjQLsNWc44HnbQJtIn
	ErzSTc0jFUHzLSktqtB638BiFwdBONE2xAYeh4YE98XLJZHNHdJULWv4ryUpjabi
	l2HawHRz8lsVPHJcDmgNnlZauAlI5ZR1pOZBwVuL5RZaVQxUbCGE1fNEmwLaKLiA
	OY4+Li0ZUCih62P01D/wDLOgCMui+W7RFVzgTxKuzKyd5UC31QX0zKLy4n2EkPnZ
	uGpaxFii3FIsOT7gV8Y9H48vAhv8BXaebUjFc5eUVa7htJAtmaXPJHXIBqFqU54r
	hvY6/lxTYll8J5otMd0CA==
X-ME-Sender: <xms:TDHMaHjr4m47XfRFLnooPRe2UNPSJT0r0GNmMrr792IfZtvVnzDVUQ>
    <xme:TDHMaEAuwoBhuaFP-JQrg89S7UxFTnblwjJBrztLYKz6C208oByCmcXs4HKoFRBuH
    Fe3PxP7tYusQng0YoU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegieejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegulhgrnhesghgvnh
    htohhordhorhhgpdhrtghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhm
    lhesghhmrghilhdrtghomhdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphht
    thhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhkohhulheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrrhgvshhhrdhkrghmsghojhhusehlihhn
    rghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhig
    rdguvghv
X-ME-Proxy: <xmx:TDHMaJWhxE6rxyr5cSefV7mqkE0OKdEr0JChXXgYodtadvEo9XX01A>
    <xmx:TDHMaIiva_JDjIyYc5ZQ80tB9qU93rVsR2cHpQHIOJaspdWO1QzhFg>
    <xmx:TDHMaBdgmOziAfLicgsbA5M09jayoi0oO8IoAV4XMDf7mPHSdh5QcA>
    <xmx:TDHMaP0DTYui7ukg6cwCVV80GEsHNvj9WkdzmT8QXhvkDxI3S7_Bew>
    <xmx:TTHMaH7h5PkJyNVx-Xufz5qS5lyu8aPC2CeRkZ9vIKMesZ5ZAgZnvlCY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CE9F370006B; Thu, 18 Sep 2025 12:20:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ADSp2o6y9pwF
Date: Thu, 18 Sep 2025 18:20:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guodong Xu" <guodong@riscstar.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Yixun Lan" <dlan@gentoo.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, elder@riscstar.com,
 "Naresh Kamboju" <naresh.kamboju@linaro.org>
Message-Id: <d2a99673-cc0e-4024-bc66-76d395ea4313@app.fastmail.com>
In-Reply-To: <20250918-mmp-pdma-simplify-dma-addressing-v1-1-5c2be2b85696@riscstar.com>
References: <20250918-mmp-pdma-simplify-dma-addressing-v1-1-5c2be2b85696@riscstar.com>
Subject: Re: [PATCH] dmaengine: mmp_pdma: fix DMA mask handling
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_092029_975569_E6B7B405 
X-CRM114-Status: GOOD (  14.40  )
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

On Thu, Sep 18, 2025, at 16:27, Guodong Xu wrote:
> The driver's existing logic for setting the DMA mask for "marvell,pdma-1.0"
> was flawed. It incorrectly relied on pdev->dev->coherent_dma_mask instead
> of declaring the hardware's fixed addressing capability. A cleaner and
> more correct approach is to define the mask directly based on the hardware
> limitations.
>
> The MMP/PXA PDMA controller is a 32-bit DMA engine. This is supported by
> datasheets and various dtsi files for PXA25x, PXA27x, PXA3xx, and MMP2,
> all of which are 32-bit systems.
>
> This patch simplifies the driver's logic by replacing the 'u64 dma_mask'
> field with a simpler 'u32 dma_width' to store the addressing capability
> in bits. The complex if/else block in probe() is then replaced with a
> single, clear call to dma_set_mask_and_coherent(). This sets a fixed
> 32-bit DMA mask for "marvell,pdma-1.0" and a 64-bit mask for
> "spacemit,k1-pdma," matching each device's hardware capabilities.
>
> Finally, this change also works around a specific build error encountered
> with clang-20 on x86_64 allyesconfig. The shift-count-overflow error is
> caused by a known clang compiler issue where the DMA_BIT_MASK(n) macro's
> ternary operator is not correctly evaluated in static initializers. By
> moving the macro's evaluation into the probe() function, the driver avoids
> this compiler bug.
>
> Fixes: 5cfe585d8624 ("dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support 
> with 64-bit addressing")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: 
> https://lore.kernel.org/lkml/CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Thanks for fixing this!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
