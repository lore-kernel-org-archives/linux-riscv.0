Return-Path: <SRS0=CAot=X2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1A5ECE588
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2019 04:59:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5616C21783
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2019 04:59:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dIwNT0lr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5616C21783
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJNJ27X5i27x9VMgNXPgVmLnmNZwg9Ci5acBJJXIItA=; b=dIwNT0lrggQ9ik
	IGz91gnvxy8tP3NjQ+8lUx6KD3EcEry+SmjO0dq92cyJ30C/lWymp7pIesxg1fE504gCX6tCAyZnf
	oF6YhS8ok/cmuNuJGHFpfrUCbIfJEe4WLW4DYpXgRy+cADGempg7K/88iL3o2DfjN/r61+vEqNPP9
	YvFZSrwZ/liLUHSG8DoyimPNmqZ7DAe43Ws9CYvtp89X7GOOCRk+rf6lIbptMsTBVrjF6EUZW9/uM
	RCN6wod1MNy+Y3ZLNhreA9b0uFTrb7OM03aHveKgiGJsSJ384z0AznctoKLBEXji4D8ah3nPkQWFl
	yM+OIMQO1MvV25lsTDWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFAGD-0007m5-AS; Tue, 01 Oct 2019 04:59:41 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFAG9-0007l3-Vs
 for linux-riscv@lists.infradead.org; Tue, 01 Oct 2019 04:59:40 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x914gucI059794;
 Tue, 1 Oct 2019 12:42:57 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Tue, 1 Oct 2019
 12:58:15 +0800
Date: Tue, 1 Oct 2019 12:58:16 +0800
From: Alan Kao <alankao@andestech.com>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [PATCH v2 0/3] Add support for SBI v0.2
Message-ID: <20191001045815.GA6572@andestech.com>
References: <20190927000915.31781-1-atish.patra@wdc.com>
 <20190927221913.GA4700@infradead.org>
 <8683f51f26708a468bcdf16a48db1cffac6c28d8.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8683f51f26708a468bcdf16a48db1cffac6c28d8.camel@wdc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x914gucI059794
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190930_215938_279138_5A37C1D2 
X-CRM114-Status: GOOD (  15.27  )
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
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "hch@infradead.org" <hch@infradead.org>, "gary@garyguo.net" <gary@garyguo.net>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "allison@lohutok.net" <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 27, 2019 at 10:57:45PM +0000, Atish Patra wrote:
> On Fri, 2019-09-27 at 15:19 -0700, Christoph Hellwig wrote:
> > On Thu, Sep 26, 2019 at 05:09:12PM -0700, Atish Patra wrote:
> > > The Supervisor Binary Interface(SBI) specification[1] now defines a
> > > base extension that provides extendability to add future extensions
> > > while maintaining backward compatibility with previous versions.
> > > The new version is defined as 0.2 and older version is marked as
> > > 0.1.
> > > 
> > > This series adds support v0.2 and a unified calling convention
> > > implementation between 0.1 and 0.2. It also adds minimal SBI
> > > functions
> > > from 0.2 as well to keep the series lean. 
> > 
> > So before we do this game can be please make sure we have a clean 0.2
> > environment that never uses the legacy extensions as discussed
> > before?
> > Without that all this work is rather futile.
> > 
> 
> As per our discussion offline, here are things need to be done to
> achieve that.
> 
> 1. Replace timer, sfence and ipi with better alternative APIs
> 	- sbi_set_timer will be same but with new calling convention
> 	- send_ipi and sfence_* apis can be modified in such a way that
> 		- we don't have to use unprivileged load anymore
> 		- Make it scalable
> 
> 2. Drop clear_ipi, console, and shutdown in 0.2.
> 
> We will have a new kernel config (LEGACY_SBI) that can be manually
> enabled if older firmware need to be used. By default, LEGACY_SBI will
> be disabled and kernel with new SBI will be built. We will have to set
> a flag day in a year or so when we can remove the LEGACY_SBI
> completely.
> 
> Let us know if it is not an acceptable approach to anybody.
> I will post a RFC patch with new alternate v0.2 APIs sometime next
> week.
>

Will this legacy option be compatible will bbl?  says, version 1.0.0 or
any earlier ones?

> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> -- 
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
