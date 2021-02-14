Return-Path: <SRS0=+hEn=HQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7989C433DB
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Feb 2021 09:20:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56F1D64E12
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Feb 2021 09:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56F1D64E12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z+FALVtwBoJe3itLAES4cyuvq2POjllJBIK6PQfQj6s=; b=LyOvUl+IgBk+dm8L9mBG0+CfV
	ggqBzzMmsX05f7sqEudyLnl8tW+i7mzz5tJwajW2q2sFpp/fE7WmmS7tqoypW4NZiLDUcsBkJJUPh
	WandjqS4SZvteaJLOilPUO3n64alWqhKjmkz6ccvXA4ae5GNflM+ORyKsGCxOsm5ob2/e8tGF9Azs
	5SJN/GxZ8DWTP5+ITwoIgjOVyLQ8vwUIbc4jBZfHltzH8iSZGU6sWtwCYGq1pSB8GkX5fMgktQ7Wm
	qeKot6OeS6E6pavO7V5Fp+vch0XojqHBf4Q77QyhBpaLvFUGcL3+ESXaHf6/HbnuFnubdOfUT/gUP
	FpSyfvOzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBDZk-00081o-BQ; Sun, 14 Feb 2021 09:20:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBDZe-0007zm-DS; Sun, 14 Feb 2021 09:20:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CB2B64D73;
 Sun, 14 Feb 2021 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613294412;
 bh=IojP/99cv2KZA0UAqkGIVvcnNQXpAQrGnDSYSmISYMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ggTE3epmRlYiZpCIulQqzfZIZLk/o9Hy+eMY/vtIj4RBJvlbLU6YBe6xW+nn3Nh9o
 MyYMRX8NGusIKQSvjXjeNrYN2FzXGXOOYKN32wbF5K9UR5i2fL54NWoZ4kzch8O1fz
 0j0N6t7YI6VhKfHIfT1MILdmaVlC+bJrUkGBAjCyOCyGfWtt4wmkaNl5ygGD55KRog
 FpJCiXGCmq9B5RiAfE9vA/ahNtHagvIeFYzLpSK837gPh4weRSFHUqNEb1+FAp4m0u
 60OF5nZHG/kKqrkEsLohg2nOPziZfAIwq4U8bxWTmen5x/8iLmJMxF5gj8klmC/iDZ
 Da8cagTHmtKmw==
Date: Sun, 14 Feb 2021 11:19:54 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210214091954.GM242749@kernel.org>
References: <YCJMDBss8Qhha7g9@dhcp22.suse.cz>
 <20210209090938.GP299309@linux.ibm.com>
 <YCKLVzBR62+NtvyF@dhcp22.suse.cz>
 <20210211071319.GF242749@kernel.org>
 <YCTtSrCEvuBug2ap@dhcp22.suse.cz>
 <0d66baec-1898-987b-7eaf-68a015c027ff@redhat.com>
 <20210211112702.GI242749@kernel.org>
 <05082284-bd85-579f-2b3e-9b1af663eb6f@redhat.com>
 <20210211230910.GL242749@kernel.org>
 <a903338e-3d56-ff0a-4f4f-0f23db7ec0da@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a903338e-3d56-ff0a-4f4f-0f23db7ec0da@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210214_042014_676424_860AD786 
X-CRM114-Status: GOOD (  19.15  )
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

On Fri, Feb 12, 2021 at 10:18:19AM +0100, David Hildenbrand wrote:
> On 12.02.21 00:09, Mike Rapoport wrote:
> > On Thu, Feb 11, 2021 at 01:07:10PM +0100, David Hildenbrand wrote:
> > > On 11.02.21 12:27, Mike Rapoport wrote:
> > > > On Thu, Feb 11, 2021 at 10:01:32AM +0100, David Hildenbrand wrote:
> > > 
> > > So let's talk about the main user-visible differences to other memfd files
> > > (especially, other purely virtual files like hugetlbfs). With secretmem:
> > > 
> > > - File content can only be read/written via memory mappings.
> > > - File content cannot be swapped out.
> > > 
> > > I think there are still valid ways to modify file content using syscalls:
> > > e.g., fallocate(PUNCH_HOLE). Things like truncate also seems to work just
> > > fine.
> > These work perfectly with any file, so maybe we should have added
> > memfd_create as a flag to open(2) back then and now the secretmem file
> > descriptors?
> 
> I think open() vs memfd_create() makes sense: for open, the path specifies
> main properties (tmpfs, hugetlbfs, filesystem). On memfd, there is no such
> path and the "type" has to be specified differently.
> 
> Also, open() might open existing files - memfd always creates new files.

Yes, but still open() returns a handle to a file and memfd_create() returns
a handle to a file. The differences may be well hidden by e.g. O_MEMORY and
than features unique to memfd files will have their set of O_SOMETHING
flags.

It's the same logic that says "we already have an interface that's close
enough and it's fine to add a bunch of new flags there".
 
And here we come to the question "what are the differences that justify a
new system call?" and the answer to this is very subjective. And as such we
can continue bikeshedding forever.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
