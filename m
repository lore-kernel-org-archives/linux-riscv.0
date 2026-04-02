Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1D4D6AB10
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 21:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Mmra3jseIqoIpxC/gouxjRnjOs0136gwizn1daxgAlE=; b=bpb3FzPb6bjzb7uqYG86qOPu0g
	yFuGYTEcTIMdRZIPMg9kkyegm+XCkswvR0yJPN/y+6p5+m1J7eRV9ObPFEc0VlYxfS09NRlgJhOTj
	MlRTN9yAdKFy27Rb2+52A6P1pBneNJuuhd2Zo5584S0NFBIqEBnSIUKMnI8DgMtB0iRBT7HnOFz6l
	sTdDGgqiSIbUlN2lQXl26c2MkIwodB52+8gM1j9nZI9iWcR2NcLuICHfyg+QNEJy/s0qmFWH4Iaoe
	2aQ2MJpUTdkEVuZkfZZdQPCymtTUvca4f4u7Jc04eLgZ8tqFpKLikX4xjzrHs7MLUJ6zGn2NoJCW6
	RjmJoIwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Pph-00000000pBw-0LrN;
	Thu, 02 Apr 2026 21:44:09 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ppe-00000000pBd-1JMM
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 21:44:07 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 420E77A017D;
	Thu,  2 Apr 2026 17:44:04 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 02 Apr 2026 17:44:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775166244;
	 x=1775252644; bh=OYQnpeSzoHqE/ynjfzXJ1D5WN7qoO0KuXUY/6t2eV9s=; b=
	DMmqEN9LJwU6m6OMVajvyXqoA3+xsORQyUIMf1jEF/XgxjoQr7xmV6LsP55wzMKg
	yiqXSJ7yC/jbS0IHzxcCr5fJbaJZcam0P7E5sdGhwDwAoRlN8BLIBTzYX0XgX18P
	8Z7bYLwV0pPOSuCy9z+IeNGMbrNvHXNsMEtDw09lI7m0bwCCZQeNcSTQjCBVKK2g
	i3QOW9ic1D7DzWIpTQ0L1mV/AabBdnm3+QCv13iIjie04U1NaCNZvQGhRlzL8Jhk
	0Nrt86Q/eE5Q5B8ypHpPVpoOxqShkupPqWv2k9vAsElj2JViUCuaylDjaSZS8ywz
	CKkzM9hqu43O2rji/P2Bgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775166244; x=
	1775252644; bh=OYQnpeSzoHqE/ynjfzXJ1D5WN7qoO0KuXUY/6t2eV9s=; b=F
	rOjsqKrBxfhkRT7+s77dBlRZ16gLlgO5KU83UuqcB14SPqMewIhADV5z13LAQT+e
	olwj9uiLpJW8Txll/Mx3j2zHOWhMWegsM2tly2syVOJtC4t3K0DvvLQkxlyK0J4B
	STu1xvsq7Ya+pMrAJhQFmWSr3dufd3kOUPVXNKYQFpPJyRTiWPdqLxBCAxcjmGHI
	Ou6iu/cuNhRA5hrz7acIwZtPxTbaOb8aNSdtA8aLiNuPN0OxKnMoTNNJCtyeGlfj
	JeOo2Qkb0oFj/flIuOO4tBwQyiLk3tphh+xmOPxna/79bPi1GOKM3L98/7jR5X91
	7UHLXXVKIVFiCxiob0dlg==
X-ME-Sender: <xms:I-POabSNu7d0vgRDjY5BYmF2CVb2Jwy5PaBcpLObJ8Z2j7fU_MZVkQ>
    <xme:I-POaXnhqVHgwuD_8hQdcLueuP99dG_5gVy9rufuttHh4jWn4RE4KdkoUysEJBphK
    Db8aYsmI3Lg0rHWXu1G51wz-mtmUS28w4MWjHDdSF6EnXO4uY0v4lB6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepihhnohgthhhirghmrgesghhmrghilhdrtghomhdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehsohhphhhgoheslhhishhtshdrlhhinhhugidr
    uggvvhdprhgtphhtthhopehunhhitghorhhnpgifrghnghesohhuthhlohhokhdrtghomh
X-ME-Proxy: <xmx:I-POabT2NWajPAxYA0xneUgLH1zNW2z1dwNxUIAwfxHpIRoRGz5xTw>
    <xmx:I-POaXvhvxUoERQJMG5qRDvr_UnpPaxPORkuhtxeCFYNtzGuRRmuaQ>
    <xmx:I-POaf35szzbGLpLGzavim2sRFYZwO1afPzc-_FjJuK_IjtJLtOgXg>
    <xmx:I-POaQXDRGXbjEGsqk-uJkQDraDsX7vu68GkcbZx5FF4Sn6TNfId2Q>
    <xmx:JOPOaS0CBzvUmAUN_voBkRA9zXVJ9Amt5SNQH-kmmbvCAXokWzD_Wxo1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B3EE7700065; Thu,  2 Apr 2026 17:44:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AaZlO9rjbYwJ
Date: Thu, 02 Apr 2026 23:43:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chen Wang" <unicorn_wang@outlook.com>, soc@kernel.org
Cc: "Conor Dooley" <conor+dt@kernel.org>,
 "Inochi Amaoto" <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>
Message-Id: <f99471c2-4b7e-4475-af71-5c0ac4c92809@app.fastmail.com>
In-Reply-To: <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
References: <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_144406_713566_6D2D830E 
X-CRM114-Status: UNSURE (   8.60  )
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

On Thu, Apr 2, 2026, at 04:39, Chen Wang wrote:
> For CV18xx serials:
> Just a minor patch to replace the compatible for
> dma-controller to allow setting DMA channel number.
> New bindings and driver part change are picked by
> DMA subsytem and this patch handles the left dts
> part change.
>
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>
> ----------------------------------------------------------------
> Inochi Amaoto (1):
>        riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set 
> channel number for DMA controller

Doesn't this change break backwards compatibility with
all existing kernels?

I did not take this one for now, need clarification, or
a new patch that keeps the old compatible string along
with the new one, if that is possible.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
