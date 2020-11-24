Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D77C2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 16:50:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B1E3206D9
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 16:50:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yMVAsPbn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCuQvSCf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B1E3206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cdmYlXlVWcfh9pIm5KL7kDZXqIArq7zWc3cC7vItA2c=; b=yMVAsPbnlrEybX3HaLKv5VeUi
	9a3SNkPc2va5gfGD+fbPpIHlbEGhNWX3Z7pgujn5UwRPlovY9+aTFKAyVvJ93Wg0V37DzFNK34dic
	Rr/ipakHAuH5GOd9gZJTz0otQYjk/G9vr99M4cqOaq0SNLfHmfdtsywSdzAfiVvM6aF4U3M+NhiUr
	G7VpgHbrzpxYt4iJOrsYXfF7XarFIBgDUVJ8BFjBV6+Fj1YH1x59s85DK/rJF6kSQdrx8vOALEuFM
	qVYo09ubnd2q7Eulc+XrJAFMIlrDbKxGwjo6J43D3urM0eoTFQp0lLOtecBhiPuIn3m2kWOVZmZCq
	mj8Sk9eQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khbVp-0004nN-Jj; Tue, 24 Nov 2020 16:49:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khbVk-0004lJ-6q; Tue, 24 Nov 2020 16:49:49 +0000
Received: from kernel.org (unknown [77.125.7.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0D65206D8;
 Tue, 24 Nov 2020 16:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606236586;
 bh=ofUYlPrJWYYZntZI6e1UjFnjHWpt+ejZuqW8X4FikI4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZCuQvSCf55hd5LYTHCkX7HoUl/qLUj9Aw9Qt2bN77Vq37ymtgqf1vlqa/54yGLfET
 9NqEFDk66Auv1EyiIzF9GLhnJC21iAtMI/wvzWombNFNDkOObvxkdIL/h8j9OReeJM
 eznOp2166MiDXEFDWf7MpCnskhIQaw8NFBBtv2Qk=
Date: Tue, 24 Nov 2020 18:49:30 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v11 4/9] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20201124164930.GK8537@kernel.org>
References: <20201124092556.12009-1-rppt@kernel.org>
 <20201124092556.12009-5-rppt@kernel.org>
 <20201124105947.GA5527@gaia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124105947.GA5527@gaia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_114948_522138_8298D311 
X-CRM114-Status: GOOD (  24.79  )
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
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Hagen Paul Pfeifer <hagen@jauu.net>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 10:59:48AM +0000, Catalin Marinas wrote:
> Hi Mike,
> 
> On Tue, Nov 24, 2020 at 11:25:51AM +0200, Mike Rapoport wrote:
> > +static vm_fault_t secretmem_fault(struct vm_fault *vmf)
> > +{
> > +	struct address_space *mapping = vmf->vma->vm_file->f_mapping;

...

> > +
> > +		err = set_direct_map_invalid_noflush(page, 1);
> > +		if (err)
> > +			goto err_del_page_cache;
> 
> On arm64, set_direct_map_default_noflush() returns 0 if !rodata_full but
> no pgtable changes happen since the linear map can be a mix of small and
> huge pages. The arm64 implementation doesn't break large mappings. I
> presume we don't want to tell the user that the designated memory is
> "secret" but the kernel silently ignored it.
> 
> We could change the arm64 set_direct_map* to return an error, however, I
> think it would be pretty unexpected for the user to get a fault when
> trying to access it. It may be better to return a -ENOSYS or something
> on the actual syscall if the fault-in wouldn't be allowed later.
> 
> Alternatively, we could make the linear map always use pages on arm64,
> irrespective of other config or cmdline options (maybe not justified
> unless we have clear memsecret users). Yet another idea is to get
> set_direct_map* to break pmd/pud mappings into pte but that's not always
> possible without a stop_machine() and potentially disabling the MMU.

My preference would be to check at secretmem initialization if
set_direct_map_*() actually do anything and then return an error from
the syscall if they are essentially nop.

I'll update the patches with something like this in v12.

> -- 
> Catalin

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
