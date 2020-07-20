Return-Path: <SRS0=LUeZ=A7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21E1C433E6
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 09:25:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C6FC2176B
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 09:25:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OIflNNI6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTwUZAfj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C6FC2176B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3cfWjecT+lKfdoXyQAbpYBvtBVKBghru2D3P+KALUiQ=; b=OIflNNI646hBftKJKW9WJ7k3lO
	amAjTj4BWbUf4A7zWphY/QomCWZclrUF4QaLM/irTJ7KcNnKoVXDGAlenrGxD9dRbIZMMNodZT1K4
	ua3mtspKnrMTx6H97sCSS7kJkB3J/TI9K4iZSXxja49w7TOfPHz1O8/U6a4LoZlitvDCX2yixpaHt
	zDyqfPE32RU6wLidB4HBTUDQw3WgktF9OnQvY33b+BfcjeI+6SeIXWQE6QSTLM+3JHeD3YxLJpo96
	cp/DEwiljJ8GhiMM+j/ugXCV6UVugVGBRozkCusCt0cZFoK+neTUkSuSKYInOmIpBZ+7QglIprH8k
	74wGdi8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxS2k-00076Q-TE; Mon, 20 Jul 2020 09:25:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxS2d-00072j-5u; Mon, 20 Jul 2020 09:25:00 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B05072176B;
 Mon, 20 Jul 2020 09:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595237097;
 bh=DZJgFWT9EBpxUAxDadsCWuChLAtXVn8oZMtP9QRL6C8=;
 h=From:To:Cc:Subject:Date:From;
 b=ZTwUZAfjeouKDVccICNkfWj3AXzdsSuDk2rXgQ1No8faUuhgdJkyGv8pNjSwr1p8s
 KG+pxfIgNxDLMiwrUoHqNrpWJhB5PtUOQUvLH6+XLLQNsMur9U/3CoZ5gGNVXCI9pB
 je+UNlkcrWBPmVpDOLe0ai7+vZwqHYtU7Ofhrs9o=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] mm: introduce secretmemfd system call to create "secret"
 memory areas
Date: Mon, 20 Jul 2020 12:24:29 +0300
Message-Id: <20200720092435.17469-1-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_052459_356541_62255191 
X-CRM114-Status: GOOD (  27.83  )
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

This is the third version of "secret" mappings implementation backed by a
file descriptor. 

The file descriptor is created using a dedicated secretmemfd system call
The desired protection mode for the memory is configured using flags
parameter of the system call. The mmap() of the file descriptor created
with secretmemfd() will create a "secret" memory mapping. The pages in that
mapping will be marked as not present in the direct map and will have
desired protection bits set in the user page table. For instance, current
implementation allows uncached mappings.

Although normally Linux userspace mappings are protected from other users, 
such secret mappings are useful for environments where a hostile tenant is
trying to trick the kernel into giving them access to other tenants
mappings.

Additionally, the secret mappings may be used as a mean to protect guest
memory in a virtual machine host.

For demonstration of secret memory usage we've created a userspace library
[1] that does two things: the first is act as a preloader for openssl to
redirect all the OPENSSL_malloc calls to secret memory meaning any secret
keys get automatically protected this way and the other thing it does is
expose the API to the user who needs it. We anticipate that a lot of the
use cases would be like the openssl one: many toolkits that deal with
secret keys already have special handling for the memory to try to give
them greater protection, so this would simply be pluggable into the
toolkits without any need for user application modification.

I've hesitated whether to continue to use new flags to memfd_create() or to
add a new system call and I've decided to use a new system call after I've
started to look into man pages update. There would have been two completely
independent descriptions and I think it would have been very confusing.

Hiding secret memory mappings behind an anonymous file allows (ab)use of
the page cache for tracking pages allocated for the "secret" mappings as
well as using address_space_operations for e.g. page migration callbacks.

The anonymous file may be also used implicitly, like hugetlb files, to
implement mmap(MAP_SECRET) and use the secret memory areas with "native" mm
ABIs in the future.

As the fragmentation of the direct map was one of the major concerns raised
during the previous postings, I've added an amortizing cache of PMD-size
pages to each file descriptor and an ability to reserve large chunks of the
physical memory at boot time and then use this memory as an allocation pool
for the secret memory areas.

In addition, I've tried to find some numbers that show the benefit of using
larger pages in the direct map, but I couldn't find anything so I've run a
couple of benchmarks from phoronix-test-suite on my laptop (i7-8650U with
32G RAM).

I've tested three variants: the default with 28G of the physical memory
covered with 1G pages, then I disabled 1G pages using "nogbpages" in the
kernel command line and at last I've forced the entire direct map to use 4K
pages using a simple patch to arch/x86/mm/init.c.
I've made runs of the benchmarks with SSD and tmpfs.

Surprisingly, the results does not show huge advantage for large pages. For
instance, here the results for kernel build with 'make -j8', in seconds:

                        |  1G    |  2M    |  4K
------------------------+--------+--------+---------
ssd, mitigations=on	| 308.75 | 317.37 | 314.9 
ssd, mitigations=off	| 305.25 | 295.32 | 304.92 
ram, mitigations=on	| 301.58 | 322.49 | 306.54 
ram, mitigations=off	| 299.32 | 288.44 | 310.65

All the results I have are available at [2].
If anybody is interested in plain text, please let me know.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/rppt/secret-memory-preloader.git/
[2] https://docs.google.com/spreadsheets/d/1tdD-cu8e93vnfGsTFxZ5YdaEfs2E1GELlvWNOGkJV2U/edit?usp=sharing

Mike Rapoport (6):
  mm: add definition of PMD_PAGE_ORDER
  mmap: make mlock_future_check() global
  mm: introduce secretmemfd system call to create "secret" memory areas
  arch, mm: wire up secretmemfd system call were relevant
  mm: secretmem: use PMD-size pages to amortize direct map fragmentation
  mm: secretmem: add ability to reserve memory at boot

 arch/arm64/include/asm/unistd32.h      |   2 +
 arch/arm64/include/uapi/asm/unistd.h   |   1 +
 arch/riscv/include/asm/unistd.h        |   1 +
 arch/x86/entry/syscalls/syscall_32.tbl |   1 +
 arch/x86/entry/syscalls/syscall_64.tbl |   1 +
 fs/dax.c                               |  10 +-
 include/linux/pgtable.h                |   3 +
 include/linux/syscalls.h               |   1 +
 include/uapi/asm-generic/unistd.h      |   7 +-
 include/uapi/linux/magic.h             |   1 +
 include/uapi/linux/secretmem.h         |   9 +
 mm/Kconfig                             |   4 +
 mm/Makefile                            |   1 +
 mm/internal.h                          |   3 +
 mm/mmap.c                              |   5 +-
 mm/secretmem.c                         | 450 +++++++++++++++++++++++++
 16 files changed, 491 insertions(+), 9 deletions(-)
 create mode 100644 include/uapi/linux/secretmem.h
 create mode 100644 mm/secretmem.c


base-commit: f932d58abc38c898d7d3fe635ecb2b821a256f54
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
