Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551DEC433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 11:31:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 230852065C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 11:31:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jjlL0T+4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7HSEqdJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 230852065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aqKP8mCXcDrDhdO73roCfOM6hDzXUbFh73nGYN+JlaM=; b=jjlL0T+4elYFcfK0iB3rtkHkR
	Eq9BLrrkBJwCOKsUUkwwAc+2rfbY8+6r9zDehNgl0Tmdz1hhXhzfiqANmzexlsllqbRpr4ro7NE+g
	vdFJIWvZldTa22kPhgt+1RlRPwJbWjiVAFb/jgOPw1MhF3UT2Ac6gEkbcSb/xnraNaFqtddThJCUE
	O3Fr3rwMFAPFoZoSJvgGjGzyvIslvuQOVKPf064DPHuK8hsugwpHHt9xu5v8/ibl6m+xh6Tb9fIa6
	qTG3kQ2UZjCz4hRav/DxE6+JyRRKrpH0XAaXChH45cd0CG+sYwoqRqNmsb/AMey/dGPfKoxQ7emyr
	uDC+yJPSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0NpY-00031v-6A; Tue, 28 Jul 2020 11:31:36 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0NpT-0002ze-Da; Tue, 28 Jul 2020 11:31:32 +0000
Received: by mail-ej1-x644.google.com with SMTP id l4so20222720ejd.13;
 Tue, 28 Jul 2020 04:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=y5PIG9gv3+Q65q73c5WJL/D8ixTHr55LzcpS0la2b94=;
 b=P7HSEqdJclVd5Bnzob/XF2RdTn0Nmb3HUJySlROmL68osljlcfCEFlV3HJYGTsfk+b
 VHrJ1f+xMExFZ+YSvv8Rmeh1N5GaQQ3p6pZuSDQBx0nbSt1s4XPLJfYIDrJpBvMTIQ3T
 tnPlkWxuMjJu8J60O/OlnbAruEsKB2973ivyYANGexg1cYLi5G1vwz7DY7w0Hk/PvarE
 qINCzPe5al7+9kODm2QQrbeaDo+Ef9vruELr0bSlzbcnvJrfytMgRRiJ5yKDr3S0B9bh
 pUq4JqHBAw9f6ZNp7JiPY7EX8klIc+e+asMdZK9Yz7BoN21wjEsZd5KQdrrR+TAABie5
 JrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=y5PIG9gv3+Q65q73c5WJL/D8ixTHr55LzcpS0la2b94=;
 b=lIgYYZovfDR1T+f7lk13AK2jSKDrioT4UJQJTZvZm0aAD1EUyApvErvzZkyYSKfKY4
 +2zhbXt0trpB9++E2CVE2oE6cX72pCsAWDf56Ho6KqGvNDS56ahM/BoNrxm8ENYmn3MN
 YJnjjmn4s3aLGHrHY8Br1wNT0Tw5sG1Je9M4rKP0U4O/vId297TMVrBpAg+8My9EXtUc
 ONCbXraIP+vqfQ6b6Yu7MLE3cb0trgDeREO+FIBltgl7AUcyEC9K8qIfk/wqJtHE61pJ
 gJY8PRJI+M+BhSiGebSe6+Texqg0P4F6Si95yAXbi9yHMh+9VmRnI3bd/DUz/9oo+QD+
 cWTg==
X-Gm-Message-State: AOAM533QAfUQx1Ew7bvXdvalf+rYjPftJPtYltcktDcoJ27O9CGFwd6F
 dg+zCGN0tDwJ3dcdGTjqXjY=
X-Google-Smtp-Source: ABdhPJyQbAVtd7rvh28AKuUuAlpNq5u8pcARe+eVx7W3hTuAzpqofzarCSjsJ0a8Qe+YPenFOSGRUQ==
X-Received: by 2002:a17:906:22c1:: with SMTP id
 q1mr16036266eja.443.1595935889994; 
 Tue, 28 Jul 2020 04:31:29 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id qw19sm7634705ejb.46.2020.07.28.04.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 04:31:29 -0700 (PDT)
Date: Tue, 28 Jul 2020 13:31:26 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 14/15] x86/numa: remove redundant iteration over
 memblock.reserved
Message-ID: <20200728113126.GB233444@gmail.com>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
 <20200728104440.GA222284@gmail.com>
 <20200728105602.GB3655207@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728105602.GB3655207@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_073131_489688_72A02269 
X-CRM114-Status: GOOD (  18.93  )
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


* Mike Rapoport <rppt@kernel.org> wrote:

> On Tue, Jul 28, 2020 at 12:44:40PM +0200, Ingo Molnar wrote:
> > 
> > * Mike Rapoport <rppt@kernel.org> wrote:
> > 
> > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > 
> > > numa_clear_kernel_node_hotplug() function first traverses numa_meminfo
> > > regions to set node ID in memblock.reserved and than traverses
> > > memblock.reserved to update reserved_nodemask to include node IDs that were
> > > set in the first loop.
> > > 
> > > Remove redundant traversal over memblock.reserved and update
> > > reserved_nodemask while iterating over numa_meminfo.
> > > 
> > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > > ---
> > >  arch/x86/mm/numa.c | 26 ++++++++++----------------
> > >  1 file changed, 10 insertions(+), 16 deletions(-)
> > 
> > I suspect you'd like to carry this in the -mm tree?
> 
> Yes.
>  
> > Acked-by: Ingo Molnar <mingo@kernel.org>
> 
> Thanks!

Assuming it is correct and works. :-)

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
