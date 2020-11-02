Return-Path: <SRS0=qpiA=EI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7787EC00A89
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 15:41:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0527322258
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 15:41:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pm8C/Mnt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0o11Hfl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0527322258
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CWk0lt0ePxeMdztuLd4cfjQj9cNcYxLTtP9Mco5vsKc=; b=Pm8C/Mnt215CijO5ppVQI3ieA
	puLk6xzhy8+tiiGMiUkWLxOiZ3g19mXcRraaXcTSqWX9io/F9Uqv+qWZFfGzJsFvocx3+3pKDSveb
	MsgHUc5/GzmqJO0ut+nD3Qbk74aAWaRJQgVrHWQX8sCKWTWKcYqfgDt63TMei1hSU/4X4tCfqVnhm
	xahM2NgGp3NbQO/o0SMjkxf7T8WhY3o2fgsivvvq9Y7M4q5H8TsoXY9+NRwcZm/fdtA8zwL+U0pg9
	Nt6Th6inbpQlYs0A4fxXG3E//faV6DOmFjDjfOIFtG+h6Jz55wmR65Se0K+7T5Kmg51RMdLT4+g5s
	23HvIC0Bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZbwt-00033f-SG; Mon, 02 Nov 2020 15:40:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZbwo-00031Z-Qs; Mon, 02 Nov 2020 15:40:44 +0000
Received: from kernel.org (unknown [87.71.17.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 202C12222B;
 Mon,  2 Nov 2020 15:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604331641;
 bh=JULj2YQjQ3lL8L8mphnth/XMQ+6I1NJ7oIH3/fDK0iU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n0o11Hfll3daQtruT1vsISN+BbHP9yaMYQE4FQMEMibOkJCKqnhjRxA+eho5Laarv
 OhRwtWZyY8Wy3q5T3/CRffMJ7SInY7t/Bd/Gdm1eHv/y6zMnVypYr0S7YhVNWRGAWn
 75tM+sdcYEOnYl8dKrbNCJbF2bUOfaK/T5JUAaOI=
Date: Mon, 2 Nov 2020 17:40:28 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Hagen Paul Pfeifer <hagen@jauu.net>
Subject: Re: [PATCH v6 0/6] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20201102154028.GD4879@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20201101110935.GA4105325@laniakea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201101110935.GA4105325@laniakea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_104043_067875_36CC98E8 
X-CRM114-Status: GOOD (  25.24  )
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

On Sun, Nov 01, 2020 at 12:09:35PM +0100, Hagen Paul Pfeifer wrote:
> * Mike Rapoport | 2020-09-24 16:28:58 [+0300]:
> 
> >This is an implementation of "secret" mappings backed by a file descriptor. 
> >I've dropped the boot time reservation patch for now as it is not strictly
> >required for the basic usage and can be easily added later either with or
> >without CMA.
> 
> Isn't memfd_secret currently *unnecessarily* designed to be a "one task
> feature"? memfd_secret fulfills exactly two (generic) features:
> 
> - address space isolation from kernel (aka SECRET_EXCLUSIVE, not in kernel's
>   direct map) - hide from kernel, great
> - disabling processor's memory caches against speculative-execution vulnerabilities
>   (spectre and friends, aka SECRET_UNCACHED), also great
> 
> But, what about the following use-case: implementing a hardened IPC mechanism
> where even the kernel is not aware of any data and optionally via SECRET_UNCACHED
> even the hardware caches are bypassed! With the patches we are so close to
> achieving this.
> 
> How? Shared, SECRET_EXCLUSIVE and SECRET_UNCACHED mmaped pages for IPC
> involved tasks required to know this mapping (and memfd_secret fd). After IPC
> is done, tasks can copy sensitive data from IPC pages into memfd_secret()
> pages, un-sensitive data can be used/copied everywhere.

As long as the task share the file descriptor, they can share the
secretmem pages, pretty much like normal memfd.

> One missing piece is still the secure zeroization of the page(s) if the
> mapping is closed by last process to guarantee a secure cleanup. This can
> probably done as an general mmap feature, not coupled to memfd_secret() and
> can be done independently ("reverse" MAP_UNINITIALIZED feature).

There are "init_on_alloc" and "init_on_free" kernel parameters that
enable zeroing of the pages on alloc and on free globally.
Anyway, I'll add zeroing of the freed memory to secretmem.

> PS: thank you Mike for your effort!
> 
> See the following pseudo-code as an example:
> 
> 
> // simple assume file-descriptor and mapping is inherited
> // by child for simplicity, ptr is 
> int fd = memfd_secret(SECRETMEM_UNCACHED);
> ftruncate(fd, PAGE_SIZE);
> uint32_t *ptr = mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
 
The ptr here will be visible to both parent and child.

> pid_t pid_other;
> 
> void signal_handler(int sig)
> {
> 	// update IPC data on shared, uncachaed, exclusive mapped page
> 	*ptr += 1;
> 	// inform other
> 	sleep(1);
> 	kill(pid_other, SIGUSR1);
> }
> 
> void ipc_loop(void)
> {
> 	signal(SIGUSR1, signal_handler);
> 	while (1) {
> 		sleep(1);
> 	}
> }
> 
> int main(void)
> {
> 	pid_t child_pid;
> 
> 	switch (child_pid = fork()) {
> 	case 0:
> 		pid_other = getppid();
> 		break;
> 	default:
> 		pid_other = child_pid
> 		break;
> 	}
> 	
> 	ipc_loop();
> }
> 
> 
> Hagen
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
