Return-Path: <SRS0=216k=BM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3AEC433E0
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2020 13:14:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BB2D20738
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2020 13:14:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jyGw1CXA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="ZE71Wycl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BB2D20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8NrjX0RaIxcfXJ1ohs0owAj0+LTwRPMMMPvxom/dwZE=; b=jyGw1CXAr2825/gEYC34eRrAr
	bAMuTUntBc9PiHMpJK7jundj/Ulttd4KpmWNm+M4o6be5rGeSE/I6Ys804yfqlrDoLqb1K5+xsWfH
	TaGeurKZtfyukICmu2Ao1i4WcKysHcVal+i7wLKp4UsHMHm+hJ0VoJPkFuC441n5AjIYCCJHVl84f
	nAP0iLKYVhHjaVPGJos75XLdbC7emz2nTZJgFgbqt/gskCy6n6AoCh7s042Y5rrGAG1Rtvh61seSj
	vOZGeZGpa91jq7mc3qoEW6he6C30Kb5RMhnR0ymgefXQQs7IjMDpMDhzQkZgHE22ZJp1wEzTKgq1e
	VjgvPU36Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Doz-0003Vb-Ad; Sun, 02 Aug 2020 13:14:37 +0000
Received: from ozlabs.org ([2401:3900:2:1::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Dou-0003TM-LE; Sun, 02 Aug 2020 13:14:33 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKM0z2dLrz9sSG;
 Sun,  2 Aug 2020 23:14:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596374059;
 bh=l8Vv313rJGqlK2PcaNCVrGcU8SJlDczW2rNrY770DTs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZE71Wyclmt4MQrTZPs6iY6nA2eek+wB/iYUyHxx7nWlyJbBID58C0vJfORjrDD43E
 wNND8mtfpDbimWptgmYv4VddxYAmX0rHolg1XVT+G8s2w1bA+8uHwFHNUayBhafmGn
 U3RDd9O7hEfPsfEFxg1WUJgbZZ35QUi0zip6yzBRdj0KvzX0aIma+XejtIevU686ru
 HM91WecXmsJTqK1azOcV4OJmJvhTYVRaSfqOgAvj1ip20Yb1FPEAys0j9IKpP3z8BI
 XGg3VJKFsWHrW1MkBYjbjQi72gF9zJZpWvDX1DLzzpzZpzoVYn1bqH1kWqIhbU7xhV
 gtswbHEE4eTGQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 06/15] powerpc: fadamp: simplify
 fadump_reserve_crash_area()
In-Reply-To: <20200801101854.GD534153@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-7-rppt@kernel.org> <87d04d5hda.fsf@mpe.ellerman.id.au>
 <20200801101854.GD534153@kernel.org>
Date: Sun, 02 Aug 2020 23:14:10 +1000
Message-ID: <87o8nt197h.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_091433_088951_EC2EAD37 
X-CRM114-Status: GOOD (  20.01  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Hari Bathini <hbathini@in.ibm.com>,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Stafford Horne <shorne@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Mike Rapoport <rppt@kernel.org> writes:
> On Thu, Jul 30, 2020 at 10:15:13PM +1000, Michael Ellerman wrote:
>> Mike Rapoport <rppt@kernel.org> writes:
>> > From: Mike Rapoport <rppt@linux.ibm.com>
>> >
>> > fadump_reserve_crash_area() reserves memory from a specified base address
>> > till the end of the RAM.
>> >
>> > Replace iteration through the memblock.memory with a single call to
>> > memblock_reserve() with appropriate  that will take care of proper memory
>>                                      ^
>>                                      parameters?
>> > reservation.
>> >
>> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>> > ---
>> >  arch/powerpc/kernel/fadump.c | 20 +-------------------
>> >  1 file changed, 1 insertion(+), 19 deletions(-)
>> 
>> I think this looks OK to me, but I don't have a setup to test it easily.
>> I've added Hari to Cc who might be able to.
>> 
>> But I'll give you an ack in the hope that it works :)
>
> Actually, I did some digging in the git log and the traversal was added
> there on purpose by the commit b71a693d3db3 ("powerpc/fadump: exclude
> memory holes while reserving memory in second kernel")
> Presuming this is still reqruired I'm going to drop this patch and will
> simply replace for_each_memblock() with for_each_mem_range() in v2.

Thanks.

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
