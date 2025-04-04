Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796DAC36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 18:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXbQ0/0oXNpgdQ4vkPbTv0hCNsBaInjoyQpNklF8XlM=; b=nZpwGOn5gKFWhT
	WpwNoBeXLUb9sxgGRExxQQLq/GK9iH8CZmvRyesr8tByFpUMB7UbE5y/D9NqrPWK0NwbxWwmhbn1m
	prcYdnxhTkUl9F4kOC35MDQKPR8hGV4o0wpYC65I88WL3mc/ubA+I0iP9pb4dolPi1+zwCxxAOJeh
	MQ3MqIGihD/BGQYKTQRIdZ/rTtNWgexDw6zSHODSf0SQOEc4wVEsem0agY3v2lT2qW6yZJGmveXI0
	8dqpIhY8yxMfLdx5Bm0WZicuSd3JMGMsPDYtcTKerwgHGx5EBkfnIJN7mlLwfaKmAb3WsJ48hYSWy
	tvjwywToe0RZL2BV7InA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lX3-0000000CV8W-2nA0;
	Fri, 04 Apr 2025 18:12:45 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lEn-0000000CScB-1qGr
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 17:53:55 +0000
Message-ID: <5348670b-1bbf-4948-9b3a-9da210debf03@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1743789231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1W01rl80m0H+/UfHPagC4644fJ169vg9eQeKL5M7SrY=;
	b=OJWqMBN1YxCoLFXWKHl/O9O9Rc2L/2yYoFUoofAtfxbdw6A1EN6Gd63XQ5lMZig7zs20+N
	m8EsYSHFfkr7fFUY5mJ8teFtWcfBQ3Y80cgrUkWCp+txnJCF1uPRwJz3tt2Q7HO8Ltwyc8
	Fr+yw+f9VdHtOPG2JSkoQoVCw67eY8i63qxC1obKnR7gYXbZZli5aPQERgGFnXlGNMw7md
	V3OEj6QxRM9nevr9NylA3vhJ5M0uLtn3ADVLt/btIzcRfMq6DFtQM5oZi5xhi3uqHkjYCD
	e1VO0jacI8rz+YDDg3Ad3yF2fsxFtrdO32O2w1gWUTaJ5y3i+PoyL6mP8SBaGg==
Date: Fri, 4 Apr 2025 19:53:46 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] riscv: introduce asm/swab.h
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, Zhihang Shao <zhihang.shao.iscas@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 linux-arch@vger.kernel.org
References: <20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com>
 <20250403-riscv-swab-v3-2-3bf705d80e33@iencinas.com>
 <aa29e983-78b9-430b-b8a6-e64de5f4ca12@codethink.co.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas <ignacio@iencinas.com>
In-Reply-To: <aa29e983-78b9-430b-b8a6-e64de5f4ca12@codethink.co.uk>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_105353_769305_B94599C2 
X-CRM114-Status: GOOD (  13.33  )
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



On 4/4/25 17:47, Ben Dooks wrote:
> I was having a look at this as well, using the alternatives macros.
> 
> It would be nice to have a __zbb_swab defined so that you could do some
> time checks with this, because it would be interesting to see the
> benchmark of how much these improve byteswapping.

I get your point, but isn't what you propose equivalent to benchmarking 
__arch_swab vs ___constant_swab? 
 
> Also, I wonder if it is possible to say to the build system we must
> have ZBB therefore only emit ZBB for cases where you are building a
> kernel for an known ZBB system.

You can disable ZBB instructions if you do RISCV_ISA_ZBB=n. 

config RISCV_ISA_ZBB
	bool "Zbb extension support for bit manipulation instructions"
	depends on TOOLCHAIN_HAS_ZBB
	depends on RISCV_ALTERNATIVE
	default y
	help
	   Adds support to dynamically detect the presence of the ZBB
	   extension (basic bit manipulation) and enable its usage.

	   The Zbb extension provides instructions to accelerate a number
	   of bit-specific operations (count bit population, sign extending,
	   bitrotation, etc).

	   If you don't know what to do here, say Y.

However, statically assuming ZBB instruction support is another beast
and I don't really have an informed opinion about this. Perhaps in a few
years?

Thanks for the review!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
