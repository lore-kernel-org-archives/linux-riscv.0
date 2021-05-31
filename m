Return-Path: <SRS0=ZKx/=K2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97849C47082
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 06:37:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 558DD61108
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 06:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 558DD61108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIVnKqUZ+PC6TB3k88ZHE25ucRI4NJQEULPLuOmMhUQ=; b=0mLvzkkNG1p3t3
	kp5Cput1svdzZWL1guXyrvHVkDBHXFKFq/BHuqyEZ1c144EcD9dNdueUHN7hb7k3lf7xyAa0f1E86
	Jmx7suMQRgvrZd7u63falV/03l1pPenB+j8lIGwTX0kS+WD0b0uymqQF2M0L828jEV85+sW7qBz6Z
	MZZg4Gvpi9pBHkfjoENoxvamuJoSoCyC+Hf5tYqS4f78M7/V/dyMTob+zzRLW3Mc5UwuqUKHXYT7l
	mLQY8+r/WJVwBZxUb1xZdZwUZIM5CtXjYmnizDJB+/cXRruYkUT0St12m/K9mMtxWCq1mo1h5MU2a
	GkLH1KiknXc9xuOd/Aig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnbXr-00Ayqp-Du; Mon, 31 May 2021 06:37:03 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnbXp-00AyqG-0B
 for linux-riscv@lists.infradead.org; Mon, 31 May 2021 06:37:02 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4B7F367373; Mon, 31 May 2021 08:36:58 +0200 (CEST)
Date: Mon, 31 May 2021 08:36:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: palmerdabbelt@google.com
Cc: Christoph Hellwig <hch@lst.de>, guoren@kernel.org,
 Anup Patel <Anup.Patel@wdc.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 guoren@linux.alibaba.com
Subject: Re: [PATCH V4 2/2] riscv: Use use_asid_allocator flush TLB
Message-ID: <20210531063658.GB1143@lst.de>
References: <20210527070903.GA32653@lst.de>
 <mhng-cfb5a043-4b59-4698-b732-5cf5ceb49114@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-cfb5a043-4b59-4698-b732-5cf5ceb49114@palmerdabbelt-glaptop>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_233701_215600_D0EC649B 
X-CRM114-Status: GOOD (  17.82  )
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

On Sat, May 29, 2021 at 04:42:37PM -0700, palmerdabbelt@google.com wrote:
>>
>> Also the non-ASID code switches to a global flush once flushing more
>> than a single page.  It might be worth documenting the tradeoff in the
>> code.
>
> For some reason I thought we'd written this down in the commentary of teh 
> ISA manual as the suggested huersitic here, but I can't find it so maybe 
> I'm wrong.  If it's actually there it would be good to point that out, 
> otherwise some documentation seems fine as it'll probably become a tunable 
> at some point anyway.

The real question is why is the heuristic different for the ASID vs
non-ASID case?  I think that really need a comment.

> LGTM.  I took the first one as IMO they're really distnict issues, LMK if 
> you want to re-spin this one or if I should just take what's here.

What distinct issue?  The fact that the new code is buggy and uses rather
non-optimal calling conventions?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
