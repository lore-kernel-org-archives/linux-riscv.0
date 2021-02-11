Return-Path: <SRS0=PCma=HN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965EBC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 23:00:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBEB864E42
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 23:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBEB864E42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TUQWoSyIPI4F2N5I8zkRLh8ot9DY32I864PT5csZ5Y0=; b=xRVoB6YHV0MVYgbjUDgNq/T4R
	yiWuiX+cNxbTay2KUMVHBOqCsAd8gvnwnYWqHD9qh0xXWLi9F4hmbp+tuJymnKPyqPF2LuE5Glfjy
	U6nt2qFJBLsO15S1BocgFNkUp/GF2R9wmAl5O56Pc29fQRCsYOBSljKR1aZAdo4j4BMvfeq2DwkRd
	urmvWqOPNVXAyGmsrjte2e1o+/VFtgn6Y0oQVPt6IWhYkPHJBPz4GPU4mdJhKPNYwznGuxDUwe+bh
	XKrEYjTSxp32LUoIsCL385s5oFCm9j5jdzk7G76+bCii3dQtmwVGI68CRCXOPdkD0TK6QcqUuxeM2
	acKE1jF4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAKwF-0007QE-Am; Thu, 11 Feb 2021 22:59:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAKw9-0007NW-TX; Thu, 11 Feb 2021 22:59:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9786060201;
 Thu, 11 Feb 2021 22:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613084387;
 bh=nwfYRIB3XPlsF/osjlzU/dWbZib+rLZZQ1WRBOk4t7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JdTTKx4aSQ8hkEPYzAOR1T3elAMsY1CYPCHGk93b9t2QtZeB+UpZbCQ03b67p01io
 0CPfT25fR779DcxgF9uIUTbjBbmoENZYCKOgteFMgvosv7pjW8MGdn6LH4gBSFgHUj
 C+GlOtsFxDaZddY+gooLTQRqYN+gXU6P63ZLyimnf5sV79XHXrhf3OPikJO5K+WqVz
 aFti4o9fRlC17Dt/5lLws2NpSmnDTkBYt8SfmbE5H+3Z3VRlSLutY3g5cUNrQHCicG
 r70nCETUN3ChfKxxOHlvQhMKLRsiVdYThDq3/QJpacz+OX3DjQCWEhTrnn+5V3ktfc
 vVYfnIhIRPWBw==
Date: Fri, 12 Feb 2021 00:59:29 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210211225929.GK242749@kernel.org>
References: <20210208084920.2884-8-rppt@kernel.org>
 <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
 <20210208212605.GX242749@kernel.org>
 <YCJMDBss8Qhha7g9@dhcp22.suse.cz>
 <20210209090938.GP299309@linux.ibm.com>
 <YCKLVzBR62+NtvyF@dhcp22.suse.cz>
 <20210211071319.GF242749@kernel.org>
 <YCTtSrCEvuBug2ap@dhcp22.suse.cz>
 <20210211112008.GH242749@kernel.org>
 <YCUjck0I8qgjB24i@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCUjck0I8qgjB24i@dhcp22.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_175950_204577_FC11D739 
X-CRM114-Status: GOOD (  26.05  )
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

On Thu, Feb 11, 2021 at 01:30:42PM +0100, Michal Hocko wrote:
> On Thu 11-02-21 13:20:08, Mike Rapoport wrote:
> [...]
> > Sealing is anyway controlled via fcntl() and I don't think
> > MFD_ALLOW_SEALING makes much sense for the secretmem because it is there to
> > prevent rogue file sealing in tmpfs/hugetlbfs.
> 
> This doesn't really match my understanding. The primary usecase for the
> sealing is to safely and predictably coordinate over shared memory. I
> absolutely do not see why this would be incompatible with an additional
> requirement to unmap the memory from the kernel to prevent additional
> interference from the kernel side. Quite contrary it looks like a very
> nice extension to this model.

I didn't mean that secretmem should not support sealing. I meant that
MFD_ALLOW_SEALING flag does not make sense. Unlike tmpfs, the secretmem fd
does not need protection from somebody unexpectedly sealing it.

> > As for the huge pages, I'm not sure at all that supporting huge pages in
> > secretmem will involve hugetlbfs.
> 
> Have a look how hugetlb proliferates through our MM APIs. I strongly
> suspect this is strong signal that this won't be any different.
> 
> > And even if yes, adding SECRETMEM_HUGE
> > flag seems to me less confusing than saying "from kernel x.y you can use
> > MFD_CREATE | MFD_SECRET | MFD_HUGE" etc for all possible combinations.
> 
> I really fail to see your point. This is a standard model we have. It is
> quite natural that flags are added. Moreover adding a new syscall will
> not make it any less of a problem.

Nowadays adding a new syscall is not as costly as it used to be. And I
think it'll provide better extensibility when new features would be added
to secretmem. 

For instance, for creating a secretmem fd backed with sealing we'd have

	memfd_secretm(SECRETMEM_HUGE);

rather than

	memfd_create(MFD_ALLOW_SEALING | MFD_HUGETLB | MFD_SECRET);


Besides, if we overload memfd_secret we add complexity to flags validation
of allowable flag combinations even with the simplest initial
implementation.
And what it will become when more features are added to secretmem?
 
> > > I by no means do not insist one way or the other but from what I have
> > > seen so far I have a feeling that the interface hasn't been thought
> > > through enough.
> > 
> > It has been, but we have different thoughts about it ;-)
> 
> Then you must be carrying a lot of implicit knowledge which I want you
> to document.

I don't have any implicit knowledge, we just have a different perspective.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
