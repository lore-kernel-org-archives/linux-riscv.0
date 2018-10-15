Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFB4C28CF8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 08:41:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A9D52064E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 08:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r28ILzqc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A9D52064E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXd+c3iVGbenOeWqOwJxYKKHSJIOLR6DJpaR5OtxYm4=; b=r28ILzqcn+UCot
	N/6P+PhphoBiJyqXEuylfqDUkE7sFs3rilgHsm8UNoVVJ432NDrigPp0JFCdJeKDkGMJlyAhNz2yO
	OnFn05tNNKjmcEEgKkxVjU4ZhkXxEVhZhuZcFV5fE1ydxAZLrNpP1VcAFgcWRbKxkEGng8IPwW+op
	z/Q6A+wq2JJrSc9pQFhw9U+N8ia37mhvbzUEV5a8EL30FkaYO1hk6f+RWa4CfO+1fudWCMzA+Xa2N
	Ta35FmoFHUQEacDpOfG/3SNyovmR7/7uNj7A60flHG6S5qcr4lNH5mD/UkriRX8Yy6nPILXOWFOqU
	mDI39qaIqRvVQ5HrCxBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gByQl-0000tM-Bv; Mon, 15 Oct 2018 08:40:51 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gByKm-0005MA-3e; Mon, 15 Oct 2018 08:34:40 +0000
Date: Mon, 15 Oct 2018 01:34:39 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jim Wilson <jimw@sifive.com>
Subject: Re: [PATCH] RISC-V: Add futex support.
Message-ID: <20181015083439.GA11826@infradead.org>
References: <20181012200350.5258-1-jimw@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181012200350.5258-1-jimw@sifive.com>
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015083439.ANvzSg_epKMrurbTwofheQ8627RskwkblrgwJokvMRg@z>

> I'm not a kernel expert, so there could be details I got wrong here.  I wasn't
> sure about the memory model support, so I used aqrl which seemed safest, and
> didn't add fences which seemed unnecessary.  I'm not sure about the copyright
> statements, I left in Ralf Baechle's line because I started with his code.
> Checkpatch reports some style problems, but it is the same style as the MIPS
> futex.h, and the uses of ENOSYS appear correct even though it complains about
> them.  I don't know if any of that matters.

Thanks Jim,

a few comments below:

> +/*
> + * This file is subject to the terms and conditions of the GNU General Public
> + * License.  See the file "COPYING" in the main directory of this archive
> + * for more details.
> + *

This should be replaced with an SPDX header:

/* SPDX-License-Identifier: GPL-2.0 */

> +#ifdef __KERNEL__

No need for this ifdef.

> +#include <asm/errno.h>

This shoud be <linux/errno.h>

> +#include <asm/asm.h>
> +
> +#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)		\
> +{									\
> +	uintptr_t __tmp;						\
> +	if (__riscv_atomic) {						\

__riscv_atomic doesn't exist anywhere in the kernel tree.

> +		__enable_user_access();					\
> +		__asm__ __volatile__ (					\
> +		"1:	" insn "				\n"	\
> +		"2:						\n"	\
> +		"	.section .fixup,\"ax\"			\n"	\
> +		"	.balign 4				\n"	\
> +		"3:	li %0,%5				\n"	\
> +		"	jump 2b,%3				\n"	\
> +		"	.previous				\n"	\
> +		"	.section __ex_table,\"a\"		\n"	\
> +		"	.balign " RISCV_SZPTR "			\n"	\
> +		"	" RISCV_PTR " 1b, 3b			\n"	\
> +		"	.previous				\n"	\
> +		: "+r" (ret), "=&r" (oldval),				\
> +		  "+m" (*uaddr), "=&r" (__tmp)				\
> +		: "Jr" (oparg), "i" (-EFAULT)				\

Might it be worth to use named __asm__ argument like we do in
arch/riscv/include/asm/atomic.h?

arch/riscv/include/asm/Kbuild needs to drop the generic-y line
for futex.h now that there is a a real arch-specific one.

arch/riscv/Kconfig should grow an unconditional 'select HAVE_FUTEX_CMPXCHG'
to skip the feature probing.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
