Return-Path: <SRS0=nZh1=AT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06997C433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2020 14:57:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1EA72078D
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2020 14:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IQR3Li6e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="siEl9fgU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1EA72078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1Q7KEFV+tMU8soFoXFTMS5SknPyjroTBQwVWZNgGLJY=; b=IQR3Li6eVgx4cWa9mDvavfJC9
	TXcCcdVnvi6jcDaN7aKXoyuR1tgoa3wstqw+yC9hvvYgl6/vmS3DgidRhf7mGqNbV0k0BlI6QVNLG
	J4I3m8xE0ERN6R2aRYCyF4OYOa2ESBoiCHtWY4OSV5r+SdD74iBvJU5EpE4IvZe+AoMMF5/2D2g2V
	dJLvkOAASlE2cfCs1UuYrFHl2Z3RjX6KjfGUlHhmzcb8aSYAjkQM+Dte2ZK6JinOJ/PV7hi8AQSlV
	73RMlxO91ZVnU9H7yq+09qGyRlm50171ET08cqv7m8qfuSt44T0m3JRO3UuZ9JK4eKDZx4iQoelZy
	5byBZ1Tfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtBV3-0001wa-QC; Wed, 08 Jul 2020 14:56:41 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtBV1-0001wP-Cf
 for linux-riscv@merlin.infradead.org; Wed, 08 Jul 2020 14:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Eu/kYmb813u1ZgBXd0rdHnEokAFSGGHrxUlCHt8bJuY=; b=siEl9fgU4Uy0PenzYaRquRLGvb
 b1ZJK0+WjPwBiQRFzcuY61wsylkiuNmCkSoJAjH1N8epNxmvTh0l0+iQohckauW6bZEIAvjJqv0WT
 iTE7ljss9oefyA9LMa9JGNWjxdhPxQNXa+ka2XO+tKj2eFGPg5FkxGyoREbfxjxU3LtktWwmu7aw+
 j3c+NvZBzG4JYMbWqfzWZREYYvWMf5SZmNbdwIil3mv1t2W0XLhBjQkQ74r8PnF+8Sr371ZYwBnBh
 Rf4+KH+jLtzVmksfFrpBcni1mr2IN6rAjYC/+ggiRIkGPmDbXUrqwiVUMdXOBWZDNAchr7vxX5z+B
 SB6sIlUg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jtBUn-0000ln-DI; Wed, 08 Jul 2020 14:56:26 +0000
Date: Wed, 8 Jul 2020 15:56:25 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] riscv: use 16KB kernel stack on 64-bit
Message-ID: <20200708145625.GA438@infradead.org>
References: <mvmeepoddt1.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvmeepoddt1.fsf@suse.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 06, 2020 at 02:32:26PM +0200, Andreas Schwab wrote:
> With the current 8KB stack size there are frequent overflows in a 64-bit
> configuration.

Adding irqstack support would be the better fix..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
