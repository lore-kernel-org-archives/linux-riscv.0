Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A859BC388F2
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 08:50:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D12CD2071A
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 08:50:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lx0tGDI0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D12CD2071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fKnPFlKV9ni1gXrqbIys/Lwum8qfOVQrgXNQOBioFHc=; b=lx0tGDI0806TLPY3l5ziR36VH
	Z+r/tEDAYDR/bnSY0FT0RzADobMCcUC+XQXSJ91dIUua4ePZ3LKPoF0+k2HdUQheSj3wqVCjXZtFw
	2i+FmiAfeyTeyAo39XLfHu65FrASj29Kh+Jzpov6sSlFCPB1eV8VOQkJ0Qb4GAPWBWd6nlEnwoEBi
	xiu3zd2ytCjrPj2ThwU71xhgIDL7PGZcgQopvYELeC+a/j0rPfVcuy6RXMc2xGygIjOYngCk5cZMJ
	+z2YRsBgn0JiQ+Gu6STzydk/95xvCzvrghvz3EYDMu9Nb5C7q6+T7TAZSj9U7muJ/BBGOUwngzHSY
	MpW3NOgew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZs1P-0006Ti-Ao; Tue, 03 Nov 2020 08:50:31 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZs1K-0006Sv-9x
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 08:50:28 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 44CA467373; Tue,  3 Nov 2020 09:50:23 +0100 (CET)
Date: Tue, 3 Nov 2020 09:50:23 +0100
From: Christoph Hellwig <hch@lst.de>
To: Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH] riscv: uaccess: fix __put_kernel_nofault()
Message-ID: <20201103085023.GA14092@lst.de>
References: <20201102073052.199638-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102073052.199638-1-changbin.du@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_035027_940892_0E53EEF6 
X-CRM114-Status: UNSURE (   6.35  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
