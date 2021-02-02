Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A674C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 09:35:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7C6164F09
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 09:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7C6164F09
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9BzyiX46b1BlFbOph5jYI8dUMXCLe5gO1VtN74Nna9M=; b=T1iY699OQ1kmlaQSUmizCpD9A
	eYEBeoFgLM17nN0UAF1Is6IoLjrDSZYaiV57+VLEYUZf16/A+rtEp/7OKarJUxhaxWu7Yc75vKeuo
	p+GMzbEAhLU65P4NE5Rjz0TCXZkHJxIwVFY0OoQz4vSJn9RdKuvK7lpenrDNoWbYJyeDxNFtDp6fo
	Uk3iRvPEXohRMt0jKvpn5nPTKrM/hCNvgA9d+YierW1zJshhJol/WD//MDyL6PR444/s392OjFOVa
	ydgK8zWpFvAPhMdhMfIi+Wfw/y0xiXt1GlWGuUkW4PhmKoLOSZBdVmjc1q1EptXngirCir/0aw7ok
	PGeG5irWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6s5a-0001xu-6K; Tue, 02 Feb 2021 09:35:14 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6s5V-0001vr-Ar; Tue, 02 Feb 2021 09:35:11 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1612258506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q54UyAniLH3WTtqS2/eEFFAOsABqgVttGqq1oJHHl3o=;
 b=pwRKjSfmAAUl4rpfKIVMY6cCCIH0A1qOnaV8W5VBLKM6omzrGDOVmq/p9akJdMt/mFgkO8
 V2tc8GFVYU80SWASGLlyhGF0EaS9YLNXv/f0XhQU0L4onN+4ztKCsUfGmCzaoW6V54AWau
 ShSpuMgXIb5koikt2IimucJXrn9ZlD0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9998AB171;
 Tue,  2 Feb 2021 09:35:06 +0000 (UTC)
Date: Tue, 2 Feb 2021 10:35:05 +0100
From: Michal Hocko <mhocko@suse.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <YBkcyQsky2scjEcP@dhcp22.suse.cz>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-8-rppt@kernel.org>
 <20210126114657.GL827@dhcp22.suse.cz>
 <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
 <20210126120823.GM827@dhcp22.suse.cz>
 <20210128092259.GB242749@kernel.org>
 <YBK1kqL7JA7NePBQ@dhcp22.suse.cz>
 <73738cda43236b5ac2714e228af362b67a712f5d.camel@linux.ibm.com>
 <YBPF8ETGBHUzxaZR@dhcp22.suse.cz>
 <6de6b9f9c2d28eecc494e7db6ffbedc262317e11.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6de6b9f9c2d28eecc494e7db6ffbedc262317e11.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_043509_651058_3BE6358F 
X-CRM114-Status: GOOD (  39.56  )
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

On Mon 01-02-21 08:56:19, James Bottomley wrote:
> On Fri, 2021-01-29 at 09:23 +0100, Michal Hocko wrote:
> > On Thu 28-01-21 13:05:02, James Bottomley wrote:
> > > Obviously the API choice could be revisited
> > > but do you have anything to add over the previous discussion, or is
> > > this just to get your access control?
> > 
> > Well, access control is certainly one thing which I still believe is
> > missing. But if there is a general agreement that the direct map
> > manipulation is not that critical then this will become much less of
> > a problem of course.
> 
> The secret memory is a scarce resource but it's not a facility that
> should only be available to some users.

How those two objectives go along? Or maybe our understanding of what
scrace really means here. If the pool of the secret memory is very limited
then you really need a way to stop one party from depriving others. More
on that below.

> > It all boils down whether secret memory is a scarce resource. With
> > the existing implementation it really is. It is effectivelly
> > repeating same design errors as hugetlb did. And look now, we have a
> > subtle and convoluted reservation code to track mmap requests and we
> > have a cgroup controller to, guess what, have at least some control
> > over distribution if the preallocated pool. See where am I coming
> > from?
> 
> I'm fairly sure rlimit is the correct way to control this.  The
> subtlety in both rlimit and memcg tracking comes from deciding to
> account under an existing category rather than having our own new one. 
> People don't like new stuff in accounting because it requires
> modifications to everything in userspace.  Accounting under and
> existing limit keeps userspace the same but leads to endless arguments
> about which limit it should be under.  It took us several patch set
> iterations to get to a fragile consensus on this which you're now
> disrupting for reasons you're not making clear.

I hoped I had made my points really clear. The existing scheme allows
one users (potentially adversary) to deplete the preallocated pool
and cause a shitstorm of OOM killer because there is no real way to
replenish the pool from the oom killer other than randomly keep killing
tasks until one happens to release its secret memory back to the
pool. Is that more clear now?

And no, rlimit and memcg limit will not save you from that because the
former is per process and later is hard to manage under a single limit
which might be order of magnitude larger than the secret memory pool
size. See the point?

I have also proposed potential ways out of this. Either the pool is not
fixed sized and you make it a regular unevictable memory (if direct map
fragmentation is not considered a major problem) or you need a careful
access control or you need SIGBUS on the mmap failure (to allow at least
some fallback mode to caller).

I do not see any other way around it. I might be missing some other
ways but so far I keep hearing that the existing scheme is just fine
because this has been discussed in the past and you have agreed it is
ok. Without any specifics...

Please keep in mind this is a user interface and it is due to careful
scrutiny. So rather than pushing back with "you are disrupting a
consensus" kinda feedback, please try to stay technical.

> > If the secret memory is more in line with mlock without any imposed
> > limit (other than available memory) in the end then, sure, using the
> > same access control as mlock sounds reasonable. Btw. if this is
> > really just a more restrictive mlock then is there any reason to not
> > hook this into the existing mlock infrastructure (e.g.
> > MCL_EXCLUSIVE)? Implications would be that direct map would be
> > handled on instantiation/tear down paths, migration would deal with
> > the same (if possible). Other than that it would be mlock like.
> 
> In the very first patch set we proposed a mmap flag to do this.  Under
> detailed probing it emerged that this suffers from several design
> problems: the KVM people want VMM to be able to remove the secret
> memory range from the process; there may be situations where sharing is
> useful and some people want to be able to seal the operations.  All of
> this ended up convincing everyone that a file descriptor based approach
> was better than a mmap one.

OK, fair enough. This belongs to the changelog IMHO. It is good to know
why existing interfaces do not match the need.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
