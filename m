Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59349C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 12:09:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3FF464F7E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 12:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3FF464F7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DnhPLNCn/AaxBjvC7KizZFZxd5RGG5SRJsC0+TWetgI=; b=oXeZuC/CssPxuW1LjmWvJQZtE
	uf2453C+NtoYLyaR1S5Q2iDeUIvdaqYMDbowPC+c/a2Ry0kV7ET5AvAJnfCHQ1P/HmZ8d14CySlhE
	OtIAPcmkr7OU2ygvG/sJlcs1nia1UKcdwUhqwhxfVazVmZX46y3lV2WdR1zw1hSbZgyAXWPmwpsr4
	KTOX08cmVnQgJ5YFfQg1rdggPHGBcw5lFoq4fgpEqR/G/v8Hg/1SVH/6csJEbWWrZNPehTj4mP1xP
	DZSqf5h3NcA5O46KnWNJl+RpXeS3R2ztJSPmrU2wFzkVjMtbXgQW3KoOhImFkNZGpXUlrv/M7ssnZ
	hATyWvz5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7GyZ-00082V-FI; Wed, 03 Feb 2021 12:09:39 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7GyT-00080X-QP; Wed, 03 Feb 2021 12:09:35 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1612354172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gKqIUoUlL8R76kxwkZS//+2tVOQRZKxuwAdDoVgDGVc=;
 b=mxvYYdsWkKnOLbAAY2Xq93W86QtxGZG9WZBc2Cc9sS5vqXt3wUWDhs4DwbnmfVD6tvAGG0
 lS5OJmRviEMD44E4iBuZm462q2JlcFLn8YYCSpZ5+zJQC2fMRyJYklkp59wywSxIFouSEb
 IneXY25y0nuwemPLYik6lohSpv88DtM=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB6EEAD26;
 Wed,  3 Feb 2021 12:09:31 +0000 (UTC)
Date: Wed, 3 Feb 2021 13:09:30 +0100
From: Michal Hocko <mhocko@suse.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <YBqSejZ3XbUKFudR@dhcp22.suse.cz>
References: <20210202124857.GN242749@kernel.org>
 <6653288a-dd02-f9de-ef6a-e8d567d71d53@redhat.com>
 <YBlUXdwV93xMIff6@dhcp22.suse.cz>
 <211f0214-1868-a5be-9428-7acfc3b73993@redhat.com>
 <YBlgCl8MQuuII22w@dhcp22.suse.cz>
 <d4fe580a-ef0e-e13f-9ee4-16fb8b6d65dd@redhat.com>
 <YBlicIupOyPF9f3D@dhcp22.suse.cz>
 <95625b83-f7e2-b27a-2b99-d231338047fb@redhat.com>
 <20210202181546.GO242749@kernel.org>
 <f26a17366194880d58e67d10cb5d7d7fdf2f3c19.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f26a17366194880d58e67d10cb5d7d7fdf2f3c19.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_070934_106204_D7C6BD85 
X-CRM114-Status: GOOD (  33.45  )
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
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Hagen Paul Pfeifer <hagen@jauu.net>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
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

On Tue 02-02-21 10:55:40, James Bottomley wrote:
> On Tue, 2021-02-02 at 20:15 +0200, Mike Rapoport wrote:
> > On Tue, Feb 02, 2021 at 03:34:29PM +0100, David Hildenbrand wrote:
> > > On 02.02.21 15:32, Michal Hocko wrote:
> > > > On Tue 02-02-21 15:26:20, David Hildenbrand wrote:
> > > > > On 02.02.21 15:22, Michal Hocko wrote:
> > > > > > On Tue 02-02-21 15:12:21, David Hildenbrand wrote:
> > > > > > [...]
> > > > > > > I think secretmem behaves much more like longterm GUP right
> > > > > > > now
> > > > > > > ("unmigratable", "lifetime controlled by user space",
> > > > > > > "cannot go on
> > > > > > > CMA/ZONE_MOVABLE"). I'd either want to reasonably well
> > > > > > > control/limit it or
> > > > > > > make it behave more like mlocked pages.
> > > > > > 
> > > > > > I thought I have already asked but I must have forgotten. Is
> > > > > > there any
> > > > > > actual reason why the memory is not movable? Timing attacks?
> > > > > 
> > > > > I think the reason is simple: no direct map, no copying of
> > > > > memory.
> > > > 
> > > > This is an implementation detail though and not something
> > > > terribly hard
> > > > to add on top later on. I was more worried there would be really
> > > > fundamental reason why this is not possible. E.g. security
> > > > implications.
> > > 
> > > I don't remember all the details. Let's see what Mike thinks
> > > regarding
> > > migration (e.g., security concerns).
> > 
> > Thanks for considering me a security expert :-)
> > 
> > Yet, I cannot estimate how dangerous is the temporal exposure of
> > this data to the kernel via the direct map in the simple
> > map/copy/unmap
> > sequence.
> 
> Well the safest security statement is that we never expose the data to
> the kernel because it's a very clean security statement and easy to
> enforce. It's also the easiest threat model to analyse.   Once we do
> start exposing the secret to the kernel it alters the threat profile
> and the analysis and obviously potentially provides the ROP gadget to
> an attacker to do the same. Instinct tells me that the loss of
> security doesn't really make up for the ability to swap or migrate but
> if there were a case for doing the latter, it would have to be a
> security policy of the user (i.e. a user should be able to decide their
> data is too sensitive to expose to the kernel).

The security/threat model should be documented in the changelog as
well. I am not a security expert but I would tend to agree that not
allowing even temporal mapping for data copying (in the kernel) is the
most robust approach. Whether that is generally necessary for users I do
not know.

From the API POV I think it makes sense to have two
modes. NEVER_MAP_IN_KERNEL which would imply no migrateability, no
copy_{from,to}_user, no gup or any other way for the kernel to access
content of the memory. Maybe even zero the content on the last unmap to
never allow any data leak. ALLOW_TEMPORARY would unmap the page from
the direct mapping but it would still allow temporary mappings for
data copying inside the kernel (thus allow CoW, copy*user, migration).
Which one should be default and which an opt-in I do not know. A less
restrictive mode to be default and the more restrictive an opt-in via
flags makes a lot of sense to me though.

-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
