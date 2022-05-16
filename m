Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB68FC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 06:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iG8tLKymvvif86sub/YmwGrWWylvFzp/HCF3JCtWO74=; b=vY8KxH1+dXuCM6
	bhvtcgewuK5qKr+gOJ9b2016I/whjQ2wpU0nH5p8zkZLfTbIa/o2i+auVCNtgizpOfcVBykbmxTPQ
	NZ0MwZlUFp58V/a8xC236IWdQDNhZr8nBFOSC0aoUjwYfqLqDV9ejS5HPpcCwwMuC9Wffau9h9Y4+
	jgvwP7V2ZKwT0P0XvKv5N+BAUl9IPFPYKjO3RCciSINnQuLeZlXXmqZiy7kGPr0C+0K0rYfTKQI6y
	qBZ3pWmmeUt13ZkNUa0crvH2pQfWl4A4D531HqzqxSNE86sOMajM+uDlp7++i0IBSjQUd9fV8/8JX
	zUtFXqyH7NXy9SeCglAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqUWD-006FNi-4Y; Mon, 16 May 2022 06:47:49 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nqUWB-006FNR-3B; Mon, 16 May 2022 06:47:47 +0000
Date: Sun, 15 May 2022 23:47:47 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: Re: [PATCH v10 05/16] riscv: Add has_vector/riscv_vsize to save
 vector features.
Message-ID: <YoHzkxDmMegp5oOz@infradead.org>
References: <cover.1652257230.git.greentime.hu@sifive.com>
 <221f72a2ee62cd5350edb5d6a7e8ebb17a7bc321.1652257230.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <221f72a2ee62cd5350edb5d6a7e8ebb17a7bc321.1652257230.git.greentime.hu@sifive.com>
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

On Wed, May 11, 2022 at 08:31:15AM +0000, Greentime Hu wrote:
> +#ifdef CONFIG_VECTOR
> +#include <asm/vector.h>
> +EXPORT_SYMBOL(rvv_enable);
> +EXPORT_SYMBOL(rvv_disable);
> +#endif

As far as I can tell these are not used by any modular code, just by
the later added kernel mode vector enable helpers.

Even if they were used this would need to be EXPORT_SYMBOL_GPL.

> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2017 SiFive
> + * Copyright (C) 2019 Alibaba Group Holding Limited
> + *
> + *   This program is free software; you can redistribute it and/or
> + *   modify it under the terms of the GNU General Public License
> + *   as published by the Free Software Foundation, version 2.
> + *
> + *   This program is distributed in the hope that it will be useful,
> + *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *   GNU General Public License for more details.
> + */

No need for all the GPL boilerplate text when you have an SPDX tag.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
