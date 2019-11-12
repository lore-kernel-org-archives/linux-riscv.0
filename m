Return-Path: <SRS0=/vz5=ZE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76526C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2019 10:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C80521783
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2019 10:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n7mLKHgT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C80521783
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cb3/dXtGvaRcvLFHJmjVc48wUN/5BqIGBOAdheMYzys=; b=n7mLKHgT96zHsI
	dMsH3rYsWwlxXQx8UP4SB+NgSe9KccCnx6DmTT+2K4PIkssyQo4pGtc3Np0O3mYnZZdvee8h0jYf9
	nOEXQRzMC1/i0R47p86yDsikpaeHftowuaCsu+965MUmTOf4Z4/DfhyPPLKatkneguR/WiBWSONST
	jkSAEk58g5H/5PMc0EpgpEUwRg214XFyjyR9/iBSqZ5CsxPom2kY9VE3y2JvF/p+w0QHDHNNe7iBq
	TNL2SNgw+NHNfDau/v9r0HjaSylSFfF8nbWhHUpvoIPlZscl/yBdJZKYPk019LYV06+vZqsGf0edw
	fI0OjaPyBE97IArDl49w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUTZi-0004cl-4C; Tue, 12 Nov 2019 10:39:06 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUTZc-0004YT-SN
 for linux-riscv@lists.infradead.org; Tue, 12 Nov 2019 10:39:04 +0000
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iUTZX-0007yN-6G; Tue, 12 Nov 2019 11:38:55 +0100
Date: Tue, 12 Nov 2019 11:38:54 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/12] riscv: abstract out CSR names for supervisor vs
 machine mode
In-Reply-To: <20191028121043.22934-2-hch@lst.de>
Message-ID: <alpine.DEB.2.21.1911121137430.1833@nanos.tec.linutronix.de>
References: <20191028121043.22934-1-hch@lst.de>
 <20191028121043.22934-2-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_023901_072389_7871EB46 
X-CRM114-Status: GOOD (  11.03  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 28 Oct 2019, Christoph Hellwig wrote:

> Many of the privileged CSRs exist in a supervisor and machine version
> that are used very similarly.  Provide versions of the CSR names and
> fields that map to either the S-mode or M-mode variant depending on
> a new CONFIG_RISCV_M_MODE kconfig symbol.
> 
> Contains contributions from Damien Le Moal <Damien.LeMoal@wdc.com>
> and Paul Walmsley <paul.walmsley@sifive.com>.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

For those:

>  drivers/clocksource/timer-riscv.c  |  8 ++--
>  drivers/irqchip/irq-sifive-plic.c  | 11 +++--

Acked-by: Thomas Gleixner <tglx@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
