Return-Path: <SRS0=diLN=LP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D55C48BE5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 14:27:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C68DA600D4
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 14:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C68DA600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rkaez9fEgpV93x3OS0m1h8ZqQSH2BOctBt+PbYDhR4I=; b=p6SsNis+AAW1fe
	2dNSrWw6vjEKtwkRKQTjEqUqARVQRHIGHOvcPsrHAxAnBQFUzfopgr4GHfb7fO2FHljVV+PI9EXR4
	GVlYuQTCXld2ULTsqlYWOyB4tW8nE8FrPMUTXn6gL/EJfhNPMrE+CDLzb+sqNdrexue2udKGNpjlJ
	6pTUzLALQN6kQaOZczL/BobO6IvxZG1ZYqwXi+VXVtmnm+Jyuq0mPvWFW3q1O+qa0r07RRYbUO7a+
	wUaywZw+UgepX2iRUpEy1p9jzi5JvekqS4Z21g4pGt453fdR1H8fHw3rXbdGs1VPMUrdB7QGeuj2S
	U4hvZUYyIHFL56yljknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvKtC-003klv-Th; Mon, 21 Jun 2021 14:27:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvKt3-003kkX-E1
 for linux-riscv@bombadil.infradead.org; Mon, 21 Jun 2021 14:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MMc2KGdoutHfZtgfbYoRfjF4kYXtJrSnb/pfXowYFuM=; b=a7IMFKTTLtH6QzE9oeMOnqWREB
 k74qpt9XqgIAsd8S9v9Ne2UShz2hSFYEGNbPUZtSwlg+cIk8tvrsOyP3mi08RLF+ZMj62OG1F9+Pw
 gaZfMY5/ziFDUMvDSiNQbxCElDxzlJ2zoObDofYFLCNtlPs+d2JeEYWboNKhJBP0sw3nMOecTf5sN
 qBJ3hi+T4QI/DgkLXEzsg5FZspWeU9g1Vh6c3WyJCA0rin+yrt/aImCiv373zIVGxKTlNTLV2eS4w
 vF3yy0w1zUvMUi8wRFYqbH8xoYyX6W3wpoTGoKnu9clF8lCNq0Yo86bQOCpOhXV75gOxYMj2R5CT7
 3I3pdb6g==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1lvKsh-00DB4u-Dk; Mon, 21 Jun 2021 14:26:38 +0000
Date: Mon, 21 Jun 2021 15:26:31 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 1/3] riscv: optimized memcpy
Message-ID: <YNChl0tkofSGzvIX@infradead.org>
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <20210617152754.17960-2-mcroce@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617152754.17960-2-mcroce@linux.microsoft.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Thu, Jun 17, 2021 at 05:27:52PM +0200, Matteo Croce wrote:
> +extern void *memcpy(void *dest, const void *src, size_t count);
> +extern void *__memcpy(void *dest, const void *src, size_t count);

No need for externs.

> +++ b/arch/riscv/lib/string.c

Nothing in her looks RISC-V specific.  Why doesn't this go into lib/ so
that other architectures can use it as well.

> +#include <linux/module.h>

I think you only need export.h.

> +void *__memcpy(void *dest, const void *src, size_t count)
> +{
> +	const int bytes_long = BITS_PER_LONG / 8;
> +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> +	const int mask = bytes_long - 1;
> +	const int distance = (src - dest) & mask;
> +#endif
> +	union const_types s = { .u8 = src };
> +	union types d = { .u8 = dest };
> +
> +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> +	if (count < MIN_THRESHOLD)

Using IS_ENABLED we can avoid a lot of the mess in this
function.

	int distance = 0;

	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
		if (count < MIN_THRESHOLD)
			goto copy_remainder;

		/* copy a byte at time until destination is aligned */
		for (; count && d.uptr & mask; count--)
			*d.u8++ = *s.u8++;
		distance = (src - dest) & mask;
	}

	if (distance) {
		...

> +		/* 32/64 bit wide copy from s to d.
> +		 * d is aligned now but s is not, so read s alignment wise,
> +		 * and do proper shift to get the right value.
> +		 * Works only on Little Endian machines.
> +		 */

Normal kernel comment style always start with a:

		/*


> +		for (next = s.ulong[0]; count >= bytes_long + mask; count -= bytes_long) {

Please avoid the pointlessly overlong line.  And (just as a matter of
personal preference) I find for loop that don't actually use a single
iterator rather confusing.  Wjy not simply:

		next = s.ulong[0];
		while (count >= bytes_long + mask) {
			...
			count -= bytes_long;
		}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
