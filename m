Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F343C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 09:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZmxSmhnUBqunT1vEZT9H6S5QAS5pFVgF/bTG331PWc=; b=KcD9EXVBzih+9E
	oRXhBnwykR5Ifft3iRmJz46syE5qDii9UQB3S7G4r5CY26vrIf9pS+5vKzM/E9Mgd+aiUF2mI7LkL
	IToyqiE+f+tIglhEjpNMvPTgtPk9XtXqBkuSj/QTi1t5OLWkGtNFddpxRzQRfcHpa1c86Q0bPLX1c
	Hq79Q3+UzK0gxGa8AwBkorQwHkg5F/vsIz0Iwi5226rChIOdeevUb88W/4ReFINblExJbHrfspQoj
	FQ+d5e3fAicHQtSriYRbX0B6fcrcBUcKAJEHVNd8vTYtHyn8mQaVuAWC86tOjTFLZdkLknAuSxTRG
	pRsq3ZoLVhqS3gB43z9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JY7-00F7b1-Oa; Wed, 30 Nov 2022 09:38:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JXF-00F6tr-1I
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 09:37:46 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0JXD-0000qe-0q; Wed, 30 Nov 2022 10:37:43 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, prabhakar.csengg@gmail.com
Subject: Re: [PATCH v2 2/4] riscv: alternatives: Don't name unused macro parameters
Date: Wed, 30 Nov 2022 10:37:42 +0100
Message-ID: <10634857.rMLUfLXkoz@diego>
In-Reply-To: <20221129150053.50464-3-ajones@ventanamicro.com>
References: <20221129150053.50464-1-ajones@ventanamicro.com> <20221129150053.50464-3-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_013745_124999_1CE9F702 
X-CRM114-Status: UNSURE (   8.68  )
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

Am Dienstag, 29. November 2022, 16:00:51 CET schrieb Andrew Jones:
> Without CONFIG_RISCV_ALTERNATIVE only the first parameter of the
> ALTERNATIVE macros is needed. Use ... for the rest to cut down on
> clutter. While there, fix a couple space vs. tab issues.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
