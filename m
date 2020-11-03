Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5CAC2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:52:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EFDC21D91
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QMRxIyS4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EFDC21D91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jauu.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GMRnJwwmmfDY6zE+8458lMlQMMQgzqM5IVTPlMBeLRs=; b=QMRxIyS47KW85tROBSw985PrL
	ws4sbRHR7V5awnwNPRG7BVkROLTvbvgXO21/EgVvP/V3gPL/hEh3uZuK3D4vuJK7NNdQkSZ282KlX
	tEgKhaczFtB03n5kT/fuVvvS0T/6GEhpzeIyhk+1tAZZ1CVrm7pVQNBKvzjQW8yJch+LJjFF8wDU9
	xm+JDbvx4r7RlOBoy5RqA0ntB/qCeRhjlb/KE0Lg3QZOO2/vbOhqPSq1D47zbFonw8w4kJ2jNsQ2U
	M09b9r0qjq/Mv+ixWVGi8Edl7AYl5jjfGtadLFs41Vgx9C5zvF2+MgkFgLm0R7VquhSWU8h2HgHKq
	1gSIZwP+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZwji-0000ES-00; Tue, 03 Nov 2020 13:52:34 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZwjb-0000BY-8L; Tue, 03 Nov 2020 13:52:28 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4CQWS671PfzQkKw;
 Tue,  3 Nov 2020 14:52:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id FlqcKCn97r9e; Tue,  3 Nov 2020 14:52:18 +0100 (CET)
Date: Tue, 3 Nov 2020 14:52:14 +0100 (CET)
From: Hagen Paul Pfeifer <hagen@jauu.net>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <1547601988.128687.1604411534845@office.mailbox.org>
In-Reply-To: <20201102154028.GD4879@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20201101110935.GA4105325@laniakea> <20201102154028.GD4879@kernel.org>
Subject: Re: [PATCH v6 0/6] mm: introduce memfd_secret system call to create
 "secret" memory areas
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -0.65 / 15.00 / 15.00
X-Rspamd-Queue-Id: D612C1723
X-Rspamd-UID: 9101f0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_085227_575421_BB7EBFD3 
X-CRM114-Status: GOOD (  18.78  )
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
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> On 11/02/2020 4:40 PM Mike Rapoport <rppt@kernel.org> wrote:

> > Isn't memfd_secret currently *unnecessarily* designed to be a "one task
> > feature"? memfd_secret fulfills exactly two (generic) features:
> > 
> > - address space isolation from kernel (aka SECRET_EXCLUSIVE, not in kernel's
> >   direct map) - hide from kernel, great
> > - disabling processor's memory caches against speculative-execution vulnerabilities
> >   (spectre and friends, aka SECRET_UNCACHED), also great
> > 
> > But, what about the following use-case: implementing a hardened IPC mechanism
> > where even the kernel is not aware of any data and optionally via SECRET_UNCACHED
> > even the hardware caches are bypassed! With the patches we are so close to
> > achieving this.
> > 
> > How? Shared, SECRET_EXCLUSIVE and SECRET_UNCACHED mmaped pages for IPC
> > involved tasks required to know this mapping (and memfd_secret fd). After IPC
> > is done, tasks can copy sensitive data from IPC pages into memfd_secret()
> > pages, un-sensitive data can be used/copied everywhere.
> 
> As long as the task share the file descriptor, they can share the
> secretmem pages, pretty much like normal memfd.

Including process_vm_readv() and process_vm_writev()? Let's take a hypothetical
"dbus-daemon-secure" service that receives data from process A and wants to
copy/distribute it to data areas of N other processes. Much like dbus but without
SOCK_DGRAM rather direct copy into secretmem/mmap pages (ring-buffer). Should be
possible, right?

> > One missing piece is still the secure zeroization of the page(s) if the
> > mapping is closed by last process to guarantee a secure cleanup. This can
> > probably done as an general mmap feature, not coupled to memfd_secret() and
> > can be done independently ("reverse" MAP_UNINITIALIZED feature).
> 
> There are "init_on_alloc" and "init_on_free" kernel parameters that
> enable zeroing of the pages on alloc and on free globally.
> Anyway, I'll add zeroing of the freed memory to secretmem.

Great, this allows page-specific (thus runtime-performance-optimized) zeroing
of secured pages. init_on_free lowers the performance to much and is not precice
enough.

Hagen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
