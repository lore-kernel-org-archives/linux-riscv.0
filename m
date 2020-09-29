Return-Path: <SRS0=aBv4=DG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19CFC4727C
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 14:05:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67DC420848
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 14:05:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kvVmmNtU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/sTn+vu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67DC420848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RBG3San3xENulcpvx6bWiyYKP5VfjINEDXzGIzUSfzA=; b=kvVmmNtUI/G+JqgSXaEjVUUy4
	P215OPMMbMu6sOgWd5p4gxTVgFOWV/Eby0FoeDcNIxrzJ5xkdo6H4ZeOiZwCYk38HdQraxpAZkh4G
	6OkOKEKZr74NXWZXCisLltFuc+1XCz+Y9njhmRsxuEo7aY1iGk+bpOK4mNO14Pnso16Lmm/6Koym1
	bbQX3joeFKn3mPKaWWxaTKgpRKmxSpdxg7q1N9N93+458H3esuBGvVBs5L4yu5ARAorTsuZLwW2hn
	LEjlM9mY6F73yq30WJ0dlCX9eHmlQ5fptatQ2PwEdkZIC/nHAd9c6I3z1yPaILhs/u0ythzMdKm2x
	z9Wfe9x5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNGFd-0004S3-KX; Tue, 29 Sep 2020 14:05:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNGFG-0004IA-Ng; Tue, 29 Sep 2020 14:04:44 +0000
Received: from kernel.org (unknown [87.71.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C8EF20848;
 Tue, 29 Sep 2020 14:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601388281;
 bh=WaJTg3SQjbcW6v/DzBgW2ai/TQzh1nqimfbp97MMiZg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g/sTn+vuGDTybOkywy/hzK7aJ4iFWFxujqk7E2jgui44H35NmFrCcMr3S2mhlUWeH
 RlNghCYd1xYJLA4ucZ8Vo4pHssTfstFhjlURUf8gE12YAEPb3mM3qxx0M1Gl8xPkdq
 sLFMhLXPdlIflpJ6y2oTcFDApMPO11kHq6sLeZiY=
Date: Tue, 29 Sep 2020 17:04:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v6 5/6] mm: secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20200929140424.GI2142832@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20200924132904.1391-6-rppt@kernel.org>
 <20200925074125.GQ2628@hirez.programming.kicks-ass.net>
 <8435eff6-7fa9-d923-45e5-d8850e4c6d73@redhat.com>
 <20200925095029.GX2628@hirez.programming.kicks-ass.net>
 <20200925103114.GA7407@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925103114.GA7407@C02TD0UTHF1T.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_100442_994312_8DAB124A 
X-CRM114-Status: GOOD (  31.21  )
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
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

On Fri, Sep 25, 2020 at 11:31:14AM +0100, Mark Rutland wrote:
> Hi,
> 
> Agreed. I think if we really need something like this, something between
> XPFO and DEBUG_PAGEALLOC would be generally better, since:
> 
> * Secretmem puts userspace in charge of kernel internals (AFAICT without
>   any ulimits?), so that seems like an avenue for malicious or buggy
>   userspace to exploit and trigger DoS, etc. The other approaches leave
>   the kernel in charge at all times, and it's a system-level choice
>   which is easier to reason about and test.

Secretmem obeys RLIMIT_MLOCK.
I don't see why it "puts userpspace in charge of kernel internals" more
than other system calls. The fact that memory is dropped from
linear/direct mapping does not make userspace in charge of the kernel
internals. The fact that this is not system-level actually makes it more
controllable and tunable, IMHO.

> * Secretmem interaction with existing ABIs is unclear. Should uaccess
>   primitives work for secretmem? If so, this means that it's not valid
>   to transform direct uaccesses in syscalls etc into accesses via the
>   linear/direct map. If not, how do we prevent syscalls? The other
>   approaches are clear that this should always work, but the kernel
>   should avoid mappings wherever possible.

Our idea was that direct uaccess in the context of the process that owns
the secretmem should work and that transforming the direct uaccesses
into accesses via the linear map would be valid only when allowed
explicitly. E.g with addition of FOLL_SOMETHING to gup.
Yet, this would be required for any implementation of memory areas that
excludes pages from the linear mapping.

> * The uncached option doesn't work in a number of situations, such as
>   systems which are purely cache coherent at all times, or where the
>   hypervisor has overridden attributes. The kernel cannot even know that
>   whther this works as intended. On its own this doens't solve a
>   particular problem, and I think this is a solution looking for a
>   problem.

As we discussed at one of the previous iterations, the uncached makes
sense for x86 to reduce availability of side channels and I've only
enabled uncached mappings on x86.

> ... and fundamentally, this seems like a "more security, please" option
> that is going to be abused, since everyone wants security, regardless of
> how we say it *should* be used. The few use-cases that may make sense
> (e.g. protection of ketys and/or crypto secrrets), aren't going to be
> able to rely on this (since e.g. other uses may depelete memory pools),
> so this is going to be best-effort. With all that in mind, I struggle to
> beleive that this is going to be worth the maintenance cost (e.g. with
> any issues arising from uaccess, IO, etc).

I think that making secretmem a file descriptor that only allows mmap()
already makes it quite self contained and simple. There could be several
cases that will need special treatment, but I don't think it will have
large maintenance cost.
I've run syzkaller for some time with memfd_secret() enabled and I never
hit a crash because of it.

> Thanks,
> Mark.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
