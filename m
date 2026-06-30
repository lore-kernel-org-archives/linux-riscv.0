Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581ADC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 07:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8EbCr1/COvxOnpi5OQaU6ohIIlyHVeqP0Rh6SAg9M5E=; b=xV1qAPYfXFNAys
	ORJYW8Y6+lae45kwSanxQDAw16bH+At+u+o9Fn6GpTNQ4fQyW9Au2F2EsisZrAw3c7x5TbJo9sOzk
	5Zjh4e+R7dTw0LTGhhLHmogw48fAgp1ewKqFzi6tutdf6TxXMFGsrwqfvx8h2NdEFgFUh6BE1fcx0
	xbOcVx24Le8u/sbOzEswVxt4Gf9lcsikYDxBaQLSG8WI0xNgcjfFqt40wFcEOyCzOYokWqgKlGeby
	G7E8yt0M7VO/X7qZ32qn9leu9rqKBK/jVPt08Z0IGlD3Q/2+cjO7H026L4uJH1K/P73VTbWSTPXTW
	WXc7rT5yu5eRzV2ZX/xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSoY-0000000G5mj-1Tkf;
	Tue, 30 Jun 2026 07:23:26 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSoW-0000000G5mJ-0Jks
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 07:23:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 8811E2007C0;
	Tue, 30 Jun 2026 09:23:20 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1weSoS-005NFc-1V;
	Tue, 30 Jun 2026 09:23:20 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1weSoS-000000002RU-1a3o;
	Tue, 30 Jun 2026 09:23:20 +0200
Message-ID: <0ccf83ca31fe30a77099aafd8fae31e75fd276e3.camel@pengutronix.de>
Subject: Re: [PATCH v5 4/6] reset: anlogic: add support for Anlogic DR1V90
 resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Brian Masney <bmasney@redhat.com>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley	
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Date: Tue, 30 Jun 2026 09:23:20 +0200
In-Reply-To: <akLcbHYKJfvZzf27@redhat.com>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
	 <20260514-dr1v90-cru-v5-4-34f3021aab51@pigmoral.tech>
	 <akLcbHYKJfvZzf27@redhat.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_002324_273366_8A5FBD0D 
X-CRM114-Status: GOOD (  14.81  )
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

Hi Brian,

On Mo, 2026-06-29 at 16:58 -0400, Brian Masney wrote:
> Hi Philipp,
> 
> On Thu, May 14, 2026 at 05:27:20PM +0800, Junhui Liu wrote:
> > Add reset controller support for the Anlogic DR1V90 SoC, which is an
> > auxiliary device associated with the Clock and Reset Unit (CRU). All
> > resets are active-low.
> > 
> > Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> 
> I don't see a Reviewed-by or Acked-by for you on the reset portion of
> this driver.
> 
> I'm gathering a pull for Stephen for various clk drivers that were
> missed during the last merge window. Does all of this usually go in via
> one tree?

When both clk and reset drivers depend on the dt-bindings + headers
patch, often all of it is merged through the clk tree. For this,

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

> Or Stephen merges the clk part, you merge the reset portion?
> Who usually merges the dts changes?

In most cases clk is the platform device, and reset is just an
auxiliary device. So if I can merge the reset driver on its own, dts
usually goes with clk.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
