Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA88C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2nE/hvvm0/fRJN/r/ZbylM0Gu8F80FtZqxzf+Jvtrw=; b=4GKMX6ePu7BSMb
	2/V79fLfGf6Qol2cchCAOEntU+aYUkYtyaV7rRWEVrjn5if0d5ywYJk4hJzGCeUHLziEMOc+le5ir
	Kc6hKYRLn/n77Pj3PaAsU2y+B5DVMWytPQnPh7iBg2Gxnl4Dga29PImFJbi23NVO4WJ+iBS1iugVz
	WLd4BWBEkJe/jnAbZKsd1GcG6FWvr7pw6oygstZScNBWNfaTEpUHFiitXAfTnn3Ub3mHYpquGeQAU
	0Ajg1WtcXV4qdeAuBk9612j6d1TY+TcRROiebhjvGjOzENREWO/nJf1R7OnMcrY/CqBXv/okGai6U
	pkMgWmYRuh49xexdRksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronNE-00000000oft-1Fs6;
	Mon, 25 Mar 2024 16:40:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronNA-00000000odg-1XPw
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 16:40:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CABC2F4;
	Mon, 25 Mar 2024 09:41:03 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.16.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECE4F3F64C;
	Mon, 25 Mar 2024 09:40:26 -0700 (PDT)
Date: Mon, 25 Mar 2024 16:39:12 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: David Laight <David.Laight@aculab.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Charlie Jenkins <charlie@rivosinc.com>, Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Yangyu Chen <cyy@cyyself.name>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
Message-ID: <ZgGosOiW6mTeSnTL@FVFF77S0Q05N>
References: <20240313180010.295747-1-samuel.holland@sifive.com>
 <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
 <88de4a1a-047e-4be9-b5b0-3e53434dc022@sifive.com>
 <b5624bba-9917-421b-8ef0-4515d442f80b@ghiti.fr>
 <f786e02245424e02b38f55ae6b29d14a@AcuMS.aculab.com>
 <d323eb10-c79b-49cb-94db-9b135e6fd280@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d323eb10-c79b-49cb-94db-9b135e6fd280@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_094032_486796_B0E2280B 
X-CRM114-Status: GOOD (  24.13  )
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

On Mon, Mar 25, 2024 at 08:30:37AM +0100, Alexandre Ghiti wrote:
> Hi David,
> 
> On 24/03/2024 20:42, David Laight wrote:
> > ...
> > > The use of alternatives allows to return right away if the buffer is
> > > beyond the usable user address space, and it's not just "slightly
> > > faster" for some cases (a very large buffer with only a few bytes being
> > > beyond the limit or someone could fault-in all the user pages and fail
> > > very late...etc). access_ok() is here to guarantee that such situations
> > > don't happen, so actually it makes more sense to use an alternative to
> > > avoid that.
> > Is it really worth doing ANY optimisations for the -EFAULT path?
> > They really don't happen.
> > 
> > The only fault path that matters is the one that has to page in
> > data from somewhere.
> 
> Which is completely avoided with a strict definition of access_ok(). I see
> access_ok() as an already existing optimization of fault paths by avoiding
> them entirely when they are bound to happen.

I think the point that David is making is that address+size pairs that'd fail
access_ok() *should* be rare, and hence it's a better trade-off to occasionally
handle faults for those if it makes the common case of successful access_ok()
smaller or faster. For any well-behaved userspace applications, access_ok()
should practically never fail, since userspace should be passing good
address+size pairs as arguments to syscalls.

Using a compile-time constant TASK_SIZE_MAX allows the compiler to generate
much better code for access_ok(), and on arm64 we use a compile-time constant
even when our page table depth can change at runtime (and when native/compat
task sizes differ). The only abosolute boundary that needs to be maintained is
that access_ok() fails for kernel addresses.

Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
