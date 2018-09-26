Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDDAC43382
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 14:12:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DEF820843
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 14:12:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BPA7BQjB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DEF820843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6RwHxwl0iIy9mpk0RAVezcUSpWahfEbo/yuenq08JE=; b=BPA7BQjB989Xxw
	ih9VJgHXbD/pDGfN/eDZCb8KJyzI1t2kpnuZvi09bDtPW7gI3TO1v9GX71SsQe1wVpHIa0OhKH9DD
	6PMiB8+St7kUuw+FyrXLQFSstIRlbQn9zpLtKzjD5ou/objdtPf2B9V64Tfjyy1gFeO7+8aFgoq+C
	RAhM5N//GzGO9roLA1S60BOvgkvOkNdHITcvrY5mhMUEokiPbnUBV3RrUk1kqySPkc/rcj0w6rClz
	urxinDGVIEors1lLyExkOMlNaBYRRVh6nIX5cCydthl/vpaodAv11P5QF3Znefxx/kwW6w+X6NDQQ
	UkLf0sTgbJ3eZhhAg5aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g5AYh-0007s2-Eo; Wed, 26 Sep 2018 14:12:55 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1g5AXn-0007kS-Tl; Wed, 26 Sep 2018 14:11:59 +0000
Date: Wed, 26 Sep 2018 07:11:59 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Zong Li <zongbox@gmail.com>
Subject: Re: [PATCH v2 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
Message-ID: <20180926141159.GA28142@infradead.org>
References: <cover.1537949825.git.zongbox@gmail.com>
 <7a24493868f29559a1628eed44af15dc10a9940a.1537949825.git.zongbox@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a24493868f29559a1628eed44af15dc10a9940a.1537949825.git.zongbox@gmail.com>
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
Cc: zong@andestech.com, aou@eecs.berkeley.edu, palmer@sifive.com,
 linux-kernel@vger.kernel.org, hch@infradead.org, vincentc@andestech.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180926141159.QYB1gC1yCFvijUdiK8Cl-H33Qd-Tk7lemzO20eh1GGg@z>

On Wed, Sep 26, 2018 at 04:31:12PM +0800, Zong Li wrote:
> diff --git a/lib/udivmoddi4.c b/lib/udivmoddi4.c
> new file mode 100644
> index 0000000..6518b3a
> --- /dev/null
> +++ b/lib/udivmoddi4.c
> @@ -0,0 +1,309 @@

needs and SPDX tag.

> +/*
> + * This program is free software; you can redistribute it and/or modify it under
> + * the terms of the GNU General Public License as published by the Free
> + * Software Foundation; either version 3, or (at your option) any later
> + * version.

We can't take GPLv3 code for the kernel.

> + * Under Section 7 of GPL version 3, you are granted additional
> + * permissions described in the GCC Runtime Library Exception, version
> + * 3.1, as published by the Free Software Foundation.
> + *
> + * You should have received a copy of the GNU General Public License and
> + * a copy of the GCC Runtime Library Exception along with this program;
> + * see the files COPYING3 and COPYING.RUNTIME respectively.

unless this exception somehow counts (which I doubt), but for that we'd
actually need it in the tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
