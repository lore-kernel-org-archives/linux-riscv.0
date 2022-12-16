Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E797C001B2
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 19:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdwLqy9MUalhPy51JgtTTryx6DBM/pGr2Fy0FVObw3Y=; b=LpG4TkHLuqwAbW
	Ok0g/i0LFQXRL2lRGAWbTpc5vD6h1hZHLAT0AVDLe/7O/u2lnZWtP18JSmDe+ZE7o375rQ+2XQsMs
	IEoJK3xLcje5iSnR7jwpisgWnrQhrJkxP2kLPNvj7ME72zV08qzNROyU/+w8IqMb3PYSrM+XgVKwA
	SzYiJX1tcbGEu78cQGAUPIlyVxJjKwTv5oF0kjS6NfBc2VWD0x4OWha0fBAd+YDz16GyppZ+u09ZE
	Ez60QoGHzccZvI9gLrKo7B8wLPmi/jfMN7VFimC1zdIcmdzNjuaX3oIntegM4TO0HYi8l2PtiQmdD
	WkGbfOji2XS9x1ejeegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6G1D-0000Ec-24; Fri, 16 Dec 2022 19:05:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6G17-00008H-Lc
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 19:05:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9B3C6B81DF5;
	Fri, 16 Dec 2022 19:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C45DC433EF;
	Fri, 16 Dec 2022 19:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671217506;
	bh=shfUHq2wGxReUzcQjKTZ7wMKOWDadGVEZARJx4hBfEY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Oyx/7DRgUXL6tei+4m/5+Sf71ppVqYmBeWF4YhQRl6G/JlVL8P0jMBr0xakVRF0AQ
	 4zBAPFEAAqlYepxOQ1UmM9qM6lBTbgxgb2i7IqnqFHhwj9932MO+HWwS9HBG6a1hmT
	 zCVB4IRJqibX98wvumDM/IpqpA/IdPzjJ9iA5Ev/UTJaVDSRuFqaHWAlDVaHNBkoko
	 TlfOHYkMT3shjWD9iLmw6+RdUzBV4HHbA+15t2PnQDWtRaYvgXvbBgqIYmaJLQw4xb
	 F6mWQ2Xs/I+4Cprx6vHOXzvD1SfiHS6EVGZHuR6tvXef74J0HbOb0mqQKMOksS5sh+
	 WGrEpu5Fy7g/A==
Date: Fri, 16 Dec 2022 11:05:05 -0800
From: Conor Dooley <conor@kernel.org>
To: Saleem Abdulrasool <abdulras@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: avoid enabling vectorized code generation
User-Agent: K-9 Mail for Android
In-Reply-To: <20221216185012.2342675-1-abdulras@google.com>
References: <20221216185012.2342675-1-abdulras@google.com>
Message-ID: <D734C5A0-5FE1-4287-BF7B-A1DE97C00D55@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_110509_875234_98FC30EC 
X-CRM114-Status: GOOD (  12.10  )
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

Hey Saleem,

On 16 December 2022 10:50:12 GMT-08:00, Saleem Abdulrasool <abdulras@google.com> wrote:
>The compiler is free to generate vectorized operations for zero'ing
>memory.  The kernel does not use the vector unit on RISCV, similar to
>architectures such as x86 where we use `-mno-mmx` et al to prevent the
>implicit vectorization.  Perform a similar check for
>`-mno-implicit-float` to avoid this on RISC-V targets.
>
>Signed-off-by: Saleem Abdulrasool <abdulras@google.com>
>---
> arch/riscv/Makefile | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>index 0d13b597cb55..68433476a96e 100644
>--- a/arch/riscv/Makefile
>+++ b/arch/riscv/Makefile
>@@ -89,6 +89,10 @@ KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
> # architectures.  It's faster to have GCC emit only aligned accesses.
> KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
> 
>+# Ensure that we do not vectorize the kernel code when the `v` extension is
>+# enabled.  This mirrors the `-mno-mmx` et al on x86.

The v extension should not be enabled at all though, right?
Excuse my naivity here, but what am I missing?
The vector support thread is here:
https://lore.kernel.org/linux-riscv/20220921214439.1491510-1-stillson@rivosinc.com/

What have I missed that causes a problem without that patchset?
And if I have missed something, this patch needs to be cc: stable?

Thanks,
Conor.

>+KBUILD_CFLAGS += $(call cc-option,-mno-implicit-float)
>+
> ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
> prepare: stack_protector_prepare
> stack_protector_prepare: prepare0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
