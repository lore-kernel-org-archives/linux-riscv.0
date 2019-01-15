Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707F9C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:44:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F22920868
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:44:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="piGej9vM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F22920868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6lriq69kebPiudf7nm8SM+ZGO/27Ybo6nuEL7Kwn4l4=; b=piGej9vMbN0Dcy
	Wmf5DMPfulJ5uj1dGteYkxAP15ali836s4J8WVtGCGezJiFNG1o2U7yei0DsQY5G2UxOdWwReuFzh
	siuF/QFJ79Kb+/I/dthnZH4RXiHIVWwYN71v3tQHU+DxqnQI+cPIFwgX/Lzy9p44cdO7bKJSl5Cob
	iRoHPn0no4BIQS+CLiRbLdUQYPWU3nUlNA7tH7bhlyIRMFZV7fwjR35VWeXxb7xZhuZcC2UCFjWq4
	G5FIcw+1SOGXzKOnKS70UCkLgqR92OmjSAaRnPkoxpbRcrbqPjflcfMq7XZhzJVtF2cxWzrbPKrHw
	EKaoYbVUayoOe1NQzJ2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjQtd-0008GS-3T; Tue, 15 Jan 2019 15:44:57 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjQtb-0008GG-6Z; Tue, 15 Jan 2019 15:44:55 +0000
Date: Tue, 15 Jan 2019 07:44:55 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] arch: riscv: support kernel command line forcing when no
 DTB passed
Message-ID: <20190115154455.GA29629@infradead.org>
References: <alpine.DEB.2.21.9999.1812171913510.29609@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1812171913510.29609@viisi.sifive.com>
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
Cc: linux-riscv@lists.infradead.org, paul@pwsan.com, palmer@sifive.com,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Dec 17, 2018 at 07:15:12PM -0800, Paul Walmsley wrote:
> 
> CONFIG_CMDLINE_FORCE doesn't work on RISC-V when no DTB is passed into
> the kernel.  This is because the code that forces the kernel command
> line only runs if a valid DTB is present at boot.  During debugging,
> it's useful to have the ability to force kernel command lines even
> when no DTB is present.  This patch adds support for doing so.

This looks fine to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>

I just wish all this command line magic could be moved to common
code somewhere instead of being reinvented badly in every port..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
