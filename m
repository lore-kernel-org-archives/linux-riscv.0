Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D77C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 15:53:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBDBB20657
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 15:53:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VELS36uI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBDBB20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=llsgEFHxTa/lHoHrL55169eshUych9O0J0g0e26QS20=; b=VELS36uIWmkRaj
	hAQ11rwY351PhCeKufQC/a08XVzbaoz0aC5FTL0bj9EMN3HkcyUQF17SuWnkhSAK/Mo10TPlD7NPN
	noLUrZckXfXFQM6C+eAmYFPqtOUX7wRsSi8/fn2Wx4GaaAwhKiPcnIxVcKbhL4ZHN8NYM3AQN44Kj
	sSgIkvJWWoeNMfeJKJkw+0N5JCcSP1BfGgCZ7vfHF2Fber7lwSZAZwbGA+62C0EIt0Veg+SpIhbN5
	xjxhfrUPbvbh8IxgtFFuKcIhxtt9aDbTj5YgKUwOlxgh5Bjf2rn0lN1dvF3ucx+p5Jfwx8u6DgQAi
	VWXdYdwq6pFSDBh7dQSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3NEr-0005u4-Gh; Mon, 11 Mar 2019 15:53:17 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h3NEo-0005nt-RA; Mon, 11 Mar 2019 15:53:14 +0000
Date: Mon, 11 Mar 2019 08:53:14 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 3/3] riscv: rewrite tlb flush for performance improvement
Message-ID: <20190311155314.GA21041@infradead.org>
References: <LO2P265MB08471CC8597FD60691334624D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190308143928.GC32707@infradead.org>
 <04cbcd8e-77b4-b3fa-8f9e-3aa07db781fc@garyguo.net>
 <20190308163125.GB310@infradead.org>
 <CAAhSdy3n4F6EE0RYwozH2U2W+WMGJ_eVYs7-ny8Y2szoUeaksQ@mail.gmail.com>
 <20190308171804.GA27005@infradead.org>
 <CAAhSdy1HBgn99x3V4=ytYEzf3cTiwT1ogBs193ZxFTVxTDbgsQ@mail.gmail.com>
 <CAAhSdy18xNqbbQvBLj8pHB=vWM8KqhUfNN-6Bw7J4J2ONB8i=g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy18xNqbbQvBLj8pHB=vWM8KqhUfNN-6Bw7J4J2ONB8i=g@mail.gmail.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Gary Guo <gary@garyguo.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 11, 2019 at 02:19:54AM +0530, Anup Patel wrote:
> There are also use-cases to run two separate OSes on same SOC
> without virtualization. In such cases, both OSes cannot have access
> to CLINT for triggering IPIs.

And sometimes pigs can fly (no, really!).  But we should optimize
for performance on hardware we have not build some ivory towers
for grand architectures of the future.

And with that I don't mean cutting corners and weird micro-optimization,
but to think hard what layering makes sense.

Having to trap into machine mode software to flush TLBs does not make
sense in any normal architecture.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
