Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD08C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 09:00:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 002BC2081B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 09:00:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tHzO9Bnb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 002BC2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Ny1BSOZnBVy1Vt/TWVnJbKexWrjUhLwJwvHxk+1pg0=; b=tHzO9BnbqwiAAs
	nYvvOxLrhLZAQx86x9U2Ypz2BavJMSaAktKaRamDOIcAFhITyhtmOottMU6p7kwPNZeEYYxRIAI7B
	uubgZCKF3LHZTZi9urPYnwt6AivuFTLN62VVA+ubUBHZbkYtUcbcsrVWDoDBxUfR5KW0xz6MxL0/6
	HGCI0SeMaBsNwzS+XtDR5cKU6a+yH9d9Ng9Jp4e18THBeI2UzEWGGQS8aYI/uWlsrJafBFyZHGrdg
	eFNzFErHzkeFV8xK8N43UKa3FbZKpOwbLRl9bueanLRuWevPcM62T9r9zMvuG7hbTtenbLZy8cG9z
	KIkay8chsPnzsemekqtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gI8qG-0007Zn-Sv; Thu, 01 Nov 2018 09:00:40 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gI8qD-0007Xy-1K
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 09:00:38 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id wA1914AR084295;
 Thu, 1 Nov 2018 17:01:04 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Thu, 1 Nov 2018
 17:00:14 +0800
Date: Thu, 1 Nov 2018 17:00:15 +0800
From: Alan Kao <alankao@andestech.com>
To: <linux-riscv@lists.infradead.org>, <sw-dev@groups.riscv.org>
Subject: About the Use of sfence.vma in Kernel
Message-ID: <20181101090015.GA6997@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com wA1914AR084295
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_020037_342193_B1143E20 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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
Cc: greentime@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101090015.QypuFlel1_dwIVENx3fFHircOGCChOGqZQ3Vd3s9AXE@z>

Hi all,

As mentioned in the Privileged Spec about sfence.vma instruction:

> The supervisor memory-management fence instruction SFENCE.VMA is used
> to synchronize updates to in-memory memory-management data structures 
> with current execution.  Instruction execution causes implicit reads 
> and writes to these data structures;  however, these implicit references
> are ordinarily not ordered with respect to loads and stores in the instruction
> stream.
>
> Executing an SFENCE.VMA instruction guarantees that any stores in the
> instruction stream prior to the SFENCE.VMA are ordered before all implicit
> references subsequent to the SFENCE.VMA.

It naturally follows that we should use sfence.vma once the page table is
modified.  There are several examples in the kernel already, such as

alloc_set_pte (in mm/memory.c):
...
        set_pte_at(vma->vm_mm, vmf->address, vmf->pte, entry);
        /* no need to invalidate: a not-present page won't be cached */
        update_mmu_cache(vma, vmf->address, vmf->pte);
...
where the update_mmu_cache function eventually issues a sfence.vma.

I was interested if it is always the case and did some research.  RV64 uses
3-level of page table entry, pud, pmd and pte, so I traced a little bit about
the code flow after set_pud, set_pmd and set_pte.

It turns out that some of the calls to them are not followed by a
sfence.vma.  For an instance, in the vmalloc_fault region in do_page_fault,
there is no sfence.vma or calls to it after set_pgd, which directs to set_pud
later.

Are they bugs or I just misunderstand the instruction?  As the kernel has
already been stable for quite a while now, it is not likely to be a critical
bug.

Any clarification will highly appreciated.

Many thanks,
Alan Kao

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
