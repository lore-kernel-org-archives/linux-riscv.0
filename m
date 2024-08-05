Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11984C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJgneDDrteNELRUGOWAWBSl5eaZJNl0lOYQzd4mVy68=; b=w7Mrdr3+Y/e3As
	VDHTVskyfQt93lrFu3Xk5gvrQqP1RE9uDQ5/gndbpNfFd+H2GKYxFGaD+xZgnKYdbGc4YvGIAjjmx
	5z4t1nBAj86RJeI3FAkLEw43eMXW1E+jCmi6plwemVooGbjl1DAS7PS4kNHahiu5VKbCI/SOGqyLo
	sJCd1A4VjgccQ8goNeceCJaLpsZrLU20kmcibWY98CqyawyS2L2YpP2/ZJTULauyMDq/4naJQ6Ewx
	J8A+AqXeahR2H2gWqn+Tc3v96OdauD48h7O5kR/SV2QP5ZoCejwIsgKycgiqaRhp9RkzVcKF3/WCT
	1Fe1tpI6VomyCEWJqgeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb4RV-0000000HDer-26K4;
	Mon, 05 Aug 2024 20:36:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb4Qy-0000000HDVQ-3PLw;
	Mon, 05 Aug 2024 20:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CBB4BCE0B42;
	Mon,  5 Aug 2024 20:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51B2C32782;
	Mon,  5 Aug 2024 20:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722890158;
	bh=wRagKm6MS39NDYLBbcdNfb/zxQJOwJqmtNN36cxhWNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g0ifEE+/fQd9VQyFJiGF6eqG5LkKWn0QoytIRLG6RGNO3Qz+ixAqBqBhJXWXYzJE8
	 0lFaNo21LgP2mbO565lm6BtVRnS7fXNHEJVy8zEtHsy8Uw8u/a5v19B4OkrZVUS3fx
	 ix+vSxthkk0vtjORnJgV3NWtYxBAy3BhlS8nwLVfIFfPyq5ww4vSd2FHKgUzoj06Iv
	 Vb4ByzZFa5e2puJlKIa3k2+AazNy3wMipT1Qok9eH8nBZ24hNYG5OjUnktHHi7xdO4
	 HdW3CuSUf4iLi1uAYROJiEHzYtewSLvIDZn8z4DY92o6CWtrXY1hYgkOWg3WUTpR8E
	 O3fqMHFNWnE8A==
Date: Mon, 5 Aug 2024 23:33:39 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	nvdimm@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3 22/26] mm: numa_memblks: use
 memblock_{start,end}_of_DRAM() when sanitizing meminfo
Message-ID: <ZrE3I6qCdfHPa3FB@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
 <20240801060826.559858-23-rppt@kernel.org>
 <66b1342e8af7f_c1448294af@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66b1342e8af7f_c1448294af@dwillia2-xfh.jf.intel.com.notmuch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_133601_032139_7F175A47 
X-CRM114-Status: GOOD (  14.39  )
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

On Mon, Aug 05, 2024 at 01:21:02PM -0700, Dan Williams wrote:
> Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > numa_cleanup_meminfo() moves blocks outside system RAM to
> > numa_reserved_meminfo and it uses 0 and PFN_PHYS(max_pfn) to determine
> > the memory boundaries.
> > 
> > Replace the memory range boundaries with more portable
> > memblock_start_of_DRAM() and memblock_end_of_DRAM().
> 
> Can you say a bit more about why this is more portable? Is there any
> scenario for which (0, max_pfn) does the wrong thing?

arm64 may have DRAM starting at addresses other than 0.
And max_pfn seems to me a redundant global variable that I'd love to see
gone.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
