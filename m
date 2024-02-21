Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074E4C48BF6
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 05:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xlvAisiq9jNSKpq9jG5hZsLfSL+DRPuTf58T7K2Qm8=; b=FygFxZ+SCI240E
	mD0/PRdTaT+N8dBpbyDHfrjVDI3dEOeDj9wMQ9fYEb0FYnIy9pG384rCND8Hiu/c+VdVLGTRP6flO
	s4zD3cCPVvxKIN4FUM+nDsfZpd9qUU9kUGBhDmADPIYxUcY5+OQxEytgSf7lnAa2j+fnHOxh23Mj8
	t0pZTgpalYRfGPHspGDf44TpaWNqtYGu4rpATPY8swMwbYQrjcGPY/aK1gRaEU1fc+Hvn+Jj32GNs
	hhYYXlO8ITbFoQWeVoC0aZ6ovKORVzfw+DseJV3ijCMdSdlIvCuOKwe+AJHfGu9OQNxBTZixXLAGC
	wlwnMgLJ7Beo1cxRaqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcfNv-0000000HEoH-2xd1;
	Wed, 21 Feb 2024 05:43:11 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcfNq-0000000HEmM-23vn;
	Wed, 21 Feb 2024 05:43:06 +0000
Date: Tue, 20 Feb 2024 21:43:06 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Maxwell Bland <mbland@motorola.com>
Cc: linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
	agordeev@linux.ibm.com, akpm@linux-foundation.org,
	andreyknvl@gmail.com, andrii@kernel.org, aneesh.kumar@kernel.org,
	aou@eecs.berkeley.edu, ardb@kernel.org, arnd@arndb.de,
	ast@kernel.org, borntraeger@linux.ibm.com, bpf@vger.kernel.org,
	brauner@kernel.org, catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu, cl@linux.com, daniel@iogearbox.net,
	dave.hansen@linux.intel.com, david@redhat.com, dennis@kernel.org,
	dvyukov@google.com, glider@google.com, gor@linux.ibm.com,
	guoren@kernel.org, haoluo@google.com, hca@linux.ibm.com,
	hch@infradead.org, john.fastabend@gmail.com, jolsa@kernel.org,
	kasan-dev@googlegroups.com, kpsingh@kernel.org,
	linux-arch@vger.kernel.org, linux@armlinux.org.uk,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	lstoakes@gmail.com, mark.rutland@arm.com, martin.lau@linux.dev,
	meted@linux.ibm.com, michael.christie@oracle.com, mjguzik@gmail.com,
	mpe@ellerman.id.au, mst@redhat.com, muchun.song@linux.dev,
	naveen.n.rao@linux.ibm.com, npiggin@gmail.com, palmer@dabbelt.com,
	paul.walmsley@sifive.com, quic_nprakash@quicinc.com,
	quic_pkondeti@quicinc.com, rick.p.edgecombe@intel.com,
	ryabinin.a.a@gmail.com, ryan.roberts@arm.com,
	samitolvanen@google.com, sdf@google.com, song@kernel.org,
	surenb@google.com, svens@linux.ibm.com, tj@kernel.org,
	urezki@gmail.com, vincenzo.frascino@arm.com, will@kernel.org,
	wuqiang.matt@bytedance.com, yonghong.song@linux.dev,
	zlim.lnx@gmail.com, awheeler@motorola.com
Subject: Re: [PATCH 1/4] mm/vmalloc: allow arch-specific vmalloc_node
 overrides
Message-ID: <ZdWNalbmABYDuFHE@infradead.org>
References: <20240220203256.31153-1-mbland@motorola.com>
 <20240220203256.31153-2-mbland@motorola.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220203256.31153-2-mbland@motorola.com>
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

On Tue, Feb 20, 2024 at 02:32:53PM -0600, Maxwell Bland wrote:
> Present non-uniform use of __vmalloc_node and __vmalloc_node_range makes
> enforcing appropriate code and data seperation untenable on certain
> microarchitectures, as VMALLOC_START and VMALLOC_END are monolithic
> while the use of the vmalloc interface is non-monolithic: in particular,
> appropriate randomness in ASLR makes it such that code regions must fall
> in some region between VMALLOC_START and VMALLOC_end, but this
> necessitates that code pages are intermingled with data pages, meaning
> code-specific protections, such as arm64's PXNTable, cannot be
> performantly runtime enforced.

That's not actually true.  We have MODULE_START/END to separate them,
which is used by mips only for now.

> 
> The solution to this problem allows architectures to override the
> vmalloc wrapper functions by enforcing that the rest of the kernel does
> not reimplement __vmalloc_node by using __vmalloc_node_range with the
> same parameters as __vmalloc_node or provides a __weak tag to those
> functions using __vmalloc_node_range with parameters repeating those of
> __vmalloc_node.

I'm really not too happy about overriding the functions.  Especially
as the separation is a generally good idea and it would be good to
move everyone (or at least all modern architectures) over to a scheme
like this.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
