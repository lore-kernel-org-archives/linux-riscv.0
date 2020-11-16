Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999CFC4742C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 18:11:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8547C205CB
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 18:11:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TL/1czrl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B0IYZ8EH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8547C205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WFCJ+hbY5muTk9CoTUbdaQlaEeib9Bsg2jzQtA2foC0=; b=TL/1czrlzZ6dMTBiyypVnYDIu
	v2SNidiFTSj7QLEDC17LznSD9ynP2PD/Wvs0TeHT6nNXNxFiI5CG9++jhFRiiaSULRZDe6HZmh0rM
	RKy351v6HqO6lEXHXrW4AfPxxV1Wdn2B2PlWefr8yQc/yVfM9nzee8Sp0OL5ueC3lfiwizJvMM0kV
	rnixHiuZIveLocgwHGEMMLuETx+Lh4LjEVN5j3KQeAaEB0ngc+h3+98wl8lXTtdeG+g+bEaSpZFJJ
	N1eWe7gAfxxYliqYjhLmnYlAQzDCl+Kx3MjvJMcAbj0zd5NZ5oqfD4FQZdAHzE5fK2zhmkDzGGkCF
	u3aQ8AaIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keiyc-00062D-Dk; Mon, 16 Nov 2020 18:11:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keiya-00060x-6P
 for linux-riscv@merlin.infradead.org; Mon, 16 Nov 2020 18:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ePseZts8+sY/Qq1NpQZifi/yR1ZOAX2fbODxhYzGnJ4=; b=B0IYZ8EH+FGra1v/AcYrqI98vC
 TDAIs2dpqzgrXLrekdRwdsgsCiGf8WnzAkPegUYHUGo23yVR6y5ux+ETaHDN2hq4wzCbYQSsfbS/A
 Qb0RlJO/iqXbY6z93NOHeBKXdQyxWpXCj/Bf5P/9WQaMVaWOKKdJU2UTTarucWpQ3hz9c2a0KqE0g
 JBmPPia3W/Wr69GQvrWdeUNLgt/MIlCe4/dosu1nG04RY39pcppvwK5AL0b4TFxCRyaMKoTbyX54r
 bChyLCOUzXEFt9KI1KJT2ndV253z+vUeBSpfRPZiIYrhlzpz7RRKPDnBTb5nNY+2r65YFzr9kHJRt
 dtSKd0Og==;
Received: from [2601:1c0:6280:3f0::f32]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keihJ-0002bH-L2; Mon, 16 Nov 2020 17:53:50 +0000
Subject: Re: [PATCH] compiler.h: Fix barrier_data() on clang
To: Andreas Schwab <schwab@linux-m68k.org>,
 Arvind Sankar <nivedita@alum.mit.edu>
References: <20201014212631.207844-1-nivedita@alum.mit.edu>
 <87sg999ot0.fsf@igel.home>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0dbaca2d-9ad0-8c1a-a280-97be01cac2bd@infradead.org>
Date: Mon, 16 Nov 2020 09:53:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87sg999ot0.fsf@igel.home>
Content-Language: en-US
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/16/20 9:47 AM, Andreas Schwab wrote:
> On Okt 14 2020, Arvind Sankar wrote:
> 
>> Commit
>>   815f0ddb346c ("include/linux/compiler*.h: make compiler-*.h mutually exclusive")
>>
>> neglected to copy barrier_data() from compiler-gcc.h into
>> compiler-clang.h. The definition in compiler-gcc.h was really to work
>> around clang's more aggressive optimization, so this broke
>> barrier_data() on clang, and consequently memzero_explicit() as well.
>>
>> For example, this results in at least the memzero_explicit() call in
>> lib/crypto/sha256.c:sha256_transform() being optimized away by clang.
>>
>> Fix this by moving the definition of barrier_data() into compiler.h.
>>
>> Also move the gcc/clang definition of barrier() into compiler.h,
>> __memory_barrier() is icc-specific (and barrier() is already defined
>> using it in compiler-intel.h) and doesn't belong in compiler.h.
>>
>> Signed-off-by: Arvind Sankar <nivedita@alum.mit.edu>
>> Fixes: 815f0ddb346c ("include/linux/compiler*.h: make compiler-*.h mutually exclusive")
> 
> This breaks build on riscv:
> 
>   CC [M]  drivers/net/ethernet/emulex/benet/be_main.o
> In file included from ./include/vdso/processor.h:10,
>                  from ./arch/riscv/include/asm/processor.h:11,
>                  from ./include/linux/prefetch.h:15,
>                  from drivers/net/ethernet/emulex/benet/be_main.c:14:
> ./arch/riscv/include/asm/vdso/processor.h: In function 'cpu_relax':
> ./arch/riscv/include/asm/vdso/processor.h:14:2: error: implicit declaration of function 'barrier' [-Werror=implicit-function-declaration]
>    14 |  barrier();
>       |  ^~~~~~~
> cc1: some warnings being treated as errors
> make[5]: *** [scripts/Makefile.build:283: drivers/net/ethernet/emulex/benet/be_main.o] Error 1
> make[4]: *** [scripts/Makefile.build:500: drivers/net/ethernet/emulex/benet] Error 2
> make[3]: *** [scripts/Makefile.build:500: drivers/net/ethernet/emulex] Error 2
> make[2]: *** [scripts/Makefile.build:500: drivers/net/ethernet] Error 2
> make[1]: *** [scripts/Makefile.build:500: drivers/net] Error 2
> make: *** [Makefile:1799: drivers] Error 2

Hi,
What kernel version are you building?
This should be fixed in 5.10-rc4 by
commit 3347acc6fcd4ee71ad18a9ff9d9dac176b517329;
specifically this portion of it:

diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
index 798027bb89be..640f09479bdf 100644
--- a/include/asm-generic/barrier.h
+++ b/include/asm-generic/barrier.h
@@ -13,6 +13,7 @@
 
 #ifndef __ASSEMBLY__
 
+#include <linux/compiler.h>
 #include <asm/rwonce.h>
 
 #ifndef nop



-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
