Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07352C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 05:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iAahNMWuMOvOgoPM9zRKMWOWvYeH0CT7RB4gdbNlCY=; b=FeDiilNpSqrK+w
	LSAtGIQu2OT5zj3yU4yif+yHqrslbtwN58yGRrxHvJBTVakfYs4PdthEHG/FBq7edbCPVwnqrvomF
	um+odgjtdmXuclITBPZs6OCXyPIhR6MotB8iP4xaxyOH07ngPGpcV6l0tZwX+PbsS8Yoz+zJTXIn0
	0vfChHx3tnUakptVFZqTanQBjsYvJATT9iBcYPJaZvfgobSbOnFE/5TCTQ81kIf+u58kgju1DD155
	AL3PCHnQYBrr1PNEQ3vjHGAEbprh61DGK1A2LxRw6y2AVc5vQxOIEgbHC7ma78u98vdwhrfk1JsFl
	YZwT+Zg+lHDr0cQLcqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUgdu-00000001hYn-3RtP;
	Fri, 19 Jul 2024 05:58:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUgdY-00000001hSa-2glw;
	Fri, 19 Jul 2024 05:58:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7092FCE1AD5;
	Fri, 19 Jul 2024 05:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38BCBC32782;
	Fri, 19 Jul 2024 05:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721368712;
	bh=UQznUIdoHoSsnmJ9kRgND1mWM0Wr77U9QEYTciDIo28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRFthwaJnqijAayKx7Nr5Wz+cg7XtkKFYmu9Y+J8JOSZNkKtcyO0oPxjnmHQb5MAT
	 +SzEDWjweXYNk8r/wQxrhgFgyaJzF2zS7ds36V+HfUkLd39/F0Jm+9Xel/QgVHiXrN
	 u8dtVDBEcxTLfuJ09zphSq9TFj0SodZS5yh/iSTnCqMAmk0l0hgKZ81y9JEQyQLhxw
	 sglzaaOKdzC/1FVu4YR8/PhMdvuoqPLRhEF6pZyxCI7bcLrHj8JLnnhhcpRX6xDDkZ
	 xqyY0lHVXYowiKXrRiLwZxIMlHLP+cfRIEOh0c7+hIF8r+/xRAu73hBTRRXaUjI764
	 7OCKjCrNEM7Gw==
Date: Fri, 19 Jul 2024 08:55:27 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
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
	Jonathan Cameron <jonathan.cameron@huawei.com>,
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
Subject: Re: [PATCH 13/17] mm: move numa_distance and related code from x86
 to numa_memblks
Message-ID: <Zpn_z_NgzTl_db5t@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-14-rppt@kernel.org>
 <8b402e92-d874-4b30-9108-f521bd20d36c@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b402e92-d874-4b30-9108-f521bd20d36c@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_225836_861715_08C8B28C 
X-CRM114-Status: GOOD (  15.73  )
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

On Thu, Jul 18, 2024 at 04:46:17PM -0500, Samuel Holland wrote:
> On 2024-07-16 6:13 AM, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Move code dealing with numa_distance array from arch/x86 to
> > mm/numa_memblks.c
> > 
> > This code will be later reused by arch_numa.
> > 
> > No functional changes.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/x86/mm/numa.c                   | 101 ---------------------------
> >  arch/x86/mm/numa_internal.h          |   2 -
> >  include/linux/numa_memblks.h         |   4 ++
> >  {arch/x86/mm => mm}/numa_emulation.c |   0
> >  mm/numa_memblks.c                    | 101 +++++++++++++++++++++++++++
> >  5 files changed, 105 insertions(+), 103 deletions(-)
> >  rename {arch/x86/mm => mm}/numa_emulation.c (100%)
> 
> The numa_emulation.c rename looks like it should be part of the next commit, not
> this one.

Right, thanks!

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
