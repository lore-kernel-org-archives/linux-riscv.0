Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773B0C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 08:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBKqcC58sgQ+cqK4X3KhTohlgn7qT89C1fKaK9K1RYE=; b=1mEjD0fFdcuCKW
	CSKYMSKD0MtiqWg+6Ac2H8Sksn6TtUbKAqTknBzPcByucS85AGCUDifzUXSJymUQnlXhg/clxkod3
	FZ+cgLl8cRdFiVVIJLxKrKRK8Uu73oW3FrRL85TJVkDBaDHJsQXaqLXVMJhqPH05p/0kARpsZOD3w
	usDkorGN9iNBFKx+/hZYbw/SzFymGBzrORptv0u+R/PaHvFOP5IyRvnbQD7gtjF2IDgNnS1lr5ZVl
	Qk1r/cT0sY7P2OZiMy4dxb6+Aoj4OupK5ouQTclv2arg902/UAAAVIrWQGivVe/qAmoLU6FkrpjO4
	c0lFDl/FNCvGQOVi2lDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVo6A-00000008ojl-2dIo;
	Mon, 22 Jul 2024 08:08:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVo5n-00000008oaR-2gwK;
	Mon, 22 Jul 2024 08:08:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3954FCE0AD0;
	Mon, 22 Jul 2024 08:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8487EC116B1;
	Mon, 22 Jul 2024 08:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721635700;
	bh=CyGkt9FKsE7t82Fz3Aja4aysBlda3M5p39yI7jGRxvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p25P0kSTbiVOylOIEqDsNzu3H4FIr1FoKh51p+DLef42bOBD/+IeI2/qDrEkJ+aUx
	 JOvOmKwgblc3PxoHZyePkukIsG2JOzUb1CtejWkJjsYEL+wE+xp+6wxEcuMsKupROE
	 CA9CX/rTisj9sF8GN70yjNgXp/rNyLGfErtqlsic85lbYH2IS8/mqV6aMVfUuSaXtH
	 topFnxcko1xfwmMPrFsEb8ponJJrkpshooXAGBp2O9P6TVcS4OTwIgmnR6Fyim1ny8
	 TO3+8cCWwXRhFKfLIEbl29aoxeQlMpLqB4pFhJuhOGKty/suok7RCzqd0dTMUm3oEi
	 9ce0/fUKEVZnQ==
Date: Mon, 22 Jul 2024 11:05:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	nvdimm@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 15/17] mm: make numa_memblks more self-contained
Message-ID: <Zp4StwFAIMu2LHjM@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-16-rppt@kernel.org>
 <20240719190712.00001307@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240719190712.00001307@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_010823_877745_159CD73C 
X-CRM114-Status: GOOD (  14.38  )
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

On Fri, Jul 19, 2024 at 07:07:12PM +0100, Jonathan Cameron wrote:
> On Tue, 16 Jul 2024 14:13:44 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Introduce numa_memblks_init() and move some code around to avoid several
> > global variables in numa_memblks.
> 
> Hi Mike,
> 
> Adding the effectively always on memblock_force_top_down
> deserves a comment on why. I assume because you are going to do
> something with it later? 
> 
> There also seems to be more going on in here such as the change to
> get_pfn_range_for_nid()  Perhaps break this up so each
> change can have an explanation. 

I'll split this into several commits. 
 
-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
