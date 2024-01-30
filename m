Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D403C47DA9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 02:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vs4+HN5WdbNgfvmAuZ9WB/WG6RvR09mxt9V1ioh3mzI=; b=WmcHMQctiGBS/v
	6O+XF4O3+nN3t0gxNHJWqIi7871ceVaAVgodqO/MbV0aK1Ztd0gntbsKXsgtFK5dHWiAL+cZKRS5I
	QJV+tzlgCPi5b/oMaj8PpX7KRMr7EC3hWLDZwWMXsQuDTptODzd4S4rSjqImP0Q4nrqXm897bnbKq
	VmaycyNCAn6cduZ4myh9MwiErK3dpowzI9n8UFBDLPO6ZG2I72wXcJGLpifUgFymehHTzcF8d6WjU
	RD3Hf8Ii23NlEi5Ojt1TXU+LAm7mgiPa3K4EeASdjMmF5ozR/PQ9HRn/4Bvr8E2Ouj6tZXN4tZ/v3
	AOfcIZk2lpIvCIsosKrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUe4N-0000000F0QW-3Kch;
	Tue, 30 Jan 2024 02:41:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUe4L-0000000F0PB-0dC2
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 02:41:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9AB0462347;
	Tue, 30 Jan 2024 02:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F94C433F1;
	Tue, 30 Jan 2024 02:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706582508;
	bh=9Ut89lTFvq6e5zUsCJr9shpwYxDSjuxBW81gAsURs/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KpGWGzS0rU9bW2NfkcGOQIeDMhTtcxkWvt03ID4ShGnoZgMPDhszFEpiQSAdIl83D
	 1Ia/QTCZkN8ZaPolnrovBBC2WyYXO3C1avKLVm5nLYcDREeL/et/km68xTwFWndN5y
	 GgXRwlaSs5GxWO2xcSMD23b8GKI7M6BBZtELrfYt+2uJSn9kodwSb+tyfzHpsUaxdb
	 6oY49H9ppM/EkcaFHNPUoorX0C/zaSXWChza3l9JWsBnTiAsbeMWdaAXdhVuPo+/yp
	 gbHyPcyUtT36AT9wn201Jca+iA0jvcBY5A6BV5fogvBtZxoIGziH7R1toxrb3qYSE7
	 mAFe2RG/+zZdQ==
Date: Tue, 30 Jan 2024 10:28:57 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] riscv: optimize memcpy/memmove/memset
Message-ID: <Zbhe6c4kCYv0uIZv@xhacker>
References: <20240128111013.2450-1-jszhang@kernel.org>
 <20240129-prelaw-tweet-ae59a90ded20@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129-prelaw-tweet-ae59a90ded20@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_184149_303748_57F3830B 
X-CRM114-Status: GOOD (  23.92  )
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

On Mon, Jan 29, 2024 at 06:16:13PM +0000, Conor Dooley wrote:
> On Sun, Jan 28, 2024 at 07:10:10PM +0800, Jisheng Zhang wrote:
> > This series is to renew Matteo's "riscv: optimized mem* functions"
> > sereies.
> > 
> > Compared with Matteo's original series, Jisheng made below changes:
> > 1. adopt Emil's change to fix boot failure when build with clang
> > 2. add corresponding changes to purgatory
> > 3. always build optimized string.c rather than only build when optimize
> > for performance
> > 4. implement unroll support when src & dst are both aligned to keep
> > the same performance as assembly version. After disassembling, I found
> > that the unroll version looks something like below, so it acchieves
> > the "unroll" effect as asm version but in C programming language:
> > 	ld	t2,0(a5)
> > 	ld	t0,8(a5)
> > 	ld	t6,16(a5)
> > 	ld	t5,24(a5)
> > 	ld	t4,32(a5)
> > 	ld	t3,40(a5)
> > 	ld	t1,48(a5)
> > 	ld	a1,56(a5)
> > 	sd	t2,0(a6)
> > 	sd	t0,8(a6)
> > 	sd	t6,16(a6)
> > 	sd	t5,24(a6)
> > 	sd	t4,32(a6)
> > 	sd	t3,40(a6)
> > 	sd	t1,48(a6)
> > 	sd	a1,56(a6)
> > And per my testing, unrolling more doesn't help performance, so
> > the "c" version only unrolls by using 8 GP regs rather than 16
> > ones as asm version.
> > 5. Add proper __pi_memcpy and __pi___memcpy alias
> > 6. more performance numbers.
> > 
> > Per my benchmark with [1] on TH1520, CV1800B and JH7110 platforms,
> > the unaligned medium memcpy performance is running about 3.5x ~ 8.6x
> > speed of the unpatched versions's! Check patch1 for more details and
> > performance numbers.
> > 
> > Link:https://github.com/ARM-software/optimized-routines/blob/master/string/bench/memcpy.c [1]
> > 
> > Here is the original cover letter msg from Matteo:
> > Replace the assembly mem{cpy,move,set} with C equivalent.
> > 
> > Try to access RAM with the largest bit width possible, but without
> > doing unaligned accesses.
> > 
> > A further improvement could be to use multiple read and writes as the
> > assembly version was trying to do.
> > 
> > Tested on a BeagleV Starlight with a SiFive U74 core, where the
> > improvement is noticeable.
> 
> However, with allmodconfig it doesn't compile:
>   Redirect to /build/tmp.zzMIlhgQQo and /build/tmp.vxnoxu8G5e
>   Tree base:
>   0c526539d432 ("riscv: optimized memcpy")
>   Building the whole tree with the patch
>   ../arch/riscv/lib/string.c:118:7: error: expected identifier or '('
>   ../arch/riscv/lib/string.c:118:7: error: expected ')'
>   ../arch/riscv/lib/string.c:143:7: error: expected identifier or '('
>   ../arch/riscv/lib/string.c:143:7: error: expected ')'
>   ../arch/riscv/lib/string.c:118:7: error: expected identifier or '('
>   ../arch/riscv/lib/string.c:118:7: error: expected ')'
>   ../arch/riscv/lib/string.c:143:7: error: expected identifier or '('
>   ../arch/riscv/lib/string.c:143:7: error: expected ')'
> 
> Seems to be the case both with llvm and gcc.

Hi Conor,

This is due to missing proper FORTIFY_SOURCE handling.
Below trival patch can fix it :)
I'm waiting for more comments before sending out v2.

diff --git a/arch/riscv/lib/string.c b/arch/riscv/lib/string.c
index 022edda68f1c..bfaab058f2cb 100644
--- a/arch/riscv/lib/string.c
+++ b/arch/riscv/lib/string.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2021 Matteo Croce
  */

+#define __NO_FORTIFY
 #include <linux/types.h>
 #include <linux/module.h>
> 
> Cheers,
> Conor.
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
