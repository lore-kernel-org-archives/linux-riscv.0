Return-Path: <SRS0=PCma=HN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58921C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 07:14:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F317064E74
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 07:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F317064E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BXWGN+7nJ2x4OeWDG1bZg3VJsrpY82850luITM2KBKc=; b=B50nNht68aW2hMyBta3ScbjsD
	yud5FipnEwey7obG7BwVfl3T0zOfs2QoWzlMvPdkF+ywLerfJkVz6dUcMZs0YopXS+g4ZiOlLdws8
	MOwNRWHigV5msr6vHjlRW0LS/EyNBU+jeTQ5GXs5zOxL3qAYgm3A38JXZ/r/WEC9rdNlZntB+gO76
	Xky06kPcJTS8X3oz27C1dHcvGQJ2Lnv3IqGXKp95BnzsGSQISHunxY07EUIY+mSeU4k+byczLiUwP
	J31gvs2N+RATVukNWAyECkrL14Vid+NW+ji1p4MewY+YZ/Xx3rX+R9uJD2bsH8bFZphYNlaSJ5Sef
	/ooULiq8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA6Ab-0003Rp-4u; Thu, 11 Feb 2021 07:13:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA6AX-0003QL-Pw; Thu, 11 Feb 2021 07:13:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9ABFC64E70;
 Thu, 11 Feb 2021 07:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613027617;
 bh=mFb5e+mcFjieGwWXbuKlq9q0UpNNbyeAq1/dwdNreuY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r612v7W+RCFxSqtS+kG65T2iZaVwzZel4btR0FeMO2RkiMdOJ50IMLVhWxhHEVjeq
 RWIWvUmaSjvpNuRiWAmSDAzQxhntPIcqMrjyseEOwkEKs8om6hanjiK/XvklN5gvM6
 4IRSCxhZL6+efdSsP/rZVDzTJVVy90foUNPuGiwSGjLg9nOaHA3e8aP5tOIg2ASxIJ
 Sp6nUBHKEK6j6j934tjzENjbujdOFEbYvxhqtUewKvYJI0DUbn0exEQp0qLWLIqa56
 Txi+Gq3TeUWe+Arxca2HZee6BKF625xZfgl8d82Twk0iYyM/fBr2k70XriEGyOWcL0
 DaEcHGkrjBISA==
Date: Thu, 11 Feb 2021 09:13:19 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210211071319.GF242749@kernel.org>
References: <20210208084920.2884-1-rppt@kernel.org>
 <20210208084920.2884-8-rppt@kernel.org>
 <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
 <20210208212605.GX242749@kernel.org>
 <YCJMDBss8Qhha7g9@dhcp22.suse.cz>
 <20210209090938.GP299309@linux.ibm.com>
 <YCKLVzBR62+NtvyF@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCKLVzBR62+NtvyF@dhcp22.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_021342_008360_FE3B409C 
X-CRM114-Status: GOOD (  25.04  )
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

On Tue, Feb 09, 2021 at 02:17:11PM +0100, Michal Hocko wrote:
> On Tue 09-02-21 11:09:38, Mike Rapoport wrote:
> > On Tue, Feb 09, 2021 at 09:47:08AM +0100, Michal Hocko wrote:
> > > 
> > > OK, so IIUC this means that the model is to hand over memory from host
> > > to guest. I thought the guest would be under control of its address
> > > space and therefore it operates on the VMAs. This would benefit from
> > > an additional and more specific clarification.
> > 
> > How guest would operate on VMAs if the interface between host and guest is
> > virtual hardware?
> 
> I have to say that I am not really familiar with this area so my view
> might be misleading or completely wrong. I thought that the HW address
> ranges are mapped to the guest process and therefore have a VMA.

There is a qemu process that currently has mappings of what guest sees as
its physical memory, but qemu is a part of hypervisor, i.e. host.
 
> > Citing my older email:
> > 
> >     I've hesitated whether to continue to use new flags to memfd_create() or to
> >     add a new system call and I've decided to use a new system call after I've
> >     started to look into man pages update. There would have been two completely
> >     independent descriptions and I think it would have been very confusing.
> 
> Could you elaborate? Unmapping from the kernel address space can work
> both for sealed or hugetlb memfds, no? Those features are completely
> orthogonal AFAICS. With a dedicated syscall you will need to introduce
> this functionality on top if that is required. Have you considered that?
> I mean hugetlb pages are used to back guest memory very often. Is this
> something that will be a secret memory usecase?
> 
> Please be really specific when giving arguments to back a new syscall
> decision.

Isn't "syscalls have completely independent description" specific enough?

We are talking about API here, not the implementation details whether
secretmem supports large pages or not.

The purpose of memfd_create() is to create a file-like access to memory.
The purpose of memfd_secret() is to create a way to access memory hidden
from the kernel.

I don't think overloading memfd_create() with the secretmem flags because
they happen to return a file descriptor will be better for users, but
rather will be more confusing.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
