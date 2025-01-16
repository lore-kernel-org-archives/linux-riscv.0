Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F4FC02183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 16:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEEilbS6GlCrs2TYXT69ohj4XF6rq14hiPAdl+tahPk=; b=e4uwhVDqkAGSst
	Wun6Zo0ZJeqrFeEUmngka5G9aBvXAu+Fuziw9828OXL85qecyMJTb36QS/kZ7rKdBnM54UIasE2If
	hETMxshwwsW9Hc8G1XqjeRlSM3fu9ONQedFC61bs3YRl4xo3yAJJu6F/jblQ8rd8ceGn1KF0YbIUu
	WUVzPiKN+qJVwXBWvpPK62eeGMMrDAz3Fr6nyNXP/GvJAh5Cb8sJdDeT8K7CSeY7VW9YzldbbRT2d
	PF+GMNvnFlowYGzCHKlarYrI4/mYfT/mZmDyN1xjqUJocc1WDO2mn93ZIp+5/th2xtWZo7n7YAGYA
	BbvmW8JQHPcIfEmQnInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYT44-0000000FZTs-36p8;
	Thu, 16 Jan 2025 16:49:52 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYT42-0000000FZTR-0KkT
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 16:49:51 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 85908114015E;
	Thu, 16 Jan 2025 11:49:48 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 16 Jan 2025 11:49:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737046188;
	 x=1737132588; bh=P5XEoRIU6R8iKZqDv1WNMWR/Ys7A+lJYA0/6g97taqY=; b=
	ZX5vdrzMQeSNRNLxoR3mbpQptn85pU121DSMcloP7VgKCsyHEapJ0CJV5WYTtxUF
	Bxr0Qcxo5NInJCU8AQMmdrTntZnxesUcn6BRTeCFxWQjrQaa3QFc5KIygJ89dfoS
	PExIWcOQRdbm9WLrHQrVLIhFPVXb0ByxXV1p157jvj/nM6utOSdVHsEP7l2zLyxG
	E/dAQNKfGNMdHT9CH9ZBNg9hI8OF/Jmh9o0PMYfQnDWLMfQackwS8ptT9iOWkret
	sDg1r33k18LKpnu90NEFExBg0SsSFNUOPuShM6eWr3DrvF+YvuBW8VncT9sK1lsA
	c3Q2RpbmoVZFKaf/iFezeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737046188; x=
	1737132588; bh=P5XEoRIU6R8iKZqDv1WNMWR/Ys7A+lJYA0/6g97taqY=; b=E
	85ecyC4HDIsNhNG7pBSQlNmBWcPYmKEsh/xXSt+tDpxIMiflDNIq5ZLOGAhzFgFx
	MnRueVB1WUMw6S0HiYZWrmF2H2qhstN3hPoHQATtqnzDac6dyQSUtIttRyFnhPfN
	13Sux1ezfmLvKCH7pRRI/YxPIfTBxcsZkTxfEqWo3htaDYAkEE6GpOJXleLXcoeL
	Hh/FD8GYte41Se43cnPTXwFpndUNM28g/1sJMTChZEKpPk0hNVIqtFOgAX/7jRS/
	PgddsTtuu2PKC8PDsI3spC3t3Jz9G/3h3nGYjwQ9aXDE+umFeGa1TR0EiJ2kcvfg
	Mjxf+fdcT1P9ypvXdsG8Q==
X-ME-Sender: <xms:qjiJZ4Aa0JmixKo-eBuktCxVodO-u7DYYerlrqKgH586seohfASnEg>
    <xme:qjiJZ6hkYCvn8qCAw4gVvmjXZ7s5aqEOF9xR2mcI08OxbXd_71o5i_sCMKk2HuIFZ
    BelCTFGtd2jEWkcB1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiuddgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptgihhiestgihhihsvghlfhdrnhgrmh
    gvpdhrtghpthhtohepughlrghnsehgvghnthhoohdrohhrghdprhgtphhtthhopehinhho
    tghhihgrmhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhrrdgsohhsshhmrghntd
    ejheesghhmrghilhdrtghomhdprhgtphhtthhopehufihusehitggvnhhofiihrdhmvgdp
    rhgtphhtthhopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsohgtse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeiihhgrnhhgmhgvnhhgrdhkvghvihhnsehl
    ihhnuhigrdhsphgrtggvmhhithdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstg
    hvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:qjiJZ7kjuoTVsnkM5tyzGUotO5dqoCzD5RshTjVI4zdVUa6JdumGIQ>
    <xmx:qjiJZ-zXyGCbTH61g15Mdf3wxv3z2AjueF207SLPruXeY8jAvcHzLw>
    <xmx:qjiJZ9S7VZnOzgGNYedBlvebhQRF8vQLxLpQ2hzqaLXibA_9QCMOkA>
    <xmx:qjiJZ5YNmNAIgseb-i_KoIH0qNl06rmjoSsCfxDVNbnzutOvQ6zBWw>
    <xmx:rDiJZ4FsDe_5TYfZQ-_kdTbIJLL2NChbwMqplZEi07lWtRGCvQfZzG2_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4BD102220072; Thu, 16 Jan 2025 11:49:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 17:49:24 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yixun Lan" <dlan@gentoo.org>, soc@kernel.org
Message-Id: <6a8bb914-858e-479d-a7d9-09e0ff688160@app.fastmail.com>
In-Reply-To: <20250108142122-GYA3300457@gentoo>
References: <20250108142122-GYA3300457@gentoo>
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_084950_178045_44610795 
X-CRM114-Status: GOOD (  13.13  )
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
Cc: Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Inochi Amaoto <inochiama@gmail.com>, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 8, 2025, at 15:21, Yixun Lan wrote:
> Hi Arnd,
>
> Here is SpacemiT's device tree changes for 6.14 cycle.
> All patches have been merged in linux-next tree for testing.
>
>
> ----------------------------------------------------------------
> RISC-V SpacemiT DT changes for 6.14
> - basic device tree support
> - pinctrl dt node info
> - update MAINTAINERS info
>

Sorry for the delay in pulling this. I just had a look and found
that your branch is based on -rc3 while the soc tree is currently
using 6.13-rc2. I try hard to avoid unnecessary backmerges of
upstream contents into my tree, so it would be nice if you could
rebase it onto 6.13-rc1 or 6.13-rc2 and resend.

While looking through the contents, I also found a mistake
in the contents:

+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -0,0 +1,459 @@
...
+       aliases {
+               serial0 = &uart0;
+               serial1 = &uart2;
+               serial2 = &uart3;
+               serial3 = &uart4;
+               serial4 = &uart5;
+               serial5 = &uart6;
+               serial6 = &uart7;
+               serial7 = &uart8;
+               serial8 = &uart9;
+       };

The aliases here should be in the k1-bananapi-f3.dts file,
not in the k1.dtsi file, since the mapping between exposed
UART devices and those available in the chip is board
specific. You normally want to list only those devices
that are marked status="okay" on that board.

I would suggest you fix this in a patch on top of your
existing commits, but make it part of the pull request.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
