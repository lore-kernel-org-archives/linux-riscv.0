Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0B1C83026
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 17:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPn15aNrYgnmlDzG3maC9pLQumqYJKqmP5601edwciE=; b=pZ2RUqSk0AaXFe
	IaumdoN1nM7hpbmHL9UuLL/5jqpNMGzB2nOqx9vM5FY0s10/0lrilGEOiSRB3P3pWPEn9GcMZmXH+
	yfLqjriBSvyJ2HvLfyXPTsqa2FuyYlcgqGzxHziQ0nz8KLKjnm87IPnjdPtkgsFk39SotPmS+hgnq
	RVwDYSkdgjj77Tv0b7LZmYsfJFniu/0+3/MH50VZMN2UVhovXwS+KXJpXrEO9qPkILDAuytJr429m
	+LlQjrY4HEkBEpgqke4RUNqW1dpKCaUGeO5WLOXY6MgDACjugPypomTVPepB78m+dONKvk6osZD+G
	5TgSmaMmhRzrozFWHk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCnp-0000000FOr1-0wIB;
	Fri, 27 Jun 2025 17:23:53 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBlt-0000000FESY-2Wyk
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 16:17:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBlq-0001D5-HK; Fri, 27 Jun 2025 18:17:46 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBlq-005e4l-16;
	Fri, 27 Jun 2025 18:17:46 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBlq-000QKf-0s;
	Fri, 27 Jun 2025 18:17:46 +0200
Message-ID: <961297baada69d3a9df0885e8021051d9bf16304.camel@pengutronix.de>
Subject: Re: [PATCH] reset: mpfs: use the auxiliary device creation
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Jun 2025 18:17:46 +0200
In-Reply-To: <20250611-rst-mpfs-aux-v1-1-c86534b473c3@baylibre.com>
References: <20250611-rst-mpfs-aux-v1-1-c86534b473c3@baylibre.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_091749_637964_B6623460 
X-CRM114-Status: UNSURE (   5.84  )
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

On Mi, 2025-06-11 at 12:06 +0200, Jerome Brunet wrote:
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
> 
> Use it and remove some boilerplate code.

Applied to reset/next, thanks!

[1/1] reset: mpfs: use the auxiliary device creation
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=9d33595c0227

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
