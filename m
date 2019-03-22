Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD53C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:25:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E3AD218A5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:25:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XWZVmwPE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E3AD218A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0YXDuOrXsriL/mi1Bst4aOm9n90lxrMHxzgIN80mlg=; b=XWZVmwPEFMtulB
	KkuYXv8iplyG0aI0LGXZp5jPOSzmd6xMEp3Mc7J7jWpbydQ7Y/IQpGT9Mjg8/pHL/RI1TqP+JZ4xB
	kdfmdOY7S1zIiQeS3IhaH1LCgZ/RVcOxKfqQcH+27qhkiiVt3sWliQspsiRhbD1NMNCzyqQdVL+1m
	yJokOagsF30vEIdM4Je8OcLv+zJIZw7YkfgXfJ8uDmZgIxFG+/CBvICBU877JobOZayDYzYykMwOw
	4gCvP4Eqgbrti5ZXjXw6UW5UP0vO9QY191ywQDQXD3/WzdL1YtjKLHU2vwYeJjvcTIJ6Ws8a5lXfy
	D6rEsyn2U7wMMjv78C2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7KBJ-00072A-Qd; Fri, 22 Mar 2019 13:25:57 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h7KBI-00071q-Cw; Fri, 22 Mar 2019 13:25:56 +0000
Date: Fri, 22 Mar 2019 06:25:56 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
Message-ID: <20190322132556.GB19263@infradead.org>
References: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
 <20190322104209.GB24367@rapoport-lnx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190322104209.GB24367@rapoport-lnx>
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 22, 2019 at 12:42:10PM +0200, Mike Rapoport wrote:
> Hi,
> 
> On Fri, Mar 22, 2019 at 11:46:24AM +0530, Anup Patel wrote:
> > Hi Palmer,
> > 
> > The 32bit kernel booting is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
> > affecting setup_vm() movement from kernel/setup.c to mm/init.c.
> > 
> > There is no issue with 64bit kernel booting.
> > 
> > The "[PATCH v2 2/5] RISC-V: Make setup_vm() independent of GCC code model"
> > fixes this issue.
> > 
> > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1959102.html
> > 
> > If possible please include above patch as Linux-5.1-rc1 fix.
> 
> I'm not convinced that it's the best solution. Multiple __load_pa() and
> __load_va() conversions make code unreadable.
> Is there any reason swapper_pg_dir cannot be setup after 'relocate'? It'll
> save a lot of churn for the current fix and for the addition of 4K mappings

I think for 5.1-rc we should just revert the cleanup patch ASAP until
we figure out what else we want to do.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
