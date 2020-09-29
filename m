Return-Path: <SRS0=aBv4=DG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED858C4727F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 13:07:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6802B20848
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 13:07:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s2kPlyR+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqCIqM7B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6802B20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cu8NA1szciwyKyJSZiuVVfj5lIhMjiVgTBOgkpkzruA=; b=s2kPlyR+LWlfX4BKatNhNp5xp
	2X0UaFqE1xQ8JDPOT5a3PuN/B21XiNQU89s8Fhd50kKnBTkB3kb/H3MYnQDGa7AHp9u9V8Ywk4kJu
	qT2+V0+osqI9kuxjfTveGqLXM6hTIRR0C6dPhTgbuZd+joHRE0qO0UEVZOKjFjo6192w5afE2GFQW
	TjaDPjDnl07qhcL1f4CEMMCWdWMQdSMbSjP/0D31Ifb037Z0oruavRy6mj5flvGY19O3A3qbHKhRY
	GxxQaOC2JM3UJ1U2egYHfiEYi4Lng95/S7C12AdP25vCZLE8FXqdEUSj13mnReAOfmYkIDS4HEHV7
	EpY4zlT3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNFLg-0003en-PV; Tue, 29 Sep 2020 13:07:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNFLS-0003Xc-R0; Tue, 29 Sep 2020 13:07:04 +0000
Received: from kernel.org (unknown [87.71.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 579B4207F7;
 Tue, 29 Sep 2020 13:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601384821;
 bh=7KLc+w8RZZNLjtjf6HYJ79RwMDeyJUnvfHtVGdo8qiw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GqCIqM7BqT+6pPkJY9utQWj93QJ3bSPfFrqfJHOudSA2n7THcsgAIPdERjDgGYpbv
 3YsHM8vksG2xzKmuaMDxtRxuppf8SFckyt7f4t7JRp6EXb5ekXTVyBUz49dbfKDnNc
 d4WEziQvM+yY9x8NI++tf8P6f980mVqec1FHevs4=
Date: Tue, 29 Sep 2020 16:06:41 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 5/6] mm: secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20200929130641.GG2142832@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20200924132904.1391-6-rppt@kernel.org>
 <20200925074125.GQ2628@hirez.programming.kicks-ass.net>
 <8435eff6-7fa9-d923-45e5-d8850e4c6d73@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8435eff6-7fa9-d923-45e5-d8850e4c6d73@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_090703_058423_A36C8364 
X-CRM114-Status: GOOD (  23.85  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Shuah Khan <shuah@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 25, 2020 at 11:00:30AM +0200, David Hildenbrand wrote:
> On 25.09.20 09:41, Peter Zijlstra wrote:
> > On Thu, Sep 24, 2020 at 04:29:03PM +0300, Mike Rapoport wrote:
> >> From: Mike Rapoport <rppt@linux.ibm.com>
> >>
> >> Removing a PAGE_SIZE page from the direct map every time such page is
> >> allocated for a secret memory mapping will cause severe fragmentation of
> >> the direct map. This fragmentation can be reduced by using PMD-size pages
> >> as a pool for small pages for secret memory mappings.
> >>
> >> Add a gen_pool per secretmem inode and lazily populate this pool with
> >> PMD-size pages.
> > 
> > What's the actual efficacy of this? Since the pmd is per inode, all I
> > need is a lot of inodes and we're in business to destroy the directmap,
> > no?
> > 
> > Afaict there's no privs needed to use this, all a process needs is to
> > stay below the mlock limit, so a 'fork-bomb' that maps a single secret
> > page will utterly destroy the direct map.
> > 
> > I really don't like this, at all.
> 
> As I expressed earlier, I would prefer allowing allocation of secretmem
> only from a previously defined CMA area. This would physically locally
> limit the pain.

The prevois version contained a patch that allowed reserving a memory
pool for the secretmem at boot time to avpoid splitting pages from the
direct map

> But my suggestion was not well received :)

The disagreemet was only whether to use CMA or simple boot time
reservation :-P

> -- 
> Thanks,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
