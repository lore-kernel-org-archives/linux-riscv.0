Return-Path: <SRS0=ZKx/=K2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25AAC4708F
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 06:18:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87BD161248
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 06:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87BD161248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYos+Beo50+V/yU/enbM1fTdjBLZW1QAQtO6moPUnXs=; b=jfiCJLaekteEYw
	fqO7eYN+EhlNfFx5C7TpkdXo5nSOaDV8veWR6tGsf+4X7SLu6NQmCfAK9N3h5ycCIDI892tjveRGA
	+LdvgBUzsB5/+ReD5F7iG/NJecRFTVhd+K65fgynIVpLrlvidtiZyBLOjJxw0VxTZTS4KP2nmpHMC
	U6WeaJYVo32QAD0vTDyLySbLsKduqnxu473VCNz2z5ETdLa4tR7bAK0I9KbfPI/O2HS+b1ASaVBF3
	7M7agjXa6ZpYN/ttxQ/O61wjiofFNSEqM+v4pgCrGbBpI7CX0PPU51DjClMZrtP663HvEKzg3vIf0
	2SpIGAKbuDQOsvqb/SiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnbFF-00Awdv-BV; Mon, 31 May 2021 06:17:49 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnbFC-00AwdH-Ca
 for linux-riscv@lists.infradead.org; Mon, 31 May 2021 06:17:47 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9EC5667373; Mon, 31 May 2021 08:17:42 +0200 (CEST)
Date: Mon, 31 May 2021 08:17:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, palmerdabbelt@google.com, arnd@arndb.de, hch@lst.de,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V5 2/3] riscv: Add ASID-based tlbflushing methods
Message-ID: <20210531061742.GB824@lst.de>
References: <1622393366-46079-1-git-send-email-guoren@kernel.org>
 <1622393366-46079-3-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622393366-46079-3-git-send-email-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_231746_596292_4B708A0E 
X-CRM114-Status: GOOD (  12.14  )
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

On Sun, May 30, 2021 at 04:49:25PM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Implement optimized version of the tlb flushing routines for systems
> using ASIDs. These are behind the use_asid_allocator static branch to
> not affect existing systems not using ASIDs.

I still think the code duplication and exposing of new code in a global
header here is a bad idea and would suggest the version I sent instead.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
