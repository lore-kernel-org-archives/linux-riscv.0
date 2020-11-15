Return-Path: <SRS0=pUzR=EV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F592C2D0E4
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2020 08:46:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF26C2242E
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2020 08:46:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="08S9wY0j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvUrkC8D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF26C2242E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fskdr2pGhBO4YndhV64Bl+bjohnqEeQbg82Meld+XKI=; b=08S9wY0jqJxwO2D2+HRrv5I6f
	F4H9GKth2IPGmhlrQmwMu6PxKexvwcaFibs5eRiNOF8pkLjcOhuRSMWCy04Oo+seJ+meIsCqQrROH
	dpXn7wbb6CUdPxKHdwRKvfPnbGUdpjs3Rw4Ty6WtlVfKdSWnryI1P2U+exOCVaQ6blC93DkQpEWpg
	ljPU2FH3+ciwbGntpgklQNWig435qfvQvzJ3YijySP5GpqdZ0Suv8pC6fj53bA8Rwj5sO3OgVvPwQ
	4XW5AbukQJDaYcybbo4MWGjQBeqjFjn4tL+uvdFLe5AoMGHojnBNdCxlMVdISEjuUroXw/vmq1ZI6
	D1JgCppqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keDfe-00019Y-EY; Sun, 15 Nov 2020 08:46:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keDfY-00017v-1Y; Sun, 15 Nov 2020 08:45:57 +0000
Received: from kernel.org (unknown [77.125.7.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC352223FB;
 Sun, 15 Nov 2020 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605429954;
 bh=I2e6oiG56Ipc+LYVEf48Tzpdu9e5X2SPeAjMkXGJ+FY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mvUrkC8DbWSBeGtX5LmBQbQw3erYKhs5cOaKJid6GDJMPM7nXXubIxoNcBB3oGNe7
 rCwIs49LamtntTc1amgIjfXRya2sb8UfoqlV6jooN7E3J+NN/S80wRZL4M8ZXWanKD
 tXrCqT3L+M5TGE/FDZPfoLrZTF0AQQmH6gi3Hxpk=
Date: Sun, 15 Nov 2020 10:45:39 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v8 4/9] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20201115084539.GU4758@kernel.org>
References: <20201110151444.20662-1-rppt@kernel.org>
 <20201110151444.20662-5-rppt@kernel.org>
 <20201113140656.GG17076@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113140656.GG17076@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_034556_224767_7D615350 
X-CRM114-Status: GOOD (  17.75  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-riscv@lists.infradead.org,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 13, 2020 at 02:06:56PM +0000, Matthew Wilcox wrote:
> On Tue, Nov 10, 2020 at 05:14:39PM +0200, Mike Rapoport wrote:
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index c89c5444924b..d8d170fa5210 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -884,4 +884,7 @@ config ARCH_HAS_HUGEPD
> >  config MAPPING_DIRTY_HELPERS
> >          bool
> >  
> > +config SECRETMEM
> > +	def_bool ARCH_HAS_SET_DIRECT_MAP && !EMBEDDED
> 
> So I now have to build this in, whether I want it or not?

Why wouldn't anybody want this nice feature? ;-)

Now, seriously, I hesitated a lot about having a prompt here, but in the
end I've decided to go without it.

The added footprint is not so big, with x86 defconfig it's less than 8K
and with distro (I've checked with Fedora) config the difference is less
than 1k because they anyway have CMA=y.

As this is "security" feature, disros most probably would have this
enabled anyway, and I believe users that will see something like "Allow
hiding memory from the kernel" will hit Y there.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
