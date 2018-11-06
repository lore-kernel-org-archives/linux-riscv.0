Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD84C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 06:56:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5608320827
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 06:56:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LmdGEwFy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5608320827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/lgRkwDDdQJYbfhhteirYP6rMWLjXdLSU4DbRecWsc=; b=LmdGEwFyj32keS
	eCBGDsjzsGQWBJevvrbhBzKc+B7LvpfVvCyyJjWvEo/cLuuhpOiwz4pqy63g8usF6BeNO/YRvZqGA
	0KRCzRJEX1dfuRVvOrzM0pBdYhirMBwtG8ivf67iyQdsW4GeT99S7lVRedaHSr/wczbu2zEIpnwct
	B9lSBrU0L27gfX4QCzJvJm3M4zMCIi/PwwgfpJIQPqZj3zba+RKy5icG5WpTs0SuPk3aRqBqEIv+s
	jTZQI5HZ4jzBZlB9Hou+WOu3Jl58inXac5+tCZ2EGYWRsGRz2or7RHvM+th1QD3MbuLcc4E71cpSh
	Sg8VbTrF006HT0MZuqCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJvID-0004nq-3J; Tue, 06 Nov 2018 06:56:53 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gJvI9-0004nh-QB; Tue, 06 Nov 2018 06:56:49 +0000
Date: Mon, 5 Nov 2018 22:56:49 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
Message-ID: <20181106065649.GA13526@infradead.org>
References: <1540982130-28248-1-git-send-email-vincentc@andestech.com>
 <cac10a0961274e3ac4674e945f9d9e90@mailhost.ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cac10a0961274e3ac4674e945f9d9e90@mailhost.ics.forth.gr>
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
Cc: zong@andestech.com, aou@eecs.berkeley.edu, arnd@arndb.de,
 alankao@andestech.com, greentime@andestech.com, palmer@sifive.com,
 linux-kernel@vger.kernel.org, Vincent Chen <vincentc@andestech.com>,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106065649.DSQS4MdRPGGq0fTxEpLshMlUkDIXkWJ8jZfb8vDAygs@z>

On Mon, Nov 05, 2018 at 09:39:29PM +0200, Nick Kossifidis wrote:
> a) By directly modifying your custom CSRs, it means that we will need
> compiler support in order to compile a kernel with your code in it. This
> will break CI systems and will introduce various issues on testing and
> reviewing your code. In general if we need custom toolchains to compile
> the kernel, that may be unavailable (vendors will not always open source
> their compiler support), we won't be able to maintain a decent level of
> code quality in the tree. How can the maintainer push your code on the
> repository if he/she can't even perform a basic compilation test ?

And that (besides avoiding the wild growth of extensions) is the major
reason why accepting vendor specific CSRs or instructions is a no-go.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
