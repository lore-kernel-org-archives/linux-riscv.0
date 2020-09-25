Return-Path: <SRS0=Z1AH=DC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DF9C4363D
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2020 06:43:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE44B21D91
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2020 06:43:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2tbYunlB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gp4/PTjO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE44B21D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c4Iifz3mRu1y8TZpqKes1A4OI4blCXHMykJEjJcJtkM=; b=2tbYunlBzTg465ZricstayWFM
	hy3EV1CT4SRGEAh+mwCi5yS/45lztAcR2qBmCYH0Je7UdgKNwY8dS0iIgm16Ckw43iNOyWFvim2hX
	OUTe1W0R/1wuLwpM6Dbo8I/1skhk3H+4VhcOJrvE3IQoRRssTOf+1vX/EUSFQkUxPJAZVirZd1lxi
	uokM/eWIThr3nwBFFgMN4Wtiz0ya5YRC7KY6CS20GEBLx3CPOuKgV/bqbPwhZjeTSm88XVixbOLFs
	DmynKxTVnZrjlfwf32M1IpoEsgDVM0/TH6DiUdq6xDvq2Q/4kyO5MUKG4XlDu3GhOyGT9I0Ldb3/1
	UMFq/tXcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLhRx-0002WP-4T; Fri, 25 Sep 2020 06:43:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLhRr-0002Tz-KN; Fri, 25 Sep 2020 06:43:17 +0000
Received: from kernel.org (unknown [87.71.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 648B621D91;
 Fri, 25 Sep 2020 06:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601016194;
 bh=w9IKlZIfJMsHxegJ+VLXCONApnJkHjt/WLrJovIxo84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gp4/PTjOTCt6wK+y6cBEuicvnrMX77A7MiRNbWPoUrNLDFWXc7dXI8MhLKiFWXqsv
 W10CVzH2Sh5bikH6aMEPT2GD6WMerz6IjUQAM+CvT/52Z2l6KeVLCZlvbVQ+NG092g
 JDBOaIbH10dUGBs84yFpT+eEft/TvzNhegpH41cU=
Date: Fri, 25 Sep 2020 09:42:57 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v6 0/6] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20200925064257.GX2142832@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20200924193428.6642e0cc3436bb67ddf8024a@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924193428.6642e0cc3436bb67ddf8024a@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_024315_929823_77CE3245 
X-CRM114-Status: GOOD (  28.90  )
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
 Peter Zijlstra <peterz@infradead.org>,
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
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 24, 2020 at 07:34:28PM -0700, Andrew Morton wrote:
> On Thu, 24 Sep 2020 16:28:58 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Hi,
> > 
> > This is an implementation of "secret" mappings backed by a file descriptor. 
> > I've dropped the boot time reservation patch for now as it is not strictly
> > required for the basic usage and can be easily added later either with or
> > without CMA.
> > 
> > ...
> > 
> > The file descriptor backing secret memory mappings is created using a
> > dedicated memfd_secret system call The desired protection mode for the
> > memory is configured using flags parameter of the system call. The mmap()
> > of the file descriptor created with memfd_secret() will create a "secret"
> > memory mapping. The pages in that mapping will be marked as not present in
> > the direct map and will have desired protection bits set in the user page
> > table. For instance, current implementation allows uncached mappings.
> > 
> > Although normally Linux userspace mappings are protected from other users, 
> > such secret mappings are useful for environments where a hostile tenant is
> > trying to trick the kernel into giving them access to other tenants
> > mappings.
> > 
> > Additionally, the secret mappings may be used as a mean to protect guest
> > memory in a virtual machine host.
> > 
> > For demonstration of secret memory usage we've created a userspace library
> > [1] that does two things: the first is act as a preloader for openssl to
> 
> I can find no [1].

Oops, sorry. It's

https://git.kernel.org/pub/scm/linux/kernel/git/jejb/secret-memory-preloader.git/

> I'm not a fan of the enumerated footnote thing.  Why not inline the url
> right here so readers don't need to jump around?
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
