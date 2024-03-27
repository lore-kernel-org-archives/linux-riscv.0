Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2E1C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsgDRF7yxzR9unz76eWX44qGHLhjrgwOgt+ZdfgxCkw=; b=e+FMaA187QOjkr
	BPVXDDQKqmPKq90gEZVhqDN4GMAMrDjmgtU/03Y2GKaTot2RDaFgDNzj2E8ryzKIjlmJvt71CN/nj
	R6eqMGNXFWkHVWP1cf1ZF3A+S++f8mZYsUyxGqb8+SbJlzHkMsN0Vymw8IlBSZJoZBUtxUum+oH31
	REoBh2BBhKvDIxMImjjBp2uMjzXpCS6Yto+2AL5ZcLgt2BDQbgYpKECShvojUKj5WfvTs2AH+WHSP
	WwGzfJmtWmsAHARMTNFdf6V/EQn2R2COvwu+PDa+hmGghlWt8/cCY4B3wHcKXzmud+y6UbX6M8ACd
	WjHc2sCcIfInxGlDD6vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWdF-0000000ABUw-3OWO;
	Wed, 27 Mar 2024 17:00:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWdB-0000000ABTR-3wYT
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 17:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 567626162F;
	Wed, 27 Mar 2024 17:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F492C433F1;
	Wed, 27 Mar 2024 17:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711558805;
	bh=kFJK27eqsn3b94GlLP703fwEajJD+XlRkEDUgGuh2cI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=LMXB4AEil8mhpE14pDOZqk5V1G188v/TX9AtT86gdloR9J8ZE6YYFIuKlQ6Z5UZai
	 ksIWU4umsus3CI4jcIqamwIW1/1BUK51hMF6nWTO/ybRk6h24jLLwM5k9LsVDzmjen
	 KSlyP8rn5Cl3MBWOuEJuMsCHv3G+qvASXSOYok+8tEK4bRu4FYc4uHhXpqFNyzugKX
	 W86SAEnJ+6FFFqq0dK7TLagxjyFHw/IXsCFF00jRzL4KQm0Ckp17ryUENvaKF3ioao
	 rk7UvQWIGDvrFX2dp1rP4Ha5h/BhxE0MXQRiFlHeaoDv2p1LHr8qkdigCDJAVZXITN
	 LHE94pHdXHP7A==
Mime-Version: 1.0
Date: Wed, 27 Mar 2024 19:00:00 +0200
Message-Id: <D04OYICG7UM7.3SFZE1NKID389@kernel.org>
Cc: <linux-riscv@lists.infradead.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, <linux-modules@vger.kernel.org>, "Naveen
 N . Rao" <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Subject: Re: [PATCH v7 2/2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Conor Dooley" <conor@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240326134616.7691-1-jarkko@kernel.org>
 <20240326134616.7691-2-jarkko@kernel.org>
 <20240326-cape-compacted-e76df066752f@spud>
In-Reply-To: <20240326-cape-compacted-e76df066752f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_100006_093934_4DAC3E7B 
X-CRM114-Status: GOOD (  18.69  )
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

On Tue Mar 26, 2024 at 8:42 PM EET, Conor Dooley wrote:
> On Tue, Mar 26, 2024 at 03:46:16PM +0200, Jarkko Sakkinen wrote:
> > Tacing with kprobes while running a monolithic kernel is currently
> > impossible due the kernel module allocator dependency.
> > 
> > Address the issue by implementing textmem API for RISC-V.
>
> This doesn't compile for nommu:
>   /build/tmp.3xucsBhqDV/arch/riscv/kernel/execmem.c:10:46: error: 'MODULES_VADDR' undeclared (first use in this function)
>   /build/tmp.3xucsBhqDV/arch/riscv/kernel/execmem.c:11:37: error: 'MODULES_END' undeclared (first use in this function)
>   /build/tmp.3xucsBhqDV/arch/riscv/kernel/execmem.c:14:1: error: control reaches end of non-void function [-Werror=return-type]
> Clang builds also report:
> ../arch/riscv/kernel/execmem.c:8:56: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
>
> > 
> > Link: https://www.sochub.fi # for power on testing new SoC's with a minimal stack
> > Link: https://lore.kernel.org/all/20220608000014.3054333-1-jarkko@profian.com/ # continuation
> > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > ---
> > v5-v7:
> > - No changes.
> > v4:
> > - Include linux/execmem.h.
> > v3:
> > - Architecture independent parts have been split to separate patches.
> > - Do not change arch/riscv/kernel/module.c as it is out of scope for
> >   this patch set now.
>
> Meta comment. I dunno when v1 was sent, but versions can you please
> relax with submitting new versions of your patches? There's conversations
> ongoing on v5 at the moment, while this is a more recent version. v2
> seems to have been sent on the 23rd and there's been 5 versions in the
> last day:
> https://patchwork.kernel.org/project/linux-riscv/list/?submitter=195059&state=*
>
> Could you please also try and use a cover letter for patchsets, ideally
> with a consistent subject? Otherwise I have to manually mark stuff as
> superseded.

Point taken but the work has been taken over by Mark and relevant
changes are now sucked into that patch set.

> Thanks,
> Conor.

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
