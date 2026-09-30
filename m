Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E85CA5FC5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udpwYgvC6EiaRzHjdg3sdv6OHjJDM4MlDZZBQUy3IYI=; b=GXHVOKssfrRO5W
	5Gqaeur3FAVR3Fd9a57Uqx4FkdAy38OY3ZwLw/sCvsoQYq8cKpZl8Usv4Tl0ujwEA6upUULK2ae2y
	/qrT2PTuuCANa7G+Ou/ylQab5dUy3K+DaQBt5GaiUd3DlnGXOBlpMuU+MKslqiHFGQk/1ifA9z/qp
	8O/kbuC64Yh8Ftm3eEvYYJA9/hlWnEsFe8zxVqeDdZHoi1fCdDd6gT0zDFLuftxtBIs9WVWIHJOTK
	+DFS3tZxzfVQ5IzBqR9j1ALCXP5mj8tW0i2YimSqFYWsoAwCAQeHT0TYZl+5NQO0TfWH5nD/rpAab
	kNHtFuKklp8PRc71ZlrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuwj-00000006Dpy-1bx9;
	Wed, 30 Sep 2026 14:06:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuwg-00000006Dp0-1aa2
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 14:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z8s3bGJeeJqZuJkbjfTcGgrs2VSs73dz7rSX2XlTyr8=; b=LTzHSQyNTwquGTKUOS8Yy1mgSe
	btGTGQZ+UoeuaBsJTGt53GnjHql8OZvfk91EaPURFENO3OyNWtyW2LmOmrOj5aQ+7RZpB4uRRM1CX
	soBAf/WIVuWeXjDivwOslXVbTrBGpR2oLMQdKbtrIEyvzx4mwkgF6sCu7l6GdO2PoEhQdXFYqVgyO
	d1ZjYQfvTkeQtmxJPAZu9AIns8hu9QxlhG93M4b8RWrgtOe+hmnopLd3+YI7QF7PYRl4o5Tz4X3To
	WIfn90eyKHGxsMZ92Q1cfvYHwdsyrB1Ls+0Ydz21AU1bZ5lNEIFXCL1B/lttr3MPll6Ulvf96b8jp
	q3G2NXPQ==;
Received: from mout02.posteo.de ([185.67.36.66])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBuwd-00000003sqs-1i8E
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 14:06:05 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E775E240107
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 16:05:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790777147;
	bh=z8s3bGJeeJqZuJkbjfTcGgrs2VSs73dz7rSX2XlTyr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=SAHqxUi6lCbmYp932P1f2i/YrVBBZQ/P2YoNuXKzcnDZ69H9JfyTG4dw2Y9oavRDY
	 AELQS5IF9UeTg2VK1JZb5vZXFeh3lcR5vQZFeJZxvgcyNuoEB1qJVLW2go1WnvIC9P
	 3FajJYyMSjYaLSOsKNsQF3Nnk/OiwWHsMMOeTeFtANXyd7ub0zvBL4aTiqzmSB3oFl
	 sA8MHsz2FI0UYMP5Wg/5xnXS6IfLuMB/MnjdqdnQKb8xZQF45DllVNJ82h3qehLOXR
	 IjN6HokgmhsUtPXfZhrkpwIQKd3rAjwWcOI12MqTMnfmGwNF7h40Pm+pr5KAkkQihf
	 kW59komk6TUrg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hvxdy1xn9z9rxb;
	Wed, 30 Sep 2026 16:05:42 +0200 (CEST)
Date: Wed, 30 Sep 2026 14:05:47 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Bjorn Andersson <andersson@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Andre
 Przywara <andre.przywara@arm.com>, Bastian Germann <bage@debian.org>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware
 spinlock
Message-ID: <20260930160541.040ccc0e@posteo.net>
In-Reply-To: <20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
	<20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
	<20260927132707.5f484946@posteo.net>
	<20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_150603_621610_1608D119 
X-CRM114-Status: GOOD (  22.29  )
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

On Wed, 30 Sep 2026 20:02:21 +0700
Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog> wrote:

> Hi Wilken,
> 
> > Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspinlock" line to
> > the driver in the sun6i_hwspinlock_ids struct, drop
> > "allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and update the yaml
> > file accordingly?
> 
> Thanks for looking at it. Bjorn hasn't replied yet, so I looked a bit
> more at the naming. I'd like to keep the A31 fallback: it's the usual
> pattern, other blocks in this dtsi do the same (timer, I2S, LED
> controller), and Conor already acked the binding in 2/3. If Bjorn
> prefers a driver entry instead, I'm fine to change it.

Yeah, Conor was a bit quick to act here, such things happen often with patchsets
made out of documentation/devicetrees and code. Though, the get clock and resets
patch is fine. The driver could use some modernization.

> > Oh, and I may be able to test it against the D1, I own a Sipeed Nezha.
> 
> That would be great. You don't need FreeRTOS for it: I tested with a
> small Linux module that takes each lock and checks the status
> register. I can clean it up for the single-core D1 and send it.

Uhm, the Linux-only test doesn't work as a hwspinlock test, it misses the entire
point of the primitive. A hwspinlock arbitrates between two independent agents,
in this case, Linux running on the C906 core and FreeRTOS running on the HiFi
DSP, both sharing the same memory bus and other hardware. If Linux is the only
one who ever takes the locks, it is simultaneously writer and reader of the status
register, so the test cannot fail even for a broken (or fake) implementation. That
would basically test nothing at all, well, maybe it would be some kind of bring-up
test, but overall quite useless.

greetings,
Wilken

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
