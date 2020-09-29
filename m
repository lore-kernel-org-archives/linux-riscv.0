Return-Path: <SRS0=aBv4=DG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7567DC4727C
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 13:06:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CE0E208FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 13:06:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U7MIGN3F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfoO9Oo/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CE0E208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7CXf9z7+cEgPMn/EDJXEMg+sTJDSccsXXJZzvIP/19s=; b=U7MIGN3FWDnLU3Ao0x3KFGf8f
	6hpjNgBAb+NPO1BzqyV2x13BIWlp0iUE74KIybP3uvud6JAV/auD5P/wfdnegfV73hTCjlgeLFkOA
	VwJTWvGdaJlUaXgtduTHn4kyU5guXFja9L05LaqYm0ceRFlebylPC49gZYZYKWDg+sNwl010/+JC3
	pGdKbJBhZgV8ipCnBidT+wDNJ56U1Qei2rPEaAhgwC0dfZZAsae8Wc2HLGYAgKlq/Ic25p9+qhen2
	sOV0exGM5h+0PvaslM3aP2o/yj9QMzYGACVc4Xq8Ma5V/kUWbEHDBa8oX0t5oI8oLrAdRR/CEWuQz
	rjs68t7VQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNFKM-00038H-IQ; Tue, 29 Sep 2020 13:05:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNFKG-00035G-7W; Tue, 29 Sep 2020 13:05:49 +0000
Received: from kernel.org (unknown [87.71.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4CD4820848;
 Tue, 29 Sep 2020 13:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601384746;
 bh=w8jEjdPVhwgAP8ieOGmZq7rvrkzmFW13pl6Bcj/9DDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YfoO9Oo/YwKl80W7Ps/3xh0cfYEHin8QOUrn/iFqhLYw+b2DAWHKu9Y+mnqgIAACA
 uQkYtRdB+liRGsxjQlUpAtvTPmGTHbQnf35XbZMDwXCeXkiEteBW7/GT/3ZbUZnHCL
 kuQnBbyQK81Mz6jqRSLbGj/2AcjW0JSpMYmSqJQw=
Date: Tue, 29 Sep 2020 16:05:29 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6 5/6] mm: secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20200929130529.GE2142832@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20200924132904.1391-6-rppt@kernel.org>
 <20200925074125.GQ2628@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925074125.GQ2628@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_090548_773724_1AF76047 
X-CRM114-Status: GOOD (  26.26  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Shuah Khan <shuah@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 25, 2020 at 09:41:25AM +0200, Peter Zijlstra wrote:
> On Thu, Sep 24, 2020 at 04:29:03PM +0300, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Removing a PAGE_SIZE page from the direct map every time such page is
> > allocated for a secret memory mapping will cause severe fragmentation of
> > the direct map. This fragmentation can be reduced by using PMD-size pages
> > as a pool for small pages for secret memory mappings.
> > 
> > Add a gen_pool per secretmem inode and lazily populate this pool with
> > PMD-size pages.
> 
> What's the actual efficacy of this? Since the pmd is per inode, all I
> need is a lot of inodes and we're in business to destroy the directmap,
> no?
> 
> Afaict there's no privs needed to use this, all a process needs is to
> stay below the mlock limit, so a 'fork-bomb' that maps a single secret
> page will utterly destroy the direct map.

This indeed will cause 1G pages in the direct map to be split into 2M
chunks, but I disagree with 'destroy' term here. Citing the cover letter
of an earlier version of this series:

  I've tried to find some numbers that show the benefit of using larger
  pages in the direct map, but I couldn't find anything so I've run a
  couple of benchmarks from phoronix-test-suite on my laptop (i7-8650U
  with 32G RAM).
  
  I've tested three variants: the default with 28G of the physical
  memory covered with 1G pages, then I disabled 1G pages using
  "nogbpages" in the kernel command line and at last I've forced the
  entire direct map to use 4K pages using a simple patch to
  arch/x86/mm/init.c.  I've made runs of the benchmarks with SSD and
  tmpfs.
  
  Surprisingly, the results does not show huge advantage for large
  pages. For instance, here the results for kernel build with
  'make -j8', in seconds:
  
                        |  1G    |  2M    |  4K
  ----------------------+--------+--------+---------
  ssd, mitigations=on	| 308.75 | 317.37 | 314.9
  ssd, mitigations=off	| 305.25 | 295.32 | 304.92
  ram, mitigations=on	| 301.58 | 322.49 | 306.54
  ram, mitigations=off	| 299.32 | 288.44 | 310.65
  
  All the results I have are available here:
 
  https://docs.google.com/spreadsheets/d/1tdD-cu8e93vnfGsTFxZ5YdaEfs2E1GELlvWNOGkJV2U/edit?usp=sharing

The numbers suggest that using smaller pages in the direct map does not
necessarily leads to performance degradation and some runs produced
better results with smaller pages in the direct map.

> I really don't like this, at all.
> 
> IIRC Kirill looked at merging the directmap. I think he ran into
> performance issues there, but we really need something like that before
> something like this lands.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
