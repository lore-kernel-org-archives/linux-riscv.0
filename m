Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F9DFF885A
	for <linux-riscv@archiver.kernel.org>; Sun,  3 May 2026 08:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfn1/q4+8F/IAVO5E8nKLGda0Wtox+9AXmKAofNojz4=; b=fLPxZiMUwfWjYi
	q563xWkuKp5ZFcS+Axmca6jOSFUWHu9IUzAOcaqY9t163DFKQt7nn/PoCgYLhp5ghV98r4SNhL0oX
	EuoHhbKbv4f9ryqGpR3b9Nt64rBJXtRpzIH4XkWYKEuh9GT4jxVgMwYQDxbcyKm80z08voHWnZwFZ
	k9kqJ3JlVCSX3LAQ00ZshGTpt9v+M2dOq5EQy19uueL/6yxwEYiRmxom+zDY/VJNh0uIO6z2BtBV1
	L1Xn0d0EDAzPC61cWKVCqe8ETPaKdi3JYgObNHTLpM0WMyVXG2h7qk+ZMstl9X62CmbBxmCVlTgbs
	blBEGbAA5mtn9M+dS7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJSYj-0000000AgPA-1Wsg;
	Sun, 03 May 2026 08:52:17 +0000
Received: from mailout2.hostsharing.net ([2a01:37:3000::53df:4ee9:0])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJSYe-0000000AgNq-1v0g
	for linux-riscv@lists.infradead.org;
	Sun, 03 May 2026 08:52:15 +0000
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 4E9B41058A;
	Sun, 03 May 2026 10:52:06 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 38258600D2F5; Sun,  3 May 2026 10:52:06 +0200 (CEST)
Date: Sun, 3 May 2026 10:52:06 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Han Gao <gaohan@iscas.ac.cn>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kees Cook <kees@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
	linux-pci@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: Add quirk to disable PCIe port services on
 Sophgo SG2042
Message-ID: <afcMtlBJYeuxSqZr@wunner.de>
References: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
 <20260331175658.1015829-3-gaohan@iscas.ac.cn>
 <q6wmn67lzk5c2pgmgkoezcvy3xj3yqecg675gx7xyrw3amjwpi@5pjla6j3krbv>
 <0f42afefd9322779af5463b696c55b08d2296ea8.camel@iscas.ac.cn>
 <afZUxYhkCQ0wG0Uu@wunner.de>
 <68d4a49bf1df785ae906fbc2dd16e64b667ca5f0.camel@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68d4a49bf1df785ae906fbc2dd16e64b667ca5f0.camel@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_015212_665505_11D498B7 
X-CRM114-Status: GOOD (  15.46  )
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

On Sun, May 03, 2026 at 03:10:58PM +0800, Icenowy Zheng wrote:
> It's used in multiple products, but only one of them (EVBv1, which is
> just an early EVB available for a few people including me) lacks an
> onboard switch, because SG2042 is short on on-chip peripherals. All
> other devices (including two mainlined ones, EVBv2 and Milk-V Pioneer,
> and unmainlined dual socket rack servers; Milk-V Pioneer should be the
> most popular device because it was on shelf) have an onboard switch to
> mitigate the lack of on-chip peripherals in SG2042.

Who knows, maybe someone will design a product which doesn't attach
a PCIe switch to the SoC, maybe the lack of peripherals isn't a
problem for them.

It seems reasonable to accommodate such non-switch use cases as well,
so I think you definitely do not want to quirk all products using that
SoC but only those that need it, regardless whether it's the majority.

> > My point is, you want to constrain this to a specific product, not to
> > the SoC.  Can you maybe solve this by not specifying interrupts in
> > the devicetree for the PCIe switch?
> 
> The PCIe switches are not described in the device tree at all, because
> they're all just discoverable; can we describe them in the DT and
> redirect their interrupts to void?

Yes, somebody did a writeup how to represent switches and endpoints
in the devicetree:

https://farlepet.github.io/linux/2024/02/20/using-linux-device-tree-with-pcie-devices.html

And then I would try providing an empty "interrupts" property for
those switch ports for which you want to avoid port services being
instantiated.

That way you could selectively *enable* port services for specific
ports where it's useful.  Let's say you need DPC on a specific port
to contain errors of an attached NVMe drive.  Just assign a single
MSI for that port and assign no MSIs for all the others.  Much more
flexible than globally disabling port services.

Thanks,

Lukas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
