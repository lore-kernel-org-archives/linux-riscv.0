Return-Path: <SRS0=OP9P=YR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85487CA9EAF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 06:51:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54FDD20856
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 06:51:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="opPVPCE7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54FDD20856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PEqQtL7D/bKDOL18QVJQsdt7egNvHFvJGHSMiseFi9M=; b=opPVPCE7NPLCby
	073de/VwkRyns7NoMIvUY2fB/4nC2BNqN82eZhXm2uztUvU7u3/JvWommwmIyvuorEIqcAGDKVe7j
	vNKnTY8LQCKqD+upGSoHjQAdkwee5xtYjuDutkE6ApQIr26GCb4Pl/ci6D+4AggsNUkllRasoknA8
	EmTWdGd7Zv8Yz7qAYYcXkusFi0a8CFOs3iP/R3eevhBjXfr6BIWc+ltSKDA8sjf+gj0GMVcrXK88a
	Lik55XAGU/wA9Iv3AqJyfASedBpSgGWi9QPJF/3EtVtm63nNQEoE4D+mEXUFEsMtSEcP3AeDk0tEC
	ZpJC/Gq1LBoKC8Bd8Bbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNWxx-0007W4-AX; Thu, 24 Oct 2019 06:51:25 +0000
Received: from inca-roads.misterjones.org ([213.251.177.50])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNWxu-0007V2-8J
 for linux-riscv@lists.infradead.org; Thu, 24 Oct 2019 06:51:23 +0000
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why)
 by cheepnis.misterjones.org with esmtpsa (TLSv1.2:AES256-GCM-SHA384:256)
 (Exim 4.80) (envelope-from <maz@kernel.org>)
 id 1iNWxp-0001iX-Si; Thu, 24 Oct 2019 08:51:18 +0200
Date: Thu, 24 Oct 2019 07:51:16 +0100
From: Marc Zyngier <maz@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] irqchip: Skip contexts other supervisor in plic_init()
Message-ID: <20191024075116.48055961@why>
In-Reply-To: <20191024013019.GA675@infradead.org>
References: <alpine.DEB.2.21.9999.1910231152580.16536@viisi.sifive.com>
 <mhng-aefb3209-29c4-46db-8cf2-e12db46d9a6e@palmer-si-x1c4>
 <20191024013019.GA675@infradead.org>
Organization: Approximate
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: hch@infradead.org, palmer@sifive.com,
 paul.walmsley@sifive.com, alan.mikhak@sifive.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, tglx@linutronix.de, jason@lakedaemon.net
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_235122_452298_C6EF3E7B 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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
Cc: jason@lakedaemon.net, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, alan.mikhak@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 23 Oct 2019 18:30:19 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> On Wed, Oct 23, 2019 at 03:07:10PM -0700, Palmer Dabbelt wrote:
> > > > +		/* skip contexts other than supervisor external interrupt */
> > > > +		if (parent.args[0] != IRQ_S_EXT)
> > > >  			continue;  
> > > 
> > > Will this need to change for RISC-V M-mode Linux support?
> > > 
> > > https://lore.kernel.org/linux-riscv/20191017173743.5430-1-hch@lst.de/  
> > 
> > Yes.  
> 
> For M-mode we'll want to check IRQ_M_EXT above.  So we should just
> merge this patch ASAP and then for my rebased M-mode series I'll
> fix the check to do that for the M-Mode case, which is much cleaner
> than my hack.

Does this need to be taken as a fix, potentially Cc to stable? Or is
that 5.5 material?

	M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
