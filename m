Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE3AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 14:24:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A0AF2087C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 14:24:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cRV0LGux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A0AF2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOqrdOyFHtzZxTvKINZPwws7Hge6QRIT04OEzGkavD0=; b=cRV0LGuxWtYmjV
	BRlGQaZTCl7aiUEVyaFCUygFRtUfKfHOwpQCaFyD6W7X+W+x7bqXtobDiLx6sWFvGpxR4YLLGijtO
	muDVJBxKVhz4goAnwhhMVB12YiXagwG8ohnbEZMCLNYDtUYgtd/LGIYjNu0QUFETl/1EXLrKURXKM
	WwuXlsUMJeLLkKRC+EtTClp3QyJ0UwAjVtEPbdWvkUC9BC3p3et1GQLoTPx40A5PtnaOI9wlH78CY
	5FVxaXcLrPDclPL6AhT3wdCyxjU/vooppzYZtjn6ob/8x+ZyTjsbDVYD1Gxorhi9Bj+Z54frEqGnR
	sUBS5+iYZI4MSNonFh+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2GQC-0001vv-3V; Fri, 08 Mar 2019 14:24:24 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h2GQA-0001vi-7d; Fri, 08 Mar 2019 14:24:22 +0000
Date: Fri, 8 Mar 2019 06:24:22 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH] riscv: move flush_icache_{all, mm} code to proper location
Message-ID: <20190308142421.GA32707@infradead.org>
References: <LO2P265MB0847855A503C55BB11A59A89D6730@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <LO2P265MB0847855A503C55BB11A59A89D6730@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 06, 2019 at 05:00:21PM +0000, Gary Guo wrote:
> Currently, flush_icache_all is macro-expanded into a SBI call, yet no
> asm/sbi.h is included in asm/cacheflush.h. This could be moved to
> mm/cacheflush.c instead (SBI call will dominate performance-wise and there
> is no worry to not have it inlined.
> 
> Currently, flush_icache_mm stays in kernel/smp.c, which looks like a hack
> to prevent it from being compiled when CONFIG_SMP=n. It should also be in
> mm/cacheflush.c.

The non-SMP version of flush_icache_mm should also move to cacheflush.c.

Please make this flush_icache_mm one patch, and the a second one on top
of that that just removes flush_icache_all and open codes the two
users.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
