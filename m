Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EC0C2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 06:27:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6804220867
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 06:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ENNOqSsn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZ37+aP7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6804220867
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CNLZrAlZGIRSUFMr01XUp5x9flVDbjXP0MIYveS85t0=; b=ENNOqSsnDp5hZoW17tOwOmvDx
	GHhQxHdqPgpTyEhptB9rkX8i6AUl2YYU73VwSuAEIqEkJAH/VsN083nJCjG/GQcbgUWDpQZyAWN38
	kbMEYnzkLhKSs1CA7/GWExHRY0I8RzoiiUJ/u9MV+Yha5HNNKckdEobxf3vmYzwjUKRUK2d2AujHS
	rHH2zcVSAD8ojnGZBHlle5W5wn/gCvGXyjEFb0t5m1YlvsikZOsi/UrufYNXUpo1jv2zRD1euCHty
	R60sdkYv83JVgrJVRN6qEUC4gv0n5xr966KPZCBkuSjW8SGNyx5LpfTg/IzD3DBagqIq+x/ahRDL6
	HcydGSb4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keuS6-00072u-7R; Tue, 17 Nov 2020 06:26:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keuRz-00070m-NA; Tue, 17 Nov 2020 06:26:49 +0000
Received: from kernel.org (unknown [77.125.7.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA86E20855;
 Tue, 17 Nov 2020 06:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605594406;
 bh=ie0VlDH/vj4hY7eKDBRc8yNlYb8JMMI+sECKmsJ0SAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PZ37+aP7qsQAQGaQgrviuuTES+oK/KF+aENGZoDR9HzBV3Jaqk/mPUi4s8TouHZcb
 Gxna9F5Fo/vt3rqRFavtJK/inbQFHR4ChVg6L8bs7emdbKfZ/wDPWS7H2oALG9KgBR
 199CMDQwY+Gu5iEF24GqZcZyZFpnnDE7wlV7JG9Y=
Date: Tue, 17 Nov 2020 08:26:30 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Alejandro Colomar <alx.manpages@gmail.com>
Subject: Re: [PATCH v2] memfd_secret.2: New page describing memfd_secret()
 system call
Message-ID: <20201117062630.GC370813@kernel.org>
References: <20201005073242.GA4251@kernel.org>
 <20201116210136.12390-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116210136.12390-1-alx.manpages@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_012647_902528_46550F72 
X-CRM114-Status: GOOD (  41.33  )
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
Cc: mark.rutland@arm.com, linux-man@vger.kernel.org, tglx@linutronix.de,
 david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, linux-mm@kvack.org, will@kernel.org,
 linux-kselftest@vger.kernel.org, hpa@zytor.com, cl@linux.com,
 idan.yaniv@ibm.com, linux-riscv@lists.infradead.org, elena.reshetova@intel.com,
 linux-arch@vger.kernel.org, tycho@tycho.ws, linux-nvdimm@lists.01.org,
 colomar.6.4.3@gmail.com, shuah@kernel.org, x86@kernel.org, willy@infradead.org,
 Mike Rapoport <rppt@linux.ibm.com>, mingo@redhat.com, mtk.manpages@gmail.com,
 arnd@arndb.de, jejb@linux.ibm.com, bp@alien8.de, viro@zeniv.linux.org.uk,
 luto@kernel.org, paul.walmsley@sifive.com, kirill@shutemov.name,
 dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 10:01:37PM +0100, Alejandro Colomar wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Cowritten-by: Alejandro Colomar <alx.manpages@gmail.com>
> Acked-by: Alejandro Colomar <alx.manpages@gmail.com>
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
> ---
> 
> Hi Mike,
> 
> I added that note about not having a wrapper,
> fixed a few minor formatting and wording issues,
> and sorted ERRORS alphabetically.

Thanks, Alejandro!

> Cheers,
> 
> Alex
> 
>  man2/memfd_secret.2 | 178 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)
>  create mode 100644 man2/memfd_secret.2
> 
> diff --git a/man2/memfd_secret.2 b/man2/memfd_secret.2
> new file mode 100644
> index 000000000..4e617aa0e
> --- /dev/null
> +++ b/man2/memfd_secret.2
> @@ -0,0 +1,178 @@
> +.\" Copyright (c) 2020, IBM Corporation.
> +.\" Written by Mike Rapoport <rppt@linux.ibm.com>
> +.\"
> +.\" Based on memfd_create(2) man page
> +.\" Copyright (C) 2014 Michael Kerrisk <mtk.manpages@gmail.com>
> +.\" and Copyright (C) 2014 David Herrmann <dh.herrmann@gmail.com>
> +.\"
> +.\" %%%LICENSE_START(GPLv2+)
> +.\"
> +.\" This program is free software; you can redistribute it and/or modify
> +.\" it under the terms of the GNU General Public License as published by
> +.\" the Free Software Foundation; either version 2 of the License, or
> +.\" (at your option) any later version.
> +.\"
> +.\" This program is distributed in the hope that it will be useful,
> +.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> +.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> +.\" GNU General Public License for more details.
> +.\"
> +.\" You should have received a copy of the GNU General Public
> +.\" License along with this manual; if not, see
> +.\" <http://www.gnu.org/licenses/>.
> +.\" %%%LICENSE_END
> +.\"
> +.TH MEMFD_SECRET 2 2020-08-02 Linux "Linux Programmer's Manual"
> +.SH NAME
> +memfd_secret \- create an anonymous file to map secret memory regions
> +.SH SYNOPSIS
> +.nf
> +.B #include <linux/secretmem.h>
> +.PP
> +.BI "int memfd_secret(unsigned long " flags ");"
> +.fi
> +.PP
> +.IR Note :
> +There is no glibc wrapper for this system call; see NOTES.
> +.SH DESCRIPTION
> +.BR memfd_secret ()
> +creates an anonymous file and returns a file descriptor that refers to it.
> +The file can only be memory-mapped;
> +the memory in such mapping
> +will have stronger protection than usual memory mapped files,
> +and so it can be used to store application secrets.
> +Unlike a regular file, a file created with
> +.BR memfd_secret ()
> +lives in RAM and has a volatile backing storage.
> +Once all references to the file are dropped, it is automatically released.
> +The initial size of the file is set to 0.
> +Following the call, the file size should be set using
> +.BR ftruncate (2).
> +.PP
> +The memory areas obtained with
> +.BR mmap (2)
> +from the file descriptor are exclusive to the owning context.
> +These areas are removed from the kernel page tables
> +and only the page table of the process holding the file descriptor
> +maps the corresponding physical memory.
> +.PP
> +The following values may be bitwise ORed in
> +.IR flags
> +to control the behavior of
> +.BR memfd_secret (2):
> +.TP
> +.BR FD_CLOEXEC
> +Set the close-on-exec flag on the new file descriptor.
> +See the description of the
> +.B O_CLOEXEC
> +flag in
> +.BR open (2)
> +for reasons why this may be useful.
> +.PP
> +.TP
> +.BR SECRETMEM_UNCACHED
> +In addition to excluding memory areas from the kernel page tables,
> +mark the memory mappings uncached in the page table of the owning process.
> +Such mappings can be used to prevent speculative loads
> +and cache-based side channels.
> +This mode of
> +.BR memfd_secret ()
> +is not supported on all architectures.
> +.PP
> +See also NOTES below.
> +.PP
> +As its return value,
> +.BR memfd_secret ()
> +returns a new file descriptor that can be used to refer to an anonymous file.
> +This file descriptor is opened for both reading and writing
> +.RB ( O_RDWR )
> +and
> +.B O_LARGEFILE
> +is set for the file descriptor.
> +.PP
> +With respect to
> +.BR fork (2)
> +and
> +.BR execve (2),
> +the usual semantics apply for the file descriptor created by
> +.BR memfd_secret ().
> +A copy of the file descriptor is inherited by the child produced by
> +.BR fork (2)
> +and refers to the same file.
> +The file descriptor is preserved across
> +.BR execve (2),
> +unless the close-on-exec flag has been set.
> +.PP
> +The memory regions backed with
> +.BR memfd_secret ()
> +are locked in the same way as
> +.BR mlock (2),
> +however the implementation will not try to
> +populate the whole range during the
> +.BR mmap ()
> +call.
> +The amount of memory allowed for memory mappings
> +of the file descriptor obeys the same rules as
> +.BR mlock (2)
> +and cannot exceed
> +.BR RLIMIT_MEMLOCK .
> +.SH RETURN VALUE
> +On success,
> +.BR memfd_secret ()
> +returns a new file descriptor.
> +On error, \-1 is returned and
> +.I errno
> +is set to indicate the error.
> +.SH ERRORS
> +.TP
> +.B EINVAL
> +.I flags
> +included unknown bits.
> +.TP
> +.B EMFILE
> +The per-process limit on the number of open file descriptors has been reached.
> +.TP
> +.B EMFILE
> +The system-wide limit on the total number of open files has been reached.
> +.TP
> +.B ENOMEM
> +There was insufficient memory to create a new anonymous file.
> +.TP
> +.B ENOSYS
> +.BR memfd_secret ()
> +is not implemented on this architecture.
> +.SH VERSIONS
> +The
> +.BR memfd_secret (2)
> +system call first appeared in Linux 5.X;
> +.SH CONFORMING TO
> +The
> +.BR memfd_secret (2)
> +system call is Linux-specific.
> +.SH NOTES
> +The
> +.BR memfd_secret (2)
> +system call provides an ability to hide information
> +from the operating system.
> +Normally Linux userspace mappings are protected from other users,
> +but they are visible to privileged code.
> +The mappings created using
> +.BR memfd_secret ()
> +are hidden from the kernel as well.
> +.PP
> +If an architecture supports
> +.BR SECRETMEM_UNCACHED ,
> +the mappings also have protection from speculative execution vulnerabilties,
> +at the expense of increased memory access latency.
> +Care should be taken when using
> +.B SECRETMEM_UNCACHED
> +to avoid degrading application performance.
> +.PP
> +Glibc does not provide a wrapper for this system call; call it using
> +.BR syscall (2).
> +.SH SEE ALSO
> +.BR fcntl (2),
> +.BR ftruncate (2),
> +.BR mlock (2),
> +.BR mmap (2),
> +.BR setrlimit (2)
> -- 
> 2.29.2
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
