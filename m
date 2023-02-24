Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D90C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUGLQee1CSLvnbVtgFJ8OAfy+dcctz81kPf6CNlI8ZI=; b=ZkpTFj1psET/Lj
	EfX4NV7zfb0EXPwNwMEbhOy4w3guB0ibbRn/Ms88ZwOW0CROTD3xU0HvK9cO8BiizyokLe1gwL8mG
	G5jNU7yNZUZ/zQKGsx7TYbQIjQgUv5zcKz31V1jOqVko2FYd6es7zUgnIHypDX/oYY87J1WY3W0Ul
	NCra3L0PRvEy+fVJm0YjHfH9aiyE1Iul3ioJ5iwIwJpz7ZPz3gWTdvMFShWDtc9ayMkFMCAMybpt8
	L0OaVmwE85Xnogp9q4ra5JzHtIrIbvUu/W1BfJNH5p5hEIgyTwjuNUC6tx73CC8fZYGVuDK1DAq9Y
	HlKgfnU0Yx+FT0pDALyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXQj-002S9t-Sf; Fri, 24 Feb 2023 12:44:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXQg-002S8q-EV
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 12:44:03 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pVXQe-0004Il-Lu; Fri, 24 Feb 2023 13:44:00 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Cc: 'Jisheng Zhang ' <jszhang@kernel.org>,
 'Paul Walmsley ' <paul.walmsley@sifive.com>,
 'Palmer Dabbelt ' <palmer@dabbelt.com>,
 'Conor Dooley ' <conor.dooley@microchip.com>,
 'Albert Ou ' <aou@eecs.berkeley.edu>
Subject:  Re: [PATCH 2/5] riscv: alternatives: Remove unnecessary define and unused
 struct
Date: Fri, 24 Feb 2023 13:44:00 +0100
Message-ID: <4809981.31r3eYUQgx@diego>
In-Reply-To: <20230221185603.570882-3-ajones@ventanamicro.com>
References:  <20230221185603.570882-1-ajones@ventanamicro.com>
 <20230221185603.570882-3-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_044402_518261_5C453521 
X-CRM114-Status: UNSURE (   9.74  )
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

Am Dienstag, 21. Februar 2023, 19:56:00 CET schrieb Andrew Jones:
> A define and a struct were introduced with commit 6f4eea90465a
> ("riscv: Introduce alternative mechanism to apply errata solution"),
> which introduced alternatives to RISC-V. The define is used for
> an arbitrary string length, specific to sifive errata, so just use
> the number directly there instead.  The struct has never been used,
> so remove it.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
