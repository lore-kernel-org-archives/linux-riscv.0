Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9B2C61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RcJE3DjOIgoq/RTiOVyibAVt7QxS9BkxccfiVzwAXyg=; b=ng6RnMFlkHmekr
	NVUfg08yl04liM5cp+bzD++E3X3b6RRxZkhdj0WErXfN5rqCahkIERCE5hHOmAV46/E6s0sf/gD7R
	0TKkHyOxSn8RugUxNPb8TE+P2juZbci7Rd9rveNyUo2/EahJ3Ec/9S3M7z1LzWVzegEIGUXffJLXi
	00BqsH1CVrzGrbxvSN/fJpxO8YiboyCfNzgf5WwUpKSYmJTg2lWEDmKH4U750a78+43zFCy3qdFi+
	FJ2eIU8TZfvg11H2dta+IHtdixVznZu0n7iY1k8lq4NtuWBo52aLbLbF6cICAbmjtgOvcny1A4YTW
	8FKm368c4NRhA3J4LiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXTV-002SZI-Cq; Fri, 24 Feb 2023 12:46:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXTT-002SYj-G0
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 12:46:56 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pVXTS-0004Jl-3J; Fri, 24 Feb 2023 13:46:54 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Cc: 'Jisheng Zhang ' <jszhang@kernel.org>,
 'Paul Walmsley ' <paul.walmsley@sifive.com>,
 'Palmer Dabbelt ' <palmer@dabbelt.com>,
 'Conor Dooley ' <conor.dooley@microchip.com>,
 'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 4/5] riscv: lib: Include hwcap.h directly
Date: Fri, 24 Feb 2023 13:46:53 +0100
Message-ID: <1845229.tdWV9SEqCh@diego>
In-Reply-To: <20230221185603.570882-5-ajones@ventanamicro.com>
References:  <20230221185603.570882-1-ajones@ventanamicro.com>
 <20230221185603.570882-5-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_044655_559758_731A14E4 
X-CRM114-Status: UNSURE (   7.91  )
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

Am Dienstag, 21. Februar 2023, 19:56:02 CET schrieb Andrew Jones:
> When using alternatives for cpufeatures we should include hwcap.h
> directly, rather than through errata_list.h. Opportunistically drop
> an unused include too.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
