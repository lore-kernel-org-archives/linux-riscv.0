Return-Path: <SRS0=eWHs=WI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710E7C31E40
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2019 17:55:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EA4B206C2
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2019 17:55:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DTdxhMrF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EA4B206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eidu2rWtc8uFpuzHf79BcpRQ2eRRTsuqdn6n6uxxF00=; b=DTdxhMrF6NFtDs
	j7hHPwVX3TZduSF46z7qM9dIASofdPY+uCYVKg49k9HRx+LCWzDlb9p5YWK7TnlVR6c0I/IY6qguv
	7n07+A4iSsQXyLPX2oEkyLeologVppmTj8aJDpLvIXa+fiyFno9LBIZNkOtrw6KlPrwt6duAEUyd/
	J7Q/XK5arwpYrEWZ1/w6bqnA8kdGfkrSmu3GVlovJ1CEUpSBF0BCWJTgqQjQCQZ1ch0mCq8KNciwd
	cXQX7nUOXUCl6tM9g8JeqeeSptSwMXcH6jaa72IhpQQlgW3yZ4iSHfr7VDv8cPebKkObyNb08sSWf
	hXtkRuRhNgVJwXkOZ9lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxEXn-00010I-6K; Mon, 12 Aug 2019 17:55:43 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hxEXl-000108-99; Mon, 12 Aug 2019 17:55:41 +0000
Date: Mon, 12 Aug 2019 10:55:41 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Troy Benjegerdes <troy.benjegerdes@sifive.com>
Subject: Re: [PATCH] RISC-V: Issue a local tlb flush if possible.
Message-ID: <20190812175541.GA23733@infradead.org>
References: <20190810014309.20838-1-atish.patra@wdc.com>
 <118B0DE7-EDCC-4947-88E5-7FF133A757D8@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <118B0DE7-EDCC-4947-88E5-7FF133A757D8@sifive.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 ron minnich <rminnich@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 12, 2019 at 10:36:25AM -0500, Troy Benjegerdes wrote:
> Is there anything other than convention and current usage that prevents
> the kernel from natively handling TLB flushes without ever making the SBI
> call?

Yes and no.

In all existing RISC-V implementation remote TLB flushes are simply
implementing using IPIs.  So you could trivially implement remote TLB
flush using IPIs, and in fact Gary Guo posted a series to do that a
while ago.

But: the RISC privileged spec requires that IPIs are only issued from
M-mode and only delivered to M-mode.  So what would be a trivial MMIO
write plus interupt to wakeup the remote hart actually turns into
a dance requiring multiple context switches between privile levels,
and without additional optimizations that will be even slower than the
current SBI based implementation.

I've started a prototype implementation and spec edits to relax this
and allow direct IPIs from S-mode to S-mode, which will speed up IPIs
by about an order of magnitude, and I hope this will be how future
RISC-V implementations work.

> Someone is eventually going to want to run the linux kernel in machine mode,
> likely for performance and/or security reasons, and this will require flushing TLBs
> natively anyway.

The nommu ports run in M-mode.  But running a MMU-enabled port in M-mode
is rather painful if not impossible (trust me, I've tried) due to how
the privileged spec says that M-mode generally runs without address
translation.  There is a workaround using the MPRV bit in mstatus, but
even that just uses the address translation for loads and stores, and
not for the program text.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
