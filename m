Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE48C27C7A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iDGtuKT3+d7GxH2tVp74mU1NRUQ3UtkIfPqvg2wZreM=; b=UGrEtIfFBvVzow
	GCHqgLqzeMW5G+vfIZd7sboVBUpA/KhrwqR58pQFp5gyObofDcToos4g0mGO64TTIbzgDoDeXsYDQ
	Fn17XeLMicgJQK0T2mv6Fi4ZVQHFmgUSg7O0w8uXVV/9LyZBscQw43D4pKTdNmLnuE8hyOXgLVXct
	aCLQzIfdEuRr0W5erU7b0guPWFwJ0NIF9VCPqIkwP/oy5udmq7PzkRaIlUHAN2qUm4dHU7aW3lPek
	ujOdbSGk9/Y7kB24qYAscD36votuthvrswvf5vDw5wp0bFT+/L20UDSw0n1Wc1GbwugcGbcg8aKyI
	FcD8ZGm75yVnkWiPTXUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZzx-0060gm-1r;
	Thu, 17 Aug 2023 10:13:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZzt-0060fK-39;
	Thu, 17 Aug 2023 10:12:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A759B61BB6;
	Thu, 17 Aug 2023 10:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9085C433C7;
	Thu, 17 Aug 2023 10:12:47 +0000 (UTC)
Date: Thu, 17 Aug 2023 11:12:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev,
	WANG Xuerui <kernel@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] asm-generic: partially revert "Unify uapi bitsperlong.h
 for arm64, riscv and loongarch"
Message-ID: <ZN3ynbHyY4SE05ZQ@arm.com>
References: <20230811204930.1529925-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230811204930.1529925-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_031258_074699_2972FEC1 
X-CRM114-Status: GOOD (  16.68  )
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

On Fri, Aug 11, 2023 at 10:49:07PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Unifying the asm-generic headers across 32-bit and 64-bit architectures
> based on the compiler provided macros was a good idea and appears to work
> with all user space, but it caused a regression when building old kernels
> on systems that have the new headers installed in /usr/include, as this
> combination trips an inconsistency in the kernel's own tools/include
> headers that are a mix of userspace and kernel-internal headers.
> 
> This affects kernel builds on arm64, riscv64 and loongarch64 systems that
> might end up using the "#define __BITS_PER_LONG 32" default from the old
> tools headers. Backporting the commit into stable kernels would address
> this, but it would still break building kernels without that backport,
> and waste time for developers trying to understand the problem.
> 
> arm64 build machines are rather common, and on riscv64 this can also
> happen in practice, but loongarch64 is probably new enough to not
> be used much for building old kernels, so only revert the bits
> for arm64 and riscv.
> 
> Link: https://lore.kernel.org/all/20230731160402.GB1823389@dev-arch.thelio-3990X/
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Fixes: 8386f58f8deda ("asm-generic: Unify uapi bitsperlong.h for arm64, riscv and loongarch")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
