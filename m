Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A87C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:27:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7324B2190A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OBSprN7x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7324B2190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=icwArTR80a75p13j+FICmEA8NY8431e1mDYsxPNN06E=; b=OBSprN7xs9jzdg
	aWX4K+u0wJ+bZ0vvGiYPMLx+jPljEDaAMiPhRmLyMwcvkVMysohZt+cIvfRy7kL5YgwiR0AjiFUq/
	eH5opb4btGXIgKgrnDMZfTNLjWMrOW6CyydnrbzAuWswqGLbvmQnQJRKRq48tW+3OHh5Bol6pd5+c
	SGryF3QpXzLl484ZYkty8H/2JnRtclXRrHkLk9mpi8ne17vOFdqDa64XNkmc5n3nuqs2V0oGFLPdq
	qKrpNtotH5E7eazaHctcW7321WOGHtQzzsOLaMOPoJ2DZWz9tNW4cbqwalcDdoXqnG2ix+2Z1QMj6
	nCdxwtK4eFMQEqfoUUoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7KCP-0007yg-9o; Fri, 22 Mar 2019 13:27:05 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h7KCA-0007ev-Sz; Fri, 22 Mar 2019 13:26:50 +0000
Date: Fri, 22 Mar 2019 06:26:50 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
Message-ID: <20190322132650.GC19263@infradead.org>
References: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
 <20190322104209.GB24367@rapoport-lnx>
 <CAAhSdy3UoX9gS=9YN6m0=qA2g-m=bw-Y-N-5CAFQZcnKA04C5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3UoX9gS=9YN6m0=qA2g-m=bw-Y-N-5CAFQZcnKA04C5g@mail.gmail.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 22, 2019 at 05:59:07PM +0530, Anup Patel wrote:
> > I've drafted a patch that separates trampoline_pd_dir and swapper_pg_dir
> > setup, if it works, the __load_pa() and __load_va() conversions can be
> > applied only to the trampoline initialization. I don't have riscv hardware,
> > so it's compile tested only.
> 
> I had similar views as yours but I found that trampoling_pg_dir is totally
> redundant and since it is part of __init section it will break runtime hart
> hotplug in future. All mapping in trampoling_pg_dir are already covered
> by swapper_pg_dir. The PATCH4 in my v2 series removes trampoline_pg_dir.

Can you please move that to the front of the series?  Killing
trampoline_pg_dir sounds very useful indeed, while I'm still not really
convinced of the 4k mappings to be honest.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
