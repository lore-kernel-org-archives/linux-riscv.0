Return-Path: <SRS0=E0x1=NQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DD5ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 00:50:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA6F320685
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 00:50:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r/V6u32I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA6F320685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xsZImgHejerOm/xn3za8zDYZpcRi7AF7jAC6w9k01Ts=; b=r/V6u32I4YEbc5
	aJA5ryvo+cNPTC/caHWbMQy2x1kD7OXNb/rU7LU0YJ6iyXitAZcgaGquGhJqf9da0ds657qawQKv8
	fcLo+KodXVOqpEqE/kzKONr5aW2kXU6E7TzSAkA7t+xttUfqNvUIhwv0Ji7RcRYSWtSqaqS/Gfuqr
	TaTFwZLNF+o7wpBqp9y6W0eea2I41DgONIDPikbE7mJAPg0DyC4e+RN15lwgt78DpyjFxjEd27mNY
	GDANHFALg7LTQ5R6m9elh7Sr2Km4YF/iSTNFv7QZ5UiEbbB2NdfyYkc0m3RWSTrxHqmnVEvobmzRg
	Un8OWxqlwbyTH6hduZJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJT5j-0000bl-Cg; Mon, 05 Nov 2018 00:50:07 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJT5f-000813-V8
 for linux-riscv@lists.infradead.org; Mon, 05 Nov 2018 00:50:06 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id wA50o3BM057953;
 Mon, 5 Nov 2018 08:50:03 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Mon, 5 Nov 2018
 08:49:28 +0800
Date: Mon, 5 Nov 2018 08:49:29 +0800
From: Alan Kao <alankao@andestech.com>
To: <palmer@sifive.com>
Subject: Re: [sw-dev] About the Use of sfence.vma in Kernel
Message-ID: <20181105004929.GA4735@andestech.com>
References: <20181101090015.GA6997@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181101090015.GA6997@andestech.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com wA50o3BM057953
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181104_165004_265934_F141C86F 
X-CRM114-Status: GOOD (  22.19  )
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
Cc: linux-riscv@lists.infradead.org, sw-dev@groups.riscv.org,
 greentime@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181105004929.6tg7icdY2YsJVH5dlW3Cado-PQuE7Cx7H-KEjJ8t0JA@z>

Hi Palmer,

I believe the code in arch/riscv/mm/fault.c is mostly from you.
Do you have any comments on this?

On Thu, Nov 01, 2018 at 05:00:15PM +0800, Alan Kao wrote:
> Hi all,
> 
> As mentioned in the Privileged Spec about sfence.vma instruction:
> 
> > The supervisor memory-management fence instruction SFENCE.VMA is used
> > to synchronize updates to in-memory memory-management data structures 
> > with current execution.  Instruction execution causes implicit reads 
> > and writes to these data structures;  however, these implicit references
> > are ordinarily not ordered with respect to loads and stores in the instruction
> > stream.
> >
> > Executing an SFENCE.VMA instruction guarantees that any stores in the
> > instruction stream prior to the SFENCE.VMA are ordered before all implicit
> > references subsequent to the SFENCE.VMA.
> 
> It naturally follows that we should use sfence.vma once the page table is
> modified.  There are several examples in the kernel already, such as
> 
> alloc_set_pte (in mm/memory.c):
> ...
>         set_pte_at(vma->vm_mm, vmf->address, vmf->pte, entry);
>         /* no need to invalidate: a not-present page won't be cached */
>         update_mmu_cache(vma, vmf->address, vmf->pte);
> ...
> where the update_mmu_cache function eventually issues a sfence.vma.
> 
> I was interested if it is always the case and did some research.  RV64 uses
> 3-level of page table entry, pud, pmd and pte, so I traced a little bit about
> the code flow after set_pud, set_pmd and set_pte.
> 
> It turns out that some of the calls to them are not followed by a
> sfence.vma.  For an instance, in the vmalloc_fault region in do_page_fault,
> there is no sfence.vma or calls to it after set_pgd, which directs to set_pud
> later.
> 
> Are they bugs or I just misunderstand the instruction?  As the kernel has
> already been stable for quite a while now, it is not likely to be a critical
> bug.
> 
> Any clarification will highly appreciated.
> 
> Many thanks,
> Alan Kao
> 
> -- 
> You received this message because you are subscribed to the Google Groups "RISC-V SW Dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to sw-dev+unsubscribe@groups.riscv.org.
> To post to this group, send email to sw-dev@groups.riscv.org.
> Visit this group at https://groups.google.com/a/groups.riscv.org/group/sw-dev/.
> To view this discussion on the web visit https://groups.google.com/a/groups.riscv.org/d/msgid/sw-dev/20181101090015.GA6997%40andestech.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
