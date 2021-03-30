Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21696C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 20:55:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61A54619C5
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 20:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61A54619C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fMKLEkjYyvWOKjAfpy+itkM6gLh89Cvnafp314oiGbg=; b=khgSiD+0XvoBNQb0WTq4v2kl1
	/6PxPCSsPPh4+A08WphbAaPQjIS0PUlxubDse1FQsk6O46x9dVmTqzpX2oO3GhAQsjKRvgS5/iLi9
	KjLFhgopefSCw+fj0bLUctNHm3+lwBhMwCVq2/JNtYG/CrxldG8yDTnAB0TBaBRst4Tk67519F4Vz
	Gnoq5YYip482uf5C6e4yXznqlBcNqu4NaQ+mkYcKikDc8QUSAOI8zhI/hrFl2iwQ45kM7K9jJXIQJ
	lhBt1dFX+/d/LgUTu1+eawIN+eOW/CqU86hx+849LO1sf0a8kNObvgNUoMrCgQuXSPMVW5vjd2J8M
	kffqgIr0g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRLO1-004pHO-Nv; Tue, 30 Mar 2021 20:54:53 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::4])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lRLL2-004p1P-QR
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 20:52:35 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 3E11492009C; Tue, 30 Mar 2021 22:51:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 3701892009B;
 Tue, 30 Mar 2021 22:51:48 +0200 (CEST)
Date: Tue, 30 Mar 2021 22:51:48 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Palmer Dabbelt <palmer@dabbelt.com>
cc: wangkefeng.wang@huawei.com, linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [PATCH] riscv: Drop const annotation for sp
In-Reply-To: <mhng-a94d2d1e-c9f6-47b1-9dbc-0ee1e6be418f@palmerdabbelt-glaptop>
Message-ID: <alpine.DEB.2.21.2103302238420.18977@angie.orcam.me.uk>
References: <mhng-a94d2d1e-c9f6-47b1-9dbc-0ee1e6be418f@palmerdabbelt-glaptop>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_215233_381721_18162BB1 
X-CRM114-Status: GOOD (  10.71  )
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

On Mon, 29 Mar 2021, Palmer Dabbelt wrote:

> The patch here is correct.  According to the GCC manual: "Do not use 
> type qualifiers such as const and volatile, as the outcome may be 
> contrary to expectations."  It doesn't mention in what way "const" may 
> provide an unexpected outcome, but that's probably why I didn't have it 
> the first time (despite us only reading the variable).  I must have 
> forgotten about that when I saw the patch go by.

 See GCC PR c/85745 and PR target/86673.  It probably does not apply to 
global asm variables though, not at least in the way described (IMHO it 
doesn't make sense either, as `sp' surely isn't constant).

 HTH,

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
