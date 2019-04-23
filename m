Return-Path: <SRS0=K/tH=SZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53527C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2019 08:23:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2635320652
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2019 08:23:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bFu/BtJG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2635320652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylcu0N2/qAiZDTR5IuLvUPdvH+hWYLm9ZikNyYElMVg=; b=bFu/BtJGvuzMZk
	KpwCDk8M10+C5kT/nvQD0UXbzHyjdCSNbqXG7TX6vL/wHMt2594CMES9qZzydRoEwu4CKp1VyE1cD
	SeuS3J3winLq0ARPY4tbS1TVyevNQ3KORAGQlKEAlfsfE4j4964SamksaqRL9RI9wkuRN6lWcKZCS
	mUaIC4w0d2f4SXYF5RhGMs9HbeEc29tsOjZ8pRf7Y6W+syZTf6gotJTlZYUpRJvoRuU/UdJBzZbor
	o231TbRAWEowkEDBzT0fRC4jyllUtgC1F7HMMDfLSH5eqeK0MP3HCz8dlR3UihCwcgFEdBBoY5gm/
	Z8PDpBWLi16AH/tQ9t+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIqiS-0007wR-7K; Tue, 23 Apr 2019 08:23:48 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIqiP-0007w3-Cm
 for linux-riscv@lists.infradead.org; Tue, 23 Apr 2019 08:23:46 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 006F868AFE; Tue, 23 Apr 2019 10:23:28 +0200 (CEST)
Date: Tue, 23 Apr 2019 10:23:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: misc cleanups v3
Message-ID: <20190423082328.GA14788@lst.de>
References: <20190415091442.19945-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190415091442.19945-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_012345_586891_0106D620 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Any comments on the remaining patches?

On Mon, Apr 15, 2019 at 11:14:31AM +0200, Christoph Hellwig wrote:
> Hi Palmer,
> 
> below is a number of small cleanups and improvements that started
> piling up during work to support the RISC-V kernel in nommu port.
> While that port isn't quite ready yet these patches should be useful
> on their own.
> 
> Changes since v2:
>  - drop the patch to remove the non-framepointer code, it turns out
>    CONFIG_FRAME_POINTER can be turned off on RISC-V after all..
> Changes since v1:
>  - fix up a few patch descriptions
>  - fix the interrupt cause patch to actually compile without further
>    prep patches, doh!
>  - remove dead code related to non-framepointer builds
>  - remove another big endian ifdef
>  - add another patch from my nommu stack to clean up the parse_dtb
>    calling conventions
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
---end quoted text---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
