Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369D8CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlJYRx84ss8jvUED+f/1/YLU5aFk1VBlHP+U8inIAVs=; b=KFx+9qxbknPklr
	rUd7eaujw6EhUUhVqikHKv5QUCjxGqftFUfWACeT2nZ/rd2vIwXDP9qKfqtipZ1V4Q85QjintchV6
	ib/vT46LOMHHOq1YJ//giMdCGNUa9JqZeLzuBrIcnn7//5xoxD/XgggJNz64wXmWDYOvoLAnoWYLV
	m3nlG97nBP6qqKu0KZPatl5BG+MsALvNz52mn0Mq6pS6ZmTJXQfzmcV00rz51U90IT4RCaUFGIVR/
	G/IVSgiEiZ147aLk3SBHPAwagJJD1a4zWTcKRF7X0IaptJwYL3dNxA0ItJcD1EmSWCYMb98AIZ1bq
	VlPjYtVlGu1Y462rApfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUg7l-0000000EUPT-2g6c;
	Wed, 03 Jun 2026 07:34:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUg7i-0000000EUOt-28uD
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:34:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUg7V-00031I-0c; Wed, 03 Jun 2026 09:34:33 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUg7U-000sTs-0R;
	Wed, 03 Jun 2026 09:34:32 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUg7U-000000001Jh-0ETg;
	Wed, 03 Jun 2026 09:34:32 +0200
Message-ID: <62e1781e127176294088cee9c120b3173359ec4b.camel@pengutronix.de>
Subject: Re: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Guodong Xu <docular.xu@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>
Date: Wed, 03 Jun 2026 09:34:31 +0200
In-Reply-To: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
References: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_003446_547307_43CCC8A1 
X-CRM114-Status: UNSURE (   6.82  )
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

On Mi, 2026-06-03 at 06:26 -0400, Guodong Xu wrote:
> Add a MAINTAINERS entry for the SpacemiT reset controller driver
> (drivers/reset/spacemit/) and its reset-ID header. I intend to
> maintain it: the K1 and K3 instances now, and future SpacemiT SoCs
> that reuse the common code.
> 
> Link: https://lore.kernel.org/spacemit/20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com/
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
