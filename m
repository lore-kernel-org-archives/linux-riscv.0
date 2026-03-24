Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C74F532E5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=65jD+EReI+CO/oV+NxKnFuZRVf5WOGYp30bRLDji964=; b=k6eD3BuyZUwrNv
	8FzocVX4AEz0BL3JHV917s8jlbpdVjVHt5U9Xpa1yeoZ7aErefVaY3uNOOJElDfj1y+vWtgMNYpnP
	Wkv/o4vagHZNN2ouFpsVrZq2PJ3kzCxxZAwyXeVa1kfD4vAnLsqCVYlXI040kx03TwgTmwv42+5O6
	fovk8kqm0CEV6gKKRChCgtc66XgwWKQGC+nPrsZPtYS0pTwUbIMD+UNIwNY6WK9w1Vz2Spv446+lu
	Y5um837Hc+D2lvjnMCemKpNCqSwirg7BRgnHSUwbHburRr0RCPg3KZX1WpVPBM0KWI6y9UO0of+w1
	nd64WRaeMQ3CfVR79VDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vSH-00000000m3N-1am2;
	Tue, 24 Mar 2026 06:41:33 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vSD-00000000m23-3thG;
	Tue, 24 Mar 2026 06:41:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-raid@vger.kernel.org
Subject: cleanup the RAID6 P/Q library
Date: Tue, 24 Mar 2026 07:40:35 +0100
Message-ID: <20260324064115.3217136-1-hch@lst.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi all,

this series cleans up the RAID6 P/Q library to match the recent updates
to the RAID 5 XOR library and other CRC/crypto libraries.  This includes
providing properly documented external interfaces, hiding the internals,
using static_call instead of indirect calls and turning the user space
test suite into an in-kernel kunit test which is also extended to
improve coverage.

Note that this changes registration so that non-priority algorithms are
not registered, which greatly helps with the benchmark time at boot time.
I'd like to encourage all architecture maintainers to see if they can
further optimized this by registering as few as possible algorithms when
there is a clear benefit in optimized or more unrolled implementations.

This series sits on top of the "cleanup the RAID5 XOR library v3" series.

A git tree is also available here:

    git://git.infradead.org/users/hch/misc.git lib-raid6

Gitweb:

    https://git.infradead.org/?p=users/hch/misc.git;a=shortlog;h=refs/heads/lib-raid6

Diffstat:
 b/Documentation/crypto/async-tx-api.rst           |    4 
 b/crypto/async_tx/async_pq.c                      |    9 
 b/crypto/async_tx/async_raid6_recov.c             |    9 
 b/drivers/dma/bcm-sba-raid.c                      |    1 
 b/drivers/md/raid5.c                              |    4 
 b/fs/btrfs/raid56.c                               |    8 
 b/include/linux/raid/pq.h                         |  216 ------------
 b/include/linux/raid/pq_tables.h                  |   19 +
 b/lib/Kconfig                                     |   11 
 b/lib/Makefile                                    |    1 
 b/lib/raid/Kconfig                                |   33 +
 b/lib/raid/Makefile                               |    2 
 b/lib/raid/raid6/Makefile                         |  124 +++++++
 b/lib/raid/raid6/algos.c                          |  381 ++++++++++++++++++++++
 b/lib/raid/raid6/algos.h                          |   41 ++
 b/lib/raid/raid6/arm/neon.c                       |   23 -
 b/lib/raid/raid6/arm/pq_arch.h                    |   22 +
 b/lib/raid/raid6/arm/recov_neon.c                 |   25 -
 b/lib/raid/raid6/int.uc                           |   10 
 b/lib/raid/raid6/loongarch/loongarch_simd.c       |   31 -
 b/lib/raid/raid6/loongarch/pq_arch.h              |   23 +
 b/lib/raid/raid6/loongarch/recov_loongarch_simd.c |   39 --
 b/lib/raid/raid6/mktables.c                       |   28 -
 b/lib/raid/raid6/powerpc/altivec.uc               |   32 -
 b/lib/raid/raid6/powerpc/pq_arch.h                |   31 +
 b/lib/raid/raid6/powerpc/vpermxor.uc              |   29 -
 b/lib/raid/raid6/recov.c                          |   62 ---
 b/lib/raid/raid6/riscv/pq_arch.h                  |   21 +
 b/lib/raid/raid6/riscv/recov_rvv.c                |   14 
 b/lib/raid/raid6/riscv/rvv.h                      |   26 -
 b/lib/raid/raid6/s390/pq_arch.h                   |   15 
 b/lib/raid/raid6/s390/recov_s390xc.c              |   14 
 b/lib/raid/raid6/s390/s390vx.uc                   |   15 
 b/lib/raid/raid6/tests/Makefile                   |    3 
 b/lib/raid/raid6/tests/raid6_kunit.c              |  307 +++++++++++++++++
 b/lib/raid/raid6/x86/avx2.c                       |   47 --
 b/lib/raid/raid6/x86/avx512.c                     |   57 +--
 b/lib/raid/raid6/x86/mmx.c                        |   39 --
 b/lib/raid/raid6/x86/pq_arch.h                    |   96 +++++
 b/lib/raid/raid6/x86/recov_avx2.c                 |   22 -
 b/lib/raid/raid6/x86/recov_avx512.c               |   26 -
 b/lib/raid/raid6/x86/recov_ssse3.c                |   23 -
 b/lib/raid/raid6/x86/sse1.c                       |   49 --
 b/lib/raid/raid6/x86/sse2.c                       |   47 --
 lib/raid6/Makefile                                |   83 ----
 lib/raid6/algos.c                                 |  291 ----------------
 lib/raid6/loongarch.h                             |   38 --
 lib/raid6/test/.gitignore                         |    3 
 lib/raid6/test/Makefile                           |  156 ---------
 lib/raid6/test/test.c                             |  152 --------
 lib/raid6/x86.h                                   |   75 ----
 51 files changed, 1329 insertions(+), 1508 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
