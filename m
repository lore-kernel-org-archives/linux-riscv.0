Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE80C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Date:From:Cc:To:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PWJoNqN+DiUlwFnK+2iw4YtvbZKL9A8VnXNv1uI4eMI=; b=YilxhU9asR1ofk
	1fa+THY+lf1v3d8L8CQALoxuEPj3m4HTKpT60DUIVhKNX9CxWhYTsZXbGu0UrbEt387rIV84IdYRZ
	ZitIzu7ktDHXLBFrTkXFk9TsIV4B1KvOfyxvQ2d6lpCcPn9ty9wI+qxo1w8wgDdLnlX27rDnEgBij
	l7bueHhiptHh00QSpvWSbMk4aYwUIsIxUR2f5NVe56GHcSJfGbFBU28nIYV9xGG5N10YNKtNgThsC
	MD3FvQcAzSs76Ydo63PmLNEQ8EeAtpPQ/YvQV/B1ddhaOjGG1tdCU/MNmlwihEWwF540Fyh8Jq4yz
	YFctwVn+PrEjGNLFESKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwmYZ-0000000DACG-3DNw;
	Tue, 16 Apr 2024 17:25:19 +0000
Received: from mx0b-00823401.pphosted.com ([148.163.152.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwmYS-0000000DA9b-3SSk;
	Tue, 16 Apr 2024 17:25:18 +0000
Received: from pps.filterd (m0355090.ppops.net [127.0.0.1])
	by m0355090.ppops.net (8.17.1.24/8.17.1.24) with ESMTP id 43GEXrjS031887;
	Tue, 16 Apr 2024 17:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	message-id:to:cc:from:date:subject; s=DKIM202306; bh=2/+dIqzISm4
	HW8XR6l5FpwwTpbfMt78jX0a3kMrPooU=; b=SolvqlvVeEOjkEw0Mfw/sd/8/ot
	TsfiEGZZja2kdjDzKEYOW9/aS24NkmlJ6tdI+Cgag2ptvGjbp30Xln2h7funf0gT
	BLOndgDSy/av5W2JlacRZfEKMPfWmKX+VGLFY8UPm74eDw6DB0NdJHXEt4u0qN1m
	cQHdsfe+VHO3+k0LVOg8xxeriOjh8wpt7Rt5tkzWSuTlwb28z2IPitn08E3uiFC1
	0jYRGM31ajc/4yMeBDn1X/MQXTdLgzUqbEJ0THkaFOcXlplfu1FenxPbVSnBKQ9j
	Ps8ZT9LJ/VqctuMg8lc5IjxObtHrPNs8v5D7WaR12QE9O8AmxlrTl0qAafg==
Received: from va32lpfpp02.lenovo.com ([104.232.228.22])
	by m0355090.ppops.net (PPS) with ESMTPS id 3xhrya9dpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 17:24:57 +0000 (GMT)
Received: from va32lmmrp01.lenovo.com (va32lmmrp01.mot.com [10.62.177.113])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by va32lpfpp02.lenovo.com (Postfix) with ESMTPS id 4VJrWs0n42z53xyX;
	Tue, 16 Apr 2024 17:24:57 +0000 (UTC)
Received: from ilclbld243.mot.com (ilclbld243.mot.com [100.64.22.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by va32lmmrp01.lenovo.com (Postfix) with ESMTPSA id 4VJrWs0XQ6z2VZRf;
	Tue, 16 Apr 2024 17:24:57 +0000 (UTC)
Message-Id: <20240416122254.868007168-1-mbland@motorola.com>
To: linux-mm@kvack.org
Cc: Maxwell Bland <mbland@motorola.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        David Hildenbrand <david@redhat.com>,
        Conor Dooley <conor.dooley@microchip.com>
From: Maxwell Bland <mbland@motorola.com>
Date: Mon, 15 Apr 2024 15:16:08 -0500
Subject: [PATCH 0/5] mm: code and data partitioning improvements
X-Proofpoint-ORIG-GUID: vSRvg_yzr5e2ij9r_RJZHMk7igMKbit5
X-Proofpoint-GUID: vSRvg_yzr5e2ij9r_RJZHMk7igMKbit5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_14,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_102513_099467_88A80822 
X-CRM114-Status: GOOD (  27.18  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Managing allocations to ensure code and data pages are not interleaved
is not possible prior to this patch, as ASLR requires programming a
dynamic _text offset while the vmalloc infrastructure maintains static
VMALLOC_START and VMALLOC_END constants.

In systems where code and data are interleaved at a PTE granularity,
kernel improvements targeting the prevention of exploit stages which
modify page tables are inefficient and less effective as individual PTE
updates occur at high frequency and cannot be coarsely grouped at the
PMD level or greater.

This patch adds minimal arch-specific callbacks to the initialization of
vmalloc and when deciding whether to use a specific virtual memory area
to satisfy a vmalloc request to provide the capability to prevent the
allocation of specific virtual addresses under specific system states.
By default these hooks are unimplemented.

To further support the practical use of these callbacks, this patch also
adds a virtual address parameter to pmd_populate_kernel, so that this
interface matches the equivalent pte-level interface and architectures
are not required to perform a reverse page table lookup to determine the
vaddr being allocated during pmd creation.

To demonstrate the impact and value of these changes, this patch
implements support for dynamic PXNTable under aarch64 in 71 lines of
code (a single "if" check during memory allocation), by checking the
virtual address of a given vmalloc call to determine whether it is code
or data. From experience in trying to implement kernel page table
immutability and protections in KVM to prevent recent CVEs, e.g.
CVE-2024-1086, this is a necessary first step.

To better help maintainers and future developers, this patch expands
ptdump.c so that non-leaf page table descriptors can be more easily
noted in debug output by setting a note_non_leaf bool in the ptdump
state.

Signed-off-by: Maxwell Bland <mbland@motorola.com>

---

First, thank you to a number of maintainers (Mark Rutland, Greg KH,
Christoph Hellwig, Christophe Leroy, David Hildenbrand, Conor Dooley)
for their feedback on

<20240220203256.31153-1-mbland@motorola.com>
and
<CAP5Mv+ydhk=Ob4b40ZahGMgT-5+-VEHxtmA=-LkJiEOOU+K6hw@mail.gmail.com>

This patch is a further refinement and overhaul of these prior two
attempts. Also, apologies for the roughly two months delay between patch
submissions! I had Motorola work to do.

In support of testing this patch (but not included in this patch), I set
note_non_leaf to true under arch/arm64/mm/ptdump.c and added
PMD_TABLE_PXN to pte_bits to print out whether the PXNTable bit was set.
The txt files under the following directory can be diff'ed to see the
result:

github.com/maxwell-bland/linux-patch-data/tree/main/code_data_parting/ptdump

I also created a script to fetch and cross-compile the kernel for each
of the 21 subarchitectures which required fixes to provide a virtual
address to pmd_populate_kernel. I have no idea if it is useful and maybe
one already exists, but it worked well for me over some alternatives
(xcross, buildroot):

github.com/maxwell-bland/x-linux

As with the last patchset, I also measured performance using Torvald's 
test-tlb program on an aarch64 QEMU instance, with results here:

github.com/maxwell-bland/linux-patch-data/tree/main/code_data_parting/tlbperf

As all changes to other arches are effectively no-ops, performance
impacts in those domains are negligible. 

Maxwell Bland (5):
  mm: allow arch refinement/skip for vmap alloc
  arm64: mm: code and data partitioning for aslr
  mm: add vaddr param to pmd_populate_kernel
  arm64: dynamic enforcement of PXNTable
  ptdump: add state parameter for non-leaf callback

 arch/alpha/include/asm/pgalloc.h             |  5 +-
 arch/arc/include/asm/pgalloc.h               |  3 +-
 arch/arc/mm/highmem.c                        |  2 +-
 arch/arm/include/asm/kfence.h                |  2 +-
 arch/arm/include/asm/pgalloc.h               |  3 +-
 arch/arm/mm/kasan_init.c                     |  2 +-
 arch/arm/mm/mmu.c                            |  2 +-
 arch/arm64/include/asm/module.h              | 12 ++++
 arch/arm64/include/asm/pgalloc.h             | 15 ++++-
 arch/arm64/include/asm/vmalloc.h             | 17 ++++-
 arch/arm64/kernel/Makefile                   |  2 +-
 arch/arm64/kernel/module.c                   |  7 +-
 arch/arm64/kernel/probes/kprobes.c           |  7 +-
 arch/arm64/kernel/setup.c                    |  4 ++
 arch/arm64/kernel/vmalloc.c                  | 71 ++++++++++++++++++++
 arch/arm64/mm/ptdump.c                       | 10 +--
 arch/arm64/mm/trans_pgd.c                    |  2 +-
 arch/arm64/net/bpf_jit_comp.c                |  8 ++-
 arch/csky/include/asm/pgalloc.h              |  2 +-
 arch/hexagon/include/asm/pgalloc.h           |  2 +-
 arch/loongarch/include/asm/pgalloc.h         |  3 +-
 arch/loongarch/mm/init.c                     |  2 +-
 arch/loongarch/mm/kasan_init.c               |  2 +-
 arch/m68k/include/asm/mcf_pgalloc.h          |  2 +-
 arch/m68k/include/asm/motorola_pgalloc.h     |  3 +-
 arch/m68k/include/asm/sun3_pgalloc.h         |  3 +-
 arch/microblaze/include/asm/pgalloc.h        |  2 +-
 arch/mips/include/asm/pgalloc.h              |  2 +-
 arch/mips/kvm/mmu.c                          |  2 +-
 arch/nios2/include/asm/pgalloc.h             |  2 +-
 arch/openrisc/include/asm/pgalloc.h          |  2 +-
 arch/parisc/include/asm/pgalloc.h            |  5 +-
 arch/parisc/mm/init.c                        |  6 +-
 arch/powerpc/include/asm/book3s/32/pgalloc.h |  2 +-
 arch/powerpc/include/asm/book3s/64/pgalloc.h |  2 +-
 arch/powerpc/include/asm/nohash/32/pgalloc.h |  2 +-
 arch/powerpc/include/asm/nohash/64/pgalloc.h |  2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  2 +-
 arch/powerpc/mm/kasan/init_32.c              |  4 +-
 arch/powerpc/mm/kasan/init_book3e_64.c       |  9 ++-
 arch/powerpc/mm/kasan/init_book3s_64.c       |  7 +-
 arch/powerpc/mm/nohash/book3e_pgtable.c      |  2 +-
 arch/powerpc/mm/pgtable_32.c                 |  4 +-
 arch/powerpc/mm/ptdump/ptdump.c              |  2 +
 arch/riscv/include/asm/pgalloc.h             |  2 +-
 arch/riscv/kernel/hibernate.c                |  2 +-
 arch/riscv/mm/ptdump.c                       |  6 +-
 arch/s390/include/asm/pgalloc.h              |  2 +-
 arch/s390/mm/dump_pagetables.c               |  6 +-
 arch/sh/include/asm/pgalloc.h                |  2 +-
 arch/sh/mm/init.c                            |  2 +-
 arch/sparc/include/asm/pgalloc_32.h          |  3 +-
 arch/sparc/include/asm/pgalloc_64.h          |  4 +-
 arch/sparc/mm/init_64.c                      |  8 +--
 arch/um/include/asm/pgalloc.h                |  4 +-
 arch/x86/include/asm/pgalloc.h               |  3 +-
 arch/x86/mm/dump_pagetables.c                |  3 +-
 arch/x86/mm/init_64.c                        | 14 +++-
 arch/x86/mm/ioremap.c                        |  2 +-
 arch/x86/mm/kasan_init_64.c                  |  2 +-
 arch/xtensa/include/asm/pgalloc.h            |  2 +-
 include/linux/mm.h                           |  4 +-
 include/linux/ptdump.h                       |  1 +
 include/linux/vmalloc.h                      | 24 +++++++
 mm/hugetlb_vmemmap.c                         |  4 +-
 mm/kasan/init.c                              | 14 ++--
 mm/memory.c                                  |  4 +-
 mm/percpu.c                                  |  2 +-
 mm/pgalloc-track.h                           |  3 +-
 mm/ptdump.c                                  | 13 ++++
 mm/sparse-vmemmap.c                          |  2 +-
 mm/vmalloc.c                                 | 16 +++--
 72 files changed, 299 insertions(+), 107 deletions(-)
 create mode 100644 arch/arm64/kernel/vmalloc.c


base-commit: 0bbac3facb5d6cc0171c45c9873a2dc96bea9680
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
