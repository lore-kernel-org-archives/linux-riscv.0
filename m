Return-Path: <SRS0=HNWJ=EH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8124C2D0A3
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2020 11:10:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F48520791
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2020 11:10:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eL25IpEx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F48520791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jauu.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LNynkJIQt845avca+TmE7neybqMJkMGYEtZGhwHf2eU=; b=eL25IpExgxBZZUhSC3A8HrE6y
	eYz2sy/YfZ3fE82bU+OON7ZD6uQGVER+N7ls82JjsaO1f25+tTwg+knbaeCMkL6mfQIR8rJJYPJHl
	UlhOPqJXbdbLYzik634e3gHS4U1cgjYAORJlFtaTumDJhDHQU40KIX7gzlqNcuaMDtBPrfGE7pFyi
	2zlDeG0DQX8eBAqC8SgpAlw7LwonfLshR4OAAOINVh0fT5I8Orv8xG/SpvWdFybUFkBzbQbs0Nycg
	n10xTxM4stGNg+9Il1A/EhgWCrGq1Gma2H7HYVixL5lPMLIA9QA6Lq8vZPzeNmKBzlFHfLeUxM084
	yBLjLVbBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZBFJ-0005ds-Pi; Sun, 01 Nov 2020 11:10:01 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZBFE-0005cb-Vx; Sun, 01 Nov 2020 11:09:58 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4CPCxT5LHFzQjy2;
 Sun,  1 Nov 2020 12:09:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id 0NqHY5bM4ywr; Sun,  1 Nov 2020 12:09:42 +0100 (CET)
Date: Sun, 1 Nov 2020 12:09:35 +0100
From: Hagen Paul Pfeifer <hagen@jauu.net>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v6 0/6] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20201101110935.GA4105325@laniakea>
References: <20200924132904.1391-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924132904.1391-1-rppt@kernel.org>
X-Key-Id: 98350C22
X-Key-Fingerprint: 490F 557B 6C48 6D7E 5706 2EA2 4A22 8D45 9835 0C22
X-GPG-Key: gpg --recv-keys --keyserver wwwkeys.eu.pgp.net 98350C22
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 0.32 / 15.00 / 15.00
X-Rspamd-Queue-Id: EBDB416FE
X-Rspamd-UID: bd1d51
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_060957_168473_BB221C19 
X-CRM114-Status: GOOD (  12.79  )
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

* Mike Rapoport | 2020-09-24 16:28:58 [+0300]:

>This is an implementation of "secret" mappings backed by a file descriptor. 
>I've dropped the boot time reservation patch for now as it is not strictly
>required for the basic usage and can be easily added later either with or
>without CMA.

Isn't memfd_secret currently *unnecessarily* designed to be a "one task
feature"? memfd_secret fulfills exactly two (generic) features:

- address space isolation from kernel (aka SECRET_EXCLUSIVE, not in kernel's
  direct map) - hide from kernel, great
- disabling processor's memory caches against speculative-execution vulnerabilities
  (spectre and friends, aka SECRET_UNCACHED), also great

But, what about the following use-case: implementing a hardened IPC mechanism
where even the kernel is not aware of any data and optionally via SECRET_UNCACHED
even the hardware caches are bypassed! With the patches we are so close to
achieving this.

How? Shared, SECRET_EXCLUSIVE and SECRET_UNCACHED mmaped pages for IPC
involved tasks required to know this mapping (and memfd_secret fd). After IPC
is done, tasks can copy sensitive data from IPC pages into memfd_secret()
pages, un-sensitive data can be used/copied everywhere.

One missing piece is still the secure zeroization of the page(s) if the
mapping is closed by last process to guarantee a secure cleanup. This can
probably done as an general mmap feature, not coupled to memfd_secret() and
can be done independently ("reverse" MAP_UNINITIALIZED feature).

PS: thank you Mike for your effort!

See the following pseudo-code as an example:


// simple assume file-descriptor and mapping is inherited
// by child for simplicity, ptr is 
int fd = memfd_secret(SECRETMEM_UNCACHED);
ftruncate(fd, PAGE_SIZE);
uint32_t *ptr = mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);

pid_t pid_other;

void signal_handler(int sig)
{
	// update IPC data on shared, uncachaed, exclusive mapped page
	*ptr += 1;
	// inform other
	sleep(1);
	kill(pid_other, SIGUSR1);
}

void ipc_loop(void)
{
	signal(SIGUSR1, signal_handler);
	while (1) {
		sleep(1);
	}
}

int main(void)
{
	pid_t child_pid;

	switch (child_pid = fork()) {
	case 0:
		pid_other = getppid();
		break;
	default:
		pid_other = child_pid
		break;
	}
	
	ipc_loop();
}


Hagen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
