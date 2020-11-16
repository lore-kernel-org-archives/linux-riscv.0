Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AEFC2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 17:49:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECCD820B80
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 17:49:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MaAh7xQG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECCD820B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y6ec2sNOI/qnK1O3F4P+dym7vx/FPY1TfoaTOExPmV4=; b=MaAh7xQGgm3/Oy+6cFkriAiwX
	nIkRN7cHV+8nhkoJK4QXecdWt76OIdkmBkxFdB+p0YR1oH84TN1hYezvYUZEO1KMhfcSuwhhL8qlN
	9gv8K2JFS+zxwRMkprwPZ0cH4k7Wq8DLIjIRV88CR5WNeouEXTxA9+Osn0B0/7p7qDCyErViyhs0Z
	dYBM2zKZktL5OfJSecTuHmBst+nVPGuiklliTBg015AVA6B/E9U+E0fVqOnalfAQ8zGSUIyoD2EZK
	05cS7atH9xkZKzFH3IKuLQuNSsjFf61VZ9/hv20oS89WpJsg3QG/ZKawZNdxCf99BxttDpWPCatk0
	bmvAg3DUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keicR-00080d-TL; Mon, 16 Nov 2020 17:48:47 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keibC-0007IT-8x
 for linux-riscv@lists.infradead.org; Mon, 16 Nov 2020 17:47:33 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CZc3K30kTz1rx7x;
 Mon, 16 Nov 2020 18:47:25 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CZc3K26fdz1qtZ6;
 Mon, 16 Nov 2020 18:47:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Fcuw266vvLxM; Mon, 16 Nov 2020 18:47:24 +0100 (CET)
X-Auth-Info: wxbQwUFoWhqFj8s7Vg1V6Cvh2UMn555Uc46N/96aYxMCH5Z0HHAeNhVd/Wcn8Qne
Received: from igel.home (ppp-46-244-169-244.dynamic.mnet-online.de
 [46.244.169.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 16 Nov 2020 18:47:24 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id C6D3B2C3328; Mon, 16 Nov 2020 18:47:23 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Arvind Sankar <nivedita@alum.mit.edu>
Subject: Re: [PATCH] compiler.h: Fix barrier_data() on clang
References: <20201014212631.207844-1-nivedita@alum.mit.edu>
X-Yow: It's the land of DONNY AND MARIE as promised in TV GUIDE!
Date: Mon, 16 Nov 2020 18:47:23 +0100
In-Reply-To: <20201014212631.207844-1-nivedita@alum.mit.edu> (Arvind Sankar's
 message of "Wed, 14 Oct 2020 17:26:31 -0400")
Message-ID: <87sg999ot0.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_124730_685068_C15D4E9A 
X-CRM114-Status: GOOD (  15.34  )
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

On Okt 14 2020, Arvind Sankar wrote:

> Commit
>   815f0ddb346c ("include/linux/compiler*.h: make compiler-*.h mutually exclusive")
>
> neglected to copy barrier_data() from compiler-gcc.h into
> compiler-clang.h. The definition in compiler-gcc.h was really to work
> around clang's more aggressive optimization, so this broke
> barrier_data() on clang, and consequently memzero_explicit() as well.
>
> For example, this results in at least the memzero_explicit() call in
> lib/crypto/sha256.c:sha256_transform() being optimized away by clang.
>
> Fix this by moving the definition of barrier_data() into compiler.h.
>
> Also move the gcc/clang definition of barrier() into compiler.h,
> __memory_barrier() is icc-specific (and barrier() is already defined
> using it in compiler-intel.h) and doesn't belong in compiler.h.
>
> Signed-off-by: Arvind Sankar <nivedita@alum.mit.edu>
> Fixes: 815f0ddb346c ("include/linux/compiler*.h: make compiler-*.h mutually exclusive")

This breaks build on riscv:

  CC [M]  drivers/net/ethernet/emulex/benet/be_main.o
In file included from ./include/vdso/processor.h:10,
                 from ./arch/riscv/include/asm/processor.h:11,
                 from ./include/linux/prefetch.h:15,
                 from drivers/net/ethernet/emulex/benet/be_main.c:14:
./arch/riscv/include/asm/vdso/processor.h: In function 'cpu_relax':
./arch/riscv/include/asm/vdso/processor.h:14:2: error: implicit declaration of function 'barrier' [-Werror=implicit-function-declaration]
   14 |  barrier();
      |  ^~~~~~~
cc1: some warnings being treated as errors
make[5]: *** [scripts/Makefile.build:283: drivers/net/ethernet/emulex/benet/be_main.o] Error 1
make[4]: *** [scripts/Makefile.build:500: drivers/net/ethernet/emulex/benet] Error 2
make[3]: *** [scripts/Makefile.build:500: drivers/net/ethernet/emulex] Error 2
make[2]: *** [scripts/Makefile.build:500: drivers/net/ethernet] Error 2
make[1]: *** [scripts/Makefile.build:500: drivers/net] Error 2
make: *** [Makefile:1799: drivers] Error 2

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
