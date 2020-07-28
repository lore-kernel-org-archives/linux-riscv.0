Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D14C433E5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 10:56:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C761B204EA
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 10:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fd/3C0V3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GaqX56Rb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C761B204EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FhEPNtuHhlsoLLQQsI1IRzReOkvVvLeBM8ES6Buoj3I=; b=Fd/3C0V3GrRg39pnPZ4b6EmV9
	Kb0Lm2ektxPwMf28n8coOGIxm8zi7JoyrFEX8Su14NZzhhd8ZBzeqoFHuroCRFX3aiH0CnHr0mTFU
	8mwwEKdpupazoEBEAVrHbYu1TjbofihYq1XXQKibRkaCcBYO/bwGOzYmgKKsG71/NmXrSMlqy9Zze
	XlbFNLyGYVlH+CiOHJWLLY9f3wfPQZ1jiKEmfhuGsfYPGBEy9ASQi6dwyklho+xb/UCoVWgWNSbUJ
	pYaRNUukDB0VKP0PAdwoNEHOze69nWGxYklmu2yfX3X9jamAqvXj0FMXkCRSGGrghSzqioH9oXfbj
	SuEfpLXtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0NHZ-0004Jp-Sa; Tue, 28 Jul 2020 10:56:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0NHQ-0004Fu-49; Tue, 28 Jul 2020 10:56:21 +0000
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F93A204EA;
 Tue, 28 Jul 2020 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595933779;
 bh=rNeOQgk8Ja8EnwwwD3eYzStK24lMrD6z0cTMgy9a9QQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GaqX56Rbj+N1Mz6UyTAyoeiV2UjmyQ1JRRE5tNv2GNU4C8YMxHr+kbNtL4JzJlsAy
 ScdjYPyI8moETB7oZ34zmIQmli78wpYsgkku4f7CIjv3woY2fEo2HxXSUsaNO4HEay
 kodVMJnUU7dTJtF+OWGSFGl3TO2fwrpo3QfCz2LQ=
Date: Tue, 28 Jul 2020 13:56:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH 14/15] x86/numa: remove redundant iteration over
 memblock.reserved
Message-ID: <20200728105602.GB3655207@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
 <20200728104440.GA222284@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728104440.GA222284@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_065620_269029_08FBDD7E 
X-CRM114-Status: GOOD (  17.87  )
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2020 at 12:44:40PM +0200, Ingo Molnar wrote:
> 
> * Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > numa_clear_kernel_node_hotplug() function first traverses numa_meminfo
> > regions to set node ID in memblock.reserved and than traverses
> > memblock.reserved to update reserved_nodemask to include node IDs that were
> > set in the first loop.
> > 
> > Remove redundant traversal over memblock.reserved and update
> > reserved_nodemask while iterating over numa_meminfo.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >  arch/x86/mm/numa.c | 26 ++++++++++----------------
> >  1 file changed, 10 insertions(+), 16 deletions(-)
> 
> I suspect you'd like to carry this in the -mm tree?

Yes.
 
> Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks!

> Thanks,
> 
> 	Ingo

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
