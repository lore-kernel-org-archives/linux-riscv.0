Return-Path: <SRS0=itc2=NH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A40C46475
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Oct 2018 07:56:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F37820856
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Oct 2018 07:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g6OspTWu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F37820856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lOU/KgNph2qppJ25cRLs37uz2qj30UF13DtB//8YgxM=; b=g6OspTWugjO+3g
	0h0YIY1MPgLixVIkaOuWnO5adr056otClbuUKHhSIxVKKPpAHx3zOjmznOtFVuxvheXBGkEpkS+wc
	T9fQ2O2aBS+sIjkblY9lx4ZfpHDcqNGmupWznq2vJjEoT3h4WAoI2iG/0klu2AgNPl4h2Y/7Y71wg
	1Z6DbQtdhOwsiXnVJ4bnA8fb9kl65ZeIycJY9/Djp/TY/Z6GjCBowRnUOPOqeJubWktlQ0I38kZ1h
	7MwDHbn6DdrLwNzjO5iN+NLuWYf37goLggd6wJaMOts9tDi7mJ265TwFwnM9a5XLx+GCphaHinpDq
	ZJehT20za0jrMHM3LxGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gGJRx-0006bb-JD; Sat, 27 Oct 2018 07:56:01 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gGJRw-0006Yp-5k; Sat, 27 Oct 2018 07:56:00 +0000
Date: Sat, 27 Oct 2018 00:55:59 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 2/2] RISC-V: Add support for SECCOMP
Message-ID: <20181027075559.GB7868@infradead.org>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-3-palmer@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181024204036.8799-3-palmer@sifive.com>
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
Cc: kstewart@linuxfoundation.org, aou@eecs.berkeley.edu, wad@chromium.org,
 paul@paul-moore.com, Greg KH <gregkh@linuxfoundation.org>,
 Wesley Terpstra <wesley@sifive.com>, david.abdurachmanov@gmail.com,
 linux-kernel@vger.kernel.org, eparis@redhat.com, luto@amacapital.net,
 dhowells@redhat.com, linux-audit@redhat.com, pombredanne@nexb.com,
 linux-riscv@lists.infradead.org, tglx@linutronix.de, keescook@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181027075559.7okjfpM40Fj2-wh9Jtg8NElKxq17QeUwBC2a5mo7S3Q@z>

I don't know much about seccomp, so just a few general nitpicks:

On Wed, Oct 24, 2018 at 01:40:36PM -0700, Palmer Dabbelt wrote:
> +	bool "Enable seccomp to safely compute untrusted bytecode"
> +
> +	help

The empty line above is odd, please drop it.

> +++ b/arch/riscv/include/asm/seccomp.h
> @@ -0,0 +1,10 @@
> +/* Copyright 2018 SiFive, Inc. */
> +/* SPDX-License-Identifier: GPL-2.0 */

The SPDX tag should go into the first line.

> +#ifndef _ASM_RISCV_SECCOMP_H
> +#define _ASM_RISCV_SECCOMP_H
> +
> +#include <asm/unistd.h>
> +
> +#include <asm-generic/seccomp.h>

And while at it I'd drop this empty line as well.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
