Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D4FC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 18:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W95tjmlhZF4ipixT5N15b9zO0MvLERyBBG6LwAuHwBs=; b=mJTEOh7y/WdxGh
	RBZYSgmonY+cCzksP9BqBNPLodZsxAPMwZedBPq7Bjepyf4NpmRYpbmvVtzcEumr2fUSovcMdQ0Cy
	Gt678u3eCuPMmizUvD4stIP74O0E0w1pW4DnJQkv8qJXR1n2ivls6W5uAksakSh5PS+VtBfpgL2VU
	rmOaLGnc6TP4OZ6+sJq9u3qI3wX5po23iC3ggPbggJUIcYqXV6HOsJger/aSMq17NzMg9awYisISt
	QONEkJ0kopHPqzDPE7MJW6JSrBoVYJ16UtphNm6HznmvmvR0JES+ic7cdQAPPURct162f9dIKGjyc
	B1SgzJJMg+9kYYLLCtrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rop5V-00000001MTZ-07e8;
	Mon, 25 Mar 2024 18:30:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rop5R-00000001MRr-2XYP
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 18:30:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3769B2F4;
	Mon, 25 Mar 2024 11:30:54 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.16.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FEC93F64C;
	Mon, 25 Mar 2024 11:30:17 -0700 (PDT)
Date: Mon, 25 Mar 2024 18:30:08 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Ghiti <alex@ghiti.fr>, David Laight <David.Laight@aculab.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Charlie Jenkins <charlie@rivosinc.com>, guoren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Matthew Wilcox <willy@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Xiao W Wang <xiao.w.wang@intel.com>, Yangyu Chen <cyy@cyyself.name>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
Message-ID: <ZgHCpgHh1ypSyrtv@FVFF77S0Q05N>
References: <20240313180010.295747-1-samuel.holland@sifive.com>
 <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
 <88de4a1a-047e-4be9-b5b0-3e53434dc022@sifive.com>
 <b5624bba-9917-421b-8ef0-4515d442f80b@ghiti.fr>
 <f786e02245424e02b38f55ae6b29d14a@AcuMS.aculab.com>
 <d323eb10-c79b-49cb-94db-9b135e6fd280@ghiti.fr>
 <ZgGosOiW6mTeSnTL@FVFF77S0Q05N>
 <eeccbc9f-7544-42c9-964f-2b4c924c2b2f@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eeccbc9f-7544-42c9-964f-2b4c924c2b2f@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_113021_768934_E339BB0C 
X-CRM114-Status: GOOD (  21.70  )
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

On Mon, Mar 25, 2024 at 07:02:13PM +0100, Arnd Bergmann wrote:
> On Mon, Mar 25, 2024, at 17:39, Mark Rutland wrote:
> 
> > Using a compile-time constant TASK_SIZE_MAX allows the compiler to generate
> > much better code for access_ok(), and on arm64 we use a compile-time constant
> > even when our page table depth can change at runtime (and when native/compat
> > task sizes differ). The only abosolute boundary that needs to be maintained is
> > that access_ok() fails for kernel addresses.
> 
> As I understand, this works on arm64 and x86 because the kernel
> mapping starts on negative 64-bit addresses, so the highest user
> address (TASK_SIZE = 0x000fffffffffffff) is still smaller than the
> lowest kernel address (PAGE_OFFSET = 0xfff0000000000000).

Yep; the highest posible user address is always below the lowest possible
kernel address, and any "non-canonical" address between the two ranges faults.
There's some fun with TBI (Top Byte Ignore) and MTE, but that only affects how
to mangle the pointer before the check, and doesn't affect the definition of
the VA boundary.

In general, so long as TASK_SIZE_MAX is <= the lowest possible kernel address
and TASK_SIZE_MAX > the highest possible user address, it all works out.

> If an architecture ignores all the top bits of a virtual address,
> the largest TASK_SIZE would be higher than the smallest (positive,
> unsigned) PAGE_OFFSET, so you need TASK_SIZE_MAX to be dynamic.

Agreed, but do we even support such architectures within Linux?

> It doesn't look like this is the case on riscv, but I'm not sure
> about this part.

It looks like riscv is in the same bucket as arm64 and x86 per:

  https://www.kernel.org/doc/html/next/riscv/vm-layout.html

... which says:

| The RISC-V privileged architecture document states that the 64bit addresses
| "must have bits 63-48 all equal to bit 47, or else a page-fault exception
| will occur.": that splits the virtual address space into 2 halves separated
| by a very big hole, the lower half is where the userspace resides, the upper
| half is where the RISC-V Linux Kernel resides.

Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
