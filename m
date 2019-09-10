Return-Path: <SRS0=VX3L=XF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B630C3A5A2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2019 06:00:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30CA521928
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2019 06:00:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CGONIUP2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30CA521928
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DM4jlpfQmlnBhxcsCYn0eN1n5QsE04hsV5ttCaRj9fM=; b=CGONIUP2HXQ0QR
	utfIL+NI+o0GPeeiSN50n6aCvGpSVEPIyCSI90u+bu9URTPMYVpAbcr8o9kzLotaJ5+DQObAXFSzP
	1YhcMCUAsM4r8D7d0pjIYhOWJl6Ht6DzjfwLK5evP022fB4afXo8Vbzft/wM8itBerplAdeg9jaiK
	3PXd9yjgqWSlkaD3QE7PYDmqZaFUJZ2hQ4xXYhWXE5KyGhCTL4DS4yLPXzFcqyWc2Ygj86dIfTGuW
	EonySo/bZpniq59EXeWy5HqfSk8DKHxbTuynqRjjN3IbcPIMt6J6aKK8FoEtGVxWavj/RSg5OToM0
	pElA0nRbaHeboFMSyLjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7ZCG-0002nJ-Li; Tue, 10 Sep 2019 06:00:12 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1i7ZCE-0002mj-RI; Tue, 10 Sep 2019 06:00:10 +0000
Date: Mon, 9 Sep 2019 23:00:10 -0700
From: "hch@infradead.org" <hch@infradead.org>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [v5 PATCH] RISC-V: Fix unsupported isa string info.
Message-ID: <20190910060010.GA6027@infradead.org>
References: <20190807182316.28013-1-atish.patra@wdc.com>
 <20190812150215.GF26897@infradead.org>
 <3fb8d4f0383b005ecd932a69c4dd295a79b6fb1a.camel@wdc.com>
 <20190818181630.GA20217@infradead.org>
 <67e670a4600d7dc7ec3c7a7374e330b9a1dbe654.camel@wdc.com>
 <4615b682352a2e67094d327fa058ec7dd287423f.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4615b682352a2e67094d327fa058ec7dd287423f.camel@wdc.com>
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "johan@kernel.org" <johan@kernel.org>, "hch@infradead.org" <hch@infradead.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 06, 2019 at 11:27:57PM +0000, Atish Patra wrote:
> > Agreed. May be something like this ?
> > 
> > Let's say f/d is enabled in kernel but cpu doesn't support it.
> > "unsupported isa" will only appear if there are any unsupported isa.
> > 
> > processor       : 3
> > hart            : 4
> > isa             : rv64imac
> > unsupported isa	: fd
> > mmu             : sv39
> > uarch           : sifive,u54-mc
> > 
> > May be I am just trying over optimize one corner case :) :).
> > /proc/cpuinfo should just print all the isa string. That's it.
> > 
> 
> Ping ?

Yes, I agree with the "dumb" reporting of all capabilities.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
