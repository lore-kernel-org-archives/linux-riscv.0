Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BFDC7114C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 21:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMwt64xbJoI5MnYN+RiNgRHTIEFX2gyTf3DehBEnHe8=; b=neIo0MPj3sV4Ho
	wxik6Pm5yQCppl8TKGwH1n56u76xNlgeAHHIZwwoOogA4PfUySHQKI9NTtYfsdbYks57HDYNmqzVK
	dR0UCgWPjQRIyM0yv0tzXX5euK7Q2D6O/Ev3lq3fh6Qb/esSa27UYuSPRAPtxWtIXh7Zaw+eR3pAp
	dvL0+4xCYifhU0vOVaOSWd+soAz9n4u9QxRhlJteL8GqVznj3gnwM6bTMicc8vG5l3y+76xnHYsvJ
	FuQEon9Rn4fthuCwJBSQPnBOKtQPHSHwHQr51KB6CJw8TWfTV8ShpqBzqoxYHY0Zci/JvRJn0ZP2i
	yOEc54HUyoLlylSoyZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjQOb-0000000H7IJ-3GYq;
	Wed, 28 Aug 2024 21:40:05 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjQOX-0000000H7Gv-2i4C
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 21:40:04 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7106cf5771bso184b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 14:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724881200; x=1725486000; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XeNJBfO0ja/8g6kzTOhNFElQs2waKVPJgdUV/DsW4nc=;
        b=oI0naETeLUBm30/O1+etfWmLJBbPqcHpQSSuaaM4+OG/6KVyg79Z5GwL5WfJYBYzwF
         YmYwK1uAeLEeVAfnegG99kjIF5rkCK5KVcugYxzj/TKTMbGXWVM6OX0VycCayk8gmNbP
         r50XJ8eaXFGnADJ3SvKLabNxw4PG7F/5Yfnd+S4em1XDB7/KSJCF75nstWFoEbmuAUtL
         8T8oPT9HVgX7Inj7/AccHkwCFVEz00EaOp1C8B/cjQV9z3Y+XPwjGI592+5PL0aXXcHO
         NFALESRacMvbW71FaG9CtYEvDMXXLTy1iM4v76/LT801O2ZyEIRAUsnXM58WTZya22r/
         oMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724881200; x=1725486000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeNJBfO0ja/8g6kzTOhNFElQs2waKVPJgdUV/DsW4nc=;
        b=KgwAXjoSuEoTwM6EvysaBdRhcmO4tFPzSPNVcgHFzy70kC7ynOFplbzKeBFfpG3gO2
         KSmwSDY9dlDXMkEfu42EsQ1LmTCzHVcUOBvwUnMKW/7g68ueZisr3R5jXsO3hbzif9qa
         4b9VZ/AubZibsnUB7ibAq+g5mEVrO0VSd5d5s/XYysnMGbXBTqaFHl+01NJSdqsG8E8z
         iH2Kz0kwZNXX6QAGeN2dNzi1l8lZFq/gCf7aWnBCAnyHJnDIsZH4kMm+Vo6khqh88y53
         MS6fZ4pqvreGeyoynCwH//TxW+U8uUErFTJSwoZ2DT4GYCNMkwaMG8vS72W6hc7jARdS
         +2Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWwblvffH0gysVLyI4pNlfOEVIWk34koxLmHEHD2J4XF30+rwucsT+t5jDmr9NFYU7lIjZZEHDelGdMnw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa/aK/nXt5HJ/IOzEspwwrjO0YJe3YT6NLY7BDsXC3CdFu/K2I
	KMFUD77vw4uSjmc0A+OrbRpfyzBX2N8i9H9HRbI/736xdBcCPWhV6aHK3BE5oIA=
X-Google-Smtp-Source: AGHT+IFaC7yLAKucAQ+jfC2ojeS1SzrNuL0Qf0TeCvZ+3dsJBG9fozmVtsZvCPOeq6REFPvrFRD1LQ==
X-Received: by 2002:a05:6a00:2e87:b0:714:2ba6:e5c9 with SMTP id d2e1a72fcca58-715dfaf1fddmr1045535b3a.7.1724881200137;
        Wed, 28 Aug 2024 14:40:00 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac98286sm9939173a12.5.2024.08.28.14.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 14:39:59 -0700 (PDT)
Date: Wed, 28 Aug 2024 14:39:55 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Shuah Khan <shuah@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 00/16] mm: Introduce MAP_BELOW_HINT
Message-ID: <Zs+ZK6Q2U9dm19yR@ghost>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
 <dbqqojpvqodfxavt4fxugoj3a2ppk5b4b3sp77qsmbg33sc2em@fhjccbxaihrh>
 <Zs+Ppk0ANaUah7p9@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zs+Ppk0ANaUah7p9@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_144002_312747_B0EECF43 
X-CRM114-Status: GOOD (  70.31  )
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

On Wed, Aug 28, 2024 at 01:59:18PM -0700, Charlie Jenkins wrote:
> On Wed, Aug 28, 2024 at 02:31:42PM -0400, Liam R. Howlett wrote:
> > * Charlie Jenkins <charlie@rivosinc.com> [240828 01:49]:
> > > Some applications rely on placing data in free bits addresses allocated
> > > by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> > > address returned by mmap to be less than the maximum address space,
> > > unless the hint address is greater than this value.
> > 
> > Wait, what arch(s) allows for greater than the max?  The passed hint
> > should be where we start searching, but we go to the lower limit then
> > start at the hint and search up (or vice-versa on the directions).
> > 
> 
> I worded this awkwardly. On arm64 there is a page-table boundary at 48
> bits and at 52 bits. On x86 the boundaries are at 48 bits and 57 bits.
> The max value mmap is able to return on arm64 is 48 bits if the hint
> address uses 48 bits or less, even if the architecture supports 5-level
> paging and thus addresses can be 52 bits. Applications can opt-in to
> using up to 52-bits in an address by using a hint address greater than
> 48 bits. x86 has the same behavior but with 57 bits instead of 52.
> 
> This reason this exists is because some applications arbitrarily replace
> bits in virtual addresses with data with an assumption that the address
> will not be using any of the bits above bit 48 in the virtual address.
> As hardware with larger address spaces was released, x86 decided to
> build safety guards into the kernel to allow the applications that made
> these assumptions to continue to work on this different hardware.
> 
> This causes all application that use a hint address to silently be
> restricted to 48-bit addresses. The goal of this flag is to have a way
> for applications to explicitly request how many bits they want mmap to
> use.
> 
> > I don't understand how unmapping works on a higher address; we would
> > fail to free it on termination of the application.
> > 
> > Also, there are archs that map outside of the VMAs, which are freed by
> > freeing from the prev->vm_end to next->vm_start, so I don't understand
> > what that looks like in this reality as well.
> > 
> > > 
> > > On arm64 this barrier is at 52 bits and on x86 it is at 56 bits. This
> > > flag allows applications a way to specify exactly how many bits they
> > > want to be left unused by mmap. This eliminates the need for
> > > applications to know the page table hierarchy of the system to be able
> > > to reason which addresses mmap will be allowed to return.
> > 
> > But, why do they need to know today?  We have a limit for this don't we?
> 
> The limit is different for different architectures. On x86 the limit is
> 57 bits, and on arm64 it is 52 bits. So in the theoretical case that an
> application requires 10 bits free in a virtual address, the application
> would always work on arm64 regardless of the hint address, but on x86 if
> the hint address is greater than 48 bits then the application will not
> work.
> 
> The goal of this flag is to have consistent and tunable behavior of
> mmap() when it is desired to ensure that mmap() only returns addresses
> that use some number of bits.
> 
> > 
> > Also, these upper limits are how some archs use the upper bits that you
> > are trying to use.
> > 
> 
> It does not eliminate the existing behavior of the architectures to
> place this upper limits, it instead provides a way to have consistent
> behavior across all architectures.
> 
> > > 
> > > ---
> > > riscv made this feature of mmap returning addresses less than the hint
> > > address the default behavior. This was in contrast to the implementation
> > > of x86/arm64 that have a single boundary at the 5-level page table
> > > region. However this restriction proved too great -- the reduced
> > > address space when using a hint address was too small.
> > 
> > Yes, the hint is used to group things close together so it would
> > literally be random chance on if you have enough room or not (aslr and
> > all).
> > 
> > > 
> > > A patch for riscv [1] reverts the behavior that broke userspace. This
> > > series serves to make this feature available to all architectures.
> > 
> > I don't fully understand this statement, you say it broke userspace so
> > now you are porting it to everyone?  This reads as if you are braking
> > the userspace on all architectures :)
> 
> It was the default for mmap on riscv. The difference here is that it is now
> enabled by a flag instead. Instead of making the flag specific to riscv,
> I figured that other architectures might find it useful as well.
> 
> > 
> > If you fail to find room below, then your application fails as there is
> > no way to get the upper bits you need.  It would be better to fix this
> > in userspace - if your application is returned too high an address, then
> > free it and exit because it's going to fail anyways.
> > 
> 
> This flag is trying to define an API that is more robust than the
> current behavior on that x86 and arm64 which implicitly restricts mmap()
> addresses to 48 bits. A solution could be to just write in the docs that
> mmap() will always exhaust all addresses below the hint address before
> returning an address that is above the hint address. However a flag that
> defines this behavior seems more intuitive.
> 
> > > 
> > > I have only tested on riscv and x86.
> > 
> > This should be an RFC then.
> 
> Fair enough.
> 
> > 
> > > There is a tremendous amount of
> > > duplicated code in mmap so the implementations across architectures I
> > > believe should be mostly consistent. I added this feature to all
> > > architectures that implement either
> > > arch_get_mmap_end()/arch_get_mmap_base() or
> > > arch_get_unmapped_area_topdown()/arch_get_unmapped_area(). I also added
> > > it to the default behavior for arch_get_mmap_end()/arch_get_mmap_base().
> > 
> > Way too much duplicate code.  We should be figuring out how to make this
> > all work with the same code.
> > 
> > This is going to make the cloned code problem worse.
> 
> That would require standardizing every architecture with the generic
> mmap() framework that arm64 has developed. That is far outside the scope
> of this patch, but would be a great area to research for each of the
> architectures that do not use the generic framework.

Thinking about this again, I could drop support for all architectures
that do not implement arch_get_mmap_base()/arch_get_mmap_end().

> 
> - Charlie
> 
> > 
> > > 
> > > Link: https://lore.kernel.org/lkml/20240826-riscv_mmap-v1-2-cd8962afe47f@rivosinc.com/T/ [1]
> > > 
> > > To: Arnd Bergmann <arnd@arndb.de>
> > > To: Paul Walmsley <paul.walmsley@sifive.com>
> > > To: Palmer Dabbelt <palmer@dabbelt.com>
> > > To: Albert Ou <aou@eecs.berkeley.edu>
> > > To: Catalin Marinas <catalin.marinas@arm.com>
> > > To: Will Deacon <will@kernel.org>
> > > To: Michael Ellerman <mpe@ellerman.id.au>
> > > To: Nicholas Piggin <npiggin@gmail.com>
> > > To: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > To: Naveen N Rao <naveen@kernel.org>
> > > To: Muchun Song <muchun.song@linux.dev>
> > > To: Andrew Morton <akpm@linux-foundation.org>
> > > To: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > To: Vlastimil Babka <vbabka@suse.cz>
> > > To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > To: Thomas Gleixner <tglx@linutronix.de>
> > > To: Ingo Molnar <mingo@redhat.com>
> > > To: Borislav Petkov <bp@alien8.de>
> > > To: Dave Hansen <dave.hansen@linux.intel.com>
> > > To: x86@kernel.org
> > > To: H. Peter Anvin <hpa@zytor.com>
> > > To: Huacai Chen <chenhuacai@kernel.org>
> > > To: WANG Xuerui <kernel@xen0n.name>
> > > To: Russell King <linux@armlinux.org.uk>
> > > To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > To: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
> > > To: Helge Deller <deller@gmx.de>
> > > To: Alexander Gordeev <agordeev@linux.ibm.com>
> > > To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> > > To: Heiko Carstens <hca@linux.ibm.com>
> > > To: Vasily Gorbik <gor@linux.ibm.com>
> > > To: Christian Borntraeger <borntraeger@linux.ibm.com>
> > > To: Sven Schnelle <svens@linux.ibm.com>
> > > To: Yoshinori Sato <ysato@users.sourceforge.jp>
> > > To: Rich Felker <dalias@libc.org>
> > > To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> > > To: David S. Miller <davem@davemloft.net>
> > > To: Andreas Larsson <andreas@gaisler.com>
> > > To: Shuah Khan <shuah@kernel.org>
> > > To: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > Cc: linux-arch@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: Palmer Dabbelt <palmer@rivosinc.com>
> > > Cc: linux-riscv@lists.infradead.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Cc: linux-mm@kvack.org
> > > Cc: loongarch@lists.linux.dev
> > > Cc: linux-mips@vger.kernel.org
> > > Cc: linux-parisc@vger.kernel.org
> > > Cc: linux-s390@vger.kernel.org
> > > Cc: linux-sh@vger.kernel.org
> > > Cc: sparclinux@vger.kernel.org
> > > Cc: linux-kselftest@vger.kernel.org
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > 
> > > ---
> > > Charlie Jenkins (16):
> > >       mm: Add MAP_BELOW_HINT
> > >       riscv: mm: Do not restrict mmap address based on hint
> > >       mm: Add flag and len param to arch_get_mmap_base()
> > >       mm: Add generic MAP_BELOW_HINT
> > >       riscv: mm: Support MAP_BELOW_HINT
> > >       arm64: mm: Support MAP_BELOW_HINT
> > >       powerpc: mm: Support MAP_BELOW_HINT
> > >       x86: mm: Support MAP_BELOW_HINT
> > >       loongarch: mm: Support MAP_BELOW_HINT
> > >       arm: mm: Support MAP_BELOW_HINT
> > >       mips: mm: Support MAP_BELOW_HINT
> > >       parisc: mm: Support MAP_BELOW_HINT
> > >       s390: mm: Support MAP_BELOW_HINT
> > >       sh: mm: Support MAP_BELOW_HINT
> > >       sparc: mm: Support MAP_BELOW_HINT
> > >       selftests/mm: Create MAP_BELOW_HINT test
> > > 
> > >  arch/arm/mm/mmap.c                           | 10 ++++++++
> > >  arch/arm64/include/asm/processor.h           | 34 ++++++++++++++++++++++----
> > >  arch/loongarch/mm/mmap.c                     | 11 +++++++++
> > >  arch/mips/mm/mmap.c                          |  9 +++++++
> > >  arch/parisc/include/uapi/asm/mman.h          |  1 +
> > >  arch/parisc/kernel/sys_parisc.c              |  9 +++++++
> > >  arch/powerpc/include/asm/task_size_64.h      | 36 +++++++++++++++++++++++-----
> > >  arch/riscv/include/asm/processor.h           | 32 -------------------------
> > >  arch/s390/mm/mmap.c                          | 10 ++++++++
> > >  arch/sh/mm/mmap.c                            | 10 ++++++++
> > >  arch/sparc/kernel/sys_sparc_64.c             |  8 +++++++
> > >  arch/x86/kernel/sys_x86_64.c                 | 25 ++++++++++++++++---
> > >  fs/hugetlbfs/inode.c                         |  2 +-
> > >  include/linux/sched/mm.h                     | 34 ++++++++++++++++++++++++--
> > >  include/uapi/asm-generic/mman-common.h       |  1 +
> > >  mm/mmap.c                                    |  2 +-
> > >  tools/arch/parisc/include/uapi/asm/mman.h    |  1 +
> > >  tools/include/uapi/asm-generic/mman-common.h |  1 +
> > >  tools/testing/selftests/mm/Makefile          |  1 +
> > >  tools/testing/selftests/mm/map_below_hint.c  | 29 ++++++++++++++++++++++
> > >  20 files changed, 216 insertions(+), 50 deletions(-)
> > > ---
> > > base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
> > > change-id: 20240827-patches-below_hint_mmap-b13d79ae1c55
> > > -- 
> > > - Charlie
> > > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
