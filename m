Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6C0C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 08:48:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F2EA64EC9
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 08:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F2EA64EC9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Xl3iZk5JhbHWGNTNQAqOv5/2lp/q3lHKfaSwY+QFIg=; b=Vi2/LXHP88cfwtgkop9Udizfa
	Pebqf9nEXYkWXf5jzPsDWOk1kLf4DqYnHlYg8KqgUB1hnO+9DXMaR8I2MhFpWilRxKppsAhfdqBqU
	SuYyhaeIfObeZDOWtdYhdNSj8K9XEUJ8VnxWVPIyfL467dkjdrZkOj+KjbWL7j7IXH5d+oVUbvVBP
	RV5aY2XiquRnlbbNXXHJl9jnj8kvWKOfcr19vtFEj9weYTx9VOv+TTzUXTCKNzieMpWvXEPUC9yof
	0IKyVZ7FsD8fGT/JpKwC0YXjXqpIwbDmuJ8vq2Ei+WCyY2yStUkxrrUbk8IDtsydNYUyOmLajXPFo
	QKr2kdqNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Ogq-0005NE-Oe; Tue, 09 Feb 2021 08:48:09 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Ofy-0004xU-2i; Tue, 09 Feb 2021 08:47:19 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1612860431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7uXNoYTwJcul85Ggr79faNz9sm4xUBP5tyQrp7MGBDU=;
 b=igFK6y52//YbOeER2qu6o8xC111AEEf/9O0tsPnCXBARwevxGar35/sufXf6VC6tmzQnyW
 /X0B3+BhzxxFnhgpH7/ijVkSsmiVTBYgLKz7SupOE55ZHrLDJUiANJxkyr5fgautM81txk
 U8MaQSKu/ApzxONYDBE500FYqjbKj30=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7514CAB71;
 Tue,  9 Feb 2021 08:47:11 +0000 (UTC)
Date: Tue, 9 Feb 2021 09:47:08 +0100
From: Michal Hocko <mhocko@suse.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <YCJMDBss8Qhha7g9@dhcp22.suse.cz>
References: <20210208084920.2884-1-rppt@kernel.org>
 <20210208084920.2884-8-rppt@kernel.org>
 <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
 <20210208212605.GX242749@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208212605.GX242749@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_034714_541963_F7B93F2F 
X-CRM114-Status: GOOD (  34.31  )
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

On Mon 08-02-21 23:26:05, Mike Rapoport wrote:
> On Mon, Feb 08, 2021 at 11:49:22AM +0100, Michal Hocko wrote:
> > On Mon 08-02-21 10:49:17, Mike Rapoport wrote:
[...]
> > > The file descriptor based memory has several advantages over the
> > > "traditional" mm interfaces, such as mlock(), mprotect(), madvise(). It
> > > paves the way for VMMs to remove the secret memory range from the process;
> > 
> > I do not understand how it helps to remove the memory from the process
> > as the interface explicitly allows to add a memory that is removed from
> > all other processes via direct map.
> 
> The current implementation does not help to remove the memory from the
> process, but using fd-backed memory seems a better interface to remove
> guest memory from host mappings than mmap. As Andy nicely put it:
> 
> "Getting fd-backed memory into a guest will take some possibly major work in
> the kernel, but getting vma-backed memory into a guest without mapping it
> in the host user address space seems much, much worse."

OK, so IIUC this means that the model is to hand over memory from host
to guest. I thought the guest would be under control of its address
space and therefore it operates on the VMAs. This would benefit from
an additional and more specific clarification.

> > > As secret memory implementation is not an extension of tmpfs or hugetlbfs,
> > > usage of a dedicated system call rather than hooking new functionality into
> > > memfd_create(2) emphasises that memfd_secret(2) has different semantics and
> > > allows better upwards compatibility.
> > 
> > What is this supposed to mean? What are differences?
> 
> Well, the phrasing could be better indeed. That supposed to mean that
> they differ in the semantics behind the file descriptor: memfd_create
> implements sealing for shmem and hugetlbfs while memfd_secret implements
> memory hidden from the kernel.

Right but why memfd_create model is not sufficient for the usecase?
Please note that I am arguing against. To be honest I do not really care
much. Using an existing scheme is usually preferable from my POV but
there might be real reasons why shmem as a backing "storage" is not
appropriate.
  
> > > The secretmem mappings are locked in memory so they cannot exceed
> > > RLIMIT_MEMLOCK. Since these mappings are already locked an attempt to
> > > mlock() secretmem range would fail and mlockall() will ignore secretmem
> > > mappings.
> > 
> > What about munlock?
> 
> Isn't this implied? ;-)

My bad here. I thought that munlock fails on vmas which are not mlocked
and I was curious about the behavior when mlockall() is followed by
munlock. But I do not see this being the case. So this should be ok.

-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
