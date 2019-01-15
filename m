Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555CFC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 16:04:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 241B820675
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 16:04:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VDfPgK6h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 241B820675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5ppPd2TRxRYWyxXUpXZ4P7+z2HRpMD2PmH97+0Zl48=; b=VDfPgK6hyxtwW5
	jFVg0qdkRDauk+0udipaTlXVo2MpPV+23FlbmDrSGI+BjU3FZgIFQm0YQPMmFPtRejKFPyxhtjCh3
	OVwp0uRftwAvT0j01tXP/n3pOPLQM10O7raP/kWsrJBfsdw+70WQCwKwkNEbqEVHhF6i51JO5OAM7
	pu6g2xYVm4Hk5v4PI5P2Ivb9pVRClvsLgv0jJx1gAsh6a0Nt1CNCizYHke0lqSWOTFVmckqP53CaX
	rXqoOadPkLf+h4plRGTDr1nktGTvYkB4r3lyPhWhcN3txVNNHPs7CU8rs8/MAyt/F6WpkRjvTCfwj
	ftHFY96qnuS5JugiKM4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRCZ-0000nH-TX; Tue, 15 Jan 2019 16:04:31 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjRCX-0000jY-F1; Tue, 15 Jan 2019 16:04:29 +0000
Date: Tue, 15 Jan 2019 08:04:29 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH 0/3] Hugetlbfs support for riscv
Message-ID: <20190115160429.GA29683@infradead.org>
References: <20181210062146.24951-1-aghiti@upmem.com>
 <91664ec7-d148-1c0a-8d1a-82815c5c7f6a@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91664ec7-d148-1c0a-8d1a-82815c5c7f6a@oracle.com>
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
Cc: mingo@kernel.org, aou@eecs.berkeley.edu, catalin.marinas@arm.com,
 palmer@sifive.com, ndesaulniers@google.com, Alexandre Ghiti <aghiti@upmem.com>,
 atish.patra@wdc.com, linux-riscv@lists.infradead.org,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 09, 2019 at 11:23:22AM -0800, Mike Kravetz wrote:
> > CMA or (MEMORY_ISOLATION && COMPACTION) must be enabled so that boot
> > reserved gigantic pages can be freed: indeed, one can reduce the number
> > of huge pages by calling free_gigantic_pages which in turn calls
> > free_contig_range, defined only with those configs defined.
> > However I don't see any strong dependency between free_contig_range
> > and those configs, maybe we could allow hugetlbfs users to free boot
> > reserved hugepages without those configs activated, I will propose
> > something if Mike Kravetz agrees.
> 
> Yes, that should be modified.  I think it would be a simple matter of moving
> free_contig_range out of that ifdef block.  If you would like, I can submit
> a patch for that.

We should probably include that patch in this series.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
