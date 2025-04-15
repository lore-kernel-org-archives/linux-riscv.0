Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B358C369B4
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8NwR5KqdCmz0RclvnD2F0q85G4iyJbP80AjrwZ2BW8=; b=k85ki7eJ7kbZQo
	DO3C4AJKoJkVjbnt8wqdKjB1fOnZ0eQ6zYLOEnTN1zcu5eBNrRdpxBnLbMawCa4niXkKz33pNmZcL
	SiriLxVeHZX0AYMDxG595t3GNk/s/XFr2YECXuHcVm9r46vbYqtuc+DJpEHEk4RsgpVESPjeMUBDF
	WM5fuvmXZC0Jwm5f3cR6NGZWOxhcArc7tJwr1IfrClEIgmG6WUJe09lEXO1K999j7GTQXZtC2d5JO
	svbxEvOEU+5D7QkWEMy+Pew755aQO/y/L1CAM7O4mXzAlkUY+cetwVqCLmd1dAEDVzLSQD28+JWm2
	NrSESuLYTBKLRkuYE0uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cAU-000000055Q1-0cLj;
	Tue, 15 Apr 2025 09:01:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4c2v-000000054LF-11Af
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 08:53:34 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4c2O-00072J-DA; Tue, 15 Apr 2025 10:53:00 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4c2L-000OEt-1G;
	Tue, 15 Apr 2025 10:52:57 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4c2L-0004e1-0w;
	Tue, 15 Apr 2025 10:52:57 +0200
Message-ID: <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional
 property resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Conor Dooley <conor@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org,  paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr,  dlan@gentoo.org, drew@pdp7.com,
 inochiama@gmail.com, geert+renesas@glider.be,  heylenay@4d2.org,
 tglx@linutronix.de, hal.feng@starfivetech.com,  unicorn_wang@outlook.com,
 duje.mihanovic@skole.hr, elder@riscstar.com,  linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,  spacemit@lists.linux.dev
Date: Tue, 15 Apr 2025 10:52:57 +0200
In-Reply-To: <20250411-confider-spinster-35f23040d188@spud>
References: <20250411131423.3802611-1-guodong@riscstar.com>
	 <20250411131423.3802611-2-guodong@riscstar.com>
	 <20250411-confider-spinster-35f23040d188@spud>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_015333_278730_DBB3BB54 
X-CRM114-Status: GOOD (  13.45  )
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

On Fr, 2025-04-11 at 17:44 +0100, Conor Dooley wrote:
> On Fri, Apr 11, 2025 at 09:14:15PM +0800, Guodong Xu wrote:
> > Add an optional resets property for the Marvell PWM PXA binding.
> > 
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > index 9ee1946dc2e1..9640d4b627c2 100644
> > --- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > @@ -31,6 +31,9 @@ properties:
> >    clocks:
> >      maxItems: 1
> >  
> > +  resets:
> > +    maxItems: 1
> 
> Do any of the currently supported devices use a reset? If not, then add
> this in tandem with the new compatible and only allow it there please.

Also, if spacemit,k1-pwm can not work without the reset being
deasserted, mark it as required.

The driver can still use reset_control_get_optional.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
