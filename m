Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB72C64E7A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 05:22:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 634262085B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 05:22:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HQtzc0Of"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 634262085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n8CU31X0GaFAKnnPvX5MkUaMt0bKm7/2Re4BqE725ww=; b=HQtzc0OfqeR4mFm0h15dPQcPQ
	lxwIvY5WmLMFuChhaDwVLAn77zcQHOY4OcFDE4SJ3zpN/6ePZEFiizmFDoxQBwsDRhC36yJ06ou5u
	P9NOoSe14ub+Asyjdg6nuoOq+xZjcliPxP454OsEIdgJ8+iBFfQS6QjqpI+YNJtP4Kku+KcZgfVRn
	8VyZ8aeT/LcDX1aZaPbNJDBfL6/JPMIhLmWGo5IAMYShYSv8wziQKfX9WsFNjmjcyqhGnPWClxYsl
	/0flAA/tK/6diEqGnbVEPFE1AqDzd9FB3IiP3JvIwcN0QszWqqIb5z7qYWaQRl07f6JhSV6JwXgFD
	/5gctdp8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjy7K-0004gE-5X; Tue, 01 Dec 2020 05:22:22 +0000
Received: from exmail.andestech.com ([60.248.187.195]
 helo=ATCSQR.andestech.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjy7H-0004fo-Hw
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 05:22:20 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 0B15LHZx079928;
 Tue, 1 Dec 2020 13:21:17 +0800 (GMT-8)
 (envelope-from tesheng@andestech.com)
Received: from atcfdc88 (10.0.15.120) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.487.0; Tue, 1 Dec 2020 13:20:55 +0800
Date: Tue, 1 Dec 2020 13:20:49 +0800
From: Eric Lin <tesheng@andestech.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] riscv/mm: Prevent kernel module access user-space memory
 without uaccess routines
Message-ID: <20201201052048.GA7647@atcfdc88>
References: <20201130053037.27006-1-tesheng@andestech.com>
 <20201130083015.GA14676@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130083015.GA14676@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 0B15LHZx079928
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_002219_984709_0E7279B2 
X-CRM114-Status: UNSURE (   7.51  )
X-CRM114-Notice: Please train this message.
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
 "dslin1010@gmail.com" <dslin1010@gmail.com>,
 "Alan Quey-Liang Kao\(?????}\)" <alankao@andestech.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "daniel.m.jordan@oracle.com" <daniel.m.jordan@oracle.com>,
 "penberg@kernel.org" <penberg@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "walken@google.com" <walken@google.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 30, 2020 at 04:30:15PM +0800, Christoph Hellwig wrote:
Hi Christoph,
> > +	if (!user_mode(regs) && addr < TASK_SIZE && unlikely(!(regs->status & SR_SUM)))
> 
> Please avoid the overly long line.
OK, I'll modify it in v2. Thanks for your review.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
