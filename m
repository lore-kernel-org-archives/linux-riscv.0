Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA66C43381
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 14:32:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B2B664DDC
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 14:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B2B664DDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TVo+/CC1ko0d2GPPUinWNscLf32fDPwIMwzIfO5RDSs=; b=qk7hi4xZyr7G1pSrboOOXMW1P
	ud8rP/YTwKJFtNKAaXuj0kTMD32SUoXqYvxDVW8IHDUE4Ojh3nmnuWdAj0U/eOiWM5SVsAAvZokW5
	oo1g3DHCW5v0li8JlzIUKeppGvCmATsQ6hJDgxwBvXiyyFiIfVriWTqiTd/JTZ/tNwOfUiA6txrMw
	FTt2+L5n+AfsEBWPjyPUYubHILc+B9MRFg1ieC83EVNFfwSSM0uW5o142jLAwJQYgK++KhPfhsudG
	CHECDsMwLpzz8p0F/GXDYGnMmouv+ibCGbqmGvPQKx/uIy8zPl30E/GuPmBPnJ3X8RlbROEi/nzc/
	FRj+eInmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6wjC-0001WW-Vu; Tue, 02 Feb 2021 14:32:27 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6wj7-0001Ty-U9; Tue, 02 Feb 2021 14:32:22 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1612276338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZY7R/A8eLGtcqtBTwPz4dc8E6975FZbZj6rab/rk/co=;
 b=j08LbR+/N4gscwMe9/vv1y6TbSr6g+uI8Fvmd6aUiZN3eXaYwuKCYZD1LwoDENfRkxwGU0
 412GY/gqoJEVKSXG9cJ4ADonbDGXxcU99oWydp5Rm3Y/nVMao0u9sPUOYRoKgo3QRhPEJy
 MTJSdg+5u8XcNBah4K1e9Bay/Y5Jdaw=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D39BAD78;
 Tue,  2 Feb 2021 14:32:18 +0000 (UTC)
Date: Tue, 2 Feb 2021 15:32:16 +0100
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <YBlicIupOyPF9f3D@dhcp22.suse.cz>
References: <73738cda43236b5ac2714e228af362b67a712f5d.camel@linux.ibm.com>
 <YBPF8ETGBHUzxaZR@dhcp22.suse.cz>
 <6de6b9f9c2d28eecc494e7db6ffbedc262317e11.camel@linux.ibm.com>
 <YBkcyQsky2scjEcP@dhcp22.suse.cz>
 <20210202124857.GN242749@kernel.org>
 <6653288a-dd02-f9de-ef6a-e8d567d71d53@redhat.com>
 <YBlUXdwV93xMIff6@dhcp22.suse.cz>
 <211f0214-1868-a5be-9428-7acfc3b73993@redhat.com>
 <YBlgCl8MQuuII22w@dhcp22.suse.cz>
 <d4fe580a-ef0e-e13f-9ee4-16fb8b6d65dd@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4fe580a-ef0e-e13f-9ee4-16fb8b6d65dd@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_093222_176401_324C00F0 
X-CRM114-Status: GOOD (  17.70  )
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue 02-02-21 15:26:20, David Hildenbrand wrote:
> On 02.02.21 15:22, Michal Hocko wrote:
> > On Tue 02-02-21 15:12:21, David Hildenbrand wrote:
> > [...]
> > > I think secretmem behaves much more like longterm GUP right now
> > > ("unmigratable", "lifetime controlled by user space", "cannot go on
> > > CMA/ZONE_MOVABLE"). I'd either want to reasonably well control/limit it or
> > > make it behave more like mlocked pages.
> > 
> > I thought I have already asked but I must have forgotten. Is there any
> > actual reason why the memory is not movable? Timing attacks?
> 
> I think the reason is simple: no direct map, no copying of memory.

This is an implementation detail though and not something terribly hard
to add on top later on. I was more worried there would be really
fundamental reason why this is not possible. E.g. security implications.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
