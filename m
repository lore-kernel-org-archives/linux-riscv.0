Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA78EC433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 21:26:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3164F64E26
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 21:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3164F64E26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vNoo6nYLZdqFr2uyZ64GtWi9cD8l/7CeLfbZ6ySmXu8=; b=g5AQJ3flKPnDXVPoQLnL2L5Jl
	Ck1cwjanKUAwyG84NezTrmFDPjHOgowigCmekqO7VzNhAhMALtY1PkD+xoW2ncmsYq0tROtHoMZYw
	p6Z3QLpCChDGJaJ2bdldpzdw/3NpjaZh2zVJ2npO9b/Ad/EyyiAgaV/Dwu4L5IIxJo+s3/QGwUFgi
	e8eZ3cPuEB1zxvfcgaAxGnA4HQezzY6D9CMmmUe9FJsP9zCXpSqW67Gu27yVnJgf4hcnEK/MjZ25Y
	Ouj4uvTgmuZgXt9ly+qxtKT4zCbgCMRrh3jaO9Z/x5IglgGLcewI3xuXdLNnJv9bcFC5O4TmXxVi6
	elQfLVLqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9E3C-0001DS-Ku; Mon, 08 Feb 2021 21:26:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9E35-0001B9-Ip; Mon, 08 Feb 2021 21:26:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E27F164E6C;
 Mon,  8 Feb 2021 21:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612819582;
 bh=Y8G7gf2IwGjBXBF5ErxQfWKVOLSdVIOpGEIG67JA2AY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eerdn/7TBUJNWh5JSQGQanhkCbXO6r8i+07ORvc0kNlXTv/gMu3WAJsIb2RYRWrDl
 NzMmvcDn3iTmjaUTOACFOeq+fWRq6saXTmy51YQtoTk38Gte4b+P8L19Xbwx0L6ml+
 Ea3Z7Qd3D+MldYIlVvyh5Yb26npCORZwTE+3wJTir9k1lgaS6eZYPXQ4zFo0WChRGs
 fUiJgsx/cCeor6w8T2f3XtMihtpacVS0+tPYSqs4uM0k3MR4YWV+vaapoyzoPPxAl+
 yFpPIEmRq4D/vlPxshoMK56Hm/B9URPT2mlstPmtBfgreYHioAYDlS64KLgxO+QeoG
 FSPZy/knOHzIQ==
Date: Mon, 8 Feb 2021 23:26:05 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210208212605.GX242749@kernel.org>
References: <20210208084920.2884-1-rppt@kernel.org>
 <20210208084920.2884-8-rppt@kernel.org>
 <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_162624_690607_0A6E11E3 
X-CRM114-Status: GOOD (  29.97  )
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
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 08, 2021 at 11:49:22AM +0100, Michal Hocko wrote:
> On Mon 08-02-21 10:49:17, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Introduce "memfd_secret" system call with the ability to create memory
> > areas visible only in the context of the owning process and not mapped not
> > only to other processes but in the kernel page tables as well.
> > 
> > The secretmem feature is off by default and the user must explicitly enable
> > it at the boot time.
> > 
> > Once secretmem is enabled, the user will be able to create a file
> > descriptor using the memfd_secret() system call. The memory areas created
> > by mmap() calls from this file descriptor will be unmapped from the kernel
> > direct map and they will be only mapped in the page table of the owning mm.
> 
> Is this really true? I guess you meant to say that the memory will
> visible only via page tables to anybody who can mmap the respective file
> descriptor. There is nothing like an owning mm as the fd is inherently a
> shareable resource and the ownership becomes a very vague and hard to
> define term.

Hmm, it seems I've been dragging this paragraph from the very first
mmap(MAP_EXCLUSIVE) rfc and nobody (including myself) noticed the
inconsistency.
 
> > The file descriptor based memory has several advantages over the
> > "traditional" mm interfaces, such as mlock(), mprotect(), madvise(). It
> > paves the way for VMMs to remove the secret memory range from the process;
> 
> I do not understand how it helps to remove the memory from the process
> as the interface explicitly allows to add a memory that is removed from
> all other processes via direct map.

The current implementation does not help to remove the memory from the
process, but using fd-backed memory seems a better interface to remove
guest memory from host mappings than mmap. As Andy nicely put it:

"Getting fd-backed memory into a guest will take some possibly major work in
the kernel, but getting vma-backed memory into a guest without mapping it
in the host user address space seems much, much worse."
 
> > As secret memory implementation is not an extension of tmpfs or hugetlbfs,
> > usage of a dedicated system call rather than hooking new functionality into
> > memfd_create(2) emphasises that memfd_secret(2) has different semantics and
> > allows better upwards compatibility.
> 
> What is this supposed to mean? What are differences?

Well, the phrasing could be better indeed. That supposed to mean that
they differ in the semantics behind the file descriptor: memfd_create
implements sealing for shmem and hugetlbfs while memfd_secret implements
memory hidden from the kernel.
 
> > The secretmem mappings are locked in memory so they cannot exceed
> > RLIMIT_MEMLOCK. Since these mappings are already locked an attempt to
> > mlock() secretmem range would fail and mlockall() will ignore secretmem
> > mappings.
> 
> What about munlock?

Isn't this implied? ;-)
I'll add a sentence about it.
 
-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
