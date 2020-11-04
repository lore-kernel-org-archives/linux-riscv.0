Return-Path: <SRS0=Bqyv=EK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED73C4741F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 11:39:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABDBC2236F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 11:39:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LJMeKidT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABDBC2236F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jauu.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aqW4Xc7qt9tpjjYVKz8DLrRAqrS4OWEp5S39LiZrBdE=; b=LJMeKidTq9jIl4Ujil83fMoTo
	S6xop/Vv1+D3AzsB8QmztUEh4e8xDbmGCrqIzk4k6y0L4bR7ljuiJs4VaT1sq6EzAWEjVLESveaRa
	PTBP2LFZ7uQZHt0f8G9tVfE5eCX4VU4JaS4sQEjj4MKUHJmICl382Gb0zKKmbM5TcauMdYYEz/S61
	3SbDelS1ZJAFVLvRWP9VANBlXMAG8eVEY+KjgPpFJ5g4Za2x3gqDf2Leh1761xSsazuoNvfmz0eOh
	8FRtICFDA2/R4bZtHHJ11DqXzoPSSb1z+g21O0NKpq4M+hc8Q9PC4vo+etoQUym7dnW7l7fTvJq/K
	kw4/djrRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaH8U-0000bv-RT; Wed, 04 Nov 2020 11:39:31 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050::465:202])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaH8O-0000ZU-IF; Wed, 04 Nov 2020 11:39:25 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4CR4SB2rQLzQlRc;
 Wed,  4 Nov 2020 12:39:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id F5663DCtL8CE; Wed,  4 Nov 2020 12:39:18 +0100 (CET)
Date: Wed, 4 Nov 2020 12:39:13 +0100 (CET)
From: Hagen Paul Pfeifer <hagen@jauu.net>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <1988407921.138656.1604489953944@office.mailbox.org>
In-Reply-To: <20201103163002.GK4879@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20201101110935.GA4105325@laniakea> <20201102154028.GD4879@kernel.org>
 <1547601988.128687.1604411534845@office.mailbox.org>
 <20201103163002.GK4879@kernel.org>
Subject: Re: [PATCH v6 0/6] mm: introduce memfd_secret system call to create
 "secret" memory areas
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-MBO-SPAM-Probability: **
X-Rspamd-Score: 1.58 / 15.00 / 15.00
X-Rspamd-Queue-Id: B8AE3182D
X-Rspamd-UID: 15b699
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_063924_812726_1F0BE179 
X-CRM114-Status: GOOD (  20.40  )
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

> On 11/03/2020 5:30 PM Mike Rapoport <rppt@kernel.org> wrote:
> 
> > > As long as the task share the file descriptor, they can share the
> > > secretmem pages, pretty much like normal memfd.
> > 
> > Including process_vm_readv() and process_vm_writev()? Let's take a hypothetical
> > "dbus-daemon-secure" service that receives data from process A and wants to
> > copy/distribute it to data areas of N other processes. Much like dbus but without
> > SOCK_DGRAM rather direct copy into secretmem/mmap pages (ring-buffer). Should be
> > possible, right?
> 
> I'm not sure I follow you here.
> For process_vm_readv() and process_vm_writev() secremem will be only
> accessible on the local part, but not on the remote.
> So copying data to secretmem pages using process_vm_writev wouldn't
> work.

A hypothetical "dbus-daemon-secure" service will not be *process related* with communication
peers. E.g. a password-input process (reading a password into secured-memory page) will
transfer the password to dbus-daemon-secure and this service will hand-over the password to
two additional applications: a IPsec process on CPU0 und CPU1 (which itself use a
secured-memory page).

So four applications IPC chain:
 password-input -> dbus-daemon-secure -> {IPsec0, IPsec1}

- password-input: uses a secured page to read/save the password locally after reading from TTY
- dbus-daemon-secure: uses a secured page for IPC (legitimate user can write and read into the secured page)
- IPSecN has secured page to save the password locally (and probably other data as well), IPC memory is memset'ed after copy

Goal: the whole password is never saved/touched on non secured pages during IPC transfer.

Question: maybe a *file-descriptor passing* mechanism can do the trick? I.e. dbus-daemon-secure
allocates via memfd_secret/mmap secure pages and permitted processes will get the descriptor/mmaped-page
passed so they can use the pages directly?

Hagen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
