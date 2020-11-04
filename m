Return-Path: <SRS0=Bqyv=EK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBE6C2D0A3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 17:03:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A320A20732
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 17:03:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1a3tDTsx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbMszixD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A320A20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MjpAoR84lNr1h866wNQhIkjwplnYb/TEBoD/Eze6xcc=; b=1a3tDTsxi2rRfMar98Q6hXE//
	lkfy6BdqE6BE0voVNjdbXQKRvzW7rAMDictY7kwgSasK3olnfG8IEhhYOu0nOQorgakfdW2KK37e2
	RzrnK3a5M5IMsCw1nGl8XSzvuxIvG3akK2MYERHNNiBbjelcaWJ3bhzVpQ/HShuofNXgl3ZEsuOie
	++X8WodbJ1k9+yWg7wl+F5sxYltte03C9Qj2qBwIavteRR5eKMx8LC+EscqxspJmxOP4Gq8h4JD2N
	H9UrBjDjTkt6eGeoH8KtAdhBo7AEwlb6rXcNy3ZV+QGhZwV3bJIgtkt2mltV/dlJUKwdNGD/dVKi7
	E3RrPMwHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaMBk-0003E9-Ki; Wed, 04 Nov 2020 17:03:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaMBd-0003Bn-KJ; Wed, 04 Nov 2020 17:03:06 +0000
Received: from kernel.org (unknown [87.71.17.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8FD9C2071A;
 Wed,  4 Nov 2020 17:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604509384;
 bh=rNITg8eagPnFNzCzxObVDyyyLvNDMpMqrDKWRtXNo1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cbMszixDY/CCQ4Uoej0yke6wNx2huYgP8NhaGqEXUCQOQ+71BtRjL4UN747/oLhHT
 jlOUbEPtbSsAUpPtJ4TKfNUm3RxZ3UFt+v7azAmQtFc9r46TIiMsgPqIFvZ1tNT9dj
 lpdbGPMmI1FpQwRmAzKJsAvG+FlUBcvCqAD3nWrU=
Date: Wed, 4 Nov 2020 19:02:47 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Hagen Paul Pfeifer <hagen@jauu.net>
Subject: Re: [PATCH v6 0/6] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20201104170247.GT4879@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20201101110935.GA4105325@laniakea>
 <20201102154028.GD4879@kernel.org>
 <1547601988.128687.1604411534845@office.mailbox.org>
 <20201103163002.GK4879@kernel.org>
 <1988407921.138656.1604489953944@office.mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1988407921.138656.1604489953944@office.mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_120305_862509_447B6276 
X-CRM114-Status: GOOD (  25.08  )
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

On Wed, Nov 04, 2020 at 12:39:13PM +0100, Hagen Paul Pfeifer wrote:
> > On 11/03/2020 5:30 PM Mike Rapoport <rppt@kernel.org> wrote:
> > 
> > > > As long as the task share the file descriptor, they can share the
> > > > secretmem pages, pretty much like normal memfd.
> > > 
> > > Including process_vm_readv() and process_vm_writev()? Let's take a hypothetical
> > > "dbus-daemon-secure" service that receives data from process A and wants to
> > > copy/distribute it to data areas of N other processes. Much like dbus but without
> > > SOCK_DGRAM rather direct copy into secretmem/mmap pages (ring-buffer). Should be
> > > possible, right?
> > 
> > I'm not sure I follow you here.
> > For process_vm_readv() and process_vm_writev() secremem will be only
> > accessible on the local part, but not on the remote.
> > So copying data to secretmem pages using process_vm_writev wouldn't
> > work.
> 
> A hypothetical "dbus-daemon-secure" service will not be *process related* with communication
> peers. E.g. a password-input process (reading a password into secured-memory page) will
> transfer the password to dbus-daemon-secure and this service will hand-over the password to
> two additional applications: a IPsec process on CPU0 und CPU1 (which itself use a
> secured-memory page).
> 
> So four applications IPC chain:
>  password-input -> dbus-daemon-secure -> {IPsec0, IPsec1}
> 
> - password-input: uses a secured page to read/save the password locally after reading from TTY
> - dbus-daemon-secure: uses a secured page for IPC (legitimate user can write and read into the secured page)
> - IPSecN has secured page to save the password locally (and probably other data as well), IPC memory is memset'ed after copy
> 
> Goal: the whole password is never saved/touched on non secured pages during IPC transfer.
> 
> Question: maybe a *file-descriptor passing* mechanism can do the trick? I.e. dbus-daemon-secure
> allocates via memfd_secret/mmap secure pages and permitted processes will get the descriptor/mmaped-page
> passed so they can use the pages directly?

Yes, this will work. The processes that share the memfd_secret file
descriptor will have access to the same memory pages, pretty much like
with shared memory.

> Hagen

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
