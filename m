Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0290C5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 15:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWEa34026JwYypmdF2m3Pr70T2w/t/56lL9Bpokc93U=; b=X1Q/5G+vmLUPAK
	lkaJFWVeQcAPW6wGV3rKMQ0pUWkPW7CuZcViikDxVi4ZC36ODPNNddbwe0O0O2qGR8OVd7cg3+fai
	77bQw67BGwdR3/GicMh94lUkVeFV+Z9X5ZESpddWGCb5W88i6cDxHq2LSyTTkm0DJgKWaDBD2JXtk
	rixg+fWzZ0073DWH/rZQl2NwW+31eVcfUzxvJ9L/bPhbI7AIt+cXdbSVqn8KT6ZucztC56QP5Snxu
	i08JjRTq7ARAWjBoP1EFVN+fXlitbWMukg76vaCvqp5VqZ8a8BYqn5/+O7h9gsB1YHhyMiabH0Iwe
	2xYfogszk4z5JI0vnL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzPU-00000006QVb-0WkW;
	Mon, 17 Aug 2026 15:38:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzPR-00000006QVN-2YF8
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 15:37:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B0C140725;
	Mon, 17 Aug 2026 15:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3EC1F000E9;
	Mon, 17 Aug 2026 15:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786981077;
	bh=EQYv+Pegy1JUyIfOBX3dvwkCCsiDghlnpEv268jTriI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lQSS5Yo+sm0YlDB1xoxbKEdEQE1sQpPLGIRutIidNwheE+LQSHnqFu5xAUas5NC7D
	 DULA4Z3qeortr85tjZy/MuOVWn6u+8sL9AQinv4ncR55nJTeoTF7oViwCZbKU9CWRk
	 qHP1V9tSUtmdmDJMzuaedLfRHKv171olpUMf6ZEQFxHJdNLXwAxzbIM1Plpm1+FO6C
	 lqtUAKfcha1U671GiUQQE0l+61UBG92jZMiimGz8qE0MokNx2Sj/3i4dM/FPMMH57Z
	 l9opBdF1P9Vcus8A7tP7q40mCcAScBhzSyVE6+Fi3XGJ7BWU13CUrGf2zFBA+mxJzB
	 0fM5XFQIzrVyA==
Date: Mon, 17 Aug 2026 23:18:16 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] riscv: word-at-a-time: improve find_zero()
Message-ID: <aoMmOB9y1ICSKDMT@xhacker>
References: <20260113122457.27507-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113122457.27507-1-jszhang@kernel.org>
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

On Tue, Jan 13, 2026 at 08:24:54PM +0800, Jisheng Zhang wrote:
> Currently, there are two problems with riscv find_zero():
> 
> 1. When !RISCV_ISA_ZBB, the generic fls64() bring non-optimal code.
> 
> But in word-at-a-time case, we don't have to go with fls64() code path,
> instead, we can fallback to the generic word-at-a-time implementaion.
> 
> What's more, the fls64() brings non-necessary zero bits couting for
> RV32. In fact, fls() is enough.
> 
> 2. Similar as 1, the generic fls64() also brings non-optimal code when
> RISCV_ISA_ZBB=y but HW doesn't support Zbb.
> 
> So this series tries to improve find_zero() by falling back to generic
> word-at-a-time implementaion where necessary. We dramatically reduce
> the instructions of find_zero() from 33 to 8! Also testing with the
> micro-benchamrk in patch1 shows that the performance is improved by
> about 1150%!
> 
> 
> After that, we improve find_zero() for Zbb further by applying similar
> optimization as Linus did in commit f915a3e5b018 ("arm64:
> word-at-a-time: improve byte count calculations for LE"), so that
> we share the similar improvements:
> 
> "The difference between the old and the new implementation is that
> "count_zero()" ends up scheduling better because it is being done on a
> value that is available earlier (before the final mask).
> 
> But more importantly, it can be implemented without the insane semantics
> of the standard bit finding helpers that have the off-by-one issue and
> have to special-case the zero mask situation."
> 
> On RV64 w/ Zbb, the new "find_zero()" ends up just "ctz" plus the shift
> right that then ends up being subsumed by the "add to final length".
> Reduce the total instructions from 7 to 3!
> 
> But I have no HW platform which supports Zbb, so I can't get the
> performance improvement numbers by the last patch, only built and
> tested the patch on QEMU.

Soft ping. No feedback for more than 6 months. Fortunately, this series
can still be cleanly applied.

Thanks

> 
> Jisheng Zhang (3):
>   riscv: word-at-a-time: improve find_zero() for !RISCV_ISA_ZBB
>   riscv: word-at-a-time: improve find_zero() without Zbb
>   riscv: word-at-a-time: improve find_zero() for Zbb
> 
>  arch/riscv/include/asm/word-at-a-time.h | 47 +++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 3 deletions(-)
> 
> -- 
> 2.51.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
