Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C33C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 09:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaD0J33Caqpk5BOUsDFNjDSgHLR5SgDUCmP5qjlTc3k=; b=IxsWlU5eVzDYNh
	xFDA5r9T7QPUIJWYTVyxNh8ANiCBTsMYguGzrh+cJOEOu6l9iLXVJ4p0zM0YdEZwL9cYtKpMIhhkA
	ZQBA5aRcEOvW+Rf5KY2t+vf6jIz4UG35TgItFzP2djQrcGP9t3kYunctiie5T05T2EfXgHN006PaY
	Mmkk55GfPzkyP9EIbIn3sHy1veitqxeOAvKQTjNhvrLdhqDQRRGNHf+wCAvfteWaO9QFG5PAaqBFG
	+vYepgjOw92gtavPU2rGHOJKW4qIqaqBaZr6UX7pn84AoEq8pmezfzr2baVj/oxMsXwklQj/kDWNY
	Wq/TPa6Q66TzNdY285/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JRA-00F3UG-4g; Wed, 30 Nov 2022 09:31:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JR6-00F3ML-H1
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 09:31:25 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0JQt-0000pA-Ob; Wed, 30 Nov 2022 10:31:11 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, prabhakar.csengg@gmail.com, Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v2 1/4] riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2
Date: Wed, 30 Nov 2022 10:31:10 +0100
Message-ID: <4164845.BddDVKsqQX@diego>
In-Reply-To: <20221129150053.50464-2-ajones@ventanamicro.com>
References: <20221129150053.50464-1-ajones@ventanamicro.com> <20221129150053.50464-2-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_013124_623162_F990C02C 
X-CRM114-Status: UNSURE (   8.84  )
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

Am Dienstag, 29. November 2022, 16:00:50 CET schrieb Andrew Jones:
> Build __ALTERNATIVE_CFG_2 by adding on to __ALTERNATIVE_CFG rather
> than duplicating it.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
