Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F288EC4706F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 03:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCk1a7NSzvpj0eARlgrIjEjDmjLtUmsk4fR4BBrUWdI=; b=ZYjtgnG8MFLhY0
	+dwp1+SroArlCUlxAg+1wgmwq1ZmsxppQx3730KRfkGTAqZRIihyYfcCel3gPuY/wD1BpM5RkdVEu
	k7f5PssacNvqPN/RT15GFkrL021lEdAF2yVxA2NANGcX/uiRgKzw35O/jwXYUBHcnLtA0+ZM/rI6J
	l4416OChdWweOfXP8dtQhpBu/k+MEuIRKES+BtifeXE6Ifw4kGAHfNYYvw1qphw3agsyU6i2UwVaL
	/GSHHxdonG378CpuzlVFAu59KIX370P0cqIBNMQY7b5LWSsG9zZyozFcl4oACN3tTXTGQybxlHQYz
	aYkdPN7pag8lm4sCCewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKVc4-0071tH-2e;
	Tue, 02 Jan 2024 03:38:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKVc2-0071sS-0R
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 03:38:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 83D21CE0B79;
	Tue,  2 Jan 2024 03:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB25C433C8;
	Tue,  2 Jan 2024 03:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704166719;
	bh=sqjF+WOs+/Ej1dm+kRiv34bMwdUQi5o86nzg58LpkDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DbN/lWB+mMNkcDOyfAmuvldxhZoz4+kmWPEmLA5B/1PxsWD+5Xj9PbHL/KBycP2s7
	 MbSOthA8nrqgEAtFNpFEVqdPKCLGdpuXc5yrseVEOo8mywulDkMIwrtjFRLZ5Z0ow6
	 +dG4bf9OIEIhFG8PZqpj2Ot0E2qYPmEPF6uxR7qV+wvk+6Yc+KBGZ8F0USKJ6ug7+G
	 fb6Wftzh6J+fChGZOY7FDMItIJNS7+qUpEkZRH6THKmgmAILrvooJ27F1waBhFNnHl
	 f0/EiSV4Uox/QrDzrFAniIXnpNTapL7vWjUpw/uTFe3s3lHIKEXedq+RFWmB6jNZ/9
	 Vs4F5EdGiP8Ew==
Date: Tue, 2 Jan 2024 11:25:57 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 4/4] riscv: enable HAVE_FAST_GUP if MMU
Message-ID: <ZZOCRZjBch1grrFp@xhacker>
References: <20231219175046.2496-1-jszhang@kernel.org>
 <20231219175046.2496-5-jszhang@kernel.org>
 <3d36ca3c-9a91-41a7-9e68-288982c2c8a8@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d36ca3c-9a91-41a7-9e68-288982c2c8a8@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_193842_341494_ABAC6443 
X-CRM114-Status: GOOD (  18.14  )
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

On Sun, Dec 31, 2023 at 07:37:33AM +0100, Alexandre Ghiti wrote:
> On 19/12/2023 18:50, Jisheng Zhang wrote:
> > Activate the fast gup for riscv mmu platforms. Here are some
> > GUP_FAST_BENCHMARK performance numbers:
> > 
> > Before the patch:
> > GUP_FAST_BENCHMARK: Time: get:53203 put:5085 us
> > 
> > After the patch:
> > GUP_FAST_BENCHMARK: Time: get:17711 put:5060 us
> 
> 
> On which platform did you run this benchmark?

T-HEAD th1520(cpufreq isn't enabled since the clk/pll isn't upstreamed,
so cpu is running at the default freq set by u-boot)
> 
> 
> > 
> > The get time is reduced by 66.7%! IOW, 3x get speed!
> 
> 
> Well done!
> 
> Thanks,
> 
> Alex
> 
> 
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >   arch/riscv/Kconfig               | 1 +
> >   arch/riscv/include/asm/pgtable.h | 6 ++++++
> >   2 files changed, 7 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index d3555173d9f4..04df9920282d 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -119,6 +119,7 @@ config RISCV
> >   	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
> >   	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
> >   	select HAVE_EBPF_JIT if MMU
> > +	select HAVE_FAST_GUP if MMU
> >   	select HAVE_FUNCTION_ARG_ACCESS_API
> >   	select HAVE_FUNCTION_ERROR_INJECTION
> >   	select HAVE_GCC_PLUGINS
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index ab00235b018f..c6eb214139e6 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -673,6 +673,12 @@ static inline int pmd_write(pmd_t pmd)
> >   	return pte_write(pmd_pte(pmd));
> >   }
> > +#define pud_write pud_write
> > +static inline int pud_write(pud_t pud)
> > +{
> > +	return pte_write(pud_pte(pud));
> > +}
> > +
> >   static inline int pmd_dirty(pmd_t pmd)
> >   {
> >   	return pte_dirty(pmd_pte(pmd));

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
