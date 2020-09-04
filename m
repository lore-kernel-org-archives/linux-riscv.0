Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E682AC43461
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 13:01:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A84E62073B
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 13:01:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yNsdkWVk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="clSU95wH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A84E62073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BMQcnpsrfri3fP1TkvVFWXYPpix7rplRO/aypVya7tk=; b=yNsdkWVkO8dGSIvr4VWKj1Vyy
	nekxeGFxc6MVKiUgwNvrfDnCHFzf22JTYk/ff0qmX9w5/M2X9CRanAiiTkNUmMrxouV4Opn4MOK4F
	+QLJF8iuUdVKegyHo5yOfY+piR1itrGMQ1iGHDsidGHmND2Z2u90tsJFrcLuLgITjGnVzU6KBI2Qu
	68F0Wpw3+BWr7nPYVNqC08kAwa4eH9ly0+4pvTXignImuELflCoW6KDgvHI/fqlnSR+Juw+4Af3RO
	ilT7V3SdInL0fC+6b2JSTCxaMJq8QginK+Ybh2BR8v7uRXS055uVtSnU1gUrsqkjLRGR26YcFejQP
	PSrqnWx3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEBKi-0000lc-N7; Fri, 04 Sep 2020 13:00:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEBKg-0000lM-NE
 for linux-riscv@merlin.infradead.org; Fri, 04 Sep 2020 13:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=EJr4/0pOzIyMgNRBIBv/XOtcgAjh5svDusRASQ+9TJY=; b=clSU95wH459cRR7GBjGVumHpp2
 zpLmTEy2jUnWn0DFKYJkaI4Z/7WE49Ls/EbHHzU1E7gCt3KMw38OCkJm95ue6yd92ZSTpd+UYCLD8
 SVF0NwfM0bObt6ebhl8rYZgCaFgpxAJUGlMctnrrqNccn4zORLPPMB3tMd2b5ijb8fFTC2Asew+ER
 fHYlLf5hqN/UTQ4MgI6e8EhL+68LK78d6CSa/uBFeu/mQVv0/4ngg39Eq9J3Xb5b3zTRs//z/12SL
 GrkZLjpZFAf5n+8P2GH5XOIU8yV45LkFFmNB8DDV70YkaxePItCA+gBtNoQmxWbzwfkTBrkb/gqQB
 6JHiDS+Q==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kEBKf-00029q-1C; Fri, 04 Sep 2020 13:00:45 +0000
Date: Fri, 4 Sep 2020 14:00:44 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
Subject: Re: [GIT PULL] RISC-V Fixes for 5.9-rc2
Message-ID: <20200904130044.GA7842@infradead.org>
References: <mhng-32c8d053-acbd-4c72-b41d-8d6042ac639d@palmerdabbelt-glaptop1>
 <CAHk-=wi_tf4qsiBj5UD0GG3wz8Hi5NrHzqdrx+CwtfAY+_UiGg@mail.gmail.com>
 <20200904083109.GA9182@infradead.org>
 <CAAhSdy3S8FfMAWih_VoBHw0xd-7c=urzuJ+PPdug9iX_pWyTsQ@mail.gmail.com>
 <20200904094617.GA27846@infradead.org>
 <CAAhSdy2x0ROqoTzzZRZgKCTL99WPy-8e4CQ921sf-=GQDm_gxA@mail.gmail.com>
 <f1be6ee1-0802-82ca-ffdb-4c294925cd9a@kylinos.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f1be6ee1-0802-82ca-ffdb-4c294925cd9a@kylinos.com.cn>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Anup Patel <anup@brainfault.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 04, 2020 at 08:58:25PM +0800, Qiu Wenbo wrote:
> I can confirm this patch also breaks K210 support. It seems that
> csr_read(CSR_TIME) will trigger an illegal instruction exception on K210.

CSR_TIME is trapped by just about every implementation I know (which is
explicitly allowed by the spec).  That is why we should never use it
from common M-mode code.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
