Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12254606A330
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 15:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vLOqS94p;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SJN3cObh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8wAEAr4pWv9u9zeZ1nxsK1OKPCAUmpFApqKe7r0yDNY=; b=vLOqS94ptLiRsZMonWhKKtdLbi
	5cbmpQv3lZ4vxu15Z+uK7LtTzR2MNcwxWXLAme5sWOXwvmqMfIzK+Ka2e/WNSs3wK7ZZ1KtCoBMy7
	JX1l4Ecb7/c/X29HccvewnjKYBXARv3PI/+beBU0tc3eqh5r2IqQV97GHgMTBgIWUS9GU3g/GYOft
	cSXiLvc8MxUNhD+uu07acuUSMydyjTvZ3P39eYYE5VNvIGyYGSNGRnsOVfAEzWLQBJX7GaOmVTNEo
	5BZzPfEn3k9vOvqVP3UZI+d2Nrh4lp+6oqmi/oT6InA/Y3sd9stKoGcmqkqz/XLpYPF1FeOERehQF
	ZE1NVNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWp3-0000000ATC5-3OZ7;
	Thu, 12 Nov 2026 15:34:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWor-0000000AT7M-3kw9
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Nov 2026 15:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qc/FkddggsQXkWqjuQ7ShmIqvBdY0rJWnjsmpHmDKcM=; b=SJN3cObhFwV81L+nWr2WtsaFyt
	ymD3UNYVlMJCQWhEwUpi7HSCqyGJjIQrBK0UEAZD4VbSSR0PAjkvnb5hWXGG9+veNE9XFKIEmZhc0
	w+6d9T+sNJsXaWXtDhejQk/i1cMIcBgrnaPyXB/Tlk5aXVHGEyqbTrtg893CzIk686LcY02g5Wvaj
	7tPKEoVrkJb4cqZDwOFWGBdYJ53g/F0MK41BJRRHOMiVo2lRMNe+Pjqy/yv3FuGHTxsDXnu1WyM+d
	mybvnDM3A/acDxQ1Jy3xyb8idgwOkohJABiYRwqCKq0LvIAoNir5KjAJO7IGCvK4n5CidwpKOJNKS
	nFiPuZdA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWom-0000000AVLo-29HS;
	Thu, 12 Nov 2026 15:34:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4FBD93005AF; Thu, 12 Nov 2026 16:34:27 +0100 (CET)
Date: Thu, 12 Nov 2026 16:34:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ron Economos <re@w6rz.net>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ruidong Tian <tianruidong@linux.alibaba.com>, mingo@redhat.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, oliver.yang@linux.alibaba.com,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] sched: move stack_canary to the start of the
 randomizable region
Message-ID: <20261112153427.GV1779021@noisy.programming.kicks-ass.net>
References: <20260509035014.2220372-1-tianruidong@linux.alibaba.com>
 <20261106160730.GJ1779021@noisy.programming.kicks-ass.net>
 <xhsmhy0b2ntmh.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <34f2ff11-8156-4c32-91dc-e4576807cf3b@w6rz.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34f2ff11-8156-4c32-91dc-e4576807cf3b@w6rz.net>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 05:33:16AM -0800, Ron Economos wrote:

> > ---
> > From: Peter Zijlstra <peterz@infradead.org>
> > Date: Fri, 6 Nov 2026 17:07:30 +0100
> > Subject: [PATCH] riscv, sched: move stack_canary to thread_info
> > 
> > task_struct keeps growing over time. On architectures that compute the
> > per-task stack canary offset from asm-offsets.h and pass it to the
> > compiler via -mstack-protector-guard-offset=, this growth eventually
> > pushes stack_canary beyond what the target ISA can encode.
> > 
> > On RISC-V, canary loads are emitted as
> > 
> >      ld	t0, TSK_STACK_CANARY(tp)
> > 
> > where TSK_STACK_CANARY must fit into a 12-bit signed immediate, i.e.
> > [-2048, 2047].  Once stack_canary sits past byte 2047 of task_struct,
> > the build fails with
> > 
> >      cc1: error: '<N>' is not a valid offset in
> > 	'-mstack-protector-guard-offset='
> > 
> > On RISC-V, CONFIG_STACKPROTECTOR_PER_TASK depends on !RANDSTRUCT, thus
> > stack_canary does not benefit from being in the task_struct randomized
> > region.
> > 
> > Move the RISC-V stack_canary to thread_info, and introduce an access macro
> > to point to the right stack_canary location. Other archs are unaffected.
> > 
> > Not-signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>

Signed-off-by: Peter Zijlstra <peterz@infradead.org>

> > Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> > ---

> 
> I'm seeing this build failure on RISC-V with gcc 16 and
> CONFIG_SCHED_CLASS_EXT=y. The build does not fail with gcc 14. I've tested
> the proposed patch with gcc 16 and it builds and boots (on real hardware)
> just fine. So for what it's worth:
> 
> Tested-by: Ron Economos <re@w6rz.net>
> 
> Also re-adding the RISC-V folks.

Hmm, they went walk-about? Do they need a re-sent? I'm thinking this out
to perhaps go through their tree, given they're actually seeing the
problem.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
