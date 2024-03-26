Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E9BC54E64
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 00:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uAzWjrNwWOm3PL/XyqSUnX0nhZDFoQM1DrVYi9PvdU=; b=WwkFk52hyMBVVT
	FLb9f7ljSkeZeVwJLQm4ZVZFKFspGUIQrWmKoAS88NZQSrIw6g3e3unaSJFwtDA38foIxHnIwAqXP
	4bmSXYbiTrvkLzjuk16O0vb2G/6eBRZy+Mly74J7nSCPkqId+C6hj2Kkb9m3IT6W01X4xGX9RvSmf
	0C+UxpHw8GAU39a+3rnKxoWmeZ6q7MCOhoUTD8NcJvvkS9WlrSoxrSs/1RqiuRb1o8Q94+quPQXSj
	VN2LosK20dGUSueDAIzm+q00KBHDrZEe1NG1ySn7qQB+LtuzTbOkk+OrZeL2Mps/8pyS2sdxaT4fq
	YdJU73Zu94re/tZ2GdYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rouo8-00000002Vpk-2mpp;
	Tue, 26 Mar 2024 00:36:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rouo2-00000002Vob-1J2w;
	Tue, 26 Mar 2024 00:36:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B7113611D1;
	Tue, 26 Mar 2024 00:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84803C433C7;
	Tue, 26 Mar 2024 00:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711413405;
	bh=r6ja1S3WkmxWys+sE3KabUy5bKAQKHZGyKXel35g+zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFOy9SckrUmOjcVY80p+Bpxbe+5dpDJq+JeaQvIywXepTed1YRXnEepoqUkHhDLDv
	 KZQ8orGHJmcfhxU4yqXzvKwkkh03GuDsm5VknrzWZxwAeC8moegodFxeAFmHcguP3V
	 MvMXRlBgmBX55pjBPgOUTWQbK7zrjPHUR7Ivk7miBmPv+gpyP5Ja8S02vD6UZnj61n
	 CqfQ4NXy/CKPT7KniveufUJdSfosIbl7mM5+gISfC65C9eTYs21OyRMfhMeYTy9MAj
	 ov2d24lOwn4Oj/ZJVUPrXNuEHsLe2pES4uVY1T8XSrKZegQunB7Zn3qmkn816MOaQo
	 yZPbuVAYSRHAg==
Date: Tue, 26 Mar 2024 01:36:41 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, asahi@lists.linux.dev, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-actions@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	openbmc@lists.ozlabs.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 00/64] i2c: reword i2c_algorithm according to newest
 specification
Message-ID: <j2l7tu24itjelylrgwe6gdsy3mfrw3dnve4rdofmri3z7xdroc@se56t5ylmdak>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <ug266trshvhhbsln3eoh53fmsuj3l63ziz6gavcl7rv2jhjr5t@3av5givh5n7m>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ug266trshvhhbsln3eoh53fmsuj3l63ziz6gavcl7rv2jhjr5t@3av5givh5n7m>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_173646_599075_32BD0A40 
X-CRM114-Status: UNSURE (   8.26  )
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

Hi Wolfram,

> > @Andi: are you okay with this approach? It means you'd need to merge
> > -rc2 into your for-next branch. Or rebase if all fails.
> 
> I think it's a good plan, I'll try to support you with it.

Do you feel more comfortable if I take the patches as soon as
they are reviewd?

So far I have tagged patch 1-4 and I can already merge 2,3,4 as
long as you merge patch 1.

Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
