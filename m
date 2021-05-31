Return-Path: <SRS0=ZKx/=K2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FE5C4708F
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 06:34:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 743EA61002
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 06:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 743EA61002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJcUjmEUipLUNzGxqPH/xMqKsBmoMpVVTv+wKGiwUy0=; b=yrxu3NPWWF6aCO
	cOWgjJE3B8LOgih/S8R6Ex5zVIG65iyHNaMUdcs4tCSg/IlDwihWj4o1/vGimOw9ITH/6KB8G+94Q
	j11JM67y2w+V2aXA1mmTqqcFjrIsxO3uHUivuoIWci4Kz8x7im+0hUD695b4h+U/PgsYmk5bkBJlm
	h26N7TuXX9VDtB62Zl97dGhhPeJ5XxjqdkI2Z3gc1PJN+SbIJmALKhrMBXBSFRPvwEuH5LH32k8DX
	2ylM96CPZu7JyRq0S6r8hiaNQnBfbtK7mX1nANluz0gr2UrEYZdK5+evG44qxnLnE0m6dhq9C9XMS
	cOReVwWwlffLLVb34tvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnbVG-00AyXx-Of; Mon, 31 May 2021 06:34:22 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnbVD-00AyXN-RQ
 for linux-riscv@lists.infradead.org; Mon, 31 May 2021 06:34:21 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2603A67373; Mon, 31 May 2021 08:34:17 +0200 (CEST)
Date: Mon, 31 May 2021 08:34:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: anup@brainfault.org, Christoph Hellwig <hch@lst.de>,
 pbonzini@redhat.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: remove unused SBI helpers and exports
Message-ID: <20210531063416.GA1143@lst.de>
References: <CAAhSdy1zYdEgAVtePY9weOvzbnZ86DupWzoUKSn3Q98FDt50Ng@mail.gmail.com>
 <mhng-76155150-9e67-4125-a970-d805d38c7831@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-76155150-9e67-4125-a970-d805d38c7831@palmerdabbelt-glaptop>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_233420_060246_58F57298 
X-CRM114-Status: GOOD (  14.79  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, May 29, 2021 at 04:48:56PM -0700, Palmer Dabbelt wrote:
> I know the general rule is to only take code with callers, but these are 
> defined by the SBI so I figured we'd make everyone's lives a bit easier by 
> just keeping them around.

Keeping unused code never helps anyone.  Adding code without any known
users like some of the others is even worse.  And given that sbi_ecall
is exported (and just a trivial inline asm wrapper) there is no point
in having most of the helpers at all, but that is another story.

So for now I'd suggest to merge my patch, and changing any new code
to just use sbi_ecall instead of the remove wrappes as there is no
point in bloating the core kernel with trivial wrappers only used by
a single module.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
