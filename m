Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18074C433E6
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:16:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDBA9601FB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDBA9601FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6JmPPol1jFmDucFyRQoJnZm8ayC8T10vFlLQY31wmtg=; b=fwbXbWsRH0eNeNK6RIm7XJRUn
	IqMh8+AViKpAgqTka1E+eoNVMl0F20WIci5F6BEqxrC/q0oHjwAoHcYAP2NKFhrctWc4p7BKX3uX7
	MK0Gi967ddGh64/waNXp4td+m4uAh+2el5+fXju8WP4SCHlweIvO6vFh2pB407nToAc3ru3y3Llud
	4iT47NSoxIeDMBZh3FYn/u8DglcjkQDAyHCoCZ9AslHJCuq+b0yx9UTRGAlOBLNpbc46y4EVuEf84
	aKRcYdb+2S0BMuawEPiNbQRvHXh6INOUcmJfCeIB8TVd05SDujwmR5nkpVBTheQhigIOm9wssIFXq
	tcokyFfeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l70Dp-00049n-5g; Tue, 02 Feb 2021 18:16:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l70Dk-000487-IZ; Tue, 02 Feb 2021 18:16:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9084864F92;
 Tue,  2 Feb 2021 18:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612289771;
 bh=jExAi6+S0KhwmLELocI6wMJuzz/tLWY8R7yvg8v3kSM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EDgDXp2MRosyELVG93hsa2FWpra6U+O1s/wok5z4I/qOXv7rdUmjG2axPtMIvq+YN
 yBgA8wcWgNGCYn0pW2zVsZsv3wcPZETui3XjKumHzFywKHgYsDnq+d0PEjUY80BQCe
 IzesvjbDuB+UAqmSCfbvnjKvS7w0UCcntNSHwnveAp/98Y5aklQbVLZ5aIeTMaBtIb
 Y2S9E4/e0RHCm573D5HvZcykwBcZPsiKWKBYdn9Gm25wRz155OpIc0oI5MY1vEx2Z5
 y6k9c5Z7N9NTPpMQGOvaiK4lasHyvoskCgCDKMvmuqHqWSSfiiKO+c0UX4uuveVSEz
 Bmm6b/PXs32Ig==
Date: Tue, 2 Feb 2021 20:15:46 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20210202181546.GO242749@kernel.org>
References: <6de6b9f9c2d28eecc494e7db6ffbedc262317e11.camel@linux.ibm.com>
 <YBkcyQsky2scjEcP@dhcp22.suse.cz>
 <20210202124857.GN242749@kernel.org>
 <6653288a-dd02-f9de-ef6a-e8d567d71d53@redhat.com>
 <YBlUXdwV93xMIff6@dhcp22.suse.cz>
 <211f0214-1868-a5be-9428-7acfc3b73993@redhat.com>
 <YBlgCl8MQuuII22w@dhcp22.suse.cz>
 <d4fe580a-ef0e-e13f-9ee4-16fb8b6d65dd@redhat.com>
 <YBlicIupOyPF9f3D@dhcp22.suse.cz>
 <95625b83-f7e2-b27a-2b99-d231338047fb@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95625b83-f7e2-b27a-2b99-d231338047fb@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_131612_735393_C921A122 
X-CRM114-Status: GOOD (  21.70  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 02, 2021 at 03:34:29PM +0100, David Hildenbrand wrote:
> On 02.02.21 15:32, Michal Hocko wrote:
> > On Tue 02-02-21 15:26:20, David Hildenbrand wrote:
> > > On 02.02.21 15:22, Michal Hocko wrote:
> > > > On Tue 02-02-21 15:12:21, David Hildenbrand wrote:
> > > > [...]
> > > > > I think secretmem behaves much more like longterm GUP right now
> > > > > ("unmigratable", "lifetime controlled by user space", "cannot go on
> > > > > CMA/ZONE_MOVABLE"). I'd either want to reasonably well control/limit it or
> > > > > make it behave more like mlocked pages.
> > > > 
> > > > I thought I have already asked but I must have forgotten. Is there any
> > > > actual reason why the memory is not movable? Timing attacks?
> > > 
> > > I think the reason is simple: no direct map, no copying of memory.
> > 
> > This is an implementation detail though and not something terribly hard
> > to add on top later on. I was more worried there would be really
> > fundamental reason why this is not possible. E.g. security implications.
> 
> I don't remember all the details. Let's see what Mike thinks regarding
> migration (e.g., security concerns).

Thanks for considering me a security expert :-)

Yet, I cannot estimate how dangerous is the temporal exposure of
this data to the kernel via the direct map in the simple map/copy/unmap
sequence.

More secure way would be to map source and destination in a different page table
rather than in the direct map, similarly to the way text_poke() on x86
does.

I've left the migration callback empty for now because it can be added on
top and its implementation would depend on the way we do (or do not do)
pooling.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
