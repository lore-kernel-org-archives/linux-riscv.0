Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B74C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 14:50:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76D8220666
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 14:50:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uyaduU8C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76D8220666
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BbutaSFod4ofouAuurI9/m4htZG66LiUVyTCkyyLN24=; b=uyaduU8CiZJLRZ
	hb/qo/rSlAhPls6OUWOrCsNTG8I8TGK8FkWiDIldANbX/2fVt8L9gDeqwcImhDJsMURMCoGKivRBC
	Re0Al+THGcHjMTpRWIRXEEf7ninL4vzKiHaE+e4/J4JegFyG2oftxtfItrkVrknEs1UCcI08VT2S4
	XqS8dT6JncOY0xsw6m79vVZFQxY+61AFBaYHXvzmTYZXK4NqKXRdLom0HjQbO2syHhW5xcCorIHq5
	X13Ni4LLL3R7MXGdsPPLfGq4IUQueluvN0vLjnoXti8KrOfIi5E/sGwZOp5uhRIHCdx9TV/gzzazd
	jEuZwb3A/5Sx++Tq1COQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7M0a-0002jX-V8; Tue, 02 Oct 2018 14:50:44 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1g7M0Y-0002jC-6x; Tue, 02 Oct 2018 14:50:42 +0000
Date: Tue, 2 Oct 2018 07:50:41 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Zong Li <zongbox@gmail.com>
Subject: Re: [PATCH v3 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
Message-ID: <20181002145041.GC3889@infradead.org>
References: <cover.1538470103.git.zongbox@gmail.com>
 <2144f372b95f236afe47da4fc575a42ec95e8239.1538470103.git.zongbox@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2144f372b95f236afe47da4fc575a42ec95e8239.1538470103.git.zongbox@gmail.com>
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
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002145041.Q_Hxr3RdKdElPcjpCZUEL5tjg9Ciq2FByRczEUq4EGw@z>

> The udivmoddi4 and umoddi3 are copies from libgcc in gcc. There are other
> functions use the udivmoddi4 in libgcc, so I separate the umoddi3 and
> udivmoddi4 for flexible extension in the future.

Can you please mention which exact version of an external projected
you imported things from?  That will generally help if/when someone
has to dig into diverging versions.

> +++ b/lib/udivmoddi4.c
> @@ -0,0 +1,310 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see the file COPYING, or write
> + * to the Free Software Foundation, Inc.
> + */

The SPDX tag was supposed to replace this boiler plate.  On the other
hand I'm surpriced there is no Copyright statement here - the FSF is
usually very good about having them uptodate in every GNU project.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
