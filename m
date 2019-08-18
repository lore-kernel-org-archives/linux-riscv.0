Return-Path: <SRS0=TswT=WO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E554C3A589
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 18 Aug 2019 18:16:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03F652146E
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 18 Aug 2019 18:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZjOW6ULE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03F652146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qYO2+U7gRX91j9YG/krGHjEgLACScSg725xRM5zzS0Y=; b=ZjOW6ULEVjnt+v
	9/1IWeddRTs9PNRyuMfMWEvt+tti2ayKpj7C0bc0WS0eZBYNzDu6GmlxltdzDK4vBmFui0rYaiDg0
	J4e4UGqBsqpiWEQMZllo9MiGhPftv98wt+pXAra4nMKlEqiVxQD/o3Tygy1/tegyfcjGDPawhqzfD
	FG6PMtxanpfm9CTJKGX4WRKbMojFvkCyls1tPlw5moyuKJauOBQ/gUTvu/O4MekjBZ8lpuJzBYnKG
	LefNRufKcTzml/AJ84LG1d/GyXasqRkDKPsEJ3FVNiwrd3ALUPhhPsEnXsSoLnNWMCV2/vjoVaJBy
	/1qxl8eaghQ3qZqqSiqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzPjF-0006Uj-Bd; Sun, 18 Aug 2019 18:16:33 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hzPjC-0006UO-Bi; Sun, 18 Aug 2019 18:16:30 +0000
Date: Sun, 18 Aug 2019 11:16:30 -0700
From: "hch@infradead.org" <hch@infradead.org>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [v5 PATCH] RISC-V: Fix unsupported isa string info.
Message-ID: <20190818181630.GA20217@infradead.org>
References: <20190807182316.28013-1-atish.patra@wdc.com>
 <20190812150215.GF26897@infradead.org>
 <3fb8d4f0383b005ecd932a69c4dd295a79b6fb1a.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3fb8d4f0383b005ecd932a69c4dd295a79b6fb1a.camel@wdc.com>
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

On Fri, Aug 16, 2019 at 07:21:52PM +0000, Atish Patra wrote:
> > > +	if (isa[0] != '\0') {
> > > +		/* Add remainging isa strings */
> > > +		for (e = isa; *e != '\0'; ++e) {
> > > +#if !defined(CONFIG_VIRTUALIZATION)
> > > +			if (e[0] != 'h')
> > > +#endif
> > > +				seq_write(f, e, 1);
> > > +		}
> > > +	}
> > 
> > This one I don't get.  Why do we want to check CONFIG_VIRTUALIZATION?
> > 
> 
> If CONFIG_VIRTUALIZATION is not enabled, it shouldn't print that
> hypervisor extension "h" in isa extensions.

CONFIG_VIRTUALIZATION doesn't change anything in the kernels
capabilities, it just enables other config options.  But more
importantly the 'h' extension is only relevant for S-mode software
anyway.

> This is just an information to the userspace that some of the mandatory
> ISA extensions ("mafdcsu") are not supported in kernel which may lead
> to undesirable results.

I think we need to sit down decide what the purpose of /proc/cpuinfo
is.  IIRC on other architectures is just prints what the hardware
supports, not what you can actually make use of.  How else would you
find out that you'd need to enable more kernel options to fully
utilize the hardware?

Also printing this warning to the kernel log when someone reads the
procfs file is very strange.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
