Return-Path: <SRS0=RYOb=WR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E09C3A59E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2019 14:46:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8E14206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2019 14:46:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RTFe2xAE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8E14206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xohj3CooOIbJZFsw0NIc3BH4oOPyrYsOI8z5Kcsipfw=; b=RTFe2xAEdsW9Vq
	IrvUGgV3tYBLnXQ7cth31UIgJdvhiv9FuCT1tIH7cjf94qlgcC3M1pZ5QxQjFA0/z8qLVa7AcyFUV
	OODJv+P7hnnIbWkZv75vnb6/JpKZ/ji48f7jA8Tt7qPx6IWZur8OfhF5CYah4GUQ87C9DvirRneCC
	mtN9BgjIx2H1BIESbf6TumDfJuNyU4ibg8O4jcBSS4+q1g5BIZdMbFqHwgopz9VxyYyGefgJvOMDQ
	Gmx/Kg4un8Rkv/6SgPmj08DENvmDIarTdsVcPxKBSSJMIur7gMWXyntthvDUwSUGX6M37kgQTuknS
	AoPlyx6CR11lycnlw29w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0RsJ-00081s-Jc; Wed, 21 Aug 2019 14:46:11 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1i0Rs0-0007h8-PC; Wed, 21 Aug 2019 14:45:52 +0000
Date: Wed, 21 Aug 2019 07:45:52 -0700
From: "hch@infradead.org" <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [v2 PATCH] RISC-V: Optimize tlb flush path.
Message-ID: <20190821144552.GB4925@infradead.org>
References: <20190820004735.18518-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820004735.18518-1-atish.patra@wdc.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 "hch@infradead.org" <hch@infradead.org>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Btw, for the next version it also might make sense to do one
optimization at a time.  E.g. the empty cpumask one as the
first patch, the local cpu directly one next, and the threshold
based full flush as a third.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
