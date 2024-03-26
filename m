Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCD4C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 16:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWdoRPVFhXziAjO8P6n933MxBqJaq57kPBH57q9gQSc=; b=xBgmxJ50fuGhtb
	Zy00T7L7zqH0oY+ve1k17sBOYPlv1Alhp62rAo6myMNxogq/LFLAkmZDnQY9IA0fJaxeyDZ7K2srD
	0QIKa27GUoafWFxmeJqUcmB0Ni07UB/jPw4lMvK1tRzjI7n7RgUvdGSgtPtjBqfyiMbstCuQ4sBHK
	EpldvPMUowD0fQMDmb4KdZlr5tBzPMDpEIWye87po6yF+83m8WCZqLX70M2PJ/nE5gNfBy6xwy8GB
	7Rx/VM92fn7HiQY6AHKVoXC23iNKOGw9ucwA055RqOj4sbWnaDTgcdGycUsAXkYqploukOM/Ee/rU
	+oE1aGVuS9tOGcGQ0PXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9Ff-00000005MoX-0H4o;
	Tue, 26 Mar 2024 16:02:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp87w-00000004zjt-0oJm
	for linux-riscv@bombadil.infradead.org;
	Tue, 26 Mar 2024 14:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DAJ/JhQqyI3HCNKdlfe0abeACZojSWtUG0yZq7UPSYc=; b=QX1XAm+leeEO0mo5VajHLOlwow
	PXxtxwFo2bqpNWyhMre+XWCf2xPp7CpJDzhGZ0Tbf/4T6bVNt992BD2UxBZbZKzoujHpm7q0zWRD6
	GbgzPgjDau00jywr01s+mBx0C7JKLVFzUBpc1ySbkBrDi36qxu8dOnKd4n+5P54wrKxNkr9ojEozH
	NqnLzCJw0tVnZlhTkbxAWlH1Cj9Gtz+MmUoBcoh/j4ZdUABpB/793BV+UMQH9L8ljI/VkF2MGkqMc
	f3NJHs5LqrFlCWmi7WchDrNEWlVVbo66UTT1liw3SXECfEKlrHYYJ6Dk6lNudpvF8iW1YkW+K7b6R
	ooxUyxIQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp87s-0000000HFBN-3E24
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 14:50:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BBA1339;
	Tue, 26 Mar 2024 07:50:36 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.35.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C25E3F694;
	Tue, 26 Mar 2024 07:50:00 -0700 (PDT)
Date: Tue, 26 Mar 2024 14:49:57 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: David Laight <David.Laight@aculab.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, Alexandre Ghiti <alex@ghiti.fr>,
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
Message-ID: <ZgLglSl94dnWIoqX@FVFF77S0Q05N.cambridge.arm.com>
References: <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
 <88de4a1a-047e-4be9-b5b0-3e53434dc022@sifive.com>
 <b5624bba-9917-421b-8ef0-4515d442f80b@ghiti.fr>
 <f786e02245424e02b38f55ae6b29d14a@AcuMS.aculab.com>
 <d323eb10-c79b-49cb-94db-9b135e6fd280@ghiti.fr>
 <ZgGosOiW6mTeSnTL@FVFF77S0Q05N>
 <eeccbc9f-7544-42c9-964f-2b4c924c2b2f@app.fastmail.com>
 <ZgHCpgHh1ypSyrtv@FVFF77S0Q05N>
 <95eb125d-dd54-42f1-b080-938faca6a8a1@app.fastmail.com>
 <882fc86da89f4adb81570cde3a653e6f@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <882fc86da89f4adb81570cde3a653e6f@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_145009_059768_F29CFAB8 
X-CRM114-Status: GOOD (  17.44  )
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

On Tue, Mar 26, 2024 at 10:19:28AM +0000, David Laight wrote:
> From: Arnd Bergmann
> > Sent: 25 March 2024 20:38
> > 
> > On Mon, Mar 25, 2024, at 19:30, Mark Rutland wrote:
> > > On Mon, Mar 25, 2024 at 07:02:13PM +0100, Arnd Bergmann wrote:
> > >> On Mon, Mar 25, 2024, at 17:39, Mark Rutland wrote:
> > >
> > >> If an architecture ignores all the top bits of a virtual address,
> > >> the largest TASK_SIZE would be higher than the smallest (positive,
> > >> unsigned) PAGE_OFFSET, so you need TASK_SIZE_MAX to be dynamic.
> > >
> > > Agreed, but do we even support such architectures within Linux?
> > 
> > Apparently not.
> > 
> > On 32-bit architectures, you often have TASK_SIZE==PAGE_OFFSET,
> > but not on 64-bit -- either the top few bits in PAGE_OFFSET are
> > always ones, or the user and kernel page tables are completely
> > separate.
> 
> ISTR that arm64 uses (something like) bit 56 to select kernel
> with the annoying 'feature' that the high bits can be ignored
> just to complicate things.

Yes, bit 55.

We choose our TASK_SIZE_MAX to be below 2^55, so no kernel address will pass
access_ok(), and we pre-mangle the TBI bits for userspace so they can't affect
the check and fail unexpectedly.

So it doesn't actually matter -- leave that aspect to arch code.

Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
