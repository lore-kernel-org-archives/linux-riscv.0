Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7704C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 07:14:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AE9C61353
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 07:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AE9C61353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a9jN3/3KNPwbIqttOTEzTLSIUHrNaYKD+5UZvhfmuk4=; b=X3gfAz8s5CCvmR0Y0ZOscuaJP
	8L812WMXR2y2TeGn8UmMJO4rJMsmvm0TAJOfXmrtRStZO3I2MQl8ncYuCowtsl5p9KaI8OscpdPQS
	ZbieYhKijy8aP+apyi35B2yj7IL5zhUcXsu/aUiQsHGxZ8z26z1BiVaftagLIcxupBJUzd7c2gkm+
	zH9tVbbBMdEj5cYMXdF1NYnbmy8agKSalTueDhmpGm7GoOBhjZne6tQGRgK63ZroR7SphjAmdmjyQ
	hnRAhP4VjeEUAQa7tj7zl4wxZkfjE0i6l+lDjChEkYcXkmkR3dJFFtGxBTBz3nmxEodcxcYBnYBrV
	tF795sNdg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljGOq-0037ad-UB; Wed, 19 May 2021 07:13:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljGOY-0037Y9-Cd; Wed, 19 May 2021 07:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=90HRlUqhfXRAdzaGT4GO7F546fOJLLHKeNHU18AOLWs=; b=1Mqqz4lnLkLydMfc0OaScxlaak
 wW6Rt8xPjQ94pDL1kOvDqNSRy7hFkCrLcvUX5Jiq0izoMbPqB5erraBMfMJUAtX//eRk7BGKgz/UA
 WQQUR7MZTvHUHx9ZqEDPzsdwfRR4afx4OPwxZp5uoxcb6y+JTxuoQPQHa9OHS5XPgG1nHOq5tsN6a
 a7GLgYEwtc2/Oib+cR9hDABjRAbKzTRvMEl6iVW/In+xLiIhEITv32/U4yBeTWXGqqCMUhF4ciUiu
 Q0qr/F6TErMn7jOZfgKJRJ4jHg1OZgbgUwSPfNgTg+kusAuVIR+Z8BdEXyjS0pw4DbCXl9nSK3pXn
 Sa/9LXNg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljGOV-00FD50-NA; Wed, 19 May 2021 07:13:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 306EE6135B;
 Wed, 19 May 2021 07:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621408407;
 bh=Ki50aQXwD1+I3Hw9xcIirZa4MRm+9KRJ+IEPHMwhBkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oYyy/RZh+KV4+OBVGMz4vRqytOJ3S6neHrNHLUg1kHLXII61rwPkBThjJAvrsmUZo
 FjnPqLIJ5kAx/qeZGbRsU6kB8hQ4Hhb8cAmXfxBQtvxU8dgEHEV4y4yEtokhAPiKIr
 /MuOkK56iFsIUVMsvkPHddFEnBeu4T4s7c6IPe+YOzaeJb9MlSBih46lnNG19GWJXN
 Dr+Kz+dEZLJXS9T0HxuiavOJs0HPv1T3S1Qsh+y5zhmE6RBkRzoRn73O2mfgQvXLJ6
 Y/WFNcW+0oFbapTux4HghodwAEaeJ7uRFxUxBZQ17d8823037Btr6+DWDVvpylUSU6
 pxMi/n2f2auLQ==
Date: Wed, 19 May 2021 10:13:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Cc: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Hagen Paul Pfeifer <hagen@jauu.net>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v19 5/8] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <YKS6herUjtCDz7ko@kernel.org>
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-6-rppt@kernel.org>
 <b625c5d7-bfcc-9e95-1f79-fc8b61498049@redhat.com>
 <YKDJ1L7XpJRQgSch@kernel.org> <YKOP5x8PPbqzcsdK@dhcp22.suse.cz>
 <8e114f09-60e4-2343-1c42-1beaf540c150@redhat.com>
 <YKOXbNWvUsqM4uxb@dhcp22.suse.cz>
 <00644dd8-edac-d3fd-a080-0a175fa9bf13@redhat.com>
 <YKOgK9eQSfgoz6eE@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YKOgK9eQSfgoz6eE@dhcp22.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_001327_803740_2DE7A5D3 
X-CRM114-Status: GOOD (  34.17  )
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

On Tue, May 18, 2021 at 01:08:27PM +0200, Michal Hocko wrote:
> On Tue 18-05-21 12:35:36, David Hildenbrand wrote:
> > On 18.05.21 12:31, Michal Hocko wrote:
> > >
> > > Although I have to say openly that I am not a great fan of VM_FAULT_OOM
> > > in general. It is usually a a wrong way to tell the handle the failure
> > > because it happens outside of the allocation context so you lose all the
> > > details (e.g. allocation constrains, numa policy etc.). Also whenever
> > > there is ENOMEM then the allocation itself has already made sure that
> > > all the reclaim attempts have been already depleted. Just consider an
> > > allocation with GFP_NOWAIT/NO_RETRY or similar to fail and propagate
> > > ENOMEM up the call stack. Turning that into the OOM killer sounds like a
> > > bad idea to me.  But that is a more general topic. I have tried to bring
> > > this up in the past but there was not much of an interest to fix it as
> > > it was not a pressing problem...
> > > 
> > 
> > I'm certainly interested; it would mean that we actually want to try
> > recovering from VM_FAULT_OOM in various cases, and as you state, we might
> > have to supply more information to make that work reliably.
> 
> Or maybe we want to get rid of VM_FAULT_OOM altogether... But this is
> really tangent to this discussion. The only relation is that this would
> be another place to check when somebody wants to go that direction.

If we are to get rid of VM_FAULT_OOM, vmf_error() would be updated and this
place will get the update automagically.

> > Having that said, I guess what we have here is just the same as when our
> > process fails to allocate a generic page table in __handle_mm_fault(), when
> > we fail p4d_alloc() and friends ...
> 
> From a quick look it is really similar in a sense that it effectively never
> happens and if it does then it certainly does the wrong thing. The point
> I was trying to make is that there is likely no need to go that way.

As David pointed out, failure to handle direct map in secretmem_fault() is
like any allocation failure in page fault handling and most of them result
in VM_FAULT_OOM, so I think that having vmf_error() in secretmem_fault() is
more consistent with the rest of the code than using VM_FAULT_SIGBUS.

Besides if the direct map manipulation failures would result in errors
other than -ENOMEM, having vmf_error() may prove useful.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
